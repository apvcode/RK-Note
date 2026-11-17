.class public final Lc7/DockActionClickListener;
.super Ljava/lang/Object;
.source "DockActionClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:I

.field public final b:Lcom/eljur/client/feature/main/view/MainActivity;

.field public final c:Landroid/app/Dialog;

.field public final d:Ljava/util/Set;


# direct methods
.method public constructor <init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;Ljava/util/Set;)V
    .locals 0
    .param p1, "actionType"  # I
    .param p2, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;
    .param p3, "dialog"      # Landroid/app/Dialog;
    .param p4, "selectedSet" # Ljava/util/Set;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lc7/DockActionClickListener;->a:I

    iput-object p2, p0, Lc7/DockActionClickListener;->b:Lcom/eljur/client/feature/main/view/MainActivity;

    iput-object p3, p0, Lc7/DockActionClickListener;->c:Landroid/app/Dialog;

    iput-object p4, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const v2, 0x3f6b851f    # 0.92f

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x46

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lc7/DockAnimResetRunnable;

    invoke-direct {v2, p1}, Lc7/DockAnimResetRunnable;-><init>(Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_0
    iget v1, p0, Lc7/DockActionClickListener;->a:I

    if-nez v1, :cond_1

    iget-object v1, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    iget-object v1, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    const-string v2, "Diary"

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    const-string v2, "Marks"

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    const-string v2, "Messages"

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    const-string v2, "Announcements"

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    const-string v2, "Drawer"

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lc7/DockActionClickListener;->c:Landroid/app/Dialog;

    iget-object v2, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    invoke-static {v1, v2}, Lc7/DockCustomizer;->refreshAllChips(Landroid/app/Dialog;Ljava/util/Set;)V

    return-void

    :cond_1
    iget-object v1, p0, Lc7/DockActionClickListener;->b:Lcom/eljur/client/feature/main/view/MainActivity;

    iget-object v2, p0, Lc7/DockActionClickListener;->d:Ljava/util/Set;

    invoke-static {v1, v2}, Lc7/DockCustomizer;->getSelectedOrderString(Landroid/content/Context;Ljava/util/Set;)Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lc7/DockActionClickListener;->b:Lcom/eljur/client/feature/main/view/MainActivity;

    const-string v2, "dock_customizer_prefs"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "active_items"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lc7/DockActionClickListener;->c:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    iget-object v0, p0, Lc7/DockActionClickListener;->b:Lcom/eljur/client/feature/main/view/MainActivity;

    invoke-static {v0}, Lc7/DockCustomizer;->applyDockConfig(Lcom/eljur/client/feature/main/view/MainActivity;)V

    iget-object v0, p0, Lc7/DockActionClickListener;->b:Lcom/eljur/client/feature/main/view/MainActivity;

    const-string v1, "\u041f\u0430\u043d\u0435\u043b\u044c \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
