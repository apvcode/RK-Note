.class final Lrk/mcp/DiaryDb$Lesson;
.super Ljava/lang/Object;
.source "DiaryDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/mcp/DiaryDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Lesson"
.end annotation


# instance fields
.field end:I

.field final homework:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final marks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lrk/mcp/DiaryDb$Mark;",
            ">;"
        }
    .end annotation
.end field

.field number:Ljava/lang/String;

.field start:I

.field title:Ljava/lang/String;

.field topic:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-string v0, ""

    iput-object v0, p0, Lrk/mcp/DiaryDb$Lesson;->number:Ljava/lang/String;

    iput-object v0, p0, Lrk/mcp/DiaryDb$Lesson;->title:Ljava/lang/String;

    iput-object v0, p0, Lrk/mcp/DiaryDb$Lesson;->topic:Ljava/lang/String;

    .line 49
    const/4 v0, -0x1

    iput v0, p0, Lrk/mcp/DiaryDb$Lesson;->start:I

    iput v0, p0, Lrk/mcp/DiaryDb$Lesson;->end:I

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrk/mcp/DiaryDb$Lesson;->homework:Ljava/util/List;

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrk/mcp/DiaryDb$Lesson;->marks:Ljava/util/List;

    return-void
.end method
