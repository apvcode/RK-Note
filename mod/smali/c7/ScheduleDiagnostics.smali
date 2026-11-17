.class public final Lc7/ScheduleDiagnostics;
.super Ljava/lang/Object;

.method public static log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    const-string v0, "RKSchedule"
    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method

.method public static notify(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    invoke-static {p1, p2}, Lc7/ScheduleDiagnostics;->log(Ljava/lang/String;Ljava/lang/Throwable;)V
    if-eqz p0, :done
    const-string v0, "Не удалось сохранить настройку. Расписание не изменено."
    const/4 v1, 0x0
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :done
    return-void
.end method
