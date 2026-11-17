.class public final Lc7/PersonalHomeworkCancelClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field public final a:Landroid/app/Dialog;

.method public constructor <init>(Landroid/app/Dialog;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/PersonalHomeworkCancelClickListener;->a:Landroid/app/Dialog;
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 1
    iget-object v0, p0, Lc7/PersonalHomeworkCancelClickListener;->a:Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    return-void
.end method
