.class final Lrk/mcp/DiaryDb$Day;
.super Ljava/lang/Object;
.source "DiaryDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/mcp/DiaryDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Day"
.end annotation


# instance fields
.field alert:Ljava/lang/String;

.field holiday:Ljava/lang/String;

.field key:Ljava/lang/String;

.field final lessons:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lrk/mcp/DiaryDb$Lesson;",
            ">;"
        }
    .end annotation
.end field

.field name:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lrk/mcp/DiaryDb$Day;->name:Ljava/lang/String;

    iput-object v0, p0, Lrk/mcp/DiaryDb$Day;->alert:Ljava/lang/String;

    iput-object v0, p0, Lrk/mcp/DiaryDb$Day;->holiday:Ljava/lang/String;

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrk/mcp/DiaryDb$Day;->lessons:Ljava/util/List;

    return-void
.end method
