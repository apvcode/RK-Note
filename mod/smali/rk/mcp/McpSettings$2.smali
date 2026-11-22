.class Lrk/mcp/McpSettings$2;
.super Ljava/lang/Object;
.source "McpSettings.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrk/mcp/McpSettings;->bind(Landroid/app/Dialog;Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$app:Landroid/content/Context;

.field final synthetic val$refresh:Ljava/lang/Runnable;

.field final synthetic val$ui:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/Runnable;Landroid/os/Handler;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 104
    iput-object p1, p0, Lrk/mcp/McpSettings$2;->val$app:Landroid/content/Context;

    iput-object p2, p0, Lrk/mcp/McpSettings$2;->val$refresh:Ljava/lang/Runnable;

    iput-object p3, p0, Lrk/mcp/McpSettings$2;->val$ui:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    .line 106
    iget-object p1, p0, Lrk/mcp/McpSettings$2;->val$app:Landroid/content/Context;

    invoke-static {p1}, Lrk/mcp/McpSettings;->enabled(Landroid/content/Context;)Z

    move-result p1

    if-ne p2, p1, :cond_9

    return-void

    .line 107
    :cond_9
    iget-object p1, p0, Lrk/mcp/McpSettings$2;->val$app:Landroid/content/Context;

    invoke-static {p1, p2}, Lrk/mcp/McpSettings;->setEnabled(Landroid/content/Context;Z)V

    .line 108
    iget-object p1, p0, Lrk/mcp/McpSettings$2;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 109
    iget-object p1, p0, Lrk/mcp/McpSettings$2;->val$ui:Landroid/os/Handler;

    iget-object p2, p0, Lrk/mcp/McpSettings$2;->val$refresh:Ljava/lang/Runnable;

    const-wide/16 v0, 0x258

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 110
    iget-object p1, p0, Lrk/mcp/McpSettings$2;->val$ui:Landroid/os/Handler;

    iget-object p2, p0, Lrk/mcp/McpSettings$2;->val$refresh:Ljava/lang/Runnable;

    const-wide/16 v0, 0x708

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 111
    return-void
.end method
