.class public final Lc7/LiquidGlassDialogHelper;
.super Ljava/lang/Object;

.method public static setupFromContext(Landroid/app/Dialog;Landroid/content/Context;I)V
    .locals 2
    :loop
    instance-of v0, p1, Landroid/app/Activity;
    if-eqz v0, :wrapper
    check-cast p1, Landroid/app/Activity;
    invoke-static {p0, p1, p2}, Lc7/LiquidGlassDialogHelper;->setup(Landroid/app/Dialog;Landroid/app/Activity;I)V
    return-void
    :wrapper
    instance-of v0, p1, Landroid/content/ContextWrapper;
    if-eqz v0, :done_context
    check-cast p1, Landroid/content/ContextWrapper;
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object v1
    if-eq v1, p1, :done_context
    move-object p1, v1
    goto :loop
    :done_context
    return-void
.end method

.method public static setup(Landroid/app/Dialog;Landroid/app/Activity;I)V
    .locals 5
    if-eqz p0, :done
    if-eqz p1, :done
    invoke-virtual {p0, p2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
    instance-of v1, v0, Leightbitlab/com/blurview/BlurView;
    if-eqz v1, :done
    check-cast v0, Leightbitlab/com/blurview/BlurView;
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
    const/4 v2, 0x1
    invoke-virtual {v0, v2}, Landroid/view/View;->setClipToOutline(Z)V
    invoke-virtual {v0, v1}, Leightbitlab/com/blurview/BlurView;->setupWith(Landroid/view/ViewGroup;)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v3
    const/high16 v4, 0x41c80000    # dock: 25dp radius
    invoke-interface {v3, v4}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurRadius(F)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v3
    const v4, 0x501a1a24    # dock overlay
    invoke-interface {v3, v4}, Leightbitlab/com/blurview/BlurViewFacade;->setOverlayColor(I)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v3
    invoke-interface {v3, v2}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurAutoUpdate(Z)Leightbitlab/com/blurview/BlurViewFacade;
    :done
    return-void
.end method
