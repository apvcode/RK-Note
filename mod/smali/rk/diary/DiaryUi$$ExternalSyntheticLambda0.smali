.class public final synthetic Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lrk/schedule/DiaryContext$Stamp;

.field public final synthetic f$1:Lrk/diary/PersonalHomeworkStore;

.field public final synthetic f$2:Lrk/diary/PersonalHomeworkStore$Id;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Landroid/widget/EditText;

.field public final synthetic f$5:Z

.field public final synthetic f$6:Landroid/view/View;

.field public final synthetic f$7:Lrk/diary/DiaryUi$Header;

.field public final synthetic f$8:Landroid/content/Context;

.field public final synthetic f$9:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Landroid/widget/EditText;ZLandroid/view/View;Lrk/diary/DiaryUi$Header;Landroid/content/Context;Ljava/lang/String;)V
    .registers 11

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$0:Lrk/schedule/DiaryContext$Stamp;

    iput-object p2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$1:Lrk/diary/PersonalHomeworkStore;

    iput-object p3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$2:Lrk/diary/PersonalHomeworkStore$Id;

    iput-object p4, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$3:Ljava/lang/String;

    iput-object p5, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$4:Landroid/widget/EditText;

    iput-boolean p6, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$5:Z

    iput-object p7, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$6:Landroid/view/View;

    iput-object p8, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$7:Lrk/diary/DiaryUi$Header;

    iput-object p9, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$8:Landroid/content/Context;

    iput-object p10, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$9:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 15

    .line 0
    iget-object v0, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$0:Lrk/schedule/DiaryContext$Stamp;

    iget-object v1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$1:Lrk/diary/PersonalHomeworkStore;

    iget-object v2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$2:Lrk/diary/PersonalHomeworkStore$Id;

    iget-object v3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$4:Landroid/widget/EditText;

    iget-boolean v5, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$5:Z

    iget-object v6, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$6:Landroid/view/View;

    iget-object v7, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$7:Lrk/diary/DiaryUi$Header;

    iget-object v8, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$8:Landroid/content/Context;

    iget-object v9, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda0;->f$9:Ljava/lang/String;

    move-object v10, p1

    move v11, p2

    invoke-static/range {v0 .. v11}, Lrk/diary/DiaryUi;->lambda$editHomework$6(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Landroid/widget/EditText;ZLandroid/view/View;Lrk/diary/DiaryUi$Header;Landroid/content/Context;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
