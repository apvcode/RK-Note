.class public final Lrk/diary/DiaryUi;
.super Ljava/lang/Object;
.source "DiaryUi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/diary/DiaryUi$Header;,
        Lrk/diary/DiaryUi$Progress;
    }
.end annotation


# static fields
.field private static final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Lrk/diary/DiaryUi$Header;",
            ">;"
        }
    .end annotation
.end field

.field private static markDialog:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Dialog;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 18
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    .line 19
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lrk/diary/DiaryUi;->markDialog:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static accent(Landroid/content/Context;)I
    .registers 3

    .line 26
    const-string v0, "getAccentColor"

    const v1, -0xf57b01

    invoke-static {p0, v0, v1}, Lrk/schedule/ScheduleBridge;->themeColor(Landroid/content/Context;Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$000(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 2

    .line 16
    invoke-static {p0, p1}, Lrk/diary/DiaryUi;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Landroid/content/Context;F)I
    .registers 2

    .line 16
    invoke-static {p0, p1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result p0

    return p0
.end method

.method private static archiveLabel(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 122
    const-string v0, "lesson:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3c

    const/16 v0, 0x7c

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, 0x7

    if-le v0, v1, :cond_3c

    :try_start_11
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_3a} :catch_3b

    return-object p0

    :catch_3b
    move-exception p0

    :cond_3c
    const-string p0, "\u0421\u0442\u0430\u0440\u0430\u044f \u0437\u0430\u043f\u0438\u0441\u044c"

    return-object p0
.end method

.method public static bindHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 35
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lrk/diary/DiaryUi;->bindHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static bindHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12

    .line 38
    const-string v0, "rk_diary_progress"

    :try_start_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lrk/diary/DiaryUi$Progress;

    .line 39
    if-nez v2, :cond_28

    instance-of v3, p0, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_28

    new-instance v2, Lrk/diary/DiaryUi$Progress;

    invoke-direct {v2, v1}, Lrk/diary/DiaryUi$Progress;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Lrk/diary/DiaryUi$Progress;->setTag(Ljava/lang/Object;)V

    move-object v0, p0

    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object v7, v2

    goto :goto_29

    .line 40
    :cond_28
    move-object v7, v2

    :goto_29
    new-instance v2, Lrk/diary/DiaryUi$Header;

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v2 .. v7}, Lrk/diary/DiaryUi$Header;-><init>(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrk/diary/DiaryUi$Progress;)V

    sget-object p0, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    invoke-interface {p0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    const-string p0, "textNum"

    invoke-static {v3, p0}, Lrk/diary/DiaryUi;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_4e

    invoke-static {v1}, Lrk/diary/DiaryUi;->surface(Landroid/content/Context;)I

    move-result p1

    const/16 p2, 0x8

    invoke-static {v1, p1, p2}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 42
    :cond_4e
    const-string p0, "textName"

    invoke-static {v3, p0}, Lrk/diary/DiaryUi;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_76

    const/high16 p1, 0x41880000    # 17.0f

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {v1}, Lrk/diary/DiaryUi;->text(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const-string p1, "sans-serif-medium"

    const/4 p2, 0x0

    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance p1, Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;

    invoke-direct {p1, v3, v4, v2}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;-><init>(Landroid/view/View;Ljava/lang/String;Lrk/diary/DiaryUi$Header;)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 43
    :cond_76
    const-string p0, "rk_diary_add_homework"

    invoke-virtual {v3, p0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    .line 44
    if-eqz p0, :cond_96

    invoke-static {v1}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance p1, Lrk/diary/DiaryUi$$ExternalSyntheticLambda8;

    invoke-direct {p1, v3, v4, v2}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda8;-><init>(Landroid/view/View;Ljava/lang/String;Lrk/diary/DiaryUi$Header;)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {v1}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result p1

    invoke-static {p0, p1}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    .line 45
    :cond_96
    iget-object p0, v2, Lrk/diary/DiaryUi$Header;->key:Ljava/lang/String;

    invoke-static {v3, v1, p0}, Lrk/diary/DiaryUi;->renderHomework(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-static {v2, p0, p1}, Lrk/diary/DiaryUi;->update(Lrk/diary/DiaryUi$Header;J)V
    :try_end_a2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_a2} :catch_a3

    .line 46
    goto :goto_aa

    :catch_a3
    move-exception v0

    move-object p0, v0

    const-string p1, "Binding diary card"

    invoke-static {p1, p0}, Lrk/diary/DiaryUi;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 47
    :goto_aa
    return-void
.end method

.method private static button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 6

    .line 85
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-static {p0}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {p0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v0, v2, p1, v1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    const/high16 v1, 0x42300000    # 44.0f

    invoke-static {p0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinHeight(I)V

    const/16 v1, 0xe

    invoke-static {p0, p1, v1}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Lrk/diary/DiaryUi$$ExternalSyntheticLambda6;

    invoke-direct {p1, p2}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {p0}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result p0

    invoke-static {v0, p0}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    return-object v0
.end method

.method public static clearBindings()V
    .registers 6

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/diary/DiaryUi$Header;

    iget-object v3, v2, Lrk/diary/DiaryUi$Header;->stamp:Lrk/schedule/DiaryContext$Stamp;

    invoke-static {v3}, Lrk/schedule/ScheduleBridge;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v3

    if-eqz v3, :cond_2a

    goto :goto_f

    :cond_2a
    iget-object v3, v2, Lrk/diary/DiaryUi$Header;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    iget-object v2, v2, Lrk/diary/DiaryUi$Header;->progress:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/diary/DiaryUi$Progress;

    if-eqz v2, :cond_41

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v4, v5}, Lrk/diary/DiaryUi$Progress;->set(ZFI)V

    :cond_41
    if-eqz v3, :cond_60

    const-string v2, "rk_personal_homework"

    invoke-virtual {v3, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_60

    move-object v3, v2

    check-cast v3, Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_60
    sget-object v2, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    :cond_6a
    return-void
.end method

.method private static corners(Landroid/content/Context;)I
    .registers 3

    .line 30
    const-string v0, "theme_customizer_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "corner_style"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_13

    const/16 p0, 0x8

    goto :goto_1b

    :cond_13
    const/4 v0, 0x2

    if-ne p0, v0, :cond_19

    const/16 p0, 0x16

    goto :goto_1b

    :cond_19
    const/16 p0, 0xe

    :goto_1b
    return p0
.end method

.method private static dp(Landroid/content/Context;F)I
    .registers 2

    .line 25
    invoke-static {p0, p1}, Lrk/schedule/ScheduleUi;->dp(Landroid/content/Context;F)I

    move-result p0

    return p0
.end method

.method public static editHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V
    .registers 24

    .line 91
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v0, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    move-object/from16 v5, p0

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lrk/diary/DiaryUi$Header;

    invoke-static/range {p2 .. p2}, Lrk/diary/PersonalHomeworkStore$Id;->parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object v4

    .line 92
    const/4 v1, 0x1

    if-eqz v6, :cond_1cc

    if-eqz v4, :cond_1cc

    iget-object v0, v4, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    invoke-static {v0}, Lrk/schedule/ScheduleBridge;->currentOwner(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_23

    move-object v7, v3

    goto/16 :goto_1cd

    .line 93
    :cond_23
    new-instance v2, Lrk/diary/PersonalHomeworkStore;

    invoke-direct {v2, v3}, Lrk/diary/PersonalHomeworkStore;-><init>(Landroid/content/Context;)V

    .line 94
    invoke-static {}, Lrk/schedule/ScheduleBridge;->ownerStamp()Lrk/schedule/DiaryContext$Stamp;

    move-result-object v0

    invoke-static {}, Lrk/schedule/ScheduleBridge;->ownerLabel()Ljava/lang/String;

    move-result-object v10

    .line 95
    new-instance v9, Landroid/app/Dialog;

    invoke-direct {v9, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    const/4 v11, 0x0

    invoke-virtual {v9, v11}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 96
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v12, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v7, 0x41a00000    # 20.0f

    invoke-static {v3, v7}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v8

    const/high16 v13, 0x41800000    # 16.0f

    invoke-static {v3, v13}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v13

    invoke-static {v3, v7}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v7

    const/high16 v14, 0x41600000    # 14.0f

    invoke-static {v3, v14}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v14

    invoke-virtual {v12, v8, v13, v7, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 97
    const-string v7, "\u041c\u043e\u0451 \u0434\u043e\u043c\u0430\u0448\u043d\u0435\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u0435"

    const/16 v8, 0x14

    invoke-static {v3, v7, v8}, Lrk/diary/DiaryUi;->label(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-virtual {v12, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v13, 0xe

    move-object/from16 v7, p1

    invoke-static {v3, v7, v13}, Lrk/diary/DiaryUi;->label(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v7

    invoke-static {v3}, Lrk/diary/DiaryUi;->muted(Landroid/content/Context;)I

    move-result v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v12, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 98
    const/4 v7, 0x1

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-static {v3}, Lrk/diary/DiaryUi;->text(Landroid/content/Context;)I

    move-result v8

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-static {v3}, Lrk/diary/DiaryUi;->muted(Landroid/content/Context;)I

    move-result v8

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setHintTextColor(I)V

    const/high16 v8, 0x41700000    # 15.0f

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setTextSize(F)V

    const/4 v8, 0x3

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setMinLines(I)V

    const/16 v8, 0x8

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setMaxLines(I)V

    const/16 v8, 0x30

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setGravity(I)V

    const v8, 0x24001

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setInputType(I)V

    const-string v8, "\u0417\u0430\u043f\u0438\u0448\u0438, \u0447\u0442\u043e \u043d\u0443\u0436\u043d\u043e \u0441\u0434\u0435\u043b\u0430\u0442\u044c\u2026"

    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const/high16 v8, 0x41400000    # 12.0f

    invoke-static {v3, v8}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v14

    invoke-static {v3, v8}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v15

    invoke-static {v3, v8}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-static {v3, v8}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v13

    invoke-virtual {v1, v14, v15, v7, v13}, Landroid/widget/EditText;->setPadding(IIII)V

    invoke-static {v3}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v7

    const v13, 0xffffff

    and-int/2addr v7, v13

    const/high16 v13, 0x10000000

    or-int/2addr v7, v13

    const/16 v13, 0xc

    invoke-static {v3, v7, v13}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :try_start_d9
    invoke-virtual {v2, v4}, Lrk/diary/PersonalHomeworkStore;->get(Lrk/diary/PersonalHomeworkStore$Id;)Ljava/lang/String;

    move-result-object v7
    :try_end_dd
    .catch Ljava/lang/Exception; {:try_start_d9 .. :try_end_dd} :catch_1bd

    invoke-virtual {v1, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x1

    const/4 v14, -0x2

    invoke-direct {v7, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    new-instance v15, Landroid/widget/LinearLayout;

    invoke-direct {v15, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v15, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {v3, v8}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v7

    invoke-virtual {v15, v11, v7, v11, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v7, Lrk/diary/DiaryUi$$ExternalSyntheticLambda2;

    invoke-direct {v7, v1}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda2;-><init>(Landroid/widget/EditText;)V

    const-string v8, "\u041e\u0447\u0438\u0441\u0442\u0438\u0442\u044c"

    invoke-static {v3, v8, v7}, Lrk/diary/DiaryUi;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v7

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v8, v11, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v15, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Lrk/diary/DiaryUi$$ExternalSyntheticLambda1;

    invoke-direct {v7, v9}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda1;-><init>(Landroid/app/Dialog;)V

    const-string v8, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-static {v3, v8, v7}, Lrk/diary/DiaryUi;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v7

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v11, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v15, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object v7, v3

    move-object v3, v2

    move-object v2, v0

    new-instance v0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;

    move-object/from16 v8, p2

    invoke-direct/range {v0 .. v9}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;-><init>(Landroid/widget/EditText;Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Landroid/view/View;Lrk/diary/DiaryUi$Header;Landroid/content/Context;Ljava/lang/String;Landroid/app/Dialog;)V

    const-string v5, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    invoke-static {v7, v5, v0}, Lrk/diary/DiaryUi;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    .line 104
    invoke-static {v7}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v5

    const/16 v8, 0xe

    invoke-static {v7, v5, v8}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-static {v7}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    move-result v5

    move-object/from16 v16, v12

    int-to-double v11, v5

    const-wide v17, 0x3fd322d0e5604189L    # 0.299

    mul-double v11, v11, v17

    invoke-static {v7}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    move-result v5

    move-object/from16 v17, v9

    int-to-double v8, v5

    const-wide v19, 0x3fe2c8b439581062L    # 0.587

    mul-double v8, v8, v19

    add-double/2addr v11, v8

    invoke-static {v7}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    int-to-double v8, v5

    const-wide v19, 0x3fbd2f1a9fbe76c9L    # 0.114

    mul-double v8, v8, v19

    add-double/2addr v11, v8

    const-wide v8, 0x4065400000000000L    # 170.0

    cmpl-double v5, v11, v8

    if-lez v5, :cond_184

    const v5, -0xeaeae6

    goto :goto_185

    :cond_184
    const/4 v5, -0x1

    :goto_185
    invoke-virtual {v0, v5}, Landroid/widget/Button;->setTextColor(I)V

    invoke-static {v7}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v5

    invoke-static {v0, v5}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    invoke-direct {v5, v8, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v15, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;

    move-object/from16 v8, p0

    move-object/from16 v9, p2

    move-object v5, v4

    move-object v4, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v7

    move-object v7, v6

    move-object v6, v10

    move-object/from16 v10, v17

    invoke-direct/range {v0 .. v9}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;-><init>(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Landroid/content/Context;Landroid/widget/EditText;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Landroid/view/View;Ljava/lang/String;)V

    move-object v7, v3

    const-string v1, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438 \u0441\u0442\u0430\u0440\u0443\u044e \u0437\u0430\u043f\u0438\u0441\u044c"

    invoke-static {v7, v1, v0}, Lrk/diary/DiaryUi;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    move-object/from16 v1, v16

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 120
    invoke-virtual {v1, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {v10, v7, v1}, Lrk/diary/DiaryUi;->show(Landroid/app/Dialog;Landroid/content/Context;Landroid/widget/LinearLayout;)Landroid/view/View;

    .line 121
    return-void

    .line 98
    :catch_1bd
    move-exception v0

    move-object v7, v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v7, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    .line 92
    :cond_1cc
    move-object v7, v3

    :goto_1cd
    const-string v0, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0443\u0440\u043e\u043a \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0433\u043e \u0443\u0447\u0435\u043d\u0438\u043a\u0430"

    invoke-static {v7, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_16

    const/4 p0, 0x0

    goto :goto_1a

    :cond_16
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    :goto_1a
    return-object p0
.end method

.method private static label(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 6

    .line 84
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {p0}, Lrk/diary/DiaryUi;->text(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 p1, 0x40800000    # 4.0f

    invoke-static {p0, p1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result p2

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {p0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p0, p1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result p1

    invoke-static {p0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v0, p2, v2, p1, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method static synthetic lambda$bindHomework$0(Landroid/view/View;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Landroid/view/View;)Z
    .registers 4

    .line 42
    iget-object p2, p2, Lrk/diary/DiaryUi$Header;->key:Ljava/lang/String;

    invoke-static {p0, p1, p2}, Lrk/diary/DiaryUi;->editHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$bindHomework$1(Landroid/view/View;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Landroid/view/View;)V
    .registers 4

    .line 44
    iget-object p2, p2, Lrk/diary/DiaryUi$Header;->key:Ljava/lang/String;

    invoke-static {p0, p1, p2}, Lrk/diary/DiaryUi;->editHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$button$3(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 85
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$editHomework$4(Landroid/widget/EditText;)V
    .registers 2

    .line 99
    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$editHomework$5(Landroid/widget/EditText;Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Landroid/view/View;Lrk/diary/DiaryUi$Header;Landroid/content/Context;Ljava/lang/String;Landroid/app/Dialog;)V
    .registers 11

    .line 100
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 101
    invoke-static {p1}, Lrk/schedule/ScheduleBridge;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v1

    if-nez v1, :cond_18

    const-string p1, "\u0423\u0447\u0435\u043d\u0438\u043a \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0443\u0440\u043e\u043a \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    .line 102
    :cond_18
    :try_start_18
    invoke-static {p1, p2, p3, v0}, Lrk/schedule/ScheduleBridge;->saveHomework(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_3c

    .line 103
    sget-object p0, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    invoke-interface {p0, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p5, :cond_38

    invoke-static {p4, p6, p7}, Lrk/diary/DiaryUi;->renderHomework(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V

    const-string p0, "rk_personal_homework"

    invoke-virtual {p4, p0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_38

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_38

    const/4 p1, 0x0

    invoke-static {p0, p1, p1}, Lrk/schedule/ScheduleUi;->enter(Landroid/view/View;IZ)V

    :cond_38
    invoke-virtual {p8}, Landroid/app/Dialog;->dismiss()V

    .line 104
    return-void

    .line 102
    :catch_3c
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$editHomework$6(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Landroid/widget/EditText;ZLandroid/view/View;Lrk/diary/DiaryUi$Header;Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 19

    .line 116
    :try_start_0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v6, p5

    invoke-static/range {v1 .. v6}, Lrk/schedule/ScheduleBridge;->transferHomework(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    sget-object p0, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    invoke-interface {p0, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p7, :cond_3d

    move-object/from16 p1, p9

    invoke-static {p6, p8, p1}, Lrk/diary/DiaryUi;->renderHomework(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_3d

    :cond_2c
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u0423\u0447\u0435\u043d\u0438\u043a \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0443\u0440\u043e\u043a \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_34} :catch_34

    :catch_34
    move-exception v0

    move-object p0, v0

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 117
    :cond_3d
    :goto_3d
    return-void
.end method

.method static synthetic lambda$editHomework$7(Ljava/util/List;Lrk/diary/PersonalHomeworkStore;Landroid/content/Context;Ljava/util/Map;Landroid/widget/EditText;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Lrk/schedule/DiaryContext$Stamp;Landroid/view/View;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 25

    .line 111
    move-object/from16 v3, p5

    move/from16 v1, p12

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Ljava/lang/String;

    .line 112
    invoke-virtual {p1, v4}, Lrk/diary/PersonalHomeworkStore;->imported(Ljava/lang/String;)Z

    move-result p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const-string v5, " \u00b7 "

    if-eqz p0, :cond_69

    invoke-virtual {p1, v4}, Lrk/diary/PersonalHomeworkStore;->destination(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object p0

    invoke-interface {p3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const/16 v0, 0xf

    invoke-static {p2, p1, v0}, Lrk/diary/DiaryUi;->label(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p2, "\u0418\u0441\u0445\u043e\u0434\u043d\u0430\u044f \u0437\u0430\u043f\u0438\u0441\u044c \u0430\u0440\u0445\u0438\u0432\u0430"

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    if-nez p0, :cond_38

    const-string p0, "\u0417\u0430\u043f\u0438\u0441\u044c \u043f\u0435\u0440\u0435\u043d\u0435\u0441\u0435\u043d\u0430"

    goto :goto_57

    :cond_38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0435\u043d\u043e: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p0, p0, Lrk/diary/PersonalHomeworkStore$Id;->subject:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_57
    invoke-virtual {p2, p0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-virtual {p0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    .line 113
    :cond_69
    invoke-virtual/range {p4 .. p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_89

    invoke-virtual {p1, v3}, Lrk/diary/PersonalHomeworkStore;->get(Lrk/diary/PersonalHomeworkStore$Id;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_86

    goto :goto_89

    :cond_86
    const/4 v2, 0x0

    const/4 v6, 0x0

    goto :goto_8a

    :cond_89
    :goto_89
    const/4 v6, 0x1

    .line 114
    :goto_8a
    new-instance p0, Landroid/app/AlertDialog$Builder;

    invoke-direct {p0, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438 \u0441\u0442\u0430\u0440\u0443\u044e \u0437\u0430\u043f\u0438\u0441\u044c?"

    invoke-virtual {p0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u0422\u0435\u043a\u0443\u0449\u0438\u0439 \u0443\u0447\u0435\u043d\u0438\u043a \u0438 \u0443\u0440\u043e\u043a:\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v7, p6

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, "\n"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v7, v3, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v8, p7

    iget-object v7, v8, Lrk/diary/DiaryUi$Header;->number:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, v3, Lrk/diary/PersonalHomeworkStore$Id;->subject:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "\n\n"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz v6, :cond_dd

    const-string v2, "\n\n\u0422\u0435\u043a\u0441\u0442 \u0431\u0443\u0434\u0435\u0442 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d \u043a \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u044e\u0449\u0435\u043c\u0443 \u0414\u0417."

    goto :goto_df

    :cond_dd
    const-string v2, ""

    :goto_df
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 115
    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    if-eqz v6, :cond_f6

    const-string v0, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0442\u0435\u043a\u0441\u0442"

    goto :goto_f8

    :cond_f6
    const-string v0, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438"

    :goto_f8
    move-object v11, v0

    new-instance v0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;

    move-object v2, p1

    move-object v9, p2

    move-object/from16 v5, p4

    move-object/from16 v1, p8

    move-object/from16 v7, p9

    move-object/from16 v10, p10

    invoke-direct/range {v0 .. v10}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;-><init>(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Landroid/widget/EditText;ZLandroid/view/View;Lrk/diary/DiaryUi$Header;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p0, v11, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 117
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 118
    return-void
.end method

.method static synthetic lambda$editHomework$8(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Landroid/content/Context;Landroid/widget/EditText;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Landroid/view/View;Ljava/lang/String;)V
    .registers 23

    .line 106
    move-object/from16 v3, p2

    :try_start_2
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v0

    if-eqz v0, :cond_bb

    .line 107
    invoke-virtual {p1}, Lrk/diary/PersonalHomeworkStore;->archive()Ljava/util/Map;

    move-result-object v4

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 108
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_73

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lrk/diary/DiaryUi;->archiveLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {p1, v7}, Lrk/diary/PersonalHomeworkStore;->imported(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_55

    const-string v7, " \u00b7 \u043f\u0435\u0440\u0435\u043d\u0435\u0441\u0435\u043d\u043e"

    goto :goto_57

    :cond_55
    const-string v7, ""

    :goto_57
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 109
    :cond_73
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_84

    const-string p0, "\u0410\u0440\u0445\u0438\u0432 \u043f\u0443\u0441\u0442"

    const/4 p1, 0x1

    invoke-static {v3, p0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    .line 110
    :cond_84
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "\u0410\u0440\u0445\u0438\u0432 \u043b\u0438\u0447\u043d\u043e\u0433\u043e \u0414\u0417"

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v12

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, [Ljava/lang/CharSequence;

    new-instance v0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;

    move-object v9, p0

    move-object v2, p1

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v10, p7

    move-object/from16 v11, p8

    invoke-direct/range {v0 .. v11}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;-><init>(Ljava/util/List;Lrk/diary/PersonalHomeworkStore;Landroid/content/Context;Ljava/util/Map;Landroid/widget/EditText;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Lrk/schedule/DiaryContext$Stamp;Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v12, v13, v0}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    .line 118
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 119
    goto :goto_ce

    .line 106
    :cond_bb
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u0423\u0447\u0435\u043d\u0438\u043a \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0443\u0440\u043e\u043a \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_c3} :catch_c3

    .line 119
    :catch_c3
    move-exception v0

    move-object p0, v0

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    move-object/from16 v5, p3

    invoke-virtual {v5, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 120
    :goto_ce
    return-void
.end method

.method static synthetic lambda$renderHomework$2(Landroid/view/View;Ljava/lang/String;Landroid/view/View;)V
    .registers 3

    .line 56
    sget-object p2, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lrk/diary/DiaryUi$Header;

    if-eqz p2, :cond_f

    iget-object p2, p2, Lrk/diary/DiaryUi$Header;->subject:Ljava/lang/String;

    invoke-static {p0, p2, p1}, Lrk/diary/DiaryUi;->editHomework(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;)V

    :cond_f
    return-void
.end method

.method private static log(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3

    .line 32
    const-string v0, "RKDiary"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private static muted(Landroid/content/Context;)I
    .registers 2

    .line 29
    invoke-static {p0}, Lrk/diary/DiaryUi;->text(Landroid/content/Context;)I

    move-result p0

    const v0, -0xe8dfd4

    if-ne p0, v0, :cond_d

    const p0, -0x9b8f7c

    goto :goto_10

    :cond_d
    const p0, -0x5f584c

    :goto_10
    return p0
.end method

.method public static renderHomework(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V
    .registers 11

    .line 49
    const-string v0, "rk_personal_homework"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    if-nez v0, :cond_b

    return-void

    .line 50
    :cond_b
    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const-string v2, ""

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-static {p2}, Lrk/diary/PersonalHomeworkStore$Id;->parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object v4

    if-eqz v4, :cond_36

    iget-object v5, v4, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    invoke-static {v5}, Lrk/schedule/ScheduleBridge;->currentOwner(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_36

    new-instance v5, Lrk/diary/PersonalHomeworkStore;

    invoke-direct {v5, p1}, Lrk/diary/PersonalHomeworkStore;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v4}, Lrk/diary/PersonalHomeworkStore;->get(Lrk/diary/PersonalHomeworkStore$Id;)Ljava/lang/String;

    move-result-object v4

    goto :goto_37

    :cond_36
    move-object v4, v2

    .line 51
    :goto_37
    const-string v5, "rk_diary_add_homework"

    invoke-virtual {p0, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    if-eqz v5, :cond_59

    const-string v6, "\u270e"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41b00000    # 22.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_54

    const-string v6, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0441\u0432\u043e\u0451 \u0434\u043e\u043c\u0430\u0448\u043d\u0435\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u0435"

    goto :goto_56

    :cond_54
    const-string v6, "\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u0441\u0432\u043e\u0451 \u0434\u043e\u043c\u0430\u0448\u043d\u0435\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u0435"

    :goto_56
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 52
    :cond_59
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_6a

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_f3

    .line 54
    :cond_6a
    new-instance v2, Landroid/text/SpannableStringBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u041c\u043e\u0451 \u0414\u0417"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "\n"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    invoke-static {p1}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v4

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v6, 0x0

    const/16 v7, 0x21

    invoke-virtual {v2, v3, v6, v4, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    new-instance v3, Landroid/text/style/RelativeSizeSpan;

    const v4, 0x3f59999a    # 0.85f

    invoke-direct {v3, v4}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v6, v4, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    new-instance v3, Landroid/text/style/StyleSpan;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v6, v4, v7}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 55
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p1}, Lrk/diary/DiaryUi;->text(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {p1, v2}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result p1

    int-to-float p1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, p1, v2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    invoke-virtual {v0, v6, v6, v6, v6}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    const/4 p1, 0x4

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 56
    invoke-static {v1}, Lrk/diary/DiaryUi;->stylePersonalPanel(Landroid/view/View;)V

    const-string p1, "sans-serif"

    invoke-static {p1, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance p1, Lrk/diary/DiaryUi$$ExternalSyntheticLambda5;

    invoke-direct {p1, p0, p2}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda5;-><init>(Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    :goto_f3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 59
    return-void
.end method

.method private static show(Landroid/app/Dialog;Landroid/content/Context;Landroid/widget/LinearLayout;)Landroid/view/View;
    .registers 13

    .line 87
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    invoke-virtual {v0, p2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p2, 0x1

    invoke-virtual {v4, p2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v9, -0x2

    invoke-direct {v2, v3, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    invoke-static {p1}, Lrk/schedule/ScheduleUi;->activitySource(Landroid/content/Context;)Landroid/view/ViewGroup;

    move-result-object v5

    invoke-static {p1}, Lrk/diary/DiaryUi;->surface(Landroid/content/Context;)I

    move-result v6

    invoke-static {p1}, Lrk/diary/DiaryUi;->text(Landroid/content/Context;)I

    move-result v7

    const/4 v8, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-static/range {v2 .. v8}, Lrk/schedule/ScheduleUi;->glass(Landroid/app/Dialog;Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;IIZ)Landroid/view/View;

    move-result-object p0

    invoke-virtual {v2, p0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    if-eqz p1, :cond_6d

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v4, 0x42000000    # 32.0f

    invoke-static {v3, v4}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v4

    sub-int/2addr v0, v4

    const/high16 v4, 0x43d70000    # 430.0f

    invoke-static {v3, v4}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {p1, v0, v9}, Landroid/view/Window;->setLayout(II)V

    const v0, 0x106000d

    invoke-virtual {p1, v0}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    const/16 v0, 0x13

    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    const v0, 0x3ecccccd    # 0.4f

    invoke-virtual {p1, v0}, Landroid/view/Window;->setDimAmount(F)V

    :cond_6d
    invoke-static {v2}, Lrk/schedule/ScheduleUi;->window(Landroid/app/Dialog;)V

    invoke-static {p0, v1, p2}, Lrk/schedule/ScheduleUi;->enter(Landroid/view/View;IZ)V

    return-object p0
.end method

.method public static showMarkDetails(Landroid/view/View;Ljava/lang/CharSequence;I)V
    .registers 14

    .line 136
    if-eqz p0, :cond_ec

    if-nez p1, :cond_6

    goto/16 :goto_ec

    :cond_6
    sget-object p2, Lrk/diary/DiaryUi;->markDialog:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/app/Dialog;

    if-eqz p2, :cond_19

    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {p2}, Landroid/app/Dialog;->dismiss()V

    :cond_19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance p2, Landroid/app/Dialog;

    invoke-direct {p2, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lrk/diary/DiaryUi;->markDialog:Ljava/lang/ref/WeakReference;

    .line 137
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-static {p0, v2}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v3

    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {p0, v4}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v5

    invoke-static {p0, v2}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-static {p0, v4}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-virtual {v1, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    const-string v3, "\u041e\u0431 \u043e\u0446\u0435\u043d\u043a\u0435"

    const/16 v4, 0x14

    invoke-static {p0, v3, v4}, Lrk/diary/DiaryUi;->label(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x0

    const/4 v6, -0x2

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v4, v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lrk/diary/DiaryUi$$ExternalSyntheticLambda1;

    invoke-direct {v3, p2}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda1;-><init>(Landroid/app/Dialog;)V

    const-string v4, "\u00d7"

    invoke-static {p0, v4, v3}, Lrk/diary/DiaryUi;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x42300000    # 44.0f

    invoke-static {p0, v8}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {p0, v8}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v10

    invoke-direct {v4, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 138
    const-string v2, ""

    const/16 v3, 0xf

    invoke-static {p0, v2, v3}, Lrk/diary/DiaryUi;->label(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-static {p0, v3}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3, v7}, Landroid/widget/TextView;->setLineSpacing(FF)V

    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-direct {v3, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    const-class v4, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {v3, v5, p1, v4}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/text/style/ForegroundColorSpan;

    array-length v4, p1

    :goto_b5
    if-ge v5, v4, :cond_bf

    aget-object v7, p1, v5

    invoke-virtual {v3, v7}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_b5

    :cond_bf
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lrk/diary/DiaryUi$$ExternalSyntheticLambda1;

    invoke-direct {p1, p2}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda1;-><init>(Landroid/app/Dialog;)V

    const-string v2, "\u041f\u043e\u043d\u044f\u0442\u043d\u043e"

    invoke-static {p0, v2, p1}, Lrk/diary/DiaryUi;->button(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {p0, v8}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-direct {v2, v0, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p2, p0, v1}, Lrk/diary/DiaryUi;->show(Landroid/app/Dialog;Landroid/content/Context;Landroid/widget/LinearLayout;)Landroid/view/View;

    .line 139
    return-void

    .line 136
    :cond_ec
    :goto_ec
    return-void
.end method

.method public static styleMark(Landroid/widget/TextView;I)V
    .registers 14

    .line 133
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "theme_customizer_prefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v3, "grade_color"

    const/4 v4, 0x1

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_19

    const/4 v3, 0x1

    goto :goto_1a

    :cond_19
    const/4 v3, 0x0

    :goto_1a
    if-eqz v3, :cond_20

    const/high16 v5, -0x1000000

    or-int/2addr p1, v5

    goto :goto_24

    :cond_20
    invoke-static {v0}, Lrk/diary/DiaryUi;->muted(Landroid/content/Context;)I

    move-result p1

    :goto_24
    const v5, 0xffffff

    and-int v6, p1, v5

    if-nez v6, :cond_2f

    invoke-static {v0}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result p1

    :cond_2f
    if-eqz v3, :cond_88

    invoke-static {v0}, Lrk/diary/DiaryUi;->text(Landroid/content/Context;)I

    move-result v3

    const v6, -0xe8dfd4

    if-ne v3, v6, :cond_88

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    int-to-double v6, v3

    const-wide v8, 0x3fd322d0e5604189L    # 0.299

    mul-double v6, v6, v8

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-double v8, v3

    const-wide v10, 0x3fe2c8b439581062L    # 0.587

    mul-double v8, v8, v10

    add-double/2addr v6, v8

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    int-to-double v8, v3

    const-wide v10, 0x3fbd2f1a9fbe76c9L    # 0.114

    mul-double v8, v8, v10

    add-double/2addr v6, v8

    const-wide v8, 0x405b800000000000L    # 110.0

    cmpl-double v3, v6, v8

    if-lez v3, :cond_88

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    int-to-float v3, v3

    const v6, 0x3f266666    # 0.65f

    mul-float v3, v3, v6

    float-to-int v3, v3

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v7

    int-to-float v7, v7

    mul-float v7, v7, v6

    float-to-int v7, v7

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, v6

    float-to-int p1, p1

    invoke-static {v3, v7, p1}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    :cond_88
    const-string v3, "grade_style"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    and-int v3, p1, v5

    const/high16 v5, 0x1a000000

    or-int/2addr v3, v5

    if-ne v1, v4, :cond_98

    const/16 v1, 0x32

    goto :goto_9f

    :cond_98
    const/4 v4, 0x2

    if-ne v1, v4, :cond_9e

    const/16 v1, 0xc

    goto :goto_9f

    :cond_9e
    const/4 v1, 0x4

    :goto_9f
    invoke-static {v0, v3, v1}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const-string v1, "sans-serif-medium"

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/16 v1, 0x11

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v1, 0x42100000    # 36.0f

    invoke-static {v0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setMinWidth(I)V

    invoke-static {v0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setMinHeight(I)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v2

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v0, v3}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-static {v0, v1}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-static {v0, v3}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v2, v4, v1, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setElevation(F)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setAlpha(F)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setScaleX(F)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setScaleY(F)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041e\u0446\u0435\u043d\u043a\u0430 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {p0, p1}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    .line 134
    return-void
.end method

.method private static stylePersonalPanel(Landroid/view/View;)V
    .registers 7

    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lrk/diary/DiaryUi;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-static {v0}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v2

    .line 62
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    mul-int/lit8 v3, v3, 0x58

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0xc

    add-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x64

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x58

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0xc

    add-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x64

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x58

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0xc

    add-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x64

    invoke-static {v3, v4, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    .line 63
    invoke-static {v0}, Lrk/diary/DiaryUi;->corners(Landroid/content/Context;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setElevation(F)V

    .line 64
    return-void
.end method

.method public static styleTree(Landroid/view/View;)V
    .registers 6

    .line 124
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .line 125
    const-string v2, "rk_personal_homework_blur"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-static {p0}, Lrk/diary/DiaryUi;->stylePersonalPanel(Landroid/view/View;)V

    .line 126
    :cond_16
    const-string v2, "rk_diary_add_homework"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    instance-of v2, p0, Landroid/widget/TextView;

    if-eqz v2, :cond_2c

    move-object v2, p0

    check-cast v2, Landroid/widget/TextView;

    invoke-static {v0}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 127
    :cond_2c
    const-string v2, "rk_homework_card"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_76

    invoke-static {v0}, Lrk/diary/DiaryUi;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-static {v0}, Lrk/diary/DiaryUi;->corners(Landroid/content/Context;)I

    move-result v3

    invoke-static {v0, v2, v3}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const-string v2, "textHomework"

    invoke-static {p0, v2}, Lrk/diary/DiaryUi;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v2, :cond_65

    invoke-static {v0}, Lrk/diary/DiaryUi;->text(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v0, v3}, Lrk/diary/DiaryUi;->dp(Landroid/content/Context;F)I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3, v4}, Landroid/widget/TextView;->setLineSpacing(FF)V

    :cond_65
    const-string v2, "imageHomework"

    invoke-static {p0, v2}, Lrk/diary/DiaryUi;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_76

    invoke-static {v0}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 128
    :cond_76
    const-string v2, "rk_diary_school_label"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8c

    instance-of v1, p0, Landroid/widget/TextView;

    if-eqz v1, :cond_8c

    move-object v1, p0

    check-cast v1, Landroid/widget/TextView;

    invoke-static {v0}, Lrk/diary/DiaryUi;->muted(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    :cond_8c
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "textTopic"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_d9

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v2

    if-ne v2, v1, :cond_d9

    instance-of v1, p0, Landroid/widget/TextView;

    if-eqz v1, :cond_d9

    move-object v1, p0

    check-cast v1, Landroid/widget/TextView;

    invoke-static {v0}, Lrk/diary/DiaryUi;->muted(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v0, 0x41480000    # 12.5f

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lez v2, :cond_d9

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u0422\u0435\u043c\u0430: "

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_d9

    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    :cond_d9
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_f1

    const/4 v0, 0x0

    :goto_de
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_f1

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lrk/diary/DiaryUi;->styleTree(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_de

    .line 131
    :cond_f1
    return-void
.end method

.method private static surface(Landroid/content/Context;)I
    .registers 3

    .line 28
    const-string v0, "getThemeSurfaceColor"

    const v1, -0xe8e8de

    invoke-static {p0, v0, v1}, Lrk/schedule/ScheduleBridge;->themeColor(Landroid/content/Context;Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method private static text(Landroid/content/Context;)I
    .registers 1

    .line 27
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->textColor(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public static tick()V
    .registers 7

    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/ArrayList;

    sget-object v3, Lrk/diary/DiaryUi;->headers:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_39

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrk/diary/DiaryUi$Header;

    :try_start_1f
    invoke-static {v3, v0, v1}, Lrk/diary/DiaryUi;->update(Lrk/diary/DiaryUi$Header;J)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_22} :catch_23

    goto :goto_13

    :catch_23
    move-exception v4

    iget-object v3, v3, Lrk/diary/DiaryUi$Header;->progress:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrk/diary/DiaryUi$Progress;

    if-eqz v3, :cond_33

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v3, v6, v5, v6}, Lrk/diary/DiaryUi$Progress;->set(ZFI)V

    :cond_33
    const-string v3, "Updating active lesson"

    invoke-static {v3, v4}, Lrk/diary/DiaryUi;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_13

    :cond_39
    return-void
.end method

.method private static update(Lrk/diary/DiaryUi$Header;J)V
    .registers 14

    .line 67
    iget-object v0, p0, Lrk/diary/DiaryUi$Header;->progress:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrk/diary/DiaryUi$Progress;

    iget-object v1, p0, Lrk/diary/DiaryUi$Header;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v0, :cond_8f

    if-nez v1, :cond_16

    goto/16 :goto_8f

    .line 68
    :cond_16
    nop

    .line 69
    iget-object v2, p0, Lrk/diary/DiaryUi$Header;->owner:Ljava/lang/String;

    invoke-static {v2}, Lrk/schedule/ScheduleBridge;->currentOwner(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v2, :cond_83

    iget-wide v5, p0, Lrk/diary/DiaryUi$Header;->day:J

    invoke-static {v5, v6}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_83

    .line 70
    iget-wide v5, p0, Lrk/diary/DiaryUi$Header;->day:J

    invoke-static {v5, v6}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v2

    .line 71
    if-eqz v2, :cond_83

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v5

    iget-wide v6, p0, Lrk/diary/DiaryUi$Header;->day:J

    const/4 v8, 0x1

    invoke-static {v5, v6, v7, v2, v8}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_83

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrk/schedule/ScheduleResolver$Event;

    iget-object v6, v5, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    iget-object v7, p0, Lrk/diary/DiaryUi$Header;->number:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4c

    .line 72
    iget-wide v6, p0, Lrk/diary/DiaryUi$Header;->day:J

    iget v2, v5, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {v6, v7, v2}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v6

    iget-wide v9, p0, Lrk/diary/DiaryUi$Header;->day:J

    iget p0, v5, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-static {v9, v10, p0}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v9

    .line 73
    cmp-long p0, p1, v6

    if-ltz p0, :cond_7b

    cmp-long p0, p1, v9

    if-gez p0, :cond_7b

    const/4 v3, 0x1

    :cond_7b
    if-eqz v3, :cond_83

    sub-long/2addr p1, v6

    long-to-float p0, p1

    sub-long/2addr v9, v6

    long-to-float p1, v9

    div-float v4, p0, p1

    .line 76
    :cond_83
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lrk/diary/DiaryUi;->accent(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v0, v3, v4, p0}, Lrk/diary/DiaryUi$Progress;->set(ZFI)V

    .line 77
    return-void

    .line 67
    :cond_8f
    :goto_8f
    return-void
.end method
