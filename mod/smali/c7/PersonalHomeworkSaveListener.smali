.class public final Lc7/PersonalHomeworkSaveListener;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;

.field public final a:Landroid/view/View;
.field public final b:Ljava/lang/String;
.field public final c:Landroid/widget/EditText;

.method public constructor <init>(Landroid/view/View;Ljava/lang/String;Landroid/widget/EditText;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/PersonalHomeworkSaveListener;->a:Landroid/view/View;
    iput-object p2, p0, Lc7/PersonalHomeworkSaveListener;->b:Ljava/lang/String;
    iput-object p3, p0, Lc7/PersonalHomeworkSaveListener;->c:Landroid/widget/EditText;
    return-void
.end method

.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    iget-object v0, p0, Lc7/PersonalHomeworkSaveListener;->a:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
    iget-object v2, p0, Lc7/PersonalHomeworkSaveListener;->c:Landroid/widget/EditText;
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v2
    const-string v3, "personal_homework"
    const/4 p2, 0x0
    invoke-virtual {v1, v3, p2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v3
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v3
    iget-object p0, p0, Lc7/PersonalHomeworkSaveListener;->b:Ljava/lang/String;
    invoke-interface {v3, p0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v3
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V
    # Refresh the indicator immediately; the value is persisted only in this app's preferences.
    invoke-static {v0, v1, p0}, Lc7/PersonalHomeworkHelper;->render(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method
