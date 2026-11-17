.class public final Lrk/schedule/ScheduleStore;
.super Ljava/lang/Object;
.source "ScheduleStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/schedule/ScheduleStore$Profile;
    }
.end annotation


# static fields
.field static final PREFS:Ljava/lang/String; = "rk_schedule_v2"


# instance fields
.field public final corrections:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final dates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final homerooms:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lrk/schedule/ScheduleResolver$Homeroom;",
            ">;"
        }
    .end annotation
.end field

.field public final needsSetup:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final profiles:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lrk/schedule/ScheduleStore$Profile;",
            ">;"
        }
    .end annotation
.end field

.field public final weekdays:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    .line 14
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    .line 15
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    .line 16
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    .line 17
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    .line 18
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    return-void
.end method

.method public static decode(Ljava/lang/String;)Lrk/schedule/ScheduleStore;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 28
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "version"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p0

    const/4 v1, 0x2

    if-ne p0, v1, :cond_1ae

    .line 29
    new-instance p0, Lrk/schedule/ScheduleStore;

    invoke-direct {p0}, Lrk/schedule/ScheduleStore;-><init>()V

    const-string v1, "profiles"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 30
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1b
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_81

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    new-instance v5, Lrk/schedule/ScheduleStore$Profile;

    const-string v6, "id"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "name"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lrk/schedule/ScheduleStore$Profile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "slots"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_79

    const/4 v6, 0x0

    :goto_45
    if-ge v6, v7, :cond_5f

    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v8

    iget-object v9, v5, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v10

    const/4 v11, 0x1

    invoke-virtual {v8, v11}, Lorg/json/JSONArray;->getInt(I)I

    move-result v8

    filled-new-array {v10, v8}, [I

    move-result-object v8

    aput-object v8, v9, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_45

    :cond_5f
    iget-object v4, v5, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    invoke-static {v4}, Lrk/schedule/ScheduleResolver;->validateSlots([[I)V

    iget-object v4, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    iget-object v6, v5, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    invoke-virtual {v4, v6, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_71

    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    :cond_71
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Duplicate profile"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_79
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Eight slots required"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 31
    :cond_81
    const-string v1, "dates"

    invoke-static {v0, v1}, Lrk/schedule/ScheduleStore;->object(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "weekdays"

    invoke-static {v0, v3}, Lrk/schedule/ScheduleStore;->object(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "homerooms"

    invoke-static {v0, v4}, Lrk/schedule/ScheduleStore;->object(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 32
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    :goto_97
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_ad

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iget-object v7, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_97

    .line 33
    :cond_ad
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_b1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_cf

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b1

    .line 34
    :cond_cf
    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    :goto_d3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_10e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    new-instance v6, Lrk/schedule/ScheduleResolver$Homeroom;

    invoke-direct {v6}, Lrk/schedule/ScheduleResolver$Homeroom;-><init>()V

    const-string v7, "mode"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    const-string v7, "start"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    const-string v7, "end"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v6, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    const-string v7, "lesson"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, v6, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    iget-object v5, p0, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    invoke-interface {v5, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d3

    .line 35
    :cond_10e
    const-string v1, "corrections"

    invoke-static {v0, v1}, Lrk/schedule/ScheduleStore;->object(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    :goto_118
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_145

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    int-to-long v6, v5

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    const-wide/16 v8, 0x5a0

    cmp-long v10, v6, v8

    if-gez v10, :cond_13d

    iget-object v6, p0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_118

    :cond_13d
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Invalid correction"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 36
    :cond_145
    const-string v1, "needsSetup"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_15f

    :goto_14d
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_15f

    iget-object v1, p0, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_14d

    .line 37
    :cond_15f
    iget-object v0, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_169
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_186

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17e

    goto :goto_169

    :cond_17e
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Missing date profile"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 38
    :cond_186
    iget-object v0, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_190
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1ad

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a5

    goto :goto_190

    :cond_1a5
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Missing weekday profile"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 39
    :cond_1ad
    return-object p0

    .line 28
    :cond_1ae
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Unsupported schedule version"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static load(Landroid/content/Context;)Lrk/schedule/ScheduleStore;
    .registers 4

    .line 21
    const-string v0, "rk_schedule_v2"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "config"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 22
    if-eqz v0, :cond_1e

    :try_start_10
    invoke-static {v0}, Lrk/schedule/ScheduleStore;->decode(Ljava/lang/String;)Lrk/schedule/ScheduleStore;

    move-result-object p0
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_14} :catch_15

    return-object p0

    :catch_15
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435. \u0421\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0435 \u0434\u0430\u043d\u043d\u044b\u0435 \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u044b"

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 23
    :cond_1e
    invoke-static {p0}, Lrk/schedule/ScheduleStore;->migrate(Landroid/content/Context;)Lrk/schedule/ScheduleStore;

    move-result-object v0

    .line 24
    invoke-virtual {v0, p0}, Lrk/schedule/ScheduleStore;->save(Landroid/content/Context;)V

    return-object v0
.end method

.method private static migrate(Landroid/content/Context;)Lrk/schedule/ScheduleStore;
    .registers 18

    .line 60
    move-object/from16 v1, p0

    new-instance v2, Lrk/schedule/ScheduleStore;

    invoke-direct {v2}, Lrk/schedule/ScheduleStore;-><init>()V

    const-string v0, "lesson_schedule_prefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 61
    const-string v5, "45"

    const-string v0, "40"

    const-string v6, "35"

    const-string v7, "30"

    filled-new-array {v5, v0, v6, v7}, [Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    :goto_1b
    const-string v0, "_"

    const-string v10, ""

    const/4 v12, 0x4

    if-ge v8, v12, :cond_e4

    aget-object v12, v6, v8

    new-instance v13, Lrk/schedule/ScheduleStore$Profile;

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2f

    const-string v14, "\u041e\u0431\u044b\u0447\u043d\u044b\u0439 \u00b7 45 \u043c\u0438\u043d"

    goto :goto_48

    :cond_2f
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\u0421\u043e\u043a\u0440\u0430\u0449\u0451\u043d\u043d\u044b\u0439 \u00b7 "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " \u043c\u0438\u043d"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    :goto_48
    invoke-direct {v13, v12, v14}, Lrk/schedule/ScheduleStore$Profile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_4d
    const/16 v11, 0x8

    if-ge v14, v11, :cond_b8

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "profile_"

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v11, v14, 0x1

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v16, v6

    const-string v6, "_start"

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result v6

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v9, "_end"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result v3

    if-ltz v6, :cond_b3

    if-le v3, v6, :cond_b3

    iget-object v9, v13, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    filled-new-array {v6, v3}, [I

    move-result-object v3

    aput-object v3, v9, v14

    const/4 v15, 0x1

    :cond_b3
    move v14, v11

    move-object/from16 v6, v16

    const/4 v3, 0x0

    goto :goto_4d

    .line 63
    :cond_b8
    move-object/from16 v16, v6

    :try_start_ba
    iget-object v0, v13, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    invoke-static {v0}, Lrk/schedule/ScheduleResolver;->validateSlots([[I)V
    :try_end_bf
    .catch Ljava/lang/IllegalArgumentException; {:try_start_ba .. :try_end_bf} :catch_c0

    goto :goto_d1

    :catch_c0
    move-exception v0

    iget-object v0, v13, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    array-length v3, v0

    const/4 v6, 0x0

    :goto_c5
    if-ge v6, v3, :cond_d0

    aget-object v9, v0, v6

    const/4 v10, -0x1

    invoke-static {v9, v10}, Ljava/util/Arrays;->fill([II)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_c5

    :cond_d0
    const/4 v15, 0x0

    .line 64
    :goto_d1
    iget-object v0, v2, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v12, v13}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v15, :cond_dd

    iget-object v0, v2, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    invoke-interface {v0, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 61
    :cond_dd
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v6, v16

    const/4 v3, 0x0

    goto/16 :goto_1b

    .line 66
    :cond_e4
    const/4 v3, 0x1

    :goto_e5
    const/4 v6, 0x7

    const/16 v8, 0x2d

    if-gt v3, v6, :cond_19b

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "dow_profile_"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v9, 0x0

    invoke-interface {v4, v6, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const-string v11, "dow_"

    if-eqz v9, :cond_124

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4, v9, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v9

    const/16 v12, 0x1e

    if-ne v9, v12, :cond_124

    move-object v6, v7

    :cond_124
    if-nez v6, :cond_156

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4, v9}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_156

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    :cond_156
    if-nez v6, :cond_159

    move-object v6, v5

    :cond_159
    iget-object v8, v2, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v8, v6}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_16a

    iget-object v8, v2, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v8, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16a
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "homeroom_dow_"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "dow:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v2, v4, v6, v8}, Lrk/schedule/ScheduleStore;->migrateHomeroom(Lrk/schedule/ScheduleStore;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_e5

    .line 67
    :cond_19b
    const-string v0, "today_date"

    invoke-interface {v4, v0, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lrk/schedule/ScheduleStore;->oldDate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "today_duration"

    invoke-interface {v4, v3, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1c2

    iget-object v5, v2, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v3}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c2

    iget-object v5, v2, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-interface {v5, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    :cond_1c2
    const-string v0, "homeroom_today_date"

    invoke-interface {v4, v0, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lrk/schedule/ScheduleStore;->oldDate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1d7

    const-string v3, "homeroom_today_"

    invoke-static {v2, v4, v3, v0}, Lrk/schedule/ScheduleStore;->migrateHomeroom(Lrk/schedule/ScheduleStore;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    :cond_1d7
    const-string v0, "manual_bell_correction"

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const-string v3, "day"

    const/4 v10, -0x1

    invoke-interface {v0, v3, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    mul-int/lit16 v4, v4, 0x3e8

    const/4 v5, 0x6

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    add-int/2addr v4, v5

    if-ne v3, v4, :cond_228

    const-string v3, "shift"

    const-wide/16 v4, 0x0

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    long-to-double v3, v3

    const-wide v5, 0x40ed4c0000000000L    # 60000.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    long-to-int v0, v3

    int-to-long v3, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    const-wide/16 v5, 0x5a0

    cmp-long v7, v3, v5

    if-gez v7, :cond_228

    iget-object v3, v2, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    :cond_228
    return-object v2
.end method

.method private static migrateHomeroom(Lrk/schedule/ScheduleStore;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "start"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v2, "end"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lrk/schedule/ScheduleResolver;->parse(Ljava/lang/String;)I

    move-result p1

    if-ltz v0, :cond_4a

    if-le p1, v0, :cond_4a

    new-instance p2, Lrk/schedule/ScheduleResolver$Homeroom;

    invoke-direct {p2}, Lrk/schedule/ScheduleResolver$Homeroom;-><init>()V

    iput v0, p2, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    iput p1, p2, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    iget-object p0, p0, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    invoke-interface {p0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4a
    return-void
.end method

.method private static object(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 2

    .line 19
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_b

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :cond_b
    return-object p0
.end method

.method private static oldDate(Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    .line 58
    const-string v0, ""

    :try_start_2
    const-string v1, "-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x3

    if-eq v1, v2, :cond_d

    return-object v0

    :cond_d
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v3, "%04d-%02d-%02d"

    const/4 v4, 0x0

    aget-object v5, p0, v4

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x1

    aget-object v7, p0, v6

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x2

    aget-object p0, p0, v8

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v5, v2, v4

    aput-object v7, v2, v6

    aput-object p0, v2, v8

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_3e} :catch_3f

    return-object p0

    :catch_3f
    move-exception p0

    return-object v0
.end method


# virtual methods
.method public active(J)Lrk/schedule/ScheduleStore$Profile;
    .registers 5

    .line 52
    iget-object v0, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_1f

    iget-object v0, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->weekday(J)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    :cond_1f
    iget-object p1, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrk/schedule/ScheduleStore$Profile;

    return-object p1
.end method

.method public assignDate(JLjava/lang/String;)V
    .registers 6

    .line 55
    invoke-virtual {p0}, Lrk/schedule/ScheduleStore;->copy()Lrk/schedule/ScheduleStore;

    move-result-object v0

    if-nez p3, :cond_10

    iget-object p3, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    :cond_10
    iget-object v1, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_19
    invoke-virtual {p0, v0}, Lrk/schedule/ScheduleStore;->clearChangedCorrections(Lrk/schedule/ScheduleStore;)V

    return-void
.end method

.method public assignWeekdays(Ljava/lang/String;[ZZ)V
    .registers 9

    .line 56
    invoke-virtual {p0}, Lrk/schedule/ScheduleStore;->copy()Lrk/schedule/ScheduleStore;

    move-result-object v0

    const/4 v1, 0x0

    :goto_5
    const/4 v2, 0x7

    if-ge v1, v2, :cond_44

    if-eqz p3, :cond_1a

    aget-boolean v2, p2, v1

    if-eqz v2, :cond_41

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    add-int/lit8 v3, v1, 0x1

    :goto_12
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_41

    :cond_1a
    aget-boolean v2, p2, v1

    if-eqz v2, :cond_2c

    if-eqz p1, :cond_2c

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    add-int/lit8 v3, v1, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_41

    :cond_2c
    iget-object v2, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    add-int/lit8 v3, v1, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_41

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    goto :goto_12

    :cond_41
    :goto_41
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_44
    invoke-virtual {p0, v0}, Lrk/schedule/ScheduleStore;->clearChangedCorrections(Lrk/schedule/ScheduleStore;)V

    return-void
.end method

.method public clearChangedCorrections(Lrk/schedule/ScheduleStore;)V
    .registers 7

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lrk/schedule/ScheduleResolver;->date(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Lrk/schedule/ScheduleStore;->active(J)Lrk/schedule/ScheduleStore$Profile;

    move-result-object v4

    invoke-virtual {p0, v2, v3}, Lrk/schedule/ScheduleStore;->active(J)Lrk/schedule/ScheduleStore$Profile;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v4, :cond_2c

    move-object v4, v3

    goto :goto_2e

    :cond_2c
    iget-object v4, v4, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    :goto_2e
    if-nez v2, :cond_31

    goto :goto_33

    :cond_31
    iget-object v3, v2, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    :goto_33
    invoke-static {v4, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    :cond_3f
    return-void
.end method

.method public copy()Lrk/schedule/ScheduleStore;
    .registers 3

    .line 26
    :try_start_0
    invoke-virtual {p0}, Lrk/schedule/ScheduleStore;->encode()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lrk/schedule/ScheduleStore;->decode(Ljava/lang/String;)Lrk/schedule/ScheduleStore;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    return-object v0

    :catch_9
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public encode()Ljava/lang/String;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 42
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "version"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 43
    iget-object v2, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrk/schedule/ScheduleStore$Profile;

    iget-object v4, v3, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    invoke-static {v4}, Lrk/schedule/ScheduleResolver;->validateSlots([[I)V

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "id"

    iget-object v6, v3, Lrk/schedule/ScheduleStore$Profile;->id:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v5, "name"

    iget-object v6, v3, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    iget-object v3, v3, Lrk/schedule/ScheduleStore$Profile;->slots:[[I

    array-length v6, v3

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_48
    if-ge v8, v6, :cond_64

    aget-object v9, v3, v8

    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V

    aget v11, v9, v7

    invoke-virtual {v10, v11}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    move-result-object v10

    const/4 v11, 0x1

    aget v9, v9, v11

    invoke-virtual {v10, v9}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    move-result-object v9

    invoke-virtual {v5, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v8, v8, 0x1

    goto :goto_48

    :cond_64
    const-string v3, "slots"

    invoke-virtual {v4, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1a

    .line 44
    :cond_6d
    const-string v2, "profiles"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    const-string v2, "dates"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_8d

    :cond_a9
    const-string v2, "weekdays"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_bd
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_fa

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrk/schedule/ScheduleResolver$Homeroom;

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "mode"

    iget-object v7, v4, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "start"

    iget v7, v4, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v6, "end"

    iget v7, v4, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v6, "lesson"

    iget v4, v4, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    invoke-virtual {v5, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_bd

    :cond_fa
    const-string v2, "homerooms"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->corrections:Ljava/util/Map;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    const-string v2, "corrections"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONArray;

    iget-object v2, p0, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    const-string v2, "needsSetup"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public homeroom(J)Lrk/schedule/ScheduleResolver$Homeroom;
    .registers 6

    .line 54
    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    iget-object p1, p0, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_30

    :cond_13
    iget-object v0, p0, Lrk/schedule/ScheduleStore;->homerooms:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dow:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->weekday(J)I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_30
    check-cast p1, Lrk/schedule/ScheduleResolver$Homeroom;

    return-object p1
.end method

.method public remove(Ljava/lang/String;)V
    .registers 5

    .line 57
    invoke-virtual {p0}, Lrk/schedule/ScheduleStore;->copy()Lrk/schedule/ScheduleStore;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/ScheduleStore;->profiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    iget-object v1, p0, Lrk/schedule/ScheduleStore;->weekdays:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    iget-object v1, p0, Lrk/schedule/ScheduleStore;->needsSetup:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lrk/schedule/ScheduleStore;->clearChangedCorrections(Lrk/schedule/ScheduleStore;)V

    return-void
.end method

.method public save(Landroid/content/Context;)V
    .registers 6

    .line 48
    const-string v0, "config"

    :try_start_2
    invoke-virtual {p0}, Lrk/schedule/ScheduleStore;->encode()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lrk/schedule/ScheduleStore;->decode(Ljava/lang/String;)Lrk/schedule/ScheduleStore;

    const-string v2, "rk_schedule_v2"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const/4 v2, 0x0

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v1

    if-nez v1, :cond_3b

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    if-nez v2, :cond_2d

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_30

    :cond_2d
    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_30
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "\u041e\u0448\u0438\u0431\u043a\u0430 \u0437\u0430\u043f\u0438\u0441\u0438 \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u044f"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3b
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_3b} :catch_3d

    .line 49
    :cond_3b
    nop

    .line 50
    return-void

    .line 49
    :catch_3d
    move-exception p1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0440\u0430\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    invoke-direct {v0, v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public source(J)Ljava/lang/String;
    .registers 5

    .line 53
    invoke-virtual {p0, p1, p2}, Lrk/schedule/ScheduleStore;->active(J)Lrk/schedule/ScheduleStore$Profile;

    move-result-object v0

    if-nez v0, :cond_9

    const-string p1, "\u0418\u0437 \u0434\u043d\u0435\u0432\u043d\u0438\u043a\u0430"

    goto :goto_2d

    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v0, Lrk/schedule/ScheduleStore$Profile;->name:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/ScheduleStore;->dates:Ljava/util/Map;

    invoke-static {p1, p2}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_23

    const-string p1, " \u00b7 \u043d\u0430 \u0434\u0430\u0442\u0443"

    goto :goto_25

    :cond_23
    const-string p1, " \u00b7 \u043f\u043e \u0434\u043d\u044e \u043d\u0435\u0434\u0435\u043b\u0438"

    :goto_25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_2d
    return-object p1
.end method
