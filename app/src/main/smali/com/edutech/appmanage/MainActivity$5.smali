.class Lcom/edutech/appmanage/MainActivity$5;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 2018
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 2023
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2024
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 2075
    :cond_0
    :goto_0
    return-void

    .line 2026
    :pswitch_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2029
    :try_start_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->changed_progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 2034
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$10(Lcom/edutech/appmanage/MainActivity;)V

    goto :goto_0

    .line 2037
    :pswitch_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$11(Lcom/edutech/appmanage/MainActivity;)V

    .line 2038
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2041
    :try_start_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->changed_progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 2042
    :catch_0
    move-exception v0

    goto :goto_0

    .line 2048
    :pswitch_2
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2052
    :try_start_2
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->changed_progress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 2053
    const v2, 0x7f0801ad

    .line 2052
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 2054
    :catch_1
    move-exception v0

    goto :goto_0

    .line 2060
    :pswitch_3
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2063
    :try_start_3
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->changed_progress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$5;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 2064
    const v2, 0x7f0801ae

    .line 2063
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 2065
    :catch_2
    move-exception v0

    goto :goto_0

    .line 2030
    :catch_3
    move-exception v0

    goto :goto_1

    .line 2024
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
