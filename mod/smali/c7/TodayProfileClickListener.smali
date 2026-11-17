.class public final Lc7/TodayProfileClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field private final a:Landroid/content/Context;
.field private final b:Landroid/app/Dialog;
.field private final c:I

.method public constructor <init>(Landroid/content/Context;Landroid/app/Dialog;I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/TodayProfileClickListener;->a:Landroid/content/Context;
    iput-object p2, p0, Lc7/TodayProfileClickListener;->b:Landroid/app/Dialog;
    iput p3, p0, Lc7/TodayProfileClickListener;->c:I
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    iget-object p1, p0, Lc7/TodayProfileClickListener;->a:Landroid/content/Context;
    iget v0, p0, Lc7/TodayProfileClickListener;->c:I
    invoke-static {p1, v0}, Lc7/ScheduleSettingsHelper;->saveTodayDuration(Landroid/content/Context;I)V
    iget-object p1, p0, Lc7/TodayProfileClickListener;->b:Landroid/app/Dialog;
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V
    return-void
.end method
