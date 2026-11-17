.class public final synthetic Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:Lrk/schedule/DiaryContext$Stamp;

.field public final synthetic f$2:I

.field public final synthetic f$3:Landroid/view/View;

.field public final synthetic f$4:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$0:Ljava/util/List;

    iput-object p2, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$1:Lrk/schedule/DiaryContext$Stamp;

    iput p3, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$2:I

    iput-object p4, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$3:Landroid/view/View;

    iput-object p5, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$4:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$0:Ljava/util/List;

    iget-object v1, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$1:Lrk/schedule/DiaryContext$Stamp;

    iget v2, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$2:I

    iget-object v3, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$3:Landroid/view/View;

    iget-object v4, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda4;->f$4:Ljava/util/List;

    invoke-static {v0, v1, v2, v3, v4}, Lrk/schedule/ScheduleBridge;->lambda$refresh$4(Ljava/util/List;Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;)V

    return-void
.end method
