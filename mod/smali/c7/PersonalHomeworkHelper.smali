.class public final Lc7/PersonalHomeworkHelper;
.super Ljava/lang/Object;
.source "PersonalHomeworkHelper.java"

.method public static key(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "lesson:"
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, "|"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    return-object v0
.end method

.method public static bind(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    invoke-static {p0, p1, p2}, Lrk/diary/DiaryUi;->bindHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static setupBlur(Landroid/view/View;)V
    .locals 5
    const-string v0, "rk_personal_homework_blur"
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v0
    instance-of v1, v0, Leightbitlab/com/blurview/BlurView;
    if-eqz v1, :done
    check-cast v0, Leightbitlab/com/blurview/BlurView;
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
    :unwrap_context
    instance-of v2, v1, Landroid/app/Activity;
    if-nez v2, :have_activity
    instance-of v2, v1, Landroid/content/ContextWrapper;
    if-eqz v2, :done
    check-cast v1, Landroid/content/ContextWrapper;
    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object v1
    goto :unwrap_context
    :have_activity
    check-cast v1, Landroid/app/Activity;
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    instance-of v2, v1, Landroid/view/ViewGroup;
    if-eqz v2, :done
    check-cast v1, Landroid/view/ViewGroup;
    const/4 v2, 0x1
    invoke-virtual {v0, v2}, Landroid/view/View;->setClipToOutline(Z)V
    invoke-virtual {v0, v1}, Leightbitlab/com/blurview/BlurView;->setupWith(Landroid/view/ViewGroup;)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v0
    const/high16 v1, 0x41c80000    # 25.0f
    invoke-interface {v0, v1}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurRadius(F)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v0
    const v1, 0x501a1a24
    invoke-interface {v0, v1}, Leightbitlab/com/blurview/BlurViewFacade;->setOverlayColor(I)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v0
    invoke-interface {v0, v2}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurAutoUpdate(Z)Leightbitlab/com/blurview/BlurViewFacade;
    :done
    return-void
.end method

.method public static render(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    invoke-static {p0, p1, p2}, Lrk/diary/DiaryUi;->renderHomework(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method

.method public static showEditor(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    invoke-static {p0, p1, p2}, Lrk/diary/DiaryUi;->editHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method public static setupDialogBlur(Landroid/app/Dialog;Landroid/content/Context;Landroid/view/View;)V
    .locals 6
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v0
    if-eqz v0, :done_dialog_blur
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;
    const/4 v2, 0x0
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    const/4 v1, -0x1
    const/4 v2, -0x2
    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V
    const/16 v1, 0x11    # CENTER
    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V
    const v1, 0x3eb33333    # 0.35f
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V
    :unwrap_dialog_context
    instance-of v1, p1, Landroid/app/Activity;
    if-nez v1, :dialog_activity
    instance-of v1, p1, Landroid/content/ContextWrapper;
    if-eqz v1, :done_dialog_blur
    check-cast p1, Landroid/content/ContextWrapper;
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object p1
    goto :unwrap_dialog_context
    :dialog_activity
    check-cast p1, Landroid/app/Activity;
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v1
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup;
    check-cast p2, Leightbitlab/com/blurview/BlurView;
    const/4 v2, 0x1
    invoke-virtual {p2, v2}, Landroid/view/View;->setClipToOutline(Z)V
    invoke-virtual {p2, v1}, Leightbitlab/com/blurview/BlurView;->setupWith(Landroid/view/ViewGroup;)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v3
    const/high16 v4, 0x41c80000    # 25.0f, same as the bottom dock
    invoke-interface {v3, v4}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurRadius(F)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v3
    const v4, 0x501a1a24
    invoke-interface {v3, v4}, Leightbitlab/com/blurview/BlurViewFacade;->setOverlayColor(I)Leightbitlab/com/blurview/BlurViewFacade;
    move-result-object v3
    invoke-interface {v3, v2}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurAutoUpdate(Z)Leightbitlab/com/blurview/BlurViewFacade;
    :done_dialog_blur
    return-void
.end method
