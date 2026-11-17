.class public final Lrk/schedule/WeakIdentityMap;
.super Ljava/lang/Object;
.source "WeakIdentityMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/schedule/WeakIdentityMap$Ref;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final queue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "TK;>;"
        }
    .end annotation
.end field

.field private final values:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lrk/schedule/WeakIdentityMap$Ref<",
            "TK;>;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lrk/schedule/WeakIdentityMap;->queue:Ljava/lang/ref/ReferenceQueue;

    .line 9
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lrk/schedule/WeakIdentityMap;->values:Ljava/util/Map;

    return-void
.end method

.method private prune()V
    .registers 3

    .line 16
    nop

    :goto_1
    iget-object v0, p0, Lrk/schedule/WeakIdentityMap;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-eqz v0, :cond_f

    iget-object v1, p0, Lrk/schedule/WeakIdentityMap;->values:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_f
    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 2

    monitor-enter p0

    .line 19
    :try_start_1
    iget-object v0, p0, Lrk/schedule/WeakIdentityMap;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    :goto_6
    iget-object v0, p0, Lrk/schedule/WeakIdentityMap;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_11

    if-eqz v0, :cond_f

    goto :goto_6

    :cond_f
    monitor-exit p0

    return-void

    .line 19
    :catchall_11
    move-exception v0

    :try_start_12
    monitor-exit p0
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    monitor-enter p0

    .line 18
    :try_start_1
    invoke-direct {p0}, Lrk/schedule/WeakIdentityMap;->prune()V

    iget-object v0, p0, Lrk/schedule/WeakIdentityMap;->values:Ljava/util/Map;

    new-instance v1, Lrk/schedule/WeakIdentityMap$Ref;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lrk/schedule/WeakIdentityMap$Ref;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    monitor-exit p0

    return-object p1

    .line 18
    :catchall_12
    move-exception p1

    :try_start_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw p1
.end method

.method public declared-synchronized put(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    monitor-enter p0

    .line 17
    :try_start_1
    invoke-direct {p0}, Lrk/schedule/WeakIdentityMap;->prune()V

    iget-object v0, p0, Lrk/schedule/WeakIdentityMap;->values:Ljava/util/Map;

    new-instance v1, Lrk/schedule/WeakIdentityMap$Ref;

    iget-object v2, p0, Lrk/schedule/WeakIdentityMap;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v1, p1, v2}, Lrk/schedule/WeakIdentityMap$Ref;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    monitor-exit p0

    return-void

    .line 17
    :catchall_12
    move-exception p1

    :try_start_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw p1
.end method
