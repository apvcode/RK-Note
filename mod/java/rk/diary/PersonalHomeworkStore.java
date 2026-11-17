package rk.diary;

import android.content.*;
import java.util.*;
import org.json.*;
import rk.schedule.ScheduleResolver;

/** V2 notes and import receipts share one committed document. Legacy text is never modified. */
public final class PersonalHomeworkStore {
    public static final String PREFS="personal_homework_v2";
    public static final class Id {
        public final String owner,date,lesson,subject;
        public Id(String owner,long day,String lesson,String subject){this(owner,ScheduleResolver.key(day),lesson,subject);}
        private Id(String owner,String date,String lesson,String subject){this.owner=owner;this.date=date;this.lesson=lesson;this.subject=subject;}
        public String key(){return new JSONArray().put(owner).put(date).put(lesson).put(subject).toString();}
        public static Id parse(String key){try{JSONArray a=new JSONArray(key);if(a.length()!=4)return null;return new Id(a.getString(0),a.getString(1),a.getString(2),a.getString(3));}catch(Exception e){return null;}}
    }
    private final SharedPreferences prefs,legacy;
    public PersonalHomeworkStore(Context c){prefs=c.getSharedPreferences(PREFS,0);legacy=c.getSharedPreferences("personal_homework",0);}
    private JSONObject read(){try{return new JSONObject(prefs.getString("document","{}"));}catch(Exception e){throw new IllegalStateException("Не удалось прочитать личное ДЗ. Данные сохранены",e);}}
    public synchronized String get(Id id){return id==null?"":read().optString("note:"+id.key(),"");}
    public Map<String,String> archive(){Map<String,String> out=new TreeMap<>();for(Map.Entry<String,?> e:legacy.getAll().entrySet())if(e.getValue() instanceof String&&!((String)e.getValue()).isEmpty())out.put(e.getKey(),(String)e.getValue());return out;}
    public synchronized Id destination(String key){return Id.parse(read().optString("import:"+key,""));}
    public synchronized boolean imported(String key){return read().has("import:"+key);}
    public synchronized void save(Id id,String value){write(id,value,null);}
    public synchronized String transfer(Id id,String archiveKey,String editorText,boolean append){
        String old=archive().get(archiveKey);if(old==null)throw new IllegalStateException("Запись архива недоступна");
        if(imported(archiveKey))throw new IllegalStateException("Эта запись уже перенесена");
        String current=get(id);String base=editorText==null?current:editorText;
        if((!current.isEmpty()||!base.isEmpty())&&!append)throw new IllegalStateException("Подтвердите добавление к существующему ДЗ");
        // Never discard text saved while the editor was open.
        if(!current.isEmpty()&&!base.contains(current))base=current+(base.isEmpty()?"":"\n\n"+base);
        String result=base.isEmpty()?old:base+"\n\n"+old;write(id,result,archiveKey);return result;
    }
    private void write(Id id,String value,String archiveKey){
        if(id==null||id.owner.isEmpty()||id.lesson.isEmpty())throw new IllegalStateException("Сначала выберите ученика и урок");
        String before=prefs.getString("document",null);JSONObject document=read();
        try{if(value.isEmpty())document.remove("note:"+id.key());else document.put("note:"+id.key(),value);if(archiveKey!=null)document.put("import:"+archiveKey,id.key());}catch(JSONException e){throw new IllegalStateException(e);}
        if(!prefs.edit().putString("document",document.toString()).commit()){
            SharedPreferences.Editor rollback=prefs.edit();if(before==null)rollback.remove("document");else rollback.putString("document",before);rollback.commit();
            throw new IllegalStateException("Не удалось сохранить. Попробуйте ещё раз");
        }
    }
}
