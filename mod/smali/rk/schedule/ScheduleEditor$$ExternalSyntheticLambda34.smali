.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda34;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda34;->f$0:Lrk/schedule/ScheduleEditor;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda34;->f$0:Lrk/schedule/ScheduleEditor;

    invoke-virtual {v0}, Lrk/schedule/ScheduleEditor;->lambda$render$7$rk-schedule-ScheduleEditor()V

    return-void
.end method
