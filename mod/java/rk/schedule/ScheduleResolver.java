package rk.schedule;

import java.util.*;

/** Pure calculation shared by diary, editor and countdown. All times are minutes of the selected day. */
public final class ScheduleResolver {
    public static final int SLOTS = 8;
    public static final class Event {
        public final String number, title;
        public final int start, end;
        public final boolean homeroom;
        public final Object original;
        public final String source;
        public Event(String n, String t, int s, int e, boolean h, Object o, String src) {
            number=n; title=t; start=s; end=e; homeroom=h; original=o; source=src;
        }
        public Event at(int s,int e,String src) { return new Event(number,title,s,e,homeroom,original,src); }
    }
    public static final class Homeroom {
        public String mode="separate";
        public int start, end, lesson=1;
        public Homeroom copy() { Homeroom h=new Homeroom(); h.mode=mode; h.start=start; h.end=end; h.lesson=lesson; return h; }
    }
    public static int parse(String value) {
        if(value==null || !value.trim().matches("[0-9]{1,2}:[0-9]{2}")) return -1;
        String[] a=value.trim().split(":"); int h=Integer.parseInt(a[0]), m=Integer.parseInt(a[1]);
        return h<24 && m<60 ? h*60+m : -1;
    }
    public static String clock(int m) { return String.format(Locale.ROOT,"%02d:%02d",m/60,m%60); }
    /** Original banner format: hours for long waits, mm:ss during lessons and breaks. */
    public static String countdown(long millis,boolean seconds){
        long safe=Math.max(0,millis),minutes=safe/60000;
        if(minutes>=60)return (minutes/60)+" ч "+(minutes%60)+" мин";
        if(seconds){long total=safe/1000;return String.format(Locale.ROOT,"%02d:%02d",total/60,total%60);}
        return minutes<1?"< 1 мин":minutes+" мин";
    }
    public static String key(long day) { Calendar c=Calendar.getInstance(); c.setTimeInMillis(day); return String.format(Locale.ROOT,"%04d-%02d-%02d",c.get(1),c.get(2)+1,c.get(5)); }
    public static long date(String key) {if(!key.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}"))throw new IllegalArgumentException("Неверная дата");String[] a=key.split("-");Calendar c=Calendar.getInstance();c.clear();c.setLenient(false);c.set(Integer.parseInt(a[0]),Integer.parseInt(a[1])-1,Integer.parseInt(a[2]));return c.getTimeInMillis();}
    public static int weekday(long day) { Calendar c=Calendar.getInstance();c.setTimeInMillis(day);return c.get(Calendar.DAY_OF_WEEK); }
    public static int minute(Date value) { Calendar c=Calendar.getInstance();c.setTime(value);return c.get(11)*60+c.get(12); }
    public static long instant(long day,int minute) { Calendar c=Calendar.getInstance();c.setTimeInMillis(day);c.set(11,0);c.set(12,0);c.set(13,0);c.set(14,0);c.add(Calendar.MINUTE,minute);return c.getTimeInMillis(); }
    public static int number(String n) { try {return Integer.parseInt(n);}catch(Exception e){return -1;} }
    public static void validateSlots(int[][] slots) {
        int previous=-1;
        for(int i=0;i<slots.length;i++) {
            int s=slots[i][0],e=slots[i][1];
            if(s==-1 && e==-1) continue;
            if(s<0 || e<0 || s>=1440 || e>=1440 || e<=s) throw new IllegalArgumentException("Урок "+(i+1)+": укажите начало и конец, конец позже начала");
            if(s<previous) throw new IllegalArgumentException("Урок "+(i+1)+": пересечение с предыдущим уроком");
            previous=e;
        }
    }
    public static List<Event> resolve(List<Event> diary,int[][] slots,String source,Homeroom h,int shift) {
        List<Event> out=new ArrayList<>();
        for(Event e:diary) {
            int n=number(e.number)-1;
            if(slots!=null && n>=0 && n<slots.length && slots[n][0]>=0) out.add(e.at(slots[n][0],slots[n][1],source)); else if(e.start>=0 && e.end>=0) out.add(e);
        }
        Collections.sort(out,(a,b)->Integer.compare(a.start,b.start));
        if(h!=null) {
            if(h.start<0 || h.end<=h.start || h.end>=1440) throw new IllegalArgumentException("Классный час: неверный интервал");
            if(!h.mode.equals("separate") && !h.mode.equals("replace") && !h.mode.equals("insert")) throw new IllegalArgumentException("Неизвестный режим классного часа");
            int target=-1; for(int i=0;i<out.size();i++) if(number(out.get(i).number)==h.lesson) target=i;
            int start=h.start,end=h.end;
            if(h.mode.equals("replace")) {
                if(target<0) throw new IllegalArgumentException("Для замены нет урока №"+h.lesson);
                out.remove(target);
            } else if(h.mode.equals("insert")) {
                if(target<0) throw new IllegalArgumentException("Для вставки нет урока №"+h.lesson);
                start=out.get(target).start; end=start+h.end-h.start;
                for(int i=target;i<out.size();i++) {Event e=out.get(i);out.set(i,e.at(e.start+end-start,e.end+end-start,source));}
            }
            out.add(new Event("КЧ","Классный час",start,end,true,null,source));
        }
        Collections.sort(out,(a,b)->Integer.compare(a.start,b.start));
        List<Event> result=new ArrayList<>();int previous=-1;
        for(Event e:out) {
            Event x=e.at(e.start+shift,e.end+shift,e.source);
            if(x.start<0 || x.end>=1440 || x.end<=x.start) throw new IllegalArgumentException("Событие «"+x.title+"» выходит за пределы дня или имеет неверное время");
            if(x.start<previous) throw new IllegalArgumentException("Пересечение: "+x.title+" ("+clock(x.start)+")");
            previous=x.end;result.add(x);
        }
        return result;
    }
    public static void shiftFollowing(int[][] slots,int row,int delta) {
        int[][] draft=new int[slots.length][2];
        for(int i=0;i<slots.length;i++) {draft[i]=slots[i].clone();if(i>row && draft[i][0]>=0){draft[i][0]+=delta;draft[i][1]+=delta;}}
        validateSlots(draft);for(int i=0;i<slots.length;i++)slots[i]=draft[i];
    }
}
