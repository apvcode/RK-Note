.class Lrk/schedule/ScheduleUi$1;
.super Landroid/view/ViewOutlineProvider;
.source "ScheduleUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrk/schedule/ScheduleUi;->glass(Landroid/app/Dialog;Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;IIZ)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$c:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 53
    iput-object p1, p0, Lrk/schedule/ScheduleUi$1;->val$c:Landroid/content/Context;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .registers 9

    .line 53
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    iget-object p1, p0, Lrk/schedule/ScheduleUi$1;->val$c:Landroid/content/Context;

    const/high16 v0, 0x41d00000    # 26.0f

    invoke-static {p1, v0}, Lrk/schedule/ScheduleUi;->dp(Landroid/content/Context;F)I

    move-result p1

    int-to-float v5, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    return-void
.end method
