.class public final Lrk/schedule/ScheduleUi;
.super Ljava/lang/Object;
.source "ScheduleUi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/schedule/ScheduleUi$Icon;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activitySource(Landroid/content/Context;)Landroid/view/ViewGroup;
    .registers 2

    .line 43
    nop

    .line 44
    :goto_1
    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_22

    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_16

    check-cast p0, Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    return-object p0

    :cond_16
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    if-ne v0, p0, :cond_20

    goto :goto_22

    :cond_20
    move-object p0, v0

    goto :goto_1

    .line 45
    :cond_22
    :goto_22
    const/4 p0, 0x0

    return-object p0
.end method

.method public static dp(Landroid/content/Context;F)I
    .registers 2

    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static enter(Landroid/view/View;IZ)V
    .registers 7

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lrk/schedule/ScheduleUi;->motion(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    .line 33
    :cond_b
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz p2, :cond_1f

    const/high16 v2, 0x41b00000    # 22.0f

    goto :goto_21

    :cond_1f
    const/high16 v2, 0x41000000    # 8.0f

    :goto_21
    invoke-static {v1, v2}, Lrk/schedule/ScheduleUi;->dp(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 34
    const v1, 0x3f7c28f6    # 0.985f

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz p2, :cond_34

    const v3, 0x3f7c28f6    # 0.985f

    goto :goto_36

    :cond_34
    const/high16 v3, 0x3f800000    # 1.0f

    :goto_36
    invoke-virtual {p0, v3}, Landroid/view/View;->setScaleX(F)V

    if-eqz p2, :cond_3c

    goto :goto_3e

    :cond_3c
    const/high16 v1, 0x3f800000    # 1.0f

    :goto_3e
    invoke-virtual {p0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    if-eqz p2, :cond_5f

    const-wide/16 p1, 0x104

    goto :goto_61

    :cond_5f
    const-wide/16 p1, 0xd2

    :goto_61
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    const p2, 0x3fd9999a    # 1.7f

    invoke-direct {p1, p2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 36
    return-void
.end method

.method public static glass(Landroid/app/Dialog;Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;IIZ)Landroid/view/View;
    .registers 17

    .line 49
    const/16 v9, 0x1a

    if-eqz p3, :cond_5c

    .line 50
    :try_start_4
    const-string v0, "eightbitlab.com.blurview.BlurView"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v1, v4

    invoke-virtual {v2, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    new-array v3, v0, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/widget/FrameLayout;

    .line 51
    const v1, -0xe8dfd4

    if-ne p5, v1, :cond_28

    const/4 v7, 0x1

    goto :goto_29

    :cond_28
    const/4 v7, 0x0

    .line 52
    :goto_29
    invoke-static {p1, v4, v9}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 53
    new-instance v1, Lrk/schedule/ScheduleUi$1;

    invoke-direct {v1, p1}, Lrk/schedule/ScheduleUi$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    invoke-virtual {v3, v0}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V

    .line 54
    invoke-virtual {p2, v4}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    if-eqz p6, :cond_45

    const/4 v4, -0x1

    goto :goto_46

    :cond_45
    const/4 v4, -0x2

    :goto_46
    invoke-direct {v0, v1, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, p2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    new-instance v0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;

    move-object v1, p0

    move-object v6, p1

    move-object v8, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v8}, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;-><init>(Landroid/app/Dialog;Ljava/lang/Class;Landroid/widget/FrameLayout;Landroid/view/ViewGroup;ILandroid/content/Context;ZLandroid/view/ViewGroup;)V

    invoke-virtual {v3, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 66
    return-object v3

    .line 67
    :catch_5a
    move-exception v0

    goto :goto_64

    .line 49
    :cond_5c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No source window for schedule glass"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_64} :catch_5a

    .line 67
    :goto_64
    invoke-static {p1, p4, v9}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const-string v1, "Schedule glass unavailable"

    invoke-static {v1, v0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object p2
.end method

.method static synthetic lambda$glass$1(Landroid/app/Dialog;Ljava/lang/Class;Landroid/widget/FrameLayout;Landroid/view/ViewGroup;ILandroid/content/Context;ZLandroid/view/ViewGroup;)V
    .registers 13

    .line 56
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    move-result p0

    if-nez p0, :cond_7

    return-void

    .line 58
    :cond_7
    :try_start_7
    const-string p0, "setupWith"

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Landroid/view/ViewGroup;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1, p0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v1, v0, [Ljava/lang/Object;

    aput-object p3, v1, v3

    invoke-virtual {p0, p2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 60
    const-string p3, "eightbitlab.com.blurview.BlurViewFacade"

    invoke-static {p3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p3

    const-string v1, "setFrameClearDrawable"

    new-array v2, v0, [Ljava/lang/Class;

    const-class v4, Landroid/graphics/drawable/Drawable;

    aput-object v4, v2, v3

    invoke-virtual {p3, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, p4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    new-array v2, v0, [Ljava/lang/Object;

    aput-object v1, v2, v3

    invoke-virtual {p3, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string p0, "c7.UiCustomizationManager"

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string p3, "getBlurRadius"

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v0

    invoke-virtual {p0, p3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array p3, v1, [Ljava/lang/Object;

    aput-object p5, p3, v3

    const-string v1, "blur_dock"

    aput-object v1, p3, v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    .line 62
    const-string p3, "setBlurRadius"

    new-array v1, v0, [Ljava/lang/Class;

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v2, v1, v3

    invoke-virtual {p1, p3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    new-array v1, v0, [Ljava/lang/Object;

    aput-object p0, v1, v3

    invoke-virtual {p3, p2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const-string p0, "setOverlayColor"

    new-array p3, v0, [Ljava/lang/Class;

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v1, p3, v3

    invoke-virtual {p1, p0, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    if-eqz p6, :cond_8e

    const p3, -0x47070504

    goto :goto_91

    :cond_8e
    const p3, -0x66efede8

    :goto_91
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    new-array p6, v0, [Ljava/lang/Object;

    aput-object p3, p6, v3

    invoke-virtual {p0, p2, p6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const-string p0, "setBlurAutoUpdate"

    new-array p3, v0, [Ljava/lang/Class;

    sget-object p6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object p6, p3, v3

    invoke-virtual {p1, p0, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    new-array p3, v0, [Ljava/lang/Object;

    aput-object p1, p3, v3

    invoke-virtual {p0, p2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b3
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_b3} :catch_b4

    .line 65
    goto :goto_c3

    :catch_b4
    move-exception p0

    const/16 p1, 0x1a

    invoke-static {p5, p4, p1}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {p7, p1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const-string p1, "Schedule glass fallback"

    invoke-static {p1, p0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    :goto_c3
    return-void
.end method

.method static synthetic lambda$press$0(Landroid/content/Context;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7

    .line 25
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    .line 26
    const-wide/16 v0, 0x0

    if-nez p2, :cond_2b

    invoke-static {p0}, Lrk/schedule/ScheduleUi;->motion(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const p1, 0x3f79999a    # 0.975f

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 p1, 0x64

    invoke-virtual {p0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_54

    .line 27
    :cond_2b
    const/4 v2, 0x1

    if-eq p2, v2, :cond_31

    const/4 v2, 0x3

    if-ne p2, v2, :cond_54

    :cond_31
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-static {p0}, Lrk/schedule/ScheduleUi;->motion(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_48

    const-wide/16 v2, 0xa0

    goto :goto_49

    :cond_48
    move-wide v2, v0

    :goto_49
    invoke-virtual {p1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 28
    :cond_54
    :goto_54
    const/4 p0, 0x0

    return p0
.end method

.method public static motion(Landroid/content/Context;)Z
    .registers 4

    .line 19
    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v1, "animator_duration_scale"

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {p0, v1, v2}, Landroid/provider/Settings$Global;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result p0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_d} :catch_15

    const/4 v1, 0x0

    cmpl-float p0, p0, v1

    if-lez p0, :cond_13

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    return v0

    :catch_15
    move-exception p0

    return v0
.end method

.method public static press(Landroid/view/View;I)V
    .registers 7

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 23
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    const v3, 0xffffff

    and-int/2addr p1, v3

    const/high16 v3, 0x16000000

    or-int/2addr p1, v3

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    const/4 v3, -0x1

    const/16 v4, 0xe

    invoke-static {v0, v3, v4}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-direct {v2, p1, v1, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    new-instance p1, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda1;

    invoke-direct {p1, v0}, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 30
    return-void
.end method

.method public static shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;
    .registers 4

    .line 20
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    int-to-float p1, p2

    invoke-static {p0, p1}, Lrk/schedule/ScheduleUi;->dp(Landroid/content/Context;F)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method public static window(Landroid/app/Dialog;)V
    .registers 5

    .line 38
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 39
    :cond_7
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v2, "RkScheduleMotion"

    const-string v3, "style"

    invoke-virtual {v1, v2, v3, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    .line 40
    if-eqz p0, :cond_24

    invoke-virtual {v0, p0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 41
    :cond_24
    return-void
.end method
