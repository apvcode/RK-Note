.class public final Lc7/UiCustomizationManager;
.super Ljava/lang/Object;
.source "UiCustomizationManager.java"

# static fields
.field private static sBlurDock:I
.field private static sBlurDrawer:I
.field private static sBlurLesson:I
.field private static sShape:I
.field private static sDensity:I
.field private static sGradeStyle:I
.field private static sGradeColor:I

# direct methods
.method static constructor <clinit>()V
    .locals 1
    const/4 v0, 0x1
    sput v0, Lc7/UiCustomizationManager;->sBlurDock:I
    sput v0, Lc7/UiCustomizationManager;->sBlurDrawer:I
    sput v0, Lc7/UiCustomizationManager;->sBlurLesson:I
    sput v0, Lc7/UiCustomizationManager;->sShape:I
    sput v0, Lc7/UiCustomizationManager;->sDensity:I
    const/4 v0, 0x0
    sput v0, Lc7/UiCustomizationManager;->sGradeStyle:I
    const/4 v0, 0x1
    sput v0, Lc7/UiCustomizationManager;->sGradeColor:I
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static getPref(Landroid/content/Context;Ljava/lang/String;I)I
    .locals 2
    if-eqz p0, :done
    const-string v0, "theme_customizer_prefs"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    move-result p2
    :done
    return p2
.end method

.method private static load(Landroid/content/Context;)V
    .locals 2
    const-string v0, "blur_dock"
    const/4 v1, 0x1
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    sput v0, Lc7/UiCustomizationManager;->sBlurDock:I
    const-string v0, "blur_drawer"
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    sput v0, Lc7/UiCustomizationManager;->sBlurDrawer:I
    const-string v0, "blur_lesson"
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    sput v0, Lc7/UiCustomizationManager;->sBlurLesson:I
    const-string v0, "corner_style"
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    sput v0, Lc7/UiCustomizationManager;->sShape:I
    const-string v0, "density_mode"
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    sput v0, Lc7/UiCustomizationManager;->sDensity:I
    const-string v0, "grade_style"
    const/4 v1, 0x0
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    sput v0, Lc7/UiCustomizationManager;->sGradeStyle:I
    const-string v0, "grade_color"
    const/4 v1, 0x1
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    sput v0, Lc7/UiCustomizationManager;->sGradeColor:I
    return-void
.end method

.method public static getBlurRadius(Landroid/content/Context;Ljava/lang/String;)F
    .locals 2
    const/4 v0, 0x1
    invoke-static {p0, p1, v0}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    if-nez v0, :medium
    const/high16 v1, 0x41400000    # 12.0f
    return v1
    :medium
    const/4 v1, 0x2
    if-ne v0, v1, :normal
    const/high16 v1, 0x42200000    # 40.0f
    return v1
    :normal
    const/high16 v1, 0x41c80000    # 25.0f
    return v1
.end method

.method public static getGradeStyle(Landroid/content/Context;)I
    .locals 2
    const-string v0, "grade_style"
    const/4 v1, 0x0
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    return v0
.end method

.method public static isGradeColorEnabled(Landroid/content/Context;)Z
    .locals 2
    const-string v0, "grade_color"
    const/4 v1, 0x1
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v0
    if-eqz v0, :off
    const/4 v0, 0x1
    return v0
    :off
    const/4 v0, 0x0
    return v0
.end method

.method public static showDialog(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 8
    if-eqz p0, :done
    invoke-static {p0}, Lc7/UiCustomizationManager;->load(Landroid/content/Context;)V
    new-instance v0, Landroid/app/Dialog;
    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V
    const/4 v1, 0x1
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    const-string v3, "dialog_ui_customization"
    const-string v4, "layout"
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v5
    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v2
    if-eqz v2, :done
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setContentView(I)V
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v2
    if-eqz v2, :window_done
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
    :window_done
    const-string v2, "blur_dock"
    invoke-static {v0, p0, v2}, Lc7/UiCustomizationManager;->bindTriple(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    const-string v2, "blur_drawer"
    invoke-static {v0, p0, v2}, Lc7/UiCustomizationManager;->bindTriple(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    const-string v2, "blur_lesson"
    invoke-static {v0, p0, v2}, Lc7/UiCustomizationManager;->bindTriple(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    const-string v2, "shape"
    invoke-static {v0, p0, v2}, Lc7/UiCustomizationManager;->bindTriple(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    const-string v2, "grade_style"
    invoke-static {v0, p0, v2}, Lc7/UiCustomizationManager;->bindTriple(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    const-string v2, "density"
    const/4 v3, 0x0
    invoke-static {v0, p0, v2, v3}, Lc7/UiCustomizationManager;->bind(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    const/4 v3, 0x1
    invoke-static {v0, p0, v2, v3}, Lc7/UiCustomizationManager;->bind(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    const-string v2, "grade_color"
    const/4 v3, 0x0
    invoke-static {v0, p0, v2, v3}, Lc7/UiCustomizationManager;->bind(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    const/4 v3, 0x1
    invoke-static {v0, p0, v2, v3}, Lc7/UiCustomizationManager;->bind(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    const-string v2, "custom_save"
    invoke-static {v0, p0, v2}, Lc7/UiCustomizationManager;->bindAction(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    const-string v2, "custom_reset"
    invoke-static {v0, p0, v2}, Lc7/UiCustomizationManager;->bindAction(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    invoke-static {v0}, Lc7/UiCustomizationManager;->refresh(Landroid/app/Dialog;)V
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V
    const v2, 0x7f090397
    invoke-static {v0, p0, v2}, Lc7/LiquidGlassDialogHelper;->setup(Landroid/app/Dialog;Landroid/app/Activity;I)V
    :done
    return-void
.end method

.method private static find(Landroid/app/Dialog;Ljava/lang/String;)Landroid/view/View;
    .locals 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v0
    if-eqz v0, :none
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v0
    return-object v0
    :none
    const/4 v0, 0x0
    return-object v0
.end method

.method private static bindTriple(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 1
    const/4 v0, 0x0
    invoke-static {p0, p1, p2, v0}, Lc7/UiCustomizationManager;->bind(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    const/4 v0, 0x1
    invoke-static {p0, p1, p2, v0}, Lc7/UiCustomizationManager;->bind(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    const/4 v0, 0x2
    invoke-static {p0, p1, p2, v0}, Lc7/UiCustomizationManager;->bind(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    return-void
.end method

.method private static bind(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    .locals 4
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "_"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {p0, v0}, Lc7/UiCustomizationManager;->find(Landroid/app/Dialog;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    new-instance v1, Lc7/UiCustomizationClickListener;
    invoke-direct {v1, p0, p1, p2, p3}, Lc7/UiCustomizationClickListener;-><init>(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :done
    return-void
.end method

.method private static bindAction(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 3
    invoke-static {p0, p2}, Lc7/UiCustomizationManager;->find(Landroid/app/Dialog;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    new-instance v1, Lc7/UiCustomizationClickListener;
    const/4 v2, 0x0
    invoke-direct {v1, p0, p1, p2, v2}, Lc7/UiCustomizationClickListener;-><init>(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :done
    return-void
.end method

.method public static onOption(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;I)V
    .locals 1
    const-string v0, "custom_save"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_reset
    invoke-static {p0, p1}, Lc7/UiCustomizationManager;->save(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;)V
    return-void
    :check_reset
    const-string v0, "custom_reset"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_dock
    const/4 v0, 0x1
    sput v0, Lc7/UiCustomizationManager;->sBlurDock:I
    sput v0, Lc7/UiCustomizationManager;->sBlurDrawer:I
    sput v0, Lc7/UiCustomizationManager;->sBlurLesson:I
    sput v0, Lc7/UiCustomizationManager;->sShape:I
    sput v0, Lc7/UiCustomizationManager;->sDensity:I
    const/4 v0, 0x0
    sput v0, Lc7/UiCustomizationManager;->sGradeStyle:I
    const/4 v0, 0x1
    sput v0, Lc7/UiCustomizationManager;->sGradeColor:I
    goto :refresh
    :check_dock
    const-string v0, "blur_dock"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_drawer
    sput p3, Lc7/UiCustomizationManager;->sBlurDock:I
    goto :refresh
    :check_drawer
    const-string v0, "blur_drawer"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_lesson
    sput p3, Lc7/UiCustomizationManager;->sBlurDrawer:I
    goto :refresh
    :check_lesson
    const-string v0, "blur_lesson"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_shape
    sput p3, Lc7/UiCustomizationManager;->sBlurLesson:I
    goto :refresh
    :check_shape
    const-string v0, "shape"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_density
    sput p3, Lc7/UiCustomizationManager;->sShape:I
    goto :refresh
    :check_density
    const-string v0, "density"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_grade_style
    sput p3, Lc7/UiCustomizationManager;->sDensity:I
    goto :refresh
    :check_grade_style
    const-string v0, "grade_style"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :check_grade_color
    sput p3, Lc7/UiCustomizationManager;->sGradeStyle:I
    goto :refresh
    :check_grade_color
    const-string v0, "grade_color"
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    sput p3, Lc7/UiCustomizationManager;->sGradeColor:I
    :refresh
    invoke-static {p0}, Lc7/UiCustomizationManager;->refresh(Landroid/app/Dialog;)V
    :done
    return-void
.end method

.method private static save(Landroid/app/Dialog;Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 3
    const-string v0, "theme_customizer_prefs"
    const/4 v1, 0x0
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v1, "blur_dock"
    sget v2, Lc7/UiCustomizationManager;->sBlurDock:I
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    const-string v1, "blur_drawer"
    sget v2, Lc7/UiCustomizationManager;->sBlurDrawer:I
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    const-string v1, "blur_lesson"
    sget v2, Lc7/UiCustomizationManager;->sBlurLesson:I
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    const-string v1, "corner_style"
    sget v2, Lc7/UiCustomizationManager;->sShape:I
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    const-string v1, "density_mode"
    sget v2, Lc7/UiCustomizationManager;->sDensity:I
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    const-string v1, "grade_style"
    sget v2, Lc7/UiCustomizationManager;->sGradeStyle:I
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    const-string v1, "grade_color"
    sget v2, Lc7/UiCustomizationManager;->sGradeColor:I
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V
    invoke-virtual {p1}, Landroid/app/Activity;->recreate()V
    return-void
.end method

.method private static refresh(Landroid/app/Dialog;)V
    .locals 3
    const-string v0, "blur_dock"
    sget v1, Lc7/UiCustomizationManager;->sBlurDock:I
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->refreshTriple(Landroid/app/Dialog;Ljava/lang/String;I)V
    const-string v0, "blur_drawer"
    sget v1, Lc7/UiCustomizationManager;->sBlurDrawer:I
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->refreshTriple(Landroid/app/Dialog;Ljava/lang/String;I)V
    const-string v0, "blur_lesson"
    sget v1, Lc7/UiCustomizationManager;->sBlurLesson:I
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->refreshTriple(Landroid/app/Dialog;Ljava/lang/String;I)V
    const-string v0, "shape"
    sget v1, Lc7/UiCustomizationManager;->sShape:I
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->refreshTriple(Landroid/app/Dialog;Ljava/lang/String;I)V
    const-string v0, "grade_style"
    sget v1, Lc7/UiCustomizationManager;->sGradeStyle:I
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->refreshTriple(Landroid/app/Dialog;Ljava/lang/String;I)V
    const-string v0, "density"
    sget v1, Lc7/UiCustomizationManager;->sDensity:I
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->refreshDouble(Landroid/app/Dialog;Ljava/lang/String;I)V
    const-string v0, "grade_color"
    sget v1, Lc7/UiCustomizationManager;->sGradeColor:I
    invoke-static {p0, v0, v1}, Lc7/UiCustomizationManager;->refreshDouble(Landroid/app/Dialog;Ljava/lang/String;I)V
    return-void
.end method

.method private static refreshTriple(Landroid/app/Dialog;Ljava/lang/String;I)V
    .locals 2
    const/4 v0, 0x0
    if-ne p2, v0, :t0
    const/4 v1, 0x1
    goto :u0
    :t0
    const/4 v1, 0x0
    :u0
    invoke-static {p0, p1, v0, v1}, Lc7/UiCustomizationManager;->update(Landroid/app/Dialog;Ljava/lang/String;IZ)V
    const/4 v0, 0x1
    if-ne p2, v0, :t1
    const/4 v1, 0x1
    goto :u1
    :t1
    const/4 v1, 0x0
    :u1
    invoke-static {p0, p1, v0, v1}, Lc7/UiCustomizationManager;->update(Landroid/app/Dialog;Ljava/lang/String;IZ)V
    const/4 v0, 0x2
    if-ne p2, v0, :t2
    const/4 v1, 0x1
    goto :u2
    :t2
    const/4 v1, 0x0
    :u2
    invoke-static {p0, p1, v0, v1}, Lc7/UiCustomizationManager;->update(Landroid/app/Dialog;Ljava/lang/String;IZ)V
    return-void
.end method

.method private static refreshDouble(Landroid/app/Dialog;Ljava/lang/String;I)V
    .locals 2
    const/4 v0, 0x0
    if-ne p2, v0, :d0
    const/4 v1, 0x1
    goto :du0
    :d0
    const/4 v1, 0x0
    :du0
    invoke-static {p0, p1, v0, v1}, Lc7/UiCustomizationManager;->update(Landroid/app/Dialog;Ljava/lang/String;IZ)V
    const/4 v0, 0x1
    if-ne p2, v0, :d1
    const/4 v1, 0x1
    goto :du1
    :d1
    const/4 v1, 0x0
    :du1
    invoke-static {p0, p1, v0, v1}, Lc7/UiCustomizationManager;->update(Landroid/app/Dialog;Ljava/lang/String;IZ)V
    return-void
.end method

.method private static update(Landroid/app/Dialog;Ljava/lang/String;IZ)V
    .locals 4
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "_"
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {p0, v0}, Lc7/UiCustomizationManager;->find(Landroid/app/Dialog;Ljava/lang/String;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    if-eqz p3, :inactive
    const v1, 0x7f0701f2
    const/4 v2, -0x1
    goto :apply
    :inactive
    const v1, 0x7f0701f3
    const v2, -0x5f5f58    # 0xFFA0A0A8
    :apply
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V
    if-eqz p3, :clear_tint
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-static {v1}, Lc7/ThemeManager;->getAccentColor(Landroid/content/Context;)I
    move-result v1
    const v3, 0xffffff
    and-int/2addr v1, v3
    const/high16 v3, 0x66000000
    or-int/2addr v1, v3
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;
    move-result-object v3
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    goto :tint_done
    :clear_tint
    const/4 v3, 0x0
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V
    :tint_done
    instance-of v1, v0, Landroid/widget/TextView;
    if-eqz v1, :done
    check-cast v0, Landroid/widget/TextView;
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V
    :done
    return-void
.end method

.method private static dp(Landroid/view/View;I)I
    .locals 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F
    int-to-float p1, p1
    mul-float/2addr p1, v0
    const/high16 v0, 0x3f000000    # 0.5f
    add-float/2addr p1, v0
    float-to-int p1, p1
    return p1
.end method

.method private static setNamedBackground(Landroid/view/View;Ljava/lang/String;)V
    .locals 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    const-string v2, "drawable"
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v1, p1, v2, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    if-eqz v0, :done
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V
    const/4 v0, 0x1
    invoke-virtual {p0, v0}, Landroid/view/View;->setClipToOutline(Z)V
    :done
    return-void
.end method

.method private static setBottomMargin(Landroid/view/View;I)V
    .locals 2
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v1, :done_margin
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-static {p0, p1}, Lc7/UiCustomizationManager;->dp(Landroid/view/View;I)I
    move-result p1
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :done_margin
    return-void
.end method

.method public static applyToTree(Landroid/view/View;)V
    .locals 4
    if-eqz p0, :done_public
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "corner_style"
    const/4 v2, 0x1
    invoke-static {v0, v1, v2}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v1
    const-string v2, "density_mode"
    const/4 v3, 0x1
    invoke-static {v0, v2, v3}, Lc7/UiCustomizationManager;->getPref(Landroid/content/Context;Ljava/lang/String;I)I
    move-result v2
    invoke-static {p0, v1, v2}, Lc7/UiCustomizationManager;->applyToTreeInternal(Landroid/view/View;II)V

    new-instance v0, Lc7/UiCustomizationApplyRunnable;
    invoke-direct {v0, p0, v1, v2}, Lc7/UiCustomizationApplyRunnable;-><init>(Landroid/view/View;II)V
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z
    :done_public
    return-void
.end method

.method public static applyAgain(Landroid/view/View;II)V
    .locals 0
    invoke-static {p0, p1, p2}, Lc7/UiCustomizationManager;->applyToTreeInternal(Landroid/view/View;II)V
    invoke-static {p0}, Lrk/diary/DiaryUi;->styleTree(Landroid/view/View;)V
    return-void
.end method

.method private static applyToTreeInternal(Landroid/view/View;II)V
    .locals 7
    if-eqz p0, :done
    move v1, p1
    move v2, p2
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v3
    instance-of v4, v3, Ljava/lang/String;
    if-eqz v4, :recurse
    check-cast v3, Ljava/lang/String;
    const-string v4, "rk_shape_card"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :card_shape
    const-string v4, "rk_homework_card"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :shape_dock
    :card_shape
    if-nez v1, :card_mid
    const-string v4, "bg_custom_card_compact"
    goto :set_shape
    :card_mid
    const/4 v5, 0x2
    if-ne v1, v5, :card_normal
    const-string v4, "bg_custom_card_round"
    goto :set_shape
    :card_normal
    const-string v4, "bg_custom_card_standard"
    goto :set_shape
    :shape_dock
    const-string v4, "rk_shape_dock"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :shape_menu
    if-nez v1, :dock_mid
    const-string v4, "bg_custom_dock_compact"
    goto :set_shape
    :dock_mid
    const/4 v5, 0x2
    if-ne v1, v5, :dock_normal
    const-string v4, "bg_custom_dock_round"
    goto :set_shape
    :dock_normal
    const-string v4, "bg_custom_dock_standard"
    goto :set_shape
    :shape_menu
    const-string v4, "rk_shape_menu"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :shape_lesson
    if-nez v1, :menu_mid
    const-string v4, "bg_custom_menu_compact"
    goto :set_shape
    :menu_mid
    const/4 v5, 0x2
    if-ne v1, v5, :menu_normal
    const-string v4, "bg_custom_menu_round"
    goto :set_shape
    :menu_normal
    const-string v4, "bg_custom_menu_standard"
    goto :set_shape
    :shape_lesson
    const-string v4, "rk_shape_lesson"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :density_day
    if-nez v1, :lesson_mid
    const-string v4, "bg_custom_lesson_compact"
    goto :set_shape
    :lesson_mid
    const/4 v5, 0x2
    if-ne v1, v5, :lesson_normal
    const-string v4, "bg_custom_lesson_round"
    goto :set_shape
    :lesson_normal
    const-string v4, "bg_custom_lesson_standard"
    :set_shape
    invoke-static {p0, v4}, Lc7/UiCustomizationManager;->setNamedBackground(Landroid/view/View;Ljava/lang/String;)V
    const-string v4, "rk_homework_card"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :density_homework_apply
    goto :recurse
    :density_day
    const-string v4, "rk_density_day"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :density_day_divider
    if-nez v2, :day_normal
    const/16 v4, 0x8
    const/4 v5, 0x2
    goto :set_vertical
    :day_normal
    const/16 v4, 0x1a
    const/4 v5, 0x6
    goto :set_vertical
    :density_day_divider
    const-string v4, "rk_density_day_divider"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :density_lesson
    if-nez v2, :divider_normal
    const/16 v4, 0x8
    goto :set_bottom_margin
    :divider_normal
    const/16 v4, 0x14
    :set_bottom_margin
    invoke-static {p0, v4}, Lc7/UiCustomizationManager;->setBottomMargin(Landroid/view/View;I)V
    goto :recurse
    :density_lesson
    const-string v4, "rk_density_lesson"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :density_homework
    if-nez v2, :lesson_density_normal
    const/4 v4, 0x4
    const/4 v5, 0x2
    goto :set_vertical
    :lesson_density_normal
    const/16 v4, 0xa
    const/4 v5, 0x5
    goto :set_vertical
    :density_homework
    const-string v4, "rk_homework_card"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :density_topic
    :density_homework_apply
    if-nez v2, :homework_normal
    const/4 v4, 0x4
    const/4 v5, 0x4
    goto :set_vertical
    :homework_normal
    const/4 v4, 0x7
    const/4 v5, 0x7
    goto :set_vertical
    :density_topic
    const-string v4, "rk_density_topic"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :density_marks
    if-nez v2, :topic_normal
    const/4 v4, 0x0
    const/4 v5, 0x1
    goto :set_vertical
    :topic_normal
    const/4 v4, 0x0
    const/4 v5, 0x5
    goto :set_vertical
    :density_marks
    const-string v4, "rk_density_marks"
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :recurse
    if-nez v2, :marks_normal
    const/4 v4, 0x0
    const/4 v5, 0x1
    goto :set_vertical
    :marks_normal
    const/4 v4, 0x2
    const/4 v5, 0x6
    :set_vertical
    invoke-static {p0, v4}, Lc7/UiCustomizationManager;->dp(Landroid/view/View;I)I
    move-result v4
    invoke-static {p0, v5}, Lc7/UiCustomizationManager;->dp(Landroid/view/View;I)I
    move-result v5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I
    move-result v0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I
    move-result v1
    invoke-virtual {p0, v0, v4, v1, v5}, Landroid/view/View;->setPadding(IIII)V
    const-string v0, "rk_homework_card"
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :recurse
    if-nez p2, :homework_margin_normal
    const/4 v0, 0x3
    goto :homework_margin_ready
    :homework_margin_normal
    const/4 v0, 0x7
    :homework_margin_ready
    invoke-static {p0, v0}, Lc7/UiCustomizationManager;->setBottomMargin(Landroid/view/View;I)V
    :recurse
    instance-of v0, p0, Landroid/view/ViewGroup;
    if-eqz v0, :done
    check-cast p0, Landroid/view/ViewGroup;
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    const/4 v1, 0x0
    :loop
    if-ge v1, v0, :done
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v2
    invoke-static {v2, p1, p2}, Lc7/UiCustomizationManager;->applyToTreeInternal(Landroid/view/View;II)V
    add-int/lit8 v1, v1, 0x1
    goto :loop
    :done
    return-void
.end method
