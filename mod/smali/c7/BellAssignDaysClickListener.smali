.class public final Lc7/BellAssignDaysClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field private final a:Landroid/content/Context;
.field private final b:Landroid/app/Dialog;

.method public constructor <init>(Landroid/content/Context;Landroid/app/Dialog;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/BellAssignDaysClickListener;->a:Landroid/content/Context;
    iput-object p2, p0, Lc7/BellAssignDaysClickListener;->b:Landroid/app/Dialog;
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    iget-object p1, p0, Lc7/BellAssignDaysClickListener;->b:Landroid/app/Dialog;
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V
    iget-object p1, p0, Lc7/BellAssignDaysClickListener;->a:Landroid/content/Context;
    invoke-static {p1}, Lc7/ScheduleSettingsHelper;->showDowDialog(Landroid/content/Context;)V
    return-void
.end method
