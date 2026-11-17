.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;Landroid/app/AlertDialog;Landroid/widget/EditText;Ljava/lang/String;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;->f$0:Lrk/schedule/ScheduleEditor;

    iput-object p2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 6

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;->f$0:Lrk/schedule/ScheduleEditor;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda17;->f$3:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, p1}, Lrk/schedule/ScheduleEditor;->lambda$manual$33$rk-schedule-ScheduleEditor(Landroid/app/AlertDialog;Landroid/widget/EditText;Ljava/lang/String;Landroid/content/DialogInterface;)V

    return-void
.end method
