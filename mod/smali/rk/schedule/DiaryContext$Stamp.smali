.class public final Lrk/schedule/DiaryContext$Stamp;
.super Ljava/lang/Object;
.source "DiaryContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/schedule/DiaryContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Stamp"
.end annotation


# instance fields
.field public final generation:J

.field public final owner:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;J)V
    .registers 4

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/DiaryContext$Stamp;->owner:Ljava/lang/String;

    iput-wide p2, p0, Lrk/schedule/DiaryContext$Stamp;->generation:J

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;JLrk/schedule/DiaryContext$1;)V
    .registers 5

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lrk/schedule/DiaryContext$Stamp;-><init>(Ljava/lang/String;J)V

    return-void
.end method
