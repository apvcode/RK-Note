.class public final synthetic Lrk/diary/DiaryUi$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda2;->f$0:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lrk/diary/DiaryUi$$ExternalSyntheticLambda2;->f$0:Landroid/widget/EditText;

    invoke-static {v0}, Lrk/diary/DiaryUi;->lambda$editHomework$4(Landroid/widget/EditText;)V

    return-void
.end method
