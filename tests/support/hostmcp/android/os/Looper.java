package android.os;
/** Host-test surface: one looper, "the main thread" is wherever the test runs; never packaged into the APK. */
public final class Looper {
    private static final Looper MAIN = new Looper();
    private Looper() {}
    public static Looper getMainLooper() { return MAIN; }
    public static Looper myLooper() { return MAIN; }
}
