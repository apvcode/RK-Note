.class public final Lc7/ScheduleSettingsHelper;
.super Ljava/lang/Object;
.source "ScheduleSettingsHelper.java"

.field private static sReturnEnd:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object p0
    invoke-virtual {v0, p1, p2, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public static showBellProfilePicker(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->open(Landroid/content/Context;)V
    return-void
.end method

.method public static showBellProfileEditor(Landroid/content/Context;Ljava/lang/String;)V
    .locals 10
    if-eqz p0, :done
    :try_start
    new-instance v0, Landroid/app/Dialog;
    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z
    const-string v1, "dialog_bell_profile_editor"
    const-string v2, "layout"
    invoke-static {p0, v1, v2}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(I)V
    const-string v1, "bell_editor_title"
    const-string v2, "id"
    invoke-static {p0, v1, v2}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/widget/TextView;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "Профиль "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, " минут"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const-string v1, "lesson_schedule_prefs"
    const/4 v2, 0x0
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1
    const/4 v2, 0x1
    :loop
    const/16 v3, 0x9
    if-ge v2, v3, :buttons
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "bell_"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, "_start"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v4, "id"
    invoke-static {p0, v3, v4}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v4
    invoke-virtual {v0, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroid/widget/EditText;
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "profile_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v6, "_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v6, "_start"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    const-string v6, ""
    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    # Populate the matching end field too.  Without this, opening and saving
    # an already configured profile erased all its end times.
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "bell_"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, "_end"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v4, "id"
    invoke-static {p0, v3, v4}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v4
    invoke-virtual {v0, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroid/widget/EditText;
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "profile_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v6, "_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v6, "_end"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    const-string v6, ""
    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    add-int/lit8 v2, v2, 0x1
    goto :loop
    :buttons
    const-string v1, "bell_editor_save"
    const-string v2, "id"
    invoke-static {p0, v1, v2}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v1
    new-instance v2, Lc7/BellEditorClickListener;
    const/4 v3, 0x1
    invoke-direct {v2, p0, v0, p1, v3}, Lc7/BellEditorClickListener;-><init>(Landroid/content/Context;Landroid/app/Dialog;Ljava/lang/String;Z)V
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V
    invoke-static {v0, p0}, Lc7/BlurHelper;->setupDialogBlur(Landroid/app/Dialog;Landroid/content/Context;)V
    :try_end
    .catchall {:try_start .. :try_end} :bad
    :done
    return-void
    :bad
    move-exception v0
    const-string v1, "Opening bell editor failed"
    invoke-static {v1, v0}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    return-void
.end method

.method public static saveBellProfile(Landroid/content/Context;Landroid/app/Dialog;Ljava/lang/String;)Z
    .locals 10
    const/4 v0, 0x0
    if-eqz p0, :bad
    if-eqz p1, :bad
    :try_start
    const-string v1, "lesson_schedule_prefs"
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v1
    const/4 v2, 0x1
    :loop
    const/16 v3, 0x9
    if-ge v2, v3, :ok
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "bell_"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, "_start"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v4, "id"
    invoke-static {p0, v3, v4}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v4
    invoke-virtual {p1, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroid/widget/EditText;
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "profile_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v6, "_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v6, "_start"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    # The former implementation only persisted the start field.  That left
    # every profile incomplete, so the countdown quite correctly fell back to
    # the diary and a user could never see a selected profile take effect.
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "bell_"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, "_end"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v4, "id"
    invoke-static {p0, v3, v4}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v4
    invoke-virtual {p1, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v4
    check-cast v4, Landroid/widget/EditText;
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "profile_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v6, "_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v6, "_end"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    add-int/lit8 v2, v2, 0x1
    goto :loop
    :ok
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V
    const-string v1, "Профиль звонков сохранён"
    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    const/4 p0, 0x1
    return p0
    :try_end
    .catchall {:try_start .. :try_end} :caught
    :caught
    move-exception p1
    const-string p2, "Saving bell profile failed"
    invoke-static {p2, p1}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :bad
    return v0
.end method

# Bell profiles deliberately contain absolute times.  They never derive a
# later lesson from the list position returned by the diary.
.method public static getConfiguredLessonStart(Landroid/content/Context;Ljava/lang/String;JJ)J
    .locals 0
    invoke-static/range {p0 .. p5}, Lrk/schedule/ScheduleBridge;->start(Landroid/content/Context;Ljava/lang/String;JJ)J
    move-result-wide p0
    return-wide p0
.end method

.method public static getConfiguredLessonEnd(Landroid/content/Context;Ljava/lang/String;JJ)J
    .locals 0
    invoke-static/range {p0 .. p5}, Lrk/schedule/ScheduleBridge;->end(Landroid/content/Context;Ljava/lang/String;JJ)J
    move-result-wide p0
    return-wide p0
.end method

.method private static getConfiguredLessonMillis(Landroid/content/Context;Ljava/lang/String;JJ)J
    .locals 12

    # p2/p3 are the diary start and p4/p5 are the diary end.  Any malformed
    # profile returns that authoritative diary value without changing it.
    if-eqz p0, :fallback
    if-eqz p1, :fallback
    :try_start_profile
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v0
    const/4 v1, 0x1
    if-lt v0, v1, :fallback
    const/16 v1, 0x8
    if-le v0, v1, :slot_ok
    goto :fallback
    :slot_ok
    const-string v1, "lesson_schedule_prefs"
    const/4 v2, 0x0
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1
    invoke-static {p0}, Lc7/ScheduleSettingsHelper;->getActiveProfile(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "profile_"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "_"
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v0, "_start"
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v2, ""
    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "profile_"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-static {p0}, Lc7/ScheduleSettingsHelper;->getActiveProfile(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, "_"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, "_end"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    const-string v2, ":"
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
    array-length v2, v0
    const/4 v3, 0x2
    if-ne v2, v3, :fallback
    array-length v2, v1
    if-ne v2, v3, :fallback
    const/4 v2, 0x0
    aget-object v4, v0, v2
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v4
    const/4 v5, 0x1
    aget-object v0, v0, v5
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v0
    aget-object v6, v1, v2
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v6
    aget-object v1, v1, v5
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v1
    if-ltz v4, :fallback
    const/16 v7, 0x17
    if-le v4, v7, :hour1
    goto :fallback
    :hour1
    if-ltz v6, :fallback
    if-le v6, v7, :hour2
    goto :fallback
    :hour2
    if-ltz v0, :fallback
    const/16 v7, 0x3b
    if-le v0, v7, :min1
    goto :fallback
    :min1
    if-ltz v1, :fallback
    if-le v1, v7, :min2
    goto :fallback
    :min2
    mul-int/lit8 v7, v4, 0x3c
    add-int/2addr v7, v0
    mul-int/lit8 v8, v6, 0x3c
    add-int/2addr v8, v1
    if-le v8, v7, :fallback
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v7
    const/16 v8, 0xb
    sget-boolean v9, Lc7/ScheduleSettingsHelper;->sReturnEnd:Z
    if-eqz v9, :use_start
    invoke-virtual {v7, v8, v6}, Ljava/util/Calendar;->set(II)V
    const/16 v4, 0xc
    invoke-virtual {v7, v4, v1}, Ljava/util/Calendar;->set(II)V
    goto :return_cal
    :use_start
    invoke-virtual {v7, v8, v4}, Ljava/util/Calendar;->set(II)V
    const/16 v1, 0xc
    invoke-virtual {v7, v1, v0}, Ljava/util/Calendar;->set(II)V
    :return_cal
    const/16 v0, 0xd
    invoke-virtual {v7, v0, v2}, Ljava/util/Calendar;->set(II)V
    const/16 v0, 0xe
    invoke-virtual {v7, v0, v2}, Ljava/util/Calendar;->set(II)V
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J
    move-result-wide p0
    return-wide p0
    :try_end_profile
    .catchall {:try_start_profile .. :try_end_profile} :bad_profile
    :bad_profile
    move-exception v0
    const-string v1, "Invalid bell profile; using diary time"
    invoke-static {v1, v0}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :fallback
    sget-boolean v0, Lc7/ScheduleSettingsHelper;->sReturnEnd:Z
    if-eqz v0, :return_start
    return-wide p4
    :return_start
    return-wide p2
.end method

.method public static getActiveProfile(Landroid/content/Context;)Ljava/lang/String;
    .locals 6
    const-string v0, "45"
    if-eqz p0, :return
    :try_start_active
    const-string v1, "lesson_schedule_prefs"
    const/4 v2, 0x0
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1
    # A same-day choice has priority over the weekday assignment.  Earlier
    # builds wrote today_duration but never consulted it when resolving the
    # active bell profile, so choosing 40 minutes appeared to do nothing.
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v2
    const/4 v3, 0x1
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I
    move-result v3
    const/4 v4, 0x2
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I
    move-result v4
    add-int/lit8 v4, v4, 0x1
    const/4 v5, 0x5
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I
    move-result v5
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v3, "-"
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const-string v3, "today_date"
    const-string v4, ""
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :weekday_profile
    const-string p0, "today_duration"
    const/4 v3, 0x0
    invoke-interface {v1, p0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result p0
    const/16 v3, 0x28
    if-ne p0, v3, :today_35
    const-string v0, "40"
    goto :return
    :today_35
    const/16 v3, 0x23
    if-ne p0, v3, :weekday_profile
    const-string v0, "35"
    goto :return
    :weekday_profile
    const/4 v3, 0x7
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I
    move-result v3
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "dow_profile_"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-interface {v1, v3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    :try_end_active
    .catchall {:try_start_active .. :try_end_active} :bad_active
    :return
    return-object v0
    :bad_active
    move-exception v1
    const-string v2, "Reading bell profile failed"
    invoke-static {v2, v1}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    return-object v0
.end method

.method public static getLessonDurationForToday(Landroid/content/Context;)I
    .locals 7

    const/16 v0, 0x2d

    if-nez p0, :cond_0

    return v0

    :cond_0
    :try_start_0
    const-string v1, "lesson_schedule_prefs"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x5

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "-"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "-"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "today_date"

    const-string v5, ""

    invoke-interface {p0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "today_duration"

    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-lez v3, :cond_1

    return v3

    :cond_1
    const/4 v3, 0x7

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dow_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    if-lez p0, :cond_2

    return p0

    :cond_2
    return v0

    :catch_all
    move-exception v0
    const-string v1, "get lesson duration failed"
    invoke-static {v1, v0}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    const/16 v0, 0x2d
    return v0
.end method

.method public static saveDowDuration(Landroid/content/Context;ILjava/lang/String;I)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    const-string v0, "lesson_schedule_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    # Compatibility migration: the former duration picker now only chooses a
    # named profile.  Its old dow_N integer remains inert and is never read by
    # the countdown engine.
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "dow_profile_"
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "45"
    const/16 v3, 0x28
    if-ne p3, v3, :profile_35
    const-string v2, "40"
    goto :profile_save
    :profile_35
    const/16 v3, 0x23
    if-ne p3, v3, :profile_save
    const-string v2, "35"
    :profile_save
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dow_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v1, 0x2d

    if-lt p3, v1, :cond_1

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ": \u0441\u0442\u0430\u043d\u0434\u0430\u0440\u0442\u043d\u044b\u0435 \u0443\u0440\u043e\u043a\u0438 (45 \u043c\u0438\u043d)"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-interface {v0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ": \u0443\u0440\u043e\u043a\u0438 \u043f\u043e "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " \u043c\u0438\u043d \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u044b!"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    invoke-static {}, Lc7/LessonCountdownManager;->updateTick()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    return-void

    :catch_all
    move-exception v0
    const-string v1, "save weekday schedule failed"
    invoke-static {v1, v0}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    return-void
.end method

.method public static saveTodayDuration(Landroid/content/Context;I)V
    .locals 5

    if-nez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    const-string v0, "lesson_schedule_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/16 v2, 0x2d

    if-lt p1, v2, :cond_1

    const-string p1, "today_date"

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "today_duration"

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "Сегодня: используется профиль по дню недели"

    goto :goto_0

    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    const/4 v1, 0x5

    invoke-virtual {v2, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "today_date"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "today_duration"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Сегодня: выбран профиль "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " минут"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    invoke-static {}, Lc7/LessonCountdownManager;->updateTick()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    :catch_all
    return-void
.end method

.method private static parseClockMinutes(Ljava/lang/String;)I
    .locals 5
    const/4 v0, -0x1
    if-eqz p0, :bad
    :try_start_clock
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    const-string v1, ":"
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object p0
    array-length v1, p0
    const/4 v2, 0x2
    if-ne v1, v2, :bad
    const/4 v1, 0x0
    aget-object v2, p0, v1
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v2
    const/4 v3, 0x1
    aget-object p0, p0, v3
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result p0
    if-ltz v2, :bad
    const/16 v3, 0x17
    if-gt v2, v3, :bad
    if-ltz p0, :bad
    const/16 v3, 0x3b
    if-gt p0, v3, :bad
    mul-int/lit8 v2, v2, 0x3c
    add-int/2addr v2, p0
    return v2
    :try_end_clock
    .catchall {:try_start_clock .. :try_end_clock} :bad
    :bad
    return v0
.end method

.method private static todayKey()Ljava/lang/String;
    .locals 5
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v0
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I
    move-result v1
    const/4 v2, 0x2
    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I
    move-result v2
    add-int/lit8 v2, v2, 0x1
    const/4 v3, 0x5
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I
    move-result v0
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, "-"
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static saveHomeroom(Landroid/content/Context;Landroid/app/Dialog;)Z
    .locals 10
    const/4 v0, 0x0
    if-eqz p0, :bad
    if-eqz p1, :bad
    :try_start_save_homeroom
    const-string v1, "homeroom_start"
    const-string v2, "id"
    invoke-static {p0, v1, v2}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/widget/EditText;
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "homeroom_end"
    const-string v3, "id"
    invoke-static {p0, v2, v3}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v2
    invoke-virtual {p1, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/EditText;
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static {v1}, Lc7/ScheduleSettingsHelper;->parseClockMinutes(Ljava/lang/String;)I
    move-result v3
    invoke-static {v2}, Lc7/ScheduleSettingsHelper;->parseClockMinutes(Ljava/lang/String;)I
    move-result v4
    if-ltz v3, :invalid
    if-le v4, v3, :invalid
    const-string v3, "homeroom_day"
    const-string v4, "id"
    invoke-static {p0, v3, v4}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v3
    invoke-virtual {p1, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v3
    check-cast v3, Landroid/widget/Spinner;
    invoke-virtual {v3}, Landroid/widget/AdapterView;->getSelectedItemPosition()I
    move-result v3
    const-string v4, "lesson_schedule_prefs"
    invoke-virtual {p0, v4, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v4
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v4
    if-eqz v3, :today_homeroom
    const/4 v5, 0x1
    if-lt v3, v5, :invalid
    const/4 v5, 0x7
    if-le v3, v5, :weekday_homeroom
    goto :invalid
    :today_homeroom
    const-string v5, "homeroom_today_date"
    invoke-static {}, Lc7/ScheduleSettingsHelper;->todayKey()Ljava/lang/String;
    move-result-object v6
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    const-string v5, "homeroom_today_"
    goto :write_homeroom
    :weekday_homeroom
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "homeroom_dow_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v6, "_"
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    :write_homeroom
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v7, "start"
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-interface {v4, v6, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v7, "end"
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-interface {v4, v5, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    const-string v1, "homeroom_active"
    invoke-interface {v4, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    const-string v1, "homeroom_after"
    invoke-interface {v4, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    const-string v1, "homeroom_duration"
    invoke-interface {v4, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V
    const-string v1, "Классный час сохранён"
    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v1
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    invoke-static {}, Lc7/LessonCountdownManager;->updateTick()V
    const/4 v0, 0x1
    return v0
    :invalid
    const-string v1, "Укажите время в формате ЧЧ:ММ, конец должен быть позже начала"
    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v1
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    return v0
    :try_end_save_homeroom
    .catchall {:try_start_save_homeroom .. :try_end_save_homeroom} :save_homeroom_failed
    :save_homeroom_failed
    move-exception v1
    const-string v2, "Saving homeroom failed"
    invoke-static {v2, v1}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    return v0
    :bad
    return v0
.end method

.method public static populateTodayHomeroom(Landroid/content/Context;Landroid/app/Dialog;)V
    .locals 6
    if-eqz p0, :done
    if-eqz p1, :done
    :try_start_populate_homeroom
    const-string v0, "lesson_schedule_prefs"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-static {}, Lc7/ScheduleSettingsHelper;->todayKey()Ljava/lang/String;
    move-result-object v1
    const-string v2, "homeroom_today_date"
    const-string v3, ""
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :done
    const-string v1, "homeroom_start"
    const-string v2, "id"
    invoke-static {p0, v1, v2}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/widget/EditText;
    const-string v2, "homeroom_today_start"
    const-string v3, ""
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    const-string v1, "homeroom_end"
    const-string v2, "id"
    invoke-static {p0, v1, v2}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    invoke-virtual {p1, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/widget/EditText;
    const-string v2, "homeroom_today_end"
    const-string v3, ""
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    :try_end_populate_homeroom
    .catchall {:try_start_populate_homeroom .. :try_end_populate_homeroom} :failed
    :done
    return-void
    :failed
    move-exception v0
    const-string v1, "Reading saved homeroom failed"
    invoke-static {v1, v0}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    return-void
.end method

.method private static getHomeroomMillis(Landroid/content/Context;Z)J
    .locals 9
    const-wide/16 v0, 0x0
    if-eqz p0, :done
    :try_start_read_homeroom
    const-string v2, "lesson_schedule_prefs"
    const/4 v3, 0x0
    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v2
    invoke-static {}, Lc7/ScheduleSettingsHelper;->todayKey()Ljava/lang/String;
    move-result-object v3
    const-string v4, "homeroom_today_date"
    const-string v5, ""
    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :homeroom_weekday
    const-string v3, "homeroom_today_"
    goto :homeroom_key_ready
    :homeroom_weekday
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v3
    const/4 v4, 0x7
    invoke-virtual {v3, v4}, Ljava/util/Calendar;->get(I)I
    move-result v3
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "homeroom_dow_"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v3, "_"
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    :homeroom_key_ready
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    if-eqz p1, :homeroom_start_key
    const-string v3, "end"
    goto :homeroom_suffix
    :homeroom_start_key
    const-string v3, "start"
    :homeroom_suffix
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v4, ""
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static {v2}, Lc7/ScheduleSettingsHelper;->parseClockMinutes(Ljava/lang/String;)I
    move-result v2
    if-gez v2, :homeroom_time_ok
    goto :done
    :homeroom_time_ok
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v3
    div-int/lit8 v4, v2, 0x3c
    rem-int/lit8 v2, v2, 0x3c
    const/16 v5, 0xb
    invoke-virtual {v3, v5, v4}, Ljava/util/Calendar;->set(II)V
    const/16 v4, 0xc
    invoke-virtual {v3, v4, v2}, Ljava/util/Calendar;->set(II)V
    const/16 v2, 0xd
    const/4 v4, 0x0
    invoke-virtual {v3, v2, v4}, Ljava/util/Calendar;->set(II)V
    const/16 v2, 0xe
    invoke-virtual {v3, v2, v4}, Ljava/util/Calendar;->set(II)V
    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J
    move-result-wide v0
    :try_end_read_homeroom
    .catchall {:try_start_read_homeroom .. :try_end_read_homeroom} :read_homeroom_failed
    goto :done
    :read_homeroom_failed
    move-exception v2
    const-string v3, "Reading homeroom failed"
    invoke-static {v3, v2}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :done
    return-wide v0
.end method

.method public static getHomeroomStart(Landroid/content/Context;)J
    .locals 2
    const/4 v0, 0x0
    invoke-static {p0, v0}, Lc7/ScheduleSettingsHelper;->getHomeroomMillis(Landroid/content/Context;Z)J
    move-result-wide v0
    return-wide v0
.end method

.method public static getHomeroomEnd(Landroid/content/Context;)J
    .locals 2
    const/4 v0, 0x1
    invoke-static {p0, v0}, Lc7/ScheduleSettingsHelper;->getHomeroomMillis(Landroid/content/Context;Z)J
    move-result-wide v0
    return-wide v0
.end method

# Resolves the profile for the date that is being shown in the diary.  This is
# deliberately separate from getActiveProfile(), whose meaning is "right now"
# for the live countdown pill.
.method private static getProfileForDiaryDate(Landroid/content/Context;Ljava/util/Date;)Ljava/lang/String;
    .locals 7
    const-string v0, "45"
    if-eqz p0, :done
    if-eqz p1, :done
    :try_start_profile_date
    const-string v1, "lesson_schedule_prefs"
    const/4 v2, 0x0
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v2
    invoke-virtual {v2, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const/4 v4, 0x1
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I
    move-result v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, "-"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const/4 v5, 0x2
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I
    move-result v5
    add-int/lit8 v5, v5, 0x1
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const/4 v5, 0x5
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I
    move-result v5
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v5, "homeroom_today_date"
    # today_date is the profile override key; keep this literal close to the
    # comparison so it cannot accidentally be confused with homeroom settings.
    const-string v5, "today_date"
    const-string v6, ""
    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :weekday_profile_for_date
    const-string v3, "today_duration"
    const/4 v4, 0x0
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result v3
    const/16 v4, 0x28
    if-ne v3, v4, :today_35_for_date
    const-string v0, "40"
    goto :done
    :today_35_for_date
    const/16 v4, 0x23
    if-ne v3, v4, :weekday_profile_for_date
    const-string v0, "35"
    goto :done
    :weekday_profile_for_date
    const/4 v3, 0x7
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I
    move-result v3
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "dow_profile_"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-interface {v1, v3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    :try_end_profile_date
    .catchall {:try_start_profile_date .. :try_end_profile_date} :bad_profile_date
    goto :done
    :bad_profile_date
    move-exception v1
    const-string v2, "Reading diary bell profile failed"
    invoke-static {v2, v1}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :done
    return-object v0
.end method

# Returns a rendered time range for a diary lesson.  Invalid/missing slots
# always leave the diary's own text untouched.
.method public static getDiaryLessonTimeRange(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    # Disabled pending a separate, verifier-safe diary adapter implementation.
    # Keeping the safe fallback here prevents this optional UI path from ever
    # affecting the countdown or the diary itself.
    return-object p3

    if-eqz p0, :fallback
    if-eqz p1, :fallback
    if-eqz p2, :fallback
    sget-object v0, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;
    if-eqz v0, :fallback
    :try_start_diary_range
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v1
    const/4 v2, 0x1
    if-lt v1, v2, :fallback
    const/16 v2, 0x8
    if-le v1, v2, :diary_slot_ok
    goto :fallback
    :diary_slot_ok
    invoke-static {v0, p1}, Lc7/ScheduleSettingsHelper;->getProfileForDiaryDate(Landroid/content/Context;Ljava/util/Date;)Ljava/lang/String;
    move-result-object v2
    const-string v3, "lesson_schedule_prefs"
    const/4 v4, 0x0
    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "profile_"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v2, "_"
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v1, "_start"
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v3, ""
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "profile_"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v5, "_"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v5, "_end"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v1}, Lc7/ScheduleSettingsHelper;->parseClockMinutes(Ljava/lang/String;)I
    move-result v1
    invoke-static {v0}, Lc7/ScheduleSettingsHelper;->parseClockMinutes(Ljava/lang/String;)I
    move-result v0
    if-ltz v1, :fallback
    if-le v0, v1, :fallback
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v2
    invoke-virtual {v2, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    div-int/lit8 v3, v1, 0x3c
    rem-int/lit8 v1, v1, 0x3c
    const/16 v4, 0xb
    invoke-virtual {v2, v4, v3}, Ljava/util/Calendar;->set(II)V
    const/16 v3, 0xc
    invoke-virtual {v2, v3, v1}, Ljava/util/Calendar;->set(II)V
    const/16 v1, 0xd
    const/4 v5, 0x0
    invoke-virtual {v2, v1, v5}, Ljava/util/Calendar;->set(II)V
    const/16 v1, 0xe
    invoke-virtual {v2, v1, v5}, Ljava/util/Calendar;->set(II)V
    new-instance v6, Ljava/text/SimpleDateFormat;
    const-string v7, "HH:mm"
    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    move-result-object v7
    invoke-virtual {v6, v7}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v2, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    div-int/lit8 v8, v0, 0x3c
    rem-int/lit8 v0, v0, 0x3c
    invoke-virtual {v2, v4, v8}, Ljava/util/Calendar;->set(II)V
    invoke-virtual {v2, v3, v0}, Ljava/util/Calendar;->set(II)V
    const/16 v0, 0xd
    invoke-virtual {v2, v0, v5}, Ljava/util/Calendar;->set(II)V
    const/16 v0, 0xe
    invoke-virtual {v2, v0, v5}, Ljava/util/Calendar;->set(II)V
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    move-result-object v0
    invoke-virtual {v6, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v7, v0}, Lkd/e;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p3
    :try_end_diary_range
    .catchall {:try_start_diary_range .. :try_end_diary_range} :bad_diary_range
    return-object p3
    :bad_diary_range
    move-exception v0
    const-string v1, "Rendering profile time in diary failed"
    invoke-static {v1, v0}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :fallback
    return-object p3
.end method

# A diary page also needs a visual entry for the independently configured
# homeroom.  It is never used to alter any subject slot.
.method public static getDiaryHomeroomTimeRange(Ljava/util/Date;)Ljava/lang/String;
    .locals 12
    const/4 v0, 0x0
    return-object v0

    const/4 v0, 0x0
    if-eqz p0, :done_homeroom_range
    sget-object v1, Lc7/LessonCountdownManager;->sContainer:Landroid/view/View;
    if-eqz v1, :done_homeroom_range
    :try_start_homeroom_range
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
    const-string v2, "lesson_schedule_prefs"
    const/4 v3, 0x0
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v2
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const/4 v4, 0x1
    invoke-virtual {v2, v4}, Ljava/util/Calendar;->get(I)I
    move-result v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v4, "-"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const/4 v5, 0x2
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I
    move-result v5
    add-int/lit8 v5, v5, 0x1
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const/4 v5, 0x5
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I
    move-result v5
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const-string v5, "homeroom_today_date"
    const-string v6, ""
    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :weekday_homeroom_range
    const-string v3, "homeroom_today_"
    goto :homeroom_range_prefix_ready
    :weekday_homeroom_range
    const/4 v3, 0x7
    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I
    move-result v3
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "homeroom_dow_"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    const-string v3, "_"
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    :homeroom_range_prefix_ready
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v5, "start"
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-interface {v1, v4, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, "end"
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-interface {v1, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    invoke-static {v4}, Lc7/ScheduleSettingsHelper;->parseClockMinutes(Ljava/lang/String;)I
    move-result v4
    invoke-static {v1}, Lc7/ScheduleSettingsHelper;->parseClockMinutes(Ljava/lang/String;)I
    move-result v1
    if-ltz v4, :done_homeroom_range
    if-le v1, v4, :done_homeroom_range
    div-int/lit8 v3, v4, 0x3c
    rem-int/lit8 v4, v4, 0x3c
    const/16 v5, 0xb
    invoke-virtual {v2, v5, v3}, Ljava/util/Calendar;->set(II)V
    const/16 v3, 0xc
    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->set(II)V
    const/16 v4, 0xd
    const/4 v6, 0x0
    invoke-virtual {v2, v4, v6}, Ljava/util/Calendar;->set(II)V
    const/16 v4, 0xe
    invoke-virtual {v2, v4, v6}, Ljava/util/Calendar;->set(II)V
    new-instance v7, Ljava/text/SimpleDateFormat;
    const-string v8, "HH:mm"
    invoke-direct {v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    move-result-object v8
    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual {v2, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    div-int/lit8 v9, v1, 0x3c
    rem-int/lit8 v1, v1, 0x3c
    invoke-virtual {v2, v5, v9}, Ljava/util/Calendar;->set(II)V
    invoke-virtual {v2, v3, v1}, Ljava/util/Calendar;->set(II)V
    const/16 v1, 0xd
    invoke-virtual {v2, v1, v6}, Ljava/util/Calendar;->set(II)V
    const/16 v1, 0xe
    invoke-virtual {v2, v1, v6}, Ljava/util/Calendar;->set(II)V
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    move-result-object v1
    invoke-virtual {v7, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v1
    invoke-static {v8, v1}, Lkd/e;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    :try_end_homeroom_range
    .catchall {:try_start_homeroom_range .. :try_end_homeroom_range} :bad_homeroom_range
    goto :done_homeroom_range
    :bad_homeroom_range
    move-exception v1
    const-string v2, "Rendering homeroom in diary failed"
    invoke-static {v2, v1}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    :done_homeroom_range
    return-object v0
.end method

.method public static resetAll(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->reset(Landroid/content/Context;)V
    return-void
.end method

.method public static bindMenuCard(Landroid/app/Dialog;ILandroid/content/Context;I)V
    .locals 2

    if-eqz p0, :cond_done

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_done

    new-instance v1, Lc7/ScheduleMenuCardClickListener;

    invoke-direct {v1, p2, p0, p3}, Lc7/ScheduleMenuCardClickListener;-><init>(Landroid/content/Context;Landroid/app/Dialog;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

:cond_done
    return-void
.end method

.method public static showMainDialog(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->open(Landroid/content/Context;)V
    return-void
.end method

.method public static showDowDialog(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->open(Landroid/content/Context;)V
    return-void
.end method

.method public static showDurationPickerForDow(Landroid/content/Context;ILjava/lang/String;)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "40 \u043c\u0438\u043d\u0443\u0442 (\u0441\u043e\u043a\u0440\u0430\u0449\u0451\u043d\u043d\u044b\u0439 \u043d\u0430 5 \u043c\u0438\u043d)"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "35 \u043c\u0438\u043d\u0443\u0442 (\u0441\u043e\u043a\u0440\u0430\u0449\u0451\u043d\u043d\u044b\u0439 \u043d\u0430 10 \u043c\u0438\u043d)"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "30 \u043c\u0438\u043d\u0443\u0442 (\u0441\u043e\u043a\u0440\u0430\u0449\u0451\u043d\u043d\u044b\u0439 \u043d\u0430 15 \u043c\u0438\u043d)"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "45 \u043c\u0438\u043d\u0443\u0442 (\u0441\u0442\u0430\u043d\u0434\u0430\u0440\u0442\u043d\u044b\u0439, \u0431\u0435\u0437 \u0441\u043e\u043a\u0440\u0430\u0449\u0435\u043d\u0438\u044f)"

    aput-object v2, v0, v1

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " \u2014 \u0434\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Lc7/ScheduleDurationDialogListener;

    invoke-direct {v2, p0, p1, p2}, Lc7/ScheduleDurationDialogListener;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    const-string p0, "\u041d\u0430\u0437\u0430\u0434"

    const/4 p1, 0x0

    invoke-virtual {v1, p0, p1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    move-result-object v0
    invoke-static {v0}, Lc7/GlassAlertDialogHelper;->style(Landroid/app/AlertDialog;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    :catch_all
    return-void
.end method

.method private static bindTodayProfileButton(Landroid/content/Context;Landroid/app/Dialog;Ljava/lang/String;I)V
    .locals 2
    if-eqz p0, :done
    if-eqz p1, :done
    const-string v0, "id"
    invoke-static {p0, p2, v0}, Lc7/ScheduleSettingsHelper;->bellResId(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    new-instance v1, Lc7/TodayProfileClickListener;
    invoke-direct {v1, p0, p1, p3}, Lc7/TodayProfileClickListener;-><init>(Landroid/content/Context;Landroid/app/Dialog;I)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :done
    return-void
.end method

.method public static showTodayDurationPicker(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->open(Landroid/content/Context;)V
    return-void
.end method
