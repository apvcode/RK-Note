.class public final synthetic Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lrk/schedule/DiaryContext$Stamp;


# direct methods
.method public synthetic constructor <init>(Lrk/schedule/DiaryContext$Stamp;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda3;->f$0:Lrk/schedule/DiaryContext$Stamp;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lrk/schedule/ScheduleBridge$$ExternalSyntheticLambda3;->f$0:Lrk/schedule/DiaryContext$Stamp;

    invoke-static {v0}, Lrk/schedule/ScheduleBridge;->lambda$refresh$5(Lrk/schedule/DiaryContext$Stamp;)V

    return-void
.end method
