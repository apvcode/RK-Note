.class public final Lrk/schedule/ScheduleBridge;
.super Ljava/lang/Object;
.source "ScheduleBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/schedule/ScheduleBridge$Launch;,
        Lrk/schedule/ScheduleBridge$Row;
    }
.end annotation


# static fields
.field private static volatile app:Landroid/content/Context;

.field private static final callbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lrk/schedule/DiaryContext$Stamp;",
            ">;"
        }
    .end annotation
.end field

.field private static final homeworkKeys:Lrk/schedule/WeakIdentityMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrk/schedule/WeakIdentityMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static lastActive:Ljava/lang/String;

.field private static lastProblem:Ljava/lang/String;

.field private static final launching:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lrk/schedule/ScheduleBridge$Launch;",
            ">;"
        }
    .end annotation
.end field

.field private static final mapperWorker:Ljava/util/concurrent/ExecutorService;

.field private static final mapping:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lrk/schedule/DiaryContext$Stamp;",
            ">;"
        }
    .end annotation
.end field

.field private static final owners:Lrk/schedule/DiaryContext;

.field private static final presenters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static refreshEpoch:I

.field private static root:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private static final rows:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/TextView;",
            "Lrk/schedule/ScheduleBridge$Row;",
            ">;"
        }
    .end annotation
.end field

.field private static session:Ljava/lang/Object;

.field private static volatile store:Lrk/schedule/ScheduleStore;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 16
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lrk/schedule/ScheduleBridge;->root:Ljava/lang/ref/WeakReference;

    .line 17
    new-instance v0, Lrk/schedule/DiaryContext;

    invoke-direct {v0}, Lrk/schedule/DiaryContext;-><init>()V

    sput-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    .line 19
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lrk/schedule/ScheduleBridge;->mapping:Ljava/lang/ThreadLocal;

    .line 20
    new-instance v0, Lrk/schedule/WeakIdentityMap;

    invoke-direct {v0}, Lrk/schedule/WeakIdentityMap;-><init>()V

    sput-object v0, Lrk/schedule/ScheduleBridge;->homeworkKeys:Lrk/schedule/WeakIdentityMap;

    .line 22
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lrk/schedule/ScheduleBridge;->launching:Ljava/lang/ThreadLocal;

    .line 23
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lrk/schedule/ScheduleBridge;->callbacks:Ljava/util/Map;

    .line 56
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lrk/schedule/ScheduleBridge;->presenters:Ljava/util/Map;

    .line 57
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lrk/schedule/ScheduleBridge;->rows:Ljava/util/Map;

    .line 58
    const-string v0, ""

    sput-object v0, Lrk/schedule/ScheduleBridge;->lastActive:Ljava/lang/String;

    .line 60
    sput-object v0, Lrk/schedule/ScheduleBridge;->lastProblem:Ljava/lang/String;

    .line 62
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lrk/schedule/ScheduleBridge;->mapperWorker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lrk/schedule/DiaryContext;
    .registers 1

    .line 14
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    return-object v0
.end method

.method static synthetic access$100()Landroid/content/Context;
    .registers 1

    .line 14
    sget-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    return-object v0
.end method

.method public static accountChanged(Ljava/lang/Object;)V
    .registers 8

    .line 33
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez p0, :cond_9

    move-object v3, v2

    goto :goto_1d

    :cond_9
    :try_start_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "a"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v1, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :goto_1d
    if-nez p0, :cond_21

    move-object p0, v2

    goto :goto_35

    :cond_21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "b"

    new-array v6, v1, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v4, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :goto_35
    sget-object v1, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v1, v3, p0}, Lrk/schedule/DiaryContext;->account(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_54

    invoke-static {}, Lrk/schedule/ScheduleBridge;->invalidateOwner()V
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_40} :catch_43
    .catchall {:try_start_9 .. :try_end_40} :catchall_41

    goto :goto_54

    :catchall_41
    move-exception p0

    goto :goto_56

    :catch_43
    move-exception p0

    :try_start_44
    sget-object v1, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v1, v2, v2}, Lrk/schedule/DiaryContext;->account(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4f

    invoke-static {}, Lrk/schedule/ScheduleBridge;->invalidateOwner()V

    :cond_4f
    const-string v1, "Reading account identity"

    invoke-static {v1, p0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_54
    :goto_54
    monitor-exit v0

    return-void

    :goto_56
    monitor-exit v0
    :try_end_57
    .catchall {:try_start_44 .. :try_end_57} :catchall_41

    throw p0
.end method

.method public static attach(Landroid/view/View;)V
    .registers 2

    .line 68
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lrk/schedule/ScheduleBridge;->root:Ljava/lang/ref/WeakReference;

    invoke-static {}, Lrk/schedule/ScheduleBridge;->refresh()V

    return-void
.end method

.method public static authChanging(Ljava/lang/Object;)V
    .registers 1

    .line 34
    if-nez p0, :cond_6

    const/4 p0, 0x0

    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->accountChanged(Ljava/lang/Object;)V

    :cond_6
    return-void
.end method

.method public static beginRequest(Ljava/lang/Object;)V
    .registers 5

    .line 42
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    .line 43
    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->session:Ljava/lang/Object;

    if-eqz v1, :cond_c

    sget-object v1, Lrk/schedule/ScheduleBridge;->session:Ljava/lang/Object;

    invoke-static {v1}, Lrk/schedule/ScheduleBridge;->sessionObserved(Ljava/lang/Object;)V
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_40

    .line 44
    :cond_c
    :try_start_c
    const-string v1, "e"

    invoke-static {p0, v1}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "b"

    invoke-static {v1, v2}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "a"

    invoke-static {v1, v2}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lrk/schedule/ScheduleBridge;->studentChanged(Ljava/lang/String;)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_23} :catch_24
    .catchall {:try_start_c .. :try_end_23} :catchall_40

    goto :goto_2e

    :catch_24
    move-exception v1

    const/4 v2, 0x0

    :try_start_26
    invoke-static {v2}, Lrk/schedule/ScheduleBridge;->studentChanged(Ljava/lang/String;)V

    const-string v2, "Reading selected student"

    invoke-static {v2, v1}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    :goto_2e
    sget-object v1, Lrk/schedule/ScheduleBridge;->launching:Ljava/lang/ThreadLocal;

    new-instance v2, Lrk/schedule/ScheduleBridge$Launch;

    sget-object v3, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v3}, Lrk/schedule/DiaryContext;->stamp()Lrk/schedule/DiaryContext$Stamp;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lrk/schedule/ScheduleBridge$Launch;-><init>(Ljava/lang/Object;Lrk/schedule/DiaryContext$Stamp;)V

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 46
    monitor-exit v0

    return-void

    :catchall_40
    move-exception p0

    monitor-exit v0
    :try_end_42
    .catchall {:try_start_26 .. :try_end_42} :catchall_40

    throw p0
.end method

.method public static bind(Landroid/widget/TextView;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 114
    invoke-static {p4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 115
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-virtual {p4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p4

    sput-object p4, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    sget-object p4, Lrk/schedule/ScheduleBridge;->rows:Ljava/util/Map;

    new-instance v0, Lrk/schedule/ScheduleBridge$Row;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lrk/schedule/ScheduleBridge$Row;-><init>(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-interface {p4, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lrk/schedule/ScheduleBridge;->rows:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrk/schedule/ScheduleBridge$Row;

    invoke-static {p1, p0}, Lrk/schedule/ScheduleBridge;->paint(Landroid/widget/TextView;Lrk/schedule/ScheduleBridge$Row;)V

    .line 116
    new-instance p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda7;

    invoke-direct {p0, v4, v5}, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda7;-><init>(J)V

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    return-void
.end method

.method private static boundary(Landroid/content/Context;Ljava/lang/String;JJZ)J
    .registers 22

    .line 195
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_34

    new-instance v3, Lrk/schedule/ScheduleResolver$Event;

    const-string v5, "\u0423\u0440\u043e\u043a"

    new-instance v2, Ljava/util/Date;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_6a

    move-wide/from16 v11, p2

    :try_start_12
    invoke-direct {v2, v11, v12}, Ljava/util/Date;-><init>(J)V

    invoke-static {v2}, Lrk/schedule/ScheduleResolver;->minute(Ljava/util/Date;)I

    move-result v6

    new-instance v2, Ljava/util/Date;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_1b} :catch_32

    move-wide/from16 v13, p4

    :try_start_1d
    invoke-direct {v2, v13, v14}, Ljava/util/Date;-><init>(J)V

    invoke-static {v2}, Lrk/schedule/ScheduleResolver;->minute(Ljava/util/Date;)I

    move-result v7

    const-string v10, "\u0418\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v4, p1

    invoke-direct/range {v3 .. v10}, Lrk/schedule/ScheduleResolver$Event;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Object;Ljava/lang/String;)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_38

    .line 197
    :catch_32
    move-exception v0

    goto :goto_6d

    .line 195
    :cond_34
    move-wide/from16 v11, p2

    move-wide/from16 v13, p4

    .line 196
    :goto_38
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object p0

    const/4 v3, 0x0

    invoke-static {p0, v0, v1, v2, v3}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_45
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_67

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/schedule/ScheduleResolver$Event;

    iget-object v3, v2, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    move-object/from16 v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_45

    if-eqz p6, :cond_60

    iget p0, v2, Lrk/schedule/ScheduleResolver$Event;->end:I

    goto :goto_62

    :cond_60
    iget p0, v2, Lrk/schedule/ScheduleResolver$Event;->start:I

    :goto_62
    invoke-static {v0, v1, p0}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v0
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_66} :catch_68

    return-wide v0

    .line 197
    :cond_67
    goto :goto_75

    :catch_68
    move-exception v0

    goto :goto_6f

    :catch_6a
    move-exception v0

    move-wide/from16 v11, p2

    :goto_6d
    move-wide/from16 v13, p4

    :goto_6f
    move-object p0, v0

    const-string v0, "Resolving manual correction boundary"

    invoke-static {v0, p0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_75
    if-eqz p6, :cond_78

    move-wide v11, v13

    :cond_78
    return-wide v11
.end method

.method public static capture(Ljava/lang/Object;Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "*>;)V"
        }
    .end annotation

    .line 72
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->mapping:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/schedule/DiaryContext$Stamp;

    sget-object v2, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v2, v1}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v2

    if-nez v2, :cond_15

    monitor-exit v0

    return-void

    :cond_15
    sget-object v2, Lrk/schedule/ScheduleBridge;->presenters:Ljava/util/Map;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v2, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1, v1}, Lrk/schedule/ScheduleBridge;->captureDays(Ljava/util/List;Lrk/schedule/DiaryContext$Stamp;)V

    monitor-exit v0

    return-void

    :catchall_21
    move-exception p0

    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw p0
.end method

.method private static captureDays(Ljava/util/List;Lrk/schedule/DiaryContext$Stamp;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;",
            "Lrk/schedule/DiaryContext$Stamp;",
            ")V"
        }
    .end annotation

    .line 74
    const-string v1, "e"

    if-nez p0, :cond_5

    return-void

    .line 75
    :cond_5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_97

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 76
    :try_start_13
    const-string v2, "a"

    invoke-static {v0, v2}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Date;

    invoke-static {v0, v1}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v3, v0, Ljava/util/List;

    if-nez v3, :cond_24

    goto :goto_9

    .line 77
    :cond_24
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 78
    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_84

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "la.h"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4f

    goto :goto_34

    :cond_4f
    sget-object v5, Lrk/schedule/ScheduleBridge;->homeworkKeys:Lrk/schedule/WeakIdentityMap;

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-static {p1, v6, v7, v12, v4}, Lrk/schedule/ScheduleBridge;->lessonKey(Lrk/schedule/DiaryContext$Stamp;JLjava/lang/Object;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v12, v6}, Lrk/schedule/WeakIdentityMap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v6, Lrk/schedule/ScheduleResolver$Event;

    const-string v5, "d"

    invoke-static {v12, v5}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Ljava/lang/String;

    const-string v5, "c"

    invoke-static {v12, v5}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Ljava/lang/String;

    invoke-static {v12, v1}, Lrk/schedule/ScheduleBridge;->lessonMinute(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v9

    const-string v5, "f"

    invoke-static {v12, v5}, Lrk/schedule/ScheduleBridge;->lessonMinute(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v10

    const-string v13, "\u0418\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v13}, Lrk/schedule/ScheduleResolver$Event;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_34

    .line 79
    :cond_84
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v0, p1, v4, v5, v3}, Lrk/schedule/DiaryContext;->put(Lrk/schedule/DiaryContext$Stamp;JLjava/util/List;)V
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_8d} :catch_8f

    .line 80
    goto/16 :goto_9

    :catch_8f
    move-exception v0

    const-string v2, "Reading diary day"

    invoke-static {v2, v0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 81
    :cond_97
    return-void
.end method

.method private static capturePositions(Landroid/view/View;Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "[",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 189
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "androidx.recyclerview.widget.RecyclerView"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_49

    :try_start_11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "getLayoutManager"

    new-array v3, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_49

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "onSaveInstanceState"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v1

    const/4 v0, 0x1

    aput-object v2, v3, v0

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_42} :catch_43

    goto :goto_49

    :catch_43
    move-exception v0

    const-string v2, "Saving diary position"

    invoke-static {v2, v0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 190
    :cond_49
    :goto_49
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_60

    :goto_4d
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_60

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p1}, Lrk/schedule/ScheduleBridge;->capturePositions(Landroid/view/View;Ljava/util/List;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_4d

    .line 191
    :cond_60
    return-void
.end method

.method public static clearShift(Landroid/content/Context;)V
    .registers 3

    .line 85
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v0

    invoke-virtual {v0}, Lrk/schedule/ScheduleStore;->copy()Lrk/schedule/ScheduleStore;

    move-result-object v0

    iget-object v1, v0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    invoke-virtual {v0, p0}, Lrk/schedule/ScheduleStore;->save(Landroid/content/Context;)V

    sput-object v0, Lrk/schedule/ScheduleBridge;->store:Lrk/schedule/ScheduleStore;

    const-string v0, "manual_bell_correction"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static commit(Landroid/content/Context;Lrk/schedule/ScheduleStore;)V
    .registers 2

    .line 158
    invoke-virtual {p1}, Lrk/schedule/ScheduleStore;->copy()Lrk/schedule/ScheduleStore;

    move-result-object p1

    invoke-static {p1}, Lrk/schedule/ScheduleBridge;->validate(Lrk/schedule/ScheduleStore;)V

    invoke-virtual {p1, p0}, Lrk/schedule/ScheduleStore;->save(Landroid/content/Context;)V

    sput-object p1, Lrk/schedule/ScheduleBridge;->store:Lrk/schedule/ScheduleStore;

    invoke-static {}, Lrk/schedule/ScheduleBridge;->refresh()V

    return-void
.end method

.method public static context()Landroid/content/Context;
    .registers 1

    .line 69
    sget-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    return-object v0
.end method

.method public static current(Lrk/schedule/DiaryContext$Stamp;)Z
    .registers 2

    .line 25
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0, p0}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result p0

    return p0
.end method

.method public static currentOwner(Ljava/lang/String;)Z
    .registers 2

    .line 31
    if-eqz p0, :cond_14

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-static {}, Lrk/schedule/ScheduleBridge;->owner()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    goto :goto_15

    :cond_14
    const/4 p0, 0x0

    :goto_15
    return p0
.end method

.method public static dayType(Ljava/lang/String;Ljava/util/Date;)Ljava/lang/String;
    .registers 5

    .line 91
    sget-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    if-eqz v0, :cond_20

    sget-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {v0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lrk/schedule/ScheduleStore;->homeroom(J)Lrk/schedule/ScheduleResolver$Homeroom;

    move-result-object p1

    if-eqz p1, :cond_20

    iget-object p1, p1, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    const-string v0, "separate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_20

    const-string p0, "study"

    :cond_20
    return-object p0
.end method

.method public static diary(J)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;"
        }
    .end annotation

    .line 83
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0, p0, p1}, Lrk/schedule/DiaryContext;->get(J)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static displayLessons(Ljava/lang/Object;Ljava/util/Date;)Ljava/lang/Object;
    .registers 24

    .line 92
    move-object/from16 v1, p0

    sget-object v2, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v2

    .line 93
    :try_start_5
    sget-object v0, Lrk/schedule/ScheduleBridge;->mapping:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lrk/schedule/DiaryContext$Stamp;

    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0, v3}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    monitor-exit v2

    return-object v0

    .line 94
    :cond_1c
    sget-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    if-eqz v0, :cond_1d5

    instance-of v0, v1, Ljava/util/List;
    :try_end_22
    .catchall {:try_start_5 .. :try_end_22} :catchall_1d9

    if-nez v0, :cond_28

    move-object/from16 v18, v2

    goto/16 :goto_1d7

    .line 96
    :cond_28
    :try_start_28
    invoke-virtual/range {p1 .. p1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 97
    move-object v4, v1

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_38
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    new-instance v8, Lrk/schedule/ScheduleResolver$Event;

    const-string v5, "d"

    invoke-static {v14, v5}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Ljava/lang/String;

    const-string v5, "c"

    invoke-static {v14, v5}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Ljava/lang/String;

    const-string v5, "e"

    invoke-static {v14, v5}, Lrk/schedule/ScheduleBridge;->lessonMinute(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v11

    const-string v5, "f"

    invoke-static {v14, v5}, Lrk/schedule/ScheduleBridge;->lessonMinute(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v12

    const-string v15, "\u0418\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v15}, Lrk/schedule/ScheduleResolver$Event;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_38

    .line 98
    :cond_6c
    sget-object v4, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v4, v3, v6, v7, v0}, Lrk/schedule/DiaryContext;->put(Lrk/schedule/DiaryContext$Stamp;JLjava/util/List;)V

    .line 99
    sget-object v4, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {v4}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v4

    const/4 v10, 0x1

    invoke-static {v4, v6, v7, v0, v10}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    move-result-object v4

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 100
    const-string v5, "la.h"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v5

    const/4 v12, 0x0

    aget-object v13, v5, v12

    .line 101
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_92
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_169

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrk/schedule/ScheduleResolver$Event;

    iget-object v5, v4, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    if-nez v5, :cond_a7

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v8

    goto :goto_ad

    :cond_a7
    const-string v8, "a"

    invoke-static {v5, v8}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    :goto_ad
    if-nez v5, :cond_b4

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v9

    goto :goto_ba

    :cond_b4
    const-string v9, "b"

    invoke-static {v5, v9}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    :goto_ba
    iget-object v15, v4, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    const/16 p1, 0x1

    iget-object v10, v4, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    const/16 v16, 0x0

    new-instance v12, Ljava/util/Date;

    move-object/from16 v17, v0

    iget v0, v4, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {v6, v7, v0}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v0

    invoke-direct {v12, v0, v1}, Ljava/util/Date;-><init>(J)V

    new-instance v0, Ljava/util/Date;

    iget v1, v4, Lrk/schedule/ScheduleResolver$Event;->end:I
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_d3} :catch_1bc
    .catchall {:try_start_28 .. :try_end_d3} :catchall_1d9

    move-object/from16 v18, v2

    :try_start_d5
    invoke-static {v6, v7, v1}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    if-nez v5, :cond_e1

    const-string v1, ""

    goto :goto_e7

    :cond_e1
    const-string v1, "g"

    invoke-static {v5, v1}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    :goto_e7
    iget v2, v4, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    if-nez v5, :cond_f8

    const/16 v19, 0x0

    move-object/from16 v21, v19

    move-object/from16 v19, v0

    move-object/from16 v0, v21

    goto :goto_100

    :cond_f8
    move-object/from16 v19, v0

    const-string v0, "i"

    invoke-static {v5, v0}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    :goto_100
    move-object/from16 v20, v0

    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/Object;

    aput-object v8, v0, v16

    aput-object v9, v0, p1

    const/4 v8, 0x2

    aput-object v15, v0, v8

    const/4 v8, 0x3

    aput-object v10, v0, v8

    const/4 v8, 0x4

    aput-object v12, v0, v8

    const/4 v8, 0x5

    aput-object v19, v0, v8

    const/4 v8, 0x6

    aput-object v1, v0, v8

    const/4 v1, 0x7

    aput-object v2, v0, v1

    const/16 v1, 0x8

    aput-object v20, v0, v1

    invoke-virtual {v13, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v1
    :try_end_127
    .catch Ljava/lang/Exception; {:try_start_d5 .. :try_end_127} :catch_1ba
    .catchall {:try_start_d5 .. :try_end_127} :catchall_1de

    :try_start_127
    sget-object v2, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v2, v3}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v2

    if-nez v2, :cond_136

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    monitor-exit v1
    :try_end_134
    .catchall {:try_start_127 .. :try_end_134} :catchall_166

    :try_start_134
    monitor-exit v18
    :try_end_135
    .catchall {:try_start_134 .. :try_end_135} :catchall_1de

    return-object v0

    :cond_136
    if-nez v5, :cond_149

    :try_start_138
    new-instance v2, Lrk/diary/PersonalHomeworkStore$Id;

    iget-object v5, v3, Lrk/schedule/DiaryContext$Stamp;->owner:Ljava/lang/String;

    const-string v8, "homeroom"

    iget-object v9, v4, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    move-object v4, v2

    invoke-direct/range {v4 .. v9}, Lrk/diary/PersonalHomeworkStore$Id;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Lrk/diary/PersonalHomeworkStore$Id;->key()Ljava/lang/String;

    move-result-object v2

    goto :goto_151

    :cond_149
    sget-object v2, Lrk/schedule/ScheduleBridge;->homeworkKeys:Lrk/schedule/WeakIdentityMap;

    invoke-virtual {v2, v5}, Lrk/schedule/WeakIdentityMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :goto_151
    if-eqz v2, :cond_158

    sget-object v4, Lrk/schedule/ScheduleBridge;->homeworkKeys:Lrk/schedule/WeakIdentityMap;

    invoke-virtual {v4, v0, v2}, Lrk/schedule/WeakIdentityMap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_158
    monitor-exit v1
    :try_end_159
    .catchall {:try_start_138 .. :try_end_159} :catchall_166

    :try_start_159
    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_15c
    .catch Ljava/lang/Exception; {:try_start_159 .. :try_end_15c} :catch_1ba
    .catchall {:try_start_159 .. :try_end_15c} :catchall_1de

    move-object/from16 v1, p0

    move-object/from16 v0, v17

    move-object/from16 v2, v18

    const/4 v10, 0x1

    const/4 v12, 0x0

    goto/16 :goto_92

    :catchall_166
    move-exception v0

    :try_start_167
    monitor-exit v1
    :try_end_168
    .catchall {:try_start_167 .. :try_end_168} :catchall_166

    :try_start_168
    throw v0

    .line 103
    :cond_169
    move-object/from16 v17, v0

    move-object/from16 v18, v2

    const/16 p1, 0x1

    const/16 v16, 0x0

    sget-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {v0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Lrk/schedule/ScheduleStore;->active(J)Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    .line 104
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_17f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/schedule/ScheduleResolver$Event;

    .line 105
    iget-object v4, v2, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-static {v4}, Lrk/schedule/ScheduleResolver;->number(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    .line 106
    if-eqz v0, :cond_1a6

    if-ltz v4, :cond_1a6

    iget-object v5, v0, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    array-length v5, v5

    if-ge v4, v5, :cond_1a6

    iget-object v5, v0, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v4, v5, v4

    aget v4, v4, v16

    if-ltz v4, :cond_1a6

    const/4 v4, 0x1

    goto :goto_1a7

    :cond_1a6
    const/4 v4, 0x0

    .line 107
    :goto_1a7
    iget v5, v2, Lrk/schedule/ScheduleResolver$Event;->start:I

    if-ltz v5, :cond_1af

    iget v5, v2, Lrk/schedule/ScheduleResolver$Event;->end:I

    if-gez v5, :cond_1b6

    :cond_1af
    if-nez v4, :cond_1b6

    iget-object v2, v2, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    invoke-interface {v11, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1b6
    .catch Ljava/lang/Exception; {:try_start_168 .. :try_end_1b6} :catch_1ba
    .catchall {:try_start_168 .. :try_end_1b6} :catchall_1de

    .line 108
    :cond_1b6
    nop

    .line 109
    goto :goto_17f

    .line 110
    :cond_1b8
    :try_start_1b8
    monitor-exit v18

    return-object v11

    .line 111
    :catch_1ba
    move-exception v0

    goto :goto_1bf

    :catch_1bc
    move-exception v0

    move-object/from16 v18, v2

    :goto_1bf
    const-string v1, "Rendering schedule; keeping original diary"

    invoke-static {v1, v0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0, v3}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v0

    if-eqz v0, :cond_1cf

    move-object/from16 v0, p0

    goto :goto_1d3

    :cond_1cf
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_1d3
    monitor-exit v18

    return-object v0

    .line 94
    :cond_1d5
    move-object/from16 v18, v2

    :goto_1d7
    monitor-exit v18

    return-object p0

    .line 112
    :catchall_1d9
    move-exception v0

    move-object/from16 v18, v2

    :goto_1dc
    monitor-exit v18
    :try_end_1dd
    .catchall {:try_start_1b8 .. :try_end_1dd} :catchall_1de

    throw v0

    :catchall_1de
    move-exception v0

    goto :goto_1dc
.end method

.method public static end(Landroid/content/Context;Ljava/lang/String;JJ)J
    .registers 13

    .line 193
    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v6}, Lrk/schedule/ScheduleBridge;->boundary(Landroid/content/Context;Ljava/lang/String;JJZ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static endRequest()V
    .registers 1

    .line 47
    sget-object v0, Lrk/schedule/ScheduleBridge;->launching:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    return-void
.end method

.method public static enterCallback(Ljava/lang/Object;)Z
    .registers 3

    .line 49
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->callbacks:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrk/schedule/DiaryContext$Stamp;

    sget-object v1, Lrk/schedule/ScheduleBridge;->mapping:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    sget-object v1, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v1, p0}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result p0

    monitor-exit v0

    return p0

    :catchall_18
    move-exception p0

    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw p0
.end method

.method static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static homeworkKey(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 50
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->homeworkKeys:Lrk/schedule/WeakIdentityMap;

    invoke-virtual {v1, p0}, Lrk/schedule/WeakIdentityMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lrk/diary/PersonalHomeworkStore$Id;->parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object v1

    if-eqz v1, :cond_1a

    iget-object v1, v1, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    invoke-static {v1}, Lrk/schedule/ScheduleBridge;->currentOwner(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    monitor-exit v0

    return-object p0

    :catchall_1d
    move-exception p0

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw p0
.end method

.method public static homeworkModel(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 51
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    sget-object v2, Lrk/schedule/ScheduleBridge;->mapping:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/schedule/DiaryContext$Stamp;

    invoke-virtual {v1, v2}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v1

    if-eqz v1, :cond_22

    sget-object v1, Lrk/schedule/ScheduleBridge;->homeworkKeys:Lrk/schedule/WeakIdentityMap;

    invoke-virtual {v1, p1}, Lrk/schedule/WeakIdentityMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_22

    sget-object v1, Lrk/schedule/ScheduleBridge;->homeworkKeys:Lrk/schedule/WeakIdentityMap;

    invoke-virtual {v1, p0, p1}, Lrk/schedule/WeakIdentityMap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_22
    monitor-exit v0

    return-void

    :catchall_24
    move-exception p0

    monitor-exit v0
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_24

    throw p0
.end method

.method public static init(Landroid/content/Context;)V
    .registers 1

    .line 67
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    return-void
.end method

.method private static invalidateOwner()V
    .registers 3

    .line 37
    sget-object v0, Lrk/schedule/ScheduleBridge;->presenters:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lrk/schedule/ScheduleBridge;->presenters:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_43

    .line 38
    sget-object v0, Lrk/schedule/ScheduleBridge;->presenters:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    sget-object v0, Lrk/schedule/ScheduleBridge;->homeworkKeys:Lrk/schedule/WeakIdentityMap;

    invoke-virtual {v0}, Lrk/schedule/WeakIdentityMap;->clear()V

    sget v0, Lrk/schedule/ScheduleBridge;->refreshEpoch:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lrk/schedule/ScheduleBridge;->refreshEpoch:I

    const-string v0, ""

    sput-object v0, Lrk/schedule/ScheduleBridge;->lastActive:Ljava/lang/String;

    .line 39
    new-instance v0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1}, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;)V

    .line 40
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_36

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_42

    :cond_36
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 41
    :goto_42
    return-void

    .line 37
    :catchall_43
    move-exception v1

    :try_start_44
    monitor-exit v0
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_43

    throw v1
.end method

.method static synthetic lambda$bind$1(JLandroid/view/View;)V
    .registers 3

    .line 116
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p0, p1}, Lrk/schedule/ScheduleEditor;->show(Landroid/content/Context;J)V

    return-void
.end method

.method static synthetic lambda$invalidateOwner$0(Ljava/util/List;)V
    .registers 10

    .line 39
    const-string v0, ""

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    :try_start_10
    sget-object v2, Lrk/schedule/ScheduleBridge;->presenters:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    goto :goto_6

    :cond_19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getViewState"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "U"

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v4

    const-class v7, Ljava/util/List;

    const/4 v8, 0x1

    aput-object v7, v6, v8

    invoke-virtual {v2, v3, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v4

    aput-object v6, v5, v8

    invoke-virtual {v2, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_54} :catch_55

    goto :goto_6

    :catch_55
    move-exception v1

    const-string v2, "Clearing diary presentation"

    invoke-static {v2, v1}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    :cond_5c
    new-instance p0, Ljava/util/ArrayList;

    sget-object v1, Lrk/schedule/ScheduleBridge;->rows:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {p0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_6b
    :goto_6b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_91

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    sget-object v2, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrk/schedule/ScheduleBridge$Row;

    iget-object v3, v3, Lrk/schedule/ScheduleBridge$Row;->stamp:Lrk/schedule/DiaryContext$Stamp;

    invoke-virtual {v2, v3}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v2

    if-nez v2, :cond_6b

    sget-object v2, Lrk/schedule/ScheduleBridge;->rows:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6b

    :cond_91
    invoke-static {}, Lrk/diary/DiaryUi;->clearBindings()V

    :try_start_94
    const-string p0, "sLessons"

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-static {p0, v1}, Lrk/schedule/ScheduleBridge;->setManager(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p0, "sCurrentActiveLessonNum"

    invoke-static {p0, v0}, Lrk/schedule/ScheduleBridge;->setManager(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p0, "sPrevAdjustedEnd"

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {p0, v3}, Lrk/schedule/ScheduleBridge;->setManager(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p0, "sPrevOrigEnd"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p0, v1}, Lrk/schedule/ScheduleBridge;->setManager(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p0, "sLastUiTitle"

    invoke-static {p0, v0}, Lrk/schedule/ScheduleBridge;->setManager(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p0, "sContainer"

    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->manager(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_d1

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
    :try_end_ca
    .catch Ljava/lang/Exception; {:try_start_94 .. :try_end_ca} :catch_cb

    goto :goto_d1

    :catch_cb
    move-exception p0

    const-string v0, "Clearing diary owner"

    invoke-static {v0, p0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_d1
    :goto_d1
    invoke-static {}, Lrk/schedule/ScheduleBridge;->owner()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_e8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_e8

    invoke-static {}, Lrk/schedule/ScheduleBridge;->tick()V

    :cond_e8
    return-void
.end method

.method static synthetic lambda$refresh$2(Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;)V
    .registers 8

    .line 181
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0, p0}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result p0

    if-eqz p0, :cond_4c

    sget p0, Lrk/schedule/ScheduleBridge;->refreshEpoch:I

    if-ne p1, p0, :cond_4c

    sget-object p0, Lrk/schedule/ScheduleBridge;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eq p0, p2, :cond_15

    goto :goto_4c

    :cond_15
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    const/4 p2, 0x0

    :try_start_26
    aget-object p3, p1, p2

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    const-string v0, "onRestoreInstanceState"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/os/Parcelable;

    aput-object v3, v2, p2

    invoke-virtual {p3, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    aget-object v0, p1, p2

    aget-object p1, p1, v1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, p2

    invoke-virtual {p3, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_44} :catch_45

    goto :goto_19

    :catch_45
    move-exception p1

    const-string p2, "Restoring diary position"

    invoke-static {p2, p1}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_19

    :cond_4c
    :goto_4c
    return-void
.end method

.method static synthetic lambda$refresh$3(Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;Ljava/util/List;)V
    .registers 14

    .line 179
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0, p0}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v0

    if-eqz v0, :cond_78

    sget v0, Lrk/schedule/ScheduleBridge;->refreshEpoch:I

    if-ne p1, v0, :cond_78

    sget-object v0, Lrk/schedule/ScheduleBridge;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p2, :cond_15

    goto :goto_78

    .line 180
    :cond_15
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_19
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6a

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    :try_start_26
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getViewState"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    aget-object v3, v0, v1

    new-array v4, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "U"

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Class;

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v7, v6, v1

    const-class v7, Ljava/util/List;

    const/4 v8, 0x1

    aput-object v7, v6, v8

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aget-object v0, v0, v8

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v4, v5, v1

    aput-object v0, v5, v8

    invoke-virtual {v3, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_62} :catch_63

    goto :goto_19

    :catch_63
    move-exception v0

    const-string v1, "Applying diary presentation"

    invoke-static {v1, v0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_19

    .line 181
    :cond_6a
    if-eqz p2, :cond_74

    new-instance p3, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;

    invoke-direct {p3, p0, p1, p2, p4}, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;-><init>(Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 182
    :cond_74
    invoke-static {}, Lrk/schedule/ScheduleBridge;->tick()V

    .line 183
    return-void

    .line 179
    :cond_78
    :goto_78
    return-void
.end method

.method static synthetic lambda$refresh$4(Ljava/util/List;Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;)V
    .registers 16

    .line 170
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 171
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 172
    const/4 v1, 0x0

    :try_start_16
    aget-object v2, v0, v1

    const-string v3, "la.e"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/Object;

    aput-object v7, v6, v1

    const-class v7, Ljava/lang/Throwable;

    const/4 v8, 0x1

    aput-object v7, v6, v8

    invoke-virtual {v3, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    aget-object v0, v0, v8

    new-array v6, v5, [Ljava/lang/Object;

    aput-object v0, v6, v1

    const/4 v0, 0x0

    aput-object v0, v6, v8

    invoke-virtual {v3, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 173
    const-string v3, "h6.a"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    new-array v7, v5, [Ljava/lang/Class;

    aput-object v6, v7, v1

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v7, v8

    invoke-virtual {v3, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-array v9, v5, [Ljava/lang/Object;

    aput-object v2, v9, v1

    aput-object v7, v9, v8

    invoke-virtual {v6, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 174
    sget-object v7, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v7
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_62} :catch_99

    :try_start_62
    sget-object v9, Lrk/schedule/ScheduleBridge;->callbacks:Ljava/util/Map;

    invoke-interface {v9, v6, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v7
    :try_end_68
    .catchall {:try_start_62 .. :try_end_68} :catchall_96

    .line 175
    :try_start_68
    sget-object v7, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v7, p1}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v7

    if-nez v7, :cond_71

    return-void

    .line 176
    :cond_71
    const-string v7, "invoke"

    new-array v9, v8, [Ljava/lang/Class;

    const-class v10, Ljava/lang/Object;

    aput-object v10, v9, v1

    invoke-virtual {v3, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v7, v8, [Ljava/lang/Object;

    aput-object v0, v7, v1

    invoke-virtual {v3, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v3, "a"

    invoke-static {v0, v3}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    new-array v3, v5, [Ljava/lang/Object;

    aput-object v2, v3, v1

    aput-object v0, v3, v8

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_94
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_94} :catch_99

    .line 177
    goto/16 :goto_9

    .line 174
    :catchall_96
    move-exception v0

    :try_start_97
    monitor-exit v7
    :try_end_98
    .catchall {:try_start_97 .. :try_end_98} :catchall_96

    :try_start_98
    throw v0
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_98 .. :try_end_99} :catch_99

    .line 177
    :catch_99
    move-exception v0

    const-string v1, "Refreshing diary presentation"

    invoke-static {v1, v0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 178
    :cond_a1
    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda1;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda1;-><init>(Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 184
    return-void
.end method

.method static synthetic lambda$refresh$5(Lrk/schedule/DiaryContext$Stamp;)V
    .registers 11

    .line 162
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0, p0}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    .line 163
    :cond_9
    sget-object v0, Lrk/schedule/ScheduleBridge;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/view/View;

    .line 164
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    if-eqz v5, :cond_1c

    invoke-static {v5, v6}, Lrk/schedule/ScheduleBridge;->capturePositions(Landroid/view/View;Ljava/util/List;)V

    .line 165
    :cond_1c
    sget-object v1, Lrk/schedule/ScheduleBridge;->presenters:Ljava/util/Map;

    monitor-enter v1

    :try_start_1f
    new-instance v0, Ljava/util/ArrayList;

    sget-object v2, Lrk/schedule/ScheduleBridge;->presenters:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1
    :try_end_2b
    .catchall {:try_start_1f .. :try_end_2b} :catchall_72

    .line 166
    sget v1, Lrk/schedule/ScheduleBridge;->refreshEpoch:I

    const/4 v2, 0x1

    add-int/lit8 v4, v1, 0x1

    sput v4, Lrk/schedule/ScheduleBridge;->refreshEpoch:I

    const/4 v1, 0x1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 167
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3c
    :goto_3c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_63

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    :try_start_46
    const-string v7, "h"

    invoke-static {v0, v7}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    instance-of v8, v7, Ljava/util/List;

    if-eqz v8, :cond_3c

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    aput-object v7, v8, v1

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_5b} :catch_5c

    goto :goto_3c

    :catch_5c
    move-exception v0

    const-string v7, "Reading diary presentation"

    invoke-static {v7, v0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3c

    .line 169
    :cond_63
    sget-object v0, Lrk/schedule/ScheduleBridge;->mapperWorker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;

    move-object v3, p0

    invoke-direct/range {v1 .. v6}, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;-><init>(Ljava/util/List;Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 185
    invoke-static {}, Lrk/schedule/ScheduleBridge;->tick()V

    .line 186
    return-void

    .line 165
    :catchall_72
    move-exception v0

    move-object p0, v0

    :try_start_74
    monitor-exit v1
    :try_end_75
    .catchall {:try_start_74 .. :try_end_75} :catchall_72

    throw p0
.end method

.method static synthetic lambda$reset$6(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 200
    :try_start_0
    new-instance p1, Lrk/schedule/ScheduleStore;

    invoke-direct {p1}, Lrk/schedule/ScheduleStore;-><init>()V

    invoke-virtual {p1, p0}, Lrk/schedule/ScheduleStore;->save(Landroid/content/Context;)V

    sput-object p1, Lrk/schedule/ScheduleBridge;->store:Lrk/schedule/ScheduleStore;

    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->clearShift(Landroid/content/Context;)V

    invoke-static {}, Lrk/schedule/ScheduleBridge;->refresh()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_11

    goto :goto_1e

    :catch_11
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_1e
    return-void
.end method

.method private static lessonKey(Lrk/schedule/DiaryContext$Stamp;JLjava/lang/Object;Ljava/util/Map;)Ljava/lang/String;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrk/schedule/DiaryContext$Stamp;",
            "J",
            "Ljava/lang/Object;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 53
    const-string v0, "c"

    invoke-static {p3, v0}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Ljava/lang/String;

    const-string v0, "d"

    invoke-static {p3, v0}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-interface {p4, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_23

    invoke-interface {p4, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v1, v0

    :cond_23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p4, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    move p4, v1

    new-instance v1, Lrk/diary/PersonalHomeworkStore$Id;

    iget-object v2, p0, Lrk/schedule/DiaryContext$Stamp;->owner:Ljava/lang/String;

    if-eqz p3, :cond_4c

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_3c

    goto :goto_4c

    :cond_3c
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "number:"

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    goto :goto_5b

    :cond_4c
    :goto_4c
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "occurrence:"

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    :goto_5b
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    move-object v5, p0

    move-wide v3, p1

    invoke-direct/range {v1 .. v6}, Lrk/diary/PersonalHomeworkStore$Id;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lrk/diary/PersonalHomeworkStore$Id;->key()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static lessonMinute(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 82
    invoke-static {p0, p1}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Date;

    if-nez p0, :cond_a

    const/4 p0, -0x1

    goto :goto_e

    :cond_a
    invoke-static {p0}, Lrk/schedule/ScheduleResolver;->minute(Ljava/util/Date;)I

    move-result p0

    :goto_e
    return p0
.end method

.method private static lessonTitle(Lrk/schedule/ScheduleResolver$Event;)Ljava/lang/String;
    .registers 6

    .line 131
    const-string v0, "\u043a\u0430\u0431. "

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    const-string v3, ""

    if-eqz v2, :cond_2c

    iget-object v2, p0, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_16

    goto :goto_2c

    :cond_16
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " \u0443\u0440\u043e\u043a: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2d

    :cond_2c
    :goto_2c
    move-object v2, v3

    :goto_2d
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 132
    :try_start_3b
    iget-object v2, p0, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    const/4 v4, 0x0

    if-nez v2, :cond_42

    move-object p0, v4

    goto :goto_4a

    :cond_42
    iget-object p0, p0, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    const-string v2, "i"

    invoke-static {p0, v2}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    :goto_4a
    if-nez p0, :cond_4d

    :goto_4c
    goto :goto_57

    :cond_4d
    const-string v2, "b"

    invoke-static {p0, v2}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    move-object v4, p0

    check-cast v4, Ljava/lang/String;

    goto :goto_4c

    :goto_57
    if-eqz v4, :cond_97

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_97

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, " ("

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7c

    const-string v2, "\u041a\u0430\u0431. "

    invoke-virtual {v4, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7d

    :cond_7c
    move-object v0, v3

    :cond_7d
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, ")"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_8f} :catch_91

    move-object v1, p0

    goto :goto_97

    :catch_91
    move-exception p0

    const-string v0, "Reading lesson room"

    invoke-static {v0, p0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_97
    :goto_97
    return-object v1
.end method

.method static log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3

    .line 71
    const-string v0, "RKSchedule"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method static manager(Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 65
    const-string v0, "c7.LessonCountdownManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static open(Landroid/content/Context;)V
    .registers 3

    .line 199
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lrk/schedule/ScheduleEditor;->show(Landroid/content/Context;J)V

    return-void
.end method

.method public static owner()Ljava/lang/String;
    .registers 2

    .line 30
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v1}, Lrk/schedule/DiaryContext;->owner()Ljava/lang/String;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_b
    move-exception v1

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1
.end method

.method public static ownerLabel()Ljava/lang/String;
    .registers 1

    .line 26
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0}, Lrk/schedule/DiaryContext;->label()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static ownerStamp()Lrk/schedule/DiaryContext$Stamp;
    .registers 1

    .line 24
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0}, Lrk/schedule/DiaryContext;->stamp()Lrk/schedule/DiaryContext$Stamp;

    move-result-object v0

    return-object v0
.end method

.method private static paint(Landroid/widget/TextView;Lrk/schedule/ScheduleBridge$Row;)V
    .registers 10

    .line 120
    sget-object v0, Lrk/schedule/ScheduleBridge;->lastActive:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_29

    iget-wide v2, p1, Lrk/schedule/ScheduleBridge$Row;->day:J

    invoke-static {v2, v3}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    sget-object v0, Lrk/schedule/ScheduleBridge;->lastActive:Ljava/lang/String;

    iget-object v2, p1, Lrk/schedule/ScheduleBridge$Row;->slot:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    const/4 v0, 0x1

    goto :goto_2a

    :cond_29
    const/4 v0, 0x0

    .line 121
    :goto_2a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v0, :cond_34

    const-string v3, "\u0421\u0435\u0439\u0447\u0430\u0441 \u00b7 "

    goto :goto_36

    :cond_34
    const-string v3, ""

    :goto_36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lrk/schedule/ScheduleBridge$Row;->original:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_51

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    :cond_51
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "getAccentColor"

    const v5, -0xf57b01

    invoke-static {v3, v4, v5}, Lrk/schedule/ScheduleBridge;->themeColor(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lrk/schedule/ScheduleBridge;->textColor(Landroid/content/Context;)I

    move-result v5

    const v6, -0xe8dfd4

    if-ne v5, v6, :cond_6f

    const v5, -0x9b8f7c

    goto :goto_72

    :cond_6f
    const v5, -0x5f584c

    .line 123
    :goto_72
    iget-boolean v6, p1, Lrk/schedule/ScheduleBridge$Row;->styled:Z

    if-eqz v6, :cond_7e

    iget-boolean v6, p1, Lrk/schedule/ScheduleBridge$Row;->active:Z

    if-ne v6, v0, :cond_7e

    iget v6, p1, Lrk/schedule/ScheduleBridge$Row;->accent:I

    if-eq v6, v3, :cond_a3

    :cond_7e
    if-eqz v0, :cond_88

    const v6, 0xffffff

    and-int/2addr v6, v3

    const/high16 v7, 0x1a000000

    or-int/2addr v6, v7

    goto :goto_91

    :cond_88
    const-string v6, "getThemeSurfaceColor"

    const v7, -0xe8e8de

    invoke-static {v4, v6, v7}, Lrk/schedule/ScheduleBridge;->themeColor(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v6

    :goto_91
    const/16 v7, 0x8

    invoke-static {v4, v6, v7}, Lrk/schedule/ScheduleUi;->shape(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0, v3}, Lrk/schedule/ScheduleUi;->press(Landroid/view/View;I)V

    iput-boolean v1, p1, Lrk/schedule/ScheduleBridge$Row;->styled:Z

    iput-boolean v0, p1, Lrk/schedule/ScheduleBridge$Row;->active:Z

    iput v3, p1, Lrk/schedule/ScheduleBridge$Row;->accent:I

    .line 124
    :cond_a3
    if-eqz v0, :cond_a7

    move v1, v3

    goto :goto_a8

    :cond_a7
    move v1, v5

    :goto_a8
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lrk/schedule/ScheduleBridge$Row;->source:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p0, p1, Lrk/schedule/ScheduleBridge$Row;->number:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_d8

    if-eqz v0, :cond_d4

    goto :goto_d5

    :cond_d4
    move v3, v5

    :goto_d5
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 126
    :cond_d8
    return-void
.end method

.method public static parseDate(Ljava/lang/String;)J
    .registers 3

    .line 157
    invoke-static {p0}, Lrk/schedule/ScheduleResolver;->date(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static refresh()V
    .registers 3

    .line 160
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0}, Lrk/schedule/DiaryContext;->stamp()Lrk/schedule/DiaryContext$Stamp;

    move-result-object v0

    .line 161
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda3;

    invoke-direct {v2, v0}, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda3;-><init>(Lrk/schedule/DiaryContext$Stamp;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 187
    return-void
.end method

.method public static requestCallback(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6

    .line 48
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->launching:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/schedule/ScheduleBridge$Launch;

    sget-object v2, Lrk/schedule/ScheduleBridge;->callbacks:Ljava/util/Map;

    if-eqz v1, :cond_1a

    iget-object v3, v1, Lrk/schedule/ScheduleBridge$Launch;->presenter:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p1, :cond_1a

    iget-object p1, v1, Lrk/schedule/ScheduleBridge$Launch;->stamp:Lrk/schedule/DiaryContext$Stamp;

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    :goto_1b
    invoke-interface {v2, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :catchall_20
    move-exception p0

    monitor-exit v0
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_20

    throw p0
.end method

.method public static requestTick()V
    .registers 2

    .line 134
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda6;

    invoke-direct {v1}, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda6;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private static requireOwner(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore$Id;)V
    .registers 3

    .line 29
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v0, p0}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result v0

    if-eqz v0, :cond_15

    if-eqz p1, :cond_15

    iget-object p0, p0, Lrk/schedule/DiaryContext$Stamp;->owner:Ljava/lang/String;

    iget-object p1, p1, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_15

    return-void

    :cond_15
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u0423\u0447\u0435\u043d\u0438\u043a \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0443\u0440\u043e\u043a \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static reset(Landroid/content/Context;)V
    .registers 4

    .line 200
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0421\u0431\u0440\u043e\u0441\u0438\u0442\u044c \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0440\u043e\u0444\u0438\u043b\u0438, \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f, \u043a\u043b\u0430\u0441\u0441\u043d\u044b\u0435 \u0447\u0430\u0441\u044b \u0438 \u0440\u0443\u0447\u043d\u0430\u044f \u043f\u043e\u043f\u0440\u0430\u0432\u043a\u0430 \u0431\u0443\u0434\u0443\u0442 \u0443\u0434\u0430\u043b\u0435\u043d\u044b. \u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u0441\u044f."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda5;-><init>(Landroid/content/Context;)V

    const-string p0, "\u0421\u0431\u0440\u043e\u0441\u0438\u0442\u044c"

    invoke-virtual {v0, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method public static resetCorrection(Landroid/content/Context;)V
    .registers 3

    .line 86
    :try_start_0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->clearShift(Landroid/content/Context;)V

    invoke-static {}, Lrk/schedule/ScheduleBridge;->refresh()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_7

    goto :goto_14

    :catch_7
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_14
    return-void
.end method

.method public static resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrk/schedule/ScheduleStore;",
            "J",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;Z)",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;"
        }
    .end annotation

    .line 87
    invoke-virtual {p0, p1, p2}, Lrk/schedule/ScheduleStore;->active(J)Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    if-nez p3, :cond_a

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p3

    :cond_a
    if-nez v0, :cond_e

    const/4 v0, 0x0

    goto :goto_10

    :cond_e
    iget-object v0, v0, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    :goto_10
    invoke-virtual {p0, p1, p2}, Lrk/schedule/ScheduleStore;->source(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, p2}, Lrk/schedule/ScheduleStore;->homeroom(J)Lrk/schedule/ScheduleResolver$Homeroom;

    move-result-object v2

    if-eqz p4, :cond_37

    iget-object p4, p0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_37

    iget-object p0, p0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_38

    :cond_37
    const/4 p0, 0x0

    :goto_38
    invoke-static {p3, v0, v1, v2, p0}, Lrk/schedule/ScheduleResolver;->resolve(Ljava/util/List;[[ILjava/lang/String;Lrk/schedule/ScheduleResolver$Homeroom;I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static saveHomework(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;)V
    .registers 5

    .line 27
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    invoke-static {p0, p2}, Lrk/schedule/ScheduleBridge;->requireOwner(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore$Id;)V

    invoke-virtual {p1, p2, p3}, Lrk/diary/PersonalHomeworkStore;->save(Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :catchall_b
    move-exception p0

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw p0
.end method

.method public static sessionObserved(Ljava/lang/Object;)V
    .registers 8

    .line 32
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    sput-object p0, Lrk/schedule/ScheduleBridge;->session:Ljava/lang/Object;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_3d

    const/4 v1, 0x0

    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "a"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v5, "c"

    new-array v6, v4, [Ljava/lang/Class;

    invoke-virtual {v3, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez v2, :cond_2e

    move-object p0, v1

    :cond_2e
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->accountChanged(Ljava/lang/Object;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_31} :catch_32
    .catchall {:try_start_6 .. :try_end_31} :catchall_3d

    goto :goto_3b

    :catch_32
    move-exception p0

    :try_start_33
    invoke-static {v1}, Lrk/schedule/ScheduleBridge;->accountChanged(Ljava/lang/Object;)V

    const-string v1, "Reading session owner"

    invoke-static {v1, p0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_3b
    monitor-exit v0

    return-void

    :catchall_3d
    move-exception p0

    monitor-exit v0
    :try_end_3f
    .catchall {:try_start_33 .. :try_end_3f} :catchall_3d

    throw p0
.end method

.method static setManager(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 66
    const-string v0, "c7.LessonCountdownManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static shift(Landroid/content/Context;J)I
    .registers 3

    .line 84
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object p0

    iget-object p0, p0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-nez p0, :cond_14

    const/4 p0, 0x0

    goto :goto_18

    :cond_14
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    :goto_18
    return p0
.end method

.method public static skipEmpty(Ljava/lang/Object;Z)Z
    .registers 4

    .line 89
    if-eqz p1, :cond_34

    sget-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    if-nez v0, :cond_7

    goto :goto_34

    :cond_7
    :try_start_7
    const-string v0, "a"

    invoke-static {p0, v0}, Lrk/schedule/ScheduleBridge;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Date;

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    sget-object p0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Lrk/schedule/ScheduleStore;->homeroom(J)Lrk/schedule/ScheduleResolver$Homeroom;

    move-result-object p0

    if-eqz p0, :cond_2c

    iget-object p0, p0, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    const-string v0, "separate"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_27} :catch_2e

    if-nez p0, :cond_2a

    goto :goto_2c

    :cond_2a
    const/4 p0, 0x0

    goto :goto_2d

    :cond_2c
    :goto_2c
    const/4 p0, 0x1

    :goto_2d
    return p0

    :catch_2e
    move-exception p0

    const-string v0, "Empty diary day"

    invoke-static {v0, p0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_34
    :goto_34
    return p1
.end method

.method private static source(J)Ljava/lang/String;
    .registers 3

    .line 118
    :try_start_0
    sget-object v0, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {v0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lrk/schedule/ScheduleStore;->source(J)Ljava/lang/String;

    move-result-object p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    return-object p0

    :catch_b
    move-exception p0

    const-string p0, "\u041e\u0448\u0438\u0431\u043a\u0430 \u043d\u0430\u0441\u0442\u0440\u043e\u0435\u043a"

    return-object p0
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;JJ)J
    .registers 13

    .line 192
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v6}, Lrk/schedule/ScheduleBridge;->boundary(Landroid/content/Context;Ljava/lang/String;JJZ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static declared-synchronized store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;
    .registers 3

    const-class v0, Lrk/schedule/ScheduleBridge;

    monitor-enter v0

    .line 70
    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->store:Lrk/schedule/ScheduleStore;

    if-nez v1, :cond_d

    invoke-static {p0}, Lrk/schedule/ScheduleStore;->load(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object p0

    sput-object p0, Lrk/schedule/ScheduleBridge;->store:Lrk/schedule/ScheduleStore;

    :cond_d
    sget-object p0, Lrk/schedule/ScheduleBridge;->store:Lrk/schedule/ScheduleStore;
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_11

    monitor-exit v0

    return-object p0

    .line 70
    :catchall_11
    move-exception p0

    :try_start_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw p0
.end method

.method public static studentChanged(Ljava/lang/String;)V
    .registers 3

    .line 35
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v1, p0}, Lrk/schedule/DiaryContext;->student(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_e

    invoke-static {}, Lrk/schedule/ScheduleBridge;->invalidateOwner()V

    :cond_e
    monitor-exit v0

    return-void

    :catchall_10
    move-exception p0

    monitor-exit v0
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw p0
.end method

.method public static textColor(Landroid/content/Context;)I
    .registers 7

    .line 128
    const-string v0, "getThemeBackgroundColor"

    const v1, -0xefede8

    invoke-static {p0, v0, v1}, Lrk/schedule/ScheduleBridge;->themeColor(Landroid/content/Context;Ljava/lang/String;I)I

    move-result p0

    shr-int/lit8 v0, p0, 0x10

    and-int/lit16 v0, v0, 0xff

    int-to-double v0, v0

    const-wide v2, 0x3fd322d0e5604189L    # 0.299

    mul-double v0, v0, v2

    shr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-double v2, v2

    const-wide v4, 0x3fe2c8b439581062L    # 0.587

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    and-int/lit16 p0, p0, 0xff

    int-to-double v2, p0

    const-wide v4, 0x3fbd2f1a9fbe76c9L    # 0.114

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    const-wide/high16 v2, 0x4064000000000000L    # 160.0

    cmpl-double p0, v0, v2

    if-lez p0, :cond_37

    const p0, -0xe8dfd4

    goto :goto_3a

    :cond_37
    const p0, -0xc0a06

    :goto_3a
    return p0
.end method

.method public static themeColor(Landroid/content/Context;Ljava/lang/String;I)I
    .registers 8

    .line 127
    :try_start_0
    const-string v0, "c7.ThemeManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p0, v0, v4

    const/4 p0, 0x0

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_22

    return p0

    :catch_22
    move-exception p0

    return p2
.end method

.method public static tick()V
    .registers 14

    .line 135
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    .line 137
    :try_start_3
    const-string v1, "sContainer"

    invoke-static {v1}, Lrk/schedule/ScheduleBridge;->manager(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_b} :catch_1a2
    .catchall {:try_start_3 .. :try_end_b} :catchall_1a0

    if-nez v1, :cond_f

    :try_start_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_d .. :try_end_e} :catchall_1a0

    return-void

    .line 138
    :cond_f
    :try_start_f
    invoke-static {}, Lrk/schedule/ScheduleBridge;->owner()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const/16 v3, 0x8

    if-eqz v2, :cond_20

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_1e} :catch_1a2
    .catchall {:try_start_f .. :try_end_1e} :catchall_1a0

    :try_start_1e
    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1a0

    return-void

    :cond_20
    :try_start_20
    sget-object v2, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    if-nez v2, :cond_2e

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    sput-object v2, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    .line 139
    :cond_2e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v2

    const-string v6, ""

    sput-object v6, Lrk/schedule/ScheduleBridge;->lastActive:Ljava/lang/String;

    .line 140
    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v2, :cond_8c

    sget-object v9, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {v9}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v9

    invoke-virtual {v9, v4, v5}, Lrk/schedule/ScheduleStore;->homeroom(J)Lrk/schedule/ScheduleResolver$Homeroom;

    move-result-object v9

    if-eqz v9, :cond_5f

    sget-object v9, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {v9}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v9

    invoke-virtual {v9, v4, v5}, Lrk/schedule/ScheduleStore;->homeroom(J)Lrk/schedule/ScheduleResolver$Homeroom;

    move-result-object v9

    iget-object v9, v9, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    const-string v10, "separate"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8c

    :cond_5f
    const-string v2, "sLessons"

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v9

    invoke-static {v2, v9}, Lrk/schedule/ScheduleBridge;->setManager(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v4, v5}, Lrk/schedule/ScheduleResolver;->weekday(J)I

    move-result v2

    const/4 v4, 0x7

    if-eq v2, v4, :cond_77

    if-ne v2, v7, :cond_72

    goto :goto_77

    :cond_72
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_168

    :cond_77
    :goto_77
    const-string v1, "c7.LessonCountdownManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "showWeekendOrRelaxUi"

    new-array v3, v8, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {v1, v6, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_168

    .line 142
    :cond_8c
    sget-object v1, Lrk/schedule/ScheduleBridge;->app:Landroid/content/Context;

    invoke-static {v1}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v1

    invoke-static {v1, v4, v5, v2, v7}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    move-result-object v1

    .line 143
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrk/schedule/ScheduleResolver$Event;

    iget v9, v3, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {v4, v5, v9}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v9

    iget v11, v3, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-static {v4, v5, v11}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v11

    cmp-long v13, v4, v9

    if-ltz v13, :cond_bc

    cmp-long v13, v4, v11

    if-gez v13, :cond_bc

    move-object v2, v6

    goto :goto_c5

    :cond_bc
    cmp-long v11, v9, v4

    if-lez v11, :cond_9a

    move-object v2, v3

    move-object v3, v6

    goto :goto_c5

    :cond_c3
    move-object v2, v6

    move-object v3, v2

    .line 144
    :goto_c5
    if-eqz v3, :cond_f7

    iget-object v1, v3, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    sput-object v1, Lrk/schedule/ScheduleBridge;->lastActive:Ljava/lang/String;

    iget v1, v3, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-static {v4, v5, v1}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v1

    sub-long/2addr v1, v4

    const-wide/16 v4, 0x3e7

    add-long/2addr v1, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v1, v4

    iget-boolean v6, v3, Lrk/schedule/ScheduleResolver$Event;->homeroom:Z

    if-eqz v6, :cond_df

    const-string v6, "\ud83c\udfeb"

    goto :goto_e1

    :cond_df
    const-string v6, "\ud83d\udfe2"

    :goto_e1
    iget-boolean v8, v3, Lrk/schedule/ScheduleResolver$Event;->homeroom:Z

    if-eqz v8, :cond_e8

    const-string v3, "\u041a\u043b\u0430\u0441\u0441\u043d\u044b\u0439 \u0447\u0430\u0441 \u2022 \u0438\u0434\u0451\u0442"

    goto :goto_ec

    :cond_e8
    invoke-static {v3}, Lrk/schedule/ScheduleBridge;->lessonTitle(Lrk/schedule/ScheduleResolver$Event;)Ljava/lang/String;

    move-result-object v3

    :goto_ec
    mul-long v1, v1, v4

    invoke-static {v1, v2, v7}, Lrk/schedule/ScheduleResolver;->countdown(JZ)Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v3, v1}, Lrk/schedule/ScheduleBridge;->ui(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_168

    .line 145
    :cond_f7
    if-eqz v2, :cond_145

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_fd
    :goto_fd
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_115

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrk/schedule/ScheduleResolver$Event;

    iget v3, v3, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-static {v4, v5, v3}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v9

    cmp-long v3, v9, v4

    if-gtz v3, :cond_fd

    const/4 v8, 0x1

    goto :goto_fd

    :cond_115
    iget v1, v2, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {v4, v5, v1}, Lrk/schedule/ScheduleResolver;->instant(JI)J

    move-result-wide v6

    sub-long/2addr v6, v4

    if-eqz v8, :cond_121

    const-string v1, "\u23f8\ufe0f"

    goto :goto_123

    :cond_121
    const-string v1, "\ud83d\udd14"

    :goto_123
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v8, :cond_12d

    const-string v4, "\u041f\u0435\u0440\u0435\u043c\u0435\u043d\u0430 \u2022 \u0421\u043b\u0435\u0434: "

    goto :goto_12f

    :cond_12d
    const-string v4, "\u0421\u043b\u0435\u0434\u0443\u044e\u0449\u0438\u0439 \u0443\u0440\u043e\u043a: "

    :goto_12f
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, v2, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v7, v8}, Lrk/schedule/ScheduleResolver;->countdown(JZ)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lrk/schedule/ScheduleBridge;->ui(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_168

    .line 146
    :cond_145
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_15f

    const-string v1, "c7.LessonCountdownManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "showWeekendOrRelaxUi"

    new-array v3, v8, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {v1, v6, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_168

    :cond_15f
    const-string v1, "\u2728"

    const-string v2, "\u0412\u0441\u0435 \u0443\u0440\u043e\u043a\u0438 \u0437\u0430\u0432\u0435\u0440\u0448\u0435\u043d\u044b"

    const-string v3, "\u041e\u0442\u0434\u044b\u0445\u0430\u0439!"

    invoke-static {v1, v2, v3}, Lrk/schedule/ScheduleBridge;->ui(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    :goto_168
    const-string v1, "sCurrentActiveLessonNum"

    sget-object v2, Lrk/schedule/ScheduleBridge;->lastActive:Ljava/lang/String;

    invoke-static {v1, v2}, Lrk/schedule/ScheduleBridge;->setManager(Ljava/lang/String;Ljava/lang/Object;)V

    .line 149
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lrk/schedule/ScheduleBridge;->rows:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_17e
    :goto_17e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_17e

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/schedule/ScheduleBridge$Row;

    invoke-static {v3, v2}, Lrk/schedule/ScheduleBridge;->paint(Landroid/widget/TextView;Lrk/schedule/ScheduleBridge$Row;)V
    :try_end_19f
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_19f} :catch_1a2
    .catchall {:try_start_20 .. :try_end_19f} :catchall_1a0

    goto :goto_17e

    .line 152
    :catchall_1a0
    move-exception v1

    goto :goto_213

    .line 150
    :catch_1a2
    move-exception v1

    :try_start_1a3
    const-string v2, ""

    sput-object v2, Lrk/schedule/ScheduleBridge;->lastActive:Ljava/lang/String;
    :try_end_1a7
    .catchall {:try_start_1a3 .. :try_end_1a7} :catchall_1a0

    :try_start_1a7
    const-string v2, "sCurrentActiveLessonNum"

    const-string v3, ""

    invoke-static {v2, v3}, Lrk/schedule/ScheduleBridge;->setManager(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Ljava/util/ArrayList;

    sget-object v3, Lrk/schedule/ScheduleBridge;->rows:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1bd
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1da

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrk/schedule/ScheduleBridge$Row;

    invoke-static {v4, v3}, Lrk/schedule/ScheduleBridge;->paint(Landroid/widget/TextView;Lrk/schedule/ScheduleBridge$Row;)V
    :try_end_1d8
    .catch Ljava/lang/Exception; {:try_start_1a7 .. :try_end_1d8} :catch_1d9
    .catchall {:try_start_1a7 .. :try_end_1d8} :catchall_1a0

    goto :goto_1bd

    :catch_1d9
    move-exception v2

    :cond_1da
    :try_start_1da
    const-string v2, "!"

    const-string v3, "\u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1e7

    const-string v4, "\u041e\u0448\u0438\u0431\u043a\u0430 \u043d\u0430\u0441\u0442\u0440\u043e\u0435\u043a"

    goto :goto_1eb

    :cond_1e7
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    :goto_1eb
    invoke-static {v2, v3, v4}, Lrk/schedule/ScheduleBridge;->ui(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lrk/schedule/ScheduleBridge;->lastProblem:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_20d

    const-string v2, "Schedule calculation"

    invoke-static {v2, v1}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lrk/schedule/ScheduleBridge;->lastProblem:Ljava/lang/String;

    :cond_20d
    nop

    .line 151
    invoke-static {}, Lrk/diary/DiaryUi;->tick()V

    .line 152
    monitor-exit v0

    return-void

    :goto_213
    monitor-exit v0
    :try_end_214
    .catchall {:try_start_1da .. :try_end_214} :catchall_1a0

    throw v1
.end method

.method public static transferHomework(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 7

    .line 28
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_3
    invoke-static {p0, p2}, Lrk/schedule/ScheduleBridge;->requireOwner(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore$Id;)V

    invoke-virtual {p1, p2, p3, p4, p5}, Lrk/diary/PersonalHomeworkStore;->transfer(Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :catchall_c
    move-exception p0

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw p0
.end method

.method private static ui(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 16

    .line 129
    const-string v0, "\ud83d\udd14"

    :try_start_2
    const-string v1, "sContainer"

    invoke-static {v1}, Lrk/schedule/ScheduleBridge;->manager(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-nez v1, :cond_d

    return-void

    :cond_d
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    const-string v3, "c7.LessonCountdownManager"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "setUi"

    const/4 v5, 0x5

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v2

    const/4 v8, 0x1

    aput-object v7, v6, v8

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x2

    aput-object v9, v6, v10

    const/4 v11, 0x3

    aput-object v9, v6, v11

    const/4 v9, 0x4

    aput-object v7, v6, v9

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_41} :catch_87

    const-string v7, "\u23f8\ufe0f"

    if-nez v6, :cond_4f

    :try_start_45
    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4c

    goto :goto_4f

    :cond_4c
    const-string v6, "bg_timer_badge_lesson"

    goto :goto_51

    :cond_4f
    :goto_4f
    const-string v6, "bg_timer_badge_break"

    :goto_51
    const-string v12, "drawable"

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v6, v12, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_70

    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    goto :goto_70

    :cond_6c
    const v0, -0xff198a

    goto :goto_72

    :cond_70
    :goto_70
    const/16 v0, -0x4d00

    :goto_72
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-array v4, v5, [Ljava/lang/Object;

    aput-object p0, v4, v2

    aput-object p1, v4, v8

    aput-object v1, v4, v10

    aput-object v0, v4, v11

    aput-object p2, v4, v9

    const/4 p0, 0x0

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_86} :catch_87

    goto :goto_8d

    :catch_87
    move-exception p0

    const-string p1, "Updating countdown"

    invoke-static {p1, p0}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_8d
    return-void
.end method

.method public static validate(Lrk/schedule/ScheduleStore;)V
    .registers 7

    .line 154
    iget-object v0, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/schedule/ScheduleStore$Profile;

    iget-object v1, v1, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    invoke-static {v1}, Lrk/schedule/ScheduleResolver;->validateSlots([[I)V

    goto :goto_a

    .line 155
    :cond_1c
    sget-object v0, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    monitor-enter v0

    :try_start_1f
    sget-object v1, Lrk/schedule/ScheduleBridge;->owners:Lrk/schedule/DiaryContext;

    invoke-virtual {v1}, Lrk/schedule/DiaryContext;->snapshot()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lrk/schedule/ScheduleBridge;->parseDate(Ljava/lang/String;)J

    move-result-wide v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    const/4 v5, 0x1

    invoke-static {p0, v3, v4, v2, v5}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    goto :goto_2d

    :cond_4e
    monitor-exit v0

    .line 156
    return-void

    .line 155
    :catchall_50
    move-exception p0

    monitor-exit v0
    :try_end_52
    .catchall {:try_start_1f .. :try_end_52} :catchall_50

    throw p0
.end method
