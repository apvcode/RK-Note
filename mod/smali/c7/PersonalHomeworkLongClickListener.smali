.class public final Lc7/PersonalHomeworkLongClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnLongClickListener;

.field public final a:Landroid/view/View;
.field public final b:Ljava/lang/String;
.field public final c:Ljava/lang/String;

.method public constructor <init>(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/PersonalHomeworkLongClickListener;->a:Landroid/view/View;
    iput-object p2, p0, Lc7/PersonalHomeworkLongClickListener;->b:Ljava/lang/String;
    iput-object p3, p0, Lc7/PersonalHomeworkLongClickListener;->c:Ljava/lang/String;
    return-void
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .locals 3
    const/4 v0, 0x0
    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z
    iget-object v0, p0, Lc7/PersonalHomeworkLongClickListener;->a:Landroid/view/View;
    iget-object v1, p0, Lc7/PersonalHomeworkLongClickListener;->b:Ljava/lang/String;
    iget-object v2, p0, Lc7/PersonalHomeworkLongClickListener;->c:Ljava/lang/String;
    invoke-static {v0, v1, v2}, Lc7/PersonalHomeworkHelper;->showEditor(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    const/4 v0, 0x1
    return v0
.end method
