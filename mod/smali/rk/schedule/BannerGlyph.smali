.class public final Lrk/schedule/BannerGlyph;
.super Landroid/graphics/drawable/Drawable;
.source "BannerGlyph.java"


# instance fields
.field private final color:I

.field private final kind:I

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method private constructor <init>(II)V
    .registers 5

    .line 12
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 11
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    .line 12
    iput p1, p0, Lrk/schedule/BannerGlyph;->kind:I

    iput p2, p0, Lrk/schedule/BannerGlyph;->color:I

    return-void
.end method

.method public static apply(Landroid/widget/TextView;Ljava/lang/String;I)V
    .registers 7

    .line 14
    const-string v0, "\ud83d\udd14"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz v0, :cond_c

    const/4 p1, 0x0

    goto :goto_3f

    :cond_c
    const-string v0, "\u23f8\ufe0f"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 p1, 0x1

    goto :goto_3f

    :cond_16
    const-string v0, "\ud83d\udfe2"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    const/4 p1, 0x2

    goto :goto_3f

    :cond_20
    const-string v0, "\ud83c\udfeb"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    const/4 p1, 0x3

    goto :goto_3f

    :cond_2a
    const-string v0, "!"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    const/4 p1, 0x5

    goto :goto_3f

    :cond_34
    const-string v0, "\ud83c\udf34"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3e

    const/4 p1, 0x6

    goto :goto_3f

    :cond_3e
    const/4 p1, 0x4

    .line 15
    :goto_3f
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aget-object v0, v0, v2

    .line 16
    instance-of v3, v0, Lrk/schedule/BannerGlyph;

    if-eqz v3, :cond_54

    check-cast v0, Lrk/schedule/BannerGlyph;

    iget v3, v0, Lrk/schedule/BannerGlyph;->kind:I

    if-ne v3, p1, :cond_54

    iget v0, v0, Lrk/schedule/BannerGlyph;->color:I

    if-ne v0, p2, :cond_54

    return-void

    .line 17
    :cond_54
    new-instance v0, Lrk/schedule/BannerGlyph;

    invoke-direct {v0, p1, p2}, Lrk/schedule/BannerGlyph;-><init>(II)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 p2, 0x41a00000    # 20.0f

    invoke-static {p1, p2}, Lrk/schedule/ScheduleUi;->dp(Landroid/content/Context;F)I

    move-result p1

    invoke-virtual {v0, v2, v2, p1, p1}, Lrk/schedule/BannerGlyph;->setBounds(IIII)V

    .line 18
    const-string p1, ""

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 p1, 0x11

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1, p1, p1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 19
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    .line 20
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 18

    .line 22
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0}, Lrk/schedule/BannerGlyph;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    iget v3, v2, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    iget v4, v2, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x41c00000    # 24.0f

    div-float/2addr v3, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v4

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 23
    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    iget v3, v0, Lrk/schedule/BannerGlyph;->color:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const v3, 0x3fd9999a    # 1.7f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 24
    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 25
    iget v2, v0, Lrk/schedule/BannerGlyph;->kind:I

    const/high16 v3, 0x41900000    # 18.0f

    const/high16 v5, 0x40e00000    # 7.0f

    const/high16 v6, 0x41a80000    # 21.0f

    const/high16 v11, 0x41700000    # 15.0f

    const/high16 v12, 0x41a00000    # 20.0f

    const/high16 v7, 0x40400000    # 3.0f

    const/high16 v13, 0x41200000    # 10.0f

    const/high16 v14, 0x41880000    # 17.0f

    const/high16 v8, 0x40a00000    # 5.0f

    const/high16 v9, 0x41100000    # 9.0f

    const/high16 v15, 0x41980000    # 19.0f

    const/high16 v10, 0x41400000    # 12.0f

    packed-switch v2, :pswitch_data_202

    .line 44
    move-object v7, v4

    invoke-virtual {v7, v15, v11}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v9, 0x41200000    # 10.0f

    const/high16 v10, 0x40800000    # 4.0f

    const/high16 v5, 0x41200000    # 10.0f

    const/high16 v6, 0x41900000    # 18.0f

    const/high16 v7, 0x40c00000    # 6.0f

    const/high16 v8, 0x41200000    # 10.0f

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v9, 0x41600000    # 14.0f

    const/high16 v10, 0x41a80000    # 21.0f

    const/4 v5, 0x0

    const/high16 v6, 0x40e00000    # 7.0f

    const/high16 v7, 0x40400000    # 3.0f

    const/high16 v8, 0x41b00000    # 22.0f

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    invoke-virtual {v4, v3, v12, v15, v11}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const/high16 v5, 0x40e00000    # 7.0f

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41900000    # 18.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x40a00000    # 5.0f

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41800000    # 16.0f

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v4, 0x41a00000    # 20.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_1fe

    .line 42
    :pswitch_b2
    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v10, v10, v9, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41500000    # 13.0f

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x40e00000    # 7.0f

    const/high16 v4, 0x41400000    # 12.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v10, v14, v2}, Landroid/graphics/Canvas;->drawPoint(FFLandroid/graphics/Paint;)V

    goto/16 :goto_1fe

    .line 40
    :pswitch_cb
    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v10, v10, v9, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v2, 0x40f00000    # 7.5f

    invoke-virtual {v4, v2, v10}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41280000    # 10.5f

    invoke-virtual {v4, v2, v11}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41840000    # 16.5f

    invoke-virtual {v4, v2, v9}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_1fe

    .line 37
    :pswitch_e6
    invoke-virtual {v4, v7, v13}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v10, v7}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v6, v13}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v8, v9}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v8, v6}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v15, v6}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v15, v9}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 38
    const/high16 v5, 0x41a80000    # 21.0f

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x41700000    # 15.0f

    const/high16 v4, 0x41600000    # 14.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    const/high16 v2, 0x3fc00000    # 1.5f

    iget-object v3, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v10, v9, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1fe

    .line 34
    :pswitch_116
    const/high16 v2, 0x40c00000    # 6.0f

    invoke-virtual {v4, v10, v2}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v5, v7, v7, v8}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {v4, v7, v15}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v5, v14, v10, v12}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {v4, v14, v14, v6, v15}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {v4, v6, v8}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v14, v7, v10, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {v4, v10, v12}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 35
    const/high16 v5, 0x41200000    # 10.0f

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v3, 0x41100000    # 9.0f

    const/high16 v4, 0x41100000    # 9.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41100000    # 9.0f

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41700000    # 15.0f

    const/high16 v3, 0x41200000    # 10.0f

    const/high16 v4, 0x41900000    # 18.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_1fe

    .line 30
    :pswitch_153
    invoke-virtual {v4, v8, v9}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v4, v2, v9}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v2, v11}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v2, v15, v10, v15}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {v4, v9, v15}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v8, v15, v8, v11}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    iget-object v5, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 31
    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    invoke-virtual {v4, v2, v13}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v3, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v9, 0x41800000    # 16.0f

    const/high16 v10, 0x41700000    # 15.0f

    const/high16 v5, 0x41b00000    # 22.0f

    const/high16 v6, 0x41200000    # 10.0f

    const/high16 v7, 0x41b00000    # 22.0f

    const/high16 v8, 0x41700000    # 15.0f

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41b00000    # 22.0f

    const/high16 v4, 0x41900000    # 18.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 32
    const/high16 v5, 0x40a00000    # 5.0f

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41000000    # 8.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41500000    # 13.0f

    const/high16 v4, 0x41500000    # 13.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1fe

    .line 27
    :pswitch_1b0
    invoke-virtual {v4, v8, v14}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v11, 0x41600000    # 14.0f

    invoke-virtual {v4, v5, v11}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4, v5, v13}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v9, 0x41880000    # 17.0f

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v10, 0x41200000    # 10.0f

    const/high16 v5, 0x40e00000    # 7.0f

    const/high16 v6, 0x40400000    # 3.0f

    const/high16 v7, 0x41880000    # 17.0f

    const/high16 v8, 0x40400000    # 3.0f

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    move-object v7, v4

    invoke-virtual {v7, v14, v11}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v7, v15, v14}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v7}, Landroid/graphics/Path;->close()V

    iget-object v3, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v7, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 28
    const/high16 v5, 0x40400000    # 3.0f

    iget-object v6, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v2, 0x41300000    # 11.0f

    const/high16 v4, 0x41400000    # 12.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v8, 0x41400000    # 12.0f

    const/high16 v4, 0x41500000    # 13.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v7}, Landroid/graphics/Path;->reset()V

    invoke-virtual {v7, v13, v12}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41b00000    # 22.0f

    invoke-virtual {v7, v8, v2, v11, v12}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-object v2, v0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v7, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 46
    :goto_1fe
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 47
    return-void

    :pswitch_data_202
    .packed-switch 0x0
        :pswitch_1b0
        :pswitch_153
        :pswitch_116
        :pswitch_e6
        :pswitch_cb
        :pswitch_b2
    .end packed-switch
.end method

.method public getOpacity()I
    .registers 2

    .line 50
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .registers 3

    .line 48
    iget-object v0, p0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Lrk/schedule/BannerGlyph;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 49
    iget-object v0, p0, Lrk/schedule/BannerGlyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Lrk/schedule/BannerGlyph;->invalidateSelf()V

    return-void
.end method
