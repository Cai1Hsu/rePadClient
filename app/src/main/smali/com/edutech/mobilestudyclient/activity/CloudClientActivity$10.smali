.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$10;
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$10;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 5131
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 5137
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 5149
    :cond_0
    :goto_0
    return-void

    .line 5139
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 5140
    .local v0, "time":Ljava/lang/String;
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$10;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$17(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 5142
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$10;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$17(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 5137
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
