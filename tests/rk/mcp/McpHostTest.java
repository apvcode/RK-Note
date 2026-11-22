package rk.mcp;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;
import org.json.JSONArray;
import org.json.JSONObject;
import rk.schedule.ScheduleBridge;
import rk.schedule.ScheduleResolver;
import rk.schedule.ScheduleStore;

/**
 * Starts the real MCP server on the host and talks to it over real HTTP. The diary is fed through the same bridge calls the
 * app makes, with models that have the documented shape. Never packaged into the APK.
 */
public final class McpHostTest {
    static int checks;
    static void check(boolean ok, String what) { checks++; if (!ok) throw new AssertionError(what); System.out.println("ok   " + what); }

    // The diary side: the same stand-ins the Android regression uses.
    public static final class Identity { public final String login; Identity(String l) { login = l; } public String a() { return "test-school"; } public String b() { return login; } }
    public static final class Session { public Identity identity = new Identity("pupil"); public Object a() { return this; } public Identity c() { return identity; } }
    public static final class Student { public String a = "Иван Петров"; }
    public static final class Repository { public Student b = new Student(); }
    public static final class State { public void U(int i, List<?> v) {} }
    public static final class Presenter { public Repository e = new Repository(); public State state = new State(); public State getViewState() { return state; } }

    static final class Prefs implements SharedPreferences {
        final Map<String, Object> m = new HashMap<>();
        public Map<String, ?> getAll() { return new HashMap<>(m); }
        public String getString(String k, String d) { Object v = m.get(k); return v instanceof String ? (String) v : d; }
        public boolean getBoolean(String k, boolean d) { Object v = m.get(k); return v instanceof Boolean ? (Boolean) v : d; }
        public int getInt(String k, int d) { Object v = m.get(k); return v instanceof Integer ? (Integer) v : d; }
        public long getLong(String k, long d) { Object v = m.get(k); return v instanceof Long ? (Long) v : d; }
        public boolean contains(String k) { return m.containsKey(k); }
        public Editor edit() {
            return new Editor() {
                final Map<String, Object> pending = new HashMap<>(); boolean clear;
                public Editor putString(String k, String v) { pending.put(k, v); return this; }
                public Editor putBoolean(String k, boolean v) { pending.put(k, v); return this; }
                public Editor putInt(String k, int v) { pending.put(k, v); return this; }
                public Editor putLong(String k, long v) { pending.put(k, v); return this; }
                public Editor clear() { clear = true; return this; }
                public Editor remove(String k) { pending.put(k, null); return this; }
                public boolean commit() { if (clear) m.clear(); for (Map.Entry<String, Object> e : pending.entrySet()) { if (e.getValue() == null) m.remove(e.getKey()); else m.put(e.getKey(), e.getValue()); } return true; }
                public void apply() { commit(); }
            };
        }
    }

    static final Map<String, Prefs> files = new HashMap<>();
    static final Context ctx = new Context() {
        public SharedPreferences getSharedPreferences(String name, int mode) { Prefs p = files.get(name); if (p == null) files.put(name, p = new Prefs()); return p; }
    };

    static String token;

    static int status;
    static String body;

    /** One HTTP/1.1 request over a plain socket (what the phone's client does too). */
    static void http(String method, String auth, String origin, String json) throws Exception {
        byte[] payload = json == null ? new byte[0] : json.getBytes("UTF-8");
        StringBuilder head = new StringBuilder(method + " /mcp HTTP/1.1\r\nHost: 127.0.0.1:" + McpSettings.PORT + "\r\nAccept: application/json\r\nConnection: close\r\n");
        if (auth != null) head.append("Authorization: ").append(auth).append("\r\n");
        if (origin != null) head.append("Origin: ").append(origin).append("\r\n");
        if (json != null) head.append("Content-Type: application/json\r\n");
        head.append("Content-Length: ").append(payload.length).append("\r\n\r\n");
        try (java.net.Socket sock = new java.net.Socket()) {
            sock.connect(new java.net.InetSocketAddress("127.0.0.1", McpSettings.PORT), 4000);
            sock.setSoTimeout(8000);
            OutputStream o = sock.getOutputStream();
            o.write(head.toString().getBytes("UTF-8")); o.write(payload); o.flush();
            ByteArrayOutputStream all = new ByteArrayOutputStream();
            InputStream in = sock.getInputStream();
            byte[] b = new byte[4096];
            for (int n; (n = in.read(b)) > 0; ) all.write(b, 0, n);
            String raw = new String(all.toByteArray(), "UTF-8");
            status = Integer.parseInt(raw.substring(9, 12));
            int split = raw.indexOf("\r\n\r\n");
            body = split < 0 ? "" : raw.substring(split + 4);
        }
    }

    static int ids = 1;

    static JSONObject rpc(String method, JSONObject params) throws Exception {
        JSONObject req = new JSONObject().put("jsonrpc", "2.0").put("id", ids++).put("method", method).put("params", params);
        http("POST", "Bearer " + token, null, req.toString());
        check(status == 200, method + " answers 200");
        return new JSONObject(body);
    }

    static JSONObject tool(String name, JSONObject args) throws Exception {
        JSONObject r = rpc("tools/call", new JSONObject().put("name", name).put("arguments", args)).getJSONObject("result");
        String text = r.getJSONArray("content").getJSONObject(0).getString("text");
        return new JSONObject().put("error", r.getBoolean("isError")).put("text", text);
    }

    static JSONObject ok(String name, JSONObject args) throws Exception {
        JSONObject t = tool(name, args);
        check(!t.getBoolean("error"), name + " succeeds" + (t.getBoolean("error") ? ": " + t.getString("text") : ""));
        return new JSONObject(t.getString("text"));
    }

    public static void main(String[] args) throws Exception {
        System.setProperty("sun.net.http.allowRestrictedHeaders", "true");
        long day = ScheduleResolver.date(ScheduleResolver.key(System.currentTimeMillis()));
        String today = ScheduleResolver.key(day);

        // A bell profile the person made for today's weekday: lesson 1 09:00-09:45.
        ScheduleStore store = new ScheduleStore();
        ScheduleStore.Profile profile = new ScheduleStore.Profile("p1", "Короткие");
        profile.slots[0][0] = 540; profile.slots[0][1] = 585;
        store.profiles.put("p1", profile);
        store.weekdays.put(ScheduleResolver.weekday(day), "p1");
        store.save(ctx);

        // The diary: two lessons with homework, a topic and a mark.
        Session session = new Session(); ScheduleBridge.sessionObserved(session);
        Presenter p = new Presenter();
        ScheduleBridge.beginRequest(p); Object callback = new Object(); ScheduleBridge.requestCallback(callback, p); ScheduleBridge.endRequest();
        List<la.h> lessons = Arrays.asList(
            new la.h(Arrays.asList(new la.g("§12, упр. 5", Collections.emptyList())), Arrays.asList(new ma.b("5", "Отлично", new Date(day), "2", 2.0, "Контрольная", 5, "", 0)),
                "Алгебра", "1", new Date(ScheduleResolver.instant(day, 500)), new Date(ScheduleResolver.instant(day, 545)), "Дроби", 500, null),
            new la.h(Collections.emptyList(), Collections.emptyList(),
                "История", "2", new Date(ScheduleResolver.instant(day, 600)), new Date(ScheduleResolver.instant(day, 645)), "", 600, null));
        check(ScheduleBridge.enterCallback(callback), "diary callback accepted");
        ScheduleBridge.capture(p, Collections.singletonList(new la.f(day, lessons)));

        // What the app saved: lessons as Gson writes them (dates as the phone's US date-time text, or as numbers).
        check("2026-11-22".equals(DiaryDb.dayKey("20261122")) && "2026-11-22".equals(DiaryDb.dayKey("2026-11-22T00:00:00")) && "2026-11-22".equals(DiaryDb.dayKey("22.11.2026")), "saved day keys in three shapes");
        check(DiaryDb.dayKey("not a day") == null, "an unknown day key is skipped");
        long t1 = DiaryDb.parseDate("Nov 22, 2026 9:00:00 AM"), t2 = DiaryDb.parseDate("Nov 22, 2026, 9:00:00\u202fAM"), t3 = DiaryDb.parseDate(Long.valueOf(t1)), t4 = DiaryDb.parseDate("2026-11-22T09:00:00");
        check(t1 > 0 && t1 == t2 && t1 == t3 && t1 == t4, "dates: US text, narrow no-break space, milliseconds and ISO agree");
        List<DiaryDb.Lesson> saved = DiaryDb.parseLessons("[{\"name\":\"Физика\",\"num\":\"3\",\"startTime\":\"Nov 22, 2026 10:00:00 AM\",\"endTime\":\"Nov 22, 2026 10:45:00 AM\",\"topic\":\"Сила\",\"homework\":[{\"value\":\"стр. 40\",\"filesAndResources\":[]}],\"marks\":[{\"value\":\"4\",\"comment\":\"ответ\",\"date\":\"Nov 22, 2026 12:00:00 AM\",\"weight\":\"1\",\"title\":\"Устный\"}]},{\"name\":\"Пустой\"},5]");
        check(saved.size() == 2 && saved.get(0).title.equals("Физика") && saved.get(0).start == 600 && saved.get(0).end == 645, "saved lesson: subject and times");
        check(saved.get(0).homework.get(0).equals("стр. 40") && saved.get(0).marks.get(0).value.equals("4") && saved.get(0).marks.get(0).kind.equals("Устный"), "saved lesson: homework and mark");
        check(saved.get(1).number.isEmpty() && saved.get(1).start == -1, "saved lesson with only a name is still read");
        check(DiaryDb.parseLessons("not json").isEmpty() && DiaryDb.parseLessons(null).isEmpty(), "broken saved data gives no lessons, not an error");
        check(DiaryDb.plain("<p>Привет&nbsp;<b>всем</b></p><br/>Завтра &amp; послезавтра").equals("Привет всем\nЗавтра & послезавтра"), "message text: markup and entities");

        // Off until switched on.
        McpHttpServer.start(ctx);
        check(McpHttpServer.running(), "server listens");
        token = McpSettings.token(ctx);
        check(token.startsWith("rk_") && token.length() >= 40, "token is long and random-looking");
        check(!token.equals(McpSettings.regenerate(ctx)), "a new token differs");
        token = McpSettings.token(ctx);
        if (args.length > 0 && args[0].equals("serve")) { ctx.getSharedPreferences(McpSettings.PREFS, 0).edit().putBoolean("enabled", true).commit(); }
        if (args.length > 0 && args[0].equals("serve")) {
            // For a client written in another language (a quick way to try the server by hand): print the token and wait.
            System.out.println("TOKEN " + token);
            System.out.println("READY");
            Thread.sleep(Long.parseLong(args.length > 1 ? args[1] : "120000"));
            System.exit(0);
        }

        http("POST", "Bearer " + token, null, "{}");
        check(status == 503, "switched off: 503");

        ctx.getSharedPreferences(McpSettings.PREFS, 0).edit().putBoolean("enabled", true).commit();

        // Access control.
        http("POST", null, null, "{}"); check(status == 401, "no token: 401");
        http("POST", "Bearer wrong", null, "{}"); check(status == 401, "wrong token: 401");
        http("POST", "Bearer " + token, "https://evil.example", "{}"); check(status == 403, "request from a web page: 403");
        http("GET", "Bearer " + token, null, null); check(status == 405, "GET: 405");

        // Protocol.
        JSONObject init = rpc("initialize", new JSONObject().put("protocolVersion", "2025-06-18").put("capabilities", new JSONObject())).getJSONObject("result");
        check(init.getString("protocolVersion").equals("2025-06-18") && init.getJSONObject("serverInfo").getString("title").equals("RK Note"), "initialize");
        http("POST", "Bearer " + token, null, "{\"jsonrpc\":\"2.0\",\"method\":\"notifications/initialized\"}");
        check(status == 202, "notification: 202");
        JSONArray tools = rpc("tools/list", new JSONObject()).getJSONObject("result").getJSONArray("tools");
        check(tools.length() == 12, "twelve tools");
        int writers = 0;
        for (int i = 0; i < tools.length(); i++) if (!tools.getJSONObject(i).getJSONObject("annotations").getBoolean("readOnlyHint")) writers++;
        check(writers == 1, "only the note writer is not read-only");

        // Tools.
        JSONObject s = ok("rk_status", new JSONObject());
        check(s.getString("student").equals("Иван Петров") && s.getInt("diary_days_known") == 1, "status: student and loaded days");
        JSONObject sch = ok("rk_schedule", new JSONObject());
        JSONObject d0 = sch.getJSONArray("days").getJSONObject(0);
        JSONArray ls = d0.getJSONArray("lessons");
        check(d0.getString("date").equals(today) && ls.length() == 2, "schedule: two lessons today");
        JSONObject l1 = ls.getJSONObject(0);
        check(l1.getString("subject").equals("Алгебра") && l1.getString("start").equals("09:00") && l1.getString("end").equals("09:45"), "schedule: the person's own bell times (09:00-09:45)");
        check(ls.getJSONObject(1).getString("start").equals("10:00"), "schedule: a lesson without a custom bell keeps the diary time");
        check(l1.getString("topic").equals("Дроби") && l1.getJSONArray("homework").getString(0).equals("§12, упр. 5"), "schedule: topic and homework");
        check(l1.getJSONArray("marks").getJSONObject(0).getString("value").equals("5") && l1.getJSONArray("marks").getJSONObject(0).getString("comment").equals("Отлично"), "schedule: mark with the comment");
        JSONObject tomorrow = ok("rk_schedule", new JSONObject().put("date", "tomorrow")).getJSONArray("days").getJSONObject(0);
        check(!tomorrow.getBoolean("diary_loaded") && tomorrow.getString("note").contains("нет ни на экране"), "a day that is not loaded says so");
        JSONObject hw = ok("rk_homework", new JSONObject().put("days", 3));
        check(hw.getJSONArray("items").length() == 1 && hw.getJSONArray("items").getJSONObject(0).getString("subject").equals("Алгебра"), "homework lists only lessons that have it");
        JSONObject mk = ok("rk_marks", new JSONObject().put("subject", "алг"));
        check(mk.getJSONArray("marks").length() == 1 && mk.getJSONArray("marks").getJSONObject(0).getString("subject").equals("Алгебра"), "marks filtered by subject");
        check(ok("rk_marks", new JSONObject().put("subject", "физ")).getJSONArray("marks").length() == 0, "marks: no match is empty");
        JSONObject bells = ok("rk_bell_profiles", new JSONObject());
        check(bells.getJSONArray("profiles").getJSONObject(0).getString("name").equals("Короткие") && bells.getJSONObject("by_weekday").length() == 1, "bell profiles");
        JSONObject now = ok("rk_now", new JSONObject());
        check(now.has("state") && now.has("time"), "now: has a state (" + now.getString("state") + ")");

        // The app's database is not there on the host: those tools say so instead of failing.
        check(tool("rk_grades", new JSONObject()).getBoolean("error"), "grades without saved data: a clear error");
        check(ok("rk_announcements", new JSONObject()).getJSONArray("announcements").length() == 0, "announcements without saved data: an empty list");
        check(ok("rk_messages", new JSONObject().put("limit", 5)).getJSONArray("messages").length() == 0, "messages without saved data: an empty list");

        // Notes: write, read back, delete.
        JSONObject set = ok("rk_note_set", new JSONObject().put("date", today).put("lesson", "2").put("text", "Выучить даты"));
        check(set.getBoolean("saved") && set.getString("subject").equals("История"), "note saved for lesson 2");
        JSONArray notes = ok("rk_notes", new JSONObject()).getJSONArray("notes");
        check(notes.length() == 1 && notes.getJSONObject(0).getString("text").equals("Выучить даты"), "notes: read back");
        check(ok("rk_schedule", new JSONObject()).getJSONArray("days").getJSONObject(0).getJSONArray("lessons").getJSONObject(1).getString("my_note").equals("Выучить даты"), "schedule shows the note");
        check(tool("rk_note_set", new JSONObject().put("date", today).put("lesson", "9").put("text", "x")).getBoolean("error"), "note for a lesson that does not exist is refused");
        check(tool("rk_note_set", new JSONObject().put("date", "2000-01-01").put("lesson", "1").put("text", "x")).getBoolean("error"), "note for a day that is not loaded is refused");
        ok("rk_note_set", new JSONObject().put("date", today).put("subject", "истор").put("text", ""));
        check(ok("rk_notes", new JSONObject()).getJSONArray("notes").length() == 0, "empty text deletes the note");
        check(tool("rk_schedule", new JSONObject().put("date", "not-a-date")).getBoolean("error"), "a bad date is reported, not thrown");
        check(rpc("nope", new JSONObject()).has("error"), "unknown method: JSON-RPC error");

        // A student change drops the cache and the tools say so.
        p.e.b.a = "Другой"; ScheduleBridge.studentChanged("Другой");
        check(ok("rk_status", new JSONObject()).getInt("diary_days_known") == 0, "another student: no old diary data is visible");

        McpHttpServer.stop();
        check(!McpHttpServer.running(), "server stops");
        System.out.println("MCP host test passed: " + checks + " checks");
        System.exit(0);
    }
}
