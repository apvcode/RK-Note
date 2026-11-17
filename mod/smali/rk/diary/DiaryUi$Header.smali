.class final Lrk/diary/DiaryUi$Header;
.super Ljava/lang/Object;
.source "DiaryUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/diary/DiaryUi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Header"
.end annotation


# instance fields
.field final day:J

.field final key:Ljava/lang/String;

.field final number:Ljava/lang/String;

.field final owner:Ljava/lang/String;

.field final progress:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lrk/diary/DiaryUi$Progress;",
            ">;"
        }
    .end annotation
.end field

.field final root:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final stamp:Lrk/schedule/DiaryContext$Stamp;

.field final subject:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrk/diary/DiaryUi$Progress;)V
    .registers 7

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lrk/diary/DiaryUi$Header;->root:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lrk/diary/DiaryUi$Header;->subject:Ljava/lang/String;

    iput-object p4, p0, Lrk/diary/DiaryUi$Header;->key:Ljava/lang/String;

    invoke-static {}, Lrk/schedule/ScheduleBridge;->ownerStamp()Lrk/schedule/DiaryContext$Stamp;

    move-result-object p2

    iput-object p2, p0, Lrk/diary/DiaryUi$Header;->stamp:Lrk/schedule/DiaryContext$Stamp;

    invoke-static {p4}, Lrk/diary/PersonalHomeworkStore$Id;->parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object p2

    const-string p4, ""

    if-nez p2, :cond_1e

    move-object p2, p4

    goto :goto_20

    :cond_1e
    iget-object p2, p2, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    :goto_20
    iput-object p2, p0, Lrk/diary/DiaryUi$Header;->owner:Ljava/lang/String;

    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p2

    iput-wide p2, p0, Lrk/diary/DiaryUi$Header;->day:J

    const-string p2, "textNum"

    invoke-static {p1, p2}, Lrk/diary/DiaryUi;->access$000(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    if-nez p1, :cond_33

    goto :goto_3b

    :cond_33
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p4

    :goto_3b
    iput-object p4, p0, Lrk/diary/DiaryUi$Header;->number:Ljava/lang/String;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lrk/diary/DiaryUi$Header;->progress:Ljava/lang/ref/WeakReference;

    return-void
.end method
