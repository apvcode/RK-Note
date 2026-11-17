.class public final Lrk/schedule/ScheduleStore$Profile;
.super Ljava/lang/Object;
.source "ScheduleStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/schedule/ScheduleStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Profile"
.end annotation


# instance fields
.field public id:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public slots:[[I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x2

    new-array v1, v0, [I

    const/4 v2, 0x1

    aput v0, v1, v2

    const/4 v0, 0x0

    const/16 v2, 0x8

    aput v2, v1, v0

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[I

    iput-object v1, p0, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    .line 11
    iput-object p1, p0, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    iput-object p2, p0, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    iget-object p1, p0, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    array-length p2, p1

    :goto_1f
    if-ge v0, p2, :cond_2a

    aget-object v1, p1, v0

    const/4 v2, -0x1

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    :cond_2a
    return-void
.end method
