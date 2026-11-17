.class public Lc7/GlassSnackbarHelper;
.super Ljava/lang/Object;
.source "GlassSnackbarHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(La3/p;Lt4/c;I)V
    .locals 10

    if-nez p0, :cond_0

    return-void

:cond_0
    iget-object v0, p0, La3/p;->c:Lcom/androidadvance/topsnackbar/TSnackbar$SnackbarLayout;

    if-nez v0, :cond_1

    return-void

:cond_1
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_2

    return-void

:cond_2
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const-string v4, "bg_glass_toast_error"

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-nez v5, :cond_3

    const-string v4, "bg_glass_toast_success"

    goto :goto_0

:cond_3
    const/4 v6, 0x1

    if-ne v5, v6, :cond_4

    const-string v4, "bg_glass_toast_error"

    goto :goto_0

:cond_4
    const-string v4, "bg_glass_toast_warning"

    :cond_5
    :goto_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "drawable"

    invoke-virtual {v2, v4, v6, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_6

    invoke-static {v1, v4}, Lh0/d;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_6

    invoke-virtual {v0, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

:cond_6
    const v4, -0xeeedee

    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

:goto_1
    const/high16 v4, 0x41600000    # 14.0f

    mul-float v4, v4, v3

    invoke-virtual {v0, v4}, Landroid/view/View;->setElevation(F)V

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/view/View;->setClipToOutline(Z)V

    const/high16 v4, 0x41800000    # 16.0f

    mul-float v4, v4, v3

    float-to-int v4, v4

    const/high16 v5, 0x430a0000    # 138.0f

    mul-float v5, v5, v3

    float-to-int v5, v5

    if-lez p2, :cond_7

    add-int/2addr v5, p2

    goto :goto_2

:cond_7
    const/high16 v5, 0x43280000    # 168.0f

    mul-float v5, v5, v3

    float-to-int v5, v5

    :goto_2
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v6

    move-object v9, v6

    if-eqz v6, :cond_a

    const v7, 0x7f0902b0

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_8

    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v8

    if-nez v8, :cond_8

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v8

    if-lez v8, :cond_8

    const/4 v6, 0x2

    new-array v6, v6, [I

    invoke-virtual {v7, v6}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 v7, 0x1

    aget v7, v6, v7

    if-lez v7, :cond_a

    add-int/2addr v7, v8

    const/high16 v6, 0x41000000    # 8.0f

    mul-float v6, v6, v3

    float-to-int v6, v6

    add-int v5, v7, v6

    # On the diary screen the live lesson banner sits below the spinner.
    # Keep top notifications below that banner instead of covering it.
    const v6, 0x7f0903b0

    invoke-virtual {v9, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :goto_3

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-nez v7, :cond_live_fallback

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v7

    if-lez v7, :cond_live_fallback

    const/4 v8, 0x2

    new-array v8, v8, [I

    invoke-virtual {v6, v8}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 v6, 0x1

    aget v6, v8, v6

    if-lez v6, :cond_live_fallback

    add-int/2addr v6, v7

    const/high16 v7, 0x41000000    # 8.0f

    mul-float v7, v7, v3

    float-to-int v7, v7

    add-int v5, v6, v7

    goto :goto_3

    # The banner may still be GONE while a network error is being shown,
    # but it occupies 46dp (40dp plus its 6dp top gap) once diary data binds.
:cond_live_fallback
    const/high16 v6, 0x42380000    # 46.0f

    mul-float v6, v6, v3

    float-to-int v6, v6

    add-int/2addr v5, v6

    goto :goto_3

:cond_8
    const v7, 0x7f0900c6

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_a

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v7

    if-lez v7, :cond_a

    const/4 v8, 0x2

    new-array v8, v8, [I

    invoke-virtual {v6, v8}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 v6, 0x1

    aget v6, v8, v6

    if-lez v6, :cond_9

    add-int/2addr v6, v7

    const/high16 v7, 0x41000000    # 8.0f

    mul-float v7, v7, v3

    float-to-int v7, v7

    add-int v5, v6, v7

    goto :goto_3

:cond_9
    if-lez p2, :cond_a

    const/high16 v6, 0x42800000    # 64.0f

    mul-float v6, v6, v3

    float-to-int v6, v6

    add-int v5, p2, v6

    :cond_a
    :goto_3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    instance-of v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v7, :cond_b

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v7, 0x0

    invoke-virtual {v6, v4, v5, v4, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v0, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_b
    invoke-virtual {v0}, Lcom/androidadvance/topsnackbar/TSnackbar$SnackbarLayout;->getMessageView()Landroid/widget/TextView;

    move-result-object v4

    if-eqz v4, :cond_c

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_skip_replace

    invoke-static {v1}, Lc7/OfflineManager;->isNetworkConnected(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_skip_replace

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string v6, "\u043d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_skip_replace

    const-string v5, "\u041d\u0435\u0442 \u043f\u043e\u0434\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u044f \u043a \u0441\u0435\u0442\u0438"

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

:cond_skip_replace
    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    const/high16 v5, 0x41900000    # 18.0f

    mul-float v5, v5, v3

    float-to-int v5, v5

    const/high16 v6, 0x41500000    # 13.0f

    mul-float v6, v6, v3

    float-to-int v6, v6

    invoke-virtual {v4, v5, v6, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    const/high16 v5, 0x41400000    # 12.0f

    mul-float v3, v3, v5

    float-to-int v3, v3

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    :cond_c
    invoke-virtual {v0}, Lcom/androidadvance/topsnackbar/TSnackbar$SnackbarLayout;->getActionView()Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_d

    const v1, -0x9f5a06    # #60A5FA

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_d
    return-void
.end method

.method public static animateIn(La3/p;)V
    .locals 7

    if-nez p0, :cond_0

    return-void

:cond_0
    iget-object v0, p0, La3/p;->c:Lcom/androidadvance/topsnackbar/TSnackbar$SnackbarLayout;

    if-nez v0, :cond_1

    return-void

:cond_1
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x42400000    # 48.0f

    mul-float v2, v2, v1

    neg-float v2, v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    const v2, 0x3f5c28f6    # 0.86f

    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setScaleY(F)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const-wide/16 v3, 0x1a4

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Landroid/view/animation/OvershootInterpolator;

    const v4, 0x3f99999a    # 1.2f

    invoke-direct {v3, v4}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    invoke-static {v0}, Lr0/p0;->a(Landroid/view/View;)Lr0/u0;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lr0/u0;->g(F)V

    const-wide/16 v2, 0x1a4

    invoke-virtual {v0, v2, v3}, Lr0/u0;->c(J)V

    new-instance v2, La3/l;

    invoke-direct {v2, p0}, La3/l;-><init>(La3/p;)V

    invoke-virtual {v0, v2}, Lr0/u0;->d(Lr0/v0;)V

    invoke-virtual {v0}, Lr0/u0;->f()V

    return-void
.end method

.method public static animateOut(Lr0/u0;Landroid/view/View;La3/p;I)V
    .locals 5

    if-eqz p1, :cond_2

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x42100000    # 36.0f

    mul-float v1, v1, v0

    neg-float v1, v1

    invoke-virtual {p0, v1}, Lr0/u0;->g(F)V

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const v1, 0x3f5c28f6    # 0.86f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x104

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    const v2, 0x3fb33333    # 1.4f

    invoke-direct {v1, v2}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    const-wide/16 v0, 0x104

    invoke-virtual {p0, v0, v1}, Lr0/u0;->c(J)V

    new-instance v0, La3/l;

    invoke-direct {v0, p2, p3}, La3/l;-><init>(La3/p;I)V

    invoke-virtual {p0, v0}, Lr0/u0;->d(Lr0/v0;)V

    invoke-virtual {p0}, Lr0/u0;->f()V

    :cond_2
    :goto_0
    return-void
.end method
