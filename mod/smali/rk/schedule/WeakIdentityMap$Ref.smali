.class final Lrk/schedule/WeakIdentityMap$Ref;
.super Ljava/lang/ref/WeakReference;
.source "WeakIdentityMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/schedule/WeakIdentityMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Ref"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/ref/WeakReference<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final hash:I


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/ref/ReferenceQueue<",
            "TK;>;)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p1

    iput p1, p0, Lrk/schedule/WeakIdentityMap$Ref;->hash:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5

    .line 14
    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lrk/schedule/WeakIdentityMap$Ref;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    invoke-virtual {p0}, Lrk/schedule/WeakIdentityMap$Ref;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_19

    check-cast p1, Lrk/schedule/WeakIdentityMap$Ref;

    invoke-virtual {p1}, Lrk/schedule/WeakIdentityMap$Ref;->get()Ljava/lang/Object;

    move-result-object p1

    if-ne v1, p1, :cond_19

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    return v0
.end method

.method public hashCode()I
    .registers 2

    .line 13
    iget v0, p0, Lrk/schedule/WeakIdentityMap$Ref;->hash:I

    return v0
.end method
