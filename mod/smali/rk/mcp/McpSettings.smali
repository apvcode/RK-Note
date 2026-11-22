.class public final Lrk/mcp/McpSettings;
.super Ljava/lang/Object;
.source "McpSettings.java"


# static fields
.field public static final PORT:I = 0xbace

.field public static final PREFS:Ljava/lang/String; = "rk_mcp"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/app/Dialog;Landroid/app/Activity;)V
    .registers 9

    .line 77
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    .line 78
    :cond_7
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    .line 79
    const-string v0, "rk_mcp_switch"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 80
    const-string v1, "rk_mcp_panel"

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    .line 81
    const-string v2, "rk_mcp_token"

    invoke-virtual {p0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 82
    const-string v3, "rk_mcp_status"

    invoke-virtual {p0, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 83
    const-string v4, "rk_mcp_copy"

    invoke-virtual {p0, v4}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    .line 84
    const-string v5, "rk_mcp_renew"

    invoke-virtual {p0, v5}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 85
    instance-of v5, v0, Landroid/widget/CompoundButton;

    if-eqz v5, :cond_7e

    if-eqz v1, :cond_7e

    if-eqz v2, :cond_7e

    if-nez v3, :cond_42

    goto :goto_7e

    .line 86
    :cond_42
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 87
    nop

    .line 88
    check-cast v0, Landroid/widget/CompoundButton;

    .line 89
    new-instance v5, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 90
    new-instance v6, Lrk/mcp/McpSettings$1;

    invoke-direct {v6, p1, v1, v2, v3}, Lrk/mcp/McpSettings$1;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 102
    invoke-static {p1}, Lrk/mcp/McpSettings;->enabled(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 103
    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    .line 104
    new-instance v1, Lrk/mcp/McpSettings$2;

    invoke-direct {v1, p1, v6, v5}, Lrk/mcp/McpSettings$2;-><init>(Landroid/content/Context;Ljava/lang/Runnable;Landroid/os/Handler;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 113
    if-eqz v4, :cond_73

    new-instance v0, Lrk/mcp/McpSettings$3;

    invoke-direct {v0, p1}, Lrk/mcp/McpSettings$3;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    :cond_73
    if-eqz p0, :cond_7d

    new-instance v0, Lrk/mcp/McpSettings$4;

    invoke-direct {v0, p1, v6}, Lrk/mcp/McpSettings$4;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_7d
    .catchall {:try_start_0 .. :try_end_7d} :catchall_7f

    .line 135
    :cond_7d
    goto :goto_87

    .line 85
    :cond_7e
    :goto_7e
    return-void

    .line 133
    :catchall_7f
    move-exception p0

    .line 134
    const-string p1, "RKMcp"

    const-string v0, "Settings block"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 136
    :goto_87
    return-void
.end method

.method public static enabled(Landroid/content/Context;)Z
    .registers 3

    .line 32
    invoke-static {p0}, Lrk/mcp/McpSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "enabled"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static newToken()Ljava/lang/String;
    .registers 7

    .line 52
    const/16 v0, 0x18

    new-array v1, v0, [B

    .line 53
    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "rk_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_15
    if-ge v4, v0, :cond_2e

    aget-byte v5, v1, v4

    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v5, v6, v3

    const-string v5, "%02x"

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    .line 56
    :cond_2e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 30
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "rk_mcp"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized regenerate(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    const-class v0, Lrk/mcp/McpSettings;

    monitor-enter v0

    .line 46
    :try_start_3
    invoke-static {}, Lrk/mcp/McpSettings;->newToken()Ljava/lang/String;

    move-result-object v1

    .line 47
    invoke-static {p0}, Lrk/mcp/McpSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v2, "token"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_1a

    .line 48
    monitor-exit v0

    return-object v1

    .line 45
    :catchall_1a
    move-exception p0

    :try_start_1b
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    throw p0
.end method

.method public static resume(Landroid/content/Context;)V
    .registers 2

    .line 66
    :try_start_0
    invoke-static {p0}, Lrk/mcp/McpSettings;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {p0}, Lrk/mcp/McpSettings;->start(Landroid/content/Context;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    goto :goto_b

    :catchall_a
    move-exception p0

    .line 67
    :cond_b
    :goto_b
    return-void
.end method

.method public static setEnabled(Landroid/content/Context;Z)V
    .registers 4

    .line 60
    invoke-static {p0}, Lrk/mcp/McpSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "enabled"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 61
    if-eqz p1, :cond_17

    invoke-static {p0}, Lrk/mcp/McpSettings;->start(Landroid/content/Context;)V

    goto :goto_1a

    :cond_17
    invoke-static {p0}, Lrk/mcp/McpSettings;->stop(Landroid/content/Context;)V

    .line 62
    :goto_1a
    return-void
.end method

.method static start(Landroid/content/Context;)V
    .registers 1

    .line 70
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lrk/mcp/McpHttpServer;->start(Landroid/content/Context;)V

    return-void
.end method

.method static stop(Landroid/content/Context;)V
    .registers 1

    .line 72
    invoke-static {}, Lrk/mcp/McpHttpServer;->stop()V

    return-void
.end method

.method public static declared-synchronized token(Landroid/content/Context;)Ljava/lang/String;
    .registers 5

    const-class v0, Lrk/mcp/McpSettings;

    monitor-enter v0

    .line 36
    :try_start_3
    invoke-static {p0}, Lrk/mcp/McpSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 37
    const-string v1, "token"

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 38
    if-eqz v1, :cond_18

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x20

    if-ge v2, v3, :cond_29

    .line 39
    :cond_18
    invoke-static {}, Lrk/mcp/McpSettings;->newToken()Ljava/lang/String;

    move-result-object v1

    .line 40
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v2, "token"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_29
    .catchall {:try_start_3 .. :try_end_29} :catchall_2b

    .line 42
    :cond_29
    monitor-exit v0

    return-object v1

    .line 35
    :catchall_2b
    move-exception p0

    :try_start_2c
    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_2b

    throw p0
.end method
