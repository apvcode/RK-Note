.class public final Lc7/DockClickListener;
.super Ljava/lang/Object;
.source "DockClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Lcom/eljur/client/feature/main/view/MainActivity;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;
    .param p2, "itemId"      # Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/DockClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    iput-object p2, p0, Lc7/DockClickListener;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    # Reset any unfinished press animation before starting the next one.
    # This prevents a former dock item from briefly reappearing after items
    # have been removed from the bar.
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const v1, 0x3f70a3d7    # 0.94f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x50

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lc7/DockAnimResetRunnable;

    invoke-direct {v1, p1}, Lc7/DockAnimResetRunnable;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_0
    iget-object v0, p0, Lc7/DockClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    iget-object v1, p0, Lc7/DockClickListener;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lc7/DockCustomizer;->onTabClicked(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    return-void
.end method
