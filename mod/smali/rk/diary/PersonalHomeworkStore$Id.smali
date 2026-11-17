.class public final Lrk/diary/PersonalHomeworkStore$Id;
.super Ljava/lang/Object;
.source "PersonalHomeworkStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/diary/PersonalHomeworkStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Id"
.end annotation


# instance fields
.field public final date:Ljava/lang/String;

.field public final lesson:Ljava/lang/String;

.field public final owner:Ljava/lang/String;

.field public final subject:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 13
    invoke-static {p2, p3}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2, p4, p5}, Lrk/diary/PersonalHomeworkStore$Id;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    iput-object p2, p0, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    iput-object p3, p0, Lrk/diary/PersonalHomeworkStore$Id;->lesson:Ljava/lang/String;

    iput-object p4, p0, Lrk/diary/PersonalHomeworkStore$Id;->subject:Ljava/lang/String;

    return-void
.end method

.method public static parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;
    .registers 7

    .line 16
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result p0

    const/4 v2, 0x4

    if-eq p0, v2, :cond_e

    return-object v0

    :cond_e
    new-instance p0, Lrk/diary/PersonalHomeworkStore$Id;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v3, v4, v1}, Lrk/diary/PersonalHomeworkStore$Id;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_27} :catch_28

    return-object p0

    :catch_28
    move-exception p0

    return-object v0
.end method


# virtual methods
.method public key()Ljava/lang/String;
    .registers 3

    .line 15
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iget-object v1, p0, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    iget-object v1, p0, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    iget-object v1, p0, Lrk/diary/PersonalHomeworkStore$Id;->lesson:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    iget-object v1, p0, Lrk/diary/PersonalHomeworkStore$Id;->subject:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
