.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;->f$0:Lrk/schedule/ScheduleEditor;

    iput-object p2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;->f$1:Landroid/widget/EditText;

    iput-boolean p3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;->f$2:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;->f$0:Lrk/schedule/ScheduleEditor;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;->f$1:Landroid/widget/EditText;

    iget-boolean v2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda15;->f$2:Z

    invoke-virtual {v0, v1, v2, p1, p2}, Lrk/schedule/ScheduleEditor;->lambda$newProfile$21$rk-schedule-ScheduleEditor(Landroid/widget/EditText;ZLandroid/content/DialogInterface;I)V

    return-void
.end method
