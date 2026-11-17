.class public final Lrk/schedule/ScheduleResolver$Event;
.super Ljava/lang/Object;
.source "ScheduleResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/schedule/ScheduleResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Event"
.end annotation


# instance fields
.field public final end:I

.field public final homeroom:Z

.field public final number:Ljava/lang/String;

.field public final original:Ljava/lang/Object;

.field public final source:Ljava/lang/String;

.field public final start:I

.field public final title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Object;Ljava/lang/String;)V
    .registers 8

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    iput-object p2, p0, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    iput p3, p0, Lrk/schedule/ScheduleResolver$Event;->start:I

    iput p4, p0, Lrk/schedule/ScheduleResolver$Event;->end:I

    iput-boolean p5, p0, Lrk/schedule/ScheduleResolver$Event;->homeroom:Z

    iput-object p6, p0, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    iput-object p7, p0, Lrk/schedule/ScheduleResolver$Event;->source:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public at(IILjava/lang/String;)Lrk/schedule/ScheduleResolver$Event;
    .registers 12

    .line 17
    new-instance v0, Lrk/schedule/ScheduleResolver$Event;

    iget-object v1, p0, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    iget-object v2, p0, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    iget-boolean v5, p0, Lrk/schedule/ScheduleResolver$Event;->homeroom:Z

    iget-object v6, p0, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    move v3, p1

    move v4, p2

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lrk/schedule/ScheduleResolver$Event;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
