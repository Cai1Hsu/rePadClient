.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;
.super Landroid/os/Handler;
.source "CloudClientSetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 466
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 13
    .param p1, "msg"    # Landroid/os/Message;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const v9, 0x7f0801be

    const/4 v12, 0x0

    const/4 v10, 0x1

    .line 469
    iget v7, p1, Landroid/os/Message;->what:I

    sparse-switch v7, :sswitch_data_0

    .line 661
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v7, v7, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 662
    const v9, 0x7f0801d0

    .line 661
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 665
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 666
    return-void

    .line 472
    :sswitch_0
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f080212

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 475
    :sswitch_1
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 476
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 477
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 478
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v8, "\u5730\u5740\u6700\u540e\u4e00\u4f4d\u4e0d\u80fd\u4e3a\'/\'"

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 481
    :sswitch_2
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 482
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 483
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 484
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f080301

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 487
    :sswitch_3
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v7, v7, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 488
    const v9, 0x7f0801c1

    .line 487
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 491
    :sswitch_4
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v7, v7, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 492
    const v9, 0x7f0801c2

    .line 491
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 495
    :sswitch_5
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v7, v7, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 496
    const v9, 0x7f0801c3

    .line 495
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 499
    :sswitch_6
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v7, v7, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 500
    const v9, 0x7f0801c4

    .line 499
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 503
    :sswitch_7
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v7, v7, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 504
    const v9, 0x7f0801c5

    .line 503
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 507
    :sswitch_8
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->loadidXml()V

    goto/16 :goto_0

    .line 510
    :sswitch_9
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->loadidXml()V

    goto/16 :goto_0

    .line 513
    :sswitch_a
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v7, v7, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 514
    const v9, 0x7f0801c6

    .line 513
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 517
    :sswitch_b
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v7, v7, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 518
    const v9, 0x7f0801c7

    .line 517
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 521
    :sswitch_c
    const-string/jumbo v7, ""

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$18(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 522
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$19(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$18(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 524
    :cond_0
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0801c8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    .line 527
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7, v12}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$20(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V

    .line 528
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v12}, Landroid/widget/Button;->setEnabled(Z)V

    .line 529
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v12}, Landroid/widget/Button;->setEnabled(Z)V

    .line 530
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0801bf

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 531
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$21(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 532
    new-instance v7, Ljava/lang/Thread;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, v8, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->runnable_GetConfig_Infor:Ljava/lang/Runnable;

    invoke-direct {v7, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 536
    :sswitch_d
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 538
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 541
    :cond_1
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0801c9

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 545
    :sswitch_e
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0801ca

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 548
    :sswitch_f
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0801cb

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 551
    :sswitch_10
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0801cc

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 554
    :sswitch_11
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 555
    const v9, 0x7f0801cd

    .line 554
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 558
    :sswitch_12
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 559
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0801ce

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 558
    invoke-static {v7, v8, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    .line 560
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 561
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$23(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 562
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$24(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$25(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 563
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$19(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$26(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 564
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$27(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$28(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 565
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$29(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$30(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 566
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v7

    const/16 v8, 0x18

    const-wide/16 v10, 0xbb8

    invoke-virtual {v7, v8, v10, v11}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 567
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7, v12}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$32(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V

    .line 568
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const/4 v8, 0x0

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$33(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;)V

    .line 569
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v8, "privatekey"

    invoke-virtual {v7, v8, v12}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 571
    .local v5, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "schoolid"

    const-string/jumbo v8, ""

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 572
    .local v4, "schoolid":Ljava/lang/String;
    const-string/jumbo v7, "name"

    const-string/jumbo v8, ""

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 573
    .local v2, "name":Ljava/lang/String;
    const-string/jumbo v7, "apihost"

    const-string/jumbo v8, ""

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 574
    .local v0, "ip":Ljava/lang/String;
    const-string/jumbo v7, "key"

    const-string/jumbo v8, ""

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 575
    .local v3, "privatekey":Ljava/lang/String;
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7, v0, v3, v2, v4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$34(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 576
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v8, "loginhistory"

    const/4 v9, 0x4

    invoke-virtual {v7, v8, v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 577
    .local v1, "loginSp":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "iphistoryString"

    const-string/jumbo v8, ""

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 578
    .local v6, "tempips":Ljava/lang/String;
    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 579
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ",:,"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 580
    :cond_2
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string/jumbo v8, "iphistoryString"

    invoke-interface {v7, v8, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 582
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$35(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/ListPopupWindow;

    move-result-object v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$36(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 584
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$37(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$37(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 586
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$37(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 587
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$36(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$37(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->setIps(Ljava/util/List;)V

    .line 588
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$36(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    move-result-object v7

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->notifyDataSetChanged()V

    .line 592
    :cond_3
    :try_start_0
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$38(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v10}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$27(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v11}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$29(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v11

    iget-object v12, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v12}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$39(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lorg/json/JSONArray;

    move-result-object v12

    invoke-static {v8, v9, v10, v11, v12}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$40(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$41(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 593
    :catch_0
    move-exception v7

    goto/16 :goto_0

    .line 598
    .end local v0    # "ip":Ljava/lang/String;
    .end local v1    # "loginSp":Landroid/content/SharedPreferences;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "privatekey":Ljava/lang/String;
    .end local v4    # "schoolid":Ljava/lang/String;
    .end local v5    # "sharePre":Landroid/content/SharedPreferences;
    .end local v6    # "tempips":Ljava/lang/String;
    :sswitch_13
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 599
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 600
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 601
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_4

    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 603
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 604
    :cond_4
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$42(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 607
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 608
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f080220

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 606
    invoke-static {v7, v8, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    .line 609
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 613
    :cond_5
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 614
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0801cf

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 612
    invoke-static {v7, v8, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    .line 615
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 619
    :sswitch_14
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 620
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 621
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 622
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 624
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 627
    :cond_6
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 628
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f08021e

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 626
    invoke-static {v7, v8, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    .line 629
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 633
    :sswitch_15
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 634
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 635
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 636
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_7

    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    .line 638
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 641
    :cond_7
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 642
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f08021f

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 640
    invoke-static {v7, v8, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    .line 643
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 647
    :sswitch_16
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 648
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 649
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 652
    :sswitch_17
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7, v10}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$20(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V

    .line 653
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 654
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 655
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v7

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 656
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$28(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 657
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$24(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$30(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 658
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$43(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    goto/16 :goto_0

    .line 469
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_4
        0x1 -> :sswitch_5
        0x2 -> :sswitch_6
        0x3 -> :sswitch_7
        0x4 -> :sswitch_8
        0x5 -> :sswitch_9
        0x6 -> :sswitch_a
        0x7 -> :sswitch_b
        0xb -> :sswitch_c
        0xc -> :sswitch_d
        0xd -> :sswitch_e
        0xe -> :sswitch_f
        0xf -> :sswitch_10
        0x10 -> :sswitch_11
        0x14 -> :sswitch_12
        0x15 -> :sswitch_13
        0x18 -> :sswitch_16
        0x1f -> :sswitch_14
        0x20 -> :sswitch_15
        0x70 -> :sswitch_0
        0x3e8 -> :sswitch_3
        0x3ea -> :sswitch_17
        0x3eb -> :sswitch_1
        0x3ed -> :sswitch_2
    .end sparse-switch
.end method
