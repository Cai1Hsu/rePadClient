.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;
.super Landroid/content/BroadcastReceiver;
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 4929
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 4934
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 4935
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v3, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 4937
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iget-object v3, v3, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkHandler:Landroid/os/Handler;

    invoke-virtual {v3}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 4938
    .local v1, "msg":Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 4939
    invoke-virtual {p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    .line 4940
    .local v2, "packageName":Ljava/lang/String;
    const-string/jumbo v3, "package:"

    const-string/jumbo v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 4942
    :try_start_0
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$12(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$12(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 4943
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$12(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4949
    .end local v1    # "msg":Landroid/os/Message;
    .end local v2    # "packageName":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 4945
    .restart local v1    # "msg":Landroid/os/Message;
    .restart local v2    # "packageName":Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_0
.end method
