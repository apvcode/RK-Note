package rk.schedule;

import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import rk.diary.*;

/** Runs in a standalone shell process: no APK installation, app launch, or user data access. */
public final class AndroidRegression {
    static int checks;
    static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    public static final class Identity {final String login;Identity(String login){this.login=login;}public String a(){return "test-school";}public String b(){return login;}}
    public static final class Session {public Identity identity=new Identity("first");public Object a(){return this;}public Identity c(){return identity;}}
    public static final class Student {public String a="one";}
    public static final class Repository {public Student b=new Student();}
    public static final class State {public List<?> data;public void U(int index,List<?> value){data=value;}}
    public static final class Presenter {public Repository e=new Repository();public List<?> h;public State state=new State();public State getViewState(){return state;}}
    static Context context(File directory)throws Exception{
        Class<?> activityThread=Class.forName("android.app.ActivityThread");Object thread=activityThread.getMethod("systemMain").invoke(null);Context system=(Context)activityThread.getMethod("getSystemContext").invoke(thread);
        Constructor<?> ctor=Class.forName("android.app.SharedPreferencesImpl").getDeclaredConstructor(File.class,int.class);ctor.setAccessible(true);
        return new ContextWrapper(system){@Override public Context getApplicationContext(){return this;}final Map<String,SharedPreferences> files=new HashMap<>();@Override public SharedPreferences getSharedPreferences(String name,int mode){try{if(!files.containsKey(name))files.put(name,(SharedPreferences)ctor.newInstance(new File(directory,name+".xml"),0));return files.get(name);}catch(Exception e){throw new IllegalStateException(e);}}};
    }
    static Object start(Presenter p){ScheduleBridge.beginRequest(p);Object callback=new Object();ScheduleBridge.requestCallback(callback,p);ScheduleBridge.endRequest();return callback;}
    static List<la.h> lessons(long day){return Arrays.asList(new la.h(Collections.emptyList(),Collections.emptyList(),"Математика","1",new Date(ScheduleResolver.instant(day,500)),new Date(ScheduleResolver.instant(day,540)),"",500,null),new la.h(Collections.emptyList(),Collections.emptyList(),"Математика","2",new Date(ScheduleResolver.instant(day,550)),new Date(ScheduleResolver.instant(day,590)),"",550,null));}
    static void capture(Presenter p,Object callback,long day,List<la.h> lessons){check(ScheduleBridge.enterCallback(callback),"current callback accepted");ScheduleBridge.capture(p,Collections.singletonList(new la.f(day,lessons)));}
    static FrameLayout card(Context c){FrameLayout root=new FrameLayout(c);LinearLayout panel=new LinearLayout(c);TextView note=new TextView(c);note.setTag("rk_personal_homework");panel.addView(note);root.addView(panel);TextView button=new TextView(c);button.setTag("rk_diary_add_homework");root.addView(button);return root;}
    public static void main(String[] args)throws Exception{
        Looper.prepareMainLooper();File directory=new File(args[0]);directory.mkdirs();Context c=context(directory);ScheduleBridge.init(c);new ScheduleStore().save(c);
        Session session=new Session();ScheduleBridge.sessionObserved(session);Presenter p=new Presenter();long day=System.currentTimeMillis();List<la.h> lessons=lessons(day);Object first=start(p);capture(p,first,day,lessons);
        List<?> rendered=(List<?>)ScheduleBridge.displayLessons(lessons,new Date(day));Object model1=new Object(),model2=new Object();ScheduleBridge.homeworkModel(model1,rendered.get(0));ScheduleBridge.homeworkModel(model2,rendered.get(1));String key1=ScheduleBridge.homeworkKey(model1),key2=ScheduleBridge.homeworkKey(model2);check(key1!=null&&!key1.equals(key2),"transformed repeated lessons retain original IDs");
        PersonalHomeworkStore notes=new PersonalHomeworkStore(c);PersonalHomeworkStore.Id id1=PersonalHomeworkStore.Id.parse(key1),id2=PersonalHomeworkStore.Id.parse(key2);DiaryContext.Stamp stamp=ScheduleBridge.ownerStamp();ScheduleBridge.saveHomework(stamp,notes,id1,"Первое ДЗ");ScheduleBridge.saveHomework(stamp,notes,id2,"Второе ДЗ");
        ScheduleStore schedule=ScheduleBridge.store(c).copy();ScheduleStore.Profile bells=new ScheduleStore.Profile("changed","Другие звонки");bells.slots[0]=new int[]{505,545};bells.slots[1]=new int[]{555,595};schedule.profiles.put(bells.id,bells);schedule.assignDate(day,bells.id);schedule.corrections.put(ScheduleResolver.key(day),7);ScheduleBridge.commit(c,schedule);check(ScheduleBridge.shift(c,day)==7,"actual commit preserves correction entered after assignment");
        check(ScheduleBridge.enterCallback(first),"profile editing keeps owner context");List<?> changed=(List<?>)ScheduleBridge.displayLessons(lessons,new Date(day));Object changedModel=new Object();ScheduleBridge.homeworkModel(changedModel,changed.get(0));check(ScheduleBridge.homeworkKey(changedModel).equals(key1),"bell change and correction preserve homework key");
        FrameLayout card=card(c);DiaryUi.bindHomework(card,"Математика",String.valueOf(day),key1);TextView note=(TextView)card.findViewWithTag("rk_personal_homework");check(note.getText().toString().contains("Первое ДЗ"),"card renders first lesson note");DiaryUi.bindHomework(card,"Математика",String.valueOf(day),key2);check(note.getText().toString().contains("Второе ДЗ")&&!note.getText().toString().contains("Первое"),"recycled card binds second lesson note");
        c7.LessonCountdownManager.sContainer=new View(c);ScheduleBridge.tick();check(c7.LessonCountdownManager.sContainer.getVisibility()==View.VISIBLE,"known owner timer renders");
        long next=day+7*86400000L;capture(p,first,next,Collections.emptyList());check(ScheduleBridge.diary(day).size()==2,"week navigation retains today on Android");
        p.e.b.a="two";ScheduleBridge.studentChanged("two");check(ScheduleBridge.diary(day)==null,"student change clears Android cache");check(c7.LessonCountdownManager.sContainer.getVisibility()==View.GONE,"old timer hidden immediately");check(note.getText().length()==0,"old card note cleared");check(ScheduleBridge.homeworkKey(model1)==null,"old model binding cleared");check(!ScheduleBridge.enterCallback(first),"late student response rejected");ScheduleBridge.capture(p,Collections.singletonList(new la.f(day,lessons)));check(ScheduleBridge.diary(day)==null,"late capture cannot populate new owner cache");
        Object second=start(p);capture(p,second,day,Collections.emptyList());check(ScheduleBridge.diary(day).isEmpty(),"new student empty response preserved");
        boolean failed=false;try{ScheduleBridge.saveHomework(stamp,notes,id1,"Недопустимо");}catch(IllegalStateException expected){failed=true;}check(failed&&notes.get(id1).equals("Первое ДЗ"),"open editor save blocked after student switch");
        session.identity=new Identity("other");ScheduleBridge.accountChanged(session.identity);Object third=start(p);check(!ScheduleBridge.enterCallback(second),"late account response rejected");check(ScheduleBridge.diary(day)==null,"new account has no old cache");
        capture(p,third,day,Collections.emptyList());ScheduleBridge.authChanging(null);check(ScheduleBridge.owner().isEmpty()&&!ScheduleBridge.enterCallback(third),"logout blocks old request and timer");
        // Verify original occurrence order survives transformations and equal object values.
        session.identity=new Identity("first");ScheduleBridge.sessionObserved(session);p.e.b.a="one";Object fourth=start(p);List<la.h> repeated=Arrays.asList(new la.h(Collections.emptyList(),Collections.emptyList(),"Математика","",new Date(ScheduleResolver.instant(day,600)),new Date(ScheduleResolver.instant(day,620)),"",600,null),new la.h(Collections.emptyList(),Collections.emptyList(),"Математика","",new Date(ScheduleResolver.instant(day,630)),new Date(ScheduleResolver.instant(day,650)),"",630,null));capture(p,fourth,day,repeated);List<?> mapped=(List<?>)ScheduleBridge.displayLessons(repeated,new Date(day));Object a=new String("equal"),b=new String("equal");ScheduleBridge.homeworkModel(a,mapped.get(0));ScheduleBridge.homeworkModel(b,mapped.get(1));check(!ScheduleBridge.homeworkKey(a).equals(ScheduleBridge.homeworkKey(b)),"unnumbered equal UI models retain original occurrence");
        // Real Android SharedPreferences persistence and atomic archive import document.
        c.getSharedPreferences("personal_homework",0).edit().putString("legacy","Старый текст").commit();String imported=notes.transfer(id1,"legacy","Первое ДЗ",true);check(imported.contains("Старый текст")&&notes.imported("legacy")&&notes.archive().get("legacy").equals("Старый текст"),"real preferences archive import preserves original");
        Field files=c.getClass().getDeclaredField("files");files.setAccessible(true);((Map<?,?>)files.get(c)).clear();check(new PersonalHomeworkStore(c).get(id1).equals(imported),"fresh Android preferences instance reloads note from disk");
        ScheduleBridge.beginRequest(p);Thread newer=new Thread(()->{p.e.b.a="two";ScheduleBridge.studentChanged("two");Object newCallback=start(p);check(ScheduleBridge.enterCallback(newCallback),"concurrent new request gets new owner");});newer.start();newer.join();Object oldLaunch=new Object();ScheduleBridge.requestCallback(oldLaunch,p);ScheduleBridge.endRequest();check(!ScheduleBridge.enterCallback(oldLaunch),"callback constructed late retains its launch generation");
        System.out.println("Android runtime regression: "+checks+" checks passed.");System.exit(0);
    }
}
