package android.util;
/** Host-test surface: prints instead of logging; never packaged into the APK. */
public final class Log {
    private Log() {}
    public static int e(String tag, String msg, Throwable t) { System.err.println("E/" + tag + ": " + msg + " " + t); return 0; }
    public static int e(String tag, String msg) { System.err.println("E/" + tag + ": " + msg); return 0; }
    public static int w(String tag, String msg, Throwable t) { System.err.println("W/" + tag + ": " + msg + " " + t); return 0; }
    public static int w(String tag, String msg) { System.err.println("W/" + tag + ": " + msg); return 0; }
}
