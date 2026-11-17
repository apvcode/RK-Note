.class public final Lc7/GreetingManager;
.super Ljava/lang/Object;
.source "GreetingManager.java"


# static fields
.field private static sAnimated:Z

.field private static sScheduled:Z

.field private static sContainer:Landroid/view/View;

.field private static sIcon:Landroid/widget/ImageView;

.field private static sLesson:Landroid/view/View;

.field private static sSubtitle:Landroid/widget/TextView;

.field private static sTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attachView(Landroid/view/View;)V
    .locals 4

    if-eqz p0, :return

    const v0, 0x7f0903bf

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :return

    sput-object v0, Lc7/GreetingManager;->sContainer:Landroid/view/View;

    const v1, 0x7f0903c0

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    sput-object v1, Lc7/GreetingManager;->sIcon:Landroid/widget/ImageView;

    const v1, 0x7f0903c1

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sput-object v1, Lc7/GreetingManager;->sTitle:Landroid/widget/TextView;

    const v1, 0x7f0903c2

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    sput-object p0, Lc7/GreetingManager;->sSubtitle:Landroid/widget/TextView;

    const v1, 0x7f0903b0

    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    sput-object v1, Lc7/GreetingManager;->sLesson:Landroid/view/View;

    if-eqz v1, :lesson_ready

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    :lesson_ready
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lc7/GreetingManager;->isEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :hide

    sget-boolean v1, Lc7/GreetingManager;->sAnimated:Z

    if-nez v1, :hide

    sget-boolean v1, Lc7/GreetingManager;->sScheduled:Z

    if-nez v1, :return

    const/4 v1, 0x1

    sput-boolean v1, Lc7/GreetingManager;->sScheduled:Z

    new-instance v1, Lc7/GreetingShowRunnable;

    invoke-direct {v1}, Lc7/GreetingShowRunnable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :hide
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :return
    return-void
.end method

.method public static hideNow()V
    .locals 3

    sget-object v0, Lc7/GreetingManager;->sContainer:Landroid/view/View;

    if-eqz v0, :return

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    sget-object v0, Lc7/GreetingManager;->sLesson:Landroid/view/View;

    if-eqz v0, :return

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    :return
    return-void
.end method

.method public static dismissAnimated()V
    .locals 5

    sget-object v0, Lc7/GreetingManager;->sContainer:Landroid/view/View;

    if-eqz v0, :return

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :return

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, -0x3f800000    # -4.0f

    mul-float/2addr v2, v1

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x104

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lc7/GreetingHideRunnable;

    invoke-direct {v1}, Lc7/GreetingHideRunnable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    sget-object v0, Lc7/GreetingManager;->sLesson:Landroid/view/View;

    if-eqz v0, :return

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x118

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :return
    return-void
.end method

.method public static isEnabled(Landroid/content/Context;)Z
    .locals 3

    if-eqz p0, :disabled

    const-string v0, "rk_greeting_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "enabled"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :disabled
    const/4 p0, 0x0

    return p0
.end method

.method public static setEnabled(Landroid/content/Context;Z)V
    .locals 3

    if-eqz p0, :return

    const-string v0, "rk_greeting_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "enabled"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-nez p1, :return

    invoke-static {}, Lc7/GreetingManager;->hideNow()V

    :return
    return-void
.end method

.method public static showDelayed()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lc7/GreetingManager;->sScheduled:Z

    sget-object v0, Lc7/GreetingManager;->sContainer:Landroid/view/View;

    if-eqz v0, :return

    sget-boolean v1, Lc7/GreetingManager;->sAnimated:Z

    if-nez v1, :return

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lc7/GreetingManager;->isEnabled(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :return

    invoke-static {v1}, Lc7/GreetingManager;->showGreeting(Landroid/content/Context;)V

    :return
    return-void
.end method

.method private static showGreeting(Landroid/content/Context;)V
    .locals 11

    sget-object v0, Lc7/GreetingManager;->sContainer:Landroid/view/View;

    sget-object v1, Lc7/GreetingManager;->sIcon:Landroid/widget/ImageView;

    sget-object v2, Lc7/GreetingManager;->sTitle:Landroid/widget/TextView;

    sget-object v3, Lc7/GreetingManager;->sSubtitle:Landroid/widget/TextView;

    if-eqz v0, :return

    if-eqz v1, :return

    if-eqz v2, :return

    if-eqz v3, :return

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v4

    const/16 v5, 0xb

    invoke-virtual {v4, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 v5, 0x6

    if-ge v4, v5, :check_morning_end

    goto :night

    :check_morning_end
    const/16 v5, 0xc

    if-ge v4, v5, :check_day_end

    const-string v5, "Доброе утро"

    const-string v6, "Пусть день начнётся легко"

    const v7, 0x7f070207

    goto :apply_content

    :check_day_end
    const/16 v5, 0x12

    if-ge v4, v5, :check_evening_end

    const-string v5, "Добрый день"

    const-string v6, "Хорошего и продуктивного дня"

    const v7, 0x7f070208

    goto :apply_content

    :check_evening_end
    const/16 v5, 0x17

    if-ge v4, v5, :night

    const-string v5, "Добрый вечер"

    const-string v6, "Можно немного выдохнуть"

    const v7, 0x7f070209

    goto :apply_content

    :night
    const-string v5, "Доброй ночи"

    const-string v6, "Время беречь силы"

    const v7, 0x7f07020a

    :apply_content
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    sget-object v4, Lc7/GreetingManager;->sLesson:Landroid/view/View;

    if-eqz v4, :lesson_hidden

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setAlpha(F)V

    :lesson_hidden

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-static {v0}, Lc7/BlurHelper;->setupTopBar(Landroid/view/View;)V

    const/4 v4, 0x1

    sput-boolean v4, Lc7/GreetingManager;->sAnimated:Z

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Landroid/view/View;->setAlpha(F)V

    const/high16 v6, -0x3f000000    # -8.0f

    mul-float/2addr v6, v5

    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v6, v7}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    const-wide/16 v8, 0x140

    invoke-virtual {v6, v8, v9}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    new-instance v8, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v8, v9}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v6, v8}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/ViewPropertyAnimator;->start()V

    const v6, 0x3f47ae14    # 0.78f

    invoke-virtual {v1, v6}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v1, v6}, Landroid/view/View;->setScaleY(F)V

    const/high16 v6, -0x3ee00000    # -10.0f

    invoke-virtual {v1, v6}, Landroid/view/View;->setRotation(F)V

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v6, 0x2bc

    invoke-virtual {v1, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v6, Landroid/view/animation/OvershootInterpolator;

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v6, v7}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    invoke-virtual {v1, v6}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v1, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v6, Lc7/GreetingDismissRunnable;

    invoke-direct {v6}, Lc7/GreetingDismissRunnable;-><init>()V

    const-wide/16 v7, 0x1388

    invoke-virtual {v1, v6, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :return
    return-void
.end method
