.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;
.super Landroid/os/Handler;
.source "CloudClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 4475
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/16 v7, 0x28

    const/16 v6, 0x1e

    const/16 v4, 0x14

    const/16 v3, 0xa

    const/4 v5, 0x0

    .line 4478
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 4479
    .local v0, "battery":I
    iget v1, p1, Landroid/os/Message;->arg2:I

    .line 4480
    .local v1, "status":I
    const/4 v2, 0x2

    if-ne v1, v2, :cond_5

    .line 4481
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v2, :cond_1

    .line 4483
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4484
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 4485
    const v4, 0x7f02030e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4484
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 4695
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4697
    return-void

    .line 4487
    :cond_1
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v2, :cond_2

    .line 4489
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4490
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 4491
    const v4, 0x7f0202d1

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4490
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 4492
    :cond_2
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-nez v2, :cond_3

    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_4

    .line 4494
    :cond_3
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4496
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200c6

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4494
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 4499
    :cond_4
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4500
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 4501
    const v4, 0x7f0200ba

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4500
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 4507
    :cond_5
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v2, :cond_f

    .line 4510
    if-lez v0, :cond_6

    if-gt v0, v3, :cond_6

    .line 4511
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4512
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020304

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4511
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4514
    :cond_6
    if-le v0, v3, :cond_7

    if-gt v0, v4, :cond_7

    .line 4515
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4516
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020306

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4515
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4518
    :cond_7
    if-le v0, v4, :cond_8

    if-gt v0, v6, :cond_8

    .line 4519
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4520
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020307

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4519
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4522
    :cond_8
    if-le v0, v6, :cond_9

    if-gt v0, v7, :cond_9

    .line 4523
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4524
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020308

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4523
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4526
    :cond_9
    if-le v0, v7, :cond_a

    const/16 v2, 0x32

    if-gt v0, v2, :cond_a

    .line 4527
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4528
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020309

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4527
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4530
    :cond_a
    const/16 v2, 0x32

    if-le v0, v2, :cond_b

    const/16 v2, 0x3c

    if-gt v0, v2, :cond_b

    .line 4531
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4532
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02030a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4531
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4534
    :cond_b
    const/16 v2, 0x3c

    if-le v0, v2, :cond_c

    const/16 v2, 0x46

    if-gt v0, v2, :cond_c

    .line 4535
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4536
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02030b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4535
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4538
    :cond_c
    const/16 v2, 0x46

    if-le v0, v2, :cond_d

    const/16 v2, 0x50

    if-gt v0, v2, :cond_d

    .line 4539
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4540
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02030c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4539
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4542
    :cond_d
    const/16 v2, 0x50

    if-le v0, v2, :cond_e

    const/16 v2, 0x5a

    if-gt v0, v2, :cond_e

    .line 4543
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4544
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02030d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4543
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4546
    :cond_e
    const/16 v2, 0x5a

    if-le v0, v2, :cond_0

    const/16 v2, 0x64

    if-gt v0, v2, :cond_0

    .line 4547
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4549
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 4550
    const v4, 0x7f020305

    .line 4549
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4548
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4553
    :cond_f
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v2, :cond_19

    .line 4557
    if-lez v0, :cond_10

    if-gt v0, v3, :cond_10

    .line 4558
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4559
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202c7

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4558
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4561
    :cond_10
    if-le v0, v3, :cond_11

    if-gt v0, v4, :cond_11

    .line 4562
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4563
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202c9

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4562
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4565
    :cond_11
    if-le v0, v4, :cond_12

    if-gt v0, v6, :cond_12

    .line 4566
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4567
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202ca

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4566
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4569
    :cond_12
    if-le v0, v6, :cond_13

    if-gt v0, v7, :cond_13

    .line 4570
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4571
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202cb

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4570
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4573
    :cond_13
    if-le v0, v7, :cond_14

    const/16 v2, 0x32

    if-gt v0, v2, :cond_14

    .line 4574
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4575
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202cc

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4574
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4577
    :cond_14
    const/16 v2, 0x32

    if-le v0, v2, :cond_15

    const/16 v2, 0x3c

    if-gt v0, v2, :cond_15

    .line 4578
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4579
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202cd

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4578
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4581
    :cond_15
    const/16 v2, 0x3c

    if-le v0, v2, :cond_16

    const/16 v2, 0x46

    if-gt v0, v2, :cond_16

    .line 4582
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4583
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202ce

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4582
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4585
    :cond_16
    const/16 v2, 0x46

    if-le v0, v2, :cond_17

    const/16 v2, 0x50

    if-gt v0, v2, :cond_17

    .line 4586
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4587
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202cf

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4586
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4589
    :cond_17
    const/16 v2, 0x50

    if-le v0, v2, :cond_18

    const/16 v2, 0x5a

    if-gt v0, v2, :cond_18

    .line 4590
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4591
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0202d0

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4590
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4593
    :cond_18
    const/16 v2, 0x5a

    if-le v0, v2, :cond_0

    const/16 v2, 0x64

    if-gt v0, v2, :cond_0

    .line 4594
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4596
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 4597
    const v4, 0x7f0202c8

    .line 4596
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4595
    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4601
    :cond_19
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-nez v2, :cond_1a

    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_24

    .line 4603
    :cond_1a
    if-lez v0, :cond_1b

    if-gt v0, v3, :cond_1b

    .line 4604
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4605
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200bc

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4604
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4607
    :cond_1b
    if-le v0, v3, :cond_1c

    if-gt v0, v4, :cond_1c

    .line 4608
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4610
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200be

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4608
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4611
    :cond_1c
    if-le v0, v4, :cond_1d

    if-gt v0, v6, :cond_1d

    .line 4612
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4614
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200bf

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4612
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4615
    :cond_1d
    if-le v0, v6, :cond_1e

    if-gt v0, v7, :cond_1e

    .line 4616
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4618
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200c0

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4616
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4619
    :cond_1e
    if-le v0, v7, :cond_1f

    const/16 v2, 0x32

    if-gt v0, v2, :cond_1f

    .line 4620
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4622
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200c1

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4620
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4623
    :cond_1f
    const/16 v2, 0x32

    if-le v0, v2, :cond_20

    const/16 v2, 0x3c

    if-gt v0, v2, :cond_20

    .line 4624
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4626
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200c2

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4624
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4627
    :cond_20
    const/16 v2, 0x3c

    if-le v0, v2, :cond_21

    const/16 v2, 0x46

    if-gt v0, v2, :cond_21

    .line 4628
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4630
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200c3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4628
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4631
    :cond_21
    const/16 v2, 0x46

    if-le v0, v2, :cond_22

    const/16 v2, 0x50

    if-gt v0, v2, :cond_22

    .line 4632
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4634
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200c4

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4632
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4635
    :cond_22
    const/16 v2, 0x50

    if-le v0, v2, :cond_23

    const/16 v2, 0x5a

    if-gt v0, v2, :cond_23

    .line 4636
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4638
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200c5

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4636
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4639
    :cond_23
    const/16 v2, 0x5a

    if-le v0, v2, :cond_0

    const/16 v2, 0x64

    if-gt v0, v2, :cond_0

    .line 4640
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4643
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 4644
    const v4, 0x7f0200bd

    .line 4643
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4641
    invoke-virtual {v2, v5, v5, v3, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4650
    :cond_24
    if-lez v0, :cond_25

    if-gt v0, v3, :cond_25

    .line 4651
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4652
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200a7

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4651
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4654
    :cond_25
    if-le v0, v3, :cond_26

    if-gt v0, v4, :cond_26

    .line 4655
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4656
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200a8

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4655
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4658
    :cond_26
    if-le v0, v4, :cond_27

    if-gt v0, v6, :cond_27

    .line 4659
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4660
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200a9

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4659
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4662
    :cond_27
    if-le v0, v6, :cond_28

    if-gt v0, v7, :cond_28

    .line 4663
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4664
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200aa

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4663
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4666
    :cond_28
    if-le v0, v7, :cond_29

    const/16 v2, 0x32

    if-gt v0, v2, :cond_29

    .line 4667
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4668
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200ab

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4667
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4670
    :cond_29
    const/16 v2, 0x32

    if-le v0, v2, :cond_2a

    const/16 v2, 0x3c

    if-gt v0, v2, :cond_2a

    .line 4671
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4672
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200ac

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4671
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4674
    :cond_2a
    const/16 v2, 0x3c

    if-le v0, v2, :cond_2b

    const/16 v2, 0x46

    if-gt v0, v2, :cond_2b

    .line 4675
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4676
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200ad

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4675
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4678
    :cond_2b
    const/16 v2, 0x46

    if-le v0, v2, :cond_2c

    const/16 v2, 0x50

    if-gt v0, v2, :cond_2c

    .line 4679
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4680
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200ae

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4679
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4682
    :cond_2c
    const/16 v2, 0x50

    if-le v0, v2, :cond_2d

    const/16 v2, 0x5a

    if-gt v0, v2, :cond_2d

    .line 4683
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4684
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0200af

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4683
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 4686
    :cond_2d
    const/16 v2, 0x5a

    if-le v0, v2, :cond_0

    const/16 v2, 0x64

    if-gt v0, v2, :cond_0

    .line 4687
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    .line 4689
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 4690
    const v4, 0x7f0200b0

    .line 4689
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 4688
    invoke-virtual {v2, v3, v5, v5, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0
.end method
