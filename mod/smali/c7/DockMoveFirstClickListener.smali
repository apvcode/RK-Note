.class public final Lc7/DockMoveFirstClickListener;
.super Ljava/lang/Object;
.source "DockMoveFirstClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Lcom/eljur/client/feature/main/view/MainActivity;
.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/DockMoveFirstClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    iput-object p2, p0, Lc7/DockMoveFirstClickListener;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    new-instance v0, Lc7/DockChipOrderClickListener;

    iget-object v1, p0, Lc7/DockMoveFirstClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    iget-object p0, p0, Lc7/DockMoveFirstClickListener;->b:Ljava/lang/String;

    invoke-direct {v0, v1, p0}, Lc7/DockChipOrderClickListener;-><init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Lc7/DockChipOrderClickListener;->onLongClick(Landroid/view/View;)Z

    return-void
.end method
