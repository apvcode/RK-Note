.class public final Lrk/schedule/DiaryContext;
.super Ljava/lang/Object;
.source "DiaryContext.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/schedule/DiaryContext$Stamp;
    }
.end annotation


# instance fields
.field private account:Ljava/lang/String;

.field private final days:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;>;"
        }
    .end annotation
.end field

.field private generation:J

.field private loginLabel:Ljava/lang/String;

.field private schoolLabel:Ljava/lang/String;

.field private student:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const-string v0, ""

    iput-object v0, p0, Lrk/schedule/DiaryContext;->account:Ljava/lang/String;

    iput-object v0, p0, Lrk/schedule/DiaryContext;->student:Ljava/lang/String;

    iput-object v0, p0, Lrk/schedule/DiaryContext;->schoolLabel:Ljava/lang/String;

    iput-object v0, p0, Lrk/schedule/DiaryContext;->loginLabel:Ljava/lang/String;

    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lrk/schedule/DiaryContext;->days:Ljava/util/Map;

    return-void
.end method

.method private invalidate()V
    .registers 5

    .line 17
    iget-wide v0, p0, Lrk/schedule/DiaryContext;->generation:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lrk/schedule/DiaryContext;->generation:J

    iget-object v0, p0, Lrk/schedule/DiaryContext;->days:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method public static part(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public declared-synchronized account(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5

    monitor-enter p0

    .line 15
    if-eqz p1, :cond_2c

    if-eqz p2, :cond_2c

    :try_start_5
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    goto :goto_2c

    :cond_12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lrk/schedule/DiaryContext;->part(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lrk/schedule/DiaryContext;->part(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2e

    :cond_2c
    :goto_2c
    const-string v0, ""

    :goto_2e
    iget-object v1, p0, Lrk/schedule/DiaryContext;->account:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_34
    .catchall {:try_start_5 .. :try_end_34} :catchall_51

    if-eqz v1, :cond_39

    monitor-exit p0

    const/4 p1, 0x0

    return p1

    :cond_39
    :try_start_39
    iput-object v0, p0, Lrk/schedule/DiaryContext;->account:Ljava/lang/String;

    if-nez p1, :cond_3f

    const-string p1, ""

    :cond_3f
    iput-object p1, p0, Lrk/schedule/DiaryContext;->schoolLabel:Ljava/lang/String;

    if-nez p2, :cond_45

    const-string p2, ""

    :cond_45
    iput-object p2, p0, Lrk/schedule/DiaryContext;->loginLabel:Ljava/lang/String;

    const-string p1, ""

    iput-object p1, p0, Lrk/schedule/DiaryContext;->student:Ljava/lang/String;

    invoke-direct {p0}, Lrk/schedule/DiaryContext;->invalidate()V
    :try_end_4e
    .catchall {:try_start_39 .. :try_end_4e} :catchall_51

    monitor-exit p0

    const/4 p1, 0x1

    return p1

    .line 15
    :catchall_51
    move-exception p1

    :try_start_52
    monitor-exit p0
    :try_end_53
    .catchall {:try_start_52 .. :try_end_53} :catchall_51

    throw p1
.end method

.method public declared-synchronized current(Lrk/schedule/DiaryContext$Stamp;)Z
    .registers 7

    monitor-enter p0

    .line 21
    if-eqz p1, :cond_24

    :try_start_3
    iget-object v0, p1, Lrk/schedule/DiaryContext$Stamp;->owner:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_24

    iget-wide v0, p1, Lrk/schedule/DiaryContext$Stamp;->generation:J

    iget-wide v2, p0, Lrk/schedule/DiaryContext;->generation:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_24

    iget-object p1, p1, Lrk/schedule/DiaryContext$Stamp;->owner:Ljava/lang/String;

    invoke-virtual {p0}, Lrk/schedule/DiaryContext;->owner()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_24

    const/4 p1, 0x1

    goto :goto_25

    .line 21
    :catchall_21
    move-exception p1

    monitor-exit p0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw p1

    .line 21
    :cond_24
    const/4 p1, 0x0

    :goto_25
    monitor-exit p0

    return p1
.end method

.method public declared-synchronized get(J)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 23
    :try_start_1
    iget-object v0, p0, Lrk/schedule/DiaryContext;->days:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Lrk/schedule/DiaryContext;->owner()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_20

    if-nez p1, :cond_1a

    goto :goto_20

    :cond_1a
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_23

    goto :goto_21

    :cond_20
    :goto_20
    const/4 p2, 0x0

    :goto_21
    monitor-exit p0

    return-object p2

    .line 23
    :catchall_23
    move-exception p1

    :try_start_24
    monitor-exit p0
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_23

    throw p1
.end method

.method public declared-synchronized label()Ljava/lang/String;
    .registers 3

    monitor-enter p0

    .line 19
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0423\u0447\u0435\u043d\u0438\u043a: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/DiaryContext;->student:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n\u0410\u043a\u043a\u0430\u0443\u043d\u0442: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/DiaryContext;->loginLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/DiaryContext;->schoolLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2e
    .catchall {:try_start_1 .. :try_end_2e} :catchall_30

    monitor-exit p0

    return-object v0

    .line 19
    :catchall_30
    move-exception v0

    :try_start_31
    monitor-exit p0
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_30

    throw v0
.end method

.method public declared-synchronized owner()Ljava/lang/String;
    .registers 3

    monitor-enter p0

    .line 14
    :try_start_1
    iget-object v0, p0, Lrk/schedule/DiaryContext;->account:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2c

    iget-object v0, p0, Lrk/schedule/DiaryContext;->student:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    goto :goto_2c

    :cond_12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lrk/schedule/DiaryContext;->account:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/DiaryContext;->student:Ljava/lang/String;

    invoke-static {v1}, Lrk/schedule/DiaryContext;->part(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2e

    :cond_2c
    :goto_2c
    const-string v0, ""
    :try_end_2e
    .catchall {:try_start_1 .. :try_end_2e} :catchall_30

    :goto_2e
    monitor-exit p0

    return-object v0

    .line 14
    :catchall_30
    move-exception v0

    :try_start_31
    monitor-exit p0
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_30

    throw v0
.end method

.method public declared-synchronized put(Lrk/schedule/DiaryContext$Stamp;JLjava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrk/schedule/DiaryContext$Stamp;",
            "J",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    .line 22
    :try_start_1
    invoke-virtual {p0, p1}, Lrk/schedule/DiaryContext;->current(Lrk/schedule/DiaryContext$Stamp;)Z

    move-result p1

    if-eqz p1, :cond_15

    iget-object p1, p0, Lrk/schedule/DiaryContext;->days:Ljava/util/Map;

    invoke-static {p2, p3}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_17

    :cond_15
    monitor-exit p0

    return-void

    .line 22
    :catchall_17
    move-exception p1

    :try_start_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw p1
.end method

.method public declared-synchronized selectedStudent()Ljava/lang/String;
    .registers 2

    monitor-enter p0

    .line 18
    :try_start_1
    iget-object v0, p0, Lrk/schedule/DiaryContext;->student:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    .line 18
    :catchall_5
    move-exception v0

    :try_start_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_6 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public declared-synchronized snapshot()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;>;"
        }
    .end annotation

    monitor-enter p0

    .line 24
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lrk/schedule/DiaryContext;->days:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-object v0

    .line 24
    :catchall_a
    move-exception v0

    :try_start_b
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_a

    throw v0
.end method

.method public declared-synchronized stamp()Lrk/schedule/DiaryContext$Stamp;
    .registers 6

    monitor-enter p0

    .line 20
    :try_start_1
    new-instance v0, Lrk/schedule/DiaryContext$Stamp;

    invoke-virtual {p0}, Lrk/schedule/DiaryContext;->owner()Ljava/lang/String;

    move-result-object v1

    iget-wide v2, p0, Lrk/schedule/DiaryContext;->generation:J

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lrk/schedule/DiaryContext$Stamp;-><init>(Ljava/lang/String;JLrk/schedule/DiaryContext$1;)V
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 20
    :catchall_f
    move-exception v0

    :try_start_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public declared-synchronized student(Ljava/lang/String;)Z
    .registers 3

    monitor-enter p0

    .line 16
    if-nez p1, :cond_8

    :try_start_3
    const-string p1, ""

    goto :goto_8

    .line 16
    :catchall_6
    move-exception p1

    goto :goto_1b

    .line 16
    :cond_8
    :goto_8
    iget-object v0, p0, Lrk/schedule/DiaryContext;->student:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_6

    if-eqz v0, :cond_13

    monitor-exit p0

    const/4 p1, 0x0

    return p1

    :cond_13
    :try_start_13
    iput-object p1, p0, Lrk/schedule/DiaryContext;->student:Ljava/lang/String;

    invoke-direct {p0}, Lrk/schedule/DiaryContext;->invalidate()V
    :try_end_18
    .catchall {:try_start_13 .. :try_end_18} :catchall_6

    monitor-exit p0

    const/4 p1, 0x1

    return p1

    .line 16
    :goto_1b
    :try_start_1b
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_6

    throw p1
.end method
