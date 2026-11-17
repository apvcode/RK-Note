.class public final Lc7/BellEditorClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field private final a:Landroid/content/Context;
.field private final b:Landroid/app/Dialog;
.field private final c:Ljava/lang/String;
.field private final d:Z

.method public constructor <init>(Landroid/content/Context;Landroid/app/Dialog;Ljava/lang/String;Z)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/BellEditorClickListener;->a:Landroid/content/Context;
    iput-object p2, p0, Lc7/BellEditorClickListener;->b:Landroid/app/Dialog;
    iput-object p3, p0, Lc7/BellEditorClickListener;->c:Ljava/lang/String;
    iput-boolean p4, p0, Lc7/BellEditorClickListener;->d:Z
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    iget-boolean p1, p0, Lc7/BellEditorClickListener;->d:Z
    if-eqz p1, :close
    iget-object v0, p0, Lc7/BellEditorClickListener;->a:Landroid/content/Context;
    iget-object v1, p0, Lc7/BellEditorClickListener;->b:Landroid/app/Dialog;
    iget-object v2, p0, Lc7/BellEditorClickListener;->c:Ljava/lang/String;
    invoke-static {v0, v1, v2}, Lc7/ScheduleSettingsHelper;->saveBellProfile(Landroid/content/Context;Landroid/app/Dialog;Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :done
    :close
    iget-object p1, p0, Lc7/BellEditorClickListener;->b:Landroid/app/Dialog;
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V
    :done
    return-void
.end method
