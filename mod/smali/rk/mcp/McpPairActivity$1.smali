.class Lrk/mcp/McpPairActivity$1;
.super Ljava/lang/Object;
.source "McpPairActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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

    .line 38
    iput-object p1, p0, Lrk/mcp/McpPairActivity$1;->this$0:Lrk/mcp/McpPairActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3

    .line 39
    iget-object p1, p0, Lrk/mcp/McpPairActivity$1;->this$0:Lrk/mcp/McpPairActivity;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lrk/mcp/McpPairActivity;->setResult(I)V

    iget-object p1, p0, Lrk/mcp/McpPairActivity$1;->this$0:Lrk/mcp/McpPairActivity;

    invoke-virtual {p1}, Lrk/mcp/McpPairActivity;->finish()V

    return-void
.end method
