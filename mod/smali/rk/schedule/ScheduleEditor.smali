.class public final Lrk/schedule/ScheduleEditor;
.super Landroid/app/Dialog;
.source "ScheduleEditor.java"


# static fields
.field private static final DAYS:[Ljava/lang/String;


# instance fields
.field private accent:I

.field private apply:Landroid/widget/Button;

.field private bg:I

.field private final c:Landroid/content/Context;

.field private content:Landroid/widget/LinearLayout;

.field private day:J

.field private final details:[Landroid/widget/TextView;

.field private draft:Lrk/schedule/ScheduleStore;

.field private final fields:[[Landroid/widget/EditText;

.field private footer:Landroid/widget/LinearLayout;

.field private header:Landroid/widget/LinearLayout;

.field private final original:Lrk/schedule/ScheduleStore;

.field private preview:Landroid/widget/TextView;

.field private problem:Landroid/widget/TextView;

.field private rendering:Z

.field private screen:Landroid/widget/LinearLayout;

.field private selected:Ljava/lang/String;

.field private sheet:Landroid/view/View;

.field private final shiftOrigin:[I

.field private summary:Landroid/widget/TextView;

.field private surface:I

.field private text:I

.field private final timeLabels:[[Landroid/widget/TextView;


# direct methods
.method public static synthetic $r8$lambda$-GJ42lb8UhKy06X1ER2IHR_CmO4(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->fromDiary()V

    return-void
.end method

.method public static synthetic $r8$lambda$-bJeHV9VyTNLAJHXpNy789Wz1IE(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->assign()V

    return-void
.end method

.method public static synthetic $r8$lambda$0iop6t4oHX4PMYncKceOLDl7L1Q(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->manual()V

    return-void
.end method

.method public static synthetic $r8$lambda$6hccWJ_IET5El471-royNMQgQds(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->chooseProfile()V

    return-void
.end method

.method public static synthetic $r8$lambda$8Ifh6C0Wf_82SI_sC_irt6bIPHA(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->more()V

    return-void
.end method

.method public static synthetic $r8$lambda$9wBlY2polj2VJ0Bl6WqOF8G2pyE(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->generate()V

    return-void
.end method

.method public static synthetic $r8$lambda$EAElj85KeYzjTMIfiZzY7ig-jYs(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profileActions()V

    return-void
.end method

.method public static synthetic $r8$lambda$Vxhs2EHuRzYrveuzg0b4-23JQO0(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->chooseDate()V

    return-void
.end method

.method public static synthetic $r8$lambda$hajCGsIAGD7E-2kyHiJaId6PTmc(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->homeroom()V

    return-void
.end method

.method public static synthetic $r8$lambda$qnoEiauXU2WxWsBxVB6Tp24ehyk(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->save()V

    return-void
.end method

.method public static synthetic $r8$lambda$z1CFypg0NetkuYMFwJxeulvCShQ(Lrk/schedule/ScheduleEditor;)V
    .registers 1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->askClose()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 7

    .line 30
    const-string v5, "\u041f\u044f\u0442\u043d\u0438\u0446\u0430"

    const-string v6, "\u0421\u0443\u0431\u0431\u043e\u0442\u0430"

    const-string v0, "\u0412\u043e\u0441\u043a\u0440\u0435\u0441\u0435\u043d\u044c\u0435"

    const-string v1, "\u041f\u043e\u043d\u0435\u0434\u0435\u043b\u044c\u043d\u0438\u043a"

    const-string v2, "\u0412\u0442\u043e\u0440\u043d\u0438\u043a"

    const-string v3, "\u0421\u0440\u0435\u0434\u0430"

    const-string v4, "\u0427\u0435\u0442\u0432\u0435\u0440\u0433"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lrk/schedule/ScheduleEditor;->DAYS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;J)V
    .registers 10

    .line 32
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 22
    const/4 v0, 0x2

    new-array v1, v0, [I

    const/4 v2, 0x1

    aput v0, v1, v2

    const/4 v3, 0x0

    const/16 v4, 0x8

    aput v4, v1, v3

    const-class v5, Landroid/widget/EditText;

    invoke-static {v5, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[Landroid/widget/EditText;

    iput-object v1, p0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    .line 23
    new-array v1, v4, [Landroid/widget/TextView;

    iput-object v1, p0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    .line 24
    new-array v1, v0, [I

    aput v0, v1, v2

    aput v4, v1, v3

    const-class v0, Landroid/widget/TextView;

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Landroid/widget/TextView;

    iput-object v0, p0, Lrk/schedule/ScheduleEditor;->timeLabels:[[Landroid/widget/TextView;

    .line 25
    new-array v0, v4, [I

    iput-object v0, p0, Lrk/schedule/ScheduleEditor;->shiftOrigin:[I

    .line 32
    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    iput-wide p2, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {p1}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object p1

    invoke-virtual {p1}, Lrk/schedule/ScheduleStore;->copy()Lrk/schedule/ScheduleStore;

    move-result-object p1

    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->original:Lrk/schedule/ScheduleStore;

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->original:Lrk/schedule/ScheduleStore;

    invoke-virtual {p1}, Lrk/schedule/ScheduleStore;->copy()Lrk/schedule/ScheduleStore;

    move-result-object p1

    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    invoke-virtual {p1, p2, p3}, Lrk/schedule/ScheduleStore;->active(J)Lrk/schedule/ScheduleStore$Profile;

    move-result-object p1

    if-nez p1, :cond_6d

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p1, p1, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_5a

    const/4 p1, 0x0

    goto :goto_6f

    :cond_5a
    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p1, p1, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_6f

    :cond_6d
    iget-object p1, p1, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    :goto_6f
    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lrk/schedule/ScheduleEditor;Landroid/app/AlertDialog;)V
    .registers 2

    .line 14
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->decorate(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;
    .registers 4

    .line 48
    const/16 v0, 0xe

    invoke-direct {p0, p1, v0}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    iget v0, p0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v0, 0x42300000    # 44.0f

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    new-instance v0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda14;

    invoke-direct {v0, p2}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda14;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget p2, p0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {p1, p2}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    return-object p1
.end method

.method private actionSheet(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Runnable;)V
    .registers 21

    .line 83
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    new-instance v2, Landroid/app/Dialog;

    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v9, 0x1

    invoke-virtual {v2, v9}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 84
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v4

    const/high16 v3, 0x41600000    # 14.0f

    invoke-direct {v0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v5

    const/high16 v10, 0x41200000    # 10.0f

    invoke-direct {v0, v10}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v6

    invoke-direct {v0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v7

    invoke-direct {v0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    invoke-virtual {v4, v5, v6, v7, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 85
    new-instance v3, Landroid/view/View;

    iget-object v5, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iget v5, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v6, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v7, 0x3e8f5c29    # 0.28f

    invoke-direct {v0, v5, v6, v7}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v5

    invoke-direct {v0, v5}, Lrk/schedule/ScheduleEditor;->panel(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42000000    # 32.0f

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v6

    const/high16 v7, 0x40800000    # 4.0f

    invoke-direct {v0, v7}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v8

    invoke-direct {v5, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v9, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    const/high16 v6, 0x41000000    # 8.0f

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v8

    iput v8, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v4, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v3

    const/16 v5, 0x14

    move-object/from16 v8, p1

    invoke-direct {v0, v8, v5}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    const/4 v8, 0x0

    invoke-virtual {v5, v8, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-direct {v0, v3, v5}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lrk/diary/DiaryUi$$ExternalSyntheticLambda1;

    invoke-direct {v5, v2}, Lrk/diary/DiaryUi$$ExternalSyntheticLambda1;-><init>(Landroid/app/Dialog;)V

    const-string v11, "\u00d7"

    invoke-direct {v0, v11, v5}, Lrk/schedule/ScheduleEditor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v5

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42300000    # 44.0f

    invoke-direct {v0, v12}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    invoke-direct {v0, v12}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v12

    invoke-direct {v11, v13, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 87
    new-instance v3, Landroid/widget/ScrollView;

    iget-object v5, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v12

    invoke-virtual {v3, v12}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v14, -0x1

    invoke-direct {v5, v14, v11, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    const/4 v3, 0x0

    :goto_b7
    array-length v5, v1

    if-ge v3, v5, :cond_1a4

    .line 89
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v5

    invoke-direct {v0, v10}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v15

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v10

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v14

    invoke-virtual {v5, v13, v15, v10, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 v10, 0x42840000    # 66.0f

    invoke-direct {v0, v10}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v10

    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    const/high16 v10, 0x14000000

    invoke-direct {v0, v10}, Lrk/schedule/ScheduleEditor;->panel(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v10

    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 90
    new-instance v10, Lrk/schedule/ScheduleUi$Icon;

    iget-object v13, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    iget v14, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-direct {v10, v13, v3, v14}, Lrk/schedule/ScheduleUi$Icon;-><init>(Landroid/content/Context;II)V

    iget v13, v0, Lrk/schedule/ScheduleEditor;->accent:I

    const v14, 0xffffff

    and-int/2addr v13, v14

    const/high16 v14, 0x18000000

    or-int/2addr v13, v14

    invoke-direct {v0, v13}, Lrk/schedule/ScheduleEditor;->panel(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v13

    invoke-virtual {v10, v13}, Lrk/schedule/ScheduleUi$Icon;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x42180000    # 38.0f

    invoke-direct {v0, v14}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v15

    invoke-direct {v0, v14}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v14

    invoke-direct {v13, v15, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v10, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v10

    const/high16 v13, 0x40a00000    # 5.0f

    invoke-direct {v0, v13}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    invoke-virtual {v10, v13, v11, v11, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    aget-object v13, v1, v3

    const/16 v14, 0xf

    invoke-direct {v0, v13, v14}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v13

    invoke-virtual {v13, v8, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v14

    invoke-direct {v0, v7}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v15

    const/high16 v8, 0x40000000    # 2.0f

    invoke-direct {v0, v8}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v8

    invoke-virtual {v13, v14, v11, v15, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v10, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    if-eqz p3, :cond_160

    aget-object v8, p3, v3

    const/16 v13, 0xc

    invoke-direct {v0, v8, v13}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v8

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    invoke-direct {v0, v7}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v14

    invoke-virtual {v8, v13, v11, v14, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    iget v13, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v14, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v15, 0x3f266666    # 0.65f

    invoke-direct {v0, v13, v14, v15}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v13

    invoke-virtual {v8, v13}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v10, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_160
    invoke-direct {v0, v5, v10}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    .line 92
    const-string v8, "\u203a"

    const/16 v10, 0x17

    invoke-direct {v0, v8, v10}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v8

    iget v10, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v13, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v14, 0x3ee66666    # 0.45f

    invoke-direct {v0, v10, v13, v14}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v10

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 93
    new-instance v8, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda29;

    move-object/from16 v10, p4

    invoke-direct {v8, v2, v10, v3}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda29;-><init>(Landroid/app/Dialog;[Ljava/lang/Runnable;I)V

    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget v8, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v5, v8}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x2

    const/4 v14, -0x1

    invoke-direct {v8, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v13, 0x40c00000    # 6.0f

    invoke-direct {v0, v13}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    iput v13, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-virtual {v12, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    add-int/lit8 v3, v3, 0x1

    const/4 v8, 0x0

    const/high16 v10, 0x41200000    # 10.0f

    goto/16 :goto_b7

    .line 95
    :cond_1a4
    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-static {v3}, Lrk/schedule/ScheduleUi;->activitySource(Landroid/content/Context;)Landroid/view/ViewGroup;

    move-result-object v5

    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    iget v6, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v7, v0, Lrk/schedule/ScheduleEditor;->text:I

    const/4 v8, 0x1

    invoke-static/range {v2 .. v8}, Lrk/schedule/ScheduleUi;->glass(Landroid/app/Dialog;Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;IIZ)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {v2, v9}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 96
    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    if-eqz v4, :cond_224

    iget-object v5, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    array-length v1, v1

    if-nez p3, :cond_1d4

    const/16 v6, 0x3c

    goto :goto_1d6

    :cond_1d4
    const/16 v6, 0x4a

    :goto_1d6
    mul-int v1, v1, v6

    add-int/lit8 v1, v1, 0x58

    int-to-float v1, v1

    invoke-direct {v0, v1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v1

    iget v6, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v7, 0x41a00000    # 20.0f

    invoke-direct {v0, v7}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v7

    sub-int/2addr v6, v7

    const/high16 v7, 0x43e60000    # 460.0f

    invoke-direct {v0, v7}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    iget v5, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v5, v5

    const v7, 0x3f3851ec    # 0.72f

    mul-float v5, v5, v7

    float-to-int v5, v5

    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v4, v6, v1}, Landroid/view/Window;->setLayout(II)V

    const/16 v1, 0x51

    invoke-virtual {v4, v1}, Landroid/view/Window;->setGravity(I)V

    const v1, 0x106000d

    invoke-virtual {v4, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const/high16 v5, 0x41200000    # 10.0f

    invoke-direct {v0, v5}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v5

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    const/high16 v5, 0x3e800000    # 0.25f

    iput v5, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    invoke-virtual {v4, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    const/4 v1, 0x2

    invoke-virtual {v4, v1}, Landroid/view/Window;->addFlags(I)V

    .line 97
    :cond_224
    invoke-static {v2}, Lrk/schedule/ScheduleUi;->window(Landroid/app/Dialog;)V

    invoke-static {v3, v11, v9}, Lrk/schedule/ScheduleUi;->enter(Landroid/view/View;IZ)V

    const/4 v1, 0x0

    :goto_22b
    invoke-virtual {v12}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_243

    invoke-virtual {v12, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    mul-int/lit8 v3, v1, 0x12

    const/16 v4, 0x6c

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v2, v3, v11}, Lrk/schedule/ScheduleUi;->enter(Landroid/view/View;IZ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_22b

    .line 98
    :cond_243
    return-void
.end method

.method private askClose()V
    .registers 4

    .line 169
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dirty()Z

    move-result v0

    if-nez v0, :cond_a

    invoke-virtual {p0}, Lrk/schedule/ScheduleEditor;->dismiss()V

    return-void

    :cond_a
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0415\u0441\u0442\u044c \u043d\u0435\u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0435 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u043d\u0438 \u0435\u0449\u0451 \u043d\u0435 \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u044b \u043a \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0443."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda43;

    invoke-direct {v1, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda43;-><init>(Lrk/schedule/ScheduleEditor;)V

    const-string v2, "\u041e\u0442\u0431\u0440\u043e\u0441\u0438\u0442\u044c"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private assign()V
    .registers 6

    .line 152
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041a\u043e\u0433\u0434\u0430 \u043f\u0440\u0438\u043c\u0435\u043d\u044f\u0442\u044c?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0422\u043e\u043b\u044c\u043a\u043e "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->shortDate()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/Locale;

    const-string v4, "ru"

    invoke-direct {v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\u0412\u0435\u0440\u043d\u0443\u0442\u044c \u043f\u0440\u0430\u0432\u0438\u043b\u043e \u0434\u043d\u044f \u043d\u0435\u0434\u0435\u043b\u0438"

    const-string v3, "\u0423\u0431\u0440\u0430\u0442\u044c \u043f\u043e\u0432\u0442\u043e\u0440\u0435\u043d\u0438\u0435 \u043f\u043e \u0434\u043d\u044f\u043c"

    const-string v4, "\u041f\u043e\u0432\u0442\u043e\u0440\u044f\u0442\u044c \u043f\u043e \u0434\u043d\u044f\u043c \u043d\u0435\u0434\u0435\u043b\u0438"

    filled-new-array {v1, v4, v2, v3}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda24;

    invoke-direct {v2, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda24;-><init>(Lrk/schedule/ScheduleEditor;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 156
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private builder()Landroid/app/AlertDialog$Builder;
    .registers 3

    .line 99
    new-instance v0, Lrk/schedule/ScheduleEditor$1;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lrk/schedule/ScheduleEditor$1;-><init>(Lrk/schedule/ScheduleEditor;Landroid/content/Context;)V

    return-object v0
.end method

.method private button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 6

    .line 41
    new-instance v0, Landroid/widget/Button;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iget v1, p0, Lrk/schedule/ScheduleEditor;->surface:I

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->panel(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    iget v1, p0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    const/high16 v1, 0x42300000    # 44.0f

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumWidth(I)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v2

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v1

    invoke-virtual {v0, v2, p1, v1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    const/high16 p1, 0x41600000    # 14.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    new-instance p1, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda23;

    invoke-direct {p1, p2}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda23;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget p1, p0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v0, p1}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    return-object v0
.end method

.method private chooseDate()V
    .registers 10

    .line 146
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iget-wide v1, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    new-instance v3, Landroid/app/DatePickerDialog;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v4

    new-instance v5, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda19;

    invoke-direct {v5, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda19;-><init>(Lrk/schedule/ScheduleEditor;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v6

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v7

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v8

    invoke-direct/range {v3 .. v8}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    invoke-virtual {v3}, Landroid/app/DatePickerDialog;->show()V

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->decorate(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private chooseProfile()V
    .registers 6

    .line 147
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v1, v1, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_39

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v4, v4, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrk/schedule/ScheduleStore$Profile;

    iget-object v3, v3, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    :cond_39
    const-string v2, "+ \u041d\u043e\u0432\u043e\u0435 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/CharSequence;

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda31;

    invoke-direct {v3, p0, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda31;-><init>(Lrk/schedule/ScheduleEditor;Ljava/util/List;)V

    invoke-virtual {v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private clearDialogPanels(Landroid/view/View;)V
    .registers 9

    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_31

    :try_start_8
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "parentPanel"

    const-string v3, "topPanel"

    const-string v4, "contentPanel"

    const-string v5, "customPanel"

    const-string v6, "buttonPanel"

    filled-new-array {v1, v3, v4, v5, v6}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_2f} :catch_30

    goto :goto_31

    :catch_30
    move-exception v0

    .line 102
    :cond_31
    :goto_31
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_48

    :goto_35
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v2, v1, :cond_48

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->clearDialogPanels(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_35

    .line 103
    :cond_48
    return-void
.end method

.method private column()Landroid/widget/LinearLayout;
    .registers 3

    .line 42
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    return-object v0
.end method

.method private decorate(Landroid/app/AlertDialog;)V
    .registers 16

    .line 106
    const-string v0, "rk_schedule_popup"

    const v1, 0x1020002

    :try_start_5
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_ab

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-nez v2, :cond_15

    goto/16 :goto_ab

    :cond_15
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_25

    return-void

    .line 107
    :cond_25
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v7

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x1

    const/4 v13, -0x2

    invoke-direct {v4, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v2}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->clearDialogPanels(Landroid/view/View;)V

    .line 108
    iget-object v3, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-static {v3}, Lrk/schedule/ScheduleUi;->activitySource(Landroid/content/Context;)Landroid/view/ViewGroup;

    move-result-object v8

    iget-object v6, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    iget v9, p0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v10, p0, Lrk/schedule/ScheduleEditor;->text:I

    const/4 v11, 0x0

    move-object v5, p1

    invoke-static/range {v5 .. v11}, Lrk/schedule/ScheduleUi;->glass(Landroid/app/Dialog;Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;IIZ)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v12, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    invoke-virtual {v5}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_85

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v3, 0x42000000    # 32.0f

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    sub-int/2addr v1, v3

    const/high16 v3, 0x43d70000    # 430.0f

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v0, v1, v13}, Landroid/view/Window;->setLayout(II)V

    .line 110
    :cond_85
    const/4 v0, -0x3

    filled-new-array {v12, v13, v0}, [I

    move-result-object v0

    const/4 v1, 0x0

    :goto_8b
    const/4 v3, 0x3

    if-ge v1, v3, :cond_a3

    aget v3, v0, v1

    invoke-virtual {v5, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v3

    if-eqz v3, :cond_a0

    iget v4, p0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setTextColor(I)V

    iget v4, p0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v3, v4}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    :cond_a0
    add-int/lit8 v1, v1, 0x1

    goto :goto_8b

    .line 111
    :cond_a3
    invoke-static {v5}, Lrk/schedule/ScheduleUi;->window(Landroid/app/Dialog;)V

    const/4 v0, 0x1

    invoke-static {p1, v2, v0}, Lrk/schedule/ScheduleUi;->enter(Landroid/view/View;IZ)V
    :try_end_aa
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_aa} :catch_ac

    .line 112
    goto :goto_b3

    .line 106
    :cond_ab
    :goto_ab
    return-void

    .line 112
    :catch_ac
    move-exception v0

    move-object p1, v0

    const-string v0, "Schedule popup styling"

    invoke-static {v0, p1}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    :goto_b3
    return-void
.end method

.method private delete()V
    .registers 7

    .line 151
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v1, v1, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_18
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "\n"

    if-eqz v2, :cond_42

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_18

    :cond_42
    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v1, v1, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4e
    :goto_4e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_80

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    sget-object v4, Lrk/schedule/ScheduleEditor;->DAYS:[Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v4, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4e

    :cond_80
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u00ab"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v3

    iget-object v3, v3, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\u00bb?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u042d\u0442\u0438 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f \u0431\u0443\u0434\u0443\u0442 \u0443\u0434\u0430\u043b\u0435\u043d\u044b:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\u0412\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u0441\u044f \u043d\u0430\u0441\u043b\u0435\u0434\u043e\u0432\u0430\u043d\u0438\u0435 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u044f."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda32;

    invoke-direct {v1, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda32;-><init>(Lrk/schedule/ScheduleEditor;)V

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private dialogContext()Landroid/content/Context;
    .registers 5

    .line 36
    new-instance v0, Landroid/view/ContextThemeWrapper;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    iget-object v2, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-static {v2}, Lrk/schedule/ScheduleBridge;->textColor(Landroid/content/Context;)I

    move-result v2

    const v3, -0xe8dfd4

    if-ne v2, v3, :cond_13

    const v2, 0x103023a

    goto :goto_16

    :cond_13
    const v2, 0x1030226

    :goto_16
    invoke-direct {v0, v1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    return-object v0
.end method

.method private dirty()Z
    .registers 4

    .line 167
    const/4 v0, 0x1

    :try_start_1
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->syncSilently()V

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    invoke-virtual {v1}, Lrk/schedule/ScheduleStore;->encode()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lrk/schedule/ScheduleEditor;->original:Lrk/schedule/ScheduleStore;

    invoke-virtual {v2}, Lrk/schedule/ScheduleStore;->encode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_14} :catch_16

    xor-int/2addr v0, v1

    return v0

    :catch_16
    move-exception v1

    return v0
.end method

.method private dp(F)I
    .registers 3

    .line 38
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private editLesson(I)V
    .registers 15

    .line 115
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    const-string v2, "\u041d\u0430\u0447\u0430\u043b\u043e"

    const/16 v3, 0xd

    invoke-direct {p0, v2, v3}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-direct {p0, v1, v4}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    const-string v4, "\u041a\u043e\u043d\u0435\u0446"

    invoke-direct {p0, v4, v3}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    new-instance v8, Landroid/widget/EditText;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v8, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    new-instance v9, Landroid/widget/EditText;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v9, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x2

    new-array v5, v3, [Landroid/widget/EditText;

    const/4 v6, 0x0

    aput-object v8, v5, v6

    const/4 v7, 0x1

    aput-object v9, v5, v7

    .line 116
    const/4 v10, 0x0

    :goto_46
    if-ge v10, v3, :cond_94

    aget-object v11, v5, v10

    iget-object v12, p0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object v12, v12, p1

    aget-object v12, v12, v10

    invoke-virtual {v12}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    if-nez v10, :cond_5b

    move-object v12, v2

    goto :goto_5c

    :cond_5b
    move-object v12, v4

    :goto_5c
    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    iget v12, p0, Lrk/schedule/ScheduleEditor;->text:I

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setTextColor(I)V

    const/high16 v12, 0x41a80000    # 21.0f

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setTextSize(F)V

    const/16 v12, 0x11

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setGravity(I)V

    invoke-virtual {v11, v7}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/16 v12, 0x24

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setInputType(I)V

    invoke-virtual {v11, v7}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    new-instance v12, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda8;

    invoke-direct {v12, p0, v11}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda8;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;)V

    invoke-virtual {v11, v12}, Landroid/widget/EditText;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-direct {p0, v1, v11}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    if-nez v10, :cond_91

    const-string v11, "\u2013"

    const/16 v12, 0x12

    invoke-direct {p0, v11, v12}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v11

    invoke-virtual {v1, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_91
    add-int/lit8 v10, v10, 0x1

    goto :goto_46

    :cond_94
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 117
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0, v8}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda9;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;)V

    const-string v3, "\u0412\u044b\u0431\u0440\u0430\u0442\u044c \u043d\u0430\u0447\u0430\u043b\u043e"

    invoke-direct {p0, v3, v2}, Lrk/schedule/ScheduleEditor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0, v9}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda10;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;)V

    const-string v3, "\u0412\u044b\u0431\u0440\u0430\u0442\u044c \u043a\u043e\u043d\u0435\u0446"

    invoke-direct {p0, v3, v2}, Lrk/schedule/ScheduleEditor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 118
    new-instance v11, Landroid/widget/CheckBox;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v11, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0421\u0434\u0432\u0438\u043d\u0443\u0442\u044c \u0441\u043b\u0435\u0434\u0443\u044e\u0449\u0438\u0435 \u0443\u0440\u043e\u043a\u0438"

    invoke-virtual {v11, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget v1, p0, Lrk/schedule/ScheduleEditor;->text:I

    invoke-virtual {v11, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    invoke-virtual {v11, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->shiftOrigin:[I

    aget v1, v1, p1

    if-ltz v1, :cond_d7

    const/4 v6, 0x1

    :cond_d7
    invoke-virtual {v11, v6}, Landroid/widget/CheckBox;->setEnabled(Z)V

    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 119
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0423\u0440\u043e\u043a "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->form(Landroid/widget/LinearLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0, p1}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda11;-><init>(Lrk/schedule/ScheduleEditor;I)V

    const-string v3, "\u041a\u0430\u043a \u0432 \u0448\u043a\u043e\u043b\u0435"

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0413\u043e\u0442\u043e\u0432\u043e"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    .line 120
    new-instance v5, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;

    move-object v6, p0

    move v10, p1

    invoke-direct/range {v5 .. v11}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;-><init>(Lrk/schedule/ScheduleEditor;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;ILandroid/widget/CheckBox;)V

    invoke-virtual {v7, v5}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    .line 121
    return-void
.end method

.method private form(Landroid/widget/LinearLayout;)Landroid/view/View;
    .registers 7

    .line 37
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v2

    const/high16 v3, 0x41000000    # 8.0f

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v4

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v1

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    invoke-virtual {p1, v2, v4, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v0, p1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private fromDiary()V
    .registers 7

    .line 159
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-eqz v0, :cond_69

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    if-nez v0, :cond_d

    goto :goto_69

    :cond_d
    iget-wide v0, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v0, v1}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1b

    const-string v0, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u043d\u0430 \u044d\u0442\u0443 \u0434\u0430\u0442\u0443"

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->toast(Ljava/lang/String;)V

    return-void

    :cond_1b
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v1

    iget-object v1, v1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    array-length v2, v1

    const/4 v3, 0x0

    :goto_23
    if-ge v3, v2, :cond_2e

    aget-object v4, v1, v3

    const/4 v5, -0x1

    invoke-static {v4, v5}, Ljava/util/Arrays;->fill([II)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_23

    :cond_2e
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_32
    :goto_32
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/schedule/ScheduleResolver$Event;

    iget-object v2, v1, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-static {v2}, Lrk/schedule/ScheduleResolver;->number(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_32

    const/16 v3, 0x8

    if-ge v2, v3, :cond_32

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v3

    iget-object v3, v3, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    iget v4, v1, Lrk/schedule/ScheduleResolver$Event;->start:I

    iget v1, v1, Lrk/schedule/ScheduleResolver$Event;->end:I

    filled-new-array {v4, v1}, [I

    move-result-object v1

    aput-object v1, v3, v2

    goto :goto_32

    :cond_5d
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v0, v0, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    :cond_69
    :goto_69
    return-void
.end method

.method private generate()V
    .registers 10

    .line 158
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-eqz v0, :cond_66

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    if-nez v0, :cond_d

    goto :goto_66

    :cond_d
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    const-string v1, "\u041d\u0430\u0447\u0430\u043b\u043e \u043f\u0435\u0440\u0432\u043e\u0433\u043e \u0443\u0440\u043e\u043a\u0430 \u00b7 \u0427\u0427:\u041c\u041c"

    const-string v2, "08:30"

    invoke-direct {p0, v0, v1, v2}, Lrk/schedule/ScheduleEditor;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v5

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    const-string v2, "30|35|40|45"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    goto :goto_28

    :cond_26
    const-string v1, "45"

    :goto_28
    const-string v2, "\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c \u0443\u0440\u043e\u043a\u0430 \u00b7 \u043c\u0438\u043d"

    invoke-direct {p0, v0, v2, v1}, Lrk/schedule/ScheduleEditor;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v6

    const-string v1, "\u0427\u0438\u0441\u043b\u043e \u0443\u0440\u043e\u043a\u043e\u0432 \u00b7 1\u20138"

    const-string v2, "8"

    invoke-direct {p0, v0, v1, v2}, Lrk/schedule/ScheduleEditor;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v7

    const-string v1, "\u041e\u0431\u044b\u0447\u043d\u0430\u044f \u043f\u0435\u0440\u0435\u043c\u0435\u043d\u0430 \u00b7 \u043c\u0438\u043d"

    const-string v2, "10"

    invoke-direct {p0, v0, v1, v2}, Lrk/schedule/ScheduleEditor;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v8

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u0417\u0430\u043f\u043e\u043b\u043d\u0438\u0442\u044c \u0437\u0432\u043e\u043d\u043a\u0438"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->form(Landroid/widget/LinearLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V

    const-string v1, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c"

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :cond_66
    :goto_66
    return-void
.end method

.method private glass(Landroid/widget/LinearLayout;)Landroid/view/View;
    .registers 9

    .line 122
    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-static {v0}, Lrk/schedule/ScheduleUi;->activitySource(Landroid/content/Context;)Landroid/view/ViewGroup;

    move-result-object v3

    iget v4, p0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v5, p0, Lrk/schedule/ScheduleEditor;->text:I

    const/4 v6, 0x1

    move-object v0, p0

    move-object v2, p1

    invoke-static/range {v0 .. v6}, Lrk/schedule/ScheduleUi;->glass(Landroid/app/Dialog;Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;IIZ)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method private homeroom()V
    .registers 13

    .line 161
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-wide v2, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-virtual {v1, v2, v3}, Lrk/schedule/ScheduleStore;->homeroom(J)Lrk/schedule/ScheduleResolver$Homeroom;

    move-result-object v1

    new-instance v5, Landroid/widget/Spinner;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v5, v2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/ArrayAdapter;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "\u0412\u043c\u0435\u0441\u0442\u043e \u0443\u0440\u043e\u043a\u0430"

    const-string v6, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u043f\u0435\u0440\u0435\u0434 \u0443\u0440\u043e\u043a\u043e\u043c \u0441\u043e \u0441\u0434\u0432\u0438\u0433\u043e\u043c"

    const-string v7, "\u041e\u0442\u0434\u0435\u043b\u044c\u043d\u043e\u0435 \u0441\u043e\u0431\u044b\u0442\u0438\u0435"

    filled-new-array {v7, v4, v6}, [Ljava/lang/String;

    move-result-object v4

    const v6, 0x1090009

    invoke-direct {v2, v3, v6, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {v5, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    if-eqz v1, :cond_56

    iget-object v2, v1, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    const-string v3, "replace"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_46

    const/4 v2, 0x1

    goto :goto_53

    :cond_46
    iget-object v2, v1, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    const-string v3, "insert"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_52

    const/4 v2, 0x2

    goto :goto_53

    :cond_52
    const/4 v2, 0x0

    :goto_53
    invoke-virtual {v5, v2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 162
    :cond_56
    const-string v2, ""

    if-nez v1, :cond_5c

    move-object v3, v2

    goto :goto_62

    :cond_5c
    iget v3, v1, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    invoke-static {v3}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v3

    :goto_62
    const-string v4, "\u041d\u0430\u0447\u0430\u043b\u043e \u00b7 \u0427\u0427:\u041c\u041c"

    invoke-direct {p0, v0, v4, v3}, Lrk/schedule/ScheduleEditor;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v3

    if-nez v1, :cond_6c

    move-object v4, v2

    goto :goto_72

    :cond_6c
    iget v4, v1, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    invoke-static {v4}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v4

    :goto_72
    const-string v7, "\u041a\u043e\u043d\u0435\u0446 \u00b7 \u0427\u0427:\u041c\u041c"

    invoke-direct {p0, v0, v7, v4}, Lrk/schedule/ScheduleEditor;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v7

    if-nez v1, :cond_7d

    const-string v1, "1"

    goto :goto_90

    :cond_7d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v1, v1, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_90
    const-string v2, "\u041d\u043e\u043c\u0435\u0440 \u0437\u0430\u043c\u0435\u043d\u044f\u0435\u043c\u043e\u0433\u043e / \u0441\u043b\u0435\u0434\u0443\u044e\u0449\u0435\u0433\u043e \u0443\u0440\u043e\u043a\u0430"

    invoke-direct {p0, v0, v2, v1}, Lrk/schedule/ScheduleEditor;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v8

    .line 163
    const-string v1, "\u0414\u043b\u044f \u0432\u0441\u0442\u0430\u0432\u043a\u0438 \u043d\u0430\u0447\u0430\u043b\u043e \u0431\u0435\u0440\u0451\u0442\u0441\u044f \u0443 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0433\u043e \u0443\u0440\u043e\u043a\u0430, \u0434\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c \u2014 \u0438\u0437 \u0440\u0430\u0437\u043d\u0438\u0446\u044b \u043f\u043e\u043b\u0435\u0439 \u0432\u0440\u0435\u043c\u0435\u043d\u0438. \u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u0434\u0430\u0442\u044b \u0432\u0430\u0436\u043d\u0435\u0435 \u0434\u043d\u044f \u043d\u0435\u0434\u0435\u043b\u0438."

    const/16 v2, 0xd

    invoke-direct {p0, v1, v2}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 164
    new-instance v9, Landroid/widget/Spinner;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v9, v1}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041d\u0430 \u0434\u0430\u0442\u0443 "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v10, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v10, v11}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v2, Lrk/schedule/ScheduleEditor;->DAYS:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v2, Landroid/widget/ArrayAdapter;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4, v6, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    invoke-virtual {v9, v2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 165
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041a\u043b\u0430\u0441\u0441\u043d\u044b\u0439 \u0447\u0430\u0441"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->form(Landroid/widget/LinearLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0423\u0431\u0440\u0430\u0442\u044c"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0413\u043e\u0442\u043e\u0432\u043e"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda25;

    move-object v6, v3

    move-object v3, p0

    invoke-direct/range {v2 .. v9}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda25;-><init>(Lrk/schedule/ScheduleEditor;Landroid/app/AlertDialog;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/Spinner;)V

    invoke-virtual {v4, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;
    .registers 9

    .line 157
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/16 v1, 0xc

    invoke-direct {p0, p2, v1}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iget v2, p0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v3, p0, Lrk/schedule/ScheduleEditor;->text:I

    const v4, 0x3f266666    # 0.65f

    invoke-direct {p0, v2, v3, v4}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const-string p3, "\u0427\u0427:\u041c\u041c"

    invoke-virtual {p2, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_31

    const/16 p2, 0x24

    goto :goto_33

    :cond_31
    const/16 p2, 0x1002

    :goto_33
    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setInputType(I)V

    invoke-virtual {v0}, Landroid/widget/EditText;->setSingleLine()V

    iget p2, p0, Lrk/schedule/ScheduleEditor;->text:I

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setTextColor(I)V

    iget p2, p0, Lrk/schedule/ScheduleEditor;->text:I

    const p3, 0xffffff

    and-int/2addr p2, p3

    const/high16 p3, -0x78000000

    or-int/2addr p2, p3

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setHintTextColor(I)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private label(Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 6

    .line 40
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget p1, p0, Lrk/schedule/ScheduleEditor;->text:I

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 p1, 0x41000000    # 8.0f

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result p2

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v2

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result p1

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v1

    invoke-virtual {v0, p2, v2, p1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method static synthetic lambda$action$2(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 48
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$actionSheet$9(Landroid/app/Dialog;[Ljava/lang/Runnable;ILandroid/view/View;)V
    .registers 4

    .line 93
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    aget-object p0, p1, p2

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$assign$24([ZLandroid/content/DialogInterface;IZ)V
    .registers 4

    .line 155
    aput-boolean p3, p0, p2

    return-void
.end method

.method static synthetic lambda$button$1(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 41
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$pickTime$16(Landroid/widget/EditText;Landroid/widget/TimePicker;II)V
    .registers 4

    .line 123
    mul-int/lit8 p2, p2, 0x3c

    add-int/2addr p2, p3

    invoke-static {p2}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private manual()V
    .registers 7

    .line 166
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v0

    iget-wide v1, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v1, v2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v2, v2, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    iget-object v2, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v2, v2, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_2b

    :cond_2a
    const/4 v2, 0x0

    :goto_2b
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u041f\u043e\u043f\u0440\u0430\u0432\u043a\u0430 \u0432 \u043c\u0438\u043d\u0443\u0442\u0430\u0445, \u043d\u0430\u043f\u0440\u0438\u043c\u0435\u0440 +5 \u0438\u043b\u0438 -3"

    invoke-direct {p0, v0, v3, v2}, Lrk/schedule/ScheduleEditor;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v2

    const-string v3, "\u0421\u0434\u0432\u0438\u0433\u0430\u0435\u0442 \u0432\u0441\u0435 \u0441\u043e\u0431\u044b\u0442\u0438\u044f \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0439 \u0434\u0430\u0442\u044b. \u0412\u0441\u0442\u0443\u043f\u0438\u0442 \u0432 \u0441\u0438\u043b\u0443 \u043f\u043e\u0441\u043b\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u044f."

    const/16 v4, 0xd

    invoke-direct {p0, v3, v4}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u041f\u043e\u043f\u0440\u0430\u0432\u043a\u0430 \u00b7 "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->form(Landroid/widget/LinearLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda16;

    invoke-direct {v3, p0, v1}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda16;-><init>(Lrk/schedule/ScheduleEditor;Ljava/lang/String;)V

    const-string v5, "\u0421\u0431\u0440\u043e\u0441\u0438\u0442\u044c"

    invoke-virtual {v0, v5, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "\u0413\u043e\u0442\u043e\u0432\u043e"

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;

    invoke-direct {v3, p0, v0, v2, v1}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;-><init>(Lrk/schedule/ScheduleEditor;Landroid/app/AlertDialog;Landroid/widget/EditText;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private mix(IIF)I
    .registers 8

    .line 46
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p3

    mul-float v0, v0, v1

    invoke-static {p2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, p3

    add-float/2addr v0, v2

    float-to-int v0, v0

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v1

    invoke-static {p2}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, p3

    add-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, v1

    invoke-static {p2}, Landroid/graphics/Color;->blue(I)I

    move-result p2

    int-to-float p2, p2

    mul-float p2, p2, p3

    add-float/2addr p1, p2

    float-to-int p1, p1

    invoke-static {v0, v2, p1}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1
.end method

.method private more()V
    .registers 9

    .line 77
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 78
    :cond_7
    const-string v6, "\u041f\u043e\u0441\u043c\u043e\u0442\u0440\u0435\u0442\u044c \u0432\u0435\u0441\u044c \u0434\u0435\u043d\u044c"

    const-string v7, "\u041c\u043e\u0438 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u044f"

    const-string v1, "\u0417\u0430\u043f\u043e\u043b\u043d\u0438\u0442\u044c \u0437\u0432\u043e\u043d\u043a\u0438"

    const-string v2, "\u0412\u0437\u044f\u0442\u044c \u0432\u0440\u0435\u043c\u044f \u0438\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    const-string v3, "\u0412\u044b\u0431\u0440\u0430\u0442\u044c \u0434\u043d\u0438"

    const-string v4, "\u041a\u043b\u0430\u0441\u0441\u043d\u044b\u0439 \u0447\u0430\u0441"

    const-string v5, "\u0421\u0434\u0432\u0438\u043d\u0443\u0442\u044c \u0432\u0435\u0441\u044c \u0434\u0435\u043d\u044c"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v0

    const-string v6, "\u0423\u0440\u043e\u043a\u0438, \u0441\u043e\u0431\u044b\u0442\u0438\u044f \u0438 \u0432\u0440\u0435\u043c\u044f \u043e\u043a\u043e\u043d\u0447\u0430\u043d\u0438\u044f"

    const-string v7, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c, \u043f\u0435\u0440\u0435\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u0442\u044c \u0438\u043b\u0438 \u0443\u0434\u0430\u043b\u0438\u0442\u044c"

    const-string v1, "\u0417\u0430\u0434\u0430\u0442\u044c \u043d\u0430\u0447\u0430\u043b\u043e, \u0443\u0440\u043e\u043a\u0438 \u0438 \u043f\u0435\u0440\u0435\u043c\u0435\u043d\u044b"

    const-string v2, "\u0421\u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0448\u043a\u043e\u043b\u044c\u043d\u043e\u0435 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    const-string v3, "\u041d\u0430 \u043e\u0434\u043d\u0443 \u0434\u0430\u0442\u0443 \u0438\u043b\u0438 \u043a\u0430\u0436\u0434\u0443\u044e \u043d\u0435\u0434\u0435\u043b\u044e"

    const-string v4, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0441\u043e\u0431\u044b\u0442\u0438\u0435 \u0438\u043b\u0438 \u0437\u0430\u043c\u0435\u043d\u0438\u0442\u044c \u0443\u0440\u043e\u043a"

    const-string v5, "\u0412\u0441\u0435 \u0437\u0432\u043e\u043d\u043a\u0438 \u0440\u0430\u043d\u044c\u0448\u0435 \u0438\u043b\u0438 \u043f\u043e\u0437\u0436\u0435"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x7

    new-array v2, v2, [Ljava/lang/Runnable;

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda1;-><init>(Lrk/schedule/ScheduleEditor;)V

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda2;-><init>(Lrk/schedule/ScheduleEditor;)V

    const/4 v4, 0x1

    aput-object v3, v2, v4

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda3;

    invoke-direct {v3, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda3;-><init>(Lrk/schedule/ScheduleEditor;)V

    const/4 v4, 0x2

    aput-object v3, v2, v4

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda4;-><init>(Lrk/schedule/ScheduleEditor;)V

    const/4 v4, 0x3

    aput-object v3, v2, v4

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda5;

    invoke-direct {v3, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda5;-><init>(Lrk/schedule/ScheduleEditor;)V

    const/4 v4, 0x4

    aput-object v3, v2, v4

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda6;-><init>(Lrk/schedule/ScheduleEditor;)V

    const/4 v4, 0x5

    aput-object v3, v2, v4

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda7;

    invoke-direct {v3, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda7;-><init>(Lrk/schedule/ScheduleEditor;)V

    const/4 v4, 0x6

    aput-object v3, v2, v4

    const-string v3, "\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u0437\u0432\u043e\u043d\u043a\u043e\u0432"

    invoke-direct {p0, v3, v0, v1, v2}, Lrk/schedule/ScheduleEditor;->actionSheet(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/Runnable;)V

    .line 81
    return-void
.end method

.method private newProfile(Z)V
    .registers 6

    .line 149
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041d\u0430\u043f\u0440\u0438\u043c\u0435\u0440, \u043a\u043e\u0440\u043e\u0442\u043a\u0438\u0439 \u0434\u0435\u043d\u044c"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    if-eqz p1, :cond_17

    const-string v2, "\u041a\u043e\u043f\u0438\u044f \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u044f"

    goto :goto_19

    :cond_17
    const-string v2, "\u041d\u043e\u0432\u043e\u0435 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    :goto_19
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;

    invoke-direct {v2, p0, v0, p1}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;Z)V

    const-string p1, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c"

    invoke-virtual {v1, p1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private panel(I)Landroid/graphics/drawable/GradientDrawable;
    .registers 3

    .line 39
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 p1, 0x41800000    # 16.0f

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method private pickTime(Landroid/widget/EditText;)V
    .registers 9

    .line 123
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_10

    const/16 v0, 0x1fe

    :cond_10
    new-instance v1, Landroid/app/TimePickerDialog;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda18;

    invoke-direct {v3, p1}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda18;-><init>(Landroid/widget/EditText;)V

    div-int/lit8 v4, v0, 0x3c

    rem-int/lit8 v5, v0, 0x3c

    const/4 v6, 0x1

    invoke-direct/range {v1 .. v6}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    invoke-virtual {v1}, Landroid/app/TimePickerDialog;->show()V

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->decorate(Landroid/app/AlertDialog;)V

    return-void
.end method

.method private previewBaseline()Ljava/util/List;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;"
        }
    .end annotation

    .line 135
    iget-wide v0, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v0, v1}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_9

    return-object v0

    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v1

    if-eqz v1, :cond_67

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_16
    const/16 v4, 0x8

    if-ge v3, v4, :cond_67

    iget-object v4, v1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v4, v4, v3

    aget v4, v4, v2

    if-ltz v4, :cond_64

    new-instance v5, Lrk/schedule/ScheduleResolver$Event;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v6, v3, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u0423\u0440\u043e\u043a "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v6, v1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v6, v6, v3

    aget v8, v6, v2

    iget-object v6, v1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v6, v6, v3

    const/4 v9, 0x1

    aget v9, v6, v9

    const/4 v11, 0x0

    const-string v12, "\u041f\u0440\u0435\u0434\u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440"

    const/4 v10, 0x0

    move-object v6, v4

    invoke-direct/range {v5 .. v12}, Lrk/schedule/ScheduleResolver$Event;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_64
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    :cond_67
    return-object v0
.end method

.method private profile()Lrk/schedule/ScheduleStore$Profile;
    .registers 3

    .line 45
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v0, v0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrk/schedule/ScheduleStore$Profile;

    return-object v0
.end method

.method private profileActions()V
    .registers 7

    .line 148
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041c\u043e\u0438 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u044f"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    const-string v2, "\u0421\u0431\u0440\u043e\u0441\u0438\u0442\u044c \u0432\u0441\u0451"

    const-string v3, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c"

    const-string v4, "\u041a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c"

    const-string v5, "\u041f\u0435\u0440\u0435\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u0442\u044c"

    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda22;

    invoke-direct {v2, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda22;-><init>(Lrk/schedule/ScheduleEditor;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private read()[[I
    .registers 2

    .line 124
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->read(Z)[[I

    move-result-object v0

    return-object v0
.end method

.method private read(Z)[[I
    .registers 16

    .line 125
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    :cond_8
    const/4 v0, 0x2

    new-array v2, v0, [I

    const/4 v3, 0x1

    aput v0, v2, v3

    const/4 v4, 0x0

    const/16 v5, 0x8

    aput v5, v2, v4

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[I

    const/4 v6, 0x0

    :goto_1c
    if-ge v6, v5, :cond_1b0

    .line 126
    iget-object v7, p0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object v7, v7, v6

    aget-object v7, v7, v4

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object v8, v8, v6

    aget-object v8, v8, v3

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 127
    aget-object v9, v2, v6

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    const/4 v11, -0x1

    if-eqz v10, :cond_4d

    const/4 v10, -0x1

    goto :goto_51

    :cond_4d
    invoke-static {v7}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result v10

    :goto_51
    aput v10, v9, v4

    aget-object v9, v2, v6

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_5c

    goto :goto_60

    :cond_5c
    invoke-static {v8}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result v11

    :goto_60
    aput v11, v9, v3

    .line 128
    iget-object v9, p0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object v9, v9, v6

    aget-object v9, v9, v4

    invoke-virtual {v9, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object v9, p0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object v9, v9, v6

    aget-object v9, v9, v3

    invoke-virtual {v9, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 129
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    const-string v10, "\u0423\u0440\u043e\u043a "

    if-nez v9, :cond_82

    aget-object v9, v2, v6

    aget v9, v9, v4

    if-ltz v9, :cond_187

    :cond_82
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_8e

    aget-object v9, v2, v6

    aget v9, v9, v3

    if-ltz v9, :cond_187

    :cond_8e
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-ne v7, v8, :cond_187

    .line 130
    aget-object v7, v2, v6

    aget v7, v7, v4

    if-ltz v7, :cond_d2

    aget-object v7, v2, v6

    aget v7, v7, v3

    aget-object v8, v2, v6

    aget v8, v8, v4

    if-le v7, v8, :cond_a9

    goto :goto_d2

    :cond_a9
    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object p1, p1, v6

    aget-object p1, p1, v3

    const-string v0, "\u041a\u043e\u043d\u0435\u0446 \u0434\u043e\u043b\u0436\u0435\u043d \u0431\u044b\u0442\u044c \u043f\u043e\u0437\u0436\u0435 \u043d\u0430\u0447\u0430\u043b\u0430"

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/2addr v6, v3

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": \u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 \u0438\u043d\u0442\u0435\u0440\u0432\u0430\u043b"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 131
    :cond_d2
    :goto_d2
    iget-object v7, p0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    aget-object v7, v7, v6

    if-eqz v7, :cond_183

    aget-object v7, v2, v6

    aget v7, v7, v4

    if-gez v7, :cond_e0

    const/4 v7, 0x1

    goto :goto_e1

    :cond_e0
    const/4 v7, 0x0

    :goto_e1
    if-eqz v7, :cond_e6

    const-string v8, "\u0418\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    goto :goto_102

    :cond_e6
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v9, v2, v6

    aget v9, v9, v3

    aget-object v10, v2, v6

    aget v10, v10, v4

    sub-int/2addr v9, v10

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " \u043c\u0438\u043d"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_102
    iget-object v9, p0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    aget-object v9, v9, v6

    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v8, p0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    aget-object v8, v8, v6

    iget v9, p0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v10, p0, Lrk/schedule/ScheduleEditor;->text:I

    const/high16 v11, 0x3f000000    # 0.5f

    invoke-direct {p0, v9, v10, v11}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    const/4 v8, 0x0

    :goto_11b
    if-ge v8, v0, :cond_183

    iget-object v9, p0, Lrk/schedule/ScheduleEditor;->timeLabels:[[Landroid/widget/TextView;

    aget-object v9, v9, v6

    aget-object v9, v9, v8

    if-eqz v9, :cond_180

    aget-object v9, v2, v6

    aget v9, v9, v8

    if-gez v9, :cond_155

    iget-wide v10, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v10, v11}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v10

    if-eqz v10, :cond_155

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_137
    :goto_137
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_155

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lrk/schedule/ScheduleResolver$Event;

    iget-object v12, v11, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-static {v12}, Lrk/schedule/ScheduleResolver;->number(Ljava/lang/String;)I

    move-result v12

    add-int/lit8 v13, v6, 0x1

    if-ne v12, v13, :cond_137

    if-nez v8, :cond_152

    iget v9, v11, Lrk/schedule/ScheduleResolver$Event;->start:I

    goto :goto_137

    :cond_152
    iget v9, v11, Lrk/schedule/ScheduleResolver$Event;->end:I

    goto :goto_137

    :cond_155
    iget-object v10, p0, Lrk/schedule/ScheduleEditor;->timeLabels:[[Landroid/widget/TextView;

    aget-object v10, v10, v6

    aget-object v10, v10, v8

    if-gez v9, :cond_160

    const-string v9, "\u2014:\u2014"

    goto :goto_164

    :cond_160
    invoke-static {v9}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v9

    :goto_164
    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v9, p0, Lrk/schedule/ScheduleEditor;->timeLabels:[[Landroid/widget/TextView;

    aget-object v9, v9, v6

    aget-object v9, v9, v8

    if-eqz v7, :cond_17b

    iget v10, p0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v11, p0, Lrk/schedule/ScheduleEditor;->text:I

    const v12, 0x3f19999a    # 0.6f

    invoke-direct {p0, v10, v11, v12}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v10

    goto :goto_17d

    :cond_17b
    iget v10, p0, Lrk/schedule/ScheduleEditor;->text:I

    :goto_17d
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_180
    add-int/lit8 v8, v8, 0x1

    goto :goto_11b

    .line 125
    :cond_183
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1c

    .line 129
    :cond_187
    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object p1, p1, v6

    aget-object p1, p1, v3

    const-string v0, "\u0417\u0430\u043f\u043e\u043b\u043d\u0438\u0442\u0435 \u043e\u0431\u0430 \u043f\u043e\u043b\u044f \u0432 \u0444\u043e\u0440\u043c\u0430\u0442\u0435 \u0427\u0427:\u041c\u041c"

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/2addr v6, v3

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": \u043f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0432\u0440\u0435\u043c\u044f"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 133
    :cond_1b0
    if-eqz p1, :cond_1b5

    invoke-static {v2}, Lrk/schedule/ScheduleResolver;->validateSlots([[I)V

    :cond_1b5
    return-object v2
.end method

.method private rename()V
    .registers 5

    .line 150
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v1

    iget-object v1, v1, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda0;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;)V

    const-string v0, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private render()V
    .registers 18

    .line 50
    move-object/from16 v0, p0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lrk/schedule/ScheduleEditor;->rendering:Z

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-static {v2}, Lrk/schedule/ScheduleBridge;->textColor(Landroid/content/Context;)I

    move-result v2

    iput v2, v0, Lrk/schedule/ScheduleEditor;->text:I

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    const-string v3, "getThemeBackgroundColor"

    const v4, -0xefede8

    invoke-static {v2, v3, v4}, Lrk/schedule/ScheduleBridge;->themeColor(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lrk/schedule/ScheduleEditor;->bg:I

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    const-string v3, "getThemeSurfaceColor"

    const v4, -0xdfdcd5

    invoke-static {v2, v3, v4}, Lrk/schedule/ScheduleBridge;->themeColor(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    const-string v3, "getAccentColor"

    const v4, -0xf57b01

    invoke-static {v2, v3, v4}, Lrk/schedule/ScheduleBridge;->themeColor(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lrk/schedule/ScheduleEditor;->accent:I

    iget v2, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v3, v0, Lrk/schedule/ScheduleEditor;->bg:I

    if-ne v2, v3, :cond_47

    iget v2, v0, Lrk/schedule/ScheduleEditor;->bg:I

    iget v3, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v4, 0x3d6147ae    # 0.055f

    invoke-direct {v0, v2, v3, v4}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v2

    iput v2, v0, Lrk/schedule/ScheduleEditor;->surface:I

    .line 51
    :cond_47
    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->timeLabels:[[Landroid/widget/TextView;

    array-length v4, v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_52
    if-ge v6, v4, :cond_5c

    aget-object v7, v2, v6

    invoke-static {v7, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_52

    .line 52
    :cond_5c
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v2

    iput-object v2, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    const/high16 v4, 0x41800000    # 16.0f

    invoke-direct {v0, v4}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v6

    const/high16 v7, 0x41200000    # 10.0f

    invoke-direct {v0, v7}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v8

    invoke-direct {v0, v4}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v4

    const/high16 v9, 0x41400000    # 12.0f

    invoke-direct {v0, v9}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v9

    invoke-virtual {v2, v6, v8, v4, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget v2, v0, Lrk/schedule/ScheduleEditor;->surface:I

    invoke-direct {v0, v2}, Lrk/schedule/ScheduleEditor;->panel(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    const/high16 v4, 0x41d00000    # 26.0f

    invoke-direct {v0, v4}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    iget-object v4, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    invoke-direct {v0, v2}, Lrk/schedule/ScheduleEditor;->glass(Landroid/widget/LinearLayout;)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lrk/schedule/ScheduleEditor;->sheet:Landroid/view/View;

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->sheet:Landroid/view/View;

    invoke-virtual {v0, v2}, Lrk/schedule/ScheduleEditor;->setContentView(Landroid/view/View;)V

    .line 53
    new-instance v2, Landroid/view/View;

    iget-object v4, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-direct {v2, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iget v4, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v6, v0, Lrk/schedule/ScheduleEditor;->text:I

    const/high16 v8, 0x3e800000    # 0.25f

    invoke-direct {v0, v4, v6, v8}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v4

    invoke-direct {v0, v4}, Lrk/schedule/ScheduleEditor;->panel(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42000000    # 32.0f

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v6

    const/high16 v8, 0x40800000    # 4.0f

    invoke-direct {v0, v8}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v8

    invoke-direct {v4, v6, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v1, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-direct {v0, v7}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v6, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v2

    iput-object v2, v0, Lrk/schedule/ScheduleEditor;->header:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    iget-object v4, v0, Lrk/schedule/ScheduleEditor;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 55
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v2

    const-string v4, "\u0417\u0432\u043e\u043d\u043a\u0438"

    const/16 v6, 0x16

    invoke-direct {v0, v4, v6}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v3, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-direct {v0, v2, v4}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda33;

    invoke-direct {v3, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda33;-><init>(Lrk/schedule/ScheduleEditor;)V

    const-string v4, "\u2022\u2022\u2022"

    invoke-direct {v0, v4, v3}, Lrk/schedule/ScheduleEditor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v3

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42300000    # 44.0f

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v7

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v8

    invoke-direct {v4, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda35;

    invoke-direct {v3, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda35;-><init>(Lrk/schedule/ScheduleEditor;)V

    const-string v4, "\u00d7"

    invoke-direct {v0, v4, v3}, Lrk/schedule/ScheduleEditor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v3

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42200000    # 40.0f

    invoke-direct {v0, v7}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v7

    invoke-direct {v0, v6}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v6

    invoke-direct {v4, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 56
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v2

    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v3

    const-string v4, "  \u25be"

    if-nez v2, :cond_142

    const-string v6, "\u0412\u044b\u0431\u0440\u0430\u0442\u044c \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435  \u25be"

    goto :goto_155

    :cond_142
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v2, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_155
    new-instance v7, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda36;

    invoke-direct {v7, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda36;-><init>(Lrk/schedule/ScheduleEditor;)V

    invoke-direct {v0, v6, v7}, Lrk/schedule/ScheduleEditor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v6

    const v7, 0x800013

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-direct {v0, v3, v6}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->shortDate()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v6, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda37;

    invoke-direct {v6, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda37;-><init>(Lrk/schedule/ScheduleEditor;)V

    invoke-direct {v0, v4, v6}, Lrk/schedule/ScheduleEditor;->action(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v4, v0, Lrk/schedule/ScheduleEditor;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 57
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041a\u043e\u0433\u0434\u0430 \u0434\u0435\u0439\u0441\u0442\u0432\u0443\u0435\u0442: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->scopeText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xc

    invoke-direct {v0, v3, v4}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    iget v6, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v7, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v8, 0x3f19999a    # 0.6f

    invoke-direct {v0, v6, v7, v8}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v6, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda38;

    invoke-direct {v6, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda38;-><init>(Lrk/schedule/ScheduleEditor;)V

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v6, v0, Lrk/schedule/ScheduleEditor;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 58
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v3

    const-string v6, "\u0423\u0440\u043e\u043a"

    const/16 v7, 0xb

    invoke-direct {v0, v6, v7}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v6

    iget v8, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v9, v0, Lrk/schedule/ScheduleEditor;->text:I

    const/high16 v10, 0x3f000000    # 0.5f

    invoke-direct {v0, v8, v9, v10}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42380000    # 46.0f

    invoke-direct {v0, v9}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v9

    const/4 v11, -0x2

    invoke-direct {v8, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v6, "\u041d\u0430\u0447\u0430\u043b\u043e"

    const-string v8, "\u041a\u043e\u043d\u0435\u0446"

    filled-new-array {v6, v8}, [Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    :goto_206
    const/4 v9, 0x2

    const/16 v12, 0x11

    if-ge v8, v9, :cond_225

    aget-object v9, v6, v8

    invoke-direct {v0, v9, v7}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setGravity(I)V

    iget v12, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v13, v0, Lrk/schedule/ScheduleEditor;->text:I

    invoke-direct {v0, v12, v13, v10}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v12

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-direct {v0, v3, v9}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_206

    :cond_225
    const-string v6, "\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c"

    invoke-direct {v0, v6, v7}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v6

    const v8, 0x800005

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setGravity(I)V

    iget v8, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v13, v0, Lrk/schedule/ScheduleEditor;->text:I

    invoke-direct {v0, v8, v13, v10}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42a40000    # 82.0f

    invoke-direct {v0, v10}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    invoke-direct {v8, v13, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v6, v0, Lrk/schedule/ScheduleEditor;->header:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 59
    new-instance v3, Landroid/widget/ScrollView;

    iget-object v6, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-direct {v3, v6}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v5}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    invoke-virtual {v3, v5}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    iget-object v6, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x1

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v8, v13, v5, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v6, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->column()Landroid/widget/LinearLayout;

    move-result-object v6

    iput-object v6, v0, Lrk/schedule/ScheduleEditor;->content:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lrk/schedule/ScheduleEditor;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v6}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 60
    const/16 v3, 0x8

    const/16 v6, 0xe

    const-string v8, ""

    if-eqz v2, :cond_3fb

    .line 61
    const/4 v15, 0x0

    :goto_27d
    if-ge v15, v3, :cond_416

    .line 62
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v5

    const/high16 v3, 0x42440000    # 49.0f

    invoke-direct {v0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-direct {v0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v4

    const/high16 v13, 0x40000000    # 2.0f

    invoke-direct {v0, v13}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v14

    invoke-direct {v0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    invoke-direct {v0, v13}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    invoke-virtual {v5, v4, v14, v3, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 63
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v15, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3, v6}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    iget v13, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v14, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v10, 0x3ef5c28f    # 0.48f

    invoke-direct {v0, v13, v14, v10}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v10

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v12}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x41f00000    # 30.0f

    invoke-direct {v0, v13}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    invoke-direct {v10, v13, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    const/4 v3, 0x0

    :goto_2da
    if-ge v3, v9, :cond_347

    iget-object v10, v0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object v10, v10, v15

    new-instance v13, Landroid/widget/EditText;

    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->dialogContext()Landroid/content/Context;

    move-result-object v14

    invoke-direct {v13, v14}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    aput-object v13, v10, v3

    iget-object v10, v0, Lrk/schedule/ScheduleEditor;->fields:[[Landroid/widget/EditText;

    aget-object v10, v10, v15

    aget-object v10, v10, v3

    iget-object v13, v2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v13, v13, v15

    aget v13, v13, v3

    if-gez v13, :cond_2fb

    move-object v13, v8

    goto :goto_305

    :cond_2fb
    iget-object v13, v2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v13, v13, v15

    aget v13, v13, v3

    invoke-static {v13}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v13

    :goto_305
    invoke-virtual {v10, v13}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {v0, v8, v12}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    iget-object v13, v0, Lrk/schedule/ScheduleEditor;->timeLabels:[[Landroid/widget/TextView;

    aget-object v13, v13, v15

    aput-object v10, v13, v3

    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setGravity(I)V

    sget-object v13, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance v13, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda39;

    invoke-direct {v13, v0, v15}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda39;-><init>(Lrk/schedule/ScheduleEditor;I)V

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget v13, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v10, v13}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    invoke-direct {v0, v5, v10}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    if-nez v3, :cond_343

    const-string v10, "\u2013"

    invoke-direct {v0, v10, v6}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    iget v13, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v14, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v9, 0x3eb33333    # 0.35f

    invoke-direct {v0, v13, v14, v9}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v9

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_343
    add-int/lit8 v3, v3, 0x1

    const/4 v9, 0x2

    goto :goto_2da

    .line 65
    :cond_347
    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    invoke-direct {v0, v8, v7}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    aput-object v9, v3, v15

    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    aget-object v3, v3, v15

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    aget-object v3, v3, v15

    const v9, 0x800015

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    aget-object v3, v3, v15

    sget-object v9, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->details:[Landroid/widget/TextView;

    aget-object v3, v3, v15

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x42a40000    # 82.0f

    invoke-direct {v0, v10}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v13

    invoke-direct {v9, v13, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda40;

    invoke-direct {v3, v0, v15}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda40;-><init>(Lrk/schedule/ScheduleEditor;I)V

    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget v3, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v5, v3}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 66
    new-instance v3, Landroid/view/View;

    iget-object v5, v0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iget v5, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v9, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v13, 0x3d8f5c29    # 0.07f

    invoke-direct {v0, v5, v9, v13}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v5, v0, Lrk/schedule/ScheduleEditor;->content:Landroid/widget/LinearLayout;

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v0, v13}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v14

    const/4 v1, -0x1

    const/16 v16, 0x1

    invoke-direct {v9, v1, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    iget-object v3, v0, Lrk/schedule/ScheduleEditor;->shiftOrigin:[I

    iget-object v5, v2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v5, v5, v15

    aget v5, v5, v16

    aput v5, v3, v15

    move-object v3, v2

    iget-wide v1, v0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v1, v2}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v1

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->shiftOrigin:[I

    aget v2, v2, v15

    if-gez v2, :cond_3ed

    if-eqz v1, :cond_3ed

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3d2
    :goto_3d2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3ed

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/schedule/ScheduleResolver$Event;

    iget-object v5, v2, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-static {v5}, Lrk/schedule/ScheduleResolver;->number(Ljava/lang/String;)I

    move-result v5

    if-ne v5, v4, :cond_3d2

    iget-object v5, v0, Lrk/schedule/ScheduleEditor;->shiftOrigin:[I

    iget v2, v2, Lrk/schedule/ScheduleResolver$Event;->end:I

    aput v2, v5, v15

    goto :goto_3d2

    .line 61
    :cond_3ed
    move-object v2, v3

    move v15, v4

    const/4 v1, 0x1

    const/16 v3, 0x8

    const/16 v4, 0xc

    const/4 v5, 0x0

    const/4 v9, 0x2

    const/4 v13, -0x1

    const/high16 v14, 0x3f800000    # 1.0f

    goto/16 :goto_27d

    .line 69
    :cond_3fb
    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->content:Landroid/widget/LinearLayout;

    const-string v2, "\u0421\u043e\u0437\u0434\u0430\u0439\u0442\u0435 \u043f\u0440\u043e\u0444\u0438\u043b\u044c \u0438\u043b\u0438 \u0432\u043e\u0437\u044c\u043c\u0438\u0442\u0435 \u0432\u0440\u0435\u043c\u044f \u0438\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430."

    invoke-direct {v0, v2, v6}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->content:Landroid/widget/LinearLayout;

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda41;

    invoke-direct {v2, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda41;-><init>(Lrk/schedule/ScheduleEditor;)V

    const-string v3, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c \u043f\u0440\u043e\u0444\u0438\u043b\u044c"

    invoke-direct {v0, v3, v2}, Lrk/schedule/ScheduleEditor;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 70
    :cond_416
    const/16 v1, 0xc

    invoke-direct {v0, v8, v1}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    iput-object v2, v0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    const v2, -0x1a7f79

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v1, 0xf

    invoke-direct {v0, v8, v1}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, v0, Lrk/schedule/ScheduleEditor;->preview:Landroid/widget/TextView;

    .line 71
    const/16 v1, 0xc

    invoke-direct {v0, v8, v1}, Lrk/schedule/ScheduleEditor;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, v0, Lrk/schedule/ScheduleEditor;->summary:Landroid/widget/TextView;

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->summary:Landroid/widget/TextView;

    iget v2, v0, Lrk/schedule/ScheduleEditor;->surface:I

    iget v3, v0, Lrk/schedule/ScheduleEditor;->text:I

    const v4, 0x3f0ccccd    # 0.55f

    invoke-direct {v0, v2, v3, v4}, Lrk/schedule/ScheduleEditor;->mix(IIF)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->summary:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 72
    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->row()Landroid/widget/LinearLayout;

    move-result-object v1

    iput-object v1, v0, Lrk/schedule/ScheduleEditor;->footer:Landroid/widget/LinearLayout;

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->footer:Landroid/widget/LinearLayout;

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda35;

    invoke-direct {v2, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda35;-><init>(Lrk/schedule/ScheduleEditor;)V

    const-string v3, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-direct {v0, v3, v2}, Lrk/schedule/ScheduleEditor;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    new-instance v1, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda42;

    invoke-direct {v1, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda42;-><init>(Lrk/schedule/ScheduleEditor;)V

    const-string v2, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    invoke-direct {v0, v2, v1}, Lrk/schedule/ScheduleEditor;->button(Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v0, Lrk/schedule/ScheduleEditor;->apply:Landroid/widget/Button;

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->apply:Landroid/widget/Button;

    iget v2, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-direct {v0, v2}, Lrk/schedule/ScheduleEditor;->panel(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->apply:Landroid/widget/Button;

    iget v2, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    int-to-double v2, v2

    const-wide v4, 0x3fd322d0e5604189L    # 0.299

    mul-double v2, v2, v4

    iget v4, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v4}, Landroid/graphics/Color;->green(I)I

    move-result v4

    int-to-double v4, v4

    const-wide v6, 0x3fe2c8b439581062L    # 0.587

    mul-double v4, v4, v6

    add-double/2addr v2, v4

    iget v4, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v4}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    int-to-double v4, v4

    const-wide v6, 0x3fbd2f1a9fbe76c9L    # 0.114

    mul-double v4, v4, v6

    add-double/2addr v2, v4

    const-wide v4, 0x4065400000000000L    # 170.0

    cmpl-double v6, v2, v4

    if-lez v6, :cond_4c4

    const v13, -0xeaeae6

    goto :goto_4c5

    :cond_4c4
    const/4 v13, -0x1

    :goto_4c5
    invoke-virtual {v1, v13}, Landroid/widget/Button;->setTextColor(I)V

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->apply:Landroid/widget/Button;

    iget v2, v0, Lrk/schedule/ScheduleEditor;->accent:I

    invoke-static {v1, v2}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->footer:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->apply:Landroid/widget/Button;

    invoke-direct {v0, v1, v2}, Lrk/schedule/ScheduleEditor;->weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->screen:Landroid/widget/LinearLayout;

    iget-object v2, v0, Lrk/schedule/ScheduleEditor;->footer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 73
    const/4 v1, 0x0

    iput-boolean v1, v0, Lrk/schedule/ScheduleEditor;->rendering:Z

    invoke-direct {v0}, Lrk/schedule/ScheduleEditor;->updatePreview()V

    invoke-virtual {v0}, Lrk/schedule/ScheduleEditor;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_4f3

    iget-object v1, v0, Lrk/schedule/ScheduleEditor;->sheet:Landroid/view/View;

    new-instance v2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda34;

    invoke-direct {v2, v0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda34;-><init>(Lrk/schedule/ScheduleEditor;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 74
    :cond_4f3
    return-void
.end method

.method private row()Landroid/widget/LinearLayout;
    .registers 3

    .line 43
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    return-object v0
.end method

.method private save()V
    .registers 4

    .line 170
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->sync()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    invoke-static {v0, v1}, Lrk/schedule/ScheduleBridge;->commit(Landroid/content/Context;Lrk/schedule/ScheduleStore;)V

    const-string v0, "\u0420\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u043e"

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->toast(Ljava/lang/String;)V

    invoke-virtual {p0}, Lrk/schedule/ScheduleEditor;->dismiss()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_16} :catch_17

    goto :goto_3b

    :catch_17
    move-exception v0

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->toast(Ljava/lang/String;)V

    :goto_3b
    return-void
.end method

.method private scopeText()Ljava/lang/String;
    .registers 5

    .line 75
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v0, v0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    iget-wide v1, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v1, v2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0442\u043e\u043b\u044c\u043a\u043e "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->shortDate()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/util/Locale;

    const-string v3, "ru"

    invoke-direct {v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_33
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-wide v1, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-virtual {v0, v1, v2}, Lrk/schedule/ScheduleStore;->active(J)Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    if-nez v0, :cond_40

    const-string v0, "\u0432\u0440\u0435\u043c\u044f \u0438\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    goto :goto_42

    :cond_40
    const-string v0, "\u043f\u043e \u0434\u043d\u044f\u043c \u043d\u0435\u0434\u0435\u043b\u0438"

    :goto_42
    return-object v0
.end method

.method private shift(I)V
    .registers 11

    .line 160
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->shiftOrigin:[I

    aget v0, v0, p1

    const/4 v1, 0x0

    :try_start_5
    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->read(Z)[[I

    move-result-object v2

    if-nez v2, :cond_c

    return-void

    :cond_c
    aget-object v3, v2, p1

    const/4 v4, 0x1

    aget v3, v3, v4

    if-ltz v0, :cond_59

    if-ltz v3, :cond_59

    iget-wide v5, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v5, v6}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_4b

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_21
    :goto_21
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lrk/schedule/ScheduleResolver$Event;

    iget-object v7, v6, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-static {v7}, Lrk/schedule/ScheduleResolver;->number(Ljava/lang/String;)I

    move-result v7

    sub-int/2addr v7, v4

    if-le v7, p1, :cond_21

    const/16 v8, 0x8

    if-ge v7, v8, :cond_21

    aget-object v8, v2, v7

    aget v8, v8, v1

    if-gez v8, :cond_21

    iget v8, v6, Lrk/schedule/ScheduleResolver$Event;->start:I

    iget v6, v6, Lrk/schedule/ScheduleResolver$Event;->end:I

    filled-new-array {v8, v6}, [I

    move-result-object v6

    aput-object v6, v2, v7

    goto :goto_21

    :cond_4b
    sub-int/2addr v3, v0

    invoke-static {v2, p1, v3}, Lrk/schedule/ScheduleResolver;->shiftFollowing([[III)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object p1

    iput-object v2, p1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    goto :goto_69

    :cond_59
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0437\u0430\u0434\u0430\u0439\u0442\u0435 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0438\u043d\u0442\u0435\u0440\u0432\u0430\u043b \u0438 \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u043f\u0440\u043e\u0444\u0438\u043b\u044c \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_61} :catch_61

    :catch_61
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->toast(Ljava/lang/String;)V

    :goto_69
    return-void
.end method

.method private shortDate()Ljava/lang/String;
    .registers 5

    .line 47
    iget-wide v0, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v0, v1}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    const-string v0, "\u0421\u0435\u0433\u043e\u0434\u043d\u044f"

    goto :goto_30

    :cond_17
    new-instance v0, Ljava/text/SimpleDateFormat;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "ru"

    invoke-direct {v1, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    const-string v2, "d MMM"

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    iget-wide v2, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    :goto_30
    return-object v0
.end method

.method public static show(Landroid/content/Context;J)V
    .registers 4

    .line 31
    :try_start_0
    new-instance v0, Lrk/schedule/ScheduleEditor;

    invoke-direct {v0, p0, p1, p2}, Lrk/schedule/ScheduleEditor;-><init>(Landroid/content/Context;J)V

    invoke-virtual {v0}, Lrk/schedule/ScheduleEditor;->show()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_1b

    :catch_9
    move-exception p1

    const-string p2, "Opening editor"

    invoke-static {p2, p1}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_1b
    return-void
.end method

.method private sync()Z
    .registers 7

    .line 134
    const/4 v0, 0x0

    :try_start_1
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->read()[[I

    move-result-object v1

    if-eqz v1, :cond_23

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v2

    iput-object v1, v2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    array-length v2, v1

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v2, :cond_23

    aget-object v4, v1, v3

    aget v4, v4, v0

    if-ltz v4, :cond_20

    iget-object v4, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v4, v4, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    iget-object v5, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_20} :catch_25

    :cond_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    :cond_23
    const/4 v0, 0x1

    return v0

    :catch_25
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lrk/schedule/ScheduleEditor;->toast(Ljava/lang/String;)V

    return v0
.end method

.method private syncSilently()V
    .registers 3

    .line 168
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->read()[[I

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v1

    iput-object v0, v1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    :cond_c
    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .registers 4

    .line 171
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    if-nez p1, :cond_6

    const-string p1, "\u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0432\u0432\u0435\u0434\u0451\u043d\u043d\u044b\u0435 \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f"

    :cond_6
    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private updatePreview()V
    .registers 13

    .line 136
    const-string v0, " \u043c\u0438\u043d"

    const-string v1, "\n"

    const-string v2, ""

    iget-boolean v3, p0, Lrk/schedule/ScheduleEditor;->rendering:Z

    if-nez v3, :cond_163

    iget-object v3, p0, Lrk/schedule/ScheduleEditor;->preview:Landroid/widget/TextView;

    if-nez v3, :cond_10

    goto/16 :goto_163

    .line 137
    :cond_10
    const/4 v3, 0x0

    :try_start_11
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->read()[[I

    move-result-object v4

    if-eqz v4, :cond_1d

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object v5

    iput-object v4, v5, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    .line 138
    :cond_1d
    iget-object v4, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    invoke-virtual {v4}, Lrk/schedule/ScheduleStore;->copy()Lrk/schedule/ScheduleStore;

    move-result-object v4

    iget-object v5, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    if-eqz v5, :cond_34

    iget-object v5, v4, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    iget-wide v6, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v6, v7}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    :cond_34
    iget-wide v5, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->previewBaseline()Ljava/util/List;

    move-result-object v7

    const/4 v8, 0x1

    invoke-static {v4, v5, v6, v7, v8}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    move-result-object v4

    .line 140
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "\u041f\u0440\u0435\u0434\u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0433\u043e \u043f\u0440\u043e\u0444\u0438\u043b\u044f\n"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v6, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v6, v7}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v6

    if-nez v6, :cond_53

    const-string v6, "\u041f\u0440\u0435\u0434\u043c\u0435\u0442\u044b \u043d\u0430 \u044d\u0442\u0443 \u0434\u0430\u0442\u0443 \u043d\u0435 \u0437\u0430\u0433\u0440\u0443\u0436\u0435\u043d\u044b. \u041f\u043e\u043a\u0430\u0437\u0430\u043d\u044b \u0442\u043e\u043b\u044c\u043a\u043e \u0437\u0430\u0434\u0430\u043d\u043d\u044b\u0435 \u0437\u0432\u043e\u043d\u043a\u0438.\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    :cond_53
    const/4 v6, 0x0

    :cond_54
    :goto_54
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_58} :catch_149

    const-string v9, " \u00b7 "

    if-ge v6, v7, :cond_c5

    :try_start_5c
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrk/schedule/ScheduleResolver$Event;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v7, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v7, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v7, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {v11}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " \u2014 "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v7, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-static {v11}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v7, Lrk/schedule/ScheduleResolver$Event;->end:I

    iget v11, v7, Lrk/schedule/ScheduleResolver$Event;->start:I

    sub-int/2addr v10, v11

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v9

    if-ge v6, v9, :cond_54

    const-string v9, "\n\u041f\u0435\u0440\u0435\u043c\u0435\u043d\u0430 "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lrk/schedule/ScheduleResolver$Event;

    iget v10, v10, Lrk/schedule/ScheduleResolver$Event;->start:I

    iget v7, v7, Lrk/schedule/ScheduleResolver$Event;->end:I

    sub-int/2addr v10, v7

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_54

    .line 142
    :cond_c5
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_e5

    const-string v0, "\n\n\u041e\u043a\u043e\u043d\u0447\u0430\u043d\u0438\u0435 \u0434\u043d\u044f: "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v8

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/schedule/ScheduleResolver$Event;

    iget v1, v1, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-static {v1}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    :cond_e5
    const-string v0, "\n\n\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u00ab\u041a\u043e\u0433\u0434\u0430 \u0434\u0435\u0439\u0441\u0442\u0432\u0443\u0435\u0442\u00bb, \u0447\u0442\u043e\u0431\u044b \u043f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c \u044d\u0442\u043e \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u043d\u0430 \u0434\u0430\u0442\u0443 \u0438\u043b\u0438 \u0434\u043d\u0438 \u043d\u0435\u0434\u0435\u043b\u0438."

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->preview:Landroid/widget/TextView;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->summary:Landroid/widget/TextView;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_fe

    const-string v1, "\u041d\u0430\u0436\u043c\u0438\u0442\u0435 \u043d\u0430 \u0441\u0442\u0440\u043e\u043a\u0443, \u0447\u0442\u043e\u0431\u044b \u0437\u0430\u0434\u0430\u0442\u044c \u0432\u0440\u0435\u043c\u044f"

    goto :goto_134

    :cond_fe
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u0414\u043e "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v8

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrk/schedule/ScheduleResolver$Event;

    iget v5, v5, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-static {v5}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " \u0441\u043e\u0431\u044b\u0442\u0438\u0439"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_134
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->apply:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setEnabled(Z)V
    :try_end_148
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_148} :catch_149

    .line 145
    goto :goto_162

    :catch_149
    move-exception v0

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->problem:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->summary:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->apply:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    :goto_162
    return-void

    .line 136
    :cond_163
    :goto_163
    return-void
.end method

.method private weighted(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 7

    .line 44
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$askClose$34$rk-schedule-ScheduleEditor(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 169
    invoke-virtual {p0}, Lrk/schedule/ScheduleEditor;->dismiss()V

    return-void
.end method

.method synthetic lambda$assign$25$rk-schedule-ScheduleEditor([ZILandroid/content/DialogInterface;I)V
    .registers 6

    .line 155
    iget-object p3, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p4, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    const/4 v0, 0x3

    if-ne p2, v0, :cond_9

    const/4 p2, 0x1

    goto :goto_a

    :cond_9
    const/4 p2, 0x0

    :goto_a
    invoke-virtual {p3, p4, p1, p2}, Lrk/schedule/ScheduleStore;->assignWeekdays(Ljava/lang/String;[ZZ)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method synthetic lambda$assign$26$rk-schedule-ScheduleEditor(Landroid/content/DialogInterface;I)V
    .registers 9

    .line 153
    if-nez p2, :cond_12

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    if-eqz p1, :cond_f

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-wide v0, p0, Lrk/schedule/ScheduleEditor;->day:J

    iget-object v2, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-virtual {p1, v0, v1, v2}, Lrk/schedule/ScheduleStore;->assignDate(JLjava/lang/String;)V

    :cond_f
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    .line 154
    :cond_12
    const/4 p1, 0x2

    const/4 v0, 0x0

    if-ne p2, p1, :cond_20

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-wide v1, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-virtual {p1, v1, v2, v0}, Lrk/schedule/ScheduleStore;->assignDate(JLjava/lang/String;)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    .line 155
    :cond_20
    const/4 p1, 0x1

    if-eq p2, p1, :cond_26

    const/4 v1, 0x3

    if-ne p2, v1, :cond_7a

    :cond_26
    const/4 v1, 0x7

    new-array v2, v1, [Z

    const/4 v3, 0x0

    :goto_2a
    if-ge v3, v1, :cond_4c

    iget-object v4, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v4, v4, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    add-int/lit8 v5, v3, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    if-ne p2, p1, :cond_43

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iget-object v5, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-static {v4, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    goto :goto_47

    :cond_43
    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    :goto_47
    aput-boolean v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_2a

    :cond_4c
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    if-ne p2, p1, :cond_55

    const-string p1, "\u041f\u043e\u0432\u0442\u043e\u0440\u044f\u0442\u044c \u043f\u043e \u0434\u043d\u044f\u043c"

    goto :goto_57

    :cond_55
    const-string p1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f"

    :goto_57
    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    sget-object v1, Lrk/schedule/ScheduleEditor;->DAYS:[Ljava/lang/String;

    new-instance v3, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda44;

    invoke-direct {v3, v2}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda44;-><init>([Z)V

    invoke-virtual {p1, v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda45;

    invoke-direct {v0, p0, v2, p2}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda45;-><init>(Lrk/schedule/ScheduleEditor;[ZI)V

    const-string p2, "\u0413\u043e\u0442\u043e\u0432\u043e"

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 156
    :cond_7a
    return-void
.end method

.method synthetic lambda$chooseDate$17$rk-schedule-ScheduleEditor(Landroid/widget/DatePicker;III)V
    .registers 5

    .line 146
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Calendar;->clear()V

    invoke-virtual {p1, p2, p3, p4}, Ljava/util/Calendar;->set(III)V

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method synthetic lambda$chooseProfile$18$rk-schedule-ScheduleEditor(Ljava/util/List;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 147
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    if-ne p3, p2, :cond_b

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->newProfile(Z)V

    goto :goto_16

    :cond_b
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    :goto_16
    return-void
.end method

.method synthetic lambda$delete$23$rk-schedule-ScheduleEditor(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 151
    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p2, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lrk/schedule/ScheduleStore;->remove(Ljava/lang/String;)V

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p1, p1, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_13

    const/4 p1, 0x0

    goto :goto_25

    :cond_13
    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p1, p1, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    :goto_25
    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method synthetic lambda$editLesson$10$rk-schedule-ScheduleEditor(Landroid/widget/EditText;Landroid/view/View;)Z
    .registers 3

    .line 116
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->pickTime(Landroid/widget/EditText;)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$editLesson$11$rk-schedule-ScheduleEditor(Landroid/widget/EditText;)V
    .registers 2

    .line 117
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->pickTime(Landroid/widget/EditText;)V

    return-void
.end method

.method synthetic lambda$editLesson$12$rk-schedule-ScheduleEditor(Landroid/widget/EditText;)V
    .registers 2

    .line 117
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->pickTime(Landroid/widget/EditText;)V

    return-void
.end method

.method synthetic lambda$editLesson$13$rk-schedule-ScheduleEditor(ILandroid/content/DialogInterface;I)V
    .registers 4

    .line 119
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object p2

    iget-object p2, p2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    const/4 p3, -0x1

    filled-new-array {p3, p3}, [I

    move-result-object p3

    aput-object p3, p2, p1

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method synthetic lambda$editLesson$14$rk-schedule-ScheduleEditor(Landroid/widget/EditText;Landroid/widget/EditText;ILandroid/widget/CheckBox;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 11

    .line 120
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p6

    invoke-virtual {p6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_21

    const/4 v0, -0x1

    goto :goto_25

    :cond_21
    invoke-static {p1}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result v0

    :goto_25
    invoke-virtual {p6}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2c

    goto :goto_30

    :cond_2c
    invoke-static {p6}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result v1

    :goto_30
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_38

    if-ltz v0, :cond_c2

    :cond_38
    invoke-virtual {p6}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_40

    if-ltz v1, :cond_c2

    :cond_40
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    invoke-virtual {p6}, Ljava/lang/String;->isEmpty()Z

    move-result p6

    if-ne p1, p6, :cond_c2

    if-ltz v0, :cond_4e

    if-le v1, v0, :cond_c2

    :cond_4e
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->read(Z)[[I

    move-result-object p6

    filled-new-array {v0, v1}, [I

    move-result-object v0

    aput-object v0, p6, p3

    invoke-virtual {p4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p4

    if-eqz p4, :cond_a9

    if-ltz v1, :cond_a1

    iget-wide v2, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v2, v3}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object p4

    if-eqz p4, :cond_98

    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :cond_6d
    :goto_6d
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_98

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrk/schedule/ScheduleResolver$Event;

    iget-object v2, v0, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-static {v2}, Lrk/schedule/ScheduleResolver;->number(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-le v2, p3, :cond_6d

    const/16 v3, 0x8

    if-ge v2, v3, :cond_6d

    aget-object v3, p6, v2

    aget v3, v3, p1

    if-gez v3, :cond_6d

    iget v3, v0, Lrk/schedule/ScheduleResolver$Event;->start:I

    iget v0, v0, Lrk/schedule/ScheduleResolver$Event;->end:I

    filled-new-array {v3, v0}, [I

    move-result-object v0

    aput-object v0, p6, v2

    goto :goto_6d

    :cond_98
    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->shiftOrigin:[I

    aget p1, p1, p3

    sub-int/2addr v1, p1

    invoke-static {p6, p3, v1}, Lrk/schedule/ScheduleResolver;->shiftFollowing([[III)V

    goto :goto_a9

    :cond_a1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p3, "\u0417\u0430\u0434\u0430\u0439\u0442\u0435 \u043a\u043e\u043d\u0435\u0446 \u0443\u0440\u043e\u043a\u0430 \u0434\u043b\u044f \u0441\u0434\u0432\u0438\u0433\u0430"

    invoke-direct {p1, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    :goto_a8
    throw p1

    :cond_a9
    :goto_a9
    invoke-static {p6}, Lrk/schedule/ScheduleResolver;->validateSlots([[I)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object p1

    iput-object p6, p1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p1, p1, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    iget-object p3, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-interface {p1, p3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p5}, Landroid/app/AlertDialog;->dismiss()V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    goto :goto_d2

    :cond_c2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p3, "\u0423\u043a\u0430\u0436\u0438\u0442\u0435 \u043d\u0430\u0447\u0430\u043b\u043e \u0438 \u043a\u043e\u043d\u0435\u0446 \u0432 \u0444\u043e\u0440\u043c\u0430\u0442\u0435 \u0427\u0427:\u041c\u041c"

    invoke-direct {p1, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V
    :try_end_c9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c9} :catch_ca

    goto :goto_a8

    :catch_ca
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_d2
    return-void
.end method

.method synthetic lambda$editLesson$15$rk-schedule-ScheduleEditor(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;ILandroid/widget/CheckBox;Landroid/content/DialogInterface;)V
    .registers 14

    .line 120
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->decorate(Landroid/app/AlertDialog;)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p6

    const/4 v0, 0x3

    invoke-virtual {p6, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    const/4 p6, -0x1

    invoke-virtual {p1, p6}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p6

    new-instance v0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;

    move-object v1, p0

    move-object v6, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;Landroid/widget/EditText;ILandroid/widget/CheckBox;Landroid/app/AlertDialog;)V

    invoke-virtual {p6, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$generate$27$rk-schedule-ScheduleEditor(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .registers 9

    .line 158
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p4

    if-ltz p1, :cond_81

    if-lez p2, :cond_81

    const/16 p5, 0x5a0

    if-ge p2, p5, :cond_81

    const/4 p6, 0x1

    if-lt p3, p6, :cond_81

    const/16 v0, 0x8

    if-gt p3, v0, :cond_81

    if-ltz p4, :cond_81

    if-ge p4, p5, :cond_81

    const/4 p5, 0x2

    new-array v1, p5, [I

    aput p5, v1, p6

    const/4 p5, 0x0

    aput v0, v1, p5

    sget-object p6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {p6, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p6

    check-cast p6, [[I

    :goto_53
    if-ge p5, v0, :cond_6b

    if-ge p5, p3, :cond_5e

    add-int v1, p1, p2

    filled-new-array {p1, v1}, [I

    move-result-object v1

    goto :goto_63

    :cond_5e
    const/4 v1, -0x1

    filled-new-array {v1, v1}, [I

    move-result-object v1

    :goto_63
    aput-object v1, p6, p5

    add-int v1, p2, p4

    add-int/2addr p1, v1

    add-int/lit8 p5, p5, 0x1

    goto :goto_53

    :cond_6b
    invoke-static {p6}, Lrk/schedule/ScheduleResolver;->validateSlots([[I)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object p1

    iput-object p6, p1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p1, p1, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    iget-object p2, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-interface {p1, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    goto :goto_91

    :cond_81
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u043f\u0430\u0440\u0430\u043c\u0435\u0442\u0440\u044b \u0433\u0435\u043d\u0435\u0440\u0430\u0442\u043e\u0440\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_89} :catch_89

    :catch_89
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->toast(Ljava/lang/String;)V

    :goto_91
    return-void
.end method

.method synthetic lambda$homeroom$28$rk-schedule-ScheduleEditor(Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 11

    .line 165
    :try_start_0
    new-instance p7, Lrk/schedule/ScheduleResolver$Homeroom;

    invoke-direct {p7}, Lrk/schedule/ScheduleResolver$Homeroom;-><init>()V

    const-string v0, "separate"

    const-string v1, "replace"

    const-string v2, "insert"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    aget-object p1, v0, p1

    iput-object p1, p7, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result p1

    iput p1, p7, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result p1

    iput p1, p7, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p7, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    iget p1, p7, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    if-ltz p1, :cond_88

    iget p1, p7, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    iget p2, p7, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    if-le p1, p2, :cond_88

    iget p1, p7, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    const/4 p2, 0x1

    if-lt p1, p2, :cond_88

    iget p1, p7, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    const/16 p2, 0x8

    if-gt p1, p2, :cond_88

    invoke-virtual {p5}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    if-nez p1, :cond_63

    iget-wide p1, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_7a

    :cond_63
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "dow:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p5}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_7a
    iget-object p2, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p2, p2, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    invoke-interface {p2, p1, p7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p6}, Landroid/app/AlertDialog;->dismiss()V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    goto :goto_98

    :cond_88
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0432\u0440\u0435\u043c\u044f \u0438 \u043d\u043e\u043c\u0435\u0440 \u0443\u0440\u043e\u043a\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_90} :catch_90

    :catch_90
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->toast(Ljava/lang/String;)V

    :goto_98
    return-void
.end method

.method synthetic lambda$homeroom$29$rk-schedule-ScheduleEditor(Landroid/widget/Spinner;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 6

    .line 165
    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p3

    if-nez p3, :cond_d

    iget-wide v0, p0, Lrk/schedule/ScheduleEditor;->day:J

    invoke-static {v0, v1}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_24

    :cond_d
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "dow:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_24
    iget-object p3, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p3, p3, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    invoke-interface {p3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method synthetic lambda$homeroom$30$rk-schedule-ScheduleEditor(Landroid/app/AlertDialog;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/content/DialogInterface;)V
    .registers 16

    .line 165
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->decorate(Landroid/app/AlertDialog;)V

    const/4 p7, -0x1

    invoke-virtual {p1, p7}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p7

    new-instance v0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;

    move-object v1, p0

    move-object v7, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/app/AlertDialog;)V

    invoke-virtual {p7, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p1, -0x3

    invoke-virtual {v7, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    new-instance p2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda28;

    invoke-direct {p2, p0, v6, v7}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda28;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/Spinner;Landroid/app/AlertDialog;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$manual$31$rk-schedule-ScheduleEditor(Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 166
    iget-object p2, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p2, p2, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method synthetic lambda$manual$32$rk-schedule-ScheduleEditor(Landroid/widget/EditText;Ljava/lang/String;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 10

    .line 166
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p4

    int-to-long v0, p4

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/16 v2, 0x5a0

    cmp-long v4, v0, v2

    if-gez v4, :cond_2d

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object v0, v0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-interface {v0, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p3}, Landroid/app/AlertDialog;->dismiss()V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    goto :goto_3b

    :cond_2d
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "\u041f\u043e\u043f\u0440\u0430\u0432\u043a\u0430 \u0434\u043e\u043b\u0436\u043d\u0430 \u0431\u044b\u0442\u044c \u043c\u0435\u043d\u044c\u0448\u0435 \u0441\u0443\u0442\u043e\u043a"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_35} :catch_35

    :catch_35
    move-exception p2

    const-string p2, "\u0423\u043a\u0430\u0436\u0438\u0442\u0435 \u0446\u0435\u043b\u043e\u0435 \u0447\u0438\u0441\u043b\u043e \u043c\u0438\u043d\u0443\u0442 \u043e\u0442 -1439 \u0434\u043e 1439"

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_3b
    return-void
.end method

.method synthetic lambda$manual$33$rk-schedule-ScheduleEditor(Landroid/app/AlertDialog;Landroid/widget/EditText;Ljava/lang/String;Landroid/content/DialogInterface;)V
    .registers 6

    .line 166
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->decorate(Landroid/app/AlertDialog;)V

    const/4 p4, -0x1

    invoke-virtual {p1, p4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p4

    new-instance v0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;

    invoke-direct {v0, p0, p2, p3, p1}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;-><init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;Ljava/lang/String;Landroid/app/AlertDialog;)V

    invoke-virtual {p4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$more$8$rk-schedule-ScheduleEditor()V
    .registers 4

    .line 80
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->shortDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->preview:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$newProfile$21$rk-schedule-ScheduleEditor(Landroid/widget/EditText;ZLandroid/content/DialogInterface;I)V
    .registers 5

    .line 149
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_18

    const-string p1, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435"

    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->toast(Ljava/lang/String;)V

    return-void

    :cond_18
    new-instance p3, Lrk/schedule/ScheduleStore$Profile;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p4

    invoke-virtual {p4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-direct {p3, p4, p1}, Lrk/schedule/ScheduleStore$Profile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_47

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object p1

    if-eqz p1, :cond_47

    const/4 p1, 0x0

    :goto_2e
    const/16 p2, 0x8

    if-ge p1, p2, :cond_47

    iget-object p2, p3, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object p4

    iget-object p4, p4, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object p4, p4, p1

    invoke-virtual {p4}, [I->clone()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, [I

    aput-object p4, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_2e

    :cond_47
    iget-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    iget-object p1, p1, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    iget-object p2, p3, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p3, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method synthetic lambda$onCreate$0$rk-schedule-ScheduleEditor(Landroid/content/DialogInterface;)V
    .registers 2

    .line 33
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->askClose()V

    return-void
.end method

.method synthetic lambda$profileActions$19$rk-schedule-ScheduleEditor(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 148
    new-instance p1, Lrk/schedule/ScheduleStore;

    invoke-direct {p1}, Lrk/schedule/ScheduleStore;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->draft:Lrk/schedule/ScheduleStore;

    const/4 p1, 0x0

    iput-object p1, p0, Lrk/schedule/ScheduleEditor;->selected:Ljava/lang/String;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method synthetic lambda$profileActions$20$rk-schedule-ScheduleEditor(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 148
    if-nez p2, :cond_7

    const/4 p1, 0x0

    :goto_3
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->newProfile(Z)V

    goto :goto_3e

    :cond_7
    const/4 p1, 0x1

    if-ne p2, p1, :cond_b

    goto :goto_3

    :cond_b
    const/4 p1, 0x2

    if-ne p2, p1, :cond_12

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->rename()V

    goto :goto_3e

    :cond_12
    const/4 p1, 0x3

    if-ne p2, p1, :cond_19

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->delete()V

    goto :goto_3e

    :cond_19
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u0441\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438?"

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u0418\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f \u0432\u0441\u0442\u0443\u043f\u044f\u0442 \u0432 \u0441\u0438\u043b\u0443 \u043f\u043e\u0441\u043b\u0435 \u00ab\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c\u00bb."

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda26;

    invoke-direct {p2, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda26;-><init>(Lrk/schedule/ScheduleEditor;)V

    const-string v0, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    invoke-virtual {p1, v0, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :goto_3e
    return-void
.end method

.method synthetic lambda$rename$22$rk-schedule-ScheduleEditor(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 150
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1b

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->profile()Lrk/schedule/ScheduleStore$Profile;

    move-result-object p2

    iput-object p1, p2, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    :cond_1b
    return-void
.end method

.method synthetic lambda$render$3$rk-schedule-ScheduleEditor(Landroid/view/View;)V
    .registers 2

    .line 57
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->assign()V

    return-void
.end method

.method synthetic lambda$render$4$rk-schedule-ScheduleEditor(ILandroid/view/View;)V
    .registers 3

    .line 64
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->editLesson(I)V

    return-void
.end method

.method synthetic lambda$render$5$rk-schedule-ScheduleEditor(ILandroid/view/View;)V
    .registers 3

    .line 65
    invoke-direct {p0, p1}, Lrk/schedule/ScheduleEditor;->editLesson(I)V

    return-void
.end method

.method synthetic lambda$render$6$rk-schedule-ScheduleEditor()V
    .registers 2

    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lrk/schedule/ScheduleEditor;->newProfile(Z)V

    return-void
.end method

.method synthetic lambda$render$7$rk-schedule-ScheduleEditor()V
    .registers 3

    .line 73
    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->sheet:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1, v1}, Lrk/schedule/ScheduleUi;->enter(Landroid/view/View;IZ)V

    return-void
.end method

.method public onBackPressed()V
    .registers 1

    .line 34
    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->askClose()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 2

    .line 33
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lrk/schedule/ScheduleEditor;->requestWindowFeature(I)Z

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lrk/schedule/ScheduleEditor;->setCanceledOnTouchOutside(Z)V

    new-instance p1, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda13;

    invoke-direct {p1, p0}, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda13;-><init>(Lrk/schedule/ScheduleEditor;)V

    invoke-virtual {p0, p1}, Lrk/schedule/ScheduleEditor;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    invoke-direct {p0}, Lrk/schedule/ScheduleEditor;->render()V

    return-void
.end method

.method public show()V
    .registers 6

    .line 35
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    invoke-virtual {p0}, Lrk/schedule/ScheduleEditor;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_72

    iget-object v1, p0, Lrk/schedule/ScheduleEditor;->c:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    sub-int/2addr v2, v3

    const/high16 v3, 0x43e60000    # 460.0f

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/high16 v3, 0x44200000    # 640.0f

    invoke-direct {p0, v3}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v3

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    const v4, 0x3f3851ec    # 0.72f

    mul-float v1, v1, v4

    float-to-int v1, v1

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v0, v2, v1}, Landroid/view/Window;->setLayout(II)V

    const/16 v1, 0x51

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-direct {p0, v2}, Lrk/schedule/ScheduleEditor;->dp(F)I

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    const v2, 0x3ee66666    # 0.45f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    invoke-static {p0}, Lrk/schedule/ScheduleUi;->window(Landroid/app/Dialog;)V

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->sheet:Landroid/view/View;

    if-eqz v0, :cond_72

    iget-object v0, p0, Lrk/schedule/ScheduleEditor;->sheet:Landroid/view/View;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lrk/schedule/ScheduleUi;->enter(Landroid/view/View;IZ)V

    :cond_72
    return-void
.end method
