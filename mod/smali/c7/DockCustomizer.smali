.class public final Lc7/DockCustomizer;
.super Ljava/lang/Object;
.source "DockCustomizer.java"


# static fields
.field public static final ALL_ITEMS:[Ljava/lang/String;

.field public static sCurrentTabId:Ljava/lang/String;

.field private static sDiaryWelcomePlayed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "Diary"

    sput-object v0, Lc7/DockCustomizer;->sCurrentTabId:Ljava/lang/String;

    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Diary"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Marks"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Schedule"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Updates"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "FinalMarks"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Messages"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "Announcements"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "Drawer"

    aput-object v2, v0, v1

    sput-object v0, Lc7/DockCustomizer;->ALL_ITEMS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 5
    .param p0, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;

    if-nez p0, :cond_0

    return-void

    :cond_0
    const v0, 0x7f090084

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/view/ViewGroup;

    # Changing the set of dock buttons must not keep disappearing children
    # alive for a transition; that was the source of the brief ghost icon.
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    :cond_1
    invoke-static {p0}, Lc7/DockCustomizer;->applyDockConfig(Lcom/eljur/client/feature/main/view/MainActivity;)V

    # One calm welcome gesture for the diary/book icon when the main screen is
    # first attached.  It is intentionally not replayed on tab switches.
    sget-boolean v0, Lc7/DockCustomizer;->sDiaryWelcomePlayed:Z
    if-nez v0, :welcome_done
    const/4 v0, 0x1
    sput-boolean v0, Lc7/DockCustomizer;->sDiaryWelcomePlayed:Z
    const v0, 0x7f09016a
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :welcome_done
    const v1, 0x3f47ae14    # 0.78f
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V
    const v1, 0x41400000    # 12.0f
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V
    const/high16 v1, 0x3f800000    # 1.0f
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/high16 v1, 0x3f800000    # 1.0f
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const/4 v1, 0x0
    int-to-float v1, v1
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v1, 0x1a4
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    const-wide/16 v1, 0x96
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v0
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V
    :welcome_done

    invoke-static {p0}, Lc7/TutorialManager;->maybeShow(Lcom/eljur/client/feature/main/view/MainActivity;)V

    return-void
.end method

.method public static applyDockConfig(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 10
    .param p0, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;

    if-nez p0, :cond_0

    return-void

    :cond_0
    const-string v0, "dock_customizer_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "active_items"

    const-string v3, "Diary,Marks,Messages,Announcements,Drawer"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    # Treat the stored CSV as a list of complete item names.  A raw
    # String.contains() made "FinalMarks" accidentally enable "Marks".
    const-string v9, ","

    invoke-virtual {v0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    sget-object v2, Lc7/DockCustomizer;->ALL_ITEMS:[Ljava/lang/String;

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_5

    aget-object v5, v2, v4

    invoke-static {v5}, Lc7/DockCustomizer;->getTabContainerId(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    if-nez v6, :cond_1

    goto :goto_2

    :cond_1
    invoke-interface {v9, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v6, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_2
    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    new-instance v7, Lc7/DockClickListener;

    invoke-direct {v7, p0, v5}, Lc7/DockClickListener;-><init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v8, Lc7/DockLongClickListener;

    invoke-direct {v8, p0, v5}, Lc7/DockLongClickListener;-><init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-static {v5}, Lc7/DockCustomizer;->getTabImageId(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p0, v8}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_img_done

    # Only the full tab container handles touch and animation.  Binding the
    # image as a second touch target let stale child animations flash after
    # the dock configuration changed.
    const/4 v7, 0x0

    invoke-virtual {v8, v7}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v8, v7}, Landroid/view/View;->setLongClickable(Z)V

    invoke-virtual {v8}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/ViewPropertyAnimator;->cancel()V

    :cond_img_done
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    invoke-static {p0, v0}, Lc7/DockCustomizer;->applyDockOrder(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    invoke-static {p0}, Lc7/DockCustomizer;->updateTabHighlight(Lcom/eljur/client/feature/main/view/MainActivity;)V

    invoke-static {p0}, Lc7/ThemeManager;->applyTheme(Lcom/eljur/client/feature/main/view/MainActivity;)V

    return-void
.end method

.method public static applyDockOrder(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 6

    if-eqz p0, :cond_done

    if-eqz p1, :cond_done

    const v0, 0x7f090084

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_done

    check-cast v0, Landroid/view/ViewGroup;

    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x0

:goto_0
    if-ge v2, v1, :cond_done

    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lc7/DockCustomizer;->getTabContainerId(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_next

    invoke-virtual {p0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_next

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

:cond_next
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

:cond_done
    return-void
.end method

.method public static getSelectedOrderString(Landroid/content/Context;Ljava/util/Set;)Ljava/lang/String;
    .locals 8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p1, :cond_return

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    if-eqz p0, :cond_fallback

    const-string v2, "dock_customizer_prefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v2, "active_items"

    const-string v3, "Diary,Marks,Messages,Announcements,Drawer"

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v2, p0

    const/4 v3, 0x0

:goto_saved
    if-ge v3, v2, :cond_fallback

    aget-object v4, p0, v3

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_saved_next

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_saved_append

    const-string v5, ","

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

:cond_saved_append
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

:cond_saved_next
    add-int/lit8 v3, v3, 0x1

    goto :goto_saved

:cond_fallback
    sget-object p0, Lc7/DockCustomizer;->ALL_ITEMS:[Ljava/lang/String;

    array-length v2, p0

    const/4 v3, 0x0

:goto_all
    if-ge v3, v2, :cond_return

    aget-object v4, p0, v3

    invoke-interface {v1, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_all_next

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_all_append

    const-string v5, ","

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

:cond_all_append
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

:cond_all_next
    add-int/lit8 v3, v3, 0x1

    goto :goto_all

:cond_return
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 2

    if-eqz p0, :cond_done

    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_done

    new-instance v1, Lc7/DockMoveFirstClickListener;

    invoke-direct {v1, p2, p3}, Lc7/DockMoveFirstClickListener;-><init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

:cond_done
    return-void
.end method

.method public static onTabSelected(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 2
    .param p0, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;
    .param p1, "tabId"       # Ljava/lang/String;

    if-eqz p1, :cond_0

    const-string v0, "Drawer"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sput-object p1, Lc7/DockCustomizer;->sCurrentTabId:Ljava/lang/String;

    :cond_0
    if-eqz p0, :cond_1

    invoke-static {p0}, Lc7/DockCustomizer;->updateTabHighlight(Lcom/eljur/client/feature/main/view/MainActivity;)V

    const-string v0, "Diary"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lc7/DiaryTabRefreshRunnable;

    invoke-direct {v0, p0}, Lc7/DiaryTabRefreshRunnable;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const-wide/16 p0, 0xfa

    invoke-virtual {v1, v0, p0, p1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method

.method public static updateTabHighlight(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 8
    .param p0, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;

    if-nez p0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lc7/DockCustomizer;->ALL_ITEMS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    aget-object v3, v0, v2

    const-string v4, "Drawer"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_2

    :cond_1
    invoke-static {v3}, Lc7/DockCustomizer;->getTabImageId(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_3

    instance-of v5, v4, Landroid/widget/ImageView;

    if-eqz v5, :cond_3

    check-cast v4, Landroid/widget/ImageView;

    sget-object v5, Lc7/DockCustomizer;->sCurrentTabId:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {p0}, Lc7/ThemeManager;->getAccentColor(Landroid/content/Context;)I

    move-result v5

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, v5, v6}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    # Selected tab lifts slightly above the glass dock.  This runs only when
    # selection is refreshed, not during layout/scrolling.
    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    const/high16 v6, -0x3f800000    # -4.0f
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    const v6, 0x3f828f5c    # 1.02f
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    const-wide/16 v6, 0xb4
    invoke-virtual {v5, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    invoke-virtual {v5}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_2

    :cond_2
    invoke-static {p0}, Lc7/ThemeManager;->getInactiveColor(Landroid/content/Context;)I

    move-result v5

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, v5, v6}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    const/4 v6, 0x0
    int-to-float v6, v6
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    const/high16 v6, 0x3f800000    # 1.0f
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    invoke-virtual {v5, v6}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    const-wide/16 v6, 0x96
    invoke-virtual {v5, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;
    move-result-object v5
    invoke-virtual {v5}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public static onTabClicked(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 5
    .param p0, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;
    .param p1, "itemId"      # Ljava/lang/String;

    if-eqz p0, :cond_exit

    if-nez p1, :cond_not_null

    :cond_exit
    return-void

    :cond_not_null
    const-string v0, "Drawer"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_presenter

    invoke-virtual {p0}, Lcom/eljur/client/feature/main/view/MainActivity;->A0()Ld5/e;

    move-result-object v0

    if-eqz v0, :cond_ret

    iget-object v0, v0, Ld5/e;->a:Landroidx/drawerlayout/widget/DrawerLayout;

    if-eqz v0, :cond_ret

    const v1, 0x800003

    invoke-virtual {v0, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->d(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_ret

    invoke-virtual {v0, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->m(Landroid/view/View;)V

    :cond_ret
    return-void

    :cond_check_presenter
    invoke-virtual {p0}, Lcom/eljur/client/feature/main/view/MainActivity;->B0()Lcom/eljur/client/feature/main/presenter/MainPresenter;

    move-result-object v0

    if-nez v0, :cond_has_presenter

    return-void

    :cond_has_presenter
    iget-object v1, v0, Lcom/eljur/client/feature/main/presenter/MainPresenter;->A:Ljava/util/ArrayList;

    if-eqz v1, :cond_fallback

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_loop
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_fallback

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Lj9/c;

    if-eqz v3, :cond_loop

    move-object v3, v2

    check-cast v3, Lj9/c;

    iget-object v4, v3, Lj9/c;->a:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_loop

    invoke-virtual {p0, v3}, Lcom/eljur/client/feature/main/view/MainActivity;->E0(Lj9/c;)V

    return-void

    :cond_fallback
    const-string v1, "Diary"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_fb_marks

    sget-object v1, Lz6/b;->i:Lz6/b;

    invoke-virtual {v0, v1}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->l(Lcom/bumptech/glide/e;)V

    goto :goto_fb_selected

    :cond_fb_marks
    const-string v1, "Marks"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_fb_sched

    sget-object v1, Lz6/e;->i:Lz6/e;

    invoke-virtual {v0, v1}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->l(Lcom/bumptech/glide/e;)V

    goto :goto_fb_selected

    :cond_fb_sched
    const-string v1, "Schedule"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_fb_upd

    sget-object v1, Lz6/g;->i:Lz6/g;

    invoke-virtual {v0, v1}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->l(Lcom/bumptech/glide/e;)V

    goto :goto_fb_selected

    :cond_fb_upd
    const-string v1, "Updates"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_fb_final

    sget-object v1, Lz6/i;->i:Lz6/i;

    invoke-virtual {v0, v1}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->l(Lcom/bumptech/glide/e;)V

    goto :goto_fb_selected

    :cond_fb_final
    const-string v1, "FinalMarks"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_fb_msg

    sget-object v1, Lz6/d;->i:Lz6/d;

    invoke-virtual {v0, v1}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->l(Lcom/bumptech/glide/e;)V

    goto :goto_fb_selected

    :cond_fb_msg
    const-string v1, "Messages"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_fb_ann

    sget-object v1, Lz6/f;->i:Lz6/f;

    invoke-virtual {v0, v1}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->l(Lcom/bumptech/glide/e;)V

    goto :goto_fb_selected

    :cond_fb_ann
    const-string v1, "Announcements"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_done

    sget-object v1, Lz6/a;->i:Lz6/a;

    invoke-virtual {v0, v1}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->l(Lcom/bumptech/glide/e;)V

    :goto_fb_selected
    invoke-static {p0, p1}, Lc7/DockCustomizer;->onTabSelected(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    :cond_done
    return-void
.end method

.method public static showCustomizerDialog(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 12
    .param p0, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    const v2, 0x7f0c00f3

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setContentView(I)V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    if-eqz v2, :cond_1

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/view/Window;->setGravity(I)V

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-virtual {v2, v3, v4}, Landroid/view/Window;->setLayout(II)V

    const v3, 0x7f12000a

    invoke-virtual {v2, v3}, Landroid/view/Window;->setWindowAnimations(I)V

    :cond_1
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    const-string v2, "dock_customizer_prefs"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v4, "active_items"

    const-string v5, "Diary,Marks,Messages,Announcements,Drawer"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    const-string v5, ","

    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v5, v2

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_3

    aget-object v7, v2, v6

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_2

    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_3
    sget-object v2, Lc7/DockCustomizer;->ALL_ITEMS:[Ljava/lang/String;

    array-length v5, v2

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v5, :cond_5

    aget-object v7, v2, v6

    invoke-static {v7}, Lc7/DockCustomizer;->getChipId(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v0, v8}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_4

    invoke-interface {v4, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    invoke-static {v8, v9}, Lc7/DockCustomizer;->updateChipVisual(Landroid/view/View;Z)V

    new-instance v9, Lc7/DockChipClickListener;

    invoke-direct {v9, p0, v7, v8, v4}, Lc7/DockChipClickListener;-><init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;Landroid/view/View;Ljava/util/Set;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v9, Lc7/DockChipOrderClickListener;

    invoke-direct {v9, p0, v7}, Lc7/DockChipOrderClickListener;-><init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_5
    const v2, 0x7f090399
    const-string v3, "Diary"
    invoke-static {v0, v2, p0, v3}, Lc7/DockCustomizer;->bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    const v2, 0x7f09039a
    const-string v3, "Marks"
    invoke-static {v0, v2, p0, v3}, Lc7/DockCustomizer;->bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    const v2, 0x7f09039b
    const-string v3, "Schedule"
    invoke-static {v0, v2, p0, v3}, Lc7/DockCustomizer;->bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    const v2, 0x7f09039c
    const-string v3, "Updates"
    invoke-static {v0, v2, p0, v3}, Lc7/DockCustomizer;->bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    const v2, 0x7f09039d
    const-string v3, "FinalMarks"
    invoke-static {v0, v2, p0, v3}, Lc7/DockCustomizer;->bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    const v2, 0x7f09039e
    const-string v3, "Messages"
    invoke-static {v0, v2, p0, v3}, Lc7/DockCustomizer;->bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    const v2, 0x7f09039f
    const-string v3, "Announcements"
    invoke-static {v0, v2, p0, v3}, Lc7/DockCustomizer;->bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    const v2, 0x7f0903a0
    const-string v3, "Drawer"
    invoke-static {v0, v2, p0, v3}, Lc7/DockCustomizer;->bindMoveFirst(Landroid/app/Dialog;ILcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    const v2, 0x7f09038c

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_6

    new-instance v5, Lc7/DockActionClickListener;

    const/4 v6, 0x0

    invoke-direct {v5, v6, p0, v0, v4}, Lc7/DockActionClickListener;-><init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;Ljava/util/Set;)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_6
    const v2, 0x7f09038b

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_7

    new-instance v5, Lc7/DockActionClickListener;

    const/4 v6, 0x1

    invoke-direct {v5, v6, p0, v0, v4}, Lc7/DockActionClickListener;-><init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;Ljava/util/Set;)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_7
    const v2, 0x7f090396

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_palette_done

    new-instance v5, Lc7/ThemeActionClickListener;

    const/4 v6, 0x4

    invoke-direct {v5, v6, p0, v0}, Lc7/ThemeActionClickListener;-><init>(ILcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_palette_done
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    const v1, 0x7f09038a    # dock_customizer_sheet
    invoke-static {v0, p0, v1}, Lc7/LiquidGlassDialogHelper;->setup(Landroid/app/Dialog;Landroid/app/Activity;I)V

    return-void
.end method

.method public static updateChipVisual(Landroid/view/View;Z)V
    .locals 2
    .param p0, "chipView"    # Landroid/view/View;
    .param p1, "isActive"    # Z

    if-nez p0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    const v0, 0x7f0701f2

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_1
    const v0, 0x7f0701f3

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_0
    const-string v0, "check_icon"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_2

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_2
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    :goto_1
    return-void
.end method

.method public static refreshAllChips(Landroid/app/Dialog;Ljava/util/Set;)V
    .locals 6
    .param p0, "dialog"      # Landroid/app/Dialog;
    .param p1, "selectedSet" # Ljava/util/Set;

    if-eqz p0, :cond_2

    if-nez p1, :cond_0

    goto :goto_1

    :cond_0
    sget-object v0, Lc7/DockCustomizer;->ALL_ITEMS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    invoke-static {v3}, Lc7/DockCustomizer;->getChipId(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-interface {p1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    invoke-static {v4, v5}, Lc7/DockCustomizer;->updateChipVisual(Landroid/view/View;Z)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public static getChipId(Ljava/lang/String;)I
    .locals 1
    .param p0, "itemId"    # Ljava/lang/String;

    const-string v0, "Diary"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f09038e

    return v0

    :cond_0
    const-string v0, "Marks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f09038f

    return v0

    :cond_1
    const-string v0, "Schedule"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f090390

    return v0

    :cond_2
    const-string v0, "Updates"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const v0, 0x7f090391

    return v0

    :cond_3
    const-string v0, "FinalMarks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const v0, 0x7f090392

    return v0

    :cond_4
    const-string v0, "Messages"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const v0, 0x7f090393

    return v0

    :cond_5
    const-string v0, "Announcements"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const v0, 0x7f090394

    return v0

    :cond_6
    const v0, 0x7f090395

    return v0
.end method

.method public static getTabContainerId(Ljava/lang/String;)I
    .locals 1
    .param p0, "itemId"    # Ljava/lang/String;

    const-string v0, "Diary"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0901ac

    return v0

    :cond_0
    const-string v0, "Marks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f0901af

    return v0

    :cond_1
    const-string v0, "Schedule"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f090380

    return v0

    :cond_2
    const-string v0, "Updates"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const v0, 0x7f090381

    return v0

    :cond_3
    const-string v0, "FinalMarks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const v0, 0x7f090382

    return v0

    :cond_4
    const-string v0, "Messages"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const v0, 0x7f0901b0

    return v0

    :cond_5
    const-string v0, "Announcements"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const v0, 0x7f0901a8

    return v0

    :cond_6
    const v0, 0x7f090383

    return v0
.end method

.method public static getTabImageId(Ljava/lang/String;)I
    .locals 1
    .param p0, "itemId"    # Ljava/lang/String;

    const-string v0, "Diary"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f09016a

    return v0

    :cond_0
    const-string v0, "Marks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f090171

    return v0

    :cond_1
    const-string v0, "Schedule"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f090384

    return v0

    :cond_2
    const-string v0, "Updates"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const v0, 0x7f090385

    return v0

    :cond_3
    const-string v0, "FinalMarks"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const v0, 0x7f090386

    return v0

    :cond_4
    const-string v0, "Messages"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const v0, 0x7f090173

    return v0

    :cond_5
    const-string v0, "Announcements"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const v0, 0x7f090166

    return v0

    :cond_6
    const v0, 0x7f09016b

    return v0
.end method
