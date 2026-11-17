.class public final Lc7/NetworkRestoreRunnable;
.super Ljava/lang/Object;
.source "NetworkRestoreRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lcom/eljur/client/feature/main/view/MainActivity;


# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/NetworkRestoreRunnable;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lc7/NetworkRestoreRunnable;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lt4/c;->e:Lt4/c;

    const-string v2, "\u041f\u043e\u0434\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u0435 \u043a \u0441\u0435\u0442\u0438 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043e"

    invoke-virtual {v0, v1, v2}, Lcom/eljur/client/feature/main/view/MainActivity;->W(Lt4/c;Ljava/lang/String;)V

:cond_0
    return-void
.end method
