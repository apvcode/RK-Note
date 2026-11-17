.class public final Lc7/UiCustomizationClickListener;
.super Ljava/lang/Object;
.source "UiCustomizationClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;

# instance fields
.field private final dialog:Landroid/app/Dialog;
.field private final activity:Lcom/eljur/client/feature/main/view/MainActivity;
.field private final category:Ljava/lang/String;
.field private final value:I

# direct methods
.method public constructor <init>(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/UiCustomizationClickListener;->dialog:Landroid/app/Dialog;
    iput-object p2, p0, Lc7/UiCustomizationClickListener;->activity:Lcom/eljur/client/feature/main/view/MainActivity;
    iput-object p3, p0, Lc7/UiCustomizationClickListener;->category:Ljava/lang/String;
    iput p4, p0, Lc7/UiCustomizationClickListener;->value:I
    return-void
.end method

# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    if-eqz p1, :click
    const/4 v0, 0x0
    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const v1, 0x3f733333    # 0.95f
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v1, 0x46
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    new-instance v1, Lc7/DockAnimResetRunnable;
    invoke-direct {v1, p1}, Lc7/DockAnimResetRunnable;-><init>(Landroid/view/View;)V
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V
    :click
    iget-object v0, p0, Lc7/UiCustomizationClickListener;->dialog:Landroid/app/Dialog;
    iget-object v1, p0, Lc7/UiCustomizationClickListener;->activity:Lcom/eljur/client/feature/main/view/MainActivity;
    iget-object v2, p0, Lc7/UiCustomizationClickListener;->category:Ljava/lang/String;
    iget v3, p0, Lc7/UiCustomizationClickListener;->value:I
    invoke-static {v0, v1, v2, v3}, Lc7/UiCustomizationManager;->onOption(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    return-void
.end method
