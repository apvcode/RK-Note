.class public final Lc7/GreetingToggleListener;
.super Ljava/lang/Object;
.source "GreetingToggleListener.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;

# instance fields
.field private final context:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc7/GreetingToggleListener;->context:Landroid/content/Context;

    return-void
.end method

.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    iget-object v0, p0, Lc7/GreetingToggleListener;->context:Landroid/content/Context;

    invoke-static {v0, p2}, Lc7/GreetingManager;->setEnabled(Landroid/content/Context;Z)V

    return-void
.end method
