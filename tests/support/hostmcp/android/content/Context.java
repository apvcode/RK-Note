package android.content;
/** Host-test surface for the MCP server test; never packaged into the APK. */
public abstract class Context {
    public abstract SharedPreferences getSharedPreferences(String name,int mode);
    public Context getApplicationContext(){return this;}
}
