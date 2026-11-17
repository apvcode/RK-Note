.class public final synthetic Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lrk/schedule/DiaryContext$Stamp;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/view/View;

.field public final synthetic f$3:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;->f$0:Lrk/schedule/DiaryContext$Stamp;

    iput p2, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;->f$1:I

    iput-object p3, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;->f$2:Landroid/view/View;

    iput-object p4, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;->f$3:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;->f$0:Lrk/schedule/DiaryContext$Stamp;

    iget v1, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;->f$1:I

    iget-object v2, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;->f$2:Landroid/view/View;

    iget-object v3, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda2;->f$3:Ljava/util/List;

    invoke-static {v0, v1, v2, v3}, Lrk/schedule/ScheduleBridge;->lambda$refresh$2(Lrk/schedule/DiaryContext$Stamp;ILandroid/view/View;Ljava/util/List;)V

    return-void
.end method
