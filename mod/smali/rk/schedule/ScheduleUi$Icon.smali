.class public final Lrk/schedule/ScheduleUi$Icon;
.super Landroid/view/View;
.source "ScheduleUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/schedule/ScheduleUi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Icon"
.end annotation


# instance fields
.field private final color:I

.field private final kind:I

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 5

    .line 72
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 71
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    .line 72
    iput p2, p0, Lrk/schedule/ScheduleUi$Icon;->kind:I

    iput p3, p0, Lrk/schedule/ScheduleUi$Icon;->color:I

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lrk/schedule/ScheduleUi$Icon;->setImportantForAccessibility(I)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 14

    .line 74
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Lrk/schedule/ScheduleUi$Icon;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lrk/schedule/ScheduleUi$Icon;->getWidth()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x41c00000    # 24.0f

    mul-float v3, v3, v1

    sub-float/2addr v2, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v2, v4

    invoke-virtual {p0}, Lrk/schedule/ScheduleUi$Icon;->getHeight()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v3

    div-float/2addr v5, v4

    invoke-virtual {p1, v2, v5}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 75
    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lrk/schedule/ScheduleUi$Icon;->color:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const v2, 0x3fd33333    # 1.65f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 76
    new-instance v8, Landroid/graphics/Path;

    invoke-direct {v8}, Landroid/graphics/Path;-><init>()V

    .line 77
    iget v1, p0, Lrk/schedule/ScheduleUi$Icon;->kind:I

    const/high16 v9, 0x41880000    # 17.0f

    const/high16 v6, 0x41000000    # 8.0f

    const/high16 v7, 0x41400000    # 12.0f

    const/high16 v10, 0x41a80000    # 21.0f

    const/high16 v11, 0x40400000    # 3.0f

    packed-switch v1, :pswitch_data_1de

    .line 84
    const/high16 v6, 0x40400000    # 3.0f

    iget-object v7, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40c00000    # 6.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v4, 0x41880000    # 17.0f

    const/high16 v5, 0x40400000    # 3.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x40e00000    # 7.0f

    invoke-virtual {v8, v11, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v8, v11, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-virtual {v8, v11, v10, v1, v10}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {v8, v9, v10}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v8, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_1da

    .line 83
    :pswitch_8d
    const/high16 v6, 0x40400000    # 3.0f

    iget-object v7, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40a00000    # 5.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41980000    # 19.0f

    const/high16 v4, 0x41a80000    # 21.0f

    const/high16 v5, 0x40400000    # 3.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41000000    # 8.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41100000    # 9.0f

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41400000    # 12.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41800000    # 16.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41800000    # 16.0f

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_1da

    .line 82
    :pswitch_c2
    const/high16 v4, 0x41000000    # 8.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x41a00000    # 20.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41800000    # 16.0f

    const/high16 v11, 0x40800000    # 4.0f

    invoke-virtual {v8, v1, v11}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v8, v2, v6}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v8, v1, v7}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v8, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const/high16 v4, 0x41880000    # 17.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41a80000    # 21.0f

    const/high16 v2, 0x41880000    # 17.0f

    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v8}, Landroid/graphics/Path;->reset()V

    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v8, v6, v1}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v8, v11, v9}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v8, v6, v10}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v8, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_1da

    .line 81
    :pswitch_106
    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {v8, v11, v1}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v8, v7, v11}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v8, v10, v1}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v8, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const/high16 v4, 0x41a80000    # 21.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40c00000    # 6.0f

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x41900000    # 18.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41200000    # 10.0f

    const/high16 v2, 0x41700000    # 15.0f

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_1da

    .line 80
    :pswitch_131
    const/high16 v6, 0x40400000    # 3.0f

    iget-object v7, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v4, 0x41a80000    # 21.0f

    const/high16 v5, 0x40400000    # 3.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x40e00000    # 7.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41800000    # 16.0f

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41200000    # 10.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x41600000    # 14.0f

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41600000    # 14.0f

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41880000    # 17.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x41880000    # 17.0f

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1da

    .line 79
    :pswitch_18a
    const/high16 v6, 0x40400000    # 3.0f

    iget-object v7, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v4, 0x41a00000    # 20.0f

    const/high16 v5, 0x40400000    # 3.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v3, 0x41000000    # 8.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41100000    # 9.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41100000    # 9.0f

    const/high16 v3, 0x41880000    # 17.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41500000    # 13.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1da

    .line 78
    :pswitch_1bc
    iget-object v1, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v7, v7, v6, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41400000    # 12.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v3, 0x41400000    # 12.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Lrk/schedule/ScheduleUi$Icon;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 86
    :goto_1da
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 87
    return-void

    :pswitch_data_1de
    .packed-switch 0x0
        :pswitch_1bc
        :pswitch_18a
        :pswitch_131
        :pswitch_106
        :pswitch_c2
        :pswitch_8d
    .end packed-switch
.end method
