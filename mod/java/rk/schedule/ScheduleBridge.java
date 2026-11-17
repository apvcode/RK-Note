package rk.schedule;

import android.app.*;
import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;

/** The only adapter to the version-specific, obfuscated base application. */
public final class ScheduleBridge {
    private static volatile Context app;
    private static WeakReference<View> root=new WeakReference<>(null);
    private static final DiaryContext owners=new DiaryContext();
    private static Object session;
    private static final ThreadLocal<DiaryContext.Stamp> mapping=new ThreadLocal<>();
    private static final WeakIdentityMap<Object,String> homeworkKeys=new WeakIdentityMap<>();
    private static final class Launch {final WeakReference<Object> presenter;final DiaryContext.Stamp stamp;Launch(Object p,DiaryContext.Stamp s){presenter=new WeakReference<>(p);stamp=s;}}
    private static final ThreadLocal<Launch> launching=new ThreadLocal<>();
    private static final Map<Object,DiaryContext.Stamp> callbacks=Collections.synchronizedMap(new WeakHashMap<>());
    public static DiaryContext.Stamp ownerStamp(){return owners.stamp();}
    public static boolean current(DiaryContext.Stamp stamp){return owners.current(stamp);}
    public static String ownerLabel(){return owners.label();}
    public static void saveHomework(DiaryContext.Stamp stamp,rk.diary.PersonalHomeworkStore notes,rk.diary.PersonalHomeworkStore.Id id,String value){synchronized(owners){requireOwner(stamp,id);notes.save(id,value);}}
    public static String transferHomework(DiaryContext.Stamp stamp,rk.diary.PersonalHomeworkStore notes,rk.diary.PersonalHomeworkStore.Id id,String archiveKey,String text,boolean append){synchronized(owners){requireOwner(stamp,id);return notes.transfer(id,archiveKey,text,append);}}
    private static void requireOwner(DiaryContext.Stamp stamp,rk.diary.PersonalHomeworkStore.Id id){if(!owners.current(stamp)||id==null||!stamp.owner.equals(id.owner))throw new IllegalStateException("Ученик изменился. Откройте урок заново");}
    public static String owner(){synchronized(owners){return owners.owner();}}
    public static boolean currentOwner(String owner){return owner!=null&&!owner.isEmpty()&&owner.equals(owner());}
    public static void sessionObserved(Object value){synchronized(owners){session=value;try{Object auth=value.getClass().getMethod("a").invoke(value);Object identity=value.getClass().getMethod("c").invoke(value);accountChanged(auth==null?null:identity);}catch(Exception e){accountChanged(null);log("Reading session owner",e);}}}
    public static void accountChanged(Object identity){synchronized(owners){try{String school=identity==null?null:(String)identity.getClass().getMethod("a").invoke(identity);String login=identity==null?null:(String)identity.getClass().getMethod("b").invoke(identity);if(owners.account(school,login))invalidateOwner();}catch(Exception e){if(owners.account(null,null))invalidateOwner();log("Reading account identity",e);}}}
    public static void authChanging(Object auth){if(auth==null)accountChanged(null);}
    public static void studentChanged(String student){synchronized(owners){if(owners.student(student))invalidateOwner();}}
    private static void invalidateOwner(){
        List<Object> oldPresenters; synchronized(presenters){oldPresenters=new ArrayList<>(presenters.keySet());}
        presenters.clear();homeworkKeys.clear();refreshEpoch++;lastActive="";
        Runnable clear=()->{for(Object p:oldPresenters)try{if(presenters.containsKey(p))continue;Object state=p.getClass().getMethod("getViewState").invoke(p);state.getClass().getMethod("U",int.class,List.class).invoke(state,-1,Collections.emptyList());}catch(Exception e){log("Clearing diary presentation",e);}for(Map.Entry<TextView,Row> row:new ArrayList<>(rows.entrySet()))if(!owners.current(row.getValue().stamp))rows.remove(row.getKey());rk.diary.DiaryUi.clearBindings();try{setManager("sLessons",Collections.emptyList());setManager("sCurrentActiveLessonNum","");setManager("sPrevAdjustedEnd",0L);setManager("sPrevOrigEnd",0L);setManager("sLastUiTitle","");View container=(View)manager("sContainer");if(container!=null)container.setVisibility(View.GONE);}catch(Exception e){log("Clearing diary owner",e);}if(!owner().isEmpty()&&diary(System.currentTimeMillis())!=null)tick();};
        if(Looper.myLooper()==Looper.getMainLooper())clear.run();else new Handler(Looper.getMainLooper()).post(clear);
    }
    public static void beginRequest(Object presenter){synchronized(owners){
        if(session!=null)sessionObserved(session);
        try{studentChanged((String)field(field(field(presenter,"e"),"b"),"a"));}catch(Exception e){studentChanged(null);log("Reading selected student",e);}
        launching.set(new Launch(presenter,owners.stamp()));
    }}
    public static void endRequest(){launching.remove();}
    public static void requestCallback(Object callback,Object presenter){synchronized(owners){Launch launch=launching.get();callbacks.put(callback,launch!=null&&launch.presenter.get()==presenter?launch.stamp:null);}}
    public static boolean enterCallback(Object callback){synchronized(owners){DiaryContext.Stamp stamp=callbacks.get(callback);mapping.set(stamp);return owners.current(stamp);}}
    public static String homeworkKey(Object model){synchronized(owners){String key=homeworkKeys.get(model);rk.diary.PersonalHomeworkStore.Id id=rk.diary.PersonalHomeworkStore.Id.parse(key);return id!=null&&currentOwner(id.owner)?key:null;}}
    public static void homeworkModel(Object model,Object lesson){synchronized(owners){if(owners.current(mapping.get())){String key=homeworkKeys.get(lesson);if(key!=null)homeworkKeys.put(model,key);}}}
    private static String lessonKey(DiaryContext.Stamp stamp,long day,Object lesson,Map<String,Integer> occurrences)throws Exception{
        String title=(String)field(lesson,"c"),number=(String)field(lesson,"d");int ordinal=occurrences.containsKey(title)?occurrences.get(title)+1:1;occurrences.put(title,ordinal);
        return new rk.diary.PersonalHomeworkStore.Id(stamp.owner,day,number==null||number.trim().isEmpty()?"occurrence:"+ordinal:"number:"+number,title).key();
    }
    private static final Map<Object,Boolean> presenters=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<TextView,Row> rows=new WeakHashMap<>();
    private static String lastActive="";
    private static volatile ScheduleStore store;
    private static String lastProblem="";
    private static int refreshEpoch;
    private static final java.util.concurrent.ExecutorService mapperWorker=java.util.concurrent.Executors.newSingleThreadExecutor();
    private static class Row {WeakReference<TextView> number;String slot,original,source="Из дневника";long day;final DiaryContext.Stamp stamp;boolean styled,active;int accent;Row(TextView n,String s,String o,long d){stamp=owners.stamp();number=new WeakReference<>(n);slot=s;original=o;day=d;try{for(ScheduleResolver.Event e:resolve(store(app),d,diary(d),true))if(e.number.equals(s))source=e.source;}catch(Exception e){log("Reading row source",e);}}}
    static Object field(Object o,String n)throws Exception{return o.getClass().getField(n).get(o);}
    static Object manager(String n)throws Exception{return Class.forName("c7.LessonCountdownManager").getField(n).get(null);}
    static void setManager(String n,Object v)throws Exception{Class.forName("c7.LessonCountdownManager").getField(n).set(null,v);}
    public static void init(Context c){app=c.getApplicationContext();}
    public static void attach(View view){if(view==null)return;app=view.getContext().getApplicationContext();root=new WeakReference<>(view);refresh();}
    public static Context context(){return app;}
    public static synchronized ScheduleStore store(Context c){if(store==null)store=ScheduleStore.load(c);return store;}
    static void log(String m,Throwable e){Log.e("RKSchedule",m,e);}
    public static void capture(Object presenter,List<?> data){synchronized(owners){DiaryContext.Stamp stamp=mapping.get();if(!owners.current(stamp))return;presenters.put(presenter,Boolean.TRUE);captureDays(data,stamp);}}
    private static void captureDays(List<?> data,DiaryContext.Stamp stamp){
        if(data==null)return;
        for(Object d:data)try{
            Date date=(Date)field(d,"a");Object value=field(d,"e");if(!(value instanceof List))continue;
            List<ScheduleResolver.Event> list=new ArrayList<>();Map<String,Integer> occurrences=new HashMap<>();
            for(Object lesson:(List<?>)value){if(!lesson.getClass().getName().equals("la.h"))continue;homeworkKeys.put(lesson,lessonKey(stamp,date.getTime(),lesson,occurrences));list.add(new ScheduleResolver.Event((String)field(lesson,"d"),(String)field(lesson,"c"),lessonMinute(lesson,"e"),lessonMinute(lesson,"f"),false,lesson,"Из дневника"));}
            owners.put(stamp,date.getTime(),list);
        }catch(Exception e){log("Reading diary day",e);}
    }
    private static int lessonMinute(Object lesson,String name)throws Exception{Date value=(Date)field(lesson,name);return value==null?-1:ScheduleResolver.minute(value);}
    public static List<ScheduleResolver.Event> diary(long day){return owners.get(day);}
    public static int shift(Context c,long day){Integer v=store(c).corrections.get(ScheduleResolver.key(day));return v==null?0:v;}
    public static void clearShift(Context c){ScheduleStore next=store(c).copy();next.corrections.clear();next.save(c);store=next;c.getSharedPreferences("manual_bell_correction",0).edit().clear().apply();}
    public static void resetCorrection(Context c){try{clearShift(c);refresh();}catch(Exception e){Toast.makeText(c,e.getMessage(),Toast.LENGTH_LONG).show();}}
    public static List<ScheduleResolver.Event> resolve(ScheduleStore s,long day,List<ScheduleResolver.Event> baseline,boolean correction){ScheduleStore.Profile p=s.active(day);return ScheduleResolver.resolve(baseline==null?Collections.emptyList():baseline,p==null?null:p.slots,s.source(day),s.homeroom(day),correction&&s.corrections.containsKey(ScheduleResolver.key(day))?s.corrections.get(ScheduleResolver.key(day)):0);}
    public static boolean skipEmpty(Object day,boolean empty){
        if(!empty||app==null)return empty;try{long date=((Date)field(day,"a")).getTime();ScheduleResolver.Homeroom h=store(app).homeroom(date);return h==null||!h.mode.equals("separate");}catch(Exception e){log("Empty diary day",e);return empty;}
    }
    public static String dayType(String type,Date date){if(app!=null){ScheduleResolver.Homeroom h=store(app).homeroom(date.getTime());if(h!=null&&h.mode.equals("separate"))return "study";}return type;}
    public static Object displayLessons(Object input,Date date){synchronized(owners){
        DiaryContext.Stamp stamp=mapping.get();if(!owners.current(stamp))return Collections.emptyList();
        if(app==null || !(input instanceof List))return input;
        try{
            long day=date.getTime();List<ScheduleResolver.Event> base=new ArrayList<>();
            for(Object lesson:(List<?>)input)base.add(new ScheduleResolver.Event((String)field(lesson,"d"),(String)field(lesson,"c"),lessonMinute(lesson,"e"),lessonMinute(lesson,"f"),false,lesson,"Из дневника"));
            owners.put(stamp,day,base);
            List<ScheduleResolver.Event> events=resolve(store(app),day,base,true);List<Object> output=new ArrayList<>();
            Constructor<?> ctor=Class.forName("la.h").getConstructors()[0];
            for(ScheduleResolver.Event e:events){Object o=e.original;Object rendered=ctor.newInstance(o==null?Collections.emptyList():field(o,"a"),o==null?Collections.emptyList():field(o,"b"),e.title,e.number,new Date(ScheduleResolver.instant(day,e.start)),new Date(ScheduleResolver.instant(day,e.end)),o==null?"":field(o,"g"),e.start,o==null?null:field(o,"i"));synchronized(owners){if(!owners.current(stamp))return Collections.emptyList();String key=o==null?new rk.diary.PersonalHomeworkStore.Id(stamp.owner,day,"homeroom",e.title).key():homeworkKeys.get(o);if(key!=null)homeworkKeys.put(rendered,key);}output.add(rendered);}
            // Untimed diary entries (for example the class heading) still belong in the diary.
            ScheduleStore.Profile profile=store(app).active(day);
            int index=0;for(ScheduleResolver.Event original:base){
                int n=ScheduleResolver.number(original.number)-1;
                boolean supplied=profile!=null&&n>=0&&n<profile.slots.length&&profile.slots[n][0]>=0;
                if((original.start<0||original.end<0)&&!supplied)output.add(original.original);
                index++;
            }
            return output;
        }catch(Exception e){log("Rendering schedule; keeping original diary",e);return owners.current(stamp)?input:Collections.emptyList();}
    }}
    public static void bind(TextView number,TextView time,String slot,String original,String date){
        long day=Long.parseLong(date);
        app=time.getContext().getApplicationContext();rows.put(time,new Row(number,slot,original,day));paint(time,rows.get(time));
        time.setOnClickListener(v->ScheduleEditor.show(v.getContext(),day));
    }
    private static String source(long day){try{return store(app).source(day);}catch(Exception e){return "Ошибка настроек";}}
    private static void paint(TextView time,Row row){
        boolean active=!lastActive.isEmpty()&&ScheduleResolver.key(row.day).equals(ScheduleResolver.key(System.currentTimeMillis()))&&lastActive.equals(row.slot);
        String value=(active?"Сейчас · ":"")+row.original;if(!value.contentEquals(time.getText()))time.setText(value);
        int accent=themeColor(time.getContext(),"getAccentColor",0xff0a84ff);Context c=time.getContext();int muted=textColor(c)==0xff17202c?0xff647084:0xffa0a7b4;
        if(!row.styled||row.active!=active||row.accent!=accent){time.setBackground(ScheduleUi.shape(c,active?(accent&0xffffff)|0x1a000000:themeColor(c,"getThemeSurfaceColor",0xff171722),8));ScheduleUi.press(time,accent);row.styled=true;row.active=active;row.accent=accent;}
        time.setTextColor(active?accent:muted);time.setContentDescription(value+". "+row.source);TextView number=row.number.get();if(number!=null)number.setTextColor(active?accent:muted);

    }
    public static int themeColor(Context c,String method,int fallback){try{return (Integer)Class.forName("c7.ThemeManager").getMethod(method,Context.class).invoke(null,c);}catch(Exception e){return fallback;}}
    public static int textColor(Context c){int bg=themeColor(c,"getThemeBackgroundColor",0xff101218);return (0.299*((bg>>16)&255)+0.587*((bg>>8)&255)+0.114*(bg&255))>160?0xff17202c:0xfff3f5fa;}
    private static void ui(String icon,String title,String timer){try{View container=(View)manager("sContainer");if(container==null)return;container.setVisibility(View.VISIBLE);java.lang.reflect.Method method=Class.forName("c7.LessonCountdownManager").getDeclaredMethod("setUi",String.class,String.class,int.class,int.class,String.class);method.setAccessible(true);Context c=container.getContext();int background=c.getResources().getIdentifier((icon.equals("🔔")||icon.equals("⏸️"))?"bg_timer_badge_break":"bg_timer_badge_lesson","drawable",c.getPackageName());method.invoke(null,icon,title,background,(icon.equals("🔔")||icon.equals("⏸️"))?0xffffb300:0xff00e676,timer);}catch(Exception e){log("Updating countdown",e);}}
    private static String lessonTitle(ScheduleResolver.Event event){
        String title=(event.number==null||event.number.isEmpty()?"":event.number+" урок: ")+event.title;
        try{Object room=event.original==null?null:field(event.original,"i");String name=room==null?null:(String)field(room,"b");if(name!=null&&!name.isEmpty())title+=" ("+(name.startsWith("каб. ")||name.startsWith("Каб. ")?"":"каб. ")+name+")";}catch(Exception e){log("Reading lesson room",e);}return title;
    }
    public static void requestTick(){new Handler(Looper.getMainLooper()).post(ScheduleBridge::tick);}
    public static void tick(){synchronized(owners){
        try{
            View container=(View)manager("sContainer");if(container==null)return;
            if(owner().isEmpty()){container.setVisibility(View.GONE);return;}if(app==null)app=container.getContext().getApplicationContext();
            long now=System.currentTimeMillis();List<ScheduleResolver.Event> baseline=diary(now);lastActive="";
            if(baseline==null&&(store(app).homeroom(now)==null||!store(app).homeroom(now).mode.equals("separate"))){setManager("sLessons",Collections.emptyList());int dow=ScheduleResolver.weekday(now);if(dow==Calendar.SATURDAY||dow==Calendar.SUNDAY)Class.forName("c7.LessonCountdownManager").getMethod("showWeekendOrRelaxUi").invoke(null);else container.setVisibility(View.GONE);}
            else{
                List<ScheduleResolver.Event> events=resolve(store(app),now,baseline,true);ScheduleResolver.Event current=null,next=null;
                for(ScheduleResolver.Event e:events){long start=ScheduleResolver.instant(now,e.start),end=ScheduleResolver.instant(now,e.end);if(now>=start&&now<end){current=e;break;}if(start>now){next=e;break;}}
                if(current!=null){lastActive=current.number;long seconds=(ScheduleResolver.instant(now,current.end)-now+999)/1000;ui(current.homeroom?"🏫":"🟢",current.homeroom?"Классный час • идёт":lessonTitle(current),ScheduleResolver.countdown(seconds*1000,true));}
                else if(next!=null){boolean past=false;for(ScheduleResolver.Event e:events)if(ScheduleResolver.instant(now,e.end)<=now)past=true;long remaining=ScheduleResolver.instant(now,next.start)-now;ui(past?"⏸️":"🔔",(past?"Перемена • След: ":"Следующий урок: ")+next.title,ScheduleResolver.countdown(remaining,past));}
                else if(events.isEmpty())Class.forName("c7.LessonCountdownManager").getMethod("showWeekendOrRelaxUi").invoke(null);else ui("✨","Все уроки завершены","Отдыхай!");
            }
            setManager("sCurrentActiveLessonNum",lastActive);
            for(Map.Entry<TextView,Row> e:new ArrayList<>(rows.entrySet()))if(e.getKey()!=null)paint(e.getKey(),e.getValue());
        }catch(Exception e){lastActive="";try{setManager("sCurrentActiveLessonNum","");for(Map.Entry<TextView,Row> row:new ArrayList<>(rows.entrySet()))paint(row.getKey(),row.getValue());}catch(Exception ignored){}ui("!","Проверьте расписание",e.getMessage()==null?"Ошибка настроек":e.getMessage());if(!String.valueOf(e.getMessage()).equals(lastProblem)){log("Schedule calculation",e);lastProblem=String.valueOf(e.getMessage());}}
        rk.diary.DiaryUi.tick();
    }}
    public static void validate(ScheduleStore candidate){
        for(ScheduleStore.Profile p:candidate.profiles.values())ScheduleResolver.validateSlots(p.slots);
        synchronized(owners){for(Map.Entry<String,List<ScheduleResolver.Event>> entry:owners.snapshot().entrySet()){long date=parseDate(entry.getKey());resolve(candidate,date,entry.getValue(),true);}}
    }
    public static long parseDate(String key){return ScheduleResolver.date(key);}
    public static void commit(Context c,ScheduleStore draft){ScheduleStore candidate=draft.copy();validate(candidate);candidate.save(c);store=candidate;refresh();}
    public static void refresh(){
        final DiaryContext.Stamp stamp=owners.stamp();
        new Handler(Looper.getMainLooper()).post(()->{
            if(!owners.current(stamp))return;
            View host=root.get();
            List<Object[]> positions=new ArrayList<>();if(host!=null)capturePositions(host,positions);
            List<Object> list; synchronized(presenters){list=new ArrayList<>(presenters.keySet());}
            int epoch=++refreshEpoch;List<Object[]> inputs=new ArrayList<>();
            for(Object p:list)try{Object data=field(p,"h");if(data instanceof List)inputs.add(new Object[]{p,data});}catch(Exception e){log("Reading diary presentation",e);}
            // The stock mapper reads Room, so it must run on a worker, like the original pipeline.
            mapperWorker.execute(()->{
                List<Object[]> mappedItems=new ArrayList<>();
                for(Object[] input:inputs)try{
                    Object p=input[0];Object wrapped=Class.forName("la.e").getConstructor(Object.class,Throwable.class).newInstance(input[1],null);
                    Class<?> callback=Class.forName("h6.a");Object mapper=callback.getConstructor(p.getClass(),int.class).newInstance(p,0);
                    synchronized(owners){callbacks.put(mapper,stamp);}
                    if(!owners.current(stamp))return;
                    Object mapped=callback.getMethod("invoke",Object.class).invoke(mapper,wrapped);mappedItems.add(new Object[]{p,field(mapped,"a")});
                }catch(Exception e){log("Refreshing diary presentation",e);}
                new Handler(Looper.getMainLooper()).post(()->{
                    if(!owners.current(stamp)||epoch!=refreshEpoch||root.get()!=host)return;
                    for(Object[] item:mappedItems)try{Object state=item[0].getClass().getMethod("getViewState").invoke(item[0]);state.getClass().getMethod("U",int.class,List.class).invoke(state,-1,item[1]);}catch(Exception e){log("Applying diary presentation",e);}
                    if(host!=null)host.post(()->{if(!owners.current(stamp)||epoch!=refreshEpoch||root.get()!=host)return;for(Object[] position:positions)try{position[0].getClass().getMethod("onRestoreInstanceState",android.os.Parcelable.class).invoke(position[0],position[1]);}catch(Exception e){log("Restoring diary position",e);}});
                    tick();
                });
            });
            tick();
        });
    }
    private static void capturePositions(View view,List<Object[]> out){
        if(view.getClass().getName().equals("androidx.recyclerview.widget.RecyclerView"))try{Object manager=view.getClass().getMethod("getLayoutManager").invoke(view);if(manager!=null){Object saved=manager.getClass().getMethod("onSaveInstanceState").invoke(manager);out.add(new Object[]{manager,saved});}}catch(Exception e){log("Saving diary position",e);}
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)capturePositions(((ViewGroup)view).getChildAt(i),out);
    }
    public static long start(Context c,String number,long diaryStart,long diaryEnd){return boundary(c,number,diaryStart,diaryEnd,false);}
    public static long end(Context c,String number,long diaryStart,long diaryEnd){return boundary(c,number,diaryStart,diaryEnd,true);}
    private static long boundary(Context c,String number,long start,long end,boolean returnEnd){
        try{long now=System.currentTimeMillis();List<ScheduleResolver.Event> base=diary(now);if(base==null)base=Collections.singletonList(new ScheduleResolver.Event(number,"Урок",ScheduleResolver.minute(new Date(start)),ScheduleResolver.minute(new Date(end)),false,null,"Из дневника"));
            for(ScheduleResolver.Event e:resolve(store(c),now,base,false))if(e.number.equals(number))return ScheduleResolver.instant(now,returnEnd?e.end:e.start);
        }catch(Exception e){log("Resolving manual correction boundary",e);}return returnEnd?end:start;
    }
    public static void open(Context c){app=c.getApplicationContext();ScheduleEditor.show(c,System.currentTimeMillis());}
    public static void reset(Context c){new AlertDialog.Builder(c).setTitle("Сбросить расписание?").setMessage("Профили, назначения, классные часы и ручная поправка будут удалены. Исходный дневник сохранится.").setNegativeButton("Отмена",null).setPositiveButton("Сбросить",(d,w)->{try{ScheduleStore empty=new ScheduleStore();empty.save(c);store=empty;clearShift(c);refresh();}catch(Exception e){Toast.makeText(c,e.getMessage(),Toast.LENGTH_LONG).show();}}).show();}
}
