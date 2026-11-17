.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:I

.field public final synthetic f$4:Landroid/widget/CheckBox;

.field public final synthetic f$5:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;Landroid/widget/EditText;ILandroid/widget/CheckBox;Landroid/app/AlertDialog;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$0:Lrk/schedule/ScheduleEditor;

    iput-object p2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$1:Landroid/widget/EditText;

    iput-object p3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$2:Landroid/widget/EditText;

    iput p4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$3:I

    iput-object p5, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$4:Landroid/widget/CheckBox;

    iput-object p6, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$5:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$0:Lrk/schedule/ScheduleEditor;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$1:Landroid/widget/EditText;

    iget-object v2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$2:Landroid/widget/EditText;

    iget v3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$3:I

    iget-object v4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$4:Landroid/widget/CheckBox;

    iget-object v5, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda21;->f$5:Landroid/app/AlertDialog;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lrk/schedule/ScheduleEditor;->lambda$editLesson$14$rk-schedule-ScheduleEditor(Landroid/widget/EditText;Landroid/widget/EditText;ILandroid/widget/CheckBox;Landroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
