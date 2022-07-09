.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;
.super Landroid/content/BroadcastReceiver;
.source "CloudClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BatteryReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 4703
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 4709
    const-string/jumbo v4, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 4711
    const-string/jumbo v4, "level"

    const/4 v5, 0x0

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 4713
    .local v0, "level":I
    const-string/jumbo v4, "scale"

    const/16 v5, 0x64

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 4716
    .local v2, "scale":I
    const-string/jumbo v4, "status"

    const/4 v5, -0x1

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 4717
    .local v3, "status":I
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$37(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 4718
    .local v1, "msg":Landroid/os/Message;
    mul-int/lit8 v4, v0, 0x64

    div-int/2addr v4, v2

    iput v4, v1, Landroid/os/Message;->arg1:I

    .line 4719
    iput v3, v1, Landroid/os/Message;->arg2:I

    .line 4720
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 4722
    .end local v0    # "level":I
    .end local v1    # "msg":Landroid/os/Message;
    .end local v2    # "scale":I
    .end local v3    # "status":I
    :cond_0
    return-void
.end method
