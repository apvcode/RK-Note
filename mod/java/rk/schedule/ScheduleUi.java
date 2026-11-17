package rk.schedule;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.*;
import android.graphics.drawable.*;
import android.provider.Settings;
import android.view.*;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;

/** Shared glass and motion for schedule windows. Never changes timetable state. */
public final class ScheduleUi {
    private ScheduleUi() {}
    public static int dp(Context c,float value){return Math.round(value*c.getResources().getDisplayMetrics().density);}
    public static boolean motion(Context c){try{return Settings.Global.getFloat(c.getContentResolver(),Settings.Global.ANIMATOR_DURATION_SCALE,1f)>0;}catch(Exception e){return true;}}
    public static GradientDrawable shape(Context c,int fill,int radius){GradientDrawable d=new GradientDrawable();d.setColor(fill);d.setCornerRadius(dp(c,radius));return d;}
    public static void press(View view,int accent){
        Context c=view.getContext();Drawable background=view.getBackground();
        view.setBackground(new RippleDrawable(ColorStateList.valueOf((accent&0xffffff)|0x16000000),background,shape(c,Color.WHITE,14)));
        view.setOnTouchListener((v,event)->{
            int action=event.getActionMasked();
            if(action==android.view.MotionEvent.ACTION_DOWN&&motion(c))v.animate().scaleX(0.975f).scaleY(0.975f).setDuration(100).setStartDelay(0).start();
            else if(action==android.view.MotionEvent.ACTION_UP||action==android.view.MotionEvent.ACTION_CANCEL)v.animate().scaleX(1).scaleY(1).setDuration(motion(c)?160:0).setStartDelay(0).start();
            return false;
        });
    }
    public static void enter(View view,int delay,boolean sheet){
        if(!motion(view.getContext()))return;
        view.animate().cancel();view.setAlpha(0);view.setTranslationY(dp(view.getContext(),sheet?22:8));
        view.setScaleX(sheet?0.985f:1);view.setScaleY(sheet?0.985f:1);
        view.animate().alpha(1).translationY(0).scaleX(1).scaleY(1).setStartDelay(delay).setDuration(sheet?260:210).setInterpolator(new DecelerateInterpolator(1.7f)).start();
    }
    public static void window(Dialog dialog){
        Window w=dialog.getWindow();if(w==null)return;
        int style=dialog.getContext().getResources().getIdentifier("RkScheduleMotion","style",dialog.getContext().getPackageName());
        if(style!=0)w.setWindowAnimations(style);
    }
    public static ViewGroup activitySource(Context context){
        Context cursor=context;
        while(cursor instanceof ContextWrapper){if(cursor instanceof Activity)return (ViewGroup)((Activity)cursor).getWindow().getDecorView();Context next=((ContextWrapper)cursor).getBaseContext();if(next==cursor)break;cursor=next;}
        return null;
    }
    public static View glass(Dialog owner,Context c,ViewGroup content,ViewGroup source,int surface,int text,boolean fill){
        try{
            if(source==null)throw new IllegalStateException("No source window for schedule glass");
            Class<?> type=Class.forName("eightbitlab.com.blurview.BlurView");FrameLayout blur=(FrameLayout)type.getConstructor(Context.class).newInstance(c);
            boolean light=text==0xff17202c;
            GradientDrawable rim=shape(c,Color.TRANSPARENT,26);blur.setBackground(rim);
            blur.setOutlineProvider(new ViewOutlineProvider(){public void getOutline(View v,Outline o){o.setRoundRect(0,0,v.getWidth(),v.getHeight(),dp(c,26));}});blur.setClipToOutline(true);
            content.setBackgroundColor(Color.TRANSPARENT);blur.addView(content,new FrameLayout.LayoutParams(-1,fill?-1:-2));
            blur.post(()->{
                if(!owner.isShowing())return;
                try{
                    Object controller=type.getMethod("setupWith",ViewGroup.class).invoke(blur,source);
                    // A neutral base and flat tint avoid white highlights in the blurred background.
                    Class.forName("eightbitlab.com.blurview.BlurViewFacade").getMethod("setFrameClearDrawable",Drawable.class).invoke(controller,new ColorDrawable(surface));
                    float radius=(Float)Class.forName("c7.UiCustomizationManager").getMethod("getBlurRadius",Context.class,String.class).invoke(null,c,"blur_dock");
                    type.getMethod("setBlurRadius",float.class).invoke(blur,radius);
                    type.getMethod("setOverlayColor",int.class).invoke(blur,light?0xb8f8fafc:0x99101218);
                    type.getMethod("setBlurAutoUpdate",boolean.class).invoke(blur,true);
                }catch(Exception e){content.setBackground(shape(c,surface,26));ScheduleBridge.log("Schedule glass fallback",e);}
            });return blur;
        }catch(Exception e){content.setBackground(shape(c,surface,26));ScheduleBridge.log("Schedule glass unavailable",e);return content;}
    }
    /** Same small, monochrome line icons throughout the action menu. */
    public static final class Icon extends View {
        private final int kind,color;private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        public Icon(Context c,int kind,int color){super(c);this.kind=kind;this.color=color;setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);}
        @Override protected void onDraw(Canvas canvas){
            super.onDraw(canvas);float unit=getResources().getDisplayMetrics().density;canvas.save();canvas.translate((getWidth()-24*unit)/2,(getHeight()-24*unit)/2);canvas.scale(unit,unit);
            paint.setColor(color);paint.setStrokeWidth(1.65f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);paint.setStyle(Paint.Style.STROKE);
            Path p=new Path();
            switch(kind){
                case 0:canvas.drawCircle(12,12,8,paint);canvas.drawLine(12,7,12,12,paint);canvas.drawLine(12,12,16,14,paint);break;
                case 1:canvas.drawRoundRect(4,4,20,20,3,3,paint);canvas.drawLine(8,4,8,20,paint);canvas.drawLine(12,9,17,9,paint);canvas.drawLine(12,13,17,13,paint);break;
                case 2:canvas.drawRoundRect(4,5,20,21,3,3,paint);canvas.drawLine(8,3,8,7,paint);canvas.drawLine(16,3,16,7,paint);canvas.drawLine(4,10,20,10,paint);canvas.drawLine(8,14,10,14,paint);canvas.drawLine(14,14,16,14,paint);canvas.drawLine(8,17,10,17,paint);break;
                case 3:p.moveTo(3,10);p.lineTo(12,3);p.lineTo(21,10);canvas.drawPath(p,paint);canvas.drawRect(6,10,18,21,paint);canvas.drawRect(10,15,14,21,paint);break;
                case 4:canvas.drawLine(3,8,20,8,paint);p.moveTo(16,4);p.lineTo(20,8);p.lineTo(16,12);canvas.drawPath(p,paint);canvas.drawLine(21,17,4,17,paint);p.reset();p.moveTo(8,13);p.lineTo(4,17);p.lineTo(8,21);canvas.drawPath(p,paint);break;
                case 5:canvas.drawRoundRect(5,3,19,21,3,3,paint);canvas.drawLine(9,8,15,8,paint);canvas.drawLine(9,12,15,12,paint);canvas.drawLine(9,16,13,16,paint);break;
                default:canvas.drawRoundRect(6,3,20,17,3,3,paint);p.moveTo(3,7);p.lineTo(3,18);p.quadTo(3,21,6,21);p.lineTo(17,21);canvas.drawPath(p,paint);
            }
            canvas.restore();
        }
    }
}
