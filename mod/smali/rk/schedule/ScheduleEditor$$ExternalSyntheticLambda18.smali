.class public final synthetic Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda18;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda18;->f$0:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onTimeSet(Landroid/widget/TimePicker;II)V
    .registers 5

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleEditor$$ExternalSyntheticLambda18;->f$0:Landroid/widget/EditText;

    invoke-static {v0, p1, p2, p3}, Lrk/schedule/ScheduleEditor;->lambda$pickTime$16(Landroid/widget/EditText;Landroid/widget/TimePicker;II)V

    return-void
.end method
