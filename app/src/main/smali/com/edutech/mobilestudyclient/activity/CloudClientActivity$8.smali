.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$8;
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$8;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 4953
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 4956
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$8;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$3(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    .line 4957
    return-void
.end method
