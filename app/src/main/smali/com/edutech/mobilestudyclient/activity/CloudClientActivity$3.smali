.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 2526
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 2532
    iget v2, p1, Landroid/os/Message;->what:I

    .line 2533
    .local v2, "what":I
    packed-switch v2, :pswitch_data_0

    .line 2569
    :cond_0
    :goto_0
    return-void

    .line 2535
    :pswitch_0
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$8(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2536
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 2537
    .local v1, "intent_tel":Landroid/content/Intent;
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$9(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2538
    const-string/jumbo v3, "com.lenovo.ideafriend"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 2539
    const-string/jumbo v3, "vnd.android-dir/mms-sms"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 2545
    :goto_1
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 2541
    :cond_1
    const-string/jumbo v3, "com.android.mms"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 2542
    const-string/jumbo v3, "vnd.android-dir/mms-sms"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 2543
    const-string/jumbo v3, "android.intent.action.MAIN"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 2549
    .end local v1    # "intent_tel":Landroid/content/Intent;
    :pswitch_1
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$8(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "TB-8703N"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2551
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2552
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "com.android.dialer"

    const-string/jumbo v4, "com.android.dialer.DialtactsActivity"

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2553
    const/high16 v3, 0x10000000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2554
    const/high16 v3, 0x20000000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2555
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 2557
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$8(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2558
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2559
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v3, "android.intent.action.CALL_BUTTON"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2560
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v3, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 2564
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_2
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const v4, 0x7f080213

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 2533
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
