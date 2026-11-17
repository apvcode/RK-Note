.class public final Lc7/ManualBellCorrection;
.super Ljava/lang/Object;

.method private static todayKey()I
    .locals 4
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v0
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I
    move-result v2
    const/16 v3, 0x3e8
    mul-int/2addr v2, v3
    const/4 v1, 0x6
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I
    move-result v1
    add-int/2addr v2, v1
    return v2
.end method

.method public static getShift(Landroid/content/Context;)J
    .locals 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    invoke-static {p0, v0, v1}, Lrk/schedule/ScheduleBridge;->shift(Landroid/content/Context;J)I
    move-result v0
    int-to-long v0, v0
    const-wide/32 v2, 0xea60
    mul-long/2addr v0, v2
    return-wide v0
.end method

.method public static reset(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->resetCorrection(Landroid/content/Context;)V
    return-void
.end method

.method public static show(Landroid/content/Context;)V
    .locals 0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->open(Landroid/content/Context;)V
    return-void
.end method

.method public static save(Landroid/content/Context;III)Z
    .locals 14
    sget-object v6, Lc7/LessonCountdownManager;->sLessons:Ljava/util/List;
    if-eqz v6, :failed
    if-ltz p3, :failed
    const/16 v7, 0xb4
    move/from16 v9, p3
    if-gt v9, v7, :failed
    if-nez p2, :break_phase
    goto :phase_ready
    :break_phase
    add-int/lit8 p1, p1, 0x1
    :phase_ready
    if-ltz p1, :failed
    invoke-interface {v6}, Ljava/util/List;->size()I
    move-result v7
    if-ge p1, v7, :failed
    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    instance-of v7, v6, Lla/h;
    if-eqz v7, :failed
    check-cast v6, Lla/h;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v7
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v8
    iget-object v9, v6, Lla/h;->e:Ljava/util/Date;
    invoke-static {v9, v7, v8}, Lc7/LessonCountdownManager;->getTodayLessonMillis(Ljava/util/Date;Ljava/util/Calendar;Ljava/util/Calendar;)J
    move-result-wide v2
    iget-object v9, v6, Lla/h;->f:Ljava/util/Date;
    invoke-static {v9, v7, v8}, Lc7/LessonCountdownManager;->getTodayLessonMillis(Ljava/util/Date;Ljava/util/Calendar;Ljava/util/Calendar;)J
    move-result-wide v4
    move-object v0, p0
    iget-object v1, v6, Lla/h;->d:Ljava/lang/String;
    if-eqz p2, :get_end
    invoke-static/range {v0 .. v5}, Lc7/ScheduleSettingsHelper;->getConfiguredLessonStart(Landroid/content/Context;Ljava/lang/String;JJ)J
    move-result-wide v10
    goto :have_boundary
    :get_end
    invoke-static/range {v0 .. v5}, Lc7/ScheduleSettingsHelper;->getConfiguredLessonEnd(Landroid/content/Context;Ljava/lang/String;JJ)J
    move-result-wide v10
    :have_boundary
    const-wide/16 v12, 0x0
    cmp-long v6, v10, v12
    if-lez v6, :failed
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v12
    const v6, 0xea60
    move/from16 v8, p3
    mul-int v8, v8, v6
    int-to-long v6, v8
    add-long/2addr v12, v6
    sub-long/2addr v12, v10
    const-string v6, "manual_bell_correction"
    const/4 v7, 0x0
    invoke-virtual {p0, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v6
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v6
    const-string v7, "day"
    invoke-static {}, Lc7/ManualBellCorrection;->todayKey()I
    move-result v8
    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    const-string v7, "shift"
    invoke-interface {v6, v7, v12, v13}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V
    invoke-static {}, Lc7/LessonCountdownManager;->updateTick()V
    const/4 v0, 0x1
    return v0
    :failed
    const/4 v0, 0x0
    return v0
.end method
