.class Lrk/mcp/McpHttpServer$2;
.super Ljava/lang/Object;
.source "McpHttpServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrk/mcp/McpHttpServer;->start(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$app:Landroid/content/Context;

.field final synthetic val$s:Ljava/net/ServerSocket;


# direct methods
.method constructor <init>(Ljava/net/ServerSocket;Landroid/content/Context;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 57
    iput-object p1, p0, Lrk/mcp/McpHttpServer$2;->val$s:Ljava/net/ServerSocket;

    iput-object p2, p0, Lrk/mcp/McpHttpServer$2;->val$app:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 59
    nop

    :goto_1
    iget-object v0, p0, Lrk/mcp/McpHttpServer$2;->val$s:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_32

    .line 61
    :try_start_9
    iget-object v0, p0, Lrk/mcp/McpHttpServer$2;->val$s:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_f} :catch_21

    .line 63
    :try_start_f
    invoke-static {}, Lrk/mcp/McpHttpServer;->access$100()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lrk/mcp/McpHttpServer$2$1;

    invoke-direct {v2, p0, v0}, Lrk/mcp/McpHttpServer$2$1;-><init>(Lrk/mcp/McpHttpServer$2;Ljava/net/Socket;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1b
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_1b} :catch_1c
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_1b} :catch_21

    .line 66
    goto :goto_31

    .line 64
    :catch_1c
    move-exception v1

    .line 65
    :try_start_1d
    invoke-static {v0}, Lrk/mcp/McpHttpServer;->access$200(Ljava/net/Socket;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_20} :catch_21

    goto :goto_31

    .line 67
    :catch_21
    move-exception v0

    .line 68
    iget-object v1, p0, Lrk/mcp/McpHttpServer$2;->val$s:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v1

    if-nez v1, :cond_31

    const-string v1, "RKMcp"

    const-string v2, "accept"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 69
    :cond_31
    :goto_31
    goto :goto_1

    .line 71
    :cond_32
    return-void
.end method
