.class public final Lc7/ThemeActionClickListener;
.super Ljava/lang/Object;
.source "ThemeActionClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:I

.field public final b:Lcom/eljur/client/feature/main/view/MainActivity;

.field public final c:Landroid/app/Dialog;


# direct methods
.method public constructor <init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V
    .locals 0
    .param p1, "actionType" # I
    .param p2, "activity"   # Lcom/eljur/client/feature/main/view/MainActivity;
    .param p3, "dialog"     # Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lc7/ThemeActionClickListener;->a:I

    iput-object p2, p0, Lc7/ThemeActionClickListener;->b:Lcom/eljur/client/feature/main/view/MainActivity;

    iput-object p3, p0, Lc7/ThemeActionClickListener;->c:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 5
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

    const-wide/16 v2, 0x3c

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lc7/DockAnimResetRunnable;

    invoke-direct {v2, p1}, Lc7/DockAnimResetRunnable;-><init>(Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_0
    iget v0, p0, Lc7/ThemeActionClickListener;->a:I

    iget-object v1, p0, Lc7/ThemeActionClickListener;->b:Lcom/eljur/client/feature/main/view/MainActivity;

    iget-object v2, p0, Lc7/ThemeActionClickListener;->c:Landroid/app/Dialog;

    if-nez v0, :cond_check_save

    invoke-static {v1, v2}, Lc7/ThemeManager;->onResetClicked(Lcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    return-void

    :cond_check_save
    const/4 v3, 0x1

    if-ne v0, v3, :cond_check_close

    invoke-static {v1, v2}, Lc7/ThemeManager;->onSaveClicked(Lcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    return-void

    :cond_check_close
    const/4 v3, 0x2

    if-ne v0, v3, :cond_check_dock

    if-eqz v2, :cond_exit

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    :cond_exit
    return-void

    :cond_check_dock
    const/4 v3, 0x3

    if-ne v0, v3, :cond_check_theme

    invoke-static {v1, v2}, Lc7/ThemeManager;->onDockCustomizeClicked(Lcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    return-void

    :cond_check_theme
    const/4 v3, 0x4

    if-ne v0, v3, :cond_done

    if-eqz v2, :cond_open_theme

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    :cond_open_theme
    invoke-static {v1}, Lc7/ThemeManager;->showThemeCustomizerDialog(Lcom/eljur/client/feature/main/view/MainActivity;)V

    :cond_done
    return-void
.end method
