.class public final Lc7/DockChipOrderClickListener;
.super Ljava/lang/Object;
.source "DockChipOrderClickListener.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final a:Lcom/eljur/client/feature/main/view/MainActivity;
.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/DockChipOrderClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    iput-object p2, p0, Lc7/DockChipOrderClickListener;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 7

    iget-object p1, p0, Lc7/DockChipOrderClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    if-eqz p1, :cond_no

    iget-object v0, p0, Lc7/DockChipOrderClickListener;->b:Ljava/lang/String;

    const-string v1, "dock_customizer_prefs"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v3, "active_items"

    const-string v4, "Diary,Marks,Messages,Announcements,Drawer"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_no

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v4, v1

    const/4 v5, 0x0

:goto_0
    if-ge v5, v4, :cond_save

    aget-object v6, v1, v5

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_next

    const-string v6, ","

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v6, v1, v5

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

:cond_next
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

:cond_save
    const-string v0, "dock_customizer_prefs"

    invoke-virtual {p1, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "active_items"

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {p1}, Lc7/DockCustomizer;->applyDockConfig(Lcom/eljur/client/feature/main/view/MainActivity;)V

    const-string v0, "Кнопка перемещена в начало панели"

    invoke-static {p1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    const/4 p1, 0x1

    return p1

:cond_no
    const/4 p1, 0x0

    return p1
.end method
