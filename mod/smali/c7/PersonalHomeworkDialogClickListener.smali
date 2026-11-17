.class public final Lc7/PersonalHomeworkDialogClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field public final a:Landroid/app/Dialog;
.field public final b:Landroid/view/View;
.field public final c:Ljava/lang/String;
.field public final d:Landroid/widget/EditText;

.method public constructor <init>(Landroid/app/Dialog;Landroid/view/View;Ljava/lang/String;Landroid/widget/EditText;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/PersonalHomeworkDialogClickListener;->a:Landroid/app/Dialog;
    iput-object p2, p0, Lc7/PersonalHomeworkDialogClickListener;->b:Landroid/view/View;
    iput-object p3, p0, Lc7/PersonalHomeworkDialogClickListener;->c:Ljava/lang/String;
    iput-object p4, p0, Lc7/PersonalHomeworkDialogClickListener;->d:Landroid/widget/EditText;
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 5
    iget-object v0, p0, Lc7/PersonalHomeworkDialogClickListener;->d:Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    iget-object v1, p0, Lc7/PersonalHomeworkDialogClickListener;->b:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v2
    const-string v3, "personal_homework"
    const/4 v4, 0x0
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v3
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v3
    iget-object v4, p0, Lc7/PersonalHomeworkDialogClickListener;->c:Ljava/lang/String;
    invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v3
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V
    invoke-static {v1, v2, v4}, Lc7/PersonalHomeworkHelper;->render(Landroid/view/View;Landroid/content/Context;Ljava/lang/String;)V
    iget-object v0, p0, Lc7/PersonalHomeworkDialogClickListener;->a:Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    return-void
.end method
