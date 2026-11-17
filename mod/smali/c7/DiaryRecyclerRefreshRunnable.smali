.class public final Lc7/DiaryRecyclerRefreshRunnable;
.super Ljava/lang/Object;
.source "DiaryRecyclerRefreshRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/DiaryRecyclerRefreshRunnable;->a:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lc7/DiaryRecyclerRefreshRunnable;->a:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_done

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/a1;

    move-result-object v1

    if-eqz v1, :cond_layout

    invoke-virtual {v1}, Landroidx/recyclerview/widget/a1;->notifyDataSetChanged()V

    :cond_layout
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    :cond_done
    return-void
.end method
