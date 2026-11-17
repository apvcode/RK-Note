package rk.diary;

import android.app.*;
import android.content.*;
import android.graphics.*;
import android.graphics.drawable.GradientDrawable;
import android.text.*;
import android.text.style.*;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.util.*;
import rk.schedule.*;

/** Diary presentation only. School assignments and lesson models remain authoritative. */
public final class DiaryUi {
    private DiaryUi() {}
    private static final Map<View,Header> headers=new WeakHashMap<>();
    private static WeakReference<Dialog> markDialog=new WeakReference<>(null);
    private static final class Header {
        final String number,key,subject,owner;final long day;final DiaryContext.Stamp stamp;
        final WeakReference<View> root;final WeakReference<Progress> progress;
        Header(View root,String subject,String date,String key,Progress progress){this.root=new WeakReference<>(root);this.subject=subject;this.key=key;this.stamp=ScheduleBridge.ownerStamp();PersonalHomeworkStore.Id id=PersonalHomeworkStore.Id.parse(key);this.owner=id==null?"":id.owner;this.day=Long.parseLong(date);TextView n=find(root,"textNum");number=n==null?"":n.getText().toString();this.progress=new WeakReference<>(progress);}
    }
    private static int dp(Context c,float value){return ScheduleUi.dp(c,value);}
    private static int accent(Context c){return ScheduleBridge.themeColor(c,"getAccentColor",0xff0a84ff);}
    private static int text(Context c){return ScheduleBridge.textColor(c);}
    private static int surface(Context c){return ScheduleBridge.themeColor(c,"getThemeSurfaceColor",0xff171722);}
    private static int muted(Context c){return text(c)==0xff17202c?0xff647084:0xffa0a7b4;}
    private static int corners(Context c){int choice=c.getSharedPreferences("theme_customizer_prefs",0).getInt("corner_style",1);return choice==0?8:choice==2?22:14;}
    private static <T extends View> T find(View root,String name){int id=root.getResources().getIdentifier(name,"id",root.getContext().getPackageName());return id==0?null:(T)root.findViewById(id);}
    private static void log(String message,Exception error){android.util.Log.e("RKDiary",message,error);}

    public static void clearBindings(){for(Map.Entry<View,Header> entry:new ArrayList<>(headers.entrySet())){Header h=entry.getValue();if(ScheduleBridge.current(h.stamp))continue;View root=h.root.get();Progress progress=h.progress.get();if(progress!=null)progress.set(false,0,0);if(root!=null){View note=root.findViewWithTag("rk_personal_homework");if(note instanceof TextView){((TextView)note).setText("");((View)note.getParent()).setVisibility(View.GONE);}}headers.remove(entry.getKey());}}
    public static void bindHomework(View root,String subject,String date){bindHomework(root,subject,date,null);}
    public static void bindHomework(View root,String subject,String date,String key){
        try{
            Context c=root.getContext();Progress progress=(Progress)root.findViewWithTag("rk_diary_progress");
            if(progress==null&&root instanceof FrameLayout){progress=new Progress(c);progress.setTag("rk_diary_progress");((FrameLayout)root).addView(progress,new FrameLayout.LayoutParams(-1,-1));}
            Header state=new Header(root,subject,date,key,progress);headers.put(root,state);
            TextView number=find(root,"textNum");if(number!=null)number.setBackground(ScheduleUi.shape(c,surface(c),8));
            TextView title=find(root,"textName");if(title!=null){title.setTextSize(17);title.setTextColor(text(c));title.setTypeface(android.graphics.Typeface.create("sans-serif-medium",0));title.setOnLongClickListener(v->{editHomework(root,subject,state.key);return true;});}
            TextView button=(TextView)root.findViewWithTag("rk_diary_add_homework");
            if(button!=null){button.setTextColor(accent(c));button.setOnClickListener(v->editHomework(root,subject,state.key));ScheduleUi.press(button,accent(c));}
            renderHomework(root,c,state.key);update(state,System.currentTimeMillis());
        }catch(Exception e){log("Binding diary card",e);}
    }
    public static void renderHomework(View root,Context c,String key){
        TextView note=(TextView)root.findViewWithTag("rk_personal_homework");if(note==null)return;
        View panel=(View)note.getParent();note.setText("");note.setVisibility(View.GONE);panel.setVisibility(View.GONE);PersonalHomeworkStore.Id id=PersonalHomeworkStore.Id.parse(key);String value=id!=null&&ScheduleBridge.currentOwner(id.owner)?new PersonalHomeworkStore(c).get(id):"";
        TextView button=(TextView)root.findViewWithTag("rk_diary_add_homework");if(button!=null){button.setText("✎");button.setTextSize(22);button.setContentDescription(value.isEmpty()?"Добавить своё домашнее задание":"Изменить своё домашнее задание");}
        if(value.isEmpty()){note.setText("");note.setVisibility(View.GONE);panel.setVisibility(View.GONE);}
        else{
            String heading="Моё ДЗ";SpannableStringBuilder display=new SpannableStringBuilder(heading+"\n").append(value);display.setSpan(new ForegroundColorSpan(accent(c)),0,heading.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);display.setSpan(new RelativeSizeSpan(0.85f),0,heading.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);display.setSpan(new StyleSpan(Typeface.BOLD),0,heading.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            note.setText(display);note.setTextColor(text(c));note.setTextSize(14);note.setLineSpacing(dp(c,2),1);note.setCompoundDrawablesWithIntrinsicBounds(0,0,0,0);note.setMaxLines(4);note.setVisibility(View.VISIBLE);panel.setVisibility(View.VISIBLE);
            stylePersonalPanel(panel);note.setTypeface(Typeface.create("sans-serif",Typeface.NORMAL));panel.setOnClickListener(v->{Header h=headers.get(root);if(h!=null)editHomework(root,h.subject,key);});
        }
        root.requestLayout();
    }
    private static void stylePersonalPanel(View panel){
        Context c=panel.getContext();int base=surface(c),tint=accent(c);
        int fill=Color.rgb((Color.red(base)*88+Color.red(tint)*12)/100,(Color.green(base)*88+Color.green(tint)*12)/100,(Color.blue(base)*88+Color.blue(tint)*12)/100);
        panel.setBackground(ScheduleUi.shape(c,fill,corners(c)));panel.setElevation(0);
    }
    public static void tick(){long now=System.currentTimeMillis();for(Header state:new ArrayList<>(headers.values()))try{update(state,now);}catch(Exception e){Progress view=state.progress.get();if(view!=null)view.set(false,0,0);log("Updating active lesson",e);}}
    private static void update(Header state,long now){
        Progress progress=state.progress.get();View root=state.root.get();if(progress==null||root==null)return;
        boolean active=false;float fraction=0;
        if(ScheduleBridge.currentOwner(state.owner)&&ScheduleResolver.key(state.day).equals(ScheduleResolver.key(now))){
            List<ScheduleResolver.Event> baseline=ScheduleBridge.diary(state.day);
            if(baseline!=null)for(ScheduleResolver.Event event:ScheduleBridge.resolve(ScheduleBridge.store(root.getContext()),state.day,baseline,true))if(event.number.equals(state.number)){
                long begin=ScheduleResolver.instant(state.day,event.start),end=ScheduleResolver.instant(state.day,event.end);
                active=now>=begin&&now<end;if(active)fraction=(float)(now-begin)/(end-begin);break;
            }
        }
        progress.set(active,fraction,accent(root.getContext()));
    }
    public static final class Progress extends View {
        private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);private boolean active;private float fraction;private int color;
        public Progress(Context c){super(c);setVisibility(INVISIBLE);setClickable(false);setFocusable(false);setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);}
        void set(boolean show,float value,int accent){boolean changed=active!=show;active=show;fraction=Math.max(0,Math.min(1,value));color=accent;if(show){if(changed){setVisibility(VISIBLE);if(ScheduleUi.motion(getContext())){setAlpha(0);animate().alpha(1).setDuration(180).start();}}invalidate();}else if(changed){animate().cancel();setAlpha(1);setVisibility(INVISIBLE);}}
        @Override protected void onDraw(Canvas canvas){super.onDraw(canvas);if(!active)return;Context c=getContext();paint.setColor(color);float left=dp(c,12),top=dp(c,12),bottom=getHeight()-dp(c,10);canvas.drawRoundRect(left,top,left+dp(c,2),bottom,dp(c,1),dp(c,1),paint);float start=dp(c,52),end=getWidth()-dp(c,16),y=getHeight()-dp(c,3);paint.setColor((color&0xffffff)|0x20000000);canvas.drawRoundRect(start,y,end,y+dp(c,2),dp(c,1),dp(c,1),paint);paint.setColor(color);canvas.drawRoundRect(start,y,start+(end-start)*fraction,y+dp(c,2),dp(c,1),dp(c,1),paint);}
    }
    private static TextView label(Context c,String value,int size){TextView t=new TextView(c);t.setText(value);t.setTextSize(size);t.setTextColor(text(c));t.setPadding(dp(c,4),dp(c,5),dp(c,4),dp(c,5));return t;}
    private static Button button(Context c,String title,Runnable action){Button b=new Button(c);b.setText(title);b.setTextSize(14);b.setAllCaps(false);b.setTextColor(accent(c));b.setMinWidth(0);b.setMinimumWidth(0);b.setPadding(dp(c,8),0,dp(c,8),0);b.setMinHeight(dp(c,44));b.setBackground(ScheduleUi.shape(c,Color.TRANSPARENT,14));b.setOnClickListener(v->action.run());ScheduleUi.press(b,accent(c));return b;}
    private static View show(Dialog dialog,Context c,LinearLayout body){
        ScrollView scroll=new ScrollView(c);scroll.setFillViewport(false);scroll.addView(body);LinearLayout contents=new LinearLayout(c);contents.setOrientation(1);contents.addView(scroll,new LinearLayout.LayoutParams(-1,-2));
        View glass=ScheduleUi.glass(dialog,c,contents,ScheduleUi.activitySource(c),surface(c),text(c),false);dialog.setContentView(glass);dialog.show();Window window=dialog.getWindow();if(window!=null){window.setLayout(Math.min(c.getResources().getDisplayMetrics().widthPixels-dp(c,32),dp(c,430)),-2);window.setBackgroundDrawableResource(android.R.color.transparent);window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE|WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);window.setDimAmount(0.4f);}ScheduleUi.window(dialog);ScheduleUi.enter(glass,0,true);return glass;
    }
    public static void editHomework(View root,String subject,String key){
        Context c=root.getContext();final Header captured=headers.get(root);final PersonalHomeworkStore.Id id=PersonalHomeworkStore.Id.parse(key);
        if(captured==null||id==null||!ScheduleBridge.currentOwner(id.owner)){Toast.makeText(c,"Сначала откройте урок выбранного ученика",Toast.LENGTH_LONG).show();return;}
        final PersonalHomeworkStore notes=new PersonalHomeworkStore(c);
        final DiaryContext.Stamp ownerStamp=ScheduleBridge.ownerStamp();final String ownerLabel=ScheduleBridge.ownerLabel();
        Dialog dialog=new Dialog(c);dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);dialog.setCanceledOnTouchOutside(false);
        LinearLayout body=new LinearLayout(c);body.setOrientation(1);body.setPadding(dp(c,20),dp(c,16),dp(c,20),dp(c,14));
        TextView title=label(c,"Моё домашнее задание",20);title.setTypeface(null,Typeface.BOLD);body.addView(title);TextView subtitle=label(c,subject,14);subtitle.setTextColor(muted(c));body.addView(subtitle);
        EditText input=new EditText(c);input.setTextColor(text(c));input.setHintTextColor(muted(c));input.setTextSize(15);input.setMinLines(3);input.setMaxLines(8);input.setGravity(Gravity.TOP);input.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE|android.text.InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);input.setHint("Запиши, что нужно сделать…");input.setPadding(dp(c,12),dp(c,12),dp(c,12),dp(c,12));input.setBackground(ScheduleUi.shape(c,(accent(c)&0xffffff)|0x10000000,12));String previous;try{previous=notes.get(id);}catch(Exception e){Toast.makeText(c,e.getMessage(),Toast.LENGTH_LONG).show();return;}input.setText(previous);body.addView(input,new LinearLayout.LayoutParams(-1,-2));
        LinearLayout actions=new LinearLayout(c);actions.setOrientation(0);actions.setPadding(0,dp(c,12),0,0);actions.addView(button(c,"Очистить",()->input.setText("")),new LinearLayout.LayoutParams(0,-2,1));actions.addView(button(c,"Отмена",dialog::dismiss),new LinearLayout.LayoutParams(0,-2,1));Button save=button(c,"Сохранить",()->{
            String value=input.getText().toString().trim();
            if(!ScheduleBridge.current(ownerStamp)){input.setError("Ученик изменился. Откройте урок заново");return;}
            try{ScheduleBridge.saveHomework(ownerStamp,notes,id,value);}catch(Exception e){input.setError(e.getMessage());return;}
            if(headers.get(root)==captured){renderHomework(root,c,key);View note=root.findViewWithTag("rk_personal_homework");if(note!=null&&!value.isEmpty())ScheduleUi.enter(note,0,false);}dialog.dismiss();
        });save.setBackground(ScheduleUi.shape(c,accent(c),14));save.setTextColor((Color.red(accent(c))*0.299+Color.green(accent(c))*0.587+Color.blue(accent(c))*0.114)>170?0xff15151a:Color.WHITE);ScheduleUi.press(save,accent(c));actions.addView(save,new LinearLayout.LayoutParams(0,-2,1));body.addView(button(c,"Перенести старую запись",()->{
            try{
                if(!ScheduleBridge.current(ownerStamp))throw new IllegalStateException("Ученик изменился. Откройте урок заново");
                Map<String,String> archive=notes.archive();List<String> keys=new ArrayList<>(),labels=new ArrayList<>();
                for(Map.Entry<String,String> e:archive.entrySet()){keys.add(e.getKey());labels.add(archiveLabel(e.getKey())+(notes.imported(e.getKey())?" · перенесено":"")+"\n"+e.getValue());}
                if(keys.isEmpty()){Toast.makeText(c,"Архив пуст",Toast.LENGTH_LONG).show();return;}
                new AlertDialog.Builder(c).setTitle("Архив личного ДЗ").setItems(labels.toArray(new String[0]),(picker,index)->{
                    String oldKey=keys.get(index);
                    if(notes.imported(oldKey)){PersonalHomeworkStore.Id destination=notes.destination(oldKey);TextView original=label(c,archive.get(oldKey),15);original.setTextIsSelectable(true);new AlertDialog.Builder(c).setTitle("Исходная запись архива").setMessage(destination==null?"Запись перенесена":"Перенесено: "+destination.date+" · "+destination.subject).setView(original).setPositiveButton("Закрыть",null).show();return;}
                    String base=input.getText().toString().trim();boolean append=!base.isEmpty()||!notes.get(id).isEmpty();
                    new AlertDialog.Builder(c).setTitle("Перенести старую запись?").setMessage("Текущий ученик и урок:\n"+ownerLabel+"\n"+id.date+" · "+captured.number+" · "+id.subject+"\n\n"+archive.get(oldKey)+(append?"\n\nТекст будет добавлен к существующему ДЗ.":""))
                        .setNegativeButton("Отмена",null).setPositiveButton(append?"Добавить текст":"Перенести",(confirm,which)->{
                            try{if(!ScheduleBridge.current(ownerStamp))throw new IllegalStateException("Ученик изменился. Откройте урок заново");String result=ScheduleBridge.transferHomework(ownerStamp,notes,id,oldKey,input.getText().toString().trim(),append);input.setText(result);if(headers.get(root)==captured)renderHomework(root,c,key);}catch(Exception e){input.setError(e.getMessage());}
                        }).show();
                }).setNegativeButton("Отмена",null).show();
            }catch(Exception e){input.setError(e.getMessage());}
        }));body.addView(actions);show(dialog,c,body);
    }
    private static String archiveLabel(String key){if(key.startsWith("lesson:")){int separator=key.lastIndexOf('|');if(separator>7)try{return key.substring(7,separator)+" · "+ScheduleResolver.key(Long.parseLong(key.substring(separator+1)));}catch(Exception ignored){}}return "Старая запись";}
    public static void styleTree(View root){
        if(root==null)return;Context c=root.getContext();Object tag=root.getTag();
        if("rk_personal_homework_blur".equals(tag))stylePersonalPanel(root);
        if("rk_diary_add_homework".equals(tag)&&root instanceof TextView)((TextView)root).setTextColor(accent(c));
        if("rk_homework_card".equals(tag)){root.setBackground(ScheduleUi.shape(c,surface(c),corners(c)));TextView homework=find(root,"textHomework");if(homework!=null){homework.setTextColor(text(c));homework.setTextSize(14);homework.setLineSpacing(dp(c,2),1);}ImageView icon=find(root,"imageHomework");if(icon!=null)icon.setColorFilter(accent(c));}
        if("rk_diary_school_label".equals(tag)&&root instanceof TextView)((TextView)root).setTextColor(muted(c));
        int topic=root.getResources().getIdentifier("textTopic","id",c.getPackageName());if(topic!=0&&root.getId()==topic&&root instanceof TextView){TextView value=(TextView)root;value.setTextColor(muted(c));value.setTextSize(12.5f);CharSequence old=value.getText();if(old.length()>0&&!old.toString().startsWith("Тема: "))value.setText(new SpannableStringBuilder("Тема: ").append(old));}
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++)styleTree(((ViewGroup)root).getChildAt(i));
    }
    public static void styleMark(TextView view,int originalColor){
        if(view==null)return;Context c=view.getContext();SharedPreferences prefs=c.getSharedPreferences("theme_customizer_prefs",0);boolean colored=prefs.getInt("grade_color",1)!=0;int color=colored?(originalColor|0xff000000):muted(c);if((color&0xffffff)==0)color=accent(c);if(colored&&text(c)==0xff17202c&&(Color.red(color)*0.299+Color.green(color)*0.587+Color.blue(color)*0.114)>110)color=Color.rgb((int)(Color.red(color)*0.65f),(int)(Color.green(color)*0.65f),(int)(Color.blue(color)*0.65f));int style=prefs.getInt("grade_style",0);GradientDrawable background=ScheduleUi.shape(c,(color&0xffffff)|0x1a000000,style==1?50:style==2?12:4);view.setBackground(background);view.setTextColor(color);view.setTextSize(16);view.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));view.setGravity(Gravity.CENTER);view.setMinWidth(dp(c,36));view.setMinHeight(dp(c,36));view.setPadding(dp(c,8),dp(c,4),dp(c,8),dp(c,4));view.setElevation(0);view.setAlpha(1);view.setScaleX(1);view.setScaleY(1);view.setContentDescription("Оценка "+view.getText());ScheduleUi.press(view,color);
    }
    public static void showMarkDetails(View anchor,CharSequence information,int color){
        if(anchor==null||information==null)return;Dialog previous=markDialog.get();if(previous!=null&&previous.isShowing())previous.dismiss();Context c=anchor.getContext();Dialog dialog=new Dialog(c);dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);markDialog=new WeakReference<>(dialog);
        LinearLayout body=new LinearLayout(c);body.setOrientation(1);body.setPadding(dp(c,20),dp(c,16),dp(c,20),dp(c,16));LinearLayout heading=new LinearLayout(c);heading.setGravity(Gravity.CENTER_VERTICAL);TextView title=label(c,"Об оценке",20);title.setTypeface(null,Typeface.BOLD);heading.addView(title,new LinearLayout.LayoutParams(0,-2,1));heading.addView(button(c,"×",dialog::dismiss),new LinearLayout.LayoutParams(dp(c,44),dp(c,44)));body.addView(heading);
        TextView detail=label(c,"",15);detail.setLineSpacing(dp(c,5),1);SpannableStringBuilder plain=new SpannableStringBuilder(information);for(ForegroundColorSpan span:plain.getSpans(0,plain.length(),ForegroundColorSpan.class))plain.removeSpan(span);detail.setText(plain);detail.setTextIsSelectable(true);body.addView(detail,new LinearLayout.LayoutParams(-1,-2));Button close=button(c,"Понятно",dialog::dismiss);body.addView(close,new LinearLayout.LayoutParams(-1,dp(c,44)));show(dialog,c,body);
    }
}
