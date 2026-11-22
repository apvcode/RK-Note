.class Lrk/mcp/McpPairActivity$3;
.super Ljava/lang/Object;
.source "McpPairActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrk/mcp/McpPairActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrk/mcp/McpPairActivity;


# direct methods
.method constructor <init>(Lrk/mcp/McpPairActivity;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 27
    iput-object p1, p0, Lrk/mcp/McpPairActivity$3;->this$0:Lrk/mcp/McpPairActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 29
    iget-object p1, p0, Lrk/mcp/McpPairActivity$3;->this$0:Lrk/mcp/McpPairActivity;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lrk/mcp/McpSettings;->setEnabled(Landroid/content/Context;Z)V

    .line 30
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    iget-object p2, p0, Lrk/mcp/McpPairActivity$3;->this$0:Lrk/mcp/McpPairActivity;

    invoke-static {p2}, Lrk/mcp/McpSettings;->token(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "token"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "url"

    const-string v0, "http://127.0.0.1:47822/mcp"

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 31
    iget-object p2, p0, Lrk/mcp/McpPairActivity$3;->this$0:Lrk/mcp/McpPairActivity;

    const/4 v0, -0x1

    invoke-virtual {p2, v0, p1}, Lrk/mcp/McpPairActivity;->setResult(ILandroid/content/Intent;)V

    .line 32
    iget-object p1, p0, Lrk/mcp/McpPairActivity$3;->this$0:Lrk/mcp/McpPairActivity;

    invoke-virtual {p1}, Lrk/mcp/McpPairActivity;->finish()V

    .line 33
    return-void
.end method
