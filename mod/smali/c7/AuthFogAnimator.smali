.class public final Lc7/AuthFogAnimator;
.super Ljava/lang/Object;

.field private static sAnimator:Landroid/animation/AnimatorSet;

.method public static start(Landroid/app/Activity;)V
    .locals 9

    invoke-static {}, Lc7/AuthFogAnimator;->stop()V

    const v0, 0x7f0903bc    # authFogLayer
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v2, 0x41a00000    # 20dp
    mul-float/2addr v1, v2

    const/4 v2, 0x2
    new-array v3, v2, [F
    neg-float v4, v1
    const/4 v5, 0x0
    aput v4, v3, v5
    const/4 v4, 0x1
    aput v1, v3, v4
    const-string v6, "translationX"
    invoke-static {v0, v6, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;
    move-result-object v6
    const-wide/16 v7, 0x6590    # 26000 ms
    invoke-virtual {v6, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ValueAnimator;
    const/4 v1, -0x1
    invoke-virtual {v6, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V
    invoke-virtual {v6, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    new-array v3, v2, [F
    const v7, 0x3ee66666    # 0.45f
    aput v7, v3, v5
    const v7, 0x3f333333    # 0.70f
    aput v7, v3, v4
    const-string v7, "alpha"
    invoke-static {v0, v7, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;
    move-result-object v7
    const-wide/16 v3, 0x4650    # 18000 ms
    invoke-virtual {v7, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ValueAnimator;
    invoke-virtual {v7, v1}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V
    invoke-virtual {v7, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    new-instance v0, Landroid/animation/AnimatorSet;
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;
    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V
    new-array v1, v2, [Landroid/animation/Animator;
    const/4 v2, 0x0
    aput-object v6, v1, v2
    const/4 v2, 0x1
    aput-object v7, v1, v2
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V
    sput-object v0, Lc7/AuthFogAnimator;->sAnimator:Landroid/animation/AnimatorSet;
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    :done
    return-void
.end method

.method public static stop()V
    .locals 1

    sget-object v0, Lc7/AuthFogAnimator;->sAnimator:Landroid/animation/AnimatorSet;
    if-eqz v0, :done
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V
    const/4 v0, 0x0
    sput-object v0, Lc7/AuthFogAnimator;->sAnimator:Landroid/animation/AnimatorSet;

    :done
    return-void
.end method
