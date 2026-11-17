.class public final synthetic Lrk/schedule/ScheduleResolver$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 0
    check-cast p1, Lrk/schedule/ScheduleResolver$Event;

    check-cast p2, Lrk/schedule/ScheduleResolver$Event;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->lambda$resolve$1(Lrk/schedule/ScheduleResolver$Event;Lrk/schedule/ScheduleResolver$Event;)I

    move-result p1

    return p1
.end method
