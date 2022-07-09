.class Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;
.super Ljava/lang/Object;
.source "AppControlActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/AppControlActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    .line 404
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    const/16 v3, 0x8

    .line 409
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$5(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/EditText;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 410
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$5(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getVisibility()I

    move-result v1

    if-ne v1, v3, :cond_0

    .line 412
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$5(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/EditText;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 413
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$4(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/Button;

    move-result-object v1

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080209

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 414
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    iget-object v1, v1, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 415
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    .line 416
    const-string/jumbo v1, ""

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 417
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 426
    :goto_0
    return-void

    .line 420
    .end local v0    # "msg":Landroid/os/Message;
    :cond_0
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$5(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setVisibility(I)V

    .line 421
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$4(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/Button;

    move-result-object v1

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080207

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 422
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    iget-object v1, v1, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 423
    .restart local v0    # "msg":Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 424
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0
.end method
