.class public final Lc7/TutorialManager;
.super Ljava/lang/Object;
.source "TutorialManager.java"

# static fields
.field private static sActivity:Lcom/eljur/client/feature/main/view/MainActivity;
.field private static sPopup:Landroid/widget/PopupWindow;
.field private static sTarget:Landroid/view/View;
.field private static sStep:I
.field private static sShowing:Z

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static maybeShow(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 5
    if-eqz p0, :done

    const-string v0, "rk_feature_tutorial"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    const-string v2, "completed"
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    if-nez v0, :done

    sget-boolean v0, Lc7/TutorialManager;->sShowing:Z
    if-nez v0, :done

    const/4 v0, 0x1
    sput-boolean v0, Lc7/TutorialManager;->sShowing:Z
    sput-object p0, Lc7/TutorialManager;->sActivity:Lcom/eljur/client/feature/main/view/MainActivity;

    new-instance v0, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v1, Lc7/TutorialShowRunnable;
    invoke-direct {v1}, Lc7/TutorialShowRunnable;-><init>()V
    const-wide/16 v2, 0x7d0
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :done
    return-void
.end method

.method private static animateTarget(Landroid/view/View;)V
    .locals 8
    if-eqz p0, :done

    const/4 v0, 0x3
    new-array v1, v0, [F
    const/high16 v2, 0x3f800000    # 1.0f
    const/4 v3, 0x0
    aput v2, v1, v3
    const v4, 0x3f733333    # 0.95f
    const/4 v5, 0x1
    aput v4, v1, v5
    const/4 v4, 0x2
    aput v2, v1, v4

    const-string v4, "scaleX"
    invoke-static {p0, v4, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;
    move-result-object v4
    const-wide/16 v6, 0x2bc
    invoke-virtual {v4, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;
    const/4 v0, 0x1
    invoke-virtual {v4, v0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    const-string v4, "scaleY"
    invoke-static {p0, v4, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;
    move-result-object v4
    const-wide/16 v6, 0x2bc
    invoke-virtual {v4, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;
    const/4 v0, 0x1
    invoke-virtual {v4, v0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    :done
    return-void
.end method

.method public static showStep(I)V
    .locals 16
    sget-object v0, Lc7/TutorialManager;->sActivity:Lcom/eljur/client/feature/main/view/MainActivity;
    if-eqz v0, :fail

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z
    move-result v1
    if-nez v1, :fail

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v2

    if-nez p0, :lesson_target
    const v1, 0x7f090084
    goto :find_target

    :lesson_target
    const v1, 0x7f0903b0

    :find_target
    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :fail
    sput-object v1, Lc7/TutorialManager;->sTarget:Landroid/view/View;
    sput p0, Lc7/TutorialManager;->sStep:I

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v4
    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    const-string v5, "tutorial_coachmark"
    const-string v6, "layout"
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v3, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v5
    if-eqz v5, :fail

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;
    move-result-object v6
    const/4 v7, 0x0
    invoke-virtual {v6, v5, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;
    move-result-object v6

    const-string v5, "tutorial_arrow_top"
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v7
    const-string v5, "tutorial_arrow_bottom"
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v8
    const-string v5, "tutorial_title"
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v9
    check-cast v9, Landroid/widget/TextView;
    const-string v5, "tutorial_body"
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v10
    check-cast v10, Landroid/widget/TextView;
    const-string v5, "tutorial_counter"
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v11
    check-cast v11, Landroid/widget/TextView;
    const-string v5, "tutorial_next"
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v12
    check-cast v12, Landroid/widget/TextView;
    const-string v5, "tutorial_skip"
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v13

    if-nez p0, :lesson_copy
    const-string v5, "Настрой нижнюю панель"
    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-string v5, "Зажми любую кнопку снизу, чтобы выбрать нужные разделы и поменять их порядок."
    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-string v5, "1 из 2"
    invoke-virtual {v11, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/16 v5, 0x8
    invoke-virtual {v7, v5}, Landroid/view/View;->setVisibility(I)V
    const/4 v5, 0x0
    invoke-virtual {v8, v5}, Landroid/view/View;->setVisibility(I)V
    goto :copy_done

    :lesson_copy
    const-string v5, "Настрой учебный день"
    invoke-virtual {v9, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-string v5, "Нажми на плашку урока: здесь можно поправить звонок, выбрать профиль или добавить классный час."
    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-string v5, "2 из 2"
    invoke-virtual {v11, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-string v5, "Готово"
    invoke-virtual {v12, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/4 v5, 0x0
    invoke-virtual {v7, v5}, Landroid/view/View;->setVisibility(I)V
    const/16 v5, 0x8
    invoke-virtual {v8, v5}, Landroid/view/View;->setVisibility(I)V

    :copy_done
    new-instance v5, Lc7/TutorialNextClickListener;
    invoke-direct {v5}, Lc7/TutorialNextClickListener;-><init>()V
    invoke-virtual {v12, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    new-instance v5, Lc7/TutorialSkipClickListener;
    invoke-direct {v5}, Lc7/TutorialSkipClickListener;-><init>()V
    invoke-virtual {v13, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string v5, "tutorial_hand"
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v5
    const-string v7, "tutorial_hand_pulse"
    const-string v8, "anim"
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v9
    invoke-virtual {v3, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v7
    if-eqz v7, :hand_done
    invoke-static {v0, v7}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;
    move-result-object v7
    invoke-virtual {v5, v7}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V
    :hand_done

    new-instance v14, Landroid/widget/PopupWindow;
    const/4 v5, -0x1
    const/4 v7, -0x2
    const/4 v8, 0x1
    invoke-direct {v14, v6, v5, v7, v8}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V
    const/4 v5, 0x0
    invoke-virtual {v14, v5}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V
    new-instance v7, Landroid/graphics/drawable/ColorDrawable;
    invoke-direct {v7, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    invoke-virtual {v14, v7}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    const/high16 v7, 0x41800000    # 16.0f
    mul-float/2addr v7, v4
    invoke-virtual {v14, v7}, Landroid/widget/PopupWindow;->setElevation(F)V
    sput-object v14, Lc7/TutorialManager;->sPopup:Landroid/widget/PopupWindow;

    const/4 v7, 0x0
    invoke-virtual {v6, v7}, Landroid/view/View;->setAlpha(F)V
    const/high16 v7, 0x41900000    # 18.0f
    mul-float/2addr v7, v4
    invoke-virtual {v6, v7}, Landroid/view/View;->setTranslationY(F)V

    if-nez p0, :show_below_lesson
    const/high16 v7, 0x42c00000    # 96.0f
    mul-float/2addr v7, v4
    float-to-int v7, v7
    const/16 v8, 0x51
    const/4 v9, 0x0
    invoke-virtual {v14, v2, v8, v9, v7}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V
    goto :shown

    :show_below_lesson
    const/4 v7, 0x2
    new-array v7, v7, [I
    invoke-virtual {v1, v7}, Landroid/view/View;->getLocationOnScreen([I)V
    const/4 v8, 0x1
    aget v8, v7, v8
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I
    move-result v9
    add-int/2addr v8, v9
    const/high16 v9, 0x41200000    # 10.0f
    mul-float/2addr v9, v4
    float-to-int v9, v9
    add-int/2addr v8, v9
    const/16 v9, 0x31
    const/4 v10, 0x0
    invoke-virtual {v14, v2, v9, v10, v8}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    :shown
    invoke-virtual {v6}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v7
    const/high16 v8, 0x3f800000    # 1.0f
    invoke-virtual {v7, v8}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v7
    const/4 v8, 0x0
    int-to-float v8, v8
    invoke-virtual {v7, v8}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v7
    const-wide/16 v8, 0x118
    invoke-virtual {v7, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v7
    new-instance v8, Landroid/view/animation/OvershootInterpolator;
    const/high16 v9, 0x3f400000    # 0.75f
    invoke-direct {v8, v9}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V
    invoke-virtual {v7, v8}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;
    move-result-object v7
    invoke-virtual {v7}, Landroid/view/ViewPropertyAnimator;->start()V

    invoke-static {v1}, Lc7/TutorialManager;->animateTarget(Landroid/view/View;)V
    return-void

    :fail
    invoke-static {}, Lc7/TutorialManager;->finish()V
    return-void
.end method

.method private static dismissCurrent()V
    .locals 3
    sget-object v0, Lc7/TutorialManager;->sPopup:Landroid/widget/PopupWindow;
    if-eqz v0, :target
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z
    move-result v1
    if-eqz v1, :target
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :target
    sget-object v0, Lc7/TutorialManager;->sTarget:Landroid/view/View;
    if-eqz v0, :clear
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v1
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V
    const/high16 v1, 0x3f800000    # 1.0f
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    :clear
    const/4 v0, 0x0
    sput-object v0, Lc7/TutorialManager;->sPopup:Landroid/widget/PopupWindow;
    sput-object v0, Lc7/TutorialManager;->sTarget:Landroid/view/View;
    return-void
.end method

.method public static advance()V
    .locals 1
    sget v0, Lc7/TutorialManager;->sStep:I
    invoke-static {}, Lc7/TutorialManager;->dismissCurrent()V
    if-nez v0, :complete
    const/4 v0, 0x1
    invoke-static {v0}, Lc7/TutorialManager;->showStep(I)V
    return-void

    :complete
    invoke-static {}, Lc7/TutorialManager;->finish()V
    return-void
.end method

.method public static finish()V
    .locals 4
    invoke-static {}, Lc7/TutorialManager;->dismissCurrent()V
    sget-object v0, Lc7/TutorialManager;->sActivity:Lcom/eljur/client/feature/main/view/MainActivity;
    if-eqz v0, :clear
    const-string v1, "rk_feature_tutorial"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v1, "completed"
    const/4 v2, 0x1
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :clear
    const/4 v0, 0x0
    sput-boolean v0, Lc7/TutorialManager;->sShowing:Z
    const/4 v1, 0x0
    sput-object v1, Lc7/TutorialManager;->sActivity:Lcom/eljur/client/feature/main/view/MainActivity;
    return-void
.end method
