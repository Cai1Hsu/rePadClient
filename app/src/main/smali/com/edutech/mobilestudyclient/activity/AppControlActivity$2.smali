.class Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;
.super Landroid/os/Handler;
.source "AppControlActivity.java"


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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    .line 337
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 343
    iget v1, p1, Landroid/os/Message;->what:I

    .line 344
    .local v1, "what":I
    packed-switch v1, :pswitch_data_0

    .line 364
    :cond_0
    :goto_0
    return-void

    .line 346
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 347
    .local v0, "keywords":Ljava/lang/String;
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2, v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$0(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;Ljava/lang/String;)V

    .line 348
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$2(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 350
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    move-result-object v2

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$2(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->setDetails(Ljava/util/List;)V

    .line 351
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->notifyDataSetChanged()V

    goto :goto_0

    .line 355
    .end local v0    # "keywords":Ljava/lang/String;
    :pswitch_1
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$3(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 357
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    move-result-object v2

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$3(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->setDetails(Ljava/util/List;)V

    .line 358
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Lcom/edutech/mobilestudyclient/view/AppControlAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->notifyDataSetChanged()V

    .line 360
    :cond_1
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$2;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$4(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/Button;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 344
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
