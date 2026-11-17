package rk.schedule;

import java.util.*;
import rk.diary.PersonalHomeworkStore;
import rk.diary.PersonalHomeworkStore.Id;

public final class DiaryIsolationTest {
    static int checks;
    static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    static void rejected(Runnable action,String message){boolean failed=false;try{action.run();}catch(IllegalStateException e){failed=true;}check(failed,message);}
    public static void main(String[] args){
        long today=ScheduleResolver.date("2026-10-19"),nextWeek=ScheduleResolver.date("2026-10-26");
        DiaryContext context=new DiaryContext();check(context.owner().isEmpty(),"unknown owner");DiaryContext.Stamp unknown=context.stamp();
        context.put(unknown,today,Collections.emptyList());check(context.get(today)==null,"unknown owner cannot populate cache");
        context.account("school","login");context.student("one");DiaryContext.Stamp first=context.stamp();
        List<ScheduleResolver.Event> data=Collections.singletonList(new ScheduleResolver.Event("1","Математика",500,540,false,null,"Из дневника"));
        context.put(first,today,data);context.put(first,nextWeek,Collections.emptyList());check(context.get(today).size()==1,"week navigation preserves today");
        context.student("two");DiaryContext.Stamp second=context.stamp();check(!context.current(first)&&context.get(today)==null,"student switch clears cache and rejects previous response");
        context.put(first,today,data);check(context.get(today)==null,"late previous student result rejected before cache write");context.put(second,today,Collections.emptyList());check(context.get(today).isEmpty(),"new student empty day is authoritative");
        context.account("school","other");context.student("two");check(!context.current(second)&&context.get(today)==null,"account switch with same student ID");
        context.put(second,today,data);check(context.get(today)==null,"late previous account response rejected");context.account(null,null);check(context.owner().isEmpty(),"logout invalidates owner");
        context.account("school","login");context.student("one");check(context.owner().equals(first.owner)&&!context.current(first),"return to same owner keeps stable identity with new generation");
        DiaryContext collision=new DiaryContext();collision.account("schooll","ogin");collision.student("one");check(!collision.owner().equals(first.owner),"length-delimited account cannot collide");
        WeakIdentityMap<Object,String> identities=new WeakIdentityMap<>();Object equal1=new String("same"),equal2=new String("same");identities.put(equal1,"first");identities.put(equal2,"second");check(identities.get(equal1).equals("first")&&identities.get(equal2).equals("second"),"equal models keep independent occurrence identities");identities.clear();check(identities.get(equal1)==null,"bindings clear on owner switch");
        ScheduleStoreTest.Memory memory=new ScheduleStoreTest.Memory();PersonalHomeworkStore notes=new PersonalHomeworkStore(memory);
        Id math1=new Id(first.owner,today,"number:1","Математика"),math2=new Id(first.owner,today,"number:2","Математика"),otherStudent=new Id(second.owner,today,"number:1","Математика");
        notes.save(math1,"№ 1");notes.save(math2,"№ 2");notes.save(otherStudent,"№ 3");check(notes.get(math1).equals("№ 1")&&notes.get(math2).equals("№ 2")&&notes.get(otherStudent).equals("№ 3"),"same subject independent lessons and students");
        Id restarted=Id.parse(math1.key());check(new PersonalHomeworkStore(memory).get(restarted).equals("№ 1"),"identity survives app restart and does not contain calculated bell times");
        Id noNumber1=new Id(first.owner,today,"occurrence:1","Математика"),noNumber2=new Id(first.owner,today,"occurrence:2","Математика");check(!noNumber1.key().equals(noNumber2.key()),"unnumbered repeated subject identity");
        memory.getSharedPreferences("personal_homework",0).edit().putString("lesson:Математика|1792368000000","Архивный текст").commit();String legacyKey=notes.archive().keySet().iterator().next();
        check(notes.get(noNumber1).isEmpty(),"archive not applied automatically");String before=memory.getSharedPreferences(PersonalHomeworkStore.PREFS,0).getString("document","");notes.archive();check(memory.getSharedPreferences(PersonalHomeworkStore.PREFS,0).getString("document","").equals(before),"view or cancel archive does not modify notes");
        rejected(()->notes.transfer(math1,legacyKey,"№ 1",false),"existing note cannot be overwritten by import");check(!notes.imported(legacyKey),"cancelled overwrite leaves archive available");
        ScheduleStoreTest.Prefs prefs=memory.getSharedPreferences(PersonalHomeworkStore.PREFS,0);prefs.fail=true;rejected(()->notes.transfer(math1,legacyKey,"№ 1",true),"failed import reported");prefs.fail=false;check(!notes.imported(legacyKey)&&notes.get(math1).equals("№ 1"),"failed import preserves text and receipt");
        String imported=notes.transfer(math1,legacyKey,"№ 1",true);check(imported.equals("№ 1\n\nАрхивный текст"),"archive appends existing text");check(notes.imported(legacyKey),"receipt committed with note");check(notes.destination(legacyKey).key().equals(math1.key()),"receipt identifies destination while original stays readable");check(notes.archive().get(legacyKey).equals("Архивный текст"),"legacy original remains recoverable");
        rejected(()->notes.transfer(math2,legacyKey,"№ 2",true),"already imported record cannot be silently copied to another pupil or lesson");
        memory.getSharedPreferences("personal_homework",0).edit().putString("another","Без номера").commit();notes.transfer(noNumber1,"another","",false);check(notes.get(noNumber1).equals("Без номера"),"transfer into empty lesson");
        prefs.fail=true;rejected(()->notes.save(math1,"Lost"),"failed regular save reported");prefs.fail=false;check(notes.get(math1).equals(imported),"failed save preserves previous note");
        rejected(()->notes.save(new Id("",today,"number:1","Subject"),"x"),"unknown owner cannot save");
        System.out.println("Diary isolation/homework: "+checks+" checks passed.");
    }
}
