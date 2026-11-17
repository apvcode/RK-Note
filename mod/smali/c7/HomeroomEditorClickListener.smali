.class public final Lc7/HomeroomEditorClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field private final a:Landroid/content/Context;
.field private final b:Landroid/app/Dialog;
.field private final c:Z

.method public constructor <init>(Landroid/content/Context;Landroid/app/Dialog;Z)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/HomeroomEditorClickListener;->a:Landroid/content/Context;
    iput-object p2, p0, Lc7/HomeroomEditorClickListener;->b:Landroid/app/Dialog;
    iput-boolean p3, p0, Lc7/HomeroomEditorClickListener;->c:Z
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    iget-boolean p1, p0, Lc7/HomeroomEditorClickListener;->c:Z
    if-eqz p1, :dismiss
    iget-object v0, p0, Lc7/HomeroomEditorClickListener;->a:Landroid/content/Context;
    iget-object v1, p0, Lc7/HomeroomEditorClickListener;->b:Landroid/app/Dialog;
    invoke-static {v0, v1}, Lc7/ScheduleSettingsHelper;->saveHomeroom(Landroid/content/Context;Landroid/app/Dialog;)Z
    move-result p1
    if-eqz p1, :done
    :dismiss
    iget-object p1, p0, Lc7/HomeroomEditorClickListener;->b:Landroid/app/Dialog;
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V
    :done
    return-void
.end method
