.class Lcom/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread;
.super Ljava/lang/Thread;
.source "AppControlActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/AppControlActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ShowAppsThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V
    .locals 0

    .prologue
    .line 160
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 166
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$6(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V

    .line 167
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    iget-object v1, v1, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 168
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 169
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 170
    return-void
.end method
