.class public final Lrk/diary/PersonalHomeworkStore;
.super Ljava/lang/Object;
.source "PersonalHomeworkStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/diary/PersonalHomeworkStore$Id;
    }
.end annotation


# static fields
.field public static final PREFS:Ljava/lang/String; = "personal_homework_v2"


# instance fields
.field private final legacy:Landroid/content/SharedPreferences;

.field private final prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "personal_homework_v2"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lrk/diary/PersonalHomeworkStore;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "personal_homework"

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lrk/diary/PersonalHomeworkStore;->legacy:Landroid/content/SharedPreferences;

    return-void
.end method

.method private read()Lorg/json/JSONObject;
    .registers 5

    .line 20
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lrk/diary/PersonalHomeworkStore;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "document"

    const-string v3, "{}"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f} :catch_10

    return-object v0

    :catch_10
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c \u043b\u0438\u0447\u043d\u043e\u0435 \u0414\u0417. \u0414\u0430\u043d\u043d\u044b\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u044b"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private write(Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 36
    if-eqz p1, :cond_aa

    iget-object v0, p1, Lrk/diary/PersonalHomeworkStore$Id;->owner:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_aa

    iget-object v0, p1, Lrk/diary/PersonalHomeworkStore$Id;->lesson:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_aa

    .line 37
    iget-object v0, p0, Lrk/diary/PersonalHomeworkStore;->prefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    const-string v2, "document"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0}, Lrk/diary/PersonalHomeworkStore;->read()Lorg/json/JSONObject;

    move-result-object v1

    .line 38
    :try_start_1f
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v3
    :try_end_23
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_23} :catch_a3

    const-string v4, "note:"

    if-eqz v3, :cond_40

    :try_start_27
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Lrk/diary/PersonalHomeworkStore$Id;->key()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_58

    :cond_40
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lrk/diary/PersonalHomeworkStore$Id;->key()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :goto_58
    if-eqz p3, :cond_74

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "import:"

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1}, Lrk/diary/PersonalHomeworkStore$Id;->key()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_74
    .catch Lorg/json/JSONException; {:try_start_27 .. :try_end_74} :catch_a3

    .line 39
    :cond_74
    iget-object p1, p0, Lrk/diary/PersonalHomeworkStore;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p1

    if-nez p1, :cond_a2

    .line 40
    iget-object p1, p0, Lrk/diary/PersonalHomeworkStore;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    if-nez v0, :cond_94

    invoke-interface {p1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_97

    :cond_94
    invoke-interface {p1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :goto_97
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 41
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c. \u041f\u043e\u043f\u0440\u043e\u0431\u0443\u0439\u0442\u0435 \u0435\u0449\u0451 \u0440\u0430\u0437"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 43
    :cond_a2
    return-void

    .line 38
    :catch_a3
    move-exception p1

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    .line 36
    :cond_aa
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0443\u0447\u0435\u043d\u0438\u043a\u0430 \u0438 \u0443\u0440\u043e\u043a"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public archive()Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 22
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iget-object v1, p0, Lrk/diary/PersonalHomeworkStore;->legacy:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_13
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_43

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Ljava/lang/String;

    if-eqz v3, :cond_13

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_13

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13

    :cond_43
    return-object v0
.end method

.method public declared-synchronized destination(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;
    .registers 5

    monitor-enter p0

    .line 23
    :try_start_1
    invoke-direct {p0}, Lrk/diary/PersonalHomeworkStore;->read()Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "import:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, ""

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lrk/diary/PersonalHomeworkStore$Id;->parse(Ljava/lang/String;)Lrk/diary/PersonalHomeworkStore$Id;

    move-result-object p1
    :try_end_22
    .catchall {:try_start_1 .. :try_end_22} :catchall_24

    monitor-exit p0

    return-object p1

    .line 23
    :catchall_24
    move-exception p1

    :try_start_25
    monitor-exit p0
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_24

    throw p1
.end method

.method public declared-synchronized get(Lrk/diary/PersonalHomeworkStore$Id;)Ljava/lang/String;
    .registers 5

    monitor-enter p0

    .line 21
    if-nez p1, :cond_6

    :try_start_3
    const-string p1, ""

    goto :goto_27

    :cond_6
    invoke-direct {p0}, Lrk/diary/PersonalHomeworkStore;->read()Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "note:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lrk/diary/PersonalHomeworkStore$Id;->key()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, ""

    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_29

    :goto_27
    monitor-exit p0

    return-object p1

    .line 21
    :catchall_29
    move-exception p1

    :try_start_2a
    monitor-exit p0
    :try_end_2b
    .catchall {:try_start_2a .. :try_end_2b} :catchall_29

    throw p1
.end method

.method public declared-synchronized imported(Ljava/lang/String;)Z
    .registers 5

    monitor-enter p0

    .line 24
    :try_start_1
    invoke-direct {p0}, Lrk/diary/PersonalHomeworkStore;->read()Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "import:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_1e

    monitor-exit p0

    return p1

    .line 24
    :catchall_1e
    move-exception p1

    :try_start_1f
    monitor-exit p0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1e

    throw p1
.end method

.method public declared-synchronized save(Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;)V
    .registers 4

    monitor-enter p0

    .line 25
    const/4 v0, 0x0

    :try_start_2
    invoke-direct {p0, p1, p2, v0}, Lrk/diary/PersonalHomeworkStore;->write(Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_7

    monitor-exit p0

    return-void

    .line 25
    :catchall_7
    move-exception p1

    :try_start_8
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_8 .. :try_end_9} :catchall_7

    throw p1
.end method

.method public declared-synchronized transfer(Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 8

    monitor-enter p0

    .line 27
    :try_start_1
    invoke-virtual {p0}, Lrk/diary/PersonalHomeworkStore;->archive()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_95

    .line 28
    invoke-virtual {p0, p2}, Lrk/diary/PersonalHomeworkStore;->imported(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8d

    .line 29
    invoke-virtual {p0, p1}, Lrk/diary/PersonalHomeworkStore;->get(Lrk/diary/PersonalHomeworkStore$Id;)Ljava/lang/String;

    move-result-object v1

    if-nez p3, :cond_1a

    move-object p3, v1

    .line 30
    :cond_1a
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_28

    :cond_26
    if-eqz p4, :cond_85

    .line 32
    :cond_28
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-nez p4, :cond_61

    invoke-virtual {p3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_61

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_46

    const-string p3, ""

    goto :goto_59

    :cond_46
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    :goto_59
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 33
    :cond_61
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-eqz p4, :cond_68

    :goto_67
    goto :goto_80

    :cond_68
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p4, "\n\n"

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_67

    :goto_80
    invoke-direct {p0, p1, v0, p2}, Lrk/diary/PersonalHomeworkStore;->write(Lrk/diary/PersonalHomeworkStore$Id;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_83
    .catchall {:try_start_1 .. :try_end_83} :catchall_9d

    monitor-exit p0

    return-object v0

    .line 30
    :cond_85
    :try_start_85
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "\u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0434\u0438\u0442\u0435 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u0438\u0435 \u043a \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u044e\u0449\u0435\u043c\u0443 \u0414\u0417"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 28
    :cond_8d
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "\u042d\u0442\u0430 \u0437\u0430\u043f\u0438\u0441\u044c \u0443\u0436\u0435 \u043f\u0435\u0440\u0435\u043d\u0435\u0441\u0435\u043d\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 27
    :cond_95
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "\u0417\u0430\u043f\u0438\u0441\u044c \u0430\u0440\u0445\u0438\u0432\u0430 \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u043d\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 26
    :catchall_9d
    move-exception p1

    monitor-exit p0
    :try_end_9f
    .catchall {:try_start_85 .. :try_end_9f} :catchall_9d

    throw p1
.end method
