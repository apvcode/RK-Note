.class public final Lrk/schedule/ScheduleResolver;
.super Ljava/lang/Object;
.source "ScheduleResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrk/schedule/ScheduleResolver$Event;,
        Lrk/schedule/ScheduleResolver$Homeroom;
    }
.end annotation


# static fields
.field public static final SLOTS:I = 0x8


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clock(I)Ljava/lang/String;
    .registers 5

    .line 29
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-int/lit8 v1, p0, 0x3c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    rem-int/lit8 p0, p0, 0x3c

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v1, 0x1

    aput-object p0, v2, v1

    const-string p0, "%02d:%02d"

    invoke-static {v0, p0, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static countdown(JZ)Ljava/lang/String;
    .registers 9

    .line 32
    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    const-wide/32 v0, 0xea60

    div-long v0, p0, v0

    .line 33
    const-string v2, " \u043c\u0438\u043d"

    const-wide/16 v3, 0x3c

    cmp-long v5, v0, v3

    if-ltz v5, :cond_32

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    div-long p1, v0, v3

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " \u0447 "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    rem-long/2addr v0, v3

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 34
    :cond_32
    if-eqz p2, :cond_54

    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-long v0, p0, v3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    rem-long/2addr p0, v3

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object v0, p1, v1

    const/4 v0, 0x1

    aput-object p0, p1, v0

    const-string p0, "%02d:%02d"

    invoke-static {p2, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 35
    :cond_54
    const-wide/16 p0, 0x1

    cmp-long p2, v0, p0

    if-gez p2, :cond_5d

    const-string p0, "< 1 \u043c\u0438\u043d"

    goto :goto_6e

    :cond_5d
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_6e
    return-object p0
.end method

.method public static date(Ljava/lang/String;)J
    .registers 5

    .line 38
    const-string v0, "[0-9]{4}-[0-9]{2}-[0-9]{2}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_36

    const-string v0, "-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setLenient(Z)V

    aget-object v1, p0, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    aget-object v3, p0, v2

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    sub-int/2addr v3, v2

    const/4 v2, 0x2

    aget-object p0, p0, v2

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-virtual {v0, v1, v3, p0}, Ljava/util/Calendar;->set(III)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    return-wide v0

    :cond_36
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041d\u0435\u0432\u0435\u0440\u043d\u0430\u044f \u0434\u0430\u0442\u0430"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static instant(JI)J
    .registers 5

    .line 41
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/16 p0, 0xb

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xd

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    const/16 v1, 0xe

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {v0, p0, p2}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static key(J)Ljava/lang/String;
    .registers 8

    .line 37
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/2addr v3, p1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    aput-object v3, v4, p1

    aput-object v0, v4, v2

    const-string p1, "%04d-%02d-%02d"

    invoke-static {p0, p1, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$resolve$0(Lrk/schedule/ScheduleResolver$Event;Lrk/schedule/ScheduleResolver$Event;)I
    .registers 2

    .line 59
    iget p0, p0, Lrk/schedule/ScheduleResolver$Event;->start:I

    iget p1, p1, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$resolve$1(Lrk/schedule/ScheduleResolver$Event;Lrk/schedule/ScheduleResolver$Event;)I
    .registers 2

    .line 75
    iget p0, p0, Lrk/schedule/ScheduleResolver$Event;->start:I

    iget p1, p1, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method public static minute(Ljava/util/Date;)I
    .registers 3

    .line 40
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/16 p0, 0xb

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    mul-int/lit8 p0, p0, 0x3c

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    add-int/2addr p0, v0

    return p0
.end method

.method public static number(Ljava/lang/String;)I
    .registers 1

    .line 42
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4} :catch_5

    return p0

    :catch_5
    move-exception p0

    const/4 p0, -0x1

    return p0
.end method

.method public static parse(Ljava/lang/String;)I
    .registers 4

    .line 25
    const/4 v0, -0x1

    if-eqz p0, :cond_35

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "[0-9]{1,2}:[0-9]{2}"

    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_35

    .line 26
    :cond_10
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v1, ":"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    aget-object v1, p0, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    aget-object p0, p0, v2

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    .line 27
    const/16 v2, 0x18

    if-ge v1, v2, :cond_34

    const/16 v2, 0x3c

    if-ge p0, v2, :cond_34

    mul-int/lit8 v1, v1, 0x3c

    add-int v0, v1, p0

    :cond_34
    return v0

    .line 25
    :cond_35
    :goto_35
    return v0
.end method

.method public static resolve(Ljava/util/List;[[ILjava/lang/String;Lrk/schedule/ScheduleResolver$Homeroom;I)Ljava/util/List;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;[[I",
            "Ljava/lang/String;",
            "Lrk/schedule/ScheduleResolver$Homeroom;",
            "I)",
            "Ljava/util/List<",
            "Lrk/schedule/ScheduleResolver$Event;",
            ">;"
        }
    .end annotation

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_44

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrk/schedule/ScheduleResolver$Event;

    .line 56
    iget-object v3, v1, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-static {v3}, Lrk/schedule/ScheduleResolver;->number(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    .line 57
    if-eqz p1, :cond_38

    if-ltz v3, :cond_38

    array-length v5, p1

    if-ge v3, v5, :cond_38

    aget-object v5, p1, v3

    aget v5, v5, v2

    if-ltz v5, :cond_38

    aget-object v5, p1, v3

    aget v2, v5, v2

    aget-object v3, p1, v3

    aget v3, v3, v4

    invoke-virtual {v1, v2, v3, p2}, Lrk/schedule/ScheduleResolver$Event;->at(IILjava/lang/String;)Lrk/schedule/ScheduleResolver$Event;

    move-result-object v1

    goto :goto_40

    :cond_38
    iget v2, v1, Lrk/schedule/ScheduleResolver$Event;->start:I

    if-ltz v2, :cond_43

    iget v2, v1, Lrk/schedule/ScheduleResolver$Event;->end:I

    if-ltz v2, :cond_43

    :goto_40
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    :cond_43
    goto :goto_9

    .line 59
    :cond_44
    new-instance p0, Lrk/schedule/ScheduleResolver$$ExternalSyntheticLambda0;

    invoke-direct {p0}, Lrk/schedule/ScheduleResolver$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 60
    const/16 p0, 0x5a0

    const/4 p1, -0x1

    if-eqz p3, :cond_13c

    .line 61
    iget v1, p3, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    if-ltz v1, :cond_134

    iget v1, p3, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    iget v3, p3, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    if-le v1, v3, :cond_134

    iget v1, p3, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    if-ge v1, p0, :cond_134

    .line 62
    iget-object v1, p3, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    const-string v3, "separate"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v3, "insert"

    const-string v4, "replace"

    if-nez v1, :cond_86

    iget-object v1, p3, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_86

    iget-object v1, p3, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7e

    goto :goto_86

    :cond_7e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 \u0440\u0435\u0436\u0438\u043c \u043a\u043b\u0430\u0441\u0441\u043d\u043e\u0433\u043e \u0447\u0430\u0441\u0430"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 63
    :cond_86
    :goto_86
    const/4 v1, -0x1

    :goto_87
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_a1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lrk/schedule/ScheduleResolver$Event;

    iget-object v5, v5, Lrk/schedule/ScheduleResolver$Event;->number:Ljava/lang/String;

    invoke-static {v5}, Lrk/schedule/ScheduleResolver;->number(Ljava/lang/String;)I

    move-result v5

    iget v6, p3, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    if-ne v5, v6, :cond_9e

    move v1, v2

    :cond_9e
    add-int/lit8 v2, v2, 0x1

    goto :goto_87

    .line 64
    :cond_a1
    iget v2, p3, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    iget v5, p3, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    .line 65
    iget-object v6, p3, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ce

    .line 66
    if-ltz v1, :cond_b3

    .line 67
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_123

    .line 66
    :cond_b3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u0414\u043b\u044f \u0437\u0430\u043c\u0435\u043d\u044b \u043d\u0435\u0442 \u0443\u0440\u043e\u043a\u0430 \u2116"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p2, p3, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 68
    :cond_ce
    iget-object v4, p3, Lrk/schedule/ScheduleResolver$Homeroom;->mode:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_123

    .line 69
    if-ltz v1, :cond_108

    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrk/schedule/ScheduleResolver$Event;

    iget v2, v2, Lrk/schedule/ScheduleResolver$Event;->start:I

    iget v3, p3, Lrk/schedule/ScheduleResolver$Homeroom;->end:I

    add-int/2addr v3, v2

    iget p3, p3, Lrk/schedule/ScheduleResolver$Homeroom;->start:I

    sub-int v5, v3, p3

    .line 71
    nop

    :goto_e8
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p3

    if-ge v1, p3, :cond_106

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lrk/schedule/ScheduleResolver$Event;

    iget v3, p3, Lrk/schedule/ScheduleResolver$Event;->start:I

    add-int/2addr v3, v5

    sub-int/2addr v3, v2

    iget v4, p3, Lrk/schedule/ScheduleResolver$Event;->end:I

    add-int/2addr v4, v5

    sub-int/2addr v4, v2

    invoke-virtual {p3, v3, v4, p2}, Lrk/schedule/ScheduleResolver$Event;->at(IILjava/lang/String;)Lrk/schedule/ScheduleResolver$Event;

    move-result-object p3

    invoke-interface {v0, v1, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_e8

    :cond_106
    move v4, v2

    goto :goto_124

    .line 69
    :cond_108
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u0414\u043b\u044f \u0432\u0441\u0442\u0430\u0432\u043a\u0438 \u043d\u0435\u0442 \u0443\u0440\u043e\u043a\u0430 \u2116"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p2, p3, Lrk/schedule/ScheduleResolver$Homeroom;->lesson:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 73
    :cond_123
    :goto_123
    move v4, v2

    :goto_124
    new-instance v1, Lrk/schedule/ScheduleResolver$Event;

    const/4 v6, 0x1

    const/4 v7, 0x0

    const-string v2, "\u041a\u0427"

    const-string v3, "\u041a\u043b\u0430\u0441\u0441\u043d\u044b\u0439 \u0447\u0430\u0441"

    move-object v8, p2

    invoke-direct/range {v1 .. v8}, Lrk/schedule/ScheduleResolver$Event;-><init>(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13c

    .line 61
    :cond_134
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041a\u043b\u0430\u0441\u0441\u043d\u044b\u0439 \u0447\u0430\u0441: \u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 \u0438\u043d\u0442\u0435\u0440\u0432\u0430\u043b"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 75
    :cond_13c
    :goto_13c
    new-instance p2, Lrk/schedule/ScheduleResolver$$ExternalSyntheticLambda1;

    invoke-direct {p2}, Lrk/schedule/ScheduleResolver$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v0, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 76
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 77
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_14d
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1cf

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrk/schedule/ScheduleResolver$Event;

    .line 78
    iget v1, v0, Lrk/schedule/ScheduleResolver$Event;->start:I

    add-int/2addr v1, p4

    iget v2, v0, Lrk/schedule/ScheduleResolver$Event;->end:I

    add-int/2addr v2, p4

    iget-object v3, v0, Lrk/schedule/ScheduleResolver$Event;->source:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lrk/schedule/ScheduleResolver$Event;->at(IILjava/lang/String;)Lrk/schedule/ScheduleResolver$Event;

    move-result-object v0

    .line 79
    iget v1, v0, Lrk/schedule/ScheduleResolver$Event;->start:I

    if-ltz v1, :cond_1ae

    iget v1, v0, Lrk/schedule/ScheduleResolver$Event;->end:I

    if-ge v1, p0, :cond_1ae

    iget v1, v0, Lrk/schedule/ScheduleResolver$Event;->end:I

    iget v2, v0, Lrk/schedule/ScheduleResolver$Event;->start:I

    if-le v1, v2, :cond_1ae

    .line 80
    iget v1, v0, Lrk/schedule/ScheduleResolver$Event;->start:I

    if-lt v1, p1, :cond_17d

    .line 81
    iget p1, v0, Lrk/schedule/ScheduleResolver$Event;->end:I

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    goto :goto_14d

    .line 80
    :cond_17d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u041f\u0435\u0440\u0435\u0441\u0435\u0447\u0435\u043d\u0438\u0435: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, v0, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " ("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p2, v0, Lrk/schedule/ScheduleResolver$Event;->start:I

    invoke-static {p2}, Lrk/schedule/ScheduleResolver;->clock(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 79
    :cond_1ae
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u0421\u043e\u0431\u044b\u0442\u0438\u0435 \u00ab"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, v0, Lrk/schedule/ScheduleResolver$Event;->title:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\u00bb \u0432\u044b\u0445\u043e\u0434\u0438\u0442 \u0437\u0430 \u043f\u0440\u0435\u0434\u0435\u043b\u044b \u0434\u043d\u044f \u0438\u043b\u0438 \u0438\u043c\u0435\u0435\u0442 \u043d\u0435\u0432\u0435\u0440\u043d\u043e\u0435 \u0432\u0440\u0435\u043c\u044f"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 83
    :cond_1cf
    return-object p2
.end method

.method public static shiftFollowing([[III)V
    .registers 9

    .line 86
    array-length v0, p0

    const/4 v1, 0x2

    new-array v2, v1, [I

    const/4 v3, 0x1

    aput v1, v2, v3

    const/4 v1, 0x0

    aput v0, v2, v1

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    .line 87
    const/4 v2, 0x0

    :goto_13
    array-length v4, p0

    if-ge v2, v4, :cond_39

    aget-object v4, p0, v2

    invoke-virtual {v4}, [I->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    aput-object v4, v0, v2

    if-le v2, p1, :cond_36

    aget-object v4, v0, v2

    aget v4, v4, v1

    if-ltz v4, :cond_36

    aget-object v4, v0, v2

    aget v5, v4, v1

    add-int/2addr v5, p2

    aput v5, v4, v1

    aget-object v4, v0, v2

    aget v5, v4, v3

    add-int/2addr v5, p2

    aput v5, v4, v3

    :cond_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 88
    :cond_39
    invoke-static {v0}, Lrk/schedule/ScheduleResolver;->validateSlots([[I)V

    :goto_3c
    array-length p1, p0

    if-ge v1, p1, :cond_46

    aget-object p1, v0, v1

    aput-object p1, p0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_3c

    .line 89
    :cond_46
    return-void
.end method

.method public static validateSlots([[I)V
    .registers 10

    .line 44
    nop

    .line 45
    const/4 v0, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    :goto_5
    array-length v4, p0

    if-ge v2, v4, :cond_66

    .line 46
    aget-object v4, p0, v2

    aget v4, v4, v1

    aget-object v5, p0, v2

    const/4 v6, 0x1

    aget v5, v5, v6

    .line 47
    if-ne v4, v0, :cond_16

    if-ne v5, v0, :cond_16

    goto :goto_27

    .line 48
    :cond_16
    const-string v7, "\u0423\u0440\u043e\u043a "

    if-ltz v4, :cond_48

    if-ltz v5, :cond_48

    const/16 v8, 0x5a0

    if-ge v4, v8, :cond_48

    if-ge v5, v8, :cond_48

    if-le v5, v4, :cond_48

    .line 49
    if-lt v4, v3, :cond_2a

    .line 50
    move v3, v5

    .line 45
    :goto_27
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 49
    :cond_2a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/2addr v2, v6

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": \u043f\u0435\u0440\u0435\u0441\u0435\u0447\u0435\u043d\u0438\u0435 \u0441 \u043f\u0440\u0435\u0434\u044b\u0434\u0443\u0449\u0438\u043c \u0443\u0440\u043e\u043a\u043e\u043c"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 48
    :cond_48
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/2addr v2, v6

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": \u0443\u043a\u0430\u0436\u0438\u0442\u0435 \u043d\u0430\u0447\u0430\u043b\u043e \u0438 \u043a\u043e\u043d\u0435\u0446, \u043a\u043e\u043d\u0435\u0446 \u043f\u043e\u0437\u0436\u0435 \u043d\u0430\u0447\u0430\u043b\u0430"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 52
    :cond_66
    return-void
.end method

.method public static weekday(J)I
    .registers 3

    .line 39
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p0, 0x7

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result p0

    return p0
.end method
