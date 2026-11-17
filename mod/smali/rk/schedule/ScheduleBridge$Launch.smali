.class final Lrk/schedule/ScheduleBridge$Launch;
.super Ljava/lang/Object;
.source "ScheduleBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrk/schedule/ScheduleBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Launch"
.end annotation


# instance fields
.field final presenter:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final stamp:Lrk/schedule/DiaryContext$Stamp;


# direct methods
.method constructor <init>(Ljava/lang/Object;Lrk/schedule/DiaryContext$Stamp;)V
    .registers 4

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lrk/schedule/ScheduleBridge$Launch;->presenter:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lrk/schedule/ScheduleBridge$Launch;->stamp:Lrk/schedule/DiaryContext$Stamp;

    return-void
.end method
