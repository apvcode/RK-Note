.class public final Lc7/LessonTickerRunnable;
.super Ljava/lang/Object;
.source "LessonTickerRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    invoke-static {}, Lc7/LessonCountdownManager;->updateTick()V

    sget-object v0, Lc7/LessonCountdownManager;->sHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method
