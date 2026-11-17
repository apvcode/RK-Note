.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;

.field public final synthetic f$1:Landroid/widget/Spinner;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:Landroid/widget/EditText;

.field public final synthetic f$5:Landroid/widget/Spinner;

.field public final synthetic f$6:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/app/AlertDialog;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$0:Lrk/schedule/ScheduleEditor;

    iput-object p2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$1:Landroid/widget/Spinner;

    iput-object p3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$3:Landroid/widget/EditText;

    iput-object p5, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$4:Landroid/widget/EditText;

    iput-object p6, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$5:Landroid/widget/Spinner;

    iput-object p7, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$6:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$0:Lrk/schedule/ScheduleEditor;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$1:Landroid/widget/Spinner;

    iget-object v2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$3:Landroid/widget/EditText;

    iget-object v4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$4:Landroid/widget/EditText;

    iget-object v5, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$5:Landroid/widget/Spinner;

    iget-object v6, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda27;->f$6:Landroid/app/AlertDialog;

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lrk/schedule/ScheduleEditor;->lambda$homeroom$28$rk-schedule-ScheduleEditor(Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
