package rk.schedule;
import java.util.*;
public final class ScheduleResolverTest {
    static int checks;
    static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    static void invalid(Runnable r,String message){boolean failed=false;try{r.run();}catch(IllegalArgumentException expected){failed=true;}check(failed,message);}
    static ScheduleResolver.Event lesson(String n,int s,int e){return new ScheduleResolver.Event(n,"Lesson "+n,s,e,false,new Object(),"diary");}
    static int[][] slots(){int[][] out=new int[8][2];for(int[] row:out)Arrays.fill(row,-1);return out;}
    public static void main(String[] args){
        check(ScheduleResolver.countdown(486*60000L,false).equals("8 ч 6 мин"),"long wait uses hours");
        check(ScheduleResolver.countdown(60*60000L,true).equals("1 ч 0 мин"),"hour boundary");
        check(ScheduleResolver.countdown(5*60000L+9000,true).equals("05:09"),"break and lesson seconds");
        check(ScheduleResolver.countdown(59000,false).equals("< 1 мин"),"short wait");
        check(ScheduleResolver.countdown(-1000,true).equals("00:00"),"no negative countdown");
        check(ScheduleResolver.parse("08:30")==510,"clock parse");check(ScheduleResolver.parse(" 8:30 ")==510,"trim");
        for(String bad:new String[]{"24:00","12:60","8:3","oops","-1:20","", "10:00:00"})check(ScheduleResolver.parse(bad)==-1,"invalid "+bad);
        List<ScheduleResolver.Event> base=Arrays.asList(lesson("2",570,615),lesson("3",630,675));
        List<ScheduleResolver.Event> untimed=Arrays.asList(lesson("",-1,-1),lesson("1",-1,-1),lesson("2",570,615));
        List<ScheduleResolver.Event> known=ScheduleResolver.resolve(untimed,null,"diary",null,0);
        check(known.size()==1&&known.get(0).number.equals("2"),"untimed entry does not discard timed lessons");
        int[][] supplied=slots();supplied[0]=new int[]{510,555};known=ScheduleResolver.resolve(untimed,supplied,"custom",null,0);
        check(known.size()==2&&known.get(0).start==510,"custom bells supply missing diary times by number");
        check(untimed.get(1).start==-1,"missing baseline remains unchanged");
        check(ScheduleResolver.resolve(Arrays.asList(lesson("1",510,-1),lesson("2",570,615)),null,"diary",null,0).size()==1,"partial missing time ignored");
        int[][] slots=slots();slots[1]=new int[]{560,600};slots[2]=new int[]{615,650};ScheduleResolver.validateSlots(slots);
        List<ScheduleResolver.Event> result=ScheduleResolver.resolve(base,slots,"custom",null,0);
        check(result.get(0).start==560,"actual number, missing first lesson");check(result.get(1).start==615,"next number");check(base.get(0).start==570,"baseline immutable");check(result.get(0).source.equals("custom"),"source");
        slots[2]=new int[]{-1,-1};result=ScheduleResolver.resolve(base,slots,"custom",null,0);check(result.get(1).start==630,"blank inherits");
        int[][] broken=slots();broken[0]=new int[]{600,590};invalid(()->ScheduleResolver.validateSlots(broken),"reverse");broken[0]=new int[]{600,-1};invalid(()->ScheduleResolver.validateSlots(broken),"partial");broken[0]=new int[]{600,650};broken[1]=new int[]{640,680};invalid(()->ScheduleResolver.validateSlots(broken),"overlap");
        int[][] mixed=slots();mixed[1]=new int[]{600,645};invalid(()->ScheduleResolver.resolve(base,mixed,"custom",null,0),"inherited overlap");
        ScheduleResolver.Homeroom h=new ScheduleResolver.Homeroom();h.start=510;h.end=550;
        result=ScheduleResolver.resolve(base,null,"event",h,0);check(result.size()==3&&result.get(0).homeroom,"standalone");check(result.get(1).start==570,"standalone no shift");
        h.start=580;h.end=600;invalid(()->ScheduleResolver.resolve(base,null,"event",h,0),"standalone conflict");
        h.mode="replace";h.lesson=2;h.start=570;h.end=610;result=ScheduleResolver.resolve(base,null,"event",h,0);check(result.size()==2&&result.get(0).homeroom,"replace");check(base.get(0).original!=null,"homework source preserved");
        h.lesson=1;invalid(()->ScheduleResolver.resolve(base,null,"event",h,0),"missing replacement");
        h.mode="insert";h.lesson=2;h.start=0;h.end=20;result=ScheduleResolver.resolve(base,null,"event",h,0);check(result.get(0).start==570&&result.get(0).end==590,"insert boundary");check(result.get(1).start==590&&result.get(2).start==650,"insert shifts");check(result.get(2).start-result.get(1).end==15,"break preserved");
        result=ScheduleResolver.resolve(base,null,"diary",null,-5);check(result.get(0).start==565&&result.get(1).end==670,"manual negative");
        invalid(()->ScheduleResolver.resolve(base,null,"diary",null,1000),"day overflow");
        int[][] move=slots();move[0]=new int[]{510,555};move[1]=new int[]{565,610};ScheduleResolver.shiftFollowing(move,0,5);check(move[0][1]==555&&move[1][0]==570&&move[1][1]==615,"explicit shift");
        invalid(()->ScheduleResolver.shiftFollowing(move,0,1400),"shift overflow");check(move[1][0]==570,"failed shift atomic");
        long date=ScheduleBridgeDate.day(2026,10,18);check(ScheduleResolver.key(date).equals("2026-10-18"),"date key");check(ScheduleResolver.weekday(date)==Calendar.SUNDAY,"weekday");check(ScheduleResolver.minute(new Date(ScheduleResolver.instant(date,510)))==510,"date minutes");
        check(!ScheduleResolver.key(date).equals(ScheduleResolver.key(ScheduleBridgeDate.day(2026,10,19))),"midnight cache key");
        check(ScheduleResolver.resolve(Collections.emptyList(),null,"diary",null,0).isEmpty(),"empty day");
        System.out.println("Schedule resolver: "+checks+" checks passed.");
    }
    static final class ScheduleBridgeDate{static long day(int y,int m,int d){Calendar c=Calendar.getInstance();c.clear();c.set(y,m-1,d);return c.getTimeInMillis();}}
}
