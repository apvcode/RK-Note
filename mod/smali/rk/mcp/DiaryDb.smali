.class final Lrk/mcp/DiaryDb;
.super Ljava/lang/Object;
.source "DiaryDb.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/mcp/DiaryDb$Student;,
        Lrk/mcp/DiaryDb$Day;,
        Lrk/mcp/DiaryDb$Mark;,
        Lrk/mcp/DiaryDb$Lesson;
    }
.end annotation


# static fields
.field private static final FILE:Ljava/lang/String; = "el_jur_db"

.field private static cached:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lrk/mcp/DiaryDb$Day;",
            ">;"
        }
    .end annotation
.end field

.field private static cachedAt:J

.field private static cachedFor:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 91
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    sput-object v0, Lrk/mcp/DiaryDb;->cached:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static announcements(Landroid/content/Context;I)Lorg/json/JSONArray;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 173
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 174
    invoke-static {p0}, Lrk/mcp/DiaryDb;->open(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 175
    if-nez p0, :cond_c

    return-object v0

    .line 176
    :cond_c
    :try_start_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELECT subject, text, shortText, dateFrom, isRead, firstName, lastName, middleName FROM announcement ORDER BY dateFrom DESC LIMIT "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_24
    .catchall {:try_start_c .. :try_end_24} :catchall_ad

    .line 177
    :goto_24
    :try_start_24
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_9b

    .line 178
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "subject"

    const/4 v3, 0x0

    invoke-static {p1, v3}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "text"

    const/4 v4, 0x1

    invoke-static {p1, v4}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_4d

    const/4 v5, 0x2

    invoke-static {p1, v5}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    goto :goto_51

    :cond_4d
    invoke-static {p1, v4}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    :goto_51
    invoke-static {v5}, Lrk/mcp/DiaryDb;->plain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 179
    const/4 v2, 0x3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v5

    if-nez v5, :cond_71

    const-string v5, "date"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    invoke-static {v6, v7}, Lrk/mcp/DiaryDb;->millis(J)J

    move-result-wide v6

    invoke-static {v6, v7}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    :cond_71
    const-string v2, "read"

    const/4 v5, 0x4

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    if-eqz v5, :cond_7b

    const/4 v3, 0x1

    :cond_7b
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "from"

    const/4 v4, 0x6

    invoke-static {p1, v4}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x5

    invoke-static {p1, v5}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x7

    invoke-static {p1, v6}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lrk/mcp/DiaryDb;->person(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 181
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_9a
    .catchall {:try_start_24 .. :try_end_9a} :catchall_a1

    .line 182
    goto :goto_24

    .line 183
    :cond_9b
    if-eqz p1, :cond_b5

    :try_start_9d
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_a0
    .catchall {:try_start_9d .. :try_end_a0} :catchall_ad

    goto :goto_b5

    .line 176
    :catchall_a1
    move-exception v1

    if-eqz p1, :cond_ac

    :try_start_a4
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_a7
    .catchall {:try_start_a4 .. :try_end_a7} :catchall_a8

    goto :goto_ac

    :catchall_a8
    move-exception p1

    :try_start_a9
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_ac
    :goto_ac
    throw v1
    :try_end_ad
    .catchall {:try_start_a9 .. :try_end_ad} :catchall_ad

    .line 183
    :catchall_ad
    move-exception p1

    .line 184
    :try_start_ae
    const-string v1, "RKMcp"

    const-string v2, "announcements"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b5
    .catchall {:try_start_ae .. :try_end_b5} :catchall_b9

    .line 185
    :cond_b5
    :goto_b5
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 186
    return-object v0

    .line 185
    :catchall_b9
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw p1
.end method

.method private static arrayOf(Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 2

    .line 259
    if-eqz p0, :cond_13

    :try_start_2
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_13

    :cond_d
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    goto :goto_18

    :cond_13
    :goto_13
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_18} :catch_19

    :goto_18
    return-object v0

    :catch_19
    move-exception p0

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0
.end method

.method static dayKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 222
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 223
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 224
    const-string v1, "\\d{8}"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x6

    const/4 v3, 0x0

    const-string v4, "-"

    if-eqz v1, :cond_3f

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x4

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 225
    :cond_3f
    const-string v1, "\\d{4}-\\d{2}-\\d{2}.*"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4e

    const/16 v0, 0xa

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 226
    :cond_4e
    const-string v1, "\\d{2}\\.\\d{2}\\.\\d{4}"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_83

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 227
    :cond_83
    const-string v1, "\\d{9,13}"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_98

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lrk/mcp/DiaryDb;->millis(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 228
    :cond_98
    return-object v0
.end method

.method static declared-synchronized days(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lrk/mcp/DiaryDb$Day;",
            ">;"
        }
    .end annotation

    const-class v0, Lrk/mcp/DiaryDb;

    monitor-enter v0

    .line 95
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 96
    if-eqz p1, :cond_1f

    sget-object v3, Lrk/mcp/DiaryDb;->cachedFor:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    sget-wide v3, Lrk/mcp/DiaryDb;->cachedAt:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x1388

    cmp-long v7, v3, v5

    if-gez v7, :cond_1f

    sget-object p0, Lrk/mcp/DiaryDb;->cached:Ljava/util/Map;
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_a8

    monitor-exit v0

    return-object p0

    .line 97
    :cond_1f
    :try_start_1f
    new-instance v3, Ljava/util/TreeMap;

    invoke-direct {v3}, Ljava/util/TreeMap;-><init>()V

    .line 98
    invoke-static {p0}, Lrk/mcp/DiaryDb;->open(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0
    :try_end_28
    .catchall {:try_start_1f .. :try_end_28} :catchall_a8

    .line 99
    if-eqz p0, :cond_a0

    .line 100
    :try_start_2a
    const-string v4, "SELECT dayDate, dayName, alert, holidayName, diaryLessons FROM diary WHERE studentId = ?"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_34
    .catchall {:try_start_2a .. :try_end_34} :catchall_8f

    .line 101
    :goto_34
    :try_start_34
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_7d

    .line 102
    const/4 v5, 0x0

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lrk/mcp/DiaryDb;->dayKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 103
    if-nez v5, :cond_46

    goto :goto_34

    .line 104
    :cond_46
    new-instance v6, Lrk/mcp/DiaryDb$Day;

    invoke-direct {v6}, Lrk/mcp/DiaryDb$Day;-><init>()V

    .line 105
    iput-object v5, v6, Lrk/mcp/DiaryDb$Day;->key:Ljava/lang/String;

    .line 106
    const/4 v7, 0x1

    invoke-static {v4, v7}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lrk/mcp/DiaryDb$Day;->name:Ljava/lang/String;

    const/4 v7, 0x2

    invoke-static {v4, v7}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lrk/mcp/DiaryDb$Day;->alert:Ljava/lang/String;

    const/4 v7, 0x3

    invoke-static {v4, v7}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lrk/mcp/DiaryDb$Day;->holiday:Ljava/lang/String;

    .line 107
    iget-object v7, v6, Lrk/mcp/DiaryDb$Day;->lessons:Ljava/util/List;

    const/4 v8, 0x4

    invoke-interface {v4, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_6e

    const-string v8, ""

    goto :goto_72

    :cond_6e
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_72
    invoke-static {v8}, Lrk/mcp/DiaryDb;->parseLessons(Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 108
    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7c
    .catchall {:try_start_34 .. :try_end_7c} :catchall_83

    .line 109
    goto :goto_34

    .line 110
    :cond_7d
    if-eqz v4, :cond_97

    :try_start_7f
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_82
    .catchall {:try_start_7f .. :try_end_82} :catchall_8f

    goto :goto_97

    .line 100
    :catchall_83
    move-exception v5

    if-eqz v4, :cond_8e

    :try_start_86
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_89
    .catchall {:try_start_86 .. :try_end_89} :catchall_8a

    goto :goto_8e

    :catchall_8a
    move-exception v4

    :try_start_8b
    invoke-virtual {v5, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8e
    :goto_8e
    throw v5
    :try_end_8f
    .catchall {:try_start_8b .. :try_end_8f} :catchall_8f

    .line 110
    :catchall_8f
    move-exception v4

    .line 111
    :try_start_90
    const-string v5, "RKMcp"

    const-string v6, "diary"

    invoke-static {v5, v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_97
    .catchall {:try_start_90 .. :try_end_97} :catchall_9b

    .line 112
    :cond_97
    :goto_97
    :try_start_97
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_a0

    :catchall_9b
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw p1

    .line 114
    :cond_a0
    :goto_a0
    sput-object v3, Lrk/mcp/DiaryDb;->cached:Ljava/util/Map;

    sput-object p1, Lrk/mcp/DiaryDb;->cachedFor:Ljava/lang/String;

    sput-wide v1, Lrk/mcp/DiaryDb;->cachedAt:J
    :try_end_a6
    .catchall {:try_start_97 .. :try_end_a6} :catchall_a8

    .line 115
    monitor-exit v0

    return-object v3

    .line 94
    :catchall_a8
    move-exception p0

    :try_start_a9
    monitor-exit v0
    :try_end_aa
    .catchall {:try_start_a9 .. :try_end_aa} :catchall_a8

    throw p0
.end method

.method static finalGrades(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5

    .line 160
    invoke-static {p0}, Lrk/mcp/DiaryDb;->open(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 161
    const/4 v0, 0x0

    if-nez p0, :cond_8

    return-object v0

    .line 162
    :cond_8
    :try_start_8
    const-string v1, "SELECT subjects FROM finalGrades WHERE studentId = ?"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_59

    .line 163
    :try_start_12
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_44

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v2

    if-eqz v2, :cond_20

    goto :goto_44

    .line 164
    :cond_20
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 165
    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_36

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    goto :goto_3b

    :cond_36
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_3b
    .catchall {:try_start_12 .. :try_end_3b} :catchall_4d

    .line 166
    :goto_3b
    if-eqz p1, :cond_40

    :try_start_3d
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_59

    .line 169
    :cond_40
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 165
    return-object v2

    .line 166
    :cond_44
    :goto_44
    if-eqz p1, :cond_49

    :try_start_46
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_49
    .catchall {:try_start_46 .. :try_end_49} :catchall_59

    .line 169
    :cond_49
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 163
    return-object v0

    .line 162
    :catchall_4d
    move-exception v1

    if-eqz p1, :cond_58

    :try_start_50
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_53
    .catchall {:try_start_50 .. :try_end_53} :catchall_54

    goto :goto_58

    :catchall_54
    move-exception p1

    :try_start_55
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_58
    :goto_58
    throw v1
    :try_end_59
    .catchall {:try_start_55 .. :try_end_59} :catchall_59

    .line 166
    :catchall_59
    move-exception p1

    .line 167
    :try_start_5a
    const-string v1, "RKMcp"

    const-string v2, "final grades"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_61
    .catchall {:try_start_5a .. :try_end_61} :catchall_66

    .line 168
    nop

    .line 169
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 168
    return-object v0

    .line 169
    :catchall_66
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw p1
.end method

.method static grades(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 122
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 123
    invoke-static {p0}, Lrk/mcp/DiaryDb;->open(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 124
    if-nez p0, :cond_c

    return-object v0

    .line 125
    :cond_c
    :try_start_c
    const-string v1, "SELECT name, periodDays, average, marks FROM lessonMarks WHERE studentId = ? ORDER BY name"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_16
    .catchall {:try_start_c .. :try_end_16} :catchall_90

    .line 126
    :goto_16
    :try_start_16
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_7e

    .line 127
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "subject"

    const/4 v3, 0x0

    invoke-static {p1, v3}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "period_days"

    const/4 v3, 0x1

    invoke-static {p1, v3}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 128
    const/4 v2, 0x2

    invoke-static {p1, v2}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4b

    const-string v3, "average"

    invoke-static {p1, v2}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 129
    :cond_4b
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 130
    const/4 v3, 0x3

    invoke-static {p1, v3}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lrk/mcp/DiaryDb;->arrayOf(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-static {v3}, Lrk/mcp/DiaryDb;->parseMarks(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_61
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_75

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lrk/mcp/DiaryDb$Mark;

    invoke-virtual {v4}, Lrk/mcp/DiaryDb$Mark;->json()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_61

    .line 131
    :cond_75
    const-string v3, "marks"

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 132
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_7d
    .catchall {:try_start_16 .. :try_end_7d} :catchall_84

    .line 133
    goto :goto_16

    .line 134
    :cond_7e
    if-eqz p1, :cond_98

    :try_start_80
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_83
    .catchall {:try_start_80 .. :try_end_83} :catchall_90

    goto :goto_98

    .line 125
    :catchall_84
    move-exception v1

    if-eqz p1, :cond_8f

    :try_start_87
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_8a
    .catchall {:try_start_87 .. :try_end_8a} :catchall_8b

    goto :goto_8f

    :catchall_8b
    move-exception p1

    :try_start_8c
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8f
    :goto_8f
    throw v1
    :try_end_90
    .catchall {:try_start_8c .. :try_end_90} :catchall_90

    .line 134
    :catchall_90
    move-exception p1

    .line 135
    :try_start_91
    const-string v1, "RKMcp"

    const-string v2, "grades"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_98
    .catchall {:try_start_91 .. :try_end_98} :catchall_9c

    .line 136
    :cond_98
    :goto_98
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 137
    return-object v0

    .line 136
    :catchall_9c
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw p1
.end method

.method static messages(Landroid/content/Context;Ljava/lang/String;I)Lorg/json/JSONArray;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 190
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 191
    invoke-static {p0}, Lrk/mcp/DiaryDb;->open(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 192
    if-nez p0, :cond_c

    return-object v0

    .line 193
    :cond_c
    if-eqz p1, :cond_18

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_15

    goto :goto_18

    :cond_15
    const-string v1, " WHERE messageFolderType = ?"

    goto :goto_1a

    :cond_18
    :goto_18
    const-string v1, ""

    .line 194
    :goto_1a
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p1, :cond_2a

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_25

    goto :goto_2a

    :cond_25
    new-array v4, v3, [Ljava/lang/String;

    aput-object p1, v4, v2

    goto :goto_2b

    :cond_2a
    :goto_2a
    const/4 v4, 0x0

    .line 195
    :goto_2b
    :try_start_2b
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SELECT subject, text, shortText, date, isRead, messageFolderType, firstName, lastName, middleName FROM message"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " ORDER BY date DESC LIMIT "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_4c
    .catchall {:try_start_2b .. :try_end_4c} :catchall_e2

    .line 196
    :goto_4c
    :try_start_4c
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p2

    if-eqz p2, :cond_d0

    .line 197
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "subject"

    invoke-static {p1, v2}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v1, "text"

    invoke-static {p1, v3}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_73

    const/4 v4, 0x2

    invoke-static {p1, v4}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    goto :goto_77

    :cond_73
    invoke-static {p1, v3}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    :goto_77
    invoke-static {v4}, Lrk/mcp/DiaryDb;->plain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    .line 198
    const/4 v1, 0x3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-nez v4, :cond_97

    const-string v4, "date"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Lrk/mcp/DiaryDb;->millis(J)J

    move-result-wide v5

    invoke-static {v5, v6}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 199
    :cond_97
    const-string v1, "read"

    const/4 v4, 0x4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    if-eqz v4, :cond_a2

    const/4 v4, 0x1

    goto :goto_a3

    :cond_a2
    const/4 v4, 0x0

    :goto_a3
    invoke-virtual {p2, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    const-string v4, "folder"

    const/4 v5, 0x5

    invoke-static {p1, v5}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v4, "from"

    const/4 v5, 0x7

    invoke-static {p1, v5}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x6

    invoke-static {p1, v6}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x8

    invoke-static {p1, v7}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lrk/mcp/DiaryDb;->person(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 200
    invoke-virtual {v0, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_ce
    .catchall {:try_start_4c .. :try_end_ce} :catchall_d6

    .line 201
    goto/16 :goto_4c

    .line 202
    :cond_d0
    if-eqz p1, :cond_ea

    :try_start_d2
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_d5
    .catchall {:try_start_d2 .. :try_end_d5} :catchall_e2

    goto :goto_ea

    .line 195
    :catchall_d6
    move-exception p2

    if-eqz p1, :cond_e1

    :try_start_d9
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_dc
    .catchall {:try_start_d9 .. :try_end_dc} :catchall_dd

    goto :goto_e1

    :catchall_dd
    move-exception p1

    :try_start_de
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_e1
    :goto_e1
    throw p2
    :try_end_e2
    .catchall {:try_start_de .. :try_end_e2} :catchall_e2

    .line 202
    :catchall_e2
    move-exception p1

    .line 203
    :try_start_e3
    const-string p2, "RKMcp"

    const-string v1, "messages"

    invoke-static {p2, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_ea
    .catchall {:try_start_e3 .. :try_end_ea} :catchall_ee

    .line 204
    :cond_ea
    :goto_ea
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 205
    return-object v0

    .line 204
    :catchall_ee
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw p1
.end method

.method private static millis(J)J
    .registers 5

    .line 231
    const-wide v0, 0x174876e800L

    cmp-long v2, p0, v0

    if-gez v2, :cond_d

    const-wide/16 v0, 0x3e8

    mul-long p0, p0, v0

    :cond_d
    return-wide p0
.end method

.method private static open(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;
    .registers 4

    .line 63
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "el_jur_db"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 64
    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_1b

    .line 65
    :cond_10
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x11

    invoke-static {p0, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_1c

    return-object p0

    .line 64
    :cond_1b
    :goto_1b
    return-object v0

    .line 66
    :catchall_1c
    move-exception p0

    .line 67
    const-string v1, "RKMcp"

    const-string v2, "The app\'s database cannot be opened"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 68
    return-object v0
.end method

.method static parseDate(Ljava/lang/Object;)J
    .registers 10

    .line 235
    const-wide/16 v0, -0x1

    if-nez p0, :cond_5

    return-wide v0

    .line 236
    :cond_5
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_14

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Lrk/mcp/DiaryDb;->millis(J)J

    move-result-wide v0

    return-wide v0

    .line 237
    :cond_14
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const/16 v2, 0x202f

    const/16 v3, 0x20

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const/16 v2, 0xa0

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 238
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_31

    return-wide v0

    .line 239
    :cond_31
    const-string v2, "\\d{9,13}"

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_42

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lrk/mcp/DiaryDb;->millis(J)J

    move-result-wide v0

    return-wide v0

    .line 240
    :cond_42
    const/4 v2, 0x7

    new-array v3, v2, [Ljava/text/DateFormat;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 241
    const/4 v5, 0x2

    invoke-static {v5, v5, v4}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v4

    const/4 v6, 0x0

    aput-object v4, v3, v6

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v7, "MMM d, yyyy h:mm:ss a"

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v7, 0x1

    aput-object v4, v3, v7

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v7, "MMM d, yyyy, h:mm:ss a"

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v4, v3, v5

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy-MM-dd\'T\'HH:mm:ss"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v5, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v5, 0x3

    aput-object v4, v3, v5

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy-MM-dd HH:mm:ss"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v5, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v5, 0x4

    aput-object v4, v3, v5

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy-MM-dd HH:mm"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v5, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v5, 0x5

    aput-object v4, v3, v5

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "dd.MM.yyyy HH:mm"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v5, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v5, 0x6

    aput-object v4, v3, v5

    .line 249
    nop

    :goto_97
    if-ge v6, v2, :cond_ab

    aget-object v4, v3, v6

    .line 251
    :try_start_9b
    invoke-virtual {v4, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    .line 252
    if-eqz v4, :cond_a7

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_9b .. :try_end_a5} :catch_a6

    return-wide v0

    .line 253
    :catch_a6
    move-exception v4

    :cond_a7
    nop

    .line 249
    add-int/lit8 v6, v6, 0x1

    goto :goto_97

    .line 255
    :cond_ab
    return-wide v0
.end method

.method static parseLessons(Ljava/lang/String;)Ljava/util/List;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lrk/mcp/DiaryDb$Lesson;",
            ">;"
        }
    .end annotation

    .line 287
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 288
    invoke-static {p0}, Lrk/mcp/DiaryDb;->arrayOf(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 289
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_b
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_ae

    .line 290
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 291
    if-nez v3, :cond_19

    goto/16 :goto_aa

    .line 292
    :cond_19
    new-instance v4, Lrk/mcp/DiaryDb$Lesson;

    invoke-direct {v4}, Lrk/mcp/DiaryDb$Lesson;-><init>()V

    .line 293
    const-string v5, "name"

    invoke-static {v3, v5}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lrk/mcp/DiaryDb$Lesson;->title:Ljava/lang/String;

    .line 294
    const-string v5, "num"

    invoke-static {v3, v5}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lrk/mcp/DiaryDb$Lesson;->number:Ljava/lang/String;

    .line 295
    const-string v5, "topic"

    invoke-static {v3, v5}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lrk/mcp/DiaryDb$Lesson;->topic:Ljava/lang/String;

    .line 296
    const-string v5, "startTime"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lrk/mcp/DiaryDb;->parseDate(Ljava/lang/Object;)J

    move-result-wide v5

    const-string v7, "endTime"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lrk/mcp/DiaryDb;->parseDate(Ljava/lang/Object;)J

    move-result-wide v7

    .line 297
    const-wide/16 v9, 0x0

    cmp-long v11, v5, v9

    if-ltz v11, :cond_5b

    new-instance v11, Ljava/util/Date;

    invoke-direct {v11, v5, v6}, Ljava/util/Date;-><init>(J)V

    invoke-static {v11}, Lrk/schedule/ScheduleResolver;->minute(Ljava/util/Date;)I

    move-result v5

    iput v5, v4, Lrk/mcp/DiaryDb$Lesson;->start:I

    .line 298
    :cond_5b
    cmp-long v5, v7, v9

    if-ltz v5, :cond_6a

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-static {v5}, Lrk/schedule/ScheduleResolver;->minute(Ljava/util/Date;)I

    move-result v5

    iput v5, v4, Lrk/mcp/DiaryDb$Lesson;->end:I

    .line 299
    :cond_6a
    const-string v5, "homework"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 300
    if-eqz v5, :cond_96

    const/4 v6, 0x0

    :goto_73
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_96

    .line 301
    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 302
    if-nez v7, :cond_82

    const-string v7, ""

    goto :goto_88

    :cond_82
    const-string v8, "value"

    invoke-static {v7, v8}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 303
    :goto_88
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_93

    iget-object v8, v4, Lrk/mcp/DiaryDb$Lesson;->homework:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    :cond_93
    add-int/lit8 v6, v6, 0x1

    goto :goto_73

    .line 305
    :cond_96
    const-string v5, "marks"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 306
    if-eqz v3, :cond_a7

    iget-object v5, v4, Lrk/mcp/DiaryDb$Lesson;->marks:Ljava/util/List;

    invoke-static {v3}, Lrk/mcp/DiaryDb;->parseMarks(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v5, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 307
    :cond_a7
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 289
    :goto_aa
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_b

    .line 309
    :cond_ae
    return-object v0
.end method

.method static parseMarks(Lorg/json/JSONArray;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Lrk/mcp/DiaryDb$Mark;",
            ">;"
        }
    .end annotation

    .line 268
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 269
    const/4 v1, 0x0

    :goto_6
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_5b

    .line 270
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 271
    if-nez v2, :cond_13

    goto :goto_58

    .line 272
    :cond_13
    new-instance v3, Lrk/mcp/DiaryDb$Mark;

    invoke-direct {v3}, Lrk/mcp/DiaryDb$Mark;-><init>()V

    .line 273
    const-string v4, "value"

    invoke-static {v2, v4}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->value:Ljava/lang/String;

    .line 274
    iget-object v4, v3, Lrk/mcp/DiaryDb$Mark;->value:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_29

    goto :goto_58

    .line 275
    :cond_29
    const-string v4, "comment"

    invoke-static {v2, v4}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->comment:Ljava/lang/String;

    .line 276
    const-string v4, "weight"

    invoke-static {v2, v4}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->weight:Ljava/lang/String;

    .line 277
    const-string v4, "title"

    invoke-static {v2, v4}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->kind:Ljava/lang/String;

    .line 278
    const-string v4, "lessonComment"

    invoke-static {v2, v4}, Lrk/mcp/DiaryDb;->text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lrk/mcp/DiaryDb$Mark;->lessonComment:Ljava/lang/String;

    .line 279
    const-string v4, "date"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lrk/mcp/DiaryDb;->parseDate(Ljava/lang/Object;)J

    move-result-wide v4

    iput-wide v4, v3, Lrk/mcp/DiaryDb$Mark;->date:J

    .line 280
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    :goto_58
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 282
    :cond_5b
    return-object v0
.end method

.method static periods(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 142
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 143
    invoke-static {p0}, Lrk/mcp/DiaryDb;->open(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 144
    if-nez p0, :cond_c

    return-object v0

    .line 145
    :cond_c
    :try_start_c
    const-string v1, "SELECT name, fullName, start, end FROM period WHERE studentId = ? ORDER BY start"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_16
    .catchall {:try_start_c .. :try_end_16} :catchall_7d

    .line 146
    :goto_16
    :try_start_16
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_6b

    .line 147
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "name"

    const/4 v3, 0x0

    invoke-static {p1, v3}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "title"

    const/4 v3, 0x1

    invoke-static {p1, v3}, Lrk/mcp/DiaryDb;->str(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 148
    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-nez v3, :cond_4f

    const-string v3, "from"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Lrk/mcp/DiaryDb;->millis(J)J

    move-result-wide v4

    invoke-static {v4, v5}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 149
    :cond_4f
    const/4 v2, 0x3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-nez v3, :cond_67

    const-string v3, "to"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Lrk/mcp/DiaryDb;->millis(J)J

    move-result-wide v4

    invoke-static {v4, v5}, Lrk/schedule/ScheduleResolver;->key(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 150
    :cond_67
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_6a
    .catchall {:try_start_16 .. :try_end_6a} :catchall_71

    .line 151
    goto :goto_16

    .line 152
    :cond_6b
    if-eqz p1, :cond_85

    :try_start_6d
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_70
    .catchall {:try_start_6d .. :try_end_70} :catchall_7d

    goto :goto_85

    .line 145
    :catchall_71
    move-exception v1

    if-eqz p1, :cond_7c

    :try_start_74
    invoke-interface {p1}, Landroid/database/Cursor;->close()V
    :try_end_77
    .catchall {:try_start_74 .. :try_end_77} :catchall_78

    goto :goto_7c

    :catchall_78
    move-exception p1

    :try_start_79
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7c
    :goto_7c
    throw v1
    :try_end_7d
    .catchall {:try_start_79 .. :try_end_7d} :catchall_7d

    .line 152
    :catchall_7d
    move-exception p1

    .line 153
    :try_start_7e
    const-string v1, "RKMcp"

    const-string v2, "periods"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_85
    .catchall {:try_start_7e .. :try_end_85} :catchall_89

    .line 154
    :cond_85
    :goto_85
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 155
    return-object v0

    .line 154
    :catchall_89
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw p1
.end method

.method private static person(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string p1, "\\s+"

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static plain(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 212
    const-string v0, "(?i)<br\\s*/?>|</p>|</div>|</li>"

    const-string v1, "\n"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "<[^>]+>"

    const-string v2, ""

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 213
    const-string v0, "&nbsp;"

    const-string v2, " "

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&amp;"

    const-string v3, "&"

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&lt;"

    const-string v3, "<"

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&gt;"

    const-string v3, ">"

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&quot;"

    const-string v3, "\""

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "&#39;"

    const-string v3, "\'"

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 214
    const-string v0, "[ \\t]+"

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\n\\s*\\n+"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 215
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x5dc

    if-le v0, v1, :cond_70

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\u2026"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_70
    return-object p0
.end method

.method private static str(Landroid/database/Cursor;I)Ljava/lang/String;
    .registers 3

    .line 118
    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string p0, ""

    goto :goto_d

    :cond_9
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_d
    return-object p0
.end method

.method static students(Landroid/content/Context;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lrk/mcp/DiaryDb$Student;",
            ">;"
        }
    .end annotation

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    invoke-static {p0}, Lrk/mcp/DiaryDb;->open(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 75
    if-nez p0, :cond_c

    return-object v0

    .line 76
    :cond_c
    :try_start_c
    const-string v1, "SELECT id, fullName FROM student"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_13
    .catchall {:try_start_c .. :try_end_13} :catchall_4b

    .line 77
    :goto_13
    :try_start_13
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 78
    new-instance v2, Lrk/mcp/DiaryDb$Student;

    invoke-direct {v2}, Lrk/mcp/DiaryDb$Student;-><init>()V

    .line 79
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lrk/mcp/DiaryDb$Student;->id:Ljava/lang/String;

    .line 80
    const/4 v3, 0x1

    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_2f

    const-string v3, ""

    goto :goto_33

    :cond_2f
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_33
    iput-object v3, v2, Lrk/mcp/DiaryDb$Student;->name:Ljava/lang/String;

    .line 81
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_38
    .catchall {:try_start_13 .. :try_end_38} :catchall_3f

    .line 82
    goto :goto_13

    .line 83
    :cond_39
    if-eqz v1, :cond_53

    :try_start_3b
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_3e
    .catchall {:try_start_3b .. :try_end_3e} :catchall_4b

    goto :goto_53

    .line 76
    :catchall_3f
    move-exception v2

    if-eqz v1, :cond_4a

    :try_start_42
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_46

    goto :goto_4a

    :catchall_46
    move-exception v1

    :try_start_47
    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4a
    :goto_4a
    throw v2
    :try_end_4b
    .catchall {:try_start_47 .. :try_end_4b} :catchall_4b

    .line 83
    :catchall_4b
    move-exception v1

    .line 84
    :try_start_4c
    const-string v2, "RKMcp"

    const-string v3, "students"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_53
    .catchall {:try_start_4c .. :try_end_53} :catchall_57

    .line 85
    :cond_53
    :goto_53
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 86
    return-object v0

    .line 85
    :catchall_57
    move-exception v0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw v0
.end method

.method private static text(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 263
    if-eqz p0, :cond_16

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_16

    .line 264
    :cond_9
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 263
    :cond_16
    :goto_16
    const-string p0, ""

    return-object p0
.end method
