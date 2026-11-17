.class public final Lc7/OfflineManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llg/d;


# instance fields
.field public final a:Lga/t0;


# direct methods
.method public constructor <init>(Lga/t0;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/OfflineManager;->a:Lga/t0;

    return-void
.end method

.method public static getOfflineProfile(Lga/t0;)Lsa/b;
    .locals 3

    if-eqz p0, :cond_1

    iget-object v0, p0, Lga/t0;->b:Lha/a;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lha/a;->d()Lcom/eljur/domain/entity/ProfileEntity;

    move-result-object v1

    invoke-virtual {v0}, Lha/a;->b()Lcom/eljur/domain/entity/AuthOptionsEntity;

    move-result-object v0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/eljur/domain/entity/ProfileEntity;->f()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object p0, p0, Lga/t0;->i:Lga/v;

    if-eqz p0, :cond_0

    invoke-virtual {p0, v2}, Lga/v;->a(Ljava/lang/String;)V

    :cond_0
    new-instance p0, Lsa/b;

    invoke-direct {p0, v1, v0}, Lsa/b;-><init>(Lcom/eljur/domain/entity/ProfileEntity;Lcom/eljur/domain/entity/AuthOptionsEntity;)V

    return-object p0

    :cond_1
    new-instance p0, Lsa/b;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lsa/b;-><init>(Lcom/eljur/domain/entity/ProfileEntity;Lcom/eljur/domain/entity/AuthOptionsEntity;)V

    return-object p0
.end method

.method public static isNetworkConnected(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

:cond_0
    :try_start_0
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    if-nez p0, :cond_1

    return v0

:cond_1
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0

:catch_0
    return v0
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    iget-object p1, p0, Lc7/OfflineManager;->a:Lga/t0;

    invoke-static {p1}, Lc7/OfflineManager;->getOfflineProfile(Lga/t0;)Lsa/b;

    move-result-object p1

    return-object p1
.end method
