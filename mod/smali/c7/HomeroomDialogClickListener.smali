.class public final Lc7/HomeroomDialogClickListener;
.super Ljava/lang/Object;
.source "HomeroomDialogClickListener.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 p2, 0x0

    const/16 v0, 0x28

    invoke-static {p2, v0}, Lc7/LessonCountdownManager;->setHomeroom(II)V

    goto :goto_0

    :pswitch_1
    const/4 p2, 0x1

    const/16 v0, 0x28

    invoke-static {p2, v0}, Lc7/LessonCountdownManager;->setHomeroom(II)V

    goto :goto_0

    :pswitch_2
    const/4 p2, 0x2

    const/16 v0, 0x28

    invoke-static {p2, v0}, Lc7/LessonCountdownManager;->setHomeroom(II)V

    goto :goto_0

    :pswitch_3
    const/4 p2, 0x3

    const/16 v0, 0x28

    invoke-static {p2, v0}, Lc7/LessonCountdownManager;->setHomeroom(II)V

    goto :goto_0

    :pswitch_4
    const/4 p2, 0x4

    const/16 v0, 0x28

    invoke-static {p2, v0}, Lc7/LessonCountdownManager;->setHomeroom(II)V

    goto :goto_0

    :pswitch_5
    const/4 p2, 0x2

    const/16 v0, 0x23

    invoke-static {p2, v0}, Lc7/LessonCountdownManager;->setHomeroom(II)V

    goto :goto_0

    :pswitch_6
    const/4 p2, 0x3

    const/16 v0, 0x23

    invoke-static {p2, v0}, Lc7/LessonCountdownManager;->setHomeroom(II)V

    goto :goto_0

    :pswitch_7
    invoke-static {}, Lc7/LessonCountdownManager;->resetHomeroom()V

    :goto_0
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method
