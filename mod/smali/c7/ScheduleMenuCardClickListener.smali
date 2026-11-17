.class public final Lc7/ScheduleMenuCardClickListener;
.super Ljava/lang/Object;
.source "ScheduleMenuCardClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Landroid/content/Context;
.field public final b:Landroid/app/Dialog;
.field public final c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/app/Dialog;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/ScheduleMenuCardClickListener;->a:Landroid/content/Context;

    iput-object p2, p0, Lc7/ScheduleMenuCardClickListener;->b:Landroid/app/Dialog;

    iput p3, p0, Lc7/ScheduleMenuCardClickListener;->c:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lc7/ScheduleMenuCardClickListener;->b:Landroid/app/Dialog;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

:cond_0
    iget-object p1, p0, Lc7/ScheduleMenuCardClickListener;->a:Landroid/content/Context;

    if-eqz p1, :cond_done

    iget v0, p0, Lc7/ScheduleMenuCardClickListener;->c:I

    packed-switch v0, :pswitch_data_0

    goto :cond_done

:pswitch_0
    invoke-static {p1}, Lc7/ScheduleSettingsHelper;->showBellProfilePicker(Landroid/content/Context;)V

    goto :cond_done

:pswitch_1
    invoke-static {p1}, Lc7/ScheduleSettingsHelper;->showTodayDurationPicker(Landroid/content/Context;)V

    goto :cond_done

:pswitch_2
    invoke-static {p1}, Lc7/LessonCountdownManager;->showHomeroomDialog(Landroid/content/Context;)V

    goto :cond_done

:pswitch_3
    invoke-static {p1}, Lc7/ScheduleSettingsHelper;->resetAll(Landroid/content/Context;)V

    goto :cond_done

:pswitch_4
    invoke-static {p1}, Lc7/ManualBellCorrection;->show(Landroid/content/Context;)V

:cond_done
    return-void

:pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
