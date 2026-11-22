package android.content;
public interface SharedPreferences {
    java.util.Map<String,?> getAll();
    String getString(String key,String fallback);
    boolean getBoolean(String key,boolean fallback);
    int getInt(String key,int fallback);
    long getLong(String key,long fallback);
    boolean contains(String key);
    Editor edit();
    interface Editor {
        Editor putString(String key,String value);
        Editor putBoolean(String key,boolean value);
        Editor putInt(String key,int value);
        Editor putLong(String key,long value);
        Editor clear();
        Editor remove(String key);
        boolean commit();
        void apply();
    }
}
