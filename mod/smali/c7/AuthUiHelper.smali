.class public final Lc7/AuthUiHelper;
.super Ljava/lang/Object;
.source "AuthUiHelper.java"

.method private static find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    .locals 3

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;
    move-result-object v1
    const-string v2, "id"
    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    return-object v0
.end method

.method public static setup(Landroid/app/Activity;)V
    .locals 5

    const-string v0, "authTitleGlass"
    invoke-static {p0, v0}, Lc7/AuthUiHelper;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :button
    invoke-static {v0}, Lc7/BlurHelper;->setupTopBar(Landroid/view/View;)V

    :button
    const-string v0, "authButtonBlur"
    invoke-static {p0, v0}, Lc7/AuthUiHelper;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :footer
    invoke-static {v0}, Lc7/BlurHelper;->setupTopBar(Landroid/view/View;)V

    :footer
    const-string v0, "authGithubFooter"
    invoke-static {p0, v0}, Lc7/AuthUiHelper;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :arrow
    invoke-static {v0}, Lc7/BlurHelper;->setupTopBar(Landroid/view/View;)V
    new-instance v1, Lc7/GithubClickListener;
    invoke-direct {v1}, Lc7/GithubClickListener;-><init>()V
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :arrow
    const-string v0, "gouslugiIcon"
    invoke-static {p0, v0}, Lc7/AuthUiHelper;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const-string v4, "auth_arrow_glide"
    const-string v3, "anim"
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v4, v3, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v1
    if-eqz v1, :done

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-static {v2, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :done
    return-void
.end method
