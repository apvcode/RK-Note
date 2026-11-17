.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;Ljava/lang/String;Landroid/app/AlertDialog;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;->f$0:Lrk/schedule/ScheduleEditor;

    iput-object p2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;->f$1:Landroid/widget/EditText;

    iput-object p3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;->f$3:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;->f$0:Lrk/schedule/ScheduleEditor;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;->f$1:Landroid/widget/EditText;

    iget-object v2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda20;->f$3:Landroid/app/AlertDialog;

    invoke-virtual {v0, v1, v2, v3, p1}, Lrk/schedule/ScheduleEditor;->lambda$manual$32$rk-schedule-ScheduleEditor(Landroid/widget/EditText;Ljava/lang/String;Landroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
