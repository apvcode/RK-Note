package rk.schedule;

import java.util.*;

/** Owner and generation travel with every request, including empty responses. */
public final class DiaryContext {
    public static final class Stamp {
        public final String owner; public final long generation;
        private Stamp(String owner,long generation){this.owner=owner;this.generation=generation;}
    }
    private String account="",student="",schoolLabel="",loginLabel=""; private long generation;
    private final Map<String,List<ScheduleResolver.Event>> days=new HashMap<>();
    public static String part(String value){return value.length()+":"+value;}
    public synchronized String owner(){return account.isEmpty()||student.isEmpty()?"":account+part(student);}
    public synchronized boolean account(String school,String login){String next=school==null||login==null||school.isEmpty()||login.isEmpty()?"":part(school)+part(login);if(account.equals(next))return false;account=next;schoolLabel=school==null?"":school;loginLabel=login==null?"":login;student="";invalidate();return true;}
    public synchronized boolean student(String value){String next=value==null?"":value;if(student.equals(next))return false;student=next;invalidate();return true;}
    private void invalidate(){generation++;days.clear();}
    public synchronized String label(){return "Ученик: "+student+"\nАккаунт: "+loginLabel+" · "+schoolLabel;}
    public synchronized Stamp stamp(){return new Stamp(owner(),generation);}
    public synchronized boolean current(Stamp stamp){return stamp!=null&&!stamp.owner.isEmpty()&&stamp.generation==generation&&stamp.owner.equals(owner());}
    public synchronized void put(Stamp stamp,long date,List<ScheduleResolver.Event> data){if(current(stamp))days.put(ScheduleResolver.key(date),new ArrayList<>(data));}
    public synchronized List<ScheduleResolver.Event> get(long date){List<ScheduleResolver.Event> data=days.get(ScheduleResolver.key(date));return owner().isEmpty()||data==null?null:new ArrayList<>(data);}
    public synchronized Map<String,List<ScheduleResolver.Event>> snapshot(){return new HashMap<>(days);}
}
