.class public final Lc7/DrawerBlurStopRunnable;
.super Ljava/lang/Object;
.source "DrawerBlurStopRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;

# instance fields
.field private final blurView:Leightbitlab/com/blurview/BlurView;

# direct methods
.method public constructor <init>(Leightbitlab/com/blurview/BlurView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/DrawerBlurStopRunnable;->blurView:Leightbitlab/com/blurview/BlurView;

    return-void
.end method

# virtual methods
.method public run()V
    .locals 2

    :try_start
    iget-object v0, p0, Lc7/DrawerBlurStopRunnable;->blurView:Leightbitlab/com/blurview/BlurView;

    if-eqz v0, :done

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Leightbitlab/com/blurview/BlurView;->setBlurAutoUpdate(Z)Leightbitlab/com/blurview/BlurViewFacade;

    :done
    :try_end
    .catchall {:try_start .. :try_end} :ignored

    return-void

    :ignored
    return-void
.end method
