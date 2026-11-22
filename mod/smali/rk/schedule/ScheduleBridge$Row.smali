.class Lrk/schedule/ScheduleBridge$Row;
.super Ljava/lang/Object;
.source "ScheduleBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/schedule/ScheduleBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Row"
.end annotation


# instance fields
.field accent:I

.field active:Z

.field day:J

.field number:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field original:Ljava/lang/String;

.field slot:Ljava/lang/String;

.field source:Ljava/lang/String;

.field final stamp:Lrk/schedule/DiaryContext$Stamp;

.field styled:Z


# direct methods
.method constructor <init>(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 7

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "\u0418\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    iput-object v0, p0, Lrk/schedule/ScheduleBridge$Row;->source:Ljava/lang/String;

    invoke-static {}, Lrk/schedule/ScheduleBridge;->access$000()Lrk/schedule/DiaryContext;

    move-result-object v0

    invoke-virtual {v0}, Lrk/schedule/DiaryContext;->stamp()Lrk/schedule/DiaryContext$Stamp;

    move-result-object v0

    iput-object v0, p0, Lrk/schedule/ScheduleBridge$Row;->stamp:Lrk/schedule/DiaryContext$Stamp;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lrk/schedule/ScheduleBridge$Row;->number:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lrk/schedule/ScheduleBridge$Row;->slot:Ljava/lang/String;

    iput-object p3, p0, Lrk/schedule/ScheduleBridge$Row;->original:Ljava/lang/String;

    iput-wide p4, p0, Lrk/schedule/ScheduleBridge$Row;->day:J

    :try_start_1e
    invoke-static {}, Lrk/schedule/ScheduleBridge;->access$100()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object p1

    invoke-static {p4, p5}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object p3

    const/4 v0, 0x1

    invoke-static {p1, p4, p5, p3, v0}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_33
    :goto_33
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_52

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lrk/schedule/ScheduleResolver$Event;

    iget-object p4, p3, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {p4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_33

    iget-object p3, p3, Lrk/schedule/ScheduleResolver$Event;->source:Ljava/lang/String;

    iput-object p3, p0, Lrk/schedule/ScheduleBridge$Row;->source:Ljava/lang/String;
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_4b} :catch_4c

    goto :goto_33

    :catch_4c
    move-exception p1

    const-string p2, "Reading row source"

    invoke-static {p2, p1}, Lrk/schedule/ScheduleBridge;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_52
    return-void
.end method
