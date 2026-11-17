.class public final Lc7/ScheduleDowDialogListener;
.super Ljava/lang/Object;
.source "ScheduleDowDialogListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/ScheduleDowDialogListener;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :cond_0
    iget-object p1, p0, Lc7/ScheduleDowDialogListener;->a:Landroid/content/Context;

    if-nez p1, :cond_1

    return-void

    :cond_1
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 p2, 0x2

    const-string v0, "\u041f\u043e\u043d\u0435\u0434\u0435\u043b\u044c\u043d\u0438\u043a"

    invoke-static {p1, p2, v0}, Lc7/ScheduleSettingsHelper;->showDurationPickerForDow(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0

    :pswitch_1
    const/4 p2, 0x3

    const-string v0, "\u0412\u0442\u043e\u0440\u043d\u0438\u043a"

    invoke-static {p1, p2, v0}, Lc7/ScheduleSettingsHelper;->showDurationPickerForDow(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0

    :pswitch_2
    const/4 p2, 0x4

    const-string v0, "\u0421\u0440\u0435\u0434\u0430"

    invoke-static {p1, p2, v0}, Lc7/ScheduleSettingsHelper;->showDurationPickerForDow(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0

    :pswitch_3
    const/4 p2, 0x5

    const-string v0, "\u0427\u0435\u0442\u0432\u0435\u0440\u0433"

    invoke-static {p1, p2, v0}, Lc7/ScheduleSettingsHelper;->showDurationPickerForDow(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0

    :pswitch_4
    const/4 p2, 0x6

    const-string v0, "\u041f\u044f\u0442\u043d\u0438\u0446\u0430"

    invoke-static {p1, p2, v0}, Lc7/ScheduleSettingsHelper;->showDurationPickerForDow(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0

    :pswitch_5
    const/4 p2, 0x7

    const-string v0, "\u0421\u0443\u0431\u0431\u043e\u0442\u0430"

    invoke-static {p1, p2, v0}, Lc7/ScheduleSettingsHelper;->showDurationPickerForDow(Landroid/content/Context;ILjava/lang/String;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
