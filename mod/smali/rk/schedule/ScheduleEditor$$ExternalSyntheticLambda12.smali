.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:I

.field public final synthetic f$5:Landroid/widget/CheckBox;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;ILandroid/widget/CheckBox;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$0:Lrk/schedule/ScheduleEditor;

    iput-object p2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$3:Landroid/widget/EditText;

    iput p5, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$4:I

    iput-object p6, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$5:Landroid/widget/CheckBox;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 9

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$0:Lrk/schedule/ScheduleEditor;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$3:Landroid/widget/EditText;

    iget v4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$4:I

    iget-object v5, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda12;->f$5:Landroid/widget/CheckBox;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lrk/schedule/ScheduleEditor;->lambda$editLesson$15$rk-schedule-ScheduleEditor(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;ILandroid/widget/CheckBox;Landroid/content/DialogInterface;)V

    return-void
.end method
