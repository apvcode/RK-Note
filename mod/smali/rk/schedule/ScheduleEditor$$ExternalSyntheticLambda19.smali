.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda19;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/ScheduleEditor;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/ScheduleEditor;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda19;->f$0:Lrk/schedule/ScheduleEditor;

    return-void
.end method


# virtual methods
.method public final onDateSet(Landroid/widget/DatePicker;III)V
    .registers 6

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda19;->f$0:Lrk/schedule/ScheduleEditor;

    invoke-virtual {v0, p1, p2, p3, p4}, Lrk/schedule/ScheduleEditor;->lambda$chooseDate$17$rk-schedule-ScheduleEditor(Landroid/widget/DatePicker;III)V

    return-void
.end method
