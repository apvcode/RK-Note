.class final Lrk/mcp/McpTools;
.super Ljava/lang/Object;
.source "McpTools.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/mcp/McpTools$Problem;
    }
.end annotation


# static fields
.field private static final NOT_KNOWN:Ljava/lang/String; = "\u042d\u0442\u043e\u0433\u043e \u0434\u043d\u044f \u043d\u0435\u0442 \u043d\u0438 \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435, \u043d\u0438 \u0432 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u043c \u043d\u0430 \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0432 RK Note \u043d\u0430 \u043d\u0443\u0436\u043d\u043e\u0439 \u043d\u0435\u0434\u0435\u043b\u0435, \u0438 \u043e\u043d \u043f\u043e\u044f\u0432\u0438\u0442\u0441\u044f."

.field private static final WEEKDAYS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 25
    const-string v6, "\u043f\u044f\u0442\u043d\u0438\u0446\u0430"

    const-string v7, "\u0441\u0443\u0431\u0431\u043e\u0442\u0430"

    const-string v0, ""

    const-string v1, "\u0432\u043e\u0441\u043a\u0440\u0435\u0441\u0435\u043d\u044c\u0435"

    const-string v2, "\u043f\u043e\u043d\u0435\u0434\u0435\u043b\u044c\u043d\u0438\u043a"

    const-string v3, "\u0432\u0442\u043e\u0440\u043d\u0438\u043a"

    const-string v4, "\u0441\u0440\u0435\u0434\u0430"

    const-string v5, "\u0447\u0435\u0442\u0432\u0435\u0440\u0433"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lrk/mcp/McpTools;->WEEKDAYS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static announcements(Lorg/json/JSONObject;Landroid/content/Context;)Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 325
    const-string v0, "limit"

    const/16 v1, 0xa

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x1

    const/16 v1, 0x1e

    invoke-static {p0, v0, v1}, Lrk/mcp/McpTools;->clamp(III)I

    move-result p0

    invoke-static {p1, p0}, Lrk/mcp/DiaryDb;->announcements(Landroid/content/Context;I)Lorg/json/JSONArray;

    move-result-object p0

    .line 326
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "announcements"

    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    .line 327
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_2b

    const-string p0, "note"

    const-string v0, "\u041e\u0431\u044a\u044f\u0432\u043b\u0435\u043d\u0438\u0439 \u0432 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438 \u043d\u0435\u0442 (\u0438\u043b\u0438 \u0432\u043a\u043b\u0430\u0434\u043a\u0430 \u0435\u0449\u0451 \u043d\u0435 \u0437\u0430\u0433\u0440\u0443\u0436\u0430\u043b\u0430\u0441\u044c)."

    invoke-virtual {p1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 328
    :cond_2b
    return-object p1
.end method

.method private static baseline(Landroid/content/Context;J)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "J)",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;"
        }
    .end annotation

    .line 133
    invoke-static {p1, p2}, Lrk/schedule/ScheduleBridge;->diary(J)Ljava/util/List;

    move-result-object v0

    .line 134
    if-eqz v0, :cond_7

    return-object v0

    .line 135
    :cond_7
    invoke-static {p0}, Lrk/mcp/McpTools;->student(Landroid/content/Context;)Lrk/mcp/DiaryDb$Student;

    move-result-object v0

    .line 136
    const/4 v1, 0x0

    if-nez v0, :cond_f

    return-object v1

    .line 137
    :cond_f
    iget-object v0, v0, Lrk/mcp/DiaryDb$Student;->id:Ljava/lang/String;

    invoke-static {p0, v0}, Lrk/mcp/DiaryDb;->days(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrk/mcp/DiaryDb$Day;

    .line 138
    if-nez p0, :cond_22

    goto :goto_26

    :cond_22
    invoke-static {p0}, Lrk/mcp/McpTools;->eventsOf(Lrk/mcp/DiaryDb$Day;)Ljava/util/List;

    move-result-object v1

    :goto_26
    return-object v1
.end method

.method private static bells(Landroid/content/Context;)Lorg/json/JSONObject;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 339
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object p0

    .line 340
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 341
    iget-object v1, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "end"

    const-string v4, "start"

    const-string v5, "lesson"

    if-eqz v2, :cond_86

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/schedule/ScheduleStore$Profile;

    .line 342
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 343
    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_2c
    iget-object v9, v2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    array-length v9, v9

    if-ge v8, v9, :cond_67

    iget-object v9, v2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v9, v9, v8

    aget v9, v9, v7

    if-ltz v9, :cond_64

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    add-int/lit8 v10, v8, 0x1

    invoke-virtual {v9, v5, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v9

    iget-object v10, v2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v10, v10, v8

    aget v10, v10, v7

    invoke-static {v10}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v4, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v9

    iget-object v10, v2, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    aget-object v10, v10, v8

    const/4 v11, 0x1

    aget v10, v10, v11

    invoke-static {v10}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v3, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v6, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_64
    add-int/lit8 v8, v8, 0x1

    goto :goto_2c

    .line 344
    :cond_67
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "id"

    iget-object v5, v2, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "name"

    iget-object v2, v2, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "bells"

    invoke-virtual {v2, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 345
    goto :goto_13

    .line 346
    :cond_86
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 347
    iget-object v2, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_95
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_bd

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    sget-object v7, Lrk/mcp/McpTools;->WEEKDAYS:[Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    aget-object v7, v7, v8

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {p0, v6}, Lrk/mcp/McpTools;->profileName(Lrk/schedule/ScheduleStore;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_95

    .line 348
    :cond_bd
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 349
    iget-object v6, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_cc
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_ec

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {p0, v7}, Lrk/mcp/McpTools;->profileName(Lrk/schedule/ScheduleStore;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_cc

    .line 350
    :cond_ec
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "profiles"

    invoke-virtual {v6, v7, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "by_weekday"

    invoke-virtual {v6, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v6, "by_date"

    invoke-virtual {v1, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 351
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 352
    iget-object p0, p0, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_112
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_155

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 353
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrk/schedule/ScheduleResolver$Homeroom;

    .line 354
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "mode"

    iget-object v10, v7, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v8

    iget v9, v7, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    invoke-static {v9}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v4, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v8

    iget v9, v7, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    invoke-static {v9}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v3, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v8

    iget v7, v7, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    invoke-virtual {v8, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 355
    goto :goto_112

    .line 356
    :cond_155
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result p0

    if-lez p0, :cond_160

    const-string p0, "homeroom_periods"

    invoke-virtual {v1, p0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 357
    :cond_160
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_16d

    const-string p0, "note"

    const-string v0, "\u0421\u0432\u043e\u0438\u0445 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0439 \u0437\u0432\u043e\u043d\u043a\u043e\u0432 \u043d\u0435\u0442: \u0434\u0435\u0439\u0441\u0442\u0432\u0443\u044e\u0442 \u0437\u0432\u043e\u043d\u043a\u0438 \u0438\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430."

    invoke-virtual {v1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 358
    :cond_16d
    return-object v1
.end method

.method private static brief(Lrk/schedule/ScheduleResolver$Event;)Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 233
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "number"

    iget-object v2, p0, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "subject"

    iget-object v2, p0, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    iget v1, p0, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {v1}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "start"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    iget p0, p0, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-static {p0}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object p0

    const-string v1, "end"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static call(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 81
    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x0

    sparse-switch v1, :sswitch_data_10c

    :cond_9
    goto/16 :goto_89

    :sswitch_b
    const-string v1, "rk_final_grades"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x6

    goto/16 :goto_8a

    :sswitch_16
    const-string v1, "rk_messages"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/16 v1, 0x8

    goto/16 :goto_8a

    :sswitch_22
    const-string v1, "rk_homework"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x3

    goto :goto_8a

    :sswitch_2c
    const-string v1, "rk_schedule"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x2

    goto :goto_8a

    :sswitch_36
    const-string v1, "rk_notes"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/16 v1, 0xa

    goto :goto_8a

    :sswitch_41
    const-string v1, "rk_marks"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x4

    goto :goto_8a

    :sswitch_4b
    const-string v1, "rk_announcements"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x7

    goto :goto_8a

    :sswitch_55
    const-string v1, "rk_status"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x0

    goto :goto_8a

    :sswitch_5f
    const-string v1, "rk_bell_profiles"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/16 v1, 0x9

    goto :goto_8a

    :sswitch_6a
    const-string v1, "rk_note_set"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/16 v1, 0xb

    goto :goto_8a

    :sswitch_75
    const-string v1, "rk_grades"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x5

    goto :goto_8a

    :sswitch_7f
    const-string v1, "rk_now"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/4 v1, 0x1

    goto :goto_8a

    :goto_89
    const/4 v1, -0x1

    :goto_8a
    packed-switch v1, :pswitch_data_13e

    .line 94
    new-instance p0, Ljava/lang/StringBuilder;

    goto :goto_d4

    .line 93
    :pswitch_90
    invoke-static {p0, p2}, Lrk/mcp/McpTools;->noteSet(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 92
    :pswitch_95
    invoke-static {p0, p2}, Lrk/mcp/McpTools;->notes(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 91
    :pswitch_9a
    invoke-static {p0}, Lrk/mcp/McpTools;->bells(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 90
    :pswitch_9f
    invoke-static {p2, p0}, Lrk/mcp/McpTools;->messages(Lorg/json/JSONObject;Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 89
    :pswitch_a4
    invoke-static {p2, p0}, Lrk/mcp/McpTools;->announcements(Lorg/json/JSONObject;Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 88
    :pswitch_a9
    invoke-static {p0}, Lrk/mcp/McpTools;->finalGrades(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 87
    :pswitch_ae
    invoke-static {p0, p2}, Lrk/mcp/McpTools;->grades(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 86
    :pswitch_b3
    invoke-static {p0, p2}, Lrk/mcp/McpTools;->marks(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 85
    :pswitch_b8
    invoke-static {p0, p2}, Lrk/mcp/McpTools;->homework(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 84
    :pswitch_bd
    invoke-static {p0, p2}, Lrk/mcp/McpTools;->schedule(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 83
    :pswitch_c2
    invoke-static {p0}, Lrk/mcp/McpTools;->now(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p0

    goto :goto_cb

    .line 82
    :pswitch_c7
    invoke-static {p0}, Lrk/mcp/McpTools;->status(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p0

    .line 96
    :goto_cb
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v2}, Lrk/mcp/McpTools;->result(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 94
    :goto_d4
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Unknown tool: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lrk/mcp/McpTools;->result(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_e9
    .catch Lrk/mcp/McpTools$Problem; {:try_start_1 .. :try_end_e9} :catch_101
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_e9} :catch_ec
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_e9} :catch_ea

    return-object p0

    .line 99
    :catch_ea
    move-exception p0

    goto :goto_ed

    :catch_ec
    move-exception p0

    .line 101
    :goto_ed
    invoke-virtual {p0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_f8

    invoke-virtual {p0}, Ljava/lang/RuntimeException;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_fc

    :cond_f8
    invoke-virtual {p0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object p0

    :goto_fc
    invoke-static {p0, v0}, Lrk/mcp/McpTools;->result(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 97
    :catch_101
    move-exception p0

    .line 98
    invoke-virtual {p0}, Lrk/mcp/McpTools$Problem;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lrk/mcp/McpTools;->result(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_10c
    .sparse-switch
        -0x3766dc30 -> :sswitch_7f
        -0x36c197be -> :sswitch_75
        -0x33cd9a25 -> :sswitch_6a
        -0x2caa3be0 -> :sswitch_5f
        -0x222b0348 -> :sswitch_55
        -0xb569b7a -> :sswitch_4b
        0x6caf5c0 -> :sswitch_41
        0x6df713b -> :sswitch_36
        0x4455a5dd -> :sswitch_2c
        0x510447b6 -> :sswitch_22
        0x52641492 -> :sswitch_16
        0x60c006ab -> :sswitch_b
    .end sparse-switch

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_c7
        :pswitch_c2
        :pswitch_bd
        :pswitch_b8
        :pswitch_b3
        :pswitch_ae
        :pswitch_a9
        :pswitch_a4
        :pswitch_9f
        :pswitch_9a
        :pswitch_95
        :pswitch_90
    .end packed-switch
.end method

.method private static clamp(III)I
    .registers 3

    .line 515
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static dayJson(Landroid/content/Context;Lrk/diary/PersonalHomeworkStore;J)Lorg/json/JSONObject;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 213
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "date"

    invoke-static {p2, p3}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    sget-object v1, Lrk/mcp/McpTools;->WEEKDAYS:[Ljava/lang/String;

    invoke-static {p2, p3}, Lrk/schedule/ScheduleResolver;->weekday(J)I

    move-result v2

    aget-object v1, v1, v2

    const-string v2, "weekday"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 214
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v1

    .line 215
    const-string v2, "bell_schedule"

    invoke-virtual {v1, p2, p3}, Lrk/schedule/ScheduleStore;->source(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 216
    invoke-static {p0, p2, p3}, Lrk/mcp/McpTools;->baseline(Landroid/content/Context;J)Ljava/util/List;

    move-result-object p0

    .line 217
    const-string v2, "note"

    const-string v3, "diary_loaded"

    if-nez p0, :cond_3f

    .line 218
    const/4 p0, 0x0

    invoke-virtual {v0, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "\u042d\u0442\u043e\u0433\u043e \u0434\u043d\u044f \u043d\u0435\u0442 \u043d\u0438 \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435, \u043d\u0438 \u0432 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u043c \u043d\u0430 \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0432 RK Note \u043d\u0430 \u043d\u0443\u0436\u043d\u043e\u0439 \u043d\u0435\u0434\u0435\u043b\u0435, \u0438 \u043e\u043d \u043f\u043e\u044f\u0432\u0438\u0442\u0441\u044f."

    invoke-virtual {p0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 219
    return-object v0

    .line 221
    :cond_3f
    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 222
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 224
    :try_start_48
    invoke-static {v1, p2, p3, p0, v4}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    move-result-object p0
    :try_end_4c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_48 .. :try_end_4c} :catch_4d

    .line 225
    goto :goto_57

    :catch_4d
    move-exception v1

    const-string v4, "bell_problem"

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 226
    :goto_57
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_5b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/schedule/ScheduleResolver$Event;

    invoke-static {p1, v1, p2, p3}, Lrk/mcp/McpTools;->lesson(Lrk/diary/PersonalHomeworkStore;Lrk/schedule/ScheduleResolver$Event;J)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_5b

    .line 227
    :cond_6f
    const-string p0, "lessons"

    invoke-virtual {v0, p0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 228
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_7f

    const-string p0, "\u0423\u0440\u043e\u043a\u043e\u0432 \u043d\u0435\u0442."

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 229
    :cond_7f
    return-object v0
.end method

.method private static varargs def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 65
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "type"

    const-string v2, "object"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "properties"

    invoke-virtual {v0, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p3

    .line 66
    array-length v0, p4

    if-lez v0, :cond_24

    new-instance v0, Lorg/json/JSONArray;

    invoke-static {p4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p4

    invoke-direct {v0, p4}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    const-string p4, "required"

    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    :cond_24
    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "name"

    invoke-virtual {p4, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p4, "description"

    invoke-virtual {p0, p4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "inputSchema"

    invoke-virtual {p0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 68
    const-string p3, "readOnlyHint"

    invoke-virtual {p1, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "openWorldHint"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "annotations"

    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 67
    return-object p0
.end method

.method private static eventsOf(Lrk/mcp/DiaryDb$Day;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrk/mcp/DiaryDb$Day;",
            ")",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;"
        }
    .end annotation

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 127
    iget-object p0, p0, Lrk/mcp/DiaryDb$Day;->lessons:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lrk/mcp/DiaryDb$Lesson;

    new-instance v2, Lrk/schedule/ScheduleResolver$Event;

    iget-object v3, v8, Lrk/mcp/DiaryDb$Lesson;->number:Ljava/lang/String;

    iget-object v4, v8, Lrk/mcp/DiaryDb$Lesson;->title:Ljava/lang/String;

    iget v5, v8, Lrk/mcp/DiaryDb$Lesson;->start:I

    iget v6, v8, Lrk/mcp/DiaryDb$Lesson;->end:I

    const/4 v7, 0x0

    const-string v9, "\u0418\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    invoke-direct/range {v2 .. v9}, Lrk/schedule/ScheduleResolver$Event;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 128
    :cond_2c
    return-object v0
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .line 427
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_d

    return-object p0

    :catch_d
    move-exception p0

    const/4 p0, 0x0

    return-object p0
.end method

.method private static finalGrades(Landroid/content/Context;)Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 314
    invoke-static {p0}, Lrk/mcp/McpTools;->student(Landroid/content/Context;)Lrk/mcp/DiaryDb$Student;

    move-result-object v0

    .line 315
    if-eqz v0, :cond_43

    .line 316
    iget-object v1, v0, Lrk/mcp/DiaryDb$Student;->id:Ljava/lang/String;

    invoke-static {p0, v1}, Lrk/mcp/DiaryDb;->finalGrades(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 317
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "student"

    iget-object v0, v0, Lrk/mcp/DiaryDb$Student;->name:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 318
    if-nez p0, :cond_24

    const-string p0, "note"

    const-string v1, "\u0418\u0442\u043e\u0433\u043e\u0432\u044b\u0435 \u043e\u0446\u0435\u043d\u043a\u0438 \u0435\u0449\u0451 \u043d\u0435 \u0437\u0430\u0433\u0440\u0443\u0436\u0430\u043b\u0438\u0441\u044c: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0432\u043a\u043b\u0430\u0434\u043a\u0443 \u00ab\u0418\u0442\u043e\u0433\u043e\u0432\u044b\u0435\u00bb \u0432 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438 \u043e\u0434\u0438\u043d \u0440\u0430\u0437."

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 319
    :cond_24
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 320
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x5dc0

    if-le v2, v3, :cond_3c

    const/4 p0, 0x0

    invoke-virtual {v1, p0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string v1, "final_grades_cut"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 321
    :cond_3c
    const-string v1, "final_grades"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 315
    :cond_43
    new-instance p0, Lrk/mcp/McpTools$Problem;

    const-string v0, "\u0412 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438 \u043f\u043e\u043a\u0430 \u043d\u0435\u0442 \u0434\u0430\u043d\u043d\u044b\u0445 \u0443\u0447\u0435\u043d\u0438\u043a\u0430."

    invoke-direct {p0, v0}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static grades(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 300
    invoke-static {p0}, Lrk/mcp/McpTools;->student(Landroid/content/Context;)Lrk/mcp/DiaryDb$Student;

    move-result-object v0

    .line 301
    if-eqz v0, :cond_75

    .line 302
    const-string v1, "subject"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 303
    iget-object v2, v0, Lrk/mcp/DiaryDb$Student;->id:Ljava/lang/String;

    invoke-static {p0, v2}, Lrk/mcp/DiaryDb;->grades(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 304
    const/4 v4, 0x0

    :goto_22
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_48

    .line 305
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 306
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_42

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_45

    :cond_42
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 304
    :cond_45
    add-int/lit8 v4, v4, 0x1

    goto :goto_22

    .line 308
    :cond_48
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "student"

    iget-object v2, v0, Lrk/mcp/DiaryDb$Student;->name:Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    iget-object v0, v0, Lrk/mcp/DiaryDb$Student;->id:Ljava/lang/String;

    invoke-static {p0, v0}, Lrk/mcp/DiaryDb;->periods(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const-string v0, "periods"

    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "subjects"

    invoke-virtual {p0, p1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 309
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-nez p1, :cond_74

    const-string p1, "note"

    const-string v0, "\u0412\u043a\u043b\u0430\u0434\u043a\u0430 \u00ab\u041e\u0446\u0435\u043d\u043a\u0438\u00bb \u0432 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438 \u0435\u0449\u0451 \u043d\u0435 \u0437\u0430\u0433\u0440\u0443\u0436\u0430\u043b\u0430\u0441\u044c: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0435\u0451 \u043e\u0434\u0438\u043d \u0440\u0430\u0437."

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 310
    :cond_74
    return-object p0

    .line 301
    :cond_75
    new-instance p0, Lrk/mcp/McpTools$Problem;

    const-string p1, "\u0412 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438 \u043f\u043e\u043a\u0430 \u043d\u0435\u0442 \u0434\u0430\u043d\u043d\u044b\u0445 \u0443\u0447\u0435\u043d\u0438\u043a\u0430: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 RK Note \u0438 \u0434\u043e\u0436\u0434\u0438\u0442\u0435\u0441\u044c \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0438 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430."

    invoke-direct {p0, p1}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static homework(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 253
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "from"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lrk/mcp/McpTools;->today()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lrk/mcp/McpTools;->parseDay(Ljava/lang/String;J)J

    move-result-wide v2

    .line 254
    const-string v4, "days"

    const/4 v5, 0x7

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v4, 0x1f

    const/4 v5, 0x1

    invoke-static {v1, v5, v4}, Lrk/mcp/McpTools;->clamp(III)I

    move-result v1

    .line 255
    new-instance v4, Lrk/diary/PersonalHomeworkStore;

    invoke-direct {v4, v0}, Lrk/diary/PersonalHomeworkStore;-><init>(Landroid/content/Context;)V

    .line 256
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 257
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 258
    const/4 v8, 0x0

    :goto_30
    if-ge v8, v1, :cond_bb

    .line 259
    invoke-static {v2, v3, v8}, Lrk/mcp/McpTools;->plus(JI)J

    move-result-wide v9

    .line 260
    invoke-static {v0, v9, v10}, Lrk/mcp/McpTools;->baseline(Landroid/content/Context;J)Ljava/util/List;

    move-result-object v11

    .line 261
    if-nez v11, :cond_4a

    invoke-static {v9, v10}, Lrk/schedule/ScheduleResolver;->weekday(J)I

    move-result v11

    if-eq v11, v5, :cond_b4

    invoke-static {v9, v10}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_b4

    .line 262
    :cond_4a
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_4e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_b4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lrk/schedule/ScheduleResolver$Event;

    .line 263
    iget-object v13, v12, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    if-nez v13, :cond_5f

    goto :goto_4e

    .line 264
    :cond_5f
    iget-object v13, v12, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    invoke-static {v13}, Lrk/mcp/McpTools;->homeworkOf(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v13

    .line 265
    iget-object v14, v12, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    invoke-static {v4, v14, v9, v10}, Lrk/mcp/McpTools;->noteOf(Lrk/diary/PersonalHomeworkStore;Ljava/lang/Object;J)Ljava/lang/String;

    move-result-object v14

    .line 266
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-nez v15, :cond_78

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_78

    goto :goto_4e

    .line 267
    :cond_78
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "date"

    invoke-static {v9, v10}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v5, "lesson"

    iget-object v15, v12, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {v0, v5, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v5, "subject"

    iget-object v12, v12, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {v0, v5, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 268
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lez v5, :cond_a2

    const-string v5, "homework"

    invoke-virtual {v0, v5, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 269
    :cond_a2
    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_ad

    const-string v5, "my_note"

    invoke-virtual {v0, v5, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 270
    :cond_ad
    invoke-virtual {v6, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 271
    const/4 v5, 0x1

    move-object/from16 v0, p0

    goto :goto_4e

    .line 258
    :cond_b4
    :goto_b4
    add-int/lit8 v8, v8, 0x1

    const/4 v5, 0x1

    move-object/from16 v0, p0

    goto/16 :goto_30

    .line 273
    :cond_bb
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "student"

    invoke-static/range {p0 .. p0}, Lrk/mcp/McpTools;->studentName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "items"

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 274
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_e3

    const-string v1, "days_not_known"

    invoke-virtual {v0, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "note"

    const-string v3, "\u042d\u0442\u043e\u0433\u043e \u0434\u043d\u044f \u043d\u0435\u0442 \u043d\u0438 \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435, \u043d\u0438 \u0432 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u043c \u043d\u0430 \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0432 RK Note \u043d\u0430 \u043d\u0443\u0436\u043d\u043e\u0439 \u043d\u0435\u0434\u0435\u043b\u0435, \u0438 \u043e\u043d \u043f\u043e\u044f\u0432\u0438\u0442\u0441\u044f."

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 275
    :cond_e3
    return-object v0
.end method

.method private static homeworkOf(Ljava/lang/Object;)Lorg/json/JSONArray;
    .registers 5

    .line 440
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 441
    instance-of v1, p0, Lrk/mcp/DiaryDb$Lesson;

    if-eqz v1, :cond_22

    .line 442
    check-cast p0, Lrk/mcp/DiaryDb$Lesson;

    iget-object p0, p0, Lrk/mcp/DiaryDb$Lesson;->homework:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_11

    .line 443
    :cond_21
    return-object v0

    .line 445
    :cond_22
    const-string v1, "a"

    invoke-static {p0, v1}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 446
    instance-of v2, p0, Ljava/util/List;

    if-nez v2, :cond_2d

    return-object v0

    .line 447
    :cond_2d
    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_33
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 448
    invoke-static {v2, v1}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lrk/mcp/McpTools;->text(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 449
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4e

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 450
    :cond_4e
    goto :goto_33

    .line 451
    :cond_4f
    return-object v0
.end method

.method private static integer(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 73
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "type"

    const-string v2, "integer"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "description"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private static knownDays(Landroid/content/Context;)Ljava/util/TreeMap;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;>;"
        }
    .end annotation

    .line 143
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 144
    invoke-static {p0}, Lrk/mcp/McpTools;->student(Landroid/content/Context;)Lrk/mcp/DiaryDb$Student;

    move-result-object v1

    .line 145
    if-eqz v1, :cond_39

    iget-object v1, v1, Lrk/mcp/DiaryDb$Student;->id:Ljava/lang/String;

    invoke-static {p0, v1}, Lrk/mcp/DiaryDb;->days(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/mcp/DiaryDb$Day;

    invoke-static {v1}, Lrk/mcp/McpTools;->eventsOf(Lrk/mcp/DiaryDb$Day;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    .line 146
    :cond_39
    invoke-static {}, Lrk/schedule/ScheduleBridge;->loadedDays()Ljava/util/Map;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/TreeMap;->putAll(Ljava/util/Map;)V

    .line 147
    return-object v0
.end method

.method private static lesson(Lrk/diary/PersonalHomeworkStore;Lrk/schedule/ScheduleResolver$Event;J)Lorg/json/JSONObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 237
    invoke-static {p1}, Lrk/mcp/McpTools;->brief(Lrk/schedule/ScheduleResolver$Event;)Lorg/json/JSONObject;

    move-result-object v0

    .line 238
    iget-boolean v1, p1, Lrk/schedule/ScheduleResolver$Event;->homeroom:Z

    if-eqz v1, :cond_e

    const-string v1, "homeroom"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 239
    :cond_e
    iget-object p1, p1, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    .line 240
    if-nez p1, :cond_13

    return-object v0

    .line 241
    :cond_13
    invoke-static {p1}, Lrk/mcp/McpTools;->topicOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 242
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_22

    const-string v2, "topic"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 243
    :cond_22
    invoke-static {p1}, Lrk/mcp/McpTools;->homeworkOf(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    .line 244
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_31

    const-string v2, "homework"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 245
    :cond_31
    invoke-static {p1}, Lrk/mcp/McpTools;->marksOf(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    .line 246
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_40

    const-string v2, "marks"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 247
    :cond_40
    invoke-static {p0, p1, p2, p3}, Lrk/mcp/McpTools;->noteOf(Lrk/diary/PersonalHomeworkStore;Ljava/lang/Object;J)Ljava/lang/String;

    move-result-object p0

    .line 248
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_4f

    const-string p1, "my_note"

    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 249
    :cond_4f
    return-object v0
.end method

.method static list()Lorg/json/JSONArray;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 33
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "rk_status"

    const-string v5, "Who is the student, today\'s date, which diary days the app knows (saved on the phone and open now) and the range of them. Call it first when unsure what data exists."

    const/4 v6, 0x1

    invoke-static {v4, v5, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 34
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    new-array v3, v2, [Ljava/lang/String;

    const-string v4, "rk_now"

    const-string v5, "Right now: the current lesson or break, the minutes left and the next lesson, with the bell times the person set in the app."

    invoke-static {v4, v5, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 35
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 36
    const-string v3, "A day as YYYY-MM-DD, or today / tomorrow / yesterday. Default today."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "date"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 37
    const-string v3, "How many days from that one, 1 to 14. Default 1."

    invoke-static {v3}, Lrk/mcp/McpTools;->integer(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "days"

    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/String;

    .line 35
    const-string v7, "rk_schedule"

    const-string v8, "Lessons of one or several days: number, subject, start and end (with the person\'s own bell schedule), the topic, the homework the school gave, marks and the person\'s own note."

    invoke-static {v7, v8, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 38
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 39
    const-string v3, "First day, YYYY-MM-DD or today / tomorrow. Default today."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v7, "from"

    invoke-virtual {v1, v7, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 40
    const-string v3, "How many days, 1 to 31. Default 7."

    invoke-static {v3}, Lrk/mcp/McpTools;->integer(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/String;

    .line 38
    const-string v8, "rk_homework"

    const-string v9, "Homework the school gave (as written in the diary) for the next days, by lesson, with the person\'s own notes next to it."

    invoke-static {v8, v9, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 41
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 42
    const-string v3, "How many days back from today, 1 to 120. Default 30."

    invoke-static {v3}, Lrk/mcp/McpTools;->integer(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 43
    const-string v3, "Only subjects whose name contains this text."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v8, "subject"

    invoke-virtual {v1, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    new-array v5, v2, [Ljava/lang/String;

    .line 41
    const-string v9, "rk_marks"

    const-string v10, "Marks given in lessons of the known diary days: subject, date, value, weight, the teacher\'s comment. Newest first."

    invoke-static {v9, v10, v6, v1, v5}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 44
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 45
    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/String;

    .line 44
    const-string v5, "rk_grades"

    const-string v9, "The marks tab of the app: for each subject the average and the marks of the periods, with the school periods and their dates."

    invoke-static {v5, v9, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 46
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    new-array v3, v2, [Ljava/lang/String;

    const-string v5, "rk_final_grades"

    const-string v9, "Final grades (quarters, terms, year) as the app saved them."

    invoke-static {v5, v9, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 47
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 48
    const-string v3, "How many, 1 to 30. Default 10."

    invoke-static {v3}, Lrk/mcp/McpTools;->integer(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v9, "limit"

    invoke-virtual {v1, v9, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    new-array v5, v2, [Ljava/lang/String;

    .line 47
    const-string v10, "rk_announcements"

    const-string v11, "Announcements of the school, newest first."

    invoke-static {v10, v11, v6, v1, v5}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 49
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 50
    const-string v5, "The folder as the app names it (for example inbox), empty for all."

    invoke-static {v5}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v10, "folder"

    invoke-virtual {v1, v10, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 51
    invoke-static {v3}, Lrk/mcp/McpTools;->integer(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v9, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/String;

    .line 49
    const-string v5, "rk_messages"

    const-string v9, "Messages in the school diary (teachers and the school), newest first."

    invoke-static {v5, v9, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 52
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    new-array v3, v2, [Ljava/lang/String;

    const-string v5, "rk_bell_profiles"

    const-string v9, "The person\'s bell schedules: profiles with start and end of each lesson, which weekdays and dates use which profile, the homeroom period."

    invoke-static {v5, v9, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 53
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 54
    const-string v3, "Only notes from this day on, YYYY-MM-DD."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v7, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 55
    const-string v3, "Only notes up to this day, YYYY-MM-DD."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "to"

    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/String;

    .line 53
    const-string v5, "rk_notes"

    const-string v7, "The person\'s own homework notes (the ones written in RK Note, not by the school)."

    invoke-static {v5, v7, v6, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 56
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 57
    const-string v3, "The day, YYYY-MM-DD."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 58
    const-string v3, "The lesson number as in the diary."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "lesson"

    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 59
    const-string v3, "The subject, if the number is not enough."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 60
    const-string v3, "The note. Empty to delete."

    invoke-static {v3}, Lrk/mcp/McpTools;->str(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v5, "text"

    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v3

    .line 56
    const-string v4, "rk_note_set"

    const-string v5, "Writes the person\'s own homework note for one lesson (replaces the old text; an empty text deletes the note)."

    invoke-static {v4, v5, v2, v1, v3}, Lrk/mcp/McpTools;->def(Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 61
    return-object v0
.end method

.method private static marks(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 279
    const-string v0, "days"

    const/16 v1, 0x1e

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    const/16 v2, 0x78

    invoke-static {v0, v1, v2}, Lrk/mcp/McpTools;->clamp(III)I

    move-result v0

    .line 280
    const-string v1, "subject"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 281
    invoke-static {}, Lrk/mcp/McpTools;->today()J

    move-result-wide v2

    .line 282
    neg-int v0, v0

    invoke-static {v2, v3, v0}, Lrk/mcp/McpTools;->plus(JI)J

    move-result-wide v4

    invoke-static {v4, v5}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v2

    .line 283
    invoke-static {p0}, Lrk/mcp/McpTools;->knownDays(Landroid/content/Context;)Ljava/util/TreeMap;

    move-result-object v3

    .line 284
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 285
    invoke-virtual {v3}, Ljava/util/TreeMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/NavigableMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_45
    :goto_45
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 286
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v6

    if-ltz v6, :cond_45

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v6

    if-lez v6, :cond_6a

    goto :goto_45

    .line 287
    :cond_6a
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_74
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_c6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrk/schedule/ScheduleResolver$Event;

    .line 288
    iget-object v8, v7, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    if-nez v8, :cond_85

    goto :goto_74

    .line 289
    :cond_85
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_9e

    iget-object v8, v7, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    if-eqz v8, :cond_9d

    iget-object v8, v7, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    sget-object v9, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_9e

    :cond_9d
    goto :goto_74

    .line 290
    :cond_9e
    iget-object v8, v7, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    invoke-static {v8}, Lrk/mcp/McpTools;->marksOf(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v8

    .line 291
    const/4 v9, 0x0

    :goto_a5
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v9, v10, :cond_c5

    invoke-virtual {v8, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    iget-object v11, v7, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {v10, v1, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "lesson_date"

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v4, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v9, v9, 0x1

    goto :goto_a5

    .line 292
    :cond_c5
    goto :goto_74

    .line 293
    :cond_c6
    goto/16 :goto_45

    .line 294
    :cond_c8
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "student"

    invoke-static {p0}, Lrk/mcp/McpTools;->studentName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "marks"

    invoke-virtual {p0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    .line 295
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-nez p1, :cond_ea

    const-string p1, "note"

    const-string v0, "\u041e\u0446\u0435\u043d\u043e\u043a \u0432 \u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0445 \u0434\u043d\u044f\u0445 \u043d\u0435\u0442. \u041e\u0446\u0435\u043d\u043a\u0438 \u043f\u043e \u043f\u0440\u0435\u0434\u043c\u0435\u0442\u0430\u043c \u0441 \u0438\u0442\u043e\u0433\u0430\u043c\u0438 \u0435\u0441\u0442\u044c \u0432 rk_grades."

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    :cond_ea
    return-object p0
.end method

.method private static marksOf(Ljava/lang/Object;)Lorg/json/JSONArray;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 456
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 457
    instance-of v1, p0, Lrk/mcp/DiaryDb$Lesson;

    if-eqz v1, :cond_26

    .line 458
    check-cast p0, Lrk/mcp/DiaryDb$Lesson;

    iget-object p0, p0, Lrk/mcp/DiaryDb$Lesson;->marks:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/mcp/DiaryDb$Mark;

    invoke-virtual {v1}, Lrk/mcp/DiaryDb$Mark;->json()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_11

    .line 459
    :cond_25
    return-object v0

    .line 461
    :cond_26
    const-string v1, "b"

    invoke-static {p0, v1}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 462
    instance-of v2, p0, Ljava/util/List;

    if-nez v2, :cond_31

    return-object v0

    .line 463
    :cond_31
    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_37
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 464
    new-instance v3, Lrk/mcp/DiaryDb$Mark;

    invoke-direct {v3}, Lrk/mcp/DiaryDb$Mark;-><init>()V

    .line 465
    const-string v4, "a"

    invoke-static {v2, v4}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lrk/mcp/McpTools;->text(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->value:Ljava/lang/String;

    .line 466
    iget-object v4, v3, Lrk/mcp/DiaryDb$Mark;->value:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_5b

    goto :goto_37

    .line 467
    :cond_5b
    const-string v4, "c"

    invoke-static {v2, v4}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 468
    instance-of v5, v4, Ljava/util/Date;

    if-eqz v5, :cond_6c

    check-cast v4, Ljava/util/Date;

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    goto :goto_6e

    :cond_6c
    const-wide/16 v4, -0x1

    :goto_6e
    iput-wide v4, v3, Lrk/mcp/DiaryDb$Mark;->date:J

    .line 469
    const-string v4, "d"

    invoke-static {v2, v4}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lrk/mcp/McpTools;->text(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->weight:Ljava/lang/String;

    .line 470
    const-string v4, "f"

    invoke-static {v2, v4}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lrk/mcp/McpTools;->text(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->kind:Ljava/lang/String;

    .line 471
    invoke-static {v2, v1}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lrk/mcp/McpTools;->text(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->comment:Ljava/lang/String;

    .line 472
    const-string v4, "h"

    invoke-static {v2, v4}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lrk/mcp/McpTools;->text(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lrk/mcp/DiaryDb$Mark;->lessonComment:Ljava/lang/String;

    .line 473
    invoke-virtual {v3}, Lrk/mcp/DiaryDb$Mark;->json()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 474
    goto :goto_37

    .line 475
    :cond_a6
    return-object v0
.end method

.method private static messages(Lorg/json/JSONObject;Landroid/content/Context;)Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 332
    const-string v0, "folder"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "limit"

    const/16 v2, 0xa

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v1, 0x1

    const/16 v2, 0x1e

    invoke-static {p0, v1, v2}, Lrk/mcp/McpTools;->clamp(III)I

    move-result p0

    invoke-static {p1, v0, p0}, Lrk/mcp/DiaryDb;->messages(Landroid/content/Context;Ljava/lang/String;I)Lorg/json/JSONArray;

    move-result-object p0

    .line 333
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "messages"

    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    .line 334
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-nez p0, :cond_35

    const-string p0, "note"

    const-string v0, "\u0421\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0439 \u0432 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438 \u043d\u0435\u0442 (\u0438\u043b\u0438 \u0440\u0430\u0437\u0434\u0435\u043b \u0435\u0449\u0451 \u043d\u0435 \u0437\u0430\u0433\u0440\u0443\u0436\u0430\u043b\u0441\u044f)."

    invoke-virtual {p1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 335
    :cond_35
    return-object p1
.end method

.method private static noteKey(Ljava/lang/Object;J)Ljava/lang/String;
    .registers 9

    .line 483
    instance-of v0, p0, Lrk/mcp/DiaryDb$Lesson;

    if-nez v0, :cond_9

    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->homeworkKey(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 484
    :cond_9
    check-cast p0, Lrk/mcp/DiaryDb$Lesson;

    .line 485
    invoke-static {}, Lrk/schedule/ScheduleBridge;->owner()Ljava/lang/String;

    move-result-object v1

    .line 486
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_48

    iget-object v0, p0, Lrk/mcp/DiaryDb$Lesson;->number:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_22

    goto :goto_48

    .line 487
    :cond_22
    new-instance v0, Lrk/diary/PersonalHomeworkStore$Id;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "number:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lrk/mcp/DiaryDb$Lesson;->number:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lrk/mcp/DiaryDb$Lesson;->title:Ljava/lang/String;

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lrk/diary/PersonalHomeworkStore$Id;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lrk/diary/PersonalHomeworkStore$Id;->key()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 486
    :cond_48
    :goto_48
    const/4 p0, 0x0

    return-object p0
.end method

.method private static noteOf(Lrk/diary/PersonalHomeworkStore;Ljava/lang/Object;J)Ljava/lang/String;
    .registers 4

    .line 491
    :try_start_0
    invoke-static {p1, p2, p3}, Lrk/mcp/McpTools;->noteKey(Ljava/lang/Object;J)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lrk/diary/PersonalHomeworkStore$Id;->parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object p1

    invoke-virtual {p0, p1}, Lrk/diary/PersonalHomeworkStore;->get(Lrk/diary/PersonalHomeworkStore$Id;)Ljava/lang/String;

    move-result-object p0
    :try_end_10
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_10} :catch_11

    return-object p0

    .line 492
    :catch_11
    move-exception p0

    const-string p0, ""

    return-object p0
.end method

.method private static noteSet(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 388
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "date"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, -0x1

    invoke-static {v3, v4, v5}, Lrk/mcp/McpTools;->parseDay(Ljava/lang/String;J)J

    move-result-wide v3

    .line 389
    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-ltz v7, :cond_17a

    .line 390
    invoke-static {v0, v3, v4}, Lrk/mcp/McpTools;->baseline(Landroid/content/Context;J)Ljava/util/List;

    move-result-object v5

    .line 391
    if-eqz v5, :cond_172

    .line 392
    const-string v6, "lesson"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v8, "subject"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    .line 393
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_4b

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_43

    goto :goto_4b

    :cond_43
    new-instance v0, Lrk/mcp/McpTools$Problem;

    const-string v1, "\u0423\u043a\u0430\u0436\u0438\u0442\u0435 \u043d\u043e\u043c\u0435\u0440 \u0443\u0440\u043e\u043a\u0430 \u0438\u043b\u0438 \u043f\u0440\u0435\u0434\u043c\u0435\u0442."

    invoke-direct {v0, v1}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw v0

    .line 394
    :cond_4b
    :goto_4b
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 395
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_54
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    const/4 v13, 0x1

    if-eqz v11, :cond_a7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lrk/schedule/ScheduleResolver$Event;

    .line 396
    iget-object v14, v11, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    if-nez v14, :cond_66

    goto :goto_54

    .line 397
    :cond_66
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_82

    iget-object v14, v11, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    if-nez v14, :cond_73

    const-string v14, ""

    goto :goto_79

    :cond_73
    iget-object v14, v11, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    :goto_79
    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_80

    goto :goto_82

    :cond_80
    const/4 v14, 0x0

    goto :goto_83

    :cond_82
    :goto_82
    const/4 v14, 0x1

    .line 398
    :goto_83
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_9e

    iget-object v15, v11, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    if-eqz v15, :cond_9c

    iget-object v15, v11, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    sget-object v12, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v15, v12}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_9c

    goto :goto_9e

    :cond_9c
    const/4 v12, 0x0

    goto :goto_9f

    :cond_9e
    :goto_9e
    const/4 v12, 0x1

    .line 399
    :goto_9f
    if-eqz v14, :cond_a6

    if-eqz v12, :cond_a6

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 400
    :cond_a6
    goto :goto_54

    .line 401
    :cond_a7
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_16a

    .line 402
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, v13, :cond_ff

    .line 403
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 404
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_bc
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/schedule/ScheduleResolver$Event;

    iget-object v3, v2, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, v2, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_bc

    .line 405
    :cond_e0
    new-instance v1, Lrk/mcp/McpTools$Problem;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041f\u043e\u0434\u0445\u043e\u0434\u0438\u0442 \u043d\u0435\u0441\u043a\u043e\u043b\u044c\u043a\u043e \u0443\u0440\u043e\u043a\u043e\u0432 ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "): \u0443\u0442\u043e\u0447\u043d\u0438\u0442\u0435 \u043d\u043e\u043c\u0435\u0440."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw v1

    .line 407
    :cond_ff
    const/4 v5, 0x0

    invoke-interface {v10, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrk/schedule/ScheduleResolver$Event;

    .line 408
    iget-object v7, v5, Lrk/schedule/ScheduleResolver$Event;->original:Ljava/lang/Object;

    invoke-static {v7, v3, v4}, Lrk/mcp/McpTools;->noteKey(Ljava/lang/Object;J)Ljava/lang/String;

    move-result-object v3

    .line 409
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lrk/diary/PersonalHomeworkStore$Id;->parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object v4

    .line 410
    if-eqz v4, :cond_162

    .line 411
    const-string v7, "text"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 412
    invoke-static {}, Lrk/schedule/ScheduleBridge;->ownerStamp()Lrk/schedule/DiaryContext$Stamp;

    move-result-object v9

    new-instance v10, Lrk/diary/PersonalHomeworkStore;

    invoke-direct {v10, v0}, Lrk/diary/PersonalHomeworkStore;-><init>(Landroid/content/Context;)V

    invoke-static {v9, v10, v4, v1}, Lrk/schedule/ScheduleBridge;->saveHomework(Lrk/schedule/DiaryContext$Stamp;Lrk/diary/PersonalHomeworkStore;Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;)V

    .line 413
    invoke-static {v3}, Lrk/diary/DiaryUi;->noteChanged(Ljava/lang/String;)V

    .line 414
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "saved"

    invoke-virtual {v0, v3, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v3, v4, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v2, v5, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-virtual {v0, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v2, v5, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {v0, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 415
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_159

    const-string v1, "\u0417\u0430\u043c\u0435\u0442\u043a\u0430 \u0443\u0434\u0430\u043b\u0435\u043d\u0430."

    goto :goto_15b

    :cond_159
    const-string v1, "\u0417\u0430\u043c\u0435\u0442\u043a\u0430 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0430."

    :goto_15b
    const-string v2, "note"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    .line 414
    return-object v0

    .line 410
    :cond_162
    new-instance v0, Lrk/mcp/McpTools$Problem;

    const-string v1, "\u0423\u0447\u0435\u043d\u0438\u043a \u043d\u0435 \u0432\u044b\u0431\u0440\u0430\u043d \u0438\u043b\u0438 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u043e\u0431\u043d\u043e\u0432\u043b\u044f\u0435\u0442\u0441\u044f. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0432 RK Note \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435."

    invoke-direct {v0, v1}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw v0

    .line 401
    :cond_16a
    new-instance v0, Lrk/mcp/McpTools$Problem;

    const-string v1, "\u0422\u0430\u043a\u043e\u0433\u043e \u0443\u0440\u043e\u043a\u0430 \u0432 \u044d\u0442\u043e\u0442 \u0434\u0435\u043d\u044c \u043d\u0435\u0442."

    invoke-direct {v0, v1}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw v0

    .line 391
    :cond_172
    new-instance v0, Lrk/mcp/McpTools$Problem;

    const-string v1, "\u042d\u0442\u043e\u0433\u043e \u0434\u043d\u044f \u043d\u0435\u0442 \u043d\u0438 \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435, \u043d\u0438 \u0432 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u043c \u043d\u0430 \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0432 RK Note \u043d\u0430 \u043d\u0443\u0436\u043d\u043e\u0439 \u043d\u0435\u0434\u0435\u043b\u0435, \u0438 \u043e\u043d \u043f\u043e\u044f\u0432\u0438\u0442\u0441\u044f."

    invoke-direct {v0, v1}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw v0

    .line 389
    :cond_17a
    new-instance v0, Lrk/mcp/McpTools$Problem;

    const-string v1, "\u041d\u0443\u0436\u043d\u0430 \u0434\u0430\u0442\u0430 YYYY-MM-DD."

    invoke-direct {v0, v1}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static notes(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 367
    invoke-static {}, Lrk/schedule/ScheduleBridge;->owner()Ljava/lang/String;

    move-result-object v0

    .line 368
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_10e

    .line 369
    const-string v1, "from"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "to"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 370
    new-instance v2, Lorg/json/JSONObject;

    const-string v3, "personal_homework_v2"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "document"

    const-string v5, "{}"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 371
    new-instance v3, Ljava/util/TreeMap;

    invoke-direct {v3}, Ljava/util/TreeMap;-><init>()V

    .line 372
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 373
    :cond_33
    :goto_33
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_db

    .line 374
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 375
    const-string v6, "note:"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_48

    goto :goto_33

    .line 376
    :cond_48
    const/4 v6, 0x5

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lrk/diary/PersonalHomeworkStore$Id;->parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object v6

    .line 377
    if-eqz v6, :cond_33

    iget-object v7, v6, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5c

    goto :goto_33

    .line 378
    :cond_5c
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_6b

    iget-object v7, v6, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    invoke-virtual {v7, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-gez v7, :cond_6b

    goto :goto_33

    .line 379
    :cond_6b
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_7a

    iget-object v7, v6, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    invoke-virtual {v7, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v7

    if-lez v7, :cond_7a

    goto :goto_33

    .line 380
    :cond_7a
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v6, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v9, v6, Lrk/diary/PersonalHomeworkStore$Id;->lesson:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v6, Lrk/diary/PersonalHomeworkStore$Id;->subject:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "date"

    iget-object v10, v6, Lrk/diary/PersonalHomeworkStore$Id;->date:Ljava/lang/String;

    invoke-virtual {v8, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v8

    iget-object v9, v6, Lrk/diary/PersonalHomeworkStore$Id;->lesson:Ljava/lang/String;

    const-string v10, "number:"

    const-string v11, ""

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "occurrence:"

    const-string v11, "\u2116"

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "lesson"

    invoke-virtual {v8, v10, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "subject"

    iget-object v6, v6, Lrk/diary/PersonalHomeworkStore$Id;->subject:Ljava/lang/String;

    invoke-virtual {v8, v9, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v8, "text"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v3, v7, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    goto/16 :goto_33

    .line 382
    :cond_db
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    .line 383
    invoke-virtual {v3}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_e8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_f8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_e8

    .line 384
    :cond_f8
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "student"

    invoke-static {p0}, Lrk/mcp/McpTools;->studentName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v0, "notes"

    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 368
    :cond_10e
    new-instance p0, Lrk/mcp/McpTools$Problem;

    const-string p1, "\u0423\u0447\u0435\u043d\u0438\u043a \u043d\u0435 \u0432\u044b\u0431\u0440\u0430\u043d: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0432 RK Note."

    invoke-direct {p0, p1}, Lrk/mcp/McpTools$Problem;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static now(Landroid/content/Context;)Lorg/json/JSONObject;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 181
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 182
    invoke-static {}, Lrk/mcp/McpTools;->today()J

    move-result-wide v2

    .line 183
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-static {v4}, Lrk/schedule/ScheduleResolver;->minute(Ljava/util/Date;)I

    move-result v0

    .line 184
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "date"

    invoke-static {v2, v3}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    sget-object v4, Lrk/mcp/McpTools;->WEEKDAYS:[Ljava/lang/String;

    invoke-static {v2, v3}, Lrk/schedule/ScheduleResolver;->weekday(J)I

    move-result v5

    aget-object v4, v4, v5

    const-string v5, "weekday"

    invoke-virtual {v1, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v4, "time"

    invoke-static {v0}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 185
    invoke-static {p0, v2, v3}, Lrk/mcp/McpTools;->resolved(Landroid/content/Context;J)Ljava/util/List;

    move-result-object v4

    .line 186
    invoke-static {p0, v2, v3}, Lrk/mcp/McpTools;->baseline(Landroid/content/Context;J)Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_49

    const-string p0, "note"

    const-string v2, "\u042d\u0442\u043e\u0433\u043e \u0434\u043d\u044f \u043d\u0435\u0442 \u043d\u0438 \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435, \u043d\u0438 \u0432 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u043c \u043d\u0430 \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0432 RK Note \u043d\u0430 \u043d\u0443\u0436\u043d\u043e\u0439 \u043d\u0435\u0434\u0435\u043b\u0435, \u0438 \u043e\u043d \u043f\u043e\u044f\u0432\u0438\u0442\u0441\u044f. \u0421\u0435\u0439\u0447\u0430\u0441 \u0432\u0438\u0434\u043d\u044b \u0442\u043e\u043b\u044c\u043a\u043e \u0437\u0432\u043e\u043d\u043a\u0438 \u043f\u0440\u043e\u0444\u0438\u043b\u044f, \u0435\u0441\u043b\u0438 \u043e\u043d\u0438 \u0437\u0430\u0434\u0430\u043d\u044b."

    invoke-virtual {v1, p0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 187
    :cond_49
    nop

    .line 188
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v2, 0x0

    move-object v3, v2

    :goto_50
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrk/schedule/ScheduleResolver$Event;

    .line 189
    iget v6, v5, Lrk/schedule/ScheduleResolver$Event;->start:I

    if-gt v6, v0, :cond_66

    iget v6, v5, Lrk/schedule/ScheduleResolver$Event;->end:I

    if-ge v0, v6, :cond_66

    move-object v2, v5

    goto :goto_6d

    .line 190
    :cond_66
    iget v6, v5, Lrk/schedule/ScheduleResolver$Event;->start:I

    if-le v6, v0, :cond_6d

    if-nez v3, :cond_6d

    move-object v3, v5

    .line 191
    :cond_6d
    :goto_6d
    goto :goto_50

    .line 192
    :cond_6e
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result p0

    const-string v5, "state"

    if-eqz p0, :cond_7c

    const-string p0, "no_lessons"

    invoke-virtual {v1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_ba

    .line 193
    :cond_7c
    if-eqz v2, :cond_97

    .line 194
    const-string p0, "lesson"

    invoke-virtual {v1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v4, "current"

    invoke-static {v2}, Lrk/mcp/McpTools;->brief(Lrk/schedule/ScheduleResolver$Event;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    iget v2, v2, Lrk/schedule/ScheduleResolver$Event;->end:I

    sub-int/2addr v2, v0

    const-string v0, "minutes_left"

    invoke-virtual {p0, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_ba

    .line 195
    :cond_97
    if-eqz v3, :cond_b5

    .line 196
    const/4 p0, 0x0

    invoke-interface {v4, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-ne v3, v2, :cond_a1

    const/4 p0, 0x1

    .line 197
    :cond_a1
    if-eqz p0, :cond_a6

    const-string p0, "before_school"

    goto :goto_a8

    :cond_a6
    const-string p0, "break"

    :goto_a8
    invoke-virtual {v1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    iget v2, v3, Lrk/schedule/ScheduleResolver$Event;->start:I

    sub-int/2addr v2, v0

    const-string v0, "minutes_until_next"

    invoke-virtual {p0, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 198
    goto :goto_ba

    :cond_b5
    const-string p0, "after_school"

    invoke-virtual {v1, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 199
    :goto_ba
    if-eqz v3, :cond_c5

    const-string p0, "next"

    invoke-static {v3}, Lrk/mcp/McpTools;->brief(Lrk/schedule/ScheduleResolver$Event;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 200
    :cond_c5
    return-object v1
.end method

.method private static parseDay(Ljava/lang/String;J)J
    .registers 4

    .line 507
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_f

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 508
    :goto_f
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_54

    const-string v0, "null"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    goto :goto_54

    .line 509
    :cond_1e
    const-string p1, "today"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2b

    invoke-static {}, Lrk/mcp/McpTools;->today()J

    move-result-wide p0

    return-wide p0

    .line 510
    :cond_2b
    const-string p1, "tomorrow"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3d

    invoke-static {}, Lrk/mcp/McpTools;->today()J

    move-result-wide p0

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Lrk/mcp/McpTools;->plus(JI)J

    move-result-wide p0

    return-wide p0

    .line 511
    :cond_3d
    const-string p1, "yesterday"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    invoke-static {}, Lrk/mcp/McpTools;->today()J

    move-result-wide p0

    const/4 p2, -0x1

    invoke-static {p0, p1, p2}, Lrk/mcp/McpTools;->plus(JI)J

    move-result-wide p0

    return-wide p0

    .line 512
    :cond_4f
    invoke-static {p0}, Lrk/schedule/ScheduleResolver;->date(Ljava/lang/String;)J

    move-result-wide p0

    return-wide p0

    .line 508
    :cond_54
    :goto_54
    return-wide p1
.end method

.method private static plus(JI)J
    .registers 4

    .line 500
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 501
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 502
    const/4 p0, 0x5

    invoke-virtual {v0, p0, p2}, Ljava/util/Calendar;->add(II)V

    .line 503
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method private static profileName(Lrk/schedule/ScheduleStore;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 362
    iget-object p0, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrk/schedule/ScheduleStore$Profile;

    .line 363
    if-nez p0, :cond_b

    goto :goto_d

    :cond_b
    iget-object p1, p0, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    :goto_d
    return-object p1
.end method

.method private static resolved(Landroid/content/Context;J)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "J)",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;"
        }
    .end annotation

    .line 421
    :try_start_0
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lrk/mcp/McpTools;->baseline(Landroid/content/Context;J)Ljava/util/List;

    move-result-object p0

    const/4 v1, 0x1

    invoke-static {v0, p1, p2, p0, v1}, Lrk/schedule/ScheduleBridge;->resolve(Lrk/schedule/ScheduleStore;JLjava/util/List;Z)Ljava/util/List;

    move-result-object p0
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_d} :catch_e

    return-object p0

    .line 422
    :catch_e
    move-exception p0

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method

.method private static result(Ljava/lang/String;Z)Lorg/json/JSONObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 106
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const-string v4, "text"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {v1, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object p0

    const-string v1, "content"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v0, "isError"

    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private static schedule(Landroid/content/Context;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 204
    const-string v0, "date"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lrk/mcp/McpTools;->today()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lrk/mcp/McpTools;->parseDay(Ljava/lang/String;J)J

    move-result-wide v0

    .line 205
    const-string v2, "days"

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    const/16 v4, 0xe

    invoke-static {p1, v3, v4}, Lrk/mcp/McpTools;->clamp(III)I

    move-result p1

    .line 206
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 207
    new-instance v4, Lrk/diary/PersonalHomeworkStore;

    invoke-direct {v4, p0}, Lrk/diary/PersonalHomeworkStore;-><init>(Landroid/content/Context;)V

    .line 208
    const/4 v5, 0x0

    :goto_26
    if-ge v5, p1, :cond_36

    invoke-static {v0, v1, v5}, Lrk/mcp/McpTools;->plus(JI)J

    move-result-wide v6

    invoke-static {p0, v4, v6, v7}, Lrk/mcp/McpTools;->dayJson(Landroid/content/Context;Lrk/diary/PersonalHomeworkStore;J)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    .line 209
    :cond_36
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "student"

    invoke-static {p0}, Lrk/mcp/McpTools;->studentName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private static status(Landroid/content/Context;)Lorg/json/JSONObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 162
    invoke-static {}, Lrk/mcp/McpTools;->today()J

    move-result-wide v0

    .line 163
    invoke-static {p0}, Lrk/mcp/McpTools;->knownDays(Landroid/content/Context;)Ljava/util/TreeMap;

    move-result-object v2

    .line 164
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 165
    const-string v4, "today"

    invoke-static {v0, v1}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    sget-object v5, Lrk/mcp/McpTools;->WEEKDAYS:[Ljava/lang/String;

    invoke-static {v0, v1}, Lrk/schedule/ScheduleResolver;->weekday(J)I

    move-result v0

    aget-object v0, v5, v0

    const-string v1, "weekday"

    invoke-virtual {v4, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 166
    const-string v0, "student"

    invoke-static {p0}, Lrk/mcp/McpTools;->studentName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 167
    invoke-static {p0}, Lrk/mcp/DiaryDb;->students(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 168
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v4, 0x1

    if-le v1, v4, :cond_60

    .line 169
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 170
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_53

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrk/mcp/DiaryDb$Student;

    iget-object v4, v4, Lrk/mcp/DiaryDb$Student;->name:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_41

    .line 171
    :cond_53
    const-string v0, "students_in_the_app"

    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "note_about_students"

    const-string v4, "\u0414\u0430\u043d\u043d\u044b\u0435 \u0431\u0435\u0440\u0443\u0442\u0441\u044f \u043f\u043e \u0443\u0447\u0435\u043d\u0438\u043a\u0443, \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u043c\u0443 \u0432 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0435 RK Note."

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 173
    :cond_60
    const-string v0, "diary_days_known"

    invoke-virtual {v2}, Ljava/util/TreeMap;->size()I

    move-result v1

    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {}, Lrk/schedule/ScheduleBridge;->loadedDays()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    const-string v4, "diary_days_open_now"

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 174
    invoke-virtual {v2}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_91

    const-string v0, "diary_from"

    invoke-virtual {v2}, Ljava/util/TreeMap;->firstKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "diary_to"

    invoke-virtual {v2}, Ljava/util/TreeMap;->lastKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_98

    .line 175
    :cond_91
    const-string v0, "hint"

    const-string v1, "\u0414\u043d\u0435\u0432\u043d\u0438\u043a \u0432 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0438 \u043f\u043e\u043a\u0430 \u043f\u0443\u0441\u0442: \u042d\u0442\u043e\u0433\u043e \u0434\u043d\u044f \u043d\u0435\u0442 \u043d\u0438 \u043d\u0430 \u044d\u043a\u0440\u0430\u043d\u0435, \u043d\u0438 \u0432 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u043c \u043d\u0430 \u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0435: \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0434\u043d\u0435\u0432\u043d\u0438\u043a \u0432 RK Note \u043d\u0430 \u043d\u0443\u0436\u043d\u043e\u0439 \u043d\u0435\u0434\u0435\u043b\u0435, \u0438 \u043e\u043d \u043f\u043e\u044f\u0432\u0438\u0442\u0441\u044f."

    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 176
    :goto_98
    invoke-static {p0}, Lrk/schedule/ScheduleBridge;->store(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object p0

    iget-object p0, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->size()I

    move-result p0

    const-string v0, "bell_profiles"

    invoke-virtual {v3, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 177
    return-object v3
.end method

.method private static str(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 71
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "type"

    const-string v2, "string"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "description"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private static student(Landroid/content/Context;)Lrk/mcp/DiaryDb$Student;
    .registers 5

    .line 118
    invoke-static {p0}, Lrk/mcp/DiaryDb;->students(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    .line 119
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p0, 0x0

    return-object p0

    .line 120
    :cond_c
    invoke-static {}, Lrk/schedule/ScheduleBridge;->selectedStudent()Ljava/lang/String;

    move-result-object v0

    .line 121
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_37

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_37

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/mcp/DiaryDb$Student;

    iget-object v3, v2, Lrk/mcp/DiaryDb$Student;->id:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_36

    iget-object v3, v2, Lrk/mcp/DiaryDb$Student;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    :cond_36
    return-object v2

    .line 122
    :cond_37
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrk/mcp/DiaryDb$Student;

    return-object p0
.end method

.method private static studentName(Landroid/content/Context;)Ljava/lang/String;
    .registers 3

    .line 151
    invoke-static {p0}, Lrk/mcp/McpTools;->student(Landroid/content/Context;)Lrk/mcp/DiaryDb$Student;

    move-result-object p0

    .line 152
    if-eqz p0, :cond_11

    iget-object v0, p0, Lrk/mcp/DiaryDb$Student;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_11

    iget-object p0, p0, Lrk/mcp/DiaryDb$Student;->name:Ljava/lang/String;

    return-object p0

    .line 153
    :cond_11
    invoke-static {}, Lrk/schedule/ScheduleBridge;->ownerLabel()Ljava/lang/String;

    move-result-object p0

    .line 154
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 155
    if-gez v0, :cond_1e

    goto :goto_23

    :cond_1e
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 156
    :goto_23
    const-string v0, "\u0423\u0447\u0435\u043d\u0438\u043a: "

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_31

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_31
    return-object p0
.end method

.method private static text(Ljava/lang/Object;)Ljava/lang/String;
    .registers 1

    .line 430
    if-nez p0, :cond_5

    const-string p0, ""

    goto :goto_d

    :cond_5
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_d
    return-object p0
.end method

.method private static today()J
    .registers 2

    .line 497
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lrk/schedule/ScheduleResolver;->date(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method private static topicOf(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 434
    instance-of v0, p0, Lrk/mcp/DiaryDb$Lesson;

    if-eqz v0, :cond_9

    check-cast p0, Lrk/mcp/DiaryDb$Lesson;

    iget-object p0, p0, Lrk/mcp/DiaryDb$Lesson;->topic:Ljava/lang/String;

    return-object p0

    .line 435
    :cond_9
    const-string v0, "g"

    invoke-static {p0, v0}, Lrk/mcp/McpTools;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrk/mcp/McpTools;->text(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
