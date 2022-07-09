.class Lcom/edutech/appmanage/MainActivity$3;
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 493
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    .line 498
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 499
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 526
    :goto_0
    return-void

    .line 501
    :pswitch_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 502
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08019a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 501
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 503
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 507
    :pswitch_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 508
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08019b

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 506
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 509
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 513
    :pswitch_2
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 514
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 515
    const v2, 0x7f08019c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 512
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 516
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 519
    :pswitch_3
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 520
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08019d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 519
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 521
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 522
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$3;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 499
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
