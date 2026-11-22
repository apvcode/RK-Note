.class Lrk/mcp/McpSettings$1;
.super Ljava/lang/Object;
.source "McpSettings.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$panel:Landroid/view/View;

.field final synthetic val$status:Landroid/widget/TextView;

.field final synthetic val$token:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 90
    iput-object p1, p0, Lrk/mcp/McpSettings$1;->val$app:Landroid/content/Context;

    iput-object p2, p0, Lrk/mcp/McpSettings$1;->val$panel:Landroid/view/View;

    iput-object p3, p0, Lrk/mcp/McpSettings$1;->val$token:Landroid/widget/TextView;

    iput-object p4, p0, Lrk/mcp/McpSettings$1;->val$status:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 92
    iget-object v0, p0, Lrk/mcp/McpSettings$1;->val$app:Landroid/content/Context;

    invoke-static {v0}, Lrk/mcp/McpSettings;->enabled(Landroid/content/Context;)Z

    move-result v0

    .line 93
    iget-object v1, p0, Lrk/mcp/McpSettings$1;->val$panel:Landroid/view/View;

    if-eqz v0, :cond_c

    const/4 v2, 0x0

    goto :goto_e

    :cond_c
    const/16 v2, 0x8

    :goto_e
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 94
    iget-object v1, p0, Lrk/mcp/McpSettings$1;->val$token:Landroid/widget/TextView;

    if-eqz v0, :cond_1c

    iget-object v2, p0, Lrk/mcp/McpSettings$1;->val$app:Landroid/content/Context;

    invoke-static {v2}, Lrk/mcp/McpSettings;->token(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1e

    :cond_1c
    const-string v2, ""

    :goto_1e
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    if-nez v0, :cond_24

    return-void

    .line 96
    :cond_24
    invoke-static {}, Lrk/mcp/McpHttpServer;->error()Ljava/lang/String;

    move-result-object v0

    .line 97
    invoke-static {}, Lrk/mcp/McpHttpServer;->running()Z

    move-result v1

    if-eqz v1, :cond_36

    iget-object v0, p0, Lrk/mcp/McpSettings$1;->val$status:Landroid/widget/TextView;

    const-string v1, "\u0420\u0430\u0431\u043e\u0442\u0430\u0435\u0442: 127.0.0.1:47822. \u0414\u043e\u0441\u0442\u0443\u043f\u0435\u043d \u0442\u043e\u043b\u044c\u043a\u043e \u043d\u0430 \u044d\u0442\u043e\u043c \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_58

    .line 98
    :cond_36
    if-eqz v0, :cond_51

    iget-object v1, p0, Lrk/mcp/McpSettings$1;->val$status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0437\u0430\u043f\u0443\u0441\u0442\u0438\u043b\u0441\u044f: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_58

    .line 99
    :cond_51
    iget-object v0, p0, Lrk/mcp/McpSettings$1;->val$status:Landroid/widget/TextView;

    const-string v1, "\u0417\u0430\u043f\u0443\u0441\u043a\u0430\u0435\u0442\u0441\u044f\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    :goto_58
    return-void
.end method
