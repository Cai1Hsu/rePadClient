.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showConfirmPwdDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

.field private final synthetic val$edtpwd:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Landroid/widget/EditText;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iput-object p2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->val$edtpwd:Landroid/widget/EditText;

    .line 4398
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "arg0"    # Landroid/content/DialogInterface;
    .param p2, "arg1"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    .line 4403
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->val$edtpwd:Landroid/widget/EditText;

    if-eqz v1, :cond_1

    .line 4405
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->val$edtpwd:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->val$edtpwd:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4406
    .local v0, "edtStr":Ljava/lang/String;
    :goto_0
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXF:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNL:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNLEZ:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isHT:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isGQ:Z

    if-eqz v1, :cond_5

    .line 4410
    :cond_0
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$88(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 4412
    new-instance v1, Ljava/lang/Thread;

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v2, v2, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->runnable_GetConfig_Infor:Ljava/lang/Runnable;

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 4431
    .end local v0    # "edtStr":Ljava/lang/String;
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$87(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/app/AlertDialog;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 4433
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$87(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 4435
    :cond_2
    return-void

    .line 4405
    :cond_3
    const-string/jumbo v0, ""

    goto :goto_0

    .line 4415
    .restart local v0    # "edtStr":Ljava/lang/String;
    :cond_4
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 4416
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 4417
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;

    move-result-object v1

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0801be

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 4418
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v2, "\u5bc6\u7801\u9a8c\u8bc1\u4e0d\u901a\u8fc7\uff01"

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 4422
    :cond_5
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$88(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$89(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 4424
    :cond_6
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$32(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V

    goto :goto_1

    .line 4427
    :cond_7
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1, v4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$32(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V

    goto :goto_1
.end method
