.class Lrk/mcp/McpHttpServer$2$1;
.super Ljava/lang/Object;
.source "McpHttpServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrk/mcp/McpHttpServer$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrk/mcp/McpHttpServer$2;

.field final synthetic val$c:Ljava/net/Socket;


# direct methods
.method constructor <init>(Lrk/mcp/McpHttpServer$2;Ljava/net/Socket;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 63
    iput-object p1, p0, Lrk/mcp/McpHttpServer$2$1;->this$0:Lrk/mcp/McpHttpServer$2;

    iput-object p2, p0, Lrk/mcp/McpHttpServer$2$1;->val$c:Ljava/net/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 63
    iget-object v0, p0, Lrk/mcp/McpHttpServer$2$1;->this$0:Lrk/mcp/McpHttpServer$2;

    iget-object v0, v0, Lrk/mcp/McpHttpServer$2;->val$app:Landroid/content/Context;

    iget-object v1, p0, Lrk/mcp/McpHttpServer$2$1;->val$c:Ljava/net/Socket;

    invoke-static {v0, v1}, Lrk/mcp/McpHttpServer;->access$000(Landroid/content/Context;Ljava/net/Socket;)V

    return-void
.end method
