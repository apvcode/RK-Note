.class public final Lc7/BellProfileClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field private final a:Landroid/content/Context;
.field private final b:Landroid/app/Dialog;
.field private final c:Ljava/lang/String;

.method public constructor <init>(Landroid/content/Context;Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/BellProfileClickListener;->a:Landroid/content/Context;
    iput-object p2, p0, Lc7/BellProfileClickListener;->b:Landroid/app/Dialog;
    iput-object p3, p0, Lc7/BellProfileClickListener;->c:Ljava/lang/String;
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    iget-object p1, p0, Lc7/BellProfileClickListener;->b:Landroid/app/Dialog;
    if-eqz p1, :skip
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V
    :skip
    iget-object v0, p0, Lc7/BellProfileClickListener;->a:Landroid/content/Context;
    iget-object v1, p0, Lc7/BellProfileClickListener;->c:Ljava/lang/String;
    invoke-static {v0, v1}, Lc7/ScheduleSettingsHelper;->showBellProfileEditor(Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method
