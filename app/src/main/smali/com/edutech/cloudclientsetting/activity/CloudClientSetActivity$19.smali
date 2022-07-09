.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 2173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2179
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x10

    if-lt v1, v2, :cond_0

    .line 2180
    new-instance v1, Ljava/lang/Thread;

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v2, v2, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->downloadRun:Ljava/lang/Runnable;

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 2181
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 2182
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x3e8

    iput v1, v0, Landroid/os/Message;->what:I

    .line 2183
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v1

    .line 2184
    const-wide/16 v2, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 2186
    .end local v0    # "msg":Landroid/os/Message;
    :cond_0
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$85(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/app/AlertDialog;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 2187
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$85(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 2188
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$86(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Landroid/app/AlertDialog;)V

    .line 2190
    :cond_1
    return-void
.end method
