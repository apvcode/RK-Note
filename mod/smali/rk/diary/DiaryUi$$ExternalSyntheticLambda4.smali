.class public final synthetic Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lrk/schedule/DiaryContext$Stamp;

.field public final synthetic f$1:Lrk/diary/PersonalHomeworkStore;

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:Lrk/diary/PersonalHomeworkStore$Id;

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:Lrk/diary/DiaryUi$Header;

.field public final synthetic f$7:Landroid/view/View;

.field public final synthetic f$8:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Landroid/content/Context;Landroid/widget/EditText;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Landroid/view/View;Ljava/lang/String;)V
    .registers 10

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$0:Lrk/schedule/DiaryContext$Stamp;

    iput-object p2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$1:Lrk/diary/PersonalHomeworkStore;

    iput-object p3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$2:Landroid/content/Context;

    iput-object p4, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$3:Landroid/widget/EditText;

    iput-object p5, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$4:Lrk/diary/PersonalHomeworkStore$Id;

    iput-object p6, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$5:Ljava/lang/String;

    iput-object p7, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$6:Lrk/diary/DiaryUi$Header;

    iput-object p8, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$7:Landroid/view/View;

    iput-object p9, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$8:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    .line 0
    iget-object v0, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$0:Lrk/schedule/DiaryContext$Stamp;

    iget-object v1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$1:Lrk/diary/PersonalHomeworkStore;

    iget-object v2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$2:Landroid/content/Context;

    iget-object v3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$3:Landroid/widget/EditText;

    iget-object v4, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$4:Lrk/diary/PersonalHomeworkStore$Id;

    iget-object v5, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$5:Ljava/lang/String;

    iget-object v6, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$6:Lrk/diary/DiaryUi$Header;

    iget-object v7, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$7:Landroid/view/View;

    iget-object v8, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda4;->f$8:Ljava/lang/String;

    invoke-static/range {v0 .. v8}, Lrk/diary/DiaryUi;->lambda$editHomework$8(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Landroid/content/Context;Landroid/widget/EditText;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method
