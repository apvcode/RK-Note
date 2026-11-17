.class public Lc7/NetworkMonitor;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "NetworkMonitor.java"


# static fields
.field public static a:Lc7/NetworkMonitor;

.field public static b:Z

.field public static c:Ljava/lang/ref/WeakReference;

.field public static d:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    return-void
.end method

.method public static init(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

:cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lc7/NetworkMonitor;->c:Ljava/lang/ref/WeakReference;

    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    if-nez p0, :cond_1

    return-void

:cond_1
    sget-object v0, Lc7/NetworkMonitor;->a:Lc7/NetworkMonitor;

    if-nez v0, :cond_2

    new-instance v0, Lc7/NetworkMonitor;

    invoke-direct {v0}, Lc7/NetworkMonitor;-><init>()V

    sput-object v0, Lc7/NetworkMonitor;->a:Lc7/NetworkMonitor;

    const/4 v1, 0x0

    sput-boolean v1, Lc7/NetworkMonitor;->b:Z

    invoke-virtual {p0, v0}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-void

:catch_0
    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 0

    return-void
.end method

.method public onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V
    .locals 6

    if-nez p2, :cond_0

    return-void

:cond_0
    const/16 p1, 0x10

    invoke-virtual {p2, p1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result p1

    if-eqz p1, :cond_2

    const/16 p1, 0xc

    invoke-virtual {p2, p1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-boolean p1, Lc7/NetworkMonitor;->b:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    sput-boolean p1, Lc7/NetworkMonitor;->b:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lc7/NetworkMonitor;->d:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long p1, v2, v4

    if-lez p1, :cond_1

    sput-wide v0, Lc7/NetworkMonitor;->d:J

    sget-object p1, Lc7/NetworkMonitor;->c:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/eljur/client/feature/main/view/MainActivity;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lc7/NetworkRestoreRunnable;

    invoke-direct {v0, p1}, Lc7/NetworkRestoreRunnable;-><init>(Lcom/eljur/client/feature/main/view/MainActivity;)V

    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

:cond_1
    return-void

:cond_2
    const/4 p1, 0x1

    sput-boolean p1, Lc7/NetworkMonitor;->b:Z

    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 0

    const/4 p1, 0x1

    sput-boolean p1, Lc7/NetworkMonitor;->b:Z

    return-void
.end method
