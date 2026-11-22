.class public final Lrk/mcp/McpPairActivity;
.super Landroid/app/Activity;
.source "McpPairActivity.java"


# static fields
.field private static final CLIENT:Ljava/lang/String; = "com.apvcode.devx"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4

    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    const-string p1, "com.apvcode.devx"

    invoke-virtual {p0}, Lrk/mcp/McpPairActivity;->getCallingPackage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_17

    .line 20
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lrk/mcp/McpPairActivity;->setResult(I)V

    .line 21
    invoke-virtual {p0}, Lrk/mcp/McpPairActivity;->finish()V

    .line 22
    return-void

    .line 24
    :cond_17
    new-instance p1, Landroid/app/AlertDialog$Builder;

    const v0, 0x1030226

    invoke-direct {p1, p0, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 25
    const-string v0, "\u0420\u0430\u0437\u0440\u0435\u0448\u0438\u0442\u044c devx?"

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 26
    const-string v0, "\u0410\u0441\u0441\u0438\u0441\u0442\u0435\u043d\u0442 devx \u043d\u0430 \u044d\u0442\u043e\u043c \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435 \u0441\u043c\u043e\u0436\u0435\u0442 \u0447\u0438\u0442\u0430\u0442\u044c \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435, \u0414\u0417, \u043e\u0446\u0435\u043d\u043a\u0438, \u043e\u0431\u044a\u044f\u0432\u043b\u0435\u043d\u0438\u044f \u0438 \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f \u0438\u0437 RK Note \u0438 \u0437\u0430\u043f\u0438\u0441\u044b\u0432\u0430\u0442\u044c \u0432\u0430\u0448\u0438 \u0437\u0430\u043c\u0435\u0442\u043a\u0438 \u043f\u043e \u0414\u0417.\n\n\u0412\u043a\u043b\u044e\u0447\u0438\u0442\u0441\u044f MCP-\u0441\u0435\u0440\u0432\u0435\u0440: \u043e\u043d \u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d \u0442\u043e\u043b\u044c\u043a\u043e \u043d\u0430 \u044d\u0442\u043e\u043c \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435, \u0432\u044b\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u0435\u0433\u043e \u043c\u043e\u0436\u043d\u043e \u0432 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430\u0445 RK Note."

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lrk/mcp/McpPairActivity$3;

    invoke-direct {v0, p0}, Lrk/mcp/McpPairActivity$3;-><init>(Lrk/mcp/McpPairActivity;)V

    .line 27
    const-string v1, "\u0420\u0430\u0437\u0440\u0435\u0448\u0438\u0442\u044c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lrk/mcp/McpPairActivity$2;

    invoke-direct {v0, p0}, Lrk/mcp/McpPairActivity$2;-><init>(Lrk/mcp/McpPairActivity;)V

    .line 35
    const-string v1, "\u041d\u0435 \u0440\u0430\u0437\u0440\u0435\u0448\u0430\u0442\u044c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lrk/mcp/McpPairActivity$1;

    invoke-direct {v0, p0}, Lrk/mcp/McpPairActivity$1;-><init>(Lrk/mcp/McpPairActivity;)V

    .line 38
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 41
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 42
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    .line 43
    return-void
.end method
