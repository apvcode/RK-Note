package rk.schedule;

import android.app.*;
import android.content.*;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.text.*;
import android.view.*;
import android.widget.*;
import java.util.*;

/** A transactional editor: only Apply changes the application's active schedule. */
public final class ScheduleEditor extends Dialog {
    private final Context c;
    private final ScheduleStore original;
    private ScheduleStore draft;
    private String selected;
    private long day;
    private LinearLayout screen,content,header,footer;
    private View sheet;
    private final EditText[][] fields=new EditText[8][2];
    private final TextView[] details=new TextView[8];
    private final TextView[][] timeLabels=new TextView[8][2];
    private final int[] shiftOrigin=new int[8];
    private TextView preview,problem,summary;
    private Button apply;
    private boolean rendering;
    private int text,bg,surface,accent;
    private static final String[] DAYS={"Воскресенье","Понедельник","Вторник","Среда","Четверг","Пятница","Суббота"};
    public static void show(Context c,long day){try{new ScheduleEditor(c,day).show();}catch(Exception e){ScheduleBridge.log("Opening editor",e);Toast.makeText(c,e.getMessage(),Toast.LENGTH_LONG).show();}}
    private ScheduleEditor(Context c,long day){super(c);this.c=c;this.day=day;original=ScheduleBridge.store(c).copy();draft=original.copy();ScheduleStore.Profile p=draft.active(day);selected=p==null?(draft.profiles.isEmpty()?null:draft.profiles.keySet().iterator().next()):p.id;}
    @Override protected void onCreate(Bundle state){super.onCreate(state);requestWindowFeature(Window.FEATURE_NO_TITLE);setCanceledOnTouchOutside(false);setOnCancelListener(d->askClose());render();}
    @Override public void onBackPressed(){askClose();}
    @Override public void show(){super.show();Window w=getWindow();if(w!=null){android.util.DisplayMetrics m=c.getResources().getDisplayMetrics();w.setLayout(Math.min(m.widthPixels-dp(20),dp(460)),Math.min(dp(640),(int)(m.heightPixels*0.72f)));w.setGravity(Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);WindowManager.LayoutParams a=w.getAttributes();a.y=dp(10);a.dimAmount=0.45f;w.setAttributes(a);w.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);w.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);w.setBackgroundDrawableResource(android.R.color.transparent);ScheduleUi.window(this);if(sheet!=null)ScheduleUi.enter(sheet,0,true);}}
    private Context dialogContext(){return new android.view.ContextThemeWrapper(c,ScheduleBridge.textColor(c)==0xff17202c?android.R.style.Theme_Material_Light_Dialog_Alert:android.R.style.Theme_Material_Dialog_Alert);}
    private View form(LinearLayout value){ScrollView scroll=new ScrollView(dialogContext());value.setPadding(dp(16),dp(8),dp(16),dp(8));scroll.addView(value);return scroll;}
    private int dp(float value){return Math.round(value*c.getResources().getDisplayMetrics().density);}
    private GradientDrawable panel(int color){GradientDrawable d=new GradientDrawable();d.setColor(color);d.setCornerRadius(dp(16));return d;}
    private TextView label(String value,int size){TextView t=new TextView(c);t.setText(value);t.setTextColor(text);t.setTextSize(size);t.setPadding(dp(8),dp(6),dp(8),dp(6));return t;}
    private Button button(String value,Runnable action){Button b=new Button(dialogContext());b.setBackground(panel(surface));b.setText(value);b.setAllCaps(false);b.setTextColor(accent);b.setMinHeight(dp(44));b.setMinimumWidth(0);b.setMinWidth(0);b.setPadding(dp(12),0,dp(12),0);b.setTextSize(14);b.setOnClickListener(v->action.run());ScheduleUi.press(b,accent);return b;}
    private LinearLayout column(){LinearLayout v=new LinearLayout(c);v.setOrientation(1);return v;}
    private LinearLayout row(){LinearLayout v=new LinearLayout(c);v.setOrientation(0);v.setGravity(Gravity.CENTER_VERTICAL);return v;}
    private void weighted(LinearLayout parent,View child){parent.addView(child,new LinearLayout.LayoutParams(0,-2,1));}
    private ScheduleStore.Profile profile(){return draft.profiles.get(selected);}
    private int mix(int a,int b,float f){return Color.rgb((int)(Color.red(a)*(1-f)+Color.red(b)*f),(int)(Color.green(a)*(1-f)+Color.green(b)*f),(int)(Color.blue(a)*(1-f)+Color.blue(b)*f));}
    private String shortDate(){return ScheduleResolver.key(day).equals(ScheduleResolver.key(System.currentTimeMillis()))?"Сегодня":new java.text.SimpleDateFormat("d MMM",new Locale("ru")).format(new Date(day));}
    private TextView action(String value,Runnable run){TextView v=label(value,14);v.setTextColor(accent);v.setGravity(Gravity.CENTER);v.setMinHeight(dp(44));v.setOnClickListener(x->run.run());ScheduleUi.press(v,accent);return v;}
    private void render(){
        rendering=true;text=ScheduleBridge.textColor(c);bg=ScheduleBridge.themeColor(c,"getThemeBackgroundColor",0xff101218);surface=ScheduleBridge.themeColor(c,"getThemeSurfaceColor",0xff20232b);accent=ScheduleBridge.themeColor(c,"getAccentColor",0xff0a84ff);if(surface==bg)surface=mix(bg,text,0.055f);
        Arrays.fill(details,null);for(TextView[] labels:timeLabels)Arrays.fill(labels,null);
        screen=column();screen.setPadding(dp(16),dp(10),dp(16),dp(12));GradientDrawable shell=panel(surface);shell.setCornerRadius(dp(26));screen.setBackground(shell);sheet=glass(screen);setContentView(sheet);
        View handle=new View(c);handle.setBackground(panel(mix(surface,text,0.25f)));LinearLayout.LayoutParams grip=new LinearLayout.LayoutParams(dp(32),dp(4));grip.gravity=Gravity.CENTER_HORIZONTAL;grip.bottomMargin=dp(10);screen.addView(handle,grip);
        header=column();screen.addView(header);
        LinearLayout title=row();TextView heading=label("Звонки",22);heading.setTypeface(null,android.graphics.Typeface.BOLD);weighted(title,heading);title.addView(action("•••",this::more),new LinearLayout.LayoutParams(dp(44),dp(44)));title.addView(action("×",this::askClose),new LinearLayout.LayoutParams(dp(40),dp(44)));header.addView(title);
        ScheduleStore.Profile p=profile();LinearLayout choices=row();TextView profile=action(p==null?"Выбрать расписание  ▾":p.name+"  ▾",this::chooseProfile);profile.setGravity(Gravity.START|Gravity.CENTER_VERTICAL);profile.setSingleLine(true);profile.setEllipsize(android.text.TextUtils.TruncateAt.END);weighted(choices,profile);choices.addView(action(shortDate()+"  ▾",this::chooseDate));header.addView(choices);
        TextView scope=label("Когда действует: "+scopeText(),12);scope.setTextColor(mix(surface,text,0.60f));scope.setSingleLine(true);scope.setEllipsize(android.text.TextUtils.TruncateAt.END);scope.setOnClickListener(v->assign());header.addView(scope);
        LinearLayout legend=row();TextView lessonLabel=label("Урок",11);lessonLabel.setTextColor(mix(surface,text,0.5f));legend.addView(lessonLabel,new LinearLayout.LayoutParams(dp(46),-2));for(String name:new String[]{"Начало","Конец"}){TextView item=label(name,11);item.setGravity(Gravity.CENTER);item.setTextColor(mix(surface,text,0.5f));weighted(legend,item);}TextView lengthLabel=label("Длительность",11);lengthLabel.setGravity(Gravity.END);lengthLabel.setTextColor(mix(surface,text,0.5f));legend.addView(lengthLabel,new LinearLayout.LayoutParams(dp(82),-2));header.addView(legend);
        ScrollView scroll=new ScrollView(c);scroll.setFillViewport(false);scroll.setVerticalScrollBarEnabled(false);screen.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));content=column();scroll.addView(content);
        if(p!=null){
            for(int i=0;i<8;i++){
                final int n=i;LinearLayout line=row();line.setMinimumHeight(dp(49));line.setPadding(dp(6),dp(2),dp(6),dp(2));
                TextView num=label(""+(i+1),14);num.setTextColor(mix(surface,text,0.48f));num.setGravity(Gravity.CENTER);line.addView(num,new LinearLayout.LayoutParams(dp(30),-2));
                for(int j=0;j<2;j++){fields[i][j]=new EditText(dialogContext());fields[i][j].setText(p.slots[i][j]<0?"":ScheduleResolver.clock(p.slots[i][j]));TextView time=label("",17);timeLabels[i][j]=time;time.setGravity(Gravity.CENTER);time.setTypeface(android.graphics.Typeface.MONOSPACE);time.setOnClickListener(v->editLesson(n));ScheduleUi.press(time,accent);weighted(line,time);if(j==0){TextView dash=label("–",14);dash.setTextColor(mix(surface,text,0.35f));line.addView(dash);}}
                details[i]=label("",11);details[i].setSingleLine(true);details[i].setGravity(Gravity.END|Gravity.CENTER_VERTICAL);details[i].setEllipsize(android.text.TextUtils.TruncateAt.END);line.addView(details[i],new LinearLayout.LayoutParams(dp(82),-2));line.setOnClickListener(v->editLesson(n));ScheduleUi.press(line,accent);content.addView(line);
                View divider=new View(c);divider.setBackgroundColor(mix(surface,text,0.07f));content.addView(divider,new LinearLayout.LayoutParams(-1,dp(1)));
                shiftOrigin[i]=p.slots[i][1];List<ScheduleResolver.Event> base=ScheduleBridge.diary(day);if(shiftOrigin[i]<0&&base!=null)for(ScheduleResolver.Event e:base)if(ScheduleResolver.number(e.number)==i+1)shiftOrigin[i]=e.end;
            }
        }else{content.addView(label("Создайте профиль или возьмите время из дневника.",14));content.addView(button("Создать профиль",()->newProfile(false)));}
        problem=label("",12);problem.setTextColor(0xffe58087);problem.setVisibility(View.GONE);screen.addView(problem);preview=label("",15);
        summary=label("",12);summary.setTextColor(mix(surface,text,0.55f));screen.addView(summary);
        footer=row();weighted(footer,button("Отмена",this::askClose));apply=button("Сохранить",this::save);apply.setBackground(panel(accent));apply.setTextColor((Color.red(accent)*0.299+Color.green(accent)*0.587+Color.blue(accent)*0.114)>170?0xff15151a:Color.WHITE);ScheduleUi.press(apply,accent);weighted(footer,apply);screen.addView(footer);
        rendering=false;updatePreview();if(isShowing())sheet.post(()->ScheduleUi.enter(sheet,0,false));
    }
    private String scopeText(){if(draft.dates.containsKey(ScheduleResolver.key(day)))return "только "+shortDate().toLowerCase(new Locale("ru"));return draft.active(day)==null?"время из дневника":"по дням недели";}
    private void more(){
        if(!sync())return;
        actionSheet("Настройки звонков",new String[]{"Заполнить звонки","Взять время из дневника","Выбрать дни","Классный час","Сдвинуть весь день","Посмотреть весь день","Мои расписания"},
            new String[]{"Задать начало, уроки и перемены","Скопировать школьное расписание","На одну дату или каждую неделю","Добавить событие или заменить урок","Все звонки раньше или позже","Уроки, события и время окончания","Создать, переименовать или удалить"},
            new Runnable[]{this::generate,this::fromDiary,this::assign,this::homeroom,this::manual,()->builder().setTitle(shortDate()).setMessage(preview.getText()).setPositiveButton("Закрыть",null).show(),this::profileActions});
    }
    private void actionSheet(String title,String[] names,String[] notes,Runnable[] actions){
        Dialog menu=new Dialog(dialogContext());menu.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout body=column();body.setPadding(dp(14),dp(10),dp(14),dp(14));
        View handle=new View(c);handle.setBackground(panel(mix(surface,text,0.28f)));LinearLayout.LayoutParams grip=new LinearLayout.LayoutParams(dp(32),dp(4));grip.gravity=Gravity.CENTER_HORIZONTAL;grip.bottomMargin=dp(8);body.addView(handle,grip);
        LinearLayout heading=row();TextView name=label(title,20);name.setTypeface(null,android.graphics.Typeface.BOLD);weighted(heading,name);heading.addView(action("×",menu::dismiss),new LinearLayout.LayoutParams(dp(44),dp(44)));body.addView(heading);
        ScrollView scroll=new ScrollView(c);scroll.setVerticalScrollBarEnabled(false);LinearLayout items=column();scroll.addView(items);body.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
        for(int i=0;i<names.length;i++){
            final int n=i;LinearLayout item=row();item.setPadding(dp(10),dp(8),dp(8),dp(8));item.setMinimumHeight(dp(66));item.setBackground(panel(0x14000000));
            ScheduleUi.Icon icon=new ScheduleUi.Icon(c,i,accent);icon.setBackground(panel((accent&0xffffff)|0x18000000));item.addView(icon,new LinearLayout.LayoutParams(dp(38),dp(38)));
            LinearLayout words=column();words.setPadding(dp(5),0,0,0);TextView primary=label(names[i],15);primary.setTypeface(null,android.graphics.Typeface.BOLD);primary.setPadding(dp(8),0,dp(4),dp(2));words.addView(primary);if(notes!=null){TextView secondary=label(notes[i],12);secondary.setPadding(dp(8),0,dp(4),0);secondary.setTextColor(mix(surface,text,0.65f));words.addView(secondary);}weighted(item,words);
            TextView arrow=label("›",23);arrow.setTextColor(mix(surface,text,0.45f));item.addView(arrow);
            item.setOnClickListener(v->{menu.dismiss();actions[n].run();});ScheduleUi.press(item,accent);LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,-2);params.topMargin=dp(6);items.addView(item,params);
        }
        ViewGroup source=ScheduleUi.activitySource(c);View glass=ScheduleUi.glass(menu,c,body,source,surface,text,true);menu.setContentView(glass);menu.setCanceledOnTouchOutside(true);menu.show();
        Window window=menu.getWindow();if(window!=null){android.util.DisplayMetrics m=c.getResources().getDisplayMetrics();int desired=dp(88+names.length*(notes==null?60:74));window.setLayout(Math.min(m.widthPixels-dp(20),dp(460)),Math.min(desired,(int)(m.heightPixels*0.72f)));window.setGravity(Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);window.setBackgroundDrawableResource(android.R.color.transparent);WindowManager.LayoutParams params=window.getAttributes();params.y=dp(10);params.dimAmount=0.25f;window.setAttributes(params);window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);}
        ScheduleUi.window(menu);ScheduleUi.enter(glass,0,true);for(int i=0;i<items.getChildCount();i++)ScheduleUi.enter(items.getChildAt(i),Math.min(i*18,108),false);
    }
    private AlertDialog.Builder builder(){return new AlertDialog.Builder(dialogContext()){@Override public AlertDialog show(){AlertDialog dialog=super.show();decorate(dialog);return dialog;}};}
    private void clearDialogPanels(View view){
        if(view.getId()!=View.NO_ID)try{String name=view.getResources().getResourceEntryName(view.getId());if(Arrays.asList("parentPanel","topPanel","contentPanel","customPanel","buttonPanel").contains(name))view.setBackgroundColor(Color.TRANSPARENT);}catch(Exception ignored){}
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)clearDialogPanels(((ViewGroup)view).getChildAt(i));
    }
    private void decorate(AlertDialog dialog){
        try{
            ViewGroup host=(ViewGroup)dialog.findViewById(android.R.id.content);if(host==null||host.getChildCount()==0)return;View nativeContent=host.getChildAt(0);if("rk_schedule_popup".equals(nativeContent.getTag()))return;
            host.removeView(nativeContent);LinearLayout contents=column();contents.addView(nativeContent,new LinearLayout.LayoutParams(-1,-2));nativeContent.setBackgroundColor(Color.TRANSPARENT);clearDialogPanels(nativeContent);
            ViewGroup source=ScheduleUi.activitySource(c);View glass=ScheduleUi.glass(dialog,c,contents,source,surface,text,false);glass.setTag("rk_schedule_popup");host.addView(glass,new FrameLayout.LayoutParams(-1,-2));
            Window window=dialog.getWindow();if(window!=null){window.setBackgroundDrawableResource(android.R.color.transparent);window.setLayout(Math.min(c.getResources().getDisplayMetrics().widthPixels-dp(32),dp(430)),-2);}
            for(int which:new int[]{-1,-2,-3}){Button button=dialog.getButton(which);if(button!=null){button.setTextColor(accent);ScheduleUi.press(button,accent);}}
            ScheduleUi.window(dialog);ScheduleUi.enter(glass,0,true);
        }catch(Exception e){ScheduleBridge.log("Schedule popup styling",e);}
    }
    private void editLesson(int n){
        if(profile()==null)return;LinearLayout v=column();LinearLayout captions=row();weighted(captions,label("Начало",13));weighted(captions,label("Конец",13));v.addView(captions);LinearLayout times=row();EditText start=new EditText(dialogContext()),end=new EditText(dialogContext());EditText[] edits={start,end};
        for(int j=0;j<2;j++){EditText f=edits[j];f.setText(fields[n][j].getText());f.setHint(j==0?"Начало":"Конец");f.setTextColor(text);f.setTextSize(21);f.setGravity(Gravity.CENTER);f.setSingleLine(true);f.setInputType(android.text.InputType.TYPE_CLASS_DATETIME|android.text.InputType.TYPE_DATETIME_VARIATION_TIME);f.setSelectAllOnFocus(true);f.setOnLongClickListener(x->{pickTime(f);return true;});weighted(times,f);if(j==0)times.addView(label("–",18));}v.addView(times);
        LinearLayout clocks=row();weighted(clocks,action("Выбрать начало",()->pickTime(start)));weighted(clocks,action("Выбрать конец",()->pickTime(end)));v.addView(clocks);
        CheckBox shift=new CheckBox(dialogContext());shift.setText("Сдвинуть следующие уроки");shift.setTextColor(text);shift.setChecked(false);shift.setEnabled(shiftOrigin[n]>=0);v.addView(shift);
        AlertDialog dialog=builder().setTitle("Урок "+(n+1)).setView(form(v)).setNegativeButton("Отмена",null).setNeutralButton("Как в школе",(d,w)->{profile().slots[n]=new int[]{-1,-1};render();}).setPositiveButton("Готово",null).create();
        dialog.setOnShowListener(d->{decorate(dialog);dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);dialog.getButton(-1).setOnClickListener(x->{try{String a=start.getText().toString().trim(),b=end.getText().toString().trim();int begin=a.isEmpty()?-1:ScheduleResolver.parse(a),finish=b.isEmpty()?-1:ScheduleResolver.parse(b);if((!a.isEmpty()&&begin<0)||(!b.isEmpty()&&finish<0)||(a.isEmpty()!=b.isEmpty())||(begin>=0&&finish<=begin))throw new IllegalArgumentException("Укажите начало и конец в формате ЧЧ:ММ");int[][] slots=read(false);slots[n]=new int[]{begin,finish};if(shift.isChecked()){if(finish<0)throw new IllegalArgumentException("Задайте конец урока для сдвига");List<ScheduleResolver.Event> base=ScheduleBridge.diary(day);if(base!=null)for(ScheduleResolver.Event e:base){int i=ScheduleResolver.number(e.number)-1;if(i>n&&i<8&&slots[i][0]<0)slots[i]=new int[]{e.start,e.end};}ScheduleResolver.shiftFollowing(slots,n,finish-shiftOrigin[n]);}ScheduleResolver.validateSlots(slots);profile().slots=slots;draft.needsSetup.remove(selected);dialog.dismiss();render();}catch(Exception error){end.setError(error.getMessage());}});});dialog.show();
    }
    private View glass(LinearLayout contents){return ScheduleUi.glass(this,c,contents,ScheduleUi.activitySource(c),surface,text,true);}
    private void pickTime(EditText f){int value=ScheduleResolver.parse(f.getText().toString());if(value<0)value=8*60+30;TimePickerDialog picker=new TimePickerDialog(dialogContext(),(v,h,m)->f.setText(ScheduleResolver.clock(h*60+m)),value/60,value%60,true);picker.show();decorate(picker);}
    private int[][] read(){return read(true);}
    private int[][] read(boolean checkOrder){ScheduleStore.Profile p=profile();if(p==null)return null;int[][] values=new int[8][2];for(int i=0;i<8;i++){
        String a=fields[i][0].getText().toString().trim(),b=fields[i][1].getText().toString().trim();
        values[i][0]=a.isEmpty()?-1:ScheduleResolver.parse(a);values[i][1]=b.isEmpty()?-1:ScheduleResolver.parse(b);
        fields[i][0].setError(null);fields[i][1].setError(null);
        if((!a.isEmpty()&&values[i][0]<0)||(!b.isEmpty()&&values[i][1]<0)||(a.isEmpty()!=b.isEmpty())){fields[i][1].setError("Заполните оба поля в формате ЧЧ:ММ");throw new IllegalArgumentException("Урок "+(i+1)+": проверьте время");}
        if(values[i][0]>=0&&values[i][1]<=values[i][0]){fields[i][1].setError("Конец должен быть позже начала");throw new IllegalArgumentException("Урок "+(i+1)+": неверный интервал");}
        if(details[i]!=null){boolean inherited=values[i][0]<0;String note=inherited?"Из дневника":(values[i][1]-values[i][0])+" мин";details[i].setText(note);details[i].setTextColor(mix(surface,text,0.50f));for(int j=0;j<2;j++)if(timeLabels[i][j]!=null){int minute=values[i][j];if(minute<0){List<ScheduleResolver.Event> base=ScheduleBridge.diary(day);if(base!=null)for(ScheduleResolver.Event e:base)if(ScheduleResolver.number(e.number)==i+1)minute=j==0?e.start:e.end;}timeLabels[i][j].setText(minute<0?"—:—":ScheduleResolver.clock(minute));timeLabels[i][j].setTextColor(inherited?mix(surface,text,0.60f):text);}}

    }if(checkOrder)ScheduleResolver.validateSlots(values);return values;}
    private boolean sync(){try{int[][] values=read();if(values!=null){profile().slots=values;for(int[] slot:values)if(slot[0]>=0)draft.needsSetup.remove(selected);}return true;}catch(Exception e){toast(e.getMessage());return false;}}
    private List<ScheduleResolver.Event> previewBaseline(){List<ScheduleResolver.Event> base=ScheduleBridge.diary(day);if(base!=null)return base;List<ScheduleResolver.Event> sample=new ArrayList<>();ScheduleStore.Profile p=profile();if(p!=null)for(int i=0;i<8;i++)if(p.slots[i][0]>=0)sample.add(new ScheduleResolver.Event(""+(i+1),"Урок "+(i+1),p.slots[i][0],p.slots[i][1],false,null,"Предпросмотр"));return sample;}
    private void updatePreview(){if(rendering||preview==null)return;try{
        int[][] values=read();if(values!=null)profile().slots=values;
        ScheduleStore local=draft.copy();if(selected!=null)local.dates.put(ScheduleResolver.key(day),selected);
        List<ScheduleResolver.Event> events=ScheduleBridge.resolve(local,day,previewBaseline(),true);
        StringBuilder out=new StringBuilder("Предпросмотр выбранного профиля\n");if(ScheduleBridge.diary(day)==null)out.append("Предметы на эту дату не загружены. Показаны только заданные звонки.\n");
        for(int i=0;i<events.size();i++){ScheduleResolver.Event e=events.get(i);out.append("\n").append(e.number).append(" · ").append(e.title).append("\n").append(ScheduleResolver.clock(e.start)).append(" — ").append(ScheduleResolver.clock(e.end)).append(" · ").append(e.end-e.start).append(" мин");if(i+1<events.size())out.append("\nПеремена ").append(events.get(i+1).start-e.end).append(" мин");}
        if(!events.isEmpty())out.append("\n\nОкончание дня: ").append(ScheduleResolver.clock(events.get(events.size()-1).end));
        out.append("\n\nВыберите «Когда действует», чтобы применить это расписание на дату или дни недели.");preview.setText(out.toString());summary.setText(events.isEmpty()?"Нажмите на строку, чтобы задать время":"До "+ScheduleResolver.clock(events.get(events.size()-1).end)+" · "+events.size()+" событий");
        problem.setText("");problem.setVisibility(View.GONE);apply.setEnabled(true);
    }catch(Exception e){problem.setText(e.getMessage());problem.setVisibility(View.VISIBLE);summary.setText("");apply.setEnabled(false);}}
    private void chooseDate(){if(!sync())return;Calendar cal=Calendar.getInstance();cal.setTimeInMillis(day);DatePickerDialog picker=new DatePickerDialog(dialogContext(),(v,y,m,d)->{Calendar next=Calendar.getInstance();next.clear();next.set(y,m,d);day=next.getTimeInMillis();render();},cal.get(1),cal.get(2),cal.get(5));picker.show();decorate(picker);}
    private void chooseProfile(){if(!sync())return;List<String> ids=new ArrayList<>(draft.profiles.keySet());List<String> names=new ArrayList<>();for(String id:ids)names.add(draft.profiles.get(id).name);names.add("+ Новое расписание");builder().setTitle("Выберите расписание").setItems(names.toArray(new String[0]),(d,w)->{if(w==ids.size())newProfile(false);else{selected=ids.get(w);render();}}).show();}
    private void profileActions(){if(!sync())return;builder().setTitle("Мои расписания").setItems(new String[]{"Создать","Копировать","Переименовать","Удалить","Сбросить всё"},(d,w)->{if(w==0)newProfile(false);else if(w==1)newProfile(true);else if(w==2)rename();else if(w==3)delete();else builder().setTitle("Удалить все настройки?").setMessage("Изменения вступят в силу после «Сохранить».").setNegativeButton("Отмена",null).setPositiveButton("Удалить",(x,y)->{draft=new ScheduleStore();selected=null;render();}).show();}).show();}
    private void newProfile(boolean copy){EditText name=new EditText(dialogContext());name.setHint("Например, короткий день");builder().setTitle(copy?"Копия расписания":"Новое расписание").setView(name).setNegativeButton("Отмена",null).setPositiveButton("Создать",(d,w)->{String title=name.getText().toString().trim();if(title.isEmpty()){toast("Введите название");return;}ScheduleStore.Profile p=new ScheduleStore.Profile(UUID.randomUUID().toString(),title);if(copy&&profile()!=null)for(int i=0;i<8;i++)p.slots[i]=profile().slots[i].clone();draft.profiles.put(p.id,p);selected=p.id;render();}).show();}
    private void rename(){if(profile()==null)return;EditText name=new EditText(dialogContext());name.setText(profile().name);builder().setTitle("Название").setView(name).setNegativeButton("Отмена",null).setPositiveButton("Сохранить",(d,w)->{String value=name.getText().toString().trim();if(!value.isEmpty()){profile().name=value;render();}}).show();}
    private void delete(){if(profile()==null)return;StringBuilder affected=new StringBuilder();for(Map.Entry<String,String> e:draft.dates.entrySet())if(e.getValue().equals(selected))affected.append(e.getKey()).append("\n");for(Map.Entry<Integer,String> e:draft.weekdays.entrySet())if(e.getValue().equals(selected))affected.append(DAYS[e.getKey()-1]).append("\n");builder().setTitle("Удалить «"+profile().name+"»?").setMessage("Эти назначения будут удалены:\n"+affected+"Восстановится наследование расписания.").setNegativeButton("Отмена",null).setPositiveButton("Удалить",(d,w)->{draft.remove(selected);selected=draft.profiles.isEmpty()?null:draft.profiles.keySet().iterator().next();render();}).show();}
    private void assign(){if(!sync())return;builder().setTitle("Когда применять?").setItems(new String[]{"Только "+shortDate().toLowerCase(new Locale("ru")),"Повторять по дням недели","Вернуть правило дня недели","Убрать повторение по дням"},(d,w)->{
        if(w==0){if(selected!=null)draft.assignDate(day,selected);render();}
        if(w==2){draft.assignDate(day,null);render();}
        if(w==1||w==3){boolean[] checked=new boolean[7];for(int i=0;i<7;i++)checked[i]=w==1?Objects.equals(draft.weekdays.get(i+1),selected):draft.weekdays.containsKey(i+1);builder().setTitle(w==1?"Повторять по дням":"Удалить назначения").setMultiChoiceItems(DAYS,checked,(x,i,b)->checked[i]=b).setNegativeButton("Отмена",null).setPositiveButton("Готово",(x,y)->{draft.assignWeekdays(selected,checked,w==3);render();}).show();}
    }).show();}
    private EditText input(LinearLayout v,String hint,String value){EditText e=new EditText(dialogContext());TextView caption=label(hint,12);caption.setTextColor(mix(surface,text,0.65f));v.addView(caption);e.setHint(hint);e.setText(value);e.setInputType(hint.contains("ЧЧ:ММ")?android.text.InputType.TYPE_CLASS_DATETIME|android.text.InputType.TYPE_DATETIME_VARIATION_TIME:android.text.InputType.TYPE_CLASS_NUMBER|android.text.InputType.TYPE_NUMBER_FLAG_SIGNED);e.setSingleLine();e.setTextColor(text);e.setHintTextColor((text&0xffffff)|0x88000000);v.addView(e);return e;}
    private void generate(){if(!sync()||profile()==null)return;LinearLayout v=column();EditText start=input(v,"Начало первого урока · ЧЧ:ММ","08:30"),duration=input(v,"Длительность урока · мин",selected.matches("30|35|40|45")?selected:"45"),count=input(v,"Число уроков · 1–8","8"),pause=input(v,"Обычная перемена · мин","10");builder().setTitle("Заполнить звонки").setView(form(v)).setNegativeButton("Отмена",null).setPositiveButton("Создать",(d,w)->{try{int time=ScheduleResolver.parse(start.getText().toString()),length=Integer.parseInt(duration.getText().toString()),n=Integer.parseInt(count.getText().toString()),gap=Integer.parseInt(pause.getText().toString());if(time<0||length<=0||length>=1440||n<1||n>8||gap<0||gap>=1440)throw new IllegalArgumentException("Проверьте параметры генератора");int[][] slots=new int[8][2];for(int i=0;i<8;i++){slots[i]=i<n?new int[]{time,time+length}:new int[]{-1,-1};time+=length+gap;}ScheduleResolver.validateSlots(slots);profile().slots=slots;draft.needsSetup.remove(selected);render();}catch(Exception e){toast(e.getMessage());}}).show();}
    private void fromDiary(){if(!sync()||profile()==null)return;List<ScheduleResolver.Event> base=ScheduleBridge.diary(day);if(base==null){toast("Сначала откройте дневник на эту дату");return;}for(int[] slot:profile().slots)Arrays.fill(slot,-1);for(ScheduleResolver.Event e:base){int n=ScheduleResolver.number(e.number)-1;if(n>=0&&n<8)profile().slots[n]=new int[]{e.start,e.end};}draft.needsSetup.remove(selected);render();}
    private void shift(int row){int before=shiftOrigin[row];try{int[][] slots=read(false);if(slots==null)return;int after=slots[row][1];if(before<0||after<0)throw new IllegalArgumentException("Сначала задайте исходный интервал и откройте профиль заново");List<ScheduleResolver.Event> baseline=ScheduleBridge.diary(day);if(baseline!=null)for(ScheduleResolver.Event e:baseline){int n=ScheduleResolver.number(e.number)-1;if(n>row&&n<8&&slots[n][0]<0)slots[n]=new int[]{e.start,e.end};}ScheduleResolver.shiftFollowing(slots,row,after-before);profile().slots=slots;render();}catch(Exception e){toast(e.getMessage());}}
    private void homeroom(){if(!sync())return;LinearLayout v=column();ScheduleResolver.Homeroom existing=draft.homeroom(day);Spinner mode=new Spinner(dialogContext());mode.setAdapter(new ArrayAdapter<>(dialogContext(),android.R.layout.simple_spinner_dropdown_item,new String[]{"Отдельное событие","Вместо урока","Вставить перед уроком со сдвигом"}));v.addView(mode);if(existing!=null)mode.setSelection(existing.mode.equals("replace")?1:existing.mode.equals("insert")?2:0);
        EditText start=input(v,"Начало · ЧЧ:ММ",existing==null?"":ScheduleResolver.clock(existing.start)),end=input(v,"Конец · ЧЧ:ММ",existing==null?"":ScheduleResolver.clock(existing.end)),lesson=input(v,"Номер заменяемого / следующего урока",existing==null?"1":""+existing.lesson);
        v.addView(label("Для вставки начало берётся у выбранного урока, длительность — из разницы полей времени. Настройка даты важнее дня недели.",13));
        Spinner scope=new Spinner(dialogContext());List<String> choices=new ArrayList<>();choices.add("На дату "+ScheduleResolver.key(day));choices.addAll(Arrays.asList(DAYS));scope.setAdapter(new ArrayAdapter<>(dialogContext(),android.R.layout.simple_spinner_dropdown_item,choices));v.addView(scope);
        AlertDialog dialog=builder().setTitle("Классный час").setView(form(v)).setNegativeButton("Отмена",null).setNeutralButton("Убрать",null).setPositiveButton("Готово",null).create();dialog.setOnShowListener(d->{decorate(dialog);dialog.getButton(-1).setOnClickListener(x->{try{ScheduleResolver.Homeroom h=new ScheduleResolver.Homeroom();h.mode=new String[]{"separate","replace","insert"}[mode.getSelectedItemPosition()];h.start=ScheduleResolver.parse(start.getText().toString());h.end=ScheduleResolver.parse(end.getText().toString());h.lesson=Integer.parseInt(lesson.getText().toString());if(h.start<0||h.end<=h.start||h.lesson<1||h.lesson>8)throw new IllegalArgumentException("Проверьте время и номер урока");String key=scope.getSelectedItemPosition()==0?ScheduleResolver.key(day):"dow:"+scope.getSelectedItemPosition();draft.homerooms.put(key,h);dialog.dismiss();render();}catch(Exception e){toast(e.getMessage());}});dialog.getButton(-3).setOnClickListener(x->{String key=scope.getSelectedItemPosition()==0?ScheduleResolver.key(day):"dow:"+scope.getSelectedItemPosition();draft.homerooms.remove(key);dialog.dismiss();render();});});dialog.show();}
    private void manual(){if(!sync())return;LinearLayout v=column();String key=ScheduleResolver.key(day);EditText value=input(v,"Поправка в минутах, например +5 или -3",String.valueOf(draft.corrections.containsKey(key)?draft.corrections.get(key):0));v.addView(label("Сдвигает все события выбранной даты. Вступит в силу после сохранения.",13));AlertDialog dialog=builder().setTitle("Поправка · "+key).setView(form(v)).setNegativeButton("Отмена",null).setNeutralButton("Сбросить",(d,w)->{draft.corrections.remove(key);render();}).setPositiveButton("Готово",null).create();dialog.setOnShowListener(d->{decorate(dialog);dialog.getButton(-1).setOnClickListener(x->{try{int shift=Integer.parseInt(value.getText().toString().trim());if(Math.abs((long)shift)>=1440)throw new IllegalArgumentException("Поправка должна быть меньше суток");draft.corrections.put(key,shift);dialog.dismiss();render();}catch(Exception e){value.setError("Укажите целое число минут от -1439 до 1439");}});});dialog.show();}
    private boolean dirty(){try{syncSilently();return !draft.encode().equals(original.encode());}catch(Exception e){return true;}}
    private void syncSilently(){int[][] values=read();if(values!=null)profile().slots=values;}
    private void askClose(){if(!dirty()){dismiss();return;}builder().setTitle("Есть несохранённые изменения").setMessage("Они ещё не применены к дневнику.").setNegativeButton("Продолжить",null).setPositiveButton("Отбросить",(d,w)->dismiss()).show();}
    private void save(){if(!sync())return;try{ScheduleBridge.commit(c,draft);toast("Расписание применено");dismiss();}catch(Exception e){problem.setText(e.getMessage());toast("Не удалось применить: "+e.getMessage());}}
    private void toast(String value){Toast.makeText(c,value==null?"Проверьте введённые значения":value,Toast.LENGTH_LONG).show();}
}
