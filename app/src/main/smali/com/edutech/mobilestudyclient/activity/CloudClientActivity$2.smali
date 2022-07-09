.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$2;
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 1193
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1197
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1198
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v1, "android.intent.action.STATUSBAR_INVISIBILITY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1200
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$7(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    .line 1205
    :cond_0
    :goto_0
    return-void

    .line 1201
    :cond_1
    const-string/jumbo v1, "android.intent.action.STATUSBAR_VISIBILITY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1203
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$7(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    goto :goto_0
.end method
