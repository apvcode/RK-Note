.class final Lrk/mcp/DiaryDb$Mark;
.super Ljava/lang/Object;
.source "DiaryDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/mcp/DiaryDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Mark"
.end annotation


# instance fields
.field comment:Ljava/lang/String;

.field date:J

.field kind:Ljava/lang/String;

.field lessonComment:Ljava/lang/String;

.field value:Ljava/lang/String;

.field weight:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 3

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lrk/mcp/DiaryDb$Mark;->date:J

    return-void
.end method


# virtual methods
.method json()Lorg/json/JSONObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 37
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "value"

    iget-object v2, p0, Lrk/mcp/DiaryDb$Mark;->value:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 38
    iget-wide v1, p0, Lrk/mcp/DiaryDb$Mark;->date:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-ltz v5, :cond_20

    iget-wide v1, p0, Lrk/mcp/DiaryDb$Mark;->date:J

    invoke-static {v1, v2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "date"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    :cond_20
    iget-object v1, p0, Lrk/mcp/DiaryDb$Mark;->weight:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2f

    const-string v1, "weight"

    iget-object v2, p0, Lrk/mcp/DiaryDb$Mark;->weight:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    :cond_2f
    iget-object v1, p0, Lrk/mcp/DiaryDb$Mark;->kind:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3e

    const-string v1, "kind"

    iget-object v2, p0, Lrk/mcp/DiaryDb$Mark;->kind:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    :cond_3e
    iget-object v1, p0, Lrk/mcp/DiaryDb$Mark;->comment:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4d

    const-string v1, "comment"

    iget-object v2, p0, Lrk/mcp/DiaryDb$Mark;->comment:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    :cond_4d
    iget-object v1, p0, Lrk/mcp/DiaryDb$Mark;->lessonComment:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5c

    const-string v1, "lesson_comment"

    iget-object v2, p0, Lrk/mcp/DiaryDb$Mark;->lessonComment:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 43
    :cond_5c
    return-object v0
.end method
