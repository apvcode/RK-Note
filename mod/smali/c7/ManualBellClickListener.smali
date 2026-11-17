.class public final Lc7/ManualBellClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field private final context:Landroid/content/Context;
.field private final dialog:Landroid/app/Dialog;
.field private final reset:Z

.method public constructor <init>(Landroid/content/Context;Landroid/app/Dialog;Z)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lc7/ManualBellClickListener;->context:Landroid/content/Context;
    iput-object p2, p0, Lc7/ManualBellClickListener;->dialog:Landroid/app/Dialog;
    iput-boolean p3, p0, Lc7/ManualBellClickListener;->reset:Z
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    iget-boolean v0, p0, Lc7/ManualBellClickListener;->reset:Z
    if-eqz v0, :save
    iget-object v0, p0, Lc7/ManualBellClickListener;->context:Landroid/content/Context;
    invoke-static {v0}, Lc7/ManualBellCorrection;->reset(Landroid/content/Context;)V
    goto :dismiss
    :save
    :try_start
    iget-object v0, p0, Lc7/ManualBellClickListener;->dialog:Landroid/app/Dialog;
    const v1, 0x7f0903b8
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;
    move-result-object v0
    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result v4
    iget-object v0, p0, Lc7/ManualBellClickListener;->dialog:Landroid/app/Dialog;
    const v3, 0x7f0903b6
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/Spinner;
    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I
    move-result v1
    iget-object v0, p0, Lc7/ManualBellClickListener;->dialog:Landroid/app/Dialog;
    const v3, 0x7f0903b7
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/widget/Spinner;
    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I
    move-result v2
    iget-object v0, p0, Lc7/ManualBellClickListener;->context:Landroid/content/Context;
    invoke-static {v0, v1, v2, v4}, Lc7/ManualBellCorrection;->save(Landroid/content/Context;III)Z
    move-result v3
    if-nez v3, :dismiss
    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :invalid
    :invalid
    iget-object v0, p0, Lc7/ManualBellClickListener;->context:Landroid/content/Context;
    const-string v1, "Укажите минуты и урок с следующим звонком"
    const/4 v2, 0x0
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v0
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    return-void
    :dismiss
    iget-object v0, p0, Lc7/ManualBellClickListener;->dialog:Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    return-void
.end method
