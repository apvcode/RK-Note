.class public final Lc7/SettingsClickListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Lcom/eljur/client/feature/main/view/MainActivity;


# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/SettingsClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lc7/SettingsClickListener;->a:Lcom/eljur/client/feature/main/view/MainActivity;

    invoke-virtual {v0}, Lcom/eljur/client/feature/main/view/MainActivity;->s()V

    invoke-static {v0}, Lc7/ThemeManager;->showThemeCustomizerDialog(Lcom/eljur/client/feature/main/view/MainActivity;)V

    return-void
.end method
