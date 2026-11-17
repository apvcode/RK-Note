.class public final synthetic Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:Lrk/diary/PersonalHomeworkStore;

.field public final synthetic f$10:Ljava/lang/String;

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Ljava/util/Map;

.field public final synthetic f$4:Landroid/widget/EditText;

.field public final synthetic f$5:Lrk/diary/PersonalHomeworkStore$Id;

.field public final synthetic f$6:Ljava/lang/String;

.field public final synthetic f$7:Lrk/diary/DiaryUi$Header;

.field public final synthetic f$8:Lrk/schedule/DiaryContext$Stamp;

.field public final synthetic f$9:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lrk/diary/PersonalHomeworkStore;Landroid/content/Context;Ljava/util/Map;Landroid/widget/EditText;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Lrk/schedule/DiaryContext$Stamp;Landroid/view/View;Ljava/lang/String;)V
    .registers 12

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$0:Ljava/util/List;

    iput-object p2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$1:Lrk/diary/PersonalHomeworkStore;

    iput-object p3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$2:Landroid/content/Context;

    iput-object p4, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$3:Ljava/util/Map;

    iput-object p5, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$4:Landroid/widget/EditText;

    iput-object p6, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$5:Lrk/diary/PersonalHomeworkStore$Id;

    iput-object p7, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$6:Ljava/lang/String;

    iput-object p8, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$7:Lrk/diary/DiaryUi$Header;

    iput-object p9, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$8:Lrk/schedule/DiaryContext$Stamp;

    iput-object p10, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$9:Landroid/view/View;

    iput-object p11, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$10:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 16

    .line 0
    iget-object v0, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$0:Ljava/util/List;

    iget-object v1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$1:Lrk/diary/PersonalHomeworkStore;

    iget-object v2, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$2:Landroid/content/Context;

    iget-object v3, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$3:Ljava/util/Map;

    iget-object v4, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$4:Landroid/widget/EditText;

    iget-object v5, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$5:Lrk/diary/PersonalHomeworkStore$Id;

    iget-object v6, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$6:Ljava/lang/String;

    iget-object v7, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$7:Lrk/diary/DiaryUi$Header;

    iget-object v8, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$8:Lrk/schedule/DiaryContext$Stamp;

    iget-object v9, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$9:Landroid/view/View;

    iget-object v10, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda9;->f$10:Ljava/lang/String;

    move-object v11, p1

    move v12, p2

    invoke-static/range {v0 .. v12}, Lrk/diary/DiaryUi;->lambda$editHomework$7(Ljava/util/List;Lrk/diary/PersonalHomeworkStore;Landroid/content/Context;Ljava/util/Map;Landroid/widget/EditText;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Lrk/diary/DiaryUi$Header;Lrk/schedule/DiaryContext$Stamp;Landroid/view/View;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
