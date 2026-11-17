.class public final Lrk/diary/DiaryUi$Progress;
.super Landroid/view/View;
.source "DiaryUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/diary/DiaryUi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Progress"
.end annotation


# instance fields
.field private active:Z

.field private color:I

.field private fraction:F

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 80
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 79
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lrk/diary/DiaryUi$Progress;->paint:Landroid/graphics/Paint;

    .line 80
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lrk/diary/DiaryUi$Progress;->setVisibility(I)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lrk/diary/DiaryUi$Progress;->setClickable(Z)V

    invoke-virtual {p0, p1}, Lrk/diary/DiaryUi$Progress;->setFocusable(Z)V

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lrk/diary/DiaryUi$Progress;->setImportantForAccessibility(I)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 22

    .line 82
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v1, v0, Lrk/diary/DiaryUi$Progress;->active:Z

    if-nez v1, :cond_a

    return-void

    :cond_a
    invoke-virtual {v0}, Lrk/diary/DiaryUi$Progress;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, v0, Lrk/diary/DiaryUi$Progress;->paint:Landroid/graphics/Paint;

    iget v3, v0, Lrk/diary/DiaryUi$Progress;->color:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-static {v1, v2}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v3

    int-to-float v5, v3

    invoke-static {v1, v2}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v2

    int-to-float v6, v2

    invoke-virtual {v0}, Lrk/diary/DiaryUi$Progress;->getHeight()I

    move-result v2

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v1, v3}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v8, v2

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v3

    int-to-float v3, v3

    add-float v7, v5, v3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v1, v3}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v4

    int-to-float v9, v4

    invoke-static {v1, v3}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v4

    int-to-float v10, v4

    iget-object v11, v0, Lrk/diary/DiaryUi$Progress;->paint:Landroid/graphics/Paint;

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x42500000    # 52.0f

    invoke-static {v1, v4}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v4

    int-to-float v13, v4

    invoke-virtual {v0}, Lrk/diary/DiaryUi$Progress;->getWidth()I

    move-result v4

    const/high16 v5, 0x41800000    # 16.0f

    invoke-static {v1, v5}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v15, v4

    invoke-virtual {v0}, Lrk/diary/DiaryUi$Progress;->getHeight()I

    move-result v4

    const/high16 v5, 0x40400000    # 3.0f

    invoke-static {v1, v5}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v14, v4

    iget-object v4, v0, Lrk/diary/DiaryUi$Progress;->paint:Landroid/graphics/Paint;

    iget v5, v0, Lrk/diary/DiaryUi$Progress;->color:I

    const v6, 0xffffff

    and-int/2addr v5, v6

    const/high16 v6, 0x20000000

    or-int/2addr v5, v6

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    invoke-static {v1, v2}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v4

    int-to-float v4, v4

    add-float v16, v14, v4

    invoke-static {v1, v3}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v1, v3}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v5

    int-to-float v5, v5

    iget-object v6, v0, Lrk/diary/DiaryUi$Progress;->paint:Landroid/graphics/Paint;

    move-object/from16 v12, p1

    move/from16 v17, v4

    move/from16 v18, v5

    move-object/from16 v19, v6

    invoke-virtual/range {v12 .. v19}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v4, v0, Lrk/diary/DiaryUi$Progress;->paint:Landroid/graphics/Paint;

    iget v5, v0, Lrk/diary/DiaryUi$Progress;->color:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    sub-float/2addr v15, v13

    iget v4, v0, Lrk/diary/DiaryUi$Progress;->fraction:F

    mul-float v15, v15, v4

    add-float/2addr v15, v13

    invoke-static {v1, v2}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v2

    int-to-float v2, v2

    add-float v16, v14, v2

    invoke-static {v1, v3}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v3}, Lrk/diary/DiaryUi;->access$100(Landroid/content/Context;F)I

    move-result v1

    int-to-float v1, v1

    iget-object v3, v0, Lrk/diary/DiaryUi$Progress;->paint:Landroid/graphics/Paint;

    move/from16 v18, v1

    move/from16 v17, v2

    move-object/from16 v19, v3

    invoke-virtual/range {v12 .. v19}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method set(ZFI)V
    .registers 8

    .line 81
    iget-boolean v0, p0, Lrk/diary/DiaryUi$Progress;->active:Z

    const/4 v1, 0x0

    if-eq v0, p1, :cond_7

    const/4 v0, 0x1

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    iput-boolean p1, p0, Lrk/diary/DiaryUi$Progress;->active:Z

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    const/4 v3, 0x0

    invoke-static {v3, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Lrk/diary/DiaryUi$Progress;->fraction:F

    iput p3, p0, Lrk/diary/DiaryUi$Progress;->color:I

    if-eqz p1, :cond_42

    if-eqz v0, :cond_3e

    invoke-virtual {p0, v1}, Lrk/diary/DiaryUi$Progress;->setVisibility(I)V

    invoke-virtual {p0}, Lrk/diary/DiaryUi$Progress;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lrk/schedule/ScheduleUi;->motion(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_3e

    invoke-virtual {p0, v3}, Lrk/diary/DiaryUi$Progress;->setAlpha(F)V

    invoke-virtual {p0}, Lrk/diary/DiaryUi$Progress;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 p2, 0xb4

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_3e
    invoke-virtual {p0}, Lrk/diary/DiaryUi$Progress;->invalidate()V

    goto :goto_52

    :cond_42
    if-eqz v0, :cond_52

    invoke-virtual {p0}, Lrk/diary/DiaryUi$Progress;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p0, v2}, Lrk/diary/DiaryUi$Progress;->setAlpha(F)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lrk/diary/DiaryUi$Progress;->setVisibility(I)V

    :cond_52
    :goto_52
    return-void
.end method
