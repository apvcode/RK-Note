.class public final Lc7/GreetingHideRunnable;
.super Ljava/lang/Object;
.source "GreetingHideRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public final run()V
    .locals 0

    invoke-static {}, Lc7/GreetingManager;->hideNow()V

    return-void
.end method
