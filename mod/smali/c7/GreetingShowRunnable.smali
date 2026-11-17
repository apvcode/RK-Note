.class public final Lc7/GreetingShowRunnable;
.super Ljava/lang/Object;
.source "GreetingShowRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public final run()V
    .locals 0

    invoke-static {}, Lc7/GreetingManager;->showDelayed()V

    return-void
.end method
