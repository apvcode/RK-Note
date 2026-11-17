.class public Lc7/BlurHelper;
.super Ljava/lang/Object;
.source "BlurHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setup(Landroid/app/Activity;Landroid/view/View;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "ignored"     # Landroid/view/View;

    if-eqz p0, :cond_0

    new-instance v0, Lc7/BlurSetupRunnable;

    invoke-direct {v0, p0}, Lc7/BlurSetupRunnable;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public static setupInternal(Landroid/app/Activity;)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;

    :try_start_0
    const-string v0, "BlurHelper"

    const-string v1, "setupInternal starting..."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p0, :cond_0

    return-void

    :cond_0
    const v1, 0x7f090084

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const-string v0, "BlurHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "findViewById(0x7f090084) is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v1, :cond_1

    goto :goto_done

    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    const-string v0, "BlurHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Parent is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    instance-of v2, v1, Leightbitlab/com/blurview/BlurView;

    if-nez v2, :cond_2

    const-string v0, "BlurHelper"

    const-string v1, "Parent is NOT instance of BlurView!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_done

    :cond_2
    move-object v2, v1

    check-cast v2, Leightbitlab/com/blurview/BlurView;

    invoke-static {v2}, Lc7/UiCustomizationManager;->applyToTree(Landroid/view/View;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/View;->setClipToOutline(Z)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v2, v4}, Leightbitlab/com/blurview/BlurView;->setupWith(Landroid/view/ViewGroup;)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v2

    const-string v4, "blur_dock"

    invoke-static {p0, v4}, Lc7/UiCustomizationManager;->getBlurRadius(Landroid/content/Context;Ljava/lang/String;)F

    move-result v4

    invoke-interface {v2, v4}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurRadius(F)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v2

    const v4, 0x501a1a24    # 0x501A1A24 (~31% opacity)

    invoke-interface {v2, v4}, Leightbitlab/com/blurview/BlurViewFacade;->setOverlayColor(I)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v2

    invoke-interface {v2, v3}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurAutoUpdate(Z)Leightbitlab/com/blurview/BlurViewFacade;

    const-string v0, "BlurHelper"

    const-string v1, "=== Bottom BlurView setup SUCCESSFUL! ==="

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    instance-of v2, p0, Lcom/eljur/client/feature/main/view/MainActivity;

    if-eqz v2, :cond_skip_customizer

    move-object v2, p0

    check-cast v2, Lcom/eljur/client/feature/main/view/MainActivity;

    invoke-static {v2}, Lc7/DockCustomizer;->init(Lcom/eljur/client/feature/main/view/MainActivity;)V


    :cond_skip_customizer
    :goto_done
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    const-string v0, "BlurHelper"

    const-string v2, "setupInternal failed with exception"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public static setupTopBar(Landroid/view/View;)V
    .locals 1
    .param p0, "container"    # Landroid/view/View;

    if-eqz p0, :cond_0

    new-instance v0, Lc7/TopBlurSetupRunnable;

    invoke-direct {v0, p0}, Lc7/TopBlurSetupRunnable;-><init>(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

# A dialog has its own window, therefore container.getRootView() points at the
# dialog itself and produces a transparent panel instead of a blur.  For a
# bottom sheet opened from an Activity use the Activity decor as BlurView's
# source tree.
.method public static setupDialogBlur(Landroid/app/Dialog;Landroid/content/Context;)V
    .locals 6

    if-eqz p0, :done

    :unwrap_context
    instance-of v0, p1, Landroid/app/Activity;

    if-nez v0, :check_wrapper

    goto :have_activity

    :check_wrapper
    instance-of v0, p1, Landroid/content/ContextWrapper;

    if-eqz v0, :no_activity

    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    goto :unwrap_context

    :no_activity
    const-string v0, "BlurHelper"
    const-string v1, "Dialog blur skipped: no Activity context"
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    goto :done

    :have_activity

    const v0, 0x7f090397

    invoke-virtual {p0, v0}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Leightbitlab/com/blurview/BlurView;

    if-eqz v1, :done

    check-cast v0, Leightbitlab/com/blurview/BlurView;

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :done

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :done

    check-cast v1, Landroid/view/ViewGroup;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/view/View;->setClipToOutline(Z)V

    invoke-virtual {v0, v1}, Leightbitlab/com/blurview/BlurView;->setupWith(Landroid/view/ViewGroup;)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v0

    const/high16 v1, 0x41e00000    # 28.0f

    invoke-interface {v0, v1}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurRadius(F)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v0

    const v1, 0x5c141620

    invoke-interface {v0, v1}, Leightbitlab/com/blurview/BlurViewFacade;->setOverlayColor(I)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v0

    invoke-interface {v0, v2}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurAutoUpdate(Z)Leightbitlab/com/blurview/BlurViewFacade;

    :done
    return-void
.end method

.method public static setupTopBarInternal(Landroid/view/View;)V
    .locals 5
    .param p0, "container"    # Landroid/view/View;

    :try_start_top
    const-string v0, "BlurHelper"

    const-string v1, "setupTopBarInternal starting..."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lc7/BlurHelper;->findBlurView(Landroid/view/View;)Leightbitlab/com/blurview/BlurView;

    move-result-object v1

    const-string v0, "BlurHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Top findBlurView result: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v1, :cond_1

    return-void

    :cond_1
    invoke-static {p0}, Lc7/UiCustomizationManager;->applyToTree(Landroid/view/View;)V

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    const-string v0, "top_blur_done"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v0, "BlurHelper"

    const-string v2, "Top BlurView already configured, skipping."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    const-string v2, "top_blur_done"

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setClipToOutline(Z)V

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v3

    instance-of v4, v3, Landroid/view/ViewGroup;

    if-nez v4, :cond_3

    const-string v0, "BlurHelper"

    const-string v1, "Top container root is NOT ViewGroup!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    check-cast v3, Landroid/view/ViewGroup;

    # A drawer BlurView must sample the actual app content behind it. Sampling
    # the decor/root also includes the drawer itself and only produces a
    # translucent grey sheet instead of a real blur.
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v4

    const v0, 0x7f09020b

    if-ne v4, v0, :cond_top_source_ready

    const v4, 0x7f0901cc

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    instance-of v0, v4, Landroid/view/ViewGroup;

    if-eqz v0, :cond_top_source_ready

    move-object v3, v4

    check-cast v3, Landroid/view/ViewGroup;

    :cond_top_source_ready

    invoke-virtual {v1, v3}, Leightbitlab/com/blurview/BlurView;->setupWith(Landroid/view/ViewGroup;)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v4

    const v0, 0x7f09020b

    if-ne v4, v0, :check_lesson_blur

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "blur_drawer"

    invoke-static {v3, v4}, Lc7/UiCustomizationManager;->getBlurRadius(Landroid/content/Context;Ljava/lang/String;)F

    move-result v3

    goto :blur_radius_ready

    :check_lesson_blur
    const v0, 0x7f0903b0

    if-ne v4, v0, :default_top_blur

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "blur_lesson"

    invoke-static {v3, v4}, Lc7/UiCustomizationManager;->getBlurRadius(Landroid/content/Context;Ljava/lang/String;)F

    move-result v3

    goto :blur_radius_ready

    :default_top_blur
    const/high16 v3, 0x41c80000    # 25.0f

    :blur_radius_ready

    invoke-interface {v1, v3}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurRadius(F)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v1

    const v3, 0x501a1a24    # 0x501A1A24 (~31% opacity)

    invoke-interface {v1, v3}, Leightbitlab/com/blurview/BlurViewFacade;->setOverlayColor(I)Leightbitlab/com/blurview/BlurViewFacade;

    move-result-object v1

    invoke-interface {v1, v2}, Leightbitlab/com/blurview/BlurViewFacade;->setBlurAutoUpdate(Z)Leightbitlab/com/blurview/BlurViewFacade;

    const-string v0, "BlurHelper"

    const-string v1, "=== Top BlurView setup SUCCESSFUL! ==="

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_top
    .catchall {:try_start_top .. :try_end_top} :catchall_top

    goto :goto_top_done

    :catchall_top
    move-exception v1

    const-string v0, "BlurHelper"

    const-string v2, "setupTopBarInternal failed with exception"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_top_done
    return-void
.end method

.method private static findBlurView(Landroid/view/View;)Leightbitlab/com/blurview/BlurView;
    .locals 4
    .param p0, "view"    # Landroid/view/View;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    instance-of v1, p0, Leightbitlab/com/blurview/BlurView;

    if-eqz v1, :cond_1

    check-cast p0, Leightbitlab/com/blurview/BlurView;

    return-object p0

    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_4

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Lc7/BlurHelper;->findBlurView(Landroid/view/View;)Leightbitlab/com/blurview/BlurView;

    move-result-object v3

    if-eqz v3, :cond_3

    return-object v3

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-object v0
.end method
