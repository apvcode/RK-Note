.class public final Lc7/DrawerProfileHelper;
.super Ljava/lang/Object;

.method public static applyName(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 5
    if-eqz p0, :done
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "drawer_profile_cache"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1

    if-eqz p1, :use_cache
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v3
    if-lez v3, :use_cache
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v3
    const-string v4, "full_name"
    invoke-interface {v3, v4, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v3
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V
    goto :apply

    :use_cache
    const-string v3, "full_name"
    const/4 v4, 0x0
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    if-eqz p1, :fallback
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v3
    if-lez v3, :fallback
    goto :apply

    :fallback
    const-string p1, "Профиль пользователя"

    :apply
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/4 v2, 0x0
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V
    const/high16 v2, 0x3f800000    # 1.0f
    invoke-virtual {p0, v2}, Landroid/view/View;->setAlpha(F)V
    :done
    return-void
.end method
