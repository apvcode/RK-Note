.class public final synthetic Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Dialog;

.field public final synthetic f$1:Ljava/lang/Class;

.field public final synthetic f$2:Landroid/widget/FrameLayout;

.field public final synthetic f$3:Landroid/view/ViewGroup;

.field public final synthetic f$4:I

.field public final synthetic f$5:Landroid/content/Context;

.field public final synthetic f$6:Z

.field public final synthetic f$7:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Dialog;Ljava/lang/Class;Landroid/widget/FrameLayout;Landroid/view/ViewGroup;ILandroid/content/Context;ZLandroid/view/ViewGroup;)V
    .registers 9

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$0:Landroid/app/Dialog;

    iput-object p2, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Class;

    iput-object p3, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$2:Landroid/widget/FrameLayout;

    iput-object p4, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$3:Landroid/view/ViewGroup;

    iput p5, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$4:I

    iput-object p6, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$5:Landroid/content/Context;

    iput-boolean p7, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$6:Z

    iput-object p8, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$7:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 9

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$0:Landroid/app/Dialog;

    iget-object v1, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Class;

    iget-object v2, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$2:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$3:Landroid/view/ViewGroup;

    iget v4, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$4:I

    iget-object v5, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$5:Landroid/content/Context;

    iget-boolean v6, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$6:Z

    iget-object v7, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda0;->f$7:Landroid/view/ViewGroup;

    invoke-static/range {v0 .. v7}, Lrk/schedule/ScheduleUi;->lambda$glass$1(Landroid/app/Dialog;Ljava/lang/Class;Landroid/widget/FrameLayout;Landroid/view/ViewGroup;ILandroid/content/Context;ZLandroid/view/ViewGroup;)V

    return-void
.end method
