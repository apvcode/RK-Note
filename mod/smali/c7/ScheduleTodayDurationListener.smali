.class public final Lc7/ScheduleTodayDurationListener;
.super Ljava/lang/Object;
.source "ScheduleTodayDurationListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/ScheduleTodayDurationListener;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :cond_0
    iget-object p1, p0, Lc7/ScheduleTodayDurationListener;->a:Landroid/content/Context;

    if-nez p1, :cond_1

    return-void

    :cond_1
    const/16 v0, 0x28

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/16 v0, 0x28

    goto :goto_0

    :pswitch_1
    const/16 v0, 0x23

    goto :goto_0

    :pswitch_2
    const/16 v0, 0x1e

    goto :goto_0

    :pswitch_3
    const/16 v0, 0x2d

    :goto_0
    invoke-static {p1, v0}, Lc7/ScheduleSettingsHelper;->saveTodayDuration(Landroid/content/Context;I)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
