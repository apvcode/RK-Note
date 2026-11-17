package rk.schedule;

import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import android.widget.TextView;

/** Small, consistent line icons; no font/emoji rendering differences between phones. */
public final class BannerGlyph extends Drawable {
    private final int kind,color;
    private final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    private BannerGlyph(int kind,int color){this.kind=kind;this.color=color;}
    public static void apply(TextView view,String state,int color){
        int kind="🔔".equals(state)?0:"⏸️".equals(state)?1:"🟢".equals(state)?2:"🏫".equals(state)?3:"!".equals(state)?5:"🌴".equals(state)?6:4;
        Drawable old=view.getCompoundDrawables()[0];
        if(old instanceof BannerGlyph&&((BannerGlyph)old).kind==kind&&((BannerGlyph)old).color==color)return;
        BannerGlyph glyph=new BannerGlyph(kind,color);int size=ScheduleUi.dp(view.getContext(),20);glyph.setBounds(0,0,size,size);
        view.setText("");view.setGravity(Gravity.CENTER);view.setCompoundDrawables(glyph,null,null,null);
        view.setImportantForAccessibility(android.view.View.IMPORTANT_FOR_ACCESSIBILITY_NO);
    }
    @Override public void draw(Canvas canvas){
        Rect b=getBounds();canvas.save();canvas.translate(b.left,b.top);canvas.scale(b.width()/24f,b.height()/24f);
        paint.setColor(color);paint.setStrokeWidth(1.7f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);paint.setStyle(Paint.Style.STROKE);
        Path p=new Path();
        switch(kind){
            case 0: // Bell with a separate clapper.
                p.moveTo(5,17);p.lineTo(7,14);p.lineTo(7,10);p.cubicTo(7,3,17,3,17,10);p.lineTo(17,14);p.lineTo(19,17);p.close();canvas.drawPath(p,paint);
                canvas.drawLine(11,3,13,3,paint);p.reset();p.moveTo(10,20);p.quadTo(12,22,14,20);canvas.drawPath(p,paint);break;
            case 1: // A short break: cup and steam.
                p.moveTo(5,9);p.lineTo(16,9);p.lineTo(16,15);p.quadTo(16,19,12,19);p.lineTo(9,19);p.quadTo(5,19,5,15);p.close();canvas.drawPath(p,paint);
                p.reset();p.moveTo(16,10);p.lineTo(18,10);p.cubicTo(22,10,22,15,16,15);canvas.drawPath(p,paint);canvas.drawLine(4,22,18,22,paint);
                canvas.drawLine(8,3,8,5,paint);canvas.drawLine(13,3,13,5,paint);break;
            case 2: // Open book.
                p.moveTo(12,6);p.quadTo(7,3,3,5);p.lineTo(3,19);p.quadTo(7,17,12,20);p.quadTo(17,17,21,19);p.lineTo(21,5);p.quadTo(17,3,12,6);p.lineTo(12,20);canvas.drawPath(p,paint);
                canvas.drawLine(6,9,9,10,paint);canvas.drawLine(15,10,18,9,paint);break;
            case 3: // School.
                p.moveTo(3,10);p.lineTo(12,3);p.lineTo(21,10);p.moveTo(5,9);p.lineTo(5,21);p.lineTo(19,21);p.lineTo(19,9);canvas.drawPath(p,paint);
                canvas.drawRect(10,15,14,21,paint);canvas.drawCircle(12,9,1.5f,paint);break;
            case 4: // Completed.
                canvas.drawCircle(12,12,9,paint);p.moveTo(7.5f,12);p.lineTo(10.5f,15);p.lineTo(16.5f,9);canvas.drawPath(p,paint);break;
            case 5: // Needs attention.
                canvas.drawCircle(12,12,9,paint);canvas.drawLine(12,7,12,13,paint);canvas.drawPoint(12,17,paint);break;
            default: // Day off: crescent moon.
                p.moveTo(19,15);p.cubicTo(10,18,6,10,10,4);p.cubicTo(0,7,3,22,14,21);p.quadTo(18,20,19,15);canvas.drawPath(p,paint);canvas.drawLine(18,3,18,7,paint);canvas.drawLine(16,5,20,5,paint);
        }
        canvas.restore();
    }
    @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
    @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
    @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
}
