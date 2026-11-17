.class public final Lc7/SplashNavRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lo9/y;

.field public final b:Llb/h;


# direct methods
.method public constructor <init>(Lo9/y;Llb/h;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/SplashNavRunnable;->a:Lo9/y;

    iput-object p2, p0, Lc7/SplashNavRunnable;->b:Llb/h;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lc7/SplashNavRunnable;->a:Lo9/y;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lc7/SplashNavRunnable;->b:Llb/h;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Lo9/y;->c(Llb/h;)V

    :cond_0
    return-void
.end method
