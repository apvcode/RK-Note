.class public final Lc7/LogoutDialogClickListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final a:Lcom/eljur/client/feature/main/view/MainActivity;


# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/LogoutDialogClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object v0, p0, Lc7/LogoutDialogClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    invoke-virtual {v0}, Lcom/eljur/client/feature/main/view/MainActivity;->B0()Lcom/eljur/client/feature/main/presenter/MainPresenter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/eljur/client/feature/main/presenter/MainPresenter;->k()V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
