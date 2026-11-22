package rk.mcp;

import android.content.Context;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONObject;
import rk.diary.PersonalHomeworkStore;
import rk.schedule.ScheduleBridge;
import rk.schedule.ScheduleResolver;
import rk.schedule.ScheduleStore;

/**
 * What the assistant can do with RK Note. Reading tools are marked read-only; the one that writes (a personal homework
 * note) is not, so the assistant asks the person first. The diary comes from two places: what the app holds on screen
 * right now (the newest) and what it saved on the phone earlier (see {@link DiaryDb}); the first wins for a day.
 */
final class McpTools {
    private static final String[] WEEKDAYS = {"", "воскресенье", "понедельник", "вторник", "среда", "четверг", "пятница", "суббота"};

    private McpTools() {}

    // ───────────────────────── definitions ─────────────────────────

    static JSONArray list() throws Exception {
        JSONArray a = new JSONArray();
        a.put(def("rk_status", "Who is the student, today's date, which diary days the app knows (saved on the phone and open now) and the range of them. Call it first when unsure what data exists.", true, new JSONObject()));
        a.put(def("rk_now", "Right now: the current lesson or break, the minutes left and the next lesson, with the bell times the person set in the app.", true, new JSONObject()));
        a.put(def("rk_schedule", "Lessons of one or several days: number, subject, start and end (with the person's own bell schedule), the topic, the homework the school gave, marks and the person's own note.", true,
            new JSONObject().put("date", str("A day as YYYY-MM-DD, or today / tomorrow / yesterday. Default today."))
                .put("days", integer("How many days from that one, 1 to 14. Default 1."))));
        a.put(def("rk_homework", "Homework the school gave (as written in the diary) for the next days, by lesson, with the person's own notes next to it.", true,
            new JSONObject().put("from", str("First day, YYYY-MM-DD or today / tomorrow. Default today."))
                .put("days", integer("How many days, 1 to 31. Default 7."))));
        a.put(def("rk_marks", "Marks given in lessons of the known diary days: subject, date, value, weight, the teacher's comment. Newest first.", true,
            new JSONObject().put("days", integer("How many days back from today, 1 to 120. Default 30."))
                .put("subject", str("Only subjects whose name contains this text."))));
        a.put(def("rk_grades", "The marks tab of the app: for each subject the average and the marks of the periods, with the school periods and their dates.", true,
            new JSONObject().put("subject", str("Only subjects whose name contains this text."))));
        a.put(def("rk_final_grades", "Final grades (quarters, terms, year) as the app saved them.", true, new JSONObject()));
        a.put(def("rk_announcements", "Announcements of the school, newest first.", true,
            new JSONObject().put("limit", integer("How many, 1 to 30. Default 10."))));
        a.put(def("rk_messages", "Messages in the school diary (teachers and the school), newest first.", true,
            new JSONObject().put("folder", str("The folder as the app names it (for example inbox), empty for all."))
                .put("limit", integer("How many, 1 to 30. Default 10."))));
        a.put(def("rk_bell_profiles", "The person's bell schedules: profiles with start and end of each lesson, which weekdays and dates use which profile, the homeroom period.", true, new JSONObject()));
        a.put(def("rk_notes", "The person's own homework notes (the ones written in RK Note, not by the school).", true,
            new JSONObject().put("from", str("Only notes from this day on, YYYY-MM-DD."))
                .put("to", str("Only notes up to this day, YYYY-MM-DD."))));
        a.put(def("rk_note_set", "Writes the person's own homework note for one lesson (replaces the old text; an empty text deletes the note).", false,
            new JSONObject().put("date", str("The day, YYYY-MM-DD."))
                .put("lesson", str("The lesson number as in the diary."))
                .put("subject", str("The subject, if the number is not enough."))
                .put("text", str("The note. Empty to delete.")), "date", "text"));
        return a;
    }

    private static JSONObject def(String name, String description, boolean readOnly, JSONObject props, String... required) throws Exception {
        JSONObject schema = new JSONObject().put("type", "object").put("properties", props);
        if (required.length > 0) schema.put("required", new JSONArray(java.util.Arrays.asList(required)));
        return new JSONObject().put("name", name).put("description", description).put("inputSchema", schema)
            .put("annotations", new JSONObject().put("readOnlyHint", readOnly).put("openWorldHint", false));
    }

    private static JSONObject str(String d) throws Exception { return new JSONObject().put("type", "string").put("description", d); }

    private static JSONObject integer(String d) throws Exception { return new JSONObject().put("type", "integer").put("description", d); }

    // ───────────────────────── calls ─────────────────────────

    /** The result of a tool call, in the shape MCP wants: text content and an error flag. */
    static JSONObject call(Context c, String name, JSONObject args) throws Exception {
        try {
            JSONObject out;
            switch (name) {
                case "rk_status": out = status(c); break;
                case "rk_now": out = now(c); break;
                case "rk_schedule": out = schedule(c, args); break;
                case "rk_homework": out = homework(c, args); break;
                case "rk_marks": out = marks(c, args); break;
                case "rk_grades": out = grades(c, args); break;
                case "rk_final_grades": out = finalGrades(c); break;
                case "rk_announcements": out = announcements(args, c); break;
                case "rk_messages": out = messages(args, c); break;
                case "rk_bell_profiles": out = bells(c); break;
                case "rk_notes": out = notes(c, args); break;
                case "rk_note_set": out = noteSet(c, args); break;
                default: return result("Unknown tool: " + name, true);
            }
            return result(out.toString(1), false);
        } catch (Problem e) {
            return result(e.getMessage(), true);
        } catch (IllegalArgumentException | IllegalStateException e) {
            // The app's own checks speak plainly (in Russian); pass what they say.
            return result(e.getMessage() == null ? e.toString() : e.getMessage(), true);
        }
    }

    private static JSONObject result(String text, boolean error) throws Exception {
        return new JSONObject().put("content", new JSONArray().put(new JSONObject().put("type", "text").put("text", text))).put("isError", error);
    }

    /** A problem the assistant should be told about in words. */
    private static final class Problem extends Exception { Problem(String m) { super(m); } }

    private static final String NOT_KNOWN = "Этого дня нет ни на экране, ни в сохранённом на телефоне: откройте дневник в RK Note на нужной неделе, и он появится.";

    // ───────────────────────── where the diary comes from ─────────────────────────

    /** The student whose saved data is read: the one open in the diary, else the first the app knows. */
    private static DiaryDb.Student student(Context c) {
        List<DiaryDb.Student> all = DiaryDb.students(c);
        if (all.isEmpty()) return null;
        String selected = ScheduleBridge.selectedStudent();
        if (!selected.isEmpty()) for (DiaryDb.Student s : all) if (selected.equals(s.id) || selected.equals(s.name)) return s;
        return all.get(0);
    }

    private static List<ScheduleResolver.Event> eventsOf(DiaryDb.Day d) {
        List<ScheduleResolver.Event> out = new ArrayList<>();
        for (DiaryDb.Lesson l : d.lessons) out.add(new ScheduleResolver.Event(l.number, l.title, l.start, l.end, false, l, "Из дневника"));
        return out;
    }

    /** The diary of one day: what is open in the app now, else what was saved on the phone; null when neither has it. */
    private static List<ScheduleResolver.Event> baseline(Context c, long day) {
        List<ScheduleResolver.Event> live = ScheduleBridge.diary(day);
        if (live != null) return live;
        DiaryDb.Student s = student(c);
        if (s == null) return null;
        DiaryDb.Day d = DiaryDb.days(c, s.id).get(ScheduleResolver.key(day));
        return d == null ? null : eventsOf(d);
    }

    /** Every known diary day (saved ones first, the open ones over them), by date. */
    private static TreeMap<String, List<ScheduleResolver.Event>> knownDays(Context c) {
        TreeMap<String, List<ScheduleResolver.Event>> out = new TreeMap<>();
        DiaryDb.Student s = student(c);
        if (s != null) for (Map.Entry<String, DiaryDb.Day> e : DiaryDb.days(c, s.id).entrySet()) out.put(e.getKey(), eventsOf(e.getValue()));
        out.putAll(ScheduleBridge.loadedDays());
        return out;
    }

    private static String studentName(Context c) {
        DiaryDb.Student s = student(c);
        if (s != null && !s.name.isEmpty()) return s.name;
        String label = ScheduleBridge.ownerLabel();
        int end = label.indexOf('\n');
        String first = end < 0 ? label : label.substring(0, end);
        return first.startsWith("Ученик: ") ? first.substring(8) : first;
    }

    // ───────────────────────── tools ─────────────────────────

    private static JSONObject status(Context c) throws Exception {
        long today = today();
        TreeMap<String, List<ScheduleResolver.Event>> known = knownDays(c);
        JSONObject o = new JSONObject();
        o.put("today", ScheduleResolver.key(today)).put("weekday", WEEKDAYS[ScheduleResolver.weekday(today)]);
        o.put("student", studentName(c));
        List<DiaryDb.Student> all = DiaryDb.students(c);
        if (all.size() > 1) {
            JSONArray names = new JSONArray();
            for (DiaryDb.Student s : all) names.put(s.name);
            o.put("students_in_the_app", names).put("note_about_students", "Данные берутся по ученику, выбранному в дневнике RK Note.");
        }
        o.put("diary_days_known", known.size()).put("diary_days_open_now", ScheduleBridge.loadedDays().size());
        if (!known.isEmpty()) o.put("diary_from", known.firstKey()).put("diary_to", known.lastKey());
        else o.put("hint", "Дневник в приложении пока пуст: " + NOT_KNOWN);
        o.put("bell_profiles", ScheduleBridge.store(c).profiles.size());
        return o;
    }

    private static JSONObject now(Context c) throws Exception {
        long now = System.currentTimeMillis();
        long day = today();
        int minute = ScheduleResolver.minute(new Date(now));
        JSONObject o = new JSONObject().put("date", ScheduleResolver.key(day)).put("weekday", WEEKDAYS[ScheduleResolver.weekday(day)]).put("time", ScheduleResolver.clock(minute));
        List<ScheduleResolver.Event> events = resolved(c, day);
        if (baseline(c, day) == null) o.put("note", NOT_KNOWN + " Сейчас видны только звонки профиля, если они заданы.");
        ScheduleResolver.Event current = null, next = null;
        for (ScheduleResolver.Event e : events) {
            if (e.start <= minute && minute < e.end) current = e;
            else if (e.start > minute && next == null) next = e;
        }
        if (events.isEmpty()) o.put("state", "no_lessons");
        else if (current != null) {
            o.put("state", "lesson").put("current", brief(current)).put("minutes_left", current.end - minute);
        } else if (next != null) {
            boolean before = next == events.get(0);
            o.put("state", before ? "before_school" : "break").put("minutes_until_next", next.start - minute);
        } else o.put("state", "after_school");
        if (next != null) o.put("next", brief(next));
        return o;
    }

    private static JSONObject schedule(Context c, JSONObject args) throws Exception {
        long from = parseDay(args.optString("date"), today());
        int days = clamp(args.optInt("days", 1), 1, 14);
        JSONArray out = new JSONArray();
        PersonalHomeworkStore notes = new PersonalHomeworkStore(c);
        for (int i = 0; i < days; i++) out.put(dayJson(c, notes, plus(from, i)));
        return new JSONObject().put("student", studentName(c)).put("days", out);
    }

    private static JSONObject dayJson(Context c, PersonalHomeworkStore notes, long day) throws Exception {
        JSONObject o = new JSONObject().put("date", ScheduleResolver.key(day)).put("weekday", WEEKDAYS[ScheduleResolver.weekday(day)]);
        ScheduleStore store = ScheduleBridge.store(c);
        o.put("bell_schedule", store.source(day));
        List<ScheduleResolver.Event> base = baseline(c, day);
        if (base == null) {
            o.put("diary_loaded", false).put("note", NOT_KNOWN);
            return o;
        }
        o.put("diary_loaded", true);
        JSONArray lessons = new JSONArray();
        List<ScheduleResolver.Event> events;
        try { events = ScheduleBridge.resolve(store, day, base, true); }
        catch (IllegalArgumentException e) { o.put("bell_problem", e.getMessage()); events = base; }
        for (ScheduleResolver.Event e : events) lessons.put(lesson(notes, e, day));
        o.put("lessons", lessons);
        if (lessons.length() == 0) o.put("note", "Уроков нет.");
        return o;
    }

    private static JSONObject brief(ScheduleResolver.Event e) throws Exception {
        return new JSONObject().put("number", e.number).put("subject", e.title).put("start", ScheduleResolver.clock(e.start)).put("end", ScheduleResolver.clock(e.end));
    }

    private static JSONObject lesson(PersonalHomeworkStore notes, ScheduleResolver.Event e, long day) throws Exception {
        JSONObject o = brief(e);
        if (e.homeroom) o.put("homeroom", true);
        Object original = e.original;
        if (original == null) return o;
        String topic = topicOf(original);
        if (!topic.isEmpty()) o.put("topic", topic);
        JSONArray hw = homeworkOf(original);
        if (hw.length() > 0) o.put("homework", hw);
        JSONArray marks = marksOf(original);
        if (marks.length() > 0) o.put("marks", marks);
        String note = noteOf(notes, original, day);
        if (!note.isEmpty()) o.put("my_note", note);
        return o;
    }

    private static JSONObject homework(Context c, JSONObject args) throws Exception {
        long from = parseDay(args.optString("from"), today());
        int days = clamp(args.optInt("days", 7), 1, 31);
        PersonalHomeworkStore notes = new PersonalHomeworkStore(c);
        JSONArray items = new JSONArray();
        JSONArray missing = new JSONArray();
        for (int i = 0; i < days; i++) {
            long day = plus(from, i);
            List<ScheduleResolver.Event> base = baseline(c, day);
            if (base == null) { if (ScheduleResolver.weekday(day) != Calendar.SUNDAY) missing.put(ScheduleResolver.key(day)); continue; }
            for (ScheduleResolver.Event e : base) {
                if (e.original == null) continue;
                JSONArray hw = homeworkOf(e.original);
                String note = noteOf(notes, e.original, day);
                if (hw.length() == 0 && note.isEmpty()) continue;
                JSONObject o = new JSONObject().put("date", ScheduleResolver.key(day)).put("lesson", e.number).put("subject", e.title);
                if (hw.length() > 0) o.put("homework", hw);
                if (!note.isEmpty()) o.put("my_note", note);
                items.put(o);
            }
        }
        JSONObject out = new JSONObject().put("student", studentName(c)).put("items", items);
        if (missing.length() > 0) out.put("days_not_known", missing).put("note", NOT_KNOWN);
        return out;
    }

    private static JSONObject marks(Context c, JSONObject args) throws Exception {
        int days = clamp(args.optInt("days", 30), 1, 120);
        String subject = args.optString("subject").trim().toLowerCase(Locale.ROOT);
        long today = today();
        String from = ScheduleResolver.key(plus(today, -days)), to = ScheduleResolver.key(today);
        TreeMap<String, List<ScheduleResolver.Event>> known = knownDays(c);
        JSONArray out = new JSONArray();
        for (Map.Entry<String, List<ScheduleResolver.Event>> day : known.descendingMap().entrySet()) {
            if (day.getKey().compareTo(from) < 0 || day.getKey().compareTo(to) > 0) continue;
            for (ScheduleResolver.Event e : day.getValue()) {
                if (e.original == null) continue;
                if (!subject.isEmpty() && (e.title == null || !e.title.toLowerCase(Locale.ROOT).contains(subject))) continue;
                JSONArray marks = marksOf(e.original);
                for (int i = 0; i < marks.length(); i++) out.put(marks.getJSONObject(i).put("subject", e.title).put("lesson_date", day.getKey()));
            }
        }
        JSONObject o = new JSONObject().put("student", studentName(c)).put("marks", out);
        if (out.length() == 0) o.put("note", "Оценок в известных днях нет. Оценки по предметам с итогами есть в rk_grades.");
        return o;
    }

    private static JSONObject grades(Context c, JSONObject args) throws Exception {
        DiaryDb.Student s = student(c);
        if (s == null) throw new Problem("В приложении пока нет данных ученика: откройте RK Note и дождитесь загрузки дневника.");
        String subject = args.optString("subject").trim().toLowerCase(Locale.ROOT);
        JSONArray all = DiaryDb.grades(c, s.id), out = new JSONArray();
        for (int i = 0; i < all.length(); i++) {
            JSONObject g = all.getJSONObject(i);
            if (subject.isEmpty() || g.optString("subject").toLowerCase(Locale.ROOT).contains(subject)) out.put(g);
        }
        JSONObject o = new JSONObject().put("student", s.name).put("periods", DiaryDb.periods(c, s.id)).put("subjects", out);
        if (out.length() == 0) o.put("note", "Вкладка «Оценки» в приложении ещё не загружалась: откройте её один раз.");
        return o;
    }

    private static JSONObject finalGrades(Context c) throws Exception {
        DiaryDb.Student s = student(c);
        if (s == null) throw new Problem("В приложении пока нет данных ученика.");
        Object raw = DiaryDb.finalGrades(c, s.id);
        JSONObject o = new JSONObject().put("student", s.name);
        if (raw == null) return o.put("note", "Итоговые оценки ещё не загружались: откройте вкладку «Итоговые» в приложении один раз.");
        String text = raw.toString();
        if (text.length() > 24000) return o.put("final_grades_cut", text.substring(0, 24000));
        return o.put("final_grades", raw);
    }

    private static JSONObject announcements(JSONObject args, Context c) throws Exception {
        JSONArray list = DiaryDb.announcements(c, clamp(args.optInt("limit", 10), 1, 30));
        JSONObject o = new JSONObject().put("announcements", list);
        if (list.length() == 0) o.put("note", "Объявлений в приложении нет (или вкладка ещё не загружалась).");
        return o;
    }

    private static JSONObject messages(JSONObject args, Context c) throws Exception {
        JSONArray list = DiaryDb.messages(c, args.optString("folder").trim(), clamp(args.optInt("limit", 10), 1, 30));
        JSONObject o = new JSONObject().put("messages", list);
        if (list.length() == 0) o.put("note", "Сообщений в приложении нет (или раздел ещё не загружался).");
        return o;
    }

    private static JSONObject bells(Context c) throws Exception {
        ScheduleStore s = ScheduleBridge.store(c);
        JSONArray profiles = new JSONArray();
        for (ScheduleStore.Profile p : s.profiles.values()) {
            JSONArray bells = new JSONArray();
            for (int i = 0; i < p.slots.length; i++) if (p.slots[i][0] >= 0) bells.put(new JSONObject().put("lesson", i + 1).put("start", ScheduleResolver.clock(p.slots[i][0])).put("end", ScheduleResolver.clock(p.slots[i][1])));
            profiles.put(new JSONObject().put("id", p.id).put("name", p.name).put("bells", bells));
        }
        JSONObject weekdays = new JSONObject();
        for (Map.Entry<Integer, String> e : s.weekdays.entrySet()) weekdays.put(WEEKDAYS[e.getKey()], profileName(s, e.getValue()));
        JSONObject dates = new JSONObject();
        for (Map.Entry<String, String> e : s.dates.entrySet()) dates.put(e.getKey(), profileName(s, e.getValue()));
        JSONObject out = new JSONObject().put("profiles", profiles).put("by_weekday", weekdays).put("by_date", dates);
        JSONObject rooms = new JSONObject();
        for (Map.Entry<String, ScheduleResolver.Homeroom> e : s.homerooms.entrySet()) {
            ScheduleResolver.Homeroom h = e.getValue();
            rooms.put(e.getKey(), new JSONObject().put("mode", h.mode).put("start", ScheduleResolver.clock(h.start)).put("end", ScheduleResolver.clock(h.end)).put("lesson", h.lesson));
        }
        if (rooms.length() > 0) out.put("homeroom_periods", rooms);
        if (profiles.length() == 0) out.put("note", "Своих расписаний звонков нет: действуют звонки из дневника.");
        return out;
    }

    private static String profileName(ScheduleStore s, String id) {
        ScheduleStore.Profile p = s.profiles.get(id);
        return p == null ? id : p.name;
    }

    private static JSONObject notes(Context c, JSONObject args) throws Exception {
        String owner = ScheduleBridge.owner();
        if (owner.isEmpty()) throw new Problem("Ученик не выбран: откройте дневник в RK Note.");
        String from = args.optString("from"), to = args.optString("to");
        JSONObject document = new JSONObject(c.getSharedPreferences(PersonalHomeworkStore.PREFS, 0).getString("document", "{}"));
        TreeMap<String, JSONObject> sorted = new TreeMap<>();
        java.util.Iterator<String> keys = document.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (!key.startsWith("note:")) continue;
            PersonalHomeworkStore.Id id = PersonalHomeworkStore.Id.parse(key.substring(5));
            if (id == null || !id.owner.equals(owner)) continue;
            if (!from.isEmpty() && id.date.compareTo(from) < 0) continue;
            if (!to.isEmpty() && id.date.compareTo(to) > 0) continue;
            sorted.put(id.date + " " + id.lesson + " " + id.subject, new JSONObject().put("date", id.date).put("lesson", id.lesson.replace("number:", "").replace("occurrence:", "№")).put("subject", id.subject).put("text", document.getString(key)));
        }
        JSONArray out = new JSONArray();
        for (JSONObject o : sorted.values()) out.put(o);
        return new JSONObject().put("student", studentName(c)).put("notes", out);
    }

    private static JSONObject noteSet(Context c, JSONObject args) throws Exception {
        long day = parseDay(args.optString("date"), -1);
        if (day < 0) throw new Problem("Нужна дата YYYY-MM-DD.");
        List<ScheduleResolver.Event> base = baseline(c, day);
        if (base == null) throw new Problem(NOT_KNOWN);
        String number = args.optString("lesson").trim(), subject = args.optString("subject").trim().toLowerCase(Locale.ROOT);
        if (number.isEmpty() && subject.isEmpty()) throw new Problem("Укажите номер урока или предмет.");
        List<ScheduleResolver.Event> hits = new ArrayList<>();
        for (ScheduleResolver.Event e : base) {
            if (e.original == null) continue;
            boolean byNumber = number.isEmpty() || number.equals(e.number == null ? "" : e.number.trim());
            boolean bySubject = subject.isEmpty() || (e.title != null && e.title.toLowerCase(Locale.ROOT).contains(subject));
            if (byNumber && bySubject) hits.add(e);
        }
        if (hits.isEmpty()) throw new Problem("Такого урока в этот день нет.");
        if (hits.size() > 1) {
            StringBuilder names = new StringBuilder();
            for (ScheduleResolver.Event e : hits) names.append(e.number).append(". ").append(e.title).append("; ");
            throw new Problem("Подходит несколько уроков (" + names + "): уточните номер.");
        }
        ScheduleResolver.Event e = hits.get(0);
        String key = noteKey(e.original, day);
        PersonalHomeworkStore.Id id = PersonalHomeworkStore.Id.parse(String.valueOf(key));
        if (id == null) throw new Problem("Ученик не выбран или дневник обновляется. Откройте дневник в RK Note и повторите.");
        String text = args.optString("text").trim();
        ScheduleBridge.saveHomework(ScheduleBridge.ownerStamp(), new PersonalHomeworkStore(c), id, text);
        rk.diary.DiaryUi.noteChanged(key);
        return new JSONObject().put("saved", true).put("date", id.date).put("lesson", e.number).put("subject", e.title).put("text", text)
            .put("note", text.isEmpty() ? "Заметка удалена." : "Заметка сохранена.");
    }

    // ───────────────────────── the diary's own models ─────────────────────────

    private static List<ScheduleResolver.Event> resolved(Context c, long day) {
        try { return ScheduleBridge.resolve(ScheduleBridge.store(c), day, baseline(c, day), true); }
        catch (IllegalArgumentException e) { return new ArrayList<>(); }
    }

    /** Reads a public field of one of the app's own (obfuscated) classes; null when this version of the app differs. */
    private static Object field(Object o, String name) {
        try { return o.getClass().getField(name).get(o); } catch (Exception e) { return null; }
    }

    private static String text(Object o) { return o == null ? "" : String.valueOf(o).trim(); }

    /** The topic of a lesson: la.h.g (the app on screen) or the saved lesson. */
    private static String topicOf(Object lesson) {
        if (lesson instanceof DiaryDb.Lesson) return ((DiaryDb.Lesson) lesson).topic;
        return text(field(lesson, "g"));
    }

    /** Homework of a lesson: la.h.a is a list of entries whose own field "a" is the text. */
    private static JSONArray homeworkOf(Object lesson) {
        JSONArray out = new JSONArray();
        if (lesson instanceof DiaryDb.Lesson) {
            for (String h : ((DiaryDb.Lesson) lesson).homework) out.put(h);
            return out;
        }
        Object list = field(lesson, "a");
        if (!(list instanceof List)) return out;
        for (Object item : (List<?>) list) {
            String t = text(field(item, "a"));
            if (!t.isEmpty()) out.put(t);
        }
        return out;
    }

    /** Marks of a lesson: la.h.b is a list of marks (value, comment, date, weight, weight as a number, title, ..., lesson comment). */
    private static JSONArray marksOf(Object lesson) throws Exception {
        JSONArray out = new JSONArray();
        if (lesson instanceof DiaryDb.Lesson) {
            for (DiaryDb.Mark m : ((DiaryDb.Lesson) lesson).marks) out.put(m.json());
            return out;
        }
        Object list = field(lesson, "b");
        if (!(list instanceof List)) return out;
        for (Object item : (List<?>) list) {
            DiaryDb.Mark m = new DiaryDb.Mark();
            m.value = text(field(item, "a"));
            if (m.value.isEmpty()) continue;
            Object date = field(item, "c");
            m.date = date instanceof Date ? ((Date) date).getTime() : -1;
            m.weight = text(field(item, "d"));
            m.kind = text(field(item, "f"));
            m.comment = text(field(item, "b"));
            m.lessonComment = text(field(item, "h"));
            out.put(m.json());
        }
        return out;
    }

    /**
     * The key of the person's note for a lesson. A lesson open in the app has its own key (the same one the diary screen uses);
     * a saved one gets it made the same way (student, day, number, subject) when the student is the one that is open.
     */
    private static String noteKey(Object lesson, long day) {
        if (!(lesson instanceof DiaryDb.Lesson)) return ScheduleBridge.homeworkKey(lesson);
        DiaryDb.Lesson l = (DiaryDb.Lesson) lesson;
        String owner = ScheduleBridge.owner();
        if (owner.isEmpty() || l.number.trim().isEmpty()) return null;
        return new PersonalHomeworkStore.Id(owner, day, "number:" + l.number.trim(), l.title).key();
    }

    private static String noteOf(PersonalHomeworkStore notes, Object lesson, long day) {
        try { return notes.get(PersonalHomeworkStore.Id.parse(String.valueOf(noteKey(lesson, day)))); }
        catch (RuntimeException e) { return ""; }
    }

    // ───────────────────────── days ─────────────────────────

    private static long today() { return ScheduleResolver.date(ScheduleResolver.key(System.currentTimeMillis())); }

    private static long plus(long day, int n) {
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(day);
        c.add(Calendar.DAY_OF_MONTH, n);
        return c.getTimeInMillis();
    }

    private static long parseDay(String s, long fallback) {
        String v = s == null ? "" : s.trim().toLowerCase(Locale.ROOT);
        if (v.isEmpty() || v.equals("null")) return fallback;
        if (v.equals("today")) return today();
        if (v.equals("tomorrow")) return plus(today(), 1);
        if (v.equals("yesterday")) return plus(today(), -1);
        return ScheduleResolver.date(v);
    }

    private static int clamp(int v, int lo, int hi) { return Math.max(lo, Math.min(hi, v)); }
}
