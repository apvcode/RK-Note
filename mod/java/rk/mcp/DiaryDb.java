package rk.mcp;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import org.json.JSONArray;
import org.json.JSONObject;
import rk.schedule.ScheduleResolver;

/**
 * What the school app has already saved on the phone (its Room database "el_jur_db"), read directly and read-only: the
 * diary days, marks by subject, final grades, announcements and messages. It holds more than the screen has open, so the
 * assistant can answer without the person opening the right week. The JSON inside the tables is written by the app's own
 * converters (Gson), so everything here is read leniently: a field that is missing or shaped differently is skipped.
 */
final class DiaryDb {
    private static final String FILE = "el_jur_db";

    private DiaryDb() {}

    static final class Student { String id, name; }

    static final class Mark {
        String value, comment, weight, kind, lessonComment;
        long date = -1;

        JSONObject json() throws Exception {
            JSONObject o = new JSONObject().put("value", value);
            if (date >= 0) o.put("date", ScheduleResolver.key(date));
            if (!weight.isEmpty()) o.put("weight", weight);
            if (!kind.isEmpty()) o.put("kind", kind);
            if (!comment.isEmpty()) o.put("comment", comment);
            if (!lessonComment.isEmpty()) o.put("lesson_comment", lessonComment);
            return o;
        }
    }

    static final class Lesson {
        String number = "", title = "", topic = "";
        int start = -1, end = -1;
        final List<String> homework = new ArrayList<>();
        final List<Mark> marks = new ArrayList<>();
    }

    static final class Day {
        String key, name = "", alert = "", holiday = "";
        final List<Lesson> lessons = new ArrayList<>();
    }

    // ───────────────────────── access ─────────────────────────

    private static SQLiteDatabase open(Context c) {
        try {
            File f = c.getDatabasePath(FILE);
            if (f == null || !f.exists()) return null;
            return SQLiteDatabase.openDatabase(f.getPath(), null, SQLiteDatabase.OPEN_READONLY | SQLiteDatabase.NO_LOCALIZED_COLLATORS);
        } catch (Throwable e) {
            android.util.Log.w("RKMcp", "The app's database cannot be opened", e);
            return null;
        }
    }

    static List<Student> students(Context c) {
        List<Student> out = new ArrayList<>();
        SQLiteDatabase db = open(c);
        if (db == null) return out;
        try (Cursor q = db.rawQuery("SELECT id, fullName FROM student", null)) {
            while (q.moveToNext()) {
                Student s = new Student();
                s.id = q.getString(0);
                s.name = q.isNull(1) ? "" : q.getString(1);
                out.add(s);
            }
        } catch (Throwable e) {
            android.util.Log.w("RKMcp", "students", e);
        } finally { db.close(); }
        return out;
    }

    private static long cachedAt;
    private static String cachedFor;
    private static Map<String, Day> cached = new TreeMap<>();

    /** Every diary day saved for one student, by date (YYYY-MM-DD). Kept for a few seconds: one question reads many days. */
    static synchronized Map<String, Day> days(Context c, String studentId) {
        long now = System.currentTimeMillis();
        if (studentId != null && studentId.equals(cachedFor) && now - cachedAt < 5000) return cached;
        Map<String, Day> out = new TreeMap<>();
        SQLiteDatabase db = open(c);
        if (db != null) {
            try (Cursor q = db.rawQuery("SELECT dayDate, dayName, alert, holidayName, diaryLessons FROM diary WHERE studentId = ?", new String[]{studentId})) {
                while (q.moveToNext()) {
                    String key = dayKey(q.getString(0));
                    if (key == null) continue;
                    Day d = new Day();
                    d.key = key;
                    d.name = str(q, 1); d.alert = str(q, 2); d.holiday = str(q, 3);
                    d.lessons.addAll(parseLessons(q.isNull(4) ? "" : q.getString(4)));
                    out.put(key, d);
                }
            } catch (Throwable e) {
                android.util.Log.w("RKMcp", "diary", e);
            } finally { db.close(); }
        }
        cached = out; cachedFor = studentId; cachedAt = now;
        return out;
    }

    private static String str(Cursor q, int i) { return q.isNull(i) ? "" : q.getString(i); }

    /** Marks by subject (the "Оценки" tab): subject, period, average, the marks. */
    static JSONArray grades(Context c, String studentId) throws Exception {
        JSONArray out = new JSONArray();
        SQLiteDatabase db = open(c);
        if (db == null) return out;
        try (Cursor q = db.rawQuery("SELECT name, periodDays, average, marks FROM lessonMarks WHERE studentId = ? ORDER BY name", new String[]{studentId})) {
            while (q.moveToNext()) {
                JSONObject o = new JSONObject().put("subject", str(q, 0)).put("period_days", str(q, 1));
                if (!str(q, 2).isEmpty()) o.put("average", str(q, 2));
                JSONArray marks = new JSONArray();
                for (Mark m : parseMarks(arrayOf(str(q, 3)))) marks.put(m.json());
                o.put("marks", marks);
                out.put(o);
            }
        } catch (Throwable e) {
            android.util.Log.w("RKMcp", "grades", e);
        } finally { db.close(); }
        return out;
    }

    /** The school periods (quarters, terms) with their dates, to read "period_days" by. */
    static JSONArray periods(Context c, String studentId) throws Exception {
        JSONArray out = new JSONArray();
        SQLiteDatabase db = open(c);
        if (db == null) return out;
        try (Cursor q = db.rawQuery("SELECT name, fullName, start, end FROM period WHERE studentId = ? ORDER BY start", new String[]{studentId})) {
            while (q.moveToNext()) {
                JSONObject o = new JSONObject().put("name", str(q, 0)).put("title", str(q, 1));
                if (!q.isNull(2)) o.put("from", ScheduleResolver.key(millis(q.getLong(2))));
                if (!q.isNull(3)) o.put("to", ScheduleResolver.key(millis(q.getLong(3))));
                out.put(o);
            }
        } catch (Throwable e) {
            android.util.Log.w("RKMcp", "periods", e);
        } finally { db.close(); }
        return out;
    }

    /** The final grades table as the app saved it (a list of subjects with their periods); kept as it is. */
    static Object finalGrades(Context c, String studentId) {
        SQLiteDatabase db = open(c);
        if (db == null) return null;
        try (Cursor q = db.rawQuery("SELECT subjects FROM finalGrades WHERE studentId = ?", new String[]{studentId})) {
            if (!q.moveToFirst() || q.isNull(0)) return null;
            String raw = q.getString(0).trim();
            return raw.startsWith("[") ? new JSONArray(raw) : new JSONObject(raw);
        } catch (Throwable e) {
            android.util.Log.w("RKMcp", "final grades", e);
            return null;
        } finally { db.close(); }
    }

    static JSONArray announcements(Context c, int limit) throws Exception {
        JSONArray out = new JSONArray();
        SQLiteDatabase db = open(c);
        if (db == null) return out;
        try (Cursor q = db.rawQuery("SELECT subject, text, shortText, dateFrom, isRead, firstName, lastName, middleName FROM announcement ORDER BY dateFrom DESC LIMIT " + limit, null)) {
            while (q.moveToNext()) {
                JSONObject o = new JSONObject().put("subject", str(q, 0)).put("text", plain(str(q, 1).isEmpty() ? str(q, 2) : str(q, 1)));
                if (!q.isNull(3)) o.put("date", ScheduleResolver.key(millis(q.getLong(3))));
                o.put("read", q.getInt(4) != 0).put("from", person(str(q, 6), str(q, 5), str(q, 7)));
                out.put(o);
            }
        } catch (Throwable e) {
            android.util.Log.w("RKMcp", "announcements", e);
        } finally { db.close(); }
        return out;
    }

    static JSONArray messages(Context c, String folder, int limit) throws Exception {
        JSONArray out = new JSONArray();
        SQLiteDatabase db = open(c);
        if (db == null) return out;
        String where = folder == null || folder.isEmpty() ? "" : " WHERE messageFolderType = ?";
        String[] args = folder == null || folder.isEmpty() ? null : new String[]{folder};
        try (Cursor q = db.rawQuery("SELECT subject, text, shortText, date, isRead, messageFolderType, firstName, lastName, middleName FROM message" + where + " ORDER BY date DESC LIMIT " + limit, args)) {
            while (q.moveToNext()) {
                JSONObject o = new JSONObject().put("subject", str(q, 0)).put("text", plain(str(q, 1).isEmpty() ? str(q, 2) : str(q, 1)));
                if (!q.isNull(3)) o.put("date", ScheduleResolver.key(millis(q.getLong(3))));
                o.put("read", q.getInt(4) != 0).put("folder", str(q, 5)).put("from", person(str(q, 7), str(q, 6), str(q, 8)));
                out.put(o);
            }
        } catch (Throwable e) {
            android.util.Log.w("RKMcp", "messages", e);
        } finally { db.close(); }
        return out;
    }

    private static String person(String last, String first, String middle) { return (last + " " + first + " " + middle).trim().replaceAll("\\s+", " "); }

    /** Text of an announcement or message: markup taken out, a few entities read, cut at a sensible length. */
    static String plain(String html) {
        String t = html.replaceAll("(?i)<br\\s*/?>|</p>|</div>|</li>", "\n").replaceAll("<[^>]+>", "")
            .replace("&nbsp;", " ").replace("&amp;", "&").replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", "\"").replace("&#39;", "'")
            .replaceAll("[ \\t]+", " ").replaceAll("\\n\\s*\\n+", "\n").trim();
        return t.length() > 1500 ? t.substring(0, 1500) + "…" : t;
    }

    // ───────────────────────── reading what the converters wrote ─────────────────────────

    /** "20261122", "2026-11-22", "22.11.2026" or a time in milliseconds, as YYYY-MM-DD; null when it is none of them. */
    static String dayKey(String raw) {
        if (raw == null) return null;
        String s = raw.trim();
        if (s.matches("\\d{8}")) return s.substring(0, 4) + "-" + s.substring(4, 6) + "-" + s.substring(6);
        if (s.matches("\\d{4}-\\d{2}-\\d{2}.*")) return s.substring(0, 10);
        if (s.matches("\\d{2}\\.\\d{2}\\.\\d{4}")) return s.substring(6) + "-" + s.substring(3, 5) + "-" + s.substring(0, 2);
        if (s.matches("\\d{9,13}")) return ScheduleResolver.key(millis(Long.parseLong(s)));
        return null;
    }

    private static long millis(long v) { return v < 100000000000L ? v * 1000 : v; }

    /** A date as Gson wrote it: a number, the default US date-time text of the phone, or ISO text; -1 when unreadable. */
    static long parseDate(Object value) {
        if (value == null) return -1;
        if (value instanceof Number) return millis(((Number) value).longValue());
        String s = String.valueOf(value).trim().replace(' ', ' ').replace(' ', ' ');
        if (s.isEmpty()) return -1;
        if (s.matches("\\d{9,13}")) return millis(Long.parseLong(s));
        DateFormat[] formats = {
            DateFormat.getDateTimeInstance(DateFormat.DEFAULT, DateFormat.DEFAULT, Locale.US),
            new SimpleDateFormat("MMM d, yyyy h:mm:ss a", Locale.US),
            new SimpleDateFormat("MMM d, yyyy, h:mm:ss a", Locale.US),
            new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US),
            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US),
            new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US),
            new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.US),
        };
        for (DateFormat f : formats) {
            try {
                Date d = f.parse(s);
                if (d != null) return d.getTime();
            } catch (Exception ignored) { /* try the next shape */ }
        }
        return -1;
    }

    private static JSONArray arrayOf(String raw) {
        try { return raw == null || raw.trim().isEmpty() ? new JSONArray() : new JSONArray(raw); } catch (Exception e) { return new JSONArray(); }
    }

    private static String text(JSONObject o, String key) {
        if (o == null || o.isNull(key)) return "";
        return String.valueOf(o.opt(key)).trim();
    }

    static List<Mark> parseMarks(JSONArray list) {
        List<Mark> out = new ArrayList<>();
        for (int i = 0; i < list.length(); i++) {
            JSONObject m = list.optJSONObject(i);
            if (m == null) continue;
            Mark mark = new Mark();
            mark.value = text(m, "value");
            if (mark.value.isEmpty()) continue;
            mark.comment = text(m, "comment");
            mark.weight = text(m, "weight");
            mark.kind = text(m, "title");
            mark.lessonComment = text(m, "lessonComment");
            mark.date = parseDate(m.opt("date"));
            out.add(mark);
        }
        return out;
    }

    /** The lessons of one saved day (a Gson list of the app's lesson models). */
    static List<Lesson> parseLessons(String json) {
        List<Lesson> out = new ArrayList<>();
        JSONArray list = arrayOf(json);
        for (int i = 0; i < list.length(); i++) {
            JSONObject o = list.optJSONObject(i);
            if (o == null) continue;
            Lesson l = new Lesson();
            l.title = text(o, "name");
            l.number = text(o, "num");
            l.topic = text(o, "topic");
            long start = parseDate(o.opt("startTime")), end = parseDate(o.opt("endTime"));
            if (start >= 0) l.start = ScheduleResolver.minute(new Date(start));
            if (end >= 0) l.end = ScheduleResolver.minute(new Date(end));
            JSONArray hw = o.optJSONArray("homework");
            if (hw != null) for (int k = 0; k < hw.length(); k++) {
                JSONObject h = hw.optJSONObject(k);
                String v = h == null ? "" : text(h, "value");
                if (!v.isEmpty()) l.homework.add(v);
            }
            JSONArray marks = o.optJSONArray("marks");
            if (marks != null) l.marks.addAll(parseMarks(marks));
            out.add(l);
        }
        return out;
    }
}
