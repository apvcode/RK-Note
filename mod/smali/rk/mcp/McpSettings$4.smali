.class Lrk/mcp/McpSettings$4;
.super Ljava/lang/Object;
.source "McpSettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/Runnable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 126
    iput-object p1, p0, Lrk/mcp/McpSettings$4;->val$app:Landroid/content/Context;

    iput-object p2, p0, Lrk/mcp/McpSettings$4;->val$refresh:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 128
    iget-object p1, p0, Lrk/mcp/McpSettings$4;->val$app:Landroid/content/Context;

    invoke-static {p1}, Lrk/mcp/McpSettings;->regenerate(Landroid/content/Context;)Ljava/lang/String;

    .line 129
    iget-object p1, p0, Lrk/mcp/McpSettings$4;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 130
    iget-object p1, p0, Lrk/mcp/McpSettings$4;->val$app:Landroid/content/Context;

    const-string v0, "\u041d\u043e\u0432\u044b\u0439 \u0442\u043e\u043a\u0435\u043d. \u0412 devx \u0432\u0441\u0442\u0430\u0432\u044c \u0435\u0433\u043e \u0437\u0430\u043d\u043e\u0432\u043e"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 131
    return-void
.end method
