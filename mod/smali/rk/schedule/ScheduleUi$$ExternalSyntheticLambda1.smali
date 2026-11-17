.class public final synthetic Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda1;->f$0:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleUi$$ExternalSyntheticLambda1;->f$0:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lrk/schedule/ScheduleUi;->lambda$press$0(Landroid/content/Context;Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
