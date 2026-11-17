.class public final Lc7/DockChipClickListener;
.super Ljava/lang/Object;
.source "DockChipClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Lcom/eljur/client/feature/main/view/MainActivity;

.field public final b:Ljava/lang/String;

.field public final c:Landroid/view/View;

.field public final d:Ljava/util/Set;


# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;Landroid/view/View;Ljava/util/Set;)V
    .locals 0
    .param p1, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;
    .param p2, "itemId"      # Ljava/lang/String;
    .param p3, "chipView"    # Landroid/view/View;
    .param p4, "selectedSet" # Ljava/util/Set;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/DockChipClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    iput-object p2, p0, Lc7/DockChipClickListener;->b:Ljava/lang/String;

    iput-object p3, p0, Lc7/DockChipClickListener;->c:Landroid/view/View;

    iput-object p4, p0, Lc7/DockChipClickListener;->d:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const v2, 0x3f6b851f    # 0.92f

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x46

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lc7/DockAnimResetRunnable;

    invoke-direct {v2, p1}, Lc7/DockAnimResetRunnable;-><init>(Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_0
    iget-object v1, p0, Lc7/DockChipClickListener;->d:Ljava/util/Set;

    iget-object v2, p0, Lc7/DockChipClickListener;->b:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lc7/DockChipClickListener;->d:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_1

    iget-object v1, p0, Lc7/DockChipClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    const-string v2, "\u041c\u0438\u043d\u0438\u043c\u0443\u043c 2 \u043a\u043d\u043e\u043f\u043a\u0438"

    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_1
    iget-object v1, p0, Lc7/DockChipClickListener;->d:Ljava/util/Set;

    iget-object v2, p0, Lc7/DockChipClickListener;->b:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lc7/DockChipClickListener;->c:Landroid/view/View;

    invoke-static {v1, v0}, Lc7/DockCustomizer;->updateChipVisual(Landroid/view/View;Z)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lc7/DockChipClickListener;->d:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    const/4 v2, 0x6

    if-lt v1, v2, :cond_3

    iget-object v1, p0, Lc7/DockChipClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    const-string v2, "\u041c\u0430\u043a\u0441\u0438\u043c\u0443\u043c 6 \u043a\u043d\u043e\u043f\u043e\u043a"

    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_3
    iget-object v0, p0, Lc7/DockChipClickListener;->d:Ljava/util/Set;

    iget-object v1, p0, Lc7/DockChipClickListener;->b:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lc7/DockChipClickListener;->c:Landroid/view/View;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lc7/DockCustomizer;->updateChipVisual(Landroid/view/View;Z)V

    :goto_0
    return-void
.end method
