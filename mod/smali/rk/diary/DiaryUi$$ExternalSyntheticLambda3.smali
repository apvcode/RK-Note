.class public final synthetic Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;

.field public final synthetic f$1:Lrk/schedule/DiaryContext$Stamp;

.field public final synthetic f$2:Lrk/diary/PersonalHomeworkStore;

.field public final synthetic f$3:Lrk/diary/PersonalHomeworkStore$Id;

.field public final synthetic f$4:Landroid/view/View;

.field public final synthetic f$5:Lrk/diary/DiaryUi$Header;

.field public final synthetic f$6:Landroid/content/Context;

.field public final synthetic f$7:Ljava/lang/String;

.field public final synthetic f$8:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Landroid/view/View;Lrk/diary/DiaryUi$Header;Landroid/content/Context;Ljava/lang/String;Landroid/app/Dialog;)V
    .registers 10

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$0:Landroid/widget/EditText;

    iput-object p2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$1:Lrk/schedule/DiaryContext$Stamp;

    iput-object p3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$2:Lrk/diary/PersonalHomeworkStore;

    iput-object p4, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$3:Lrk/diary/PersonalHomeworkStore$Id;

    iput-object p5, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$4:Landroid/view/View;

    iput-object p6, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$5:Lrk/diary/DiaryUi$Header;

    iput-object p7, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$6:Landroid/content/Context;

    iput-object p8, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$7:Ljava/lang/String;

    iput-object p9, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$8:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    .line 0
    iget-object v0, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$0:Landroid/widget/EditText;

    iget-object v1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$1:Lrk/schedule/DiaryContext$Stamp;

    iget-object v2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$2:Lrk/diary/PersonalHomeworkStore;

    iget-object v3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$3:Lrk/diary/PersonalHomeworkStore$Id;

    iget-object v4, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$4:Landroid/view/View;

    iget-object v5, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$5:Lrk/diary/DiaryUi$Header;

    iget-object v6, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$6:Landroid/content/Context;

    iget-object v7, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$7:Ljava/lang/String;

    iget-object v8, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda3;->f$8:Landroid/app/Dialog;

    invoke-static/range {v0 .. v8}, Lrk/diary/DiaryUi;->lambda$editHomework$5(Landroid/widget/EditText;Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Landroid/view/View;Lrk/diary/DiaryUi$Header;Landroid/content/Context;Ljava/lang/String;Landroid/app/Dialog;)V

    return-void
.end method
