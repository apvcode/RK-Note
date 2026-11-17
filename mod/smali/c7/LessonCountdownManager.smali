.class public final Lc7/LessonCountdownManager;
.super Ljava/lang/Object;
.source "LessonCountdownManager.java"


# static fields
.field public static sContainer:Landroid/view/View;

.field public static sCurrentActiveLessonNum:Ljava/lang/String;

.field public static sDotView:Landroid/widget/TextView;

.field public static sHandler:Landroid/os/Handler;

.field public static sHomeroomActive:Z

.field public static sHomeroomAfter:I

.field public static sHomeroomDuration:I

.field public static sLessons:Ljava/util/List;

.field public static sLessonDurationToday:I

.field public static sPrevAdjustedEnd:J

.field public static sPrevOrigEnd:J

.field public static sTicker:Ljava/lang/Runnable;

.field public static sTimerView:Landroid/widget/TextView;

.field public static sTitleView:Landroid/widget/TextView;

.field public static sLastUiTitle:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Lc7/LessonCountdownManager;->sLessons:Ljava/util/List;

    sput-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;

    sput-object v0, Lc7/LessonCountdownManager;->sDotView:Landroid/widget/TextView;

    sput-object v0, Lc7/LessonCountdownManager;->sTitleView:Landroid/widget/TextView;

    sput-object v0, Lc7/LessonCountdownManager;->sTimerView:Landroid/widget/TextView;

    sput-object v0, Lc7/LessonCountdownManager;->sHandler:Landroid/os/Handler;

    sput-object v0, Lc7/LessonCountdownManager;->sTicker:Ljava/lang/Runnable;

    const-string v0, ""

    sput-object v0, Lc7/LessonCountdownManager;->sCurrentActiveLessonNum:Ljava/lang/String;
    sput-object v0, Lc7/LessonCountdownManager;->sLastUiTitle:Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lc7/LessonCountdownManager;->sHomeroomActive:Z

    const/4 v0, -0x1

    sput v0, Lc7/LessonCountdownManager;->sHomeroomAfter:I

    const/16 v0, 0x28

    sput v0, Lc7/LessonCountdownManager;->sHomeroomDuration:I

    const/16 v0, 0x2d

    sput v0, Lc7/LessonCountdownManager;->sLessonDurationToday:I

    const-wide/16 v0, 0x0

    sput-wide v0, Lc7/LessonCountdownManager;->sPrevAdjustedEnd:J

    sput-wide v0, Lc7/LessonCountdownManager;->sPrevOrigEnd:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attachView(Landroid/view/View;)V
    .locals 2
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->attach(Landroid/view/View;)V

    if-nez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    const v0, 0x7f0903b0

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    sput-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;

    invoke-static {v0}, Lc7/BlurHelper;->setupTopBar(Landroid/view/View;)V

    const v1, 0x7f0903b1

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sput-object v1, Lc7/LessonCountdownManager;->sDotView:Landroid/widget/TextView;

    const v1, 0x7f0903b2

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sput-object v1, Lc7/LessonCountdownManager;->sTitleView:Landroid/widget/TextView;

    const v1, 0x7f0903b3

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    sput-object p0, Lc7/LessonCountdownManager;->sTimerView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lc7/LessonCountdownManager;->restoreHomeroom(Landroid/content/Context;)V

    new-instance p0, Lc7/LessonPillClickListener;

    invoke-direct {p0}, Lc7/LessonPillClickListener;-><init>()V

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Lc7/LessonCountdownManager;->startTicker()V

    invoke-static {}, Lc7/LessonCountdownManager;->requestTick()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return-void

    :catch_all
    return-void
.end method

.method public static highlightIfActive(Landroid/widget/TextView;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    if-eqz p0, :cond_3

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    sget-object v0, Lc7/LessonCountdownManager;->sCurrentActiveLessonNum:Ljava/lang/String;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    const p2, 0x7f070205

    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    const p2, -0xff198a

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    const p0, 0x7f070206

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "\u25cf \u0421\u0415\u0419\u0427\u0410\u0421  "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string p3, "bg_lesson_number"

    invoke-static {p2, p3}, Lc7/LessonCountdownManager;->getDrawableResId(Landroid/content/Context;Ljava/lang/String;)I

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    const p2, -0x5e5e56

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p3, "bg_time_pill"

    invoke-static {p0, p3}, Lc7/LessonCountdownManager;->getDrawableResId(Landroid/content/Context;Ljava/lang/String;)I

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return-void

    :catch_all
    nop

    :cond_2
    :goto_0
    return-void

    :cond_3
    return-void
.end method

.method private static getDrawableResId(Landroid/content/Context;Ljava/lang/String;)I
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v1, "drawable"

    invoke-virtual {v0, p1, v1, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return p0

    :catch_all
    const/4 p0, 0x0

    return p0
.end method

.method public static onDiaryDataLoaded(Ljava/util/List;)V
    .locals 8

    if-eqz p0, :cond_empty_input

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :cond_empty_input

    :cond_empty_input
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lc7/LessonCountdownManager;->sLessons:Ljava/util/List;

    invoke-static {}, Lc7/LessonCountdownManager;->requestTick()V

    return-void

    :cond_0
    :try_start_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Lla/f;

    if-eqz v6, :cond_1

    check-cast v5, Lla/f;

    iget-object v6, v5, Lla/f;->a:Ljava/util/Date;

    if-eqz v6, :cond_1

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v6

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v7

    if-ne v6, v2, :cond_1

    if-ne v7, v4, :cond_1

    iget-object v6, v5, Lla/f;->e:Ljava/lang/Object;

    instance-of v6, v6, Ljava/util/List;

    if-eqz v6, :cond_2

    iget-object p0, v5, Lla/f;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    sput-object p0, Lc7/LessonCountdownManager;->sLessons:Ljava/util/List;

    :cond_2
    invoke-static {}, Lc7/LessonCountdownManager;->startTicker()V

    invoke-static {}, Lc7/LessonCountdownManager;->requestTick()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return-void

    :catch_all
    nop

    :cond_3
    # Page changes often deliver a week that does not contain today.  Keep the
    # already cached lesson list instead of replacing it with an empty list;
    # otherwise merely swiping the diary makes the live pill say “no lessons”.
    invoke-static {}, Lc7/LessonCountdownManager;->startTicker()V
    invoke-static {}, Lc7/LessonCountdownManager;->requestTick()V

    :cond_4
    :goto_1
    return-void
.end method

.method public static resetHomeroom()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lc7/LessonCountdownManager;->sHomeroomActive:Z

    const/4 v0, -0x1

    sput v0, Lc7/LessonCountdownManager;->sHomeroomAfter:I

    sget-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;

    if-eqz v0, :cond_prefs_done

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "lesson_schedule_prefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "homeroom_active"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "homeroom_after"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "homeroom_duration"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_prefs_done

    invoke-static {}, Lc7/LessonCountdownManager;->updateTick()V

    sget-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u041a\u043b\u0430\u0441\u0441\u043d\u044b\u0439 \u0447\u0430\u0441 \u0441\u0431\u0440\u043e\u0448\u0435\u043d (\u043e\u0431\u044b\u0447\u043d\u043e\u0435 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435)"

    const/4 v1, 0x0

    invoke-static {v0, v1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return-void

    :catch_all
    nop

    :cond_0
    return-void
.end method

.method public static restoreHomeroom(Landroid/content/Context;)V
    .locals 4

    if-eqz p0, :cond_done

    :try_start_0
    const-string v0, "lesson_schedule_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "homeroom_active"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lc7/LessonCountdownManager;->sHomeroomActive:Z

    const-string v2, "homeroom_after"

    const/4 v3, -0x1

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    sput v2, Lc7/LessonCountdownManager;->sHomeroomAfter:I

    const-string v2, "homeroom_duration"

    const/16 v3, 0x28

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    sput p0, Lc7/LessonCountdownManager;->sHomeroomDuration:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    :catch_all
    :cond_done
    return-void
.end method

.method public static detachView()V
    .locals 2

    sget-object v0, Lc7/LessonCountdownManager;->sHandler:Landroid/os/Handler;

    sget-object v1, Lc7/LessonCountdownManager;->sTicker:Ljava/lang/Runnable;

    if-eqz v0, :cond_clear

    if-eqz v1, :cond_clear

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_clear
    const/4 v0, 0x0

    sput-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;
    sput-object v0, Lc7/LessonCountdownManager;->sDotView:Landroid/widget/TextView;
    sput-object v0, Lc7/LessonCountdownManager;->sTitleView:Landroid/widget/TextView;
    sput-object v0, Lc7/LessonCountdownManager;->sTimerView:Landroid/widget/TextView;
    sput-object v0, Lc7/LessonCountdownManager;->sHandler:Landroid/os/Handler;
    sput-object v0, Lc7/LessonCountdownManager;->sTicker:Ljava/lang/Runnable;

    return-void
.end method

.method public static setHomeroom(II)V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lc7/LessonCountdownManager;->sHomeroomActive:Z

    sput p0, Lc7/LessonCountdownManager;->sHomeroomAfter:I

    sput p1, Lc7/LessonCountdownManager;->sHomeroomDuration:I

    # The setting is expected to survive recreation of the app.  The dialog is
    # opened from the pill, so its context is available through sContainer.
    sget-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;

    if-eqz v0, :cond_persist_done

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string p0, "lesson_schedule_prefs"

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string p0, "homeroom_active"

    const/4 p1, 0x1

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string p0, "homeroom_after"

    sget p1, Lc7/LessonCountdownManager;->sHomeroomAfter:I

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string p0, "homeroom_duration"

    sget p1, Lc7/LessonCountdownManager;->sHomeroomDuration:I

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_persist_done

    invoke-static {}, Lc7/LessonCountdownManager;->updateTick()V

    sget-object p0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;

    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string p1, "\u041a\u043b\u0430\u0441\u0441\u043d\u044b\u0439 \u0447\u0430\u0441 \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d: \u0441\u0434\u0432\u0438\u0433 \u043f\u0440\u0438\u043c\u0435\u043d\u0451\u043d!"

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return-void

    :catch_all
    nop

    :cond_0
    return-void
.end method

.method public static showHomeroomDialog(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->open(Landroid/content/Context;)V
    return-void
.end method

.method private static startTicker()V
    .locals 2
    sget-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;
    if-nez v0, :schedule_has_container
    return-void
    :schedule_has_container

    :try_start_0
    sget-object v0, Lc7/LessonCountdownManager;->sHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lc7/LessonCountdownManager;->sHandler:Landroid/os/Handler;

    :cond_0
    sget-object v0, Lc7/LessonCountdownManager;->sTicker:Ljava/lang/Runnable;

    if-nez v0, :cond_1

    new-instance v0, Lc7/LessonTickerRunnable;

    invoke-direct {v0}, Lc7/LessonTickerRunnable;-><init>()V

    sput-object v0, Lc7/LessonCountdownManager;->sTicker:Ljava/lang/Runnable;

    sget-object v1, Lc7/LessonCountdownManager;->sHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sget-object v0, Lc7/LessonCountdownManager;->sHandler:Landroid/os/Handler;

    sget-object v1, Lc7/LessonCountdownManager;->sTicker:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return-void

    :catch_all
    nop

    :cond_1
    return-void
.end method

.method private static requestTick()V
    .locals 0
    invoke-static {}, Lc7/LessonCountdownManager;->startTicker()V
    invoke-static {}, Lrk/schedule/ScheduleBridge;->requestTick()V
    return-void
.end method

.method public static getTodayLessonMillis(Ljava/util/Date;Ljava/util/Calendar;Ljava/util/Calendar;)J
    .locals 3

    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    :try_start_0
    invoke-virtual {p1, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/16 p0, 0xb

    invoke-virtual {p1, p0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    const/16 v1, 0xc

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    invoke-virtual {p2, p0, v0}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {p2, v1, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    const/4 p1, 0x0

    invoke-virtual {p2, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {p2, p0, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return-wide p0

    :catch_all
    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method private static showHomeroomUiIfRelevant()Z
    .locals 14

    const/4 v0, 0x0
    sget-object v1, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;
    if-eqz v1, :done
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0}, Lc7/ScheduleSettingsHelper;->getHomeroomStart(Landroid/content/Context;)J
    move-result-wide v1
    invoke-static {v0}, Lc7/ScheduleSettingsHelper;->getHomeroomEnd(Landroid/content/Context;)J
    move-result-wide v3
    const-wide/16 v5, 0x0
    cmp-long v0, v1, v5
    if-lez v0, :done
    cmp-long v0, v3, v1
    if-lez v0, :done
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v5
    cmp-long v0, v5, v1
    if-gez v0, :check_active_homeroom

    # Before the event, show it only when it is earlier than the first diary
    # lesson.  This handles “class hour instead of lesson 1” even if the
    # diary starts its list at lesson 2, without hiding a real earlier lesson.
    sget-object v7, Lc7/LessonCountdownManager;->sLessons:Ljava/util/List;
    if-eqz v7, :show_upcoming_homeroom
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v8
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v9
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v10
    :find_first_lesson
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z
    move-result v11
    if-eqz v11, :show_upcoming_homeroom
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v11
    instance-of v12, v11, Lla/h;
    if-eqz v12, :find_first_lesson
    check-cast v11, Lla/h;
    iget-object v11, v11, Lla/h;->e:Ljava/util/Date;
    invoke-static {v11, v9, v10}, Lc7/LessonCountdownManager;->getTodayLessonMillis(Ljava/util/Date;Ljava/util/Calendar;Ljava/util/Calendar;)J
    move-result-wide v12
    cmp-long v11, v1, v12
    if-gtz v11, :done
    :show_upcoming_homeroom
    sub-long v5, v1, v5
    const-string v0, "🏫"
    const-string v1, "Следующее событие: классный час"
    const v2, 0x7f070204
    const v3, -0x4cf00
    invoke-static {v5, v6}, Lc7/LessonCountdownManager;->formatMinutes(J)Ljava/lang/String;
    move-result-object v4
    invoke-static {v0, v1, v2, v3, v4}, Lc7/LessonCountdownManager;->setUi(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    const-string v0, ""
    sput-object v0, Lc7/LessonCountdownManager;->sCurrentActiveLessonNum:Ljava/lang/String;
    const/4 v0, 0x1
    return v0
    :check_active_homeroom
    cmp-long v0, v5, v3
    if-ltz v0, :show_active_homeroom
    goto :done
    :show_active_homeroom
    sub-long v5, v3, v5
    const-string v0, "🏫"
    const-string v1, "Классный час • идёт"
    const v2, 0x7f070203
    const v3, -0xff198a
    invoke-static {v5, v6}, Lc7/LessonCountdownManager;->formatSeconds(J)Ljava/lang/String;
    move-result-object v4
    invoke-static {v0, v1, v2, v3, v4}, Lc7/LessonCountdownManager;->setUi(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    const-string v0, ""
    sput-object v0, Lc7/LessonCountdownManager;->sCurrentActiveLessonNum:Ljava/lang/String;
    const/4 v0, 0x1
    return v0
    :done
    const/4 v0, 0x0
    return v0
.end method

.method public static updateTick()V
    .locals 0
    invoke-static {}, Lrk/schedule/ScheduleBridge;->tick()V
    return-void
.end method

.method private static formatMinutes(J)Ljava/lang/String;
    .locals 3

    const-wide/32 v0, 0xea60

    div-long/2addr p0, v0

    long-to-int p0, p0

    const/4 p1, 0x1

    if-ge p0, p1, :cond_0

    const-string p0, "< 1\u00a0\u043c\u0438\u043d"

    return-object p0

    :cond_0
    const/16 v0, 0x3c

    if-lt p0, v0, :cond_1

    div-int/lit8 v0, p0, 0x3c

    rem-int/lit8 p0, p0, 0x3c

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\u00a0\u0447\u00a0"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "\u00a0\u043c\u0438\u043d"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "\u00a0\u043c\u0438\u043d"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static formatSeconds(J)Ljava/lang/String;
    .locals 5

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gez v2, :cond_non_neg

    const-wide/16 p0, 0x0

    :cond_non_neg
    const-wide/32 v0, 0x36ee80

    cmp-long v2, p0, v0

    if-ltz v2, :cond_format_sec

    invoke-static {p0, p1}, Lc7/LessonCountdownManager;->formatMinutes(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_format_sec
    const-wide/32 v0, 0xea60

    div-long v2, p0, v0

    long-to-int v2, v2

    rem-long/2addr p0, v0

    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    long-to-int p0, p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v0, 0xa

    if-ge v2, v0, :cond_0

    const-string v1, "0"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-ge p0, v0, :cond_1

    const-string v0, "0"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static setUi(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    .locals 3

    # The timer changes every second; animate only a real status/title change.
    sget-object v0, Lc7/LessonCountdownManager;->sLastUiTitle:Ljava/lang/String;
    if-eqz v0, :animate_change
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :no_change_animation
    :animate_change
    sput-object p1, Lc7/LessonCountdownManager;->sLastUiTitle:Ljava/lang/String;
    sget-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;
    if-eqz v0, :no_change_animation
    const v1, 0x3f3d70a4    # 0.74f
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/high16 v1, 0x3f800000    # 1.0f
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v1, 0xb4
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V
    :no_change_animation

    sget-object v0, Lc7/LessonCountdownManager;->sDotView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    invoke-static {v0, p0, p3}, Lrk/schedule/BannerGlyph;->apply(Landroid/widget/TextView;Ljava/lang/String;I)V

    :cond_0
    sget-object p0, Lc7/LessonCountdownManager;->sTitleView:Landroid/widget/TextView;

    if-eqz p0, :cond_1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    sget-object p0, Lc7/LessonCountdownManager;->sTimerView:Landroid/widget/TextView;

    if-eqz p0, :cond_2

    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    sget-object p0, Lc7/LessonCountdownManager;->sTimerView:Landroid/widget/TextView;

    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    sget-object p0, Lc7/LessonCountdownManager;->sTimerView:Landroid/widget/TextView;

    invoke-virtual {p0, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void
.end method

.method public static showWeekendOrRelaxUi()V
    .locals 5

    sget-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x7

    if-ne v0, v1, :cond_2

    :cond_1
    const-string v0, "\ud83c\udf34"

    const-string v1, "\u0412\u044b\u0445\u043e\u0434\u043d\u043e\u0439 \u0434\u0435\u043d\u044c \u2022 \u0423\u0440\u043e\u043a\u043e\u0432 \u043d\u0435\u0442"

    goto :goto_0

    :cond_2
    const-string v0, "\u2728"

    const-string v1, "\u0423\u0440\u043e\u043a\u043e\u0432 \u043d\u0430 \u0441\u0435\u0433\u043e\u0434\u043d\u044f \u043d\u0435\u0442"

    :goto_0
    const v2, 0x7f070203

    const v3, -0xff198a

    const-string v4, "\u041e\u0442\u0434\u044b\u0445\u0430\u0439!"

    invoke-static {v0, v1, v2, v3, v4}, Lc7/LessonCountdownManager;->setUi(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    const-string v0, ""

    sput-object v0, Lc7/LessonCountdownManager;->sCurrentActiveLessonNum:Ljava/lang/String;

    return-void
.end method
