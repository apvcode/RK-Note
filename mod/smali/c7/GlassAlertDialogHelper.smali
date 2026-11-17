.class public final Lc7/GlassAlertDialogHelper;
.super Ljava/lang/Object;

.method public static style(Landroid/app/AlertDialog;)V
    .locals 7

    if-eqz p0, :done

    :try_start
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;
    move-result-object v0

    if-eqz v0, :list

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;
    const/4 v2, 0x0
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const v1, 0x3f000000    # 0.5f
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1

    invoke-virtual {p0}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v3
    const-string v4, "bg_schedule_settings_dialog"
    const-string v5, "drawable"
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v3, v4, v5, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v2

    if-eqz v2, :list
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    :list
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;
    move-result-object v0
    if-eqz v0, :done_try

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;
    const/4 v2, 0x0
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDividerHeight(I)V
    const/16 v1, 0x12
    const/16 v2, 0x8
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    :done_try
    :try_end
    .catchall {:try_start .. :try_end} :done

    :done
    return-void
.end method
