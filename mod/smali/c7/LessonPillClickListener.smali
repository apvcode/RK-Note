.class public final Lc7/LessonPillClickListener;
.super Ljava/lang/Object;
.source "LessonPillClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lc7/ScheduleSettingsHelper;->showMainDialog(Landroid/content/Context;)V

    :cond_0
    return-void
.end method
