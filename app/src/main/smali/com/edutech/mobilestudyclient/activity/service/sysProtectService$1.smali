.class Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;
.super Landroid/content/BroadcastReceiver;
.source "sysProtectService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    .line 211
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 215
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 216
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v2, "NetworkService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "action = "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    sget-object v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_LOCKWINDOW:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 218
    const-string/jumbo v2, "state"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 219
    .local v1, "info":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 221
    :cond_0
    const-string/jumbo v1, "2"

    .line 223
    :cond_1
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v2, v1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->showDialog(Ljava/lang/String;)V

    .line 230
    .end local v1    # "info":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void

    .line 224
    :cond_3
    sget-object v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_UNLOCKWINDOW:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 225
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$0(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Landroid/app/Dialog;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$0(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 226
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$0(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 227
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$1(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Landroid/app/Dialog;)V

    goto :goto_0
.end method
