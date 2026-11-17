.class public final Lc7/UiCustomizationApplyRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final view:Landroid/view/View;
.field private final cornerStyle:I
.field private final densityMode:I

.method public constructor <init>(Landroid/view/View;II)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/UiCustomizationApplyRunnable;->view:Landroid/view/View;
    iput p2, p0, Lc7/UiCustomizationApplyRunnable;->cornerStyle:I
    iput p3, p0, Lc7/UiCustomizationApplyRunnable;->densityMode:I
    return-void
.end method

.method public run()V
    .locals 3
    iget-object v0, p0, Lc7/UiCustomizationApplyRunnable;->view:Landroid/view/View;
    iget v1, p0, Lc7/UiCustomizationApplyRunnable;->cornerStyle:I
    iget v2, p0, Lc7/UiCustomizationApplyRunnable;->densityMode:I
    invoke-static {v0, v1, v2}, Lc7/UiCustomizationManager;->applyAgain(Landroid/view/View;II)V
    return-void
.end method
