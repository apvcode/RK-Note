.class Lrk/schedule/ScheduleEditor$1;
.super Landroid/app/AlertDialog$Builder;
.source "ScheduleEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrk/schedule/ScheduleEditor;->builder()Landroid/app/AlertDialog$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lrk/schedule/ScheduleEditor;


# direct methods
.method constructor <init>(Lrk/schedule/ScheduleEditor;Landroid/content/Context;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 99
    iput-object p1, p0, Lrk/schedule/ScheduleEditor$1;->this$0:Lrk/schedule/ScheduleEditor;

    invoke-direct {p0, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public show()Landroid/app/AlertDialog;
    .registers 3

    .line 99
    invoke-super {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iget-object v1, p0, Lrk/schedule/ScheduleEditor$1;->this$0:Lrk/schedule/ScheduleEditor;

    invoke-static {v1, v0}, Lrk/schedule/ScheduleEditor;->access$000(Lrk/schedule/ScheduleEditor;Landroid/app/AlertDialog;)V

    return-object v0
.end method
