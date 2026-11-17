.class public final Lc7/ThemeSelectionClickListener;
.super Ljava/lang/Object;
.source "ThemeSelectionClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Landroid/app/Dialog;


# direct methods
.method public constructor <init>(ILjava/lang/String;ILandroid/app/Dialog;)V
    .locals 0
    .param p1, "type"       # I
    .param p2, "keyString"  # Ljava/lang/String;
    .param p3, "keyInt"     # I
    .param p4, "dialog"     # Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lc7/ThemeSelectionClickListener;->a:I

    iput-object p2, p0, Lc7/ThemeSelectionClickListener;->b:Ljava/lang/String;

    iput p3, p0, Lc7/ThemeSelectionClickListener;->c:I

    iput-object p4, p0, Lc7/ThemeSelectionClickListener;->d:Landroid/app/Dialog;

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

    const-wide/16 v2, 0x3c

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lc7/DockAnimResetRunnable;

    invoke-direct {v2, p1}, Lc7/DockAnimResetRunnable;-><init>(Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_0
    iget v0, p0, Lc7/ThemeSelectionClickListener;->a:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lc7/ThemeSelectionClickListener;->d:Landroid/app/Dialog;

    iget-object v1, p0, Lc7/ThemeSelectionClickListener;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lc7/ThemeManager;->onThemeChipClicked(Landroid/app/Dialog;Ljava/lang/String;)V

    return-void

    :cond_1
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lc7/ThemeSelectionClickListener;->d:Landroid/app/Dialog;

    iget v1, p0, Lc7/ThemeSelectionClickListener;->c:I

    invoke-static {v0, v1}, Lc7/ThemeManager;->onColorCircleClicked(Landroid/app/Dialog;I)V

    return-void

    :cond_2
    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lc7/ThemeSelectionClickListener;->d:Landroid/app/Dialog;

    iget-object v1, p0, Lc7/ThemeSelectionClickListener;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lc7/ThemeManager;->onIconCardClicked(Landroid/app/Dialog;Ljava/lang/String;)V

    :cond_3
    return-void
.end method
