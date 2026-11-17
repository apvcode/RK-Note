.class public final synthetic Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lrk/diary/DiaryUi$Header;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Ljava/lang/String;Lrk/diary/DiaryUi$Header;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;->f$0:Landroid/view/View;

    iput-object p2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;->f$2:Lrk/diary/DiaryUi$Header;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;->f$0:Landroid/view/View;

    iget-object v1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda7;->f$2:Lrk/diary/DiaryUi$Header;

    invoke-static {v0, v1, v2, p1}, Lrk/diary/DiaryUi;->lambda$bindHomework$0(Landroid/view/View;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
