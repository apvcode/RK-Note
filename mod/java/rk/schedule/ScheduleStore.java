package rk.schedule;

import android.content.*;
import org.json.*;
import java.util.*;

public final class ScheduleStore {
    static final String PREFS="rk_schedule_v2";
    public static final class Profile {
        public String id,name; public int[][] slots=new int[8][2];
        public Profile(String id,String name){this.id=id;this.name=name;for(int[] s:slots)Arrays.fill(s,-1);}
    }
    public final LinkedHashMap<String,Profile> profiles=new LinkedHashMap<>();
    public final Map<String,String> dates=new TreeMap<>();
    public final Map<Integer,String> weekdays=new TreeMap<>();
    public final Map<String,ScheduleResolver.Homeroom> homerooms=new TreeMap<>();
    public final Map<String,Integer> corrections=new TreeMap<>();
    public final Set<String> needsSetup=new HashSet<>();
    private static JSONObject object(JSONObject p,String k){JSONObject x=p.optJSONObject(k);return x==null?new JSONObject():x;}
    public static ScheduleStore load(Context c) {
        SharedPreferences prefs=c.getSharedPreferences(PREFS,0);String raw=prefs.getString("config",null);
        if(raw!=null) {try{return decode(raw);}catch(Exception e){throw new IllegalStateException("Не удалось прочитать расписание. Сохранённые данные не изменены",e);}}
        ScheduleStore s=migrate(c);
        s.save(c);return s;
    }
    public ScheduleStore copy(){try{return decode(encode());}catch(Exception e){throw new IllegalStateException(e);}}
    public static ScheduleStore decode(String raw) throws JSONException {
        JSONObject root=new JSONObject(raw);if(root.getInt("version")!=2)throw new JSONException("Unsupported schedule version");
        ScheduleStore s=new ScheduleStore();JSONArray ps=root.getJSONArray("profiles");
        for(int i=0;i<ps.length();i++){JSONObject j=ps.getJSONObject(i);Profile p=new Profile(j.getString("id"),j.getString("name"));JSONArray rows=j.getJSONArray("slots");if(rows.length()!=8)throw new JSONException("Eight slots required");for(int n=0;n<8;n++){JSONArray row=rows.getJSONArray(n);p.slots[n]=new int[]{row.getInt(0),row.getInt(1)};}ScheduleResolver.validateSlots(p.slots);if(s.profiles.put(p.id,p)!=null)throw new JSONException("Duplicate profile");}
        JSONObject d=object(root,"dates"),w=object(root,"weekdays"),h=object(root,"homerooms");
        for(Iterator<String> it=d.keys();it.hasNext();){String k=it.next();s.dates.put(k,d.getString(k));}
        for(Iterator<String> it=w.keys();it.hasNext();){String k=it.next();s.weekdays.put(Integer.parseInt(k),w.getString(k));}
        for(Iterator<String> it=h.keys();it.hasNext();){String k=it.next();JSONObject j=h.getJSONObject(k);ScheduleResolver.Homeroom x=new ScheduleResolver.Homeroom();x.mode=j.getString("mode");x.start=j.getInt("start");x.end=j.getInt("end");x.lesson=j.getInt("lesson");s.homerooms.put(k,x);}
        JSONObject correction=object(root,"corrections");for(Iterator<String> it=correction.keys();it.hasNext();){String k=it.next();int v=correction.getInt(k);if(Math.abs((long)v)>=1440)throw new JSONException("Invalid correction");s.corrections.put(k,v);}
        JSONArray warning=root.optJSONArray("needsSetup");if(warning!=null)for(int i=0;i<warning.length();i++)s.needsSetup.add(warning.getString(i));
        for(String id:s.dates.values())if(!s.profiles.containsKey(id))throw new JSONException("Missing date profile");
        for(String id:s.weekdays.values())if(!s.profiles.containsKey(id))throw new JSONException("Missing weekday profile");
        return s;
    }
    public String encode() throws JSONException {
        JSONObject r=new JSONObject();r.put("version",2);JSONArray ps=new JSONArray();
        for(Profile p:profiles.values()){ScheduleResolver.validateSlots(p.slots);JSONObject j=new JSONObject();j.put("id",p.id);j.put("name",p.name);JSONArray rows=new JSONArray();for(int[] a:p.slots)rows.put(new JSONArray().put(a[0]).put(a[1]));j.put("slots",rows);ps.put(j);}
        r.put("profiles",ps);r.put("dates",new JSONObject(dates));JSONObject w=new JSONObject();for(Map.Entry<Integer,String> e:weekdays.entrySet())w.put(String.valueOf(e.getKey()),e.getValue());r.put("weekdays",w);
        JSONObject hs=new JSONObject();for(Map.Entry<String,ScheduleResolver.Homeroom> e:homerooms.entrySet()){ScheduleResolver.Homeroom h=e.getValue();JSONObject j=new JSONObject();j.put("mode",h.mode);j.put("start",h.start);j.put("end",h.end);j.put("lesson",h.lesson);hs.put(e.getKey(),j);}r.put("homerooms",hs);r.put("corrections",new JSONObject(corrections));r.put("needsSetup",new JSONArray(needsSetup));return r.toString();
    }
    public void save(Context c){
        try{String raw=encode();decode(raw);SharedPreferences prefs=c.getSharedPreferences(PREFS,0);String before=prefs.getString("config",null);if(!prefs.edit().putString("config",raw).commit()){SharedPreferences.Editor rollback=prefs.edit();if(before==null)rollback.remove("config");else rollback.putString("config",before);rollback.commit();throw new IllegalStateException("Ошибка записи расписания");}}
        catch(JSONException e){throw new IllegalStateException("Не удалось сохранить расписание",e);}
    }
    public void clearChangedCorrections(ScheduleStore previous){for(String date:new ArrayList<>(corrections.keySet())){long day=ScheduleResolver.date(date);Profile before=previous.active(day),after=active(day);if(!Objects.equals(before==null?null:before.id,after==null?null:after.id))corrections.remove(date);}}
    public Profile active(long day){String id=dates.get(ScheduleResolver.key(day));if(id==null)id=weekdays.get(ScheduleResolver.weekday(day));return profiles.get(id);}
    public String source(long day){Profile p=active(day);return p==null?"Из дневника":p.name+(dates.containsKey(ScheduleResolver.key(day))?" · на дату":" · по дню недели");}
    public ScheduleResolver.Homeroom homeroom(long day){String key=ScheduleResolver.key(day);return homerooms.containsKey(key)?homerooms.get(key):homerooms.get("dow:"+ScheduleResolver.weekday(day));}
    public void assignDate(long day,String id){ScheduleStore before=copy();if(id==null)dates.remove(ScheduleResolver.key(day));else dates.put(ScheduleResolver.key(day),id);clearChangedCorrections(before);}
    public void assignWeekdays(String id,boolean[] checked,boolean remove){ScheduleStore before=copy();for(int i=0;i<7;i++){if(remove){if(checked[i])weekdays.remove(i+1);}else if(checked[i]&&id!=null)weekdays.put(i+1,id);else if(Objects.equals(weekdays.get(i+1),id))weekdays.remove(i+1);}clearChangedCorrections(before);}
    public void remove(String id){ScheduleStore before=copy();profiles.remove(id);dates.values().removeAll(Collections.singleton(id));weekdays.values().removeAll(Collections.singleton(id));needsSetup.remove(id);clearChangedCorrections(before);}
    private static String oldDate(String raw){try{String[] a=raw.split("-");if(a.length!=3)return "";return String.format(Locale.ROOT,"%04d-%02d-%02d",Integer.parseInt(a[0]),Integer.parseInt(a[1]),Integer.parseInt(a[2]));}catch(Exception e){return "";}}
    private static ScheduleStore migrate(Context c){
        ScheduleStore s=new ScheduleStore();SharedPreferences old=c.getSharedPreferences("lesson_schedule_prefs",0);
        for(String id:new String[]{"45","40","35","30"}){Profile p=new Profile(id,id.equals("45")?"Обычный · 45 мин":"Сокращённый · "+id+" мин");boolean valid=false;
            for(int n=0;n<8;n++){String prefix="profile_"+id+"_"+(n+1);int a=ScheduleResolver.parse(old.getString(prefix+"_start","")),b=ScheduleResolver.parse(old.getString(prefix+"_end",""));if(a>=0&&b>a){p.slots[n]=new int[]{a,b};valid=true;}}
            try{ScheduleResolver.validateSlots(p.slots);}catch(IllegalArgumentException e){for(int[] row:p.slots)Arrays.fill(row,-1);valid=false;}
            s.profiles.put(id,p);if(!valid)s.needsSetup.add(id);
        }
        for(int dow=1;dow<=7;dow++){String id=old.getString("dow_profile_"+dow,null);if("45".equals(id)&&old.getInt("dow_"+dow,45)==30)id="30";if(id==null&&old.contains("dow_"+dow))id=String.valueOf(old.getInt("dow_"+dow,45));if(id==null)id="45";if(s.profiles.containsKey(id))s.weekdays.put(dow,id);migrateHomeroom(s,old,"homeroom_dow_"+dow+"_","dow:"+dow);}
        String date=oldDate(old.getString("today_date","")),id=String.valueOf(old.getInt("today_duration",45));if(!date.isEmpty()&&s.profiles.containsKey(id))s.dates.put(date,id);
        date=oldDate(old.getString("homeroom_today_date",""));if(!date.isEmpty())migrateHomeroom(s,old,"homeroom_today_",date);
        SharedPreferences correction=c.getSharedPreferences("manual_bell_correction",0);Calendar today=Calendar.getInstance();if(correction.getInt("day",-1)==today.get(1)*1000+today.get(6)){int shift=(int)Math.round(correction.getLong("shift",0)/60000.0);if(Math.abs((long)shift)<1440)s.corrections.put(ScheduleResolver.key(today.getTimeInMillis()),shift);}
        return s;
    }
    private static void migrateHomeroom(ScheduleStore s,SharedPreferences old,String prefix,String key){int a=ScheduleResolver.parse(old.getString(prefix+"start","")),b=ScheduleResolver.parse(old.getString(prefix+"end",""));if(a>=0&&b>a){ScheduleResolver.Homeroom h=new ScheduleResolver.Homeroom();h.start=a;h.end=b;s.homerooms.put(key,h);}}
}
