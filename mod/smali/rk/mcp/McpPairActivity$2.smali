.class Lrk/mcp/McpPairActivity$2;
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

    .line 35
    iput-object p1, p0, Lrk/mcp/McpPairActivity$2;->this$0:Lrk/mcp/McpPairActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 36
    iget-object p1, p0, Lrk/mcp/McpPairActivity$2;->this$0:Lrk/mcp/McpPairActivity;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lrk/mcp/McpPairActivity;->setResult(I)V

    iget-object p1, p0, Lrk/mcp/McpPairActivity$2;->this$0:Lrk/mcp/McpPairActivity;

    invoke-virtual {p1}, Lrk/mcp/McpPairActivity;->finish()V

    return-void
.end method
