.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;

.field public final synthetic f$1:Landroid/widget/EditText;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$0:Lrk/schedule/ScheduleEditor;

    iput-object p2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$1:Landroid/widget/EditText;

    iput-object p3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$3:Landroid/widget/EditText;

    iput-object p5, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$4:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 10

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$0:Lrk/schedule/ScheduleEditor;

    iget-object v1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$1:Landroid/widget/EditText;

    iget-object v2, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$3:Landroid/widget/EditText;

    iget-object v4, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda30;->f$4:Landroid/widget/EditText;

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lrk/schedule/ScheduleEditor;->lambda$generate$27$rk-schedule-ScheduleEditor(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/content/DialogInterface;I)V

    return-void
.end method
