.class public final Lrk/schedule/ScheduleResolver$Homeroom;
.super Ljava/lang/Object;
.source "ScheduleResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/schedule/ScheduleResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Homeroom"
.end annotation


# instance fields
.field public end:I

.field public lesson:I

.field public mode:Ljava/lang/String;

.field public start:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const-string v0, "separate"

    iput-object v0, p0, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    .line 21
    const/4 v0, 0x1

    iput v0, p0, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    return-void
.end method


# virtual methods
.method public copy()Lrk/schedule/ScheduleResolver$Homeroom;
    .registers 3

    .line 22
    new-instance v0, Lrk/schedule/ScheduleResolver$Homeroom;

    invoke-direct {v0}, Lrk/schedule/ScheduleResolver$Homeroom;-><init>()V

    iget-object v1, p0, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    iput-object v1, v0, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    iget v1, p0, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    iput v1, v0, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    iget v1, p0, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    iput v1, v0, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    iget v1, p0, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    iput v1, v0, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    return-object v0
.end method
