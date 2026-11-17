.class public final Lc7/DockLongClickListener;
.super Ljava/lang/Object;
.source "DockLongClickListener.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final a:Lcom/eljur/client/feature/main/view/MainActivity;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "activity"    # Lcom/eljur/client/feature/main/view/MainActivity;
    .param p2, "itemId"      # Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/DockLongClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    iput-object p2, p0, Lc7/DockLongClickListener;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    :cond_0
    iget-object v0, p0, Lc7/DockLongClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    invoke-static {v0}, Lc7/DockCustomizer;->showCustomizerDialog(Lcom/eljur/client/feature/main/view/MainActivity;)V

    const/4 v0, 0x1

    return v0
.end method
