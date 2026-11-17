.class public final Lc7/BlurSetupRunnable;
.super Ljava/lang/Object;
.source "BlurSetupRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/BlurSetupRunnable;->a:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lc7/BlurSetupRunnable;->a:Landroid/app/Activity;

    invoke-static {v0}, Lc7/BlurHelper;->setupInternal(Landroid/app/Activity;)V

    return-void
.end method
