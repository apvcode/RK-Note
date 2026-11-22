.class public final Lc7/ThemeManager;
.super Ljava/lang/Object;
.source "ThemeManager.java"


# static fields
.field public static final ALL_ICONS:[Ljava/lang/String;

.field public static sSelectedAccent:I

.field public static sSelectedIcon:Ljava/lang/String;

.field public static sSelectedTheme:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "oled"

    sput-object v0, Lc7/ThemeManager;->sSelectedTheme:Ljava/lang/String;

    const v0, -0xf57b01    # 0xFF0A84FF

    sput v0, Lc7/ThemeManager;->sSelectedAccent:I

    const-string v0, "alias4"

    sput-object v0, Lc7/ThemeManager;->sSelectedIcon:Ljava/lang/String;

    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "default"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "alias1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "alias2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "alias3"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "alias4"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "alias5"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "alias6"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "alias7"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "alias8"

    aput-object v2, v0, v1

    sput-object v0, Lc7/ThemeManager;->ALL_ICONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAccentColor(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    if-nez p0, :cond_0

    const v0, -0xf57b01

    return v0

    :cond_0
    const-string v0, "theme_customizer_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "accent_color"

    const v2, -0xf57b01

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getThemeMode(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    if-nez p0, :cond_0

    const-string v0, "oled"

    return-object v0

    :cond_0
    const-string v0, "theme_customizer_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "theme_mode"

    const-string v2, "oled"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "lilac"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_theme_mode_ready

    const-string v0, "oled"

    :cond_theme_mode_ready

    return-object v0
.end method

.method public static getInactiveColor(Landroid/content/Context;)I
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    invoke-static {p0}, Lc7/ThemeManager;->getThemeMode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "light"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, -0x6b5c48    # 0xFF94A3B8

    return v0

    :cond_0
    const v0, -0xadadac    # 0xFF525254

    return v0
.end method

.method public static getLauncherIcon(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    if-nez p0, :cond_0

    const-string v0, "alias4"

    return-object v0

    :cond_0
    const-string v0, "theme_customizer_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "launcher_icon"

    const-string v2, "alias4"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static tintImageView(Landroid/widget/ImageView;)V
    .locals 2
    .param p0, "iv"    # Landroid/widget/ImageView;

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lc7/ThemeManager;->getAccentColor(Landroid/content/Context;)I

    move-result v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, v0, v1}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public static tintTextViewDrawables(Landroid/widget/TextView;)V
    .locals 5
    .param p0, "tv"    # Landroid/widget/TextView;

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lc7/ThemeManager;->getAccentColor(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_check_abs

    const/4 v2, 0x0

    :goto_loop_rel
    array-length v3, v1

    if-ge v2, v3, :cond_check_abs

    aget-object v3, v1, v2

    if-eqz v3, :cond_next_rel

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v3, v0, v4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :cond_next_rel
    add-int/lit8 v2, v2, 0x1

    goto :goto_loop_rel

    :cond_check_abs
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_ret

    const/4 v2, 0x0

    :goto_loop_abs
    array-length v3, v1

    if-ge v2, v3, :cond_ret

    aget-object v3, v1, v2

    if-eqz v3, :cond_next_abs

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v3, v0, v4}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :cond_next_abs
    add-int/lit8 v2, v2, 0x1

    goto :goto_loop_abs

    :cond_ret
    return-void
.end method

.method public static getTonalBgColor(Landroid/content/Context;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    invoke-static {p0}, Lc7/ThemeManager;->getAccentColor(Landroid/content/Context;)I

    move-result v0

    shr-int/lit8 v1, v0, 0x10

    and-int/lit16 v1, v1, 0xff

    mul-int/lit8 v1, v1, 0x12

    div-int/lit16 v1, v1, 0xff

    add-int/lit8 v1, v1, 0x8

    shr-int/lit8 v2, v0, 0x8

    and-int/lit16 v2, v2, 0xff

    mul-int/lit8 v2, v2, 0x12

    div-int/lit16 v2, v2, 0xff

    add-int/lit8 v2, v2, 0x8

    and-int/lit16 v0, v0, 0xff

    mul-int/lit8 v0, v0, 0x12

    div-int/lit16 v0, v0, 0xff

    add-int/lit8 v0, v0, 0x8

    invoke-static {v1, v2, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    return v0
.end method

.method public static getTonalSurfaceColor(Landroid/content/Context;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    invoke-static {p0}, Lc7/ThemeManager;->getAccentColor(Landroid/content/Context;)I

    move-result v0

    shr-int/lit8 v1, v0, 0x10

    and-int/lit16 v1, v1, 0xff

    mul-int/lit8 v1, v1, 0x1c

    div-int/lit16 v1, v1, 0xff

    add-int/lit8 v1, v1, 0xe

    shr-int/lit8 v2, v0, 0x8

    and-int/lit16 v2, v2, 0xff

    mul-int/lit8 v2, v2, 0x1c

    div-int/lit16 v2, v2, 0xff

    add-int/lit8 v2, v2, 0xe

    and-int/lit16 v0, v0, 0xff

    mul-int/lit8 v0, v0, 0x1c

    div-int/lit16 v0, v0, 0xff

    add-int/lit8 v0, v0, 0xe

    invoke-static {v1, v2, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    return v0
.end method

.method public static getThemeBackgroundColor(Landroid/content/Context;)I
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    invoke-static {p0}, Lc7/ThemeManager;->getThemeMode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "light"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_dark

    const v0, -0x70504    # 0xFFF8FAFC

    return v0

    :cond_dark
    const-string v1, "dark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_mat_you

    const v0, -0xededeb    # 0xFF121218

    return v0

    :cond_mat_you
    const-string v1, "material_you"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_oled

    invoke-static {p0}, Lc7/ThemeManager;->getTonalBgColor(Landroid/content/Context;)I

    move-result v0

    return v0

    :cond_oled
    const/high16 v0, -0x1000000    # 0xFF000000

    return v0
.end method

.method public static getThemeSurfaceColor(Landroid/content/Context;)I
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    invoke-static {p0}, Lc7/ThemeManager;->getThemeMode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "light"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_dark

    const/4 v0, -0x1    # 0xFFFFFFFF

    return v0

    :cond_dark
    const-string v1, "dark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_mat_you

    const v0, -0xe7e7de    # 0xFF181822

    return v0

    :cond_mat_you
    const-string v1, "material_you"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_oled

    invoke-static {p0}, Lc7/ThemeManager;->getTonalSurfaceColor(Landroid/content/Context;)I

    move-result v0

    return v0

    :cond_oled
    const/high16 v0, -0x1000000    # 0xFF000000

    return v0
.end method

.method public static applyTheme(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 7
    .param p0, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lc7/ThemeManager;->getThemeMode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Lc7/ThemeManager;->getThemeBackgroundColor(Landroid/content/Context;)I

    move-result v3

    invoke-static {p0}, Lc7/ThemeManager;->getThemeSurfaceColor(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const-string v2, "light"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_dark_win

    if-eqz v1, :cond_done_win

    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v5}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v5, -0x1

    invoke-virtual {v1, v5}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_done_win

    const/16 v6, 0x2000

    invoke-virtual {v5, v6}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :cond_done_win

    :cond_dark_win
    if-eqz v1, :cond_done_win

    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v5, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v5}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v3}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_done_win

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_done_win
    const v5, 0x7f09031c

    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_tf_done

    invoke-virtual {v5, v4}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_tf_done
    const v5, 0x7f0901cc

    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_ml_done

    invoke-virtual {v5, v3}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_ml_done
    const v5, 0x7f0901cb

    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_mfc_done

    invoke-virtual {v5, v3}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_mfc_done
    const v5, 0x7f090329    # include's toolbarLayout ID replaces customToolbar

    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_tb_done

    instance-of v6, v5, Landroidx/appcompat/widget/Toolbar;

    if-eqz v6, :cond_tb_done

    check-cast v5, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v5, v3}, Landroid/view/View;->setBackgroundColor(I)V

    if-eqz v2, :cond_tb_dark_title

    const v6, -0xf0e8d6

    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/Toolbar;->setTitleTextColor(I)V

    goto :cond_tb_done

    :cond_tb_dark_title
    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/Toolbar;->setTitleTextColor(I)V

    :cond_tb_done
    const v5, 0x7f09032e    # topFiller, when status-bar inset is used
    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v5
    if-eqz v5, :cond_top_filler_done
    invoke-virtual {v5, v3}, Landroid/view/View;->setBackgroundColor(I)V
    :cond_top_filler_done

    const v5, 0x7f09016b    # imageDrawer
    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v5
    instance-of v6, v5, Landroid/widget/ImageView;
    if-eqz v6, :cond_menu_done
    check-cast v5, Landroid/widget/ImageView;
    if-eqz v2, :cond_menu_dark
    const-string v6, "bg_share_pill_light"
    const-string v1, "drawable"
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v0, v6, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v6
    if-eqz v6, :cond_menu_tint_light
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundResource(I)V
    :cond_menu_tint_light
    const v6, 0xff334155
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual {v5, v6, v1}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    goto :cond_menu_done
    :cond_menu_dark
    const-string v6, "bg_share_pill"
    const-string v1, "drawable"
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v0, v6, v1, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v6
    if-eqz v6, :cond_menu_tint_dark
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundResource(I)V
    :cond_menu_tint_dark
    const v6, 0xff94a3b8
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual {v5, v6, v1}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    :cond_menu_done

    const v5, 0x7f090084

    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_dock_bg_done

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    if-eqz v5, :cond_dock_bg_done

    instance-of v6, v5, Landroid/view/View;

    if-eqz v6, :cond_dock_bg_done

    check-cast v5, Landroid/view/View;

    if-eqz v2, :cond_dock_bg_dark

    const v6, 0x7f0701fa

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundResource(I)V

    goto :cond_dock_bg_done

    :cond_dock_bg_dark
    const v6, 0x7f0701ff

    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundResource(I)V

    :cond_dock_bg_done
    invoke-static {p0}, Lc7/DockCustomizer;->updateTabHighlight(Lcom/eljur/client/feature/main/view/MainActivity;)V

    return-void
.end method

.method public static setLauncherIcon(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p0, "context"      # Landroid/content/Context;
    .param p1, "iconAlias"   # Ljava/lang/String;

    if-eqz p0, :cond_4

    if-nez p1, :cond_0

    goto :goto_2

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lc7/ThemeManager;->ALL_ICONS:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_4

    aget-object v4, v1, v3

    invoke-static {v4}, Lc7/ThemeManager;->getAliasClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Landroid/content/ComponentName;

    invoke-direct {v6, p0, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v7, 0x1

    if-eqz v5, :cond_1

    const/4 v5, 0x1

    goto :goto_1

    :cond_1
    const/4 v5, 0x2

    :goto_1
    invoke-virtual {v0, v6, v5, v7}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    :cond_4
    :goto_2
    return-void
.end method

.method public static getAliasClassName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "aliasKey"    # Ljava/lang/String;

    const-string v0, "alias1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "com.eljur.client.feature.splash.view.SplashActivityAlias1"

    return-object v0

    :cond_0
    const-string v0, "alias2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "com.eljur.client.feature.splash.view.SplashActivityAlias2"

    return-object v0

    :cond_1
    const-string v0, "alias3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "com.eljur.client.feature.splash.view.SplashActivityAlias3"

    return-object v0

    :cond_2
    const-string v0, "alias4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "com.eljur.client.feature.splash.view.SplashActivityAlias4"

    return-object v0

    :cond_3
    const-string v0, "alias5"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "com.eljur.client.feature.splash.view.SplashActivityAlias5"

    return-object v0

    :cond_4
    const-string v0, "alias6"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "com.eljur.client.feature.splash.view.SplashActivityAlias6"

    return-object v0

    :cond_5
    const-string v0, "alias7"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "com.eljur.client.feature.splash.view.SplashActivityAlias7"

    return-object v0

    :cond_6
    const-string v0, "alias8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "com.eljur.client.feature.splash.view.SplashActivityAlias8"

    return-object v0

    :cond_7
    const-string v0, "com.eljur.client.feature.splash.view.SplashActivity"

    return-object v0
.end method

.method public static showThemeCustomizerDialog(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 6
    .param p0, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lc7/ThemeManager;->getThemeMode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lc7/ThemeManager;->sSelectedTheme:Ljava/lang/String;

    invoke-static {p0}, Lc7/ThemeManager;->getAccentColor(Landroid/content/Context;)I

    move-result v0

    sput v0, Lc7/ThemeManager;->sSelectedAccent:I

    invoke-static {p0}, Lc7/ThemeManager;->getLauncherIcon(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lc7/ThemeManager;->sSelectedIcon:Ljava/lang/String;

    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    const v2, 0x7f0c00f4    # dialog_theme_customizer

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setContentView(I)V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    if-eqz v2, :cond_1

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/view/Window;->setGravity(I)V

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-virtual {v2, v3, v4}, Landroid/view/Window;->setLayout(II)V

    const v3, 0x7f12000a

    invoke-virtual {v2, v3}, Landroid/view/Window;->setWindowAnimations(I)V

    :cond_1
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    # Wire Theme Chips (type 0)
    const-string v1, "oled"
    const v2, 0x7f090399
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindThemeChip(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "dark"
    const v2, 0x7f09039a
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindThemeChip(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "light"
    const v2, 0x7f09039b
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindThemeChip(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "material_you"
    const v2, 0x7f09039c
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindThemeChip(Landroid/app/Dialog;ILjava/lang/String;)V

    # Wire Color Dots (type 1)
    const v1, 0x7f09039d
    const v2, -0xf57b01
    invoke-static {v0, v1, v2}, Lc7/ThemeManager;->bindColorDot(Landroid/app/Dialog;II)V

    const v1, 0x7f09039e
    const v2, -0x3f7b04    # 0xFFC084FC
    invoke-static {v0, v1, v2}, Lc7/ThemeManager;->bindColorDot(Landroid/app/Dialog;II)V

    const v1, 0x7f09039f
    const v2, -0xef467f
    invoke-static {v0, v1, v2}, Lc7/ThemeManager;->bindColorDot(Landroid/app/Dialog;II)V

    const v1, 0x7f0903a0
    const v2, -0xbc0a2
    invoke-static {v0, v1, v2}, Lc7/ThemeManager;->bindColorDot(Landroid/app/Dialog;II)V

    const v1, 0x7f0903a1
    const v2, -0xa61f5
    invoke-static {v0, v1, v2}, Lc7/ThemeManager;->bindColorDot(Landroid/app/Dialog;II)V

    const v1, 0x7f0903a2
    const v2, -0x13b767
    invoke-static {v0, v1, v2}, Lc7/ThemeManager;->bindColorDot(Landroid/app/Dialog;II)V

    const v1, 0x7f0903a3
    const v2, -0xf9492c
    invoke-static {v0, v1, v2}, Lc7/ThemeManager;->bindColorDot(Landroid/app/Dialog;II)V

    # Wire Icon Cards (type 2)
    const-string v1, "default"
    const v2, 0x7f0903a4
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "alias1"
    const v2, 0x7f0903a5
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "alias2"
    const v2, 0x7f0903a6
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "alias3"
    const v2, 0x7f0903a7
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "alias4"
    const v2, 0x7f0903a8
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "alias5"
    const v2, 0x7f0903a9
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "alias6"
    const v2, 0x7f0903aa
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "alias7"
    const v2, 0x7f0903ab
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v1, "alias8"
    const v2, 0x7f0903bb
    invoke-static {v0, v2, v1}, Lc7/ThemeManager;->bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V

    # Close button (actionType 2)
    const v1, 0x7f090398
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_close_done

    new-instance v2, Lc7/ThemeActionClickListener;

    const/4 v3, 0x2

    invoke-direct {v2, v3, p0, v0}, Lc7/ThemeActionClickListener;-><init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_close_done
    # Dock Customize button (actionType 3)
    const v1, 0x7f0903ac
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_dock_done

    new-instance v2, Lc7/ThemeActionClickListener;

    const/4 v3, 0x3

    invoke-direct {v2, v3, p0, v0}, Lc7/ThemeActionClickListener;-><init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_dock_done
    # Reset button (actionType 0)
    const v1, 0x7f0903ae
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_reset_done

    new-instance v2, Lc7/ThemeActionClickListener;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p0, v0}, Lc7/ThemeActionClickListener;-><init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_reset_done
    # Save button (actionType 1)
    const v1, 0x7f0903ad
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_save_done

    new-instance v2, Lc7/ThemeActionClickListener;

    const/4 v3, 0x1

    invoke-direct {v2, v3, p0, v0}, Lc7/ThemeActionClickListener;-><init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_save_done
    # Greeting switch. Saved immediately; defaults to enabled.
    const v1, 0x7f0903c3

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CompoundButton;

    if-eqz v1, :cond_greeting_done

    invoke-static {p0}, Lc7/GreetingManager;->isEnabled(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    new-instance v2, Lc7/GreetingToggleListener;

    invoke-direct {v2, p0}, Lc7/GreetingToggleListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_greeting_done
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_advanced_done

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const-string v2, "advanced_customization"

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_advanced_done

    new-instance v2, Lc7/UiCustomizationOpenClickListener;

    invoke-direct {v2, p0, v0}, Lc7/UiCustomizationOpenClickListener;-><init>(Lcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_advanced_done

    invoke-static {v0, p0}, Lrk/mcp/McpSettings;->bind(Landroid/app/Dialog;Landroid/app/Activity;)V

    invoke-static {v0}, Lc7/ThemeManager;->refreshDialogVisuals(Landroid/app/Dialog;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    const v1, 0x7f090397    # theme_customizer_sheet
    invoke-static {v0, p0, v1}, Lc7/LiquidGlassDialogHelper;->setup(Landroid/app/Dialog;Landroid/app/Activity;I)V

    return-void
.end method

.method public static bindThemeChip(Landroid/app/Dialog;ILjava/lang/String;)V
    .locals 3

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lc7/ThemeSelectionClickListener;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p2, v2, p0}, Lc7/ThemeSelectionClickListener;-><init>(ILjava/lang/String;ILandroid/app/Dialog;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public static bindColorDot(Landroid/app/Dialog;II)V
    .locals 4

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lc7/ThemeSelectionClickListener;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p2, p0}, Lc7/ThemeSelectionClickListener;-><init>(ILjava/lang/String;ILandroid/app/Dialog;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public static bindIconCard(Landroid/app/Dialog;ILjava/lang/String;)V
    .locals 3

    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lc7/ThemeSelectionClickListener;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, p2, v3, p0}, Lc7/ThemeSelectionClickListener;-><init>(ILjava/lang/String;ILandroid/app/Dialog;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public static onThemeChipClicked(Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_0

    sput-object p1, Lc7/ThemeManager;->sSelectedTheme:Ljava/lang/String;

    invoke-static {p0}, Lc7/ThemeManager;->refreshDialogVisuals(Landroid/app/Dialog;)V

    :cond_0
    return-void
.end method

.method public static onColorCircleClicked(Landroid/app/Dialog;I)V
    .locals 0

    sput p1, Lc7/ThemeManager;->sSelectedAccent:I

    invoke-static {p0}, Lc7/ThemeManager;->refreshDialogVisuals(Landroid/app/Dialog;)V

    return-void
.end method

.method public static onIconCardClicked(Landroid/app/Dialog;Ljava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_0

    sput-object p1, Lc7/ThemeManager;->sSelectedIcon:Ljava/lang/String;

    invoke-static {p0}, Lc7/ThemeManager;->refreshDialogVisuals(Landroid/app/Dialog;)V

    :cond_0
    return-void
.end method

.method public static refreshDialogVisuals(Landroid/app/Dialog;)V
    .locals 7
    .param p0, "dialog"    # Landroid/app/Dialog;

    if-nez p0, :cond_0

    return-void

    # 1. Update Theme Chips
    :cond_0
    const-string v0, "oled"
    const v1, 0x7f090399
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateChipVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "dark"
    const v1, 0x7f09039a
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateChipVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "light"
    const v1, 0x7f09039b
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateChipVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "material_you"
    const v1, 0x7f09039c
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateChipVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    # 2. Update Color Dots
    const v0, 0x7f09039d
    const v1, -0xf57b01
    invoke-static {p0, v0, v1}, Lc7/ThemeManager;->updateDotVisual(Landroid/app/Dialog;II)V

    const v0, 0x7f09039e
    const v1, -0x3f7b04    # 0xFFC084FC
    invoke-static {p0, v0, v1}, Lc7/ThemeManager;->updateDotVisual(Landroid/app/Dialog;II)V

    const v0, 0x7f09039f
    const v1, -0xef467f
    invoke-static {p0, v0, v1}, Lc7/ThemeManager;->updateDotVisual(Landroid/app/Dialog;II)V

    const v0, 0x7f0903a0
    const v1, -0xbc0a2
    invoke-static {p0, v0, v1}, Lc7/ThemeManager;->updateDotVisual(Landroid/app/Dialog;II)V

    const v0, 0x7f0903a1
    const v1, -0xa61f5
    invoke-static {p0, v0, v1}, Lc7/ThemeManager;->updateDotVisual(Landroid/app/Dialog;II)V

    const v0, 0x7f0903a2
    const v1, -0x13b767
    invoke-static {p0, v0, v1}, Lc7/ThemeManager;->updateDotVisual(Landroid/app/Dialog;II)V

    const v0, 0x7f0903a3
    const v1, -0xf9492c
    invoke-static {p0, v0, v1}, Lc7/ThemeManager;->updateDotVisual(Landroid/app/Dialog;II)V

    # 3. Update Icon Cards
    const-string v0, "default"
    const v1, 0x7f0903a4
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "alias1"
    const v1, 0x7f0903a5
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "alias2"
    const v1, 0x7f0903a6
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "alias3"
    const v1, 0x7f0903a7
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "alias4"
    const v1, 0x7f0903a8
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "alias5"
    const v1, 0x7f0903a9
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "alias6"
    const v1, 0x7f0903aa
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "alias7"
    const v1, 0x7f0903ab
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    const-string v0, "alias8"
    const v1, 0x7f0903bb
    invoke-static {p0, v1, v0}, Lc7/ThemeManager;->updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V

    return-void
.end method

.method public static updateChipVisual(Landroid/app/Dialog;ILjava/lang/String;)V
    .locals 2

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    sget-object v1, Lc7/ThemeManager;->sSelectedTheme:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f0701f2    # bg_dock_chip_active
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_0
    const v1, 0x7f0701f3    # bg_dock_chip_inactive
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static updateDotVisual(Landroid/app/Dialog;II)V
    .locals 2

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    sget v1, Lc7/ThemeManager;->sSelectedAccent:I

    if-ne v1, p2, :cond_0

    const v1, 0x7f0701f7    # bg_theme_color_ring
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static updateCardVisual(Landroid/app/Dialog;ILjava/lang/String;)V
    .locals 2

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    sget-object v1, Lc7/ThemeManager;->sSelectedIcon:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f0701f8    # bg_theme_icon_card_active
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_0
    const v1, 0x7f0701f9    # bg_theme_icon_card_inactive
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static onResetClicked(Lcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V
    .locals 1

    const-string v0, "oled"

    sput-object v0, Lc7/ThemeManager;->sSelectedTheme:Ljava/lang/String;

    const v0, -0xf57b01

    sput v0, Lc7/ThemeManager;->sSelectedAccent:I

    const-string v0, "alias4"

    sput-object v0, Lc7/ThemeManager;->sSelectedIcon:Ljava/lang/String;

    invoke-static {p1}, Lc7/ThemeManager;->refreshDialogVisuals(Landroid/app/Dialog;)V

    return-void
.end method

.method public static onSaveClicked(Lcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V
    .locals 4

    if-eqz p0, :cond_1

    const-string v0, "theme_customizer_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "theme_mode"

    sget-object v3, Lc7/ThemeManager;->sSelectedTheme:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v2, "accent_color"

    sget v3, Lc7/ThemeManager;->sSelectedAccent:I

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string v2, "launcher_icon"

    sget-object v3, Lc7/ThemeManager;->sSelectedIcon:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    invoke-virtual {p0}, Lcom/eljur/client/feature/main/view/MainActivity;->B0()Lcom/eljur/client/feature/main/presenter/MainPresenter;

    move-result-object v0

    if-eqz v0, :cond_skip_h

    sget-object v2, Lc7/ThemeManager;->sSelectedTheme:Ljava/lang/String;

    const-string v3, "light"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_night

    sget-object v2, Lu9/a;->c:Lu9/a;

    goto :cond_apply_h

    :cond_night
    sget-object v2, Lu9/a;->d:Lu9/a;

    :cond_apply_h
    invoke-virtual {v0, v2}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->h(Lu9/a;)V

    :cond_skip_h
    invoke-static {p0}, Lc7/ThemeManager;->applyTheme(Lcom/eljur/client/feature/main/view/MainActivity;)V

    sget-object v0, Lc7/ThemeManager;->sSelectedIcon:Ljava/lang/String;

    invoke-static {p0, v0}, Lc7/ThemeManager;->setLauncherIcon(Landroid/content/Context;Ljava/lang/String;)V

    const-string v0, "\u041e\u0444\u043e\u0440\u043c\u043b\u0435\u043d\u0438\u0435 \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u043e"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    :cond_1
    return-void
.end method

.method public static onDockCustomizeClicked(Lcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    if-eqz p0, :cond_1

    invoke-static {p0}, Lc7/DockCustomizer;->showCustomizerDialog(Lcom/eljur/client/feature/main/view/MainActivity;)V

    :cond_1
    return-void
.end method
