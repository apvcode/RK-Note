package rk.schedule;
import android.content.*;
import java.util.*;
public final class ScheduleStoreTest {
    static int checks;
    static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    static final class Memory extends Context {
        final Map<String,Prefs> files=new HashMap<>();
        public Prefs getSharedPreferences(String name,int mode){if(!files.containsKey(name))files.put(name,new Prefs());return files.get(name);}
    }
    static final class Prefs implements SharedPreferences {
        Map<String,Object> data=new HashMap<>();boolean fail;
        public Map<String,?> getAll(){return new HashMap<>(data);}
        public String getString(String k,String d){return data.containsKey(k)?(String)data.get(k):d;}
        public int getInt(String k,int d){return data.containsKey(k)?(Integer)data.get(k):d;}
        public long getLong(String k,long d){return data.containsKey(k)?(Long)data.get(k):d;}
        public boolean contains(String k){return data.containsKey(k);}
        public Editor edit(){return new Editor(){Map<String,Object> staged=new HashMap<>(data);public Editor putString(String k,String v){staged.put(k,v);return this;}public Editor putInt(String k,int v){staged.put(k,v);return this;}public Editor putLong(String k,long v){staged.put(k,v);return this;}public Editor clear(){staged.clear();return this;}public Editor remove(String k){staged.remove(k);return this;}public boolean commit(){if(fail)return false;data=staged;return true;}public void apply(){commit();}};}
    }
    public static void main(String[] args)throws Exception {
        Memory c=new Memory();Prefs old=c.getSharedPreferences("lesson_schedule_prefs",0);
        old.edit().putString("profile_40_2_start","09:00").putString("profile_40_2_end","09:40").putString("dow_profile_2","40").putString("today_date","2026-10-18").putInt("today_duration",30).putString("homeroom_dow_2_start","08:00").putString("homeroom_dow_2_end","08:30").commit();
        ScheduleStore s=ScheduleStore.load(c);long sunday=ScheduleBridgeDate.day(2026,10,18),monday=ScheduleBridgeDate.day(2026,10,19);
        check(s.profiles.size()==4,"presets");check(s.profiles.get("40").slots[1][0]==540,"migrated clock");check(s.active(sunday).id.equals("30"),"30 minute date override");check(s.active(monday).id.equals("40"),"weekday");check(s.homeroom(monday).start==480,"homeroom migration");check(s.needsSetup.contains("30"),"no invented times");check(!s.needsSetup.contains("40"),"configured profile");
        check(old.getString("profile_40_2_start","").equals("09:00"),"old preserved");
        old.edit().putString("profile_40_2_start","10:00").commit();check(ScheduleStore.load(c).profiles.get("40").slots[1][0]==540,"migration once");
        s.dates.put(ScheduleResolver.key(monday),"35");check(s.active(monday).id.equals("35"),"date priority");s.dates.remove(ScheduleResolver.key(monday));check(s.active(monday).id.equals("40"),"weekday inheritance");
        ScheduleResolver.Homeroom h=new ScheduleResolver.Homeroom();h.start=600;h.end=620;s.homerooms.put(ScheduleResolver.key(monday),h);check(s.homeroom(monday).start==600,"date event priority");
        s.corrections.put(ScheduleResolver.key(monday),-3);ScheduleStore copy=s.copy();copy.profiles.get("40").slots[1][0]=550;check(s.profiles.get("40").slots[1][0]==540,"draft independent");
        check(copy.corrections.get(ScheduleResolver.key(monday))==-3,"correction roundtrip");
        String saved=c.getSharedPreferences(ScheduleStore.PREFS,0).getString("config",null);c.getSharedPreferences(ScheduleStore.PREFS,0).fail=true;boolean failed=false;try{copy.save(c);}catch(IllegalStateException expected){failed=true;}check(failed,"write failure reported");check(c.getSharedPreferences(ScheduleStore.PREFS,0).getString("config",null).equals(saved),"write failure preserves previous");c.getSharedPreferences(ScheduleStore.PREFS,0).fail=false;
        s.dates.put("2026-10-20","40");s.remove("40");check(!s.weekdays.containsValue("40")&&!s.dates.containsValue("40"),"delete cleans references");
        ScheduleStore empty=new ScheduleStore();empty.save(c);check(ScheduleStore.load(c).profiles.isEmpty(),"reset does not remigrate");
        c.getSharedPreferences(ScheduleStore.PREFS,0).edit().putString("config","{broken").commit();failed=false;try{ScheduleStore.load(c);}catch(IllegalStateException expected){failed=true;}check(failed,"corruption visible");check(c.getSharedPreferences(ScheduleStore.PREFS,0).getString("config","").equals("{broken"),"corruption not overwritten");
        boolean invalid=false;try{ScheduleStore.decode(saved.replace("\"version\":2","\"version\":99"));}catch(Exception expected){invalid=true;}check(invalid,"unknown version rejected");
        ScheduleStore assignments=new ScheduleStore();assignments.profiles.put("a",new ScheduleStore.Profile("a","A"));assignments.profiles.put("b",new ScheduleStore.Profile("b","B"));
        String date=ScheduleResolver.key(monday),other="2026-10-20";assignments.weekdays.put(2,"a");assignments.corrections.put(date,3);assignments.corrections.put(other,4);
        ScheduleStore cancelled=assignments.copy();cancelled.assignDate(monday,"b");check(!cancelled.corrections.containsKey(date),"assignment clears old correction immediately");check(cancelled.corrections.get(other)==4,"unaffected date preserved");check(assignments.corrections.get(date)==3,"cancel draft preserves original");
        cancelled.corrections.put(date,7);cancelled.save(c);check(ScheduleStore.load(c).corrections.get(date)==7,"new profile then +7 then save");
        cancelled.assignDate(monday,"b");check(cancelled.corrections.get(date)==7,"same assignment preserves correction");cancelled.profiles.get("b").slots[0]=new int[]{500,540};cancelled.save(c);check(ScheduleStore.load(c).corrections.get(date)==7,"editing bells preserves correction");
        cancelled.assignDate(monday,null);check(!cancelled.corrections.containsKey(date),"removing date changes effective profile");
        boolean[] mondayOnly=new boolean[7];mondayOnly[1]=true;assignments.assignWeekdays("b",mondayOnly,false);check(!assignments.corrections.containsKey(date),"weekday change clears affected correction");check(assignments.corrections.get(other)==4,"weekday leaves other dates");
        assignments.assignDate(monday,"a");assignments.corrections.put(date,9);assignments.assignWeekdays("b",mondayOnly,true);check(assignments.corrections.get(date)==9,"date override shields weekday removal");
        assignments.remove("a");check(!assignments.corrections.containsKey(date),"deletion clears changed effective profile");
        System.out.println("Schedule store: "+checks+" checks passed.");
    }
    static final class ScheduleBridgeDate {static long day(int y,int m,int d){Calendar c=Calendar.getInstance();c.clear();c.set(y,m-1,d);return c.getTimeInMillis();}}
}
