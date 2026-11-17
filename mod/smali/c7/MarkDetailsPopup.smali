.class public final Lc7/MarkDetailsPopup;
.super Ljava/lang/Object;
.source "MarkDetailsPopup.java"


# static fields
.field private static current:Landroid/widget/PopupWindow;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static show(Landroid/view/View;Ljava/lang/CharSequence;I)V
    .locals 0
    invoke-static {p0, p1, p2}, Lrk/diary/DiaryUi;->showMarkDetails(Landroid/view/View;Ljava/lang/CharSequence;I)V
    return-void
.end method
