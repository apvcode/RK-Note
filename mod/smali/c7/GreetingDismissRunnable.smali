.class public final Lc7/GreetingDismissRunnable;
.super Ljava/lang/Object;
.source "GreetingDismissRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public final run()V
    .locals 0

    invoke-static {}, Lc7/GreetingManager;->dismissAnimated()V

    return-void
.end method
