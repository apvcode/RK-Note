.class public final Lc7/UiCustomizationOpenClickListener;
.super Ljava/lang/Object;
.source "UiCustomizationOpenClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;

# instance fields
.field private final activity:Lcom/eljur/client/feature/main/view/MainActivity;
.field private final parentDialog:Landroid/app/Dialog;

# direct methods
.method public constructor <init>(Lcom/eljur/client/feature/main/view/MainActivity;Landroid/app/Dialog;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/UiCustomizationOpenClickListener;->activity:Lcom/eljur/client/feature/main/view/MainActivity;
    iput-object p2, p0, Lc7/UiCustomizationOpenClickListener;->parentDialog:Landroid/app/Dialog;
    return-void
.end method

# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    iget-object v0, p0, Lc7/UiCustomizationOpenClickListener;->parentDialog:Landroid/app/Dialog;
    if-eqz v0, :open
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    :open
    iget-object v0, p0, Lc7/UiCustomizationOpenClickListener;->activity:Lcom/eljur/client/feature/main/view/MainActivity;
    invoke-static {v0}, Lc7/UiCustomizationManager;->showDialog(Lcom/eljur/client/feature/main/view/MainActivity;)V
    return-void
.end method
