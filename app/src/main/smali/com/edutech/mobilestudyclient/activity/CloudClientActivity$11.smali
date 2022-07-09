.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 5155
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 5161
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 5185
    :goto_0
    return-void

    .line 5163
    :pswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 5164
    .local v0, "obj":I
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$18(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 5166
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$18(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 5167
    if-lez v0, :cond_2

    .line 5169
    const/16 v2, 0x64

    if-ge v0, v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 5170
    .local v1, "obj_str":Ljava/lang/String;
    :goto_1
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$18(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5176
    .end local v1    # "obj_str":Ljava/lang/String;
    :cond_0
    :goto_2
    :try_start_0
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$19(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 5177
    :catch_0
    move-exception v2

    goto :goto_0

    .line 5169
    :cond_1
    const-string/jumbo v1, "99+"

    goto :goto_1

    .line 5173
    :cond_2
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$18(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    .line 5161
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
