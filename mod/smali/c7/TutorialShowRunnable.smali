.class public final Lc7/TutorialShowRunnable;
.super Ljava/lang/Object;
.source "TutorialShowRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public final run()V
    .locals 1
    const/4 v0, 0x0
    invoke-static {v0}, Lc7/TutorialManager;->showStep(I)V
    return-void
.end method
