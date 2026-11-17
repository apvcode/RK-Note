.class public final Lc7/DiaryTabRefreshRunnable;
.super Ljava/lang/Object;
.source "DiaryTabRefreshRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/DiaryTabRefreshRunnable;->a:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lc7/DiaryTabRefreshRunnable;->a:Landroid/app/Activity;

    if-eqz v0, :cond_done

    const v1, 0x7f09024e    # recyclerDiary

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_done

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/a1;

    move-result-object v1

    if-eqz v1, :cond_layout

    invoke-virtual {v1}, Landroidx/recyclerview/widget/a1;->notifyDataSetChanged()V

    :cond_layout
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    # RecyclerView has a stale layout after the parent pager becomes visible.
    # A reversible one-pixel scroll wakes its layout pipeline without moving
    # the visible position, matching the effect of the user's first swipe.
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    :cond_done
    return-void
.end method
