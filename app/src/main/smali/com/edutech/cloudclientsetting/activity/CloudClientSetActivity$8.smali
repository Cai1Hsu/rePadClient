.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 1693
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4
    .param p1, "arg0"    # Landroid/text/Editable;

    .prologue
    .line 1709
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$19(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1710
    .local v0, "pwd":Ljava/lang/String;
    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$49(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$49(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1712
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$46(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    move-result-object v1

    if-nez v1, :cond_0

    .line 1714
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    new-instance v2, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-direct {v2, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-static {v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$33(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;)V

    .line 1715
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$46(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;->start()V

    .line 1717
    :cond_0
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$47(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1727
    :goto_0
    return-void

    .line 1722
    :cond_1
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$19(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$49(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1723
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$48(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 1726
    :cond_2
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$19(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$19(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/CharSequence;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "arg3"    # I

    .prologue
    .line 1704
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/CharSequence;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "arg3"    # I

    .prologue
    .line 1698
    return-void
.end method
