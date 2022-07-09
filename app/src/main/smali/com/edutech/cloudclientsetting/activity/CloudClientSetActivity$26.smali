.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatePassword()V
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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 4532
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v1, 0x6

    .line 4537
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->oldpwd:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_2

    .line 4539
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->newpwd:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4540
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_1

    .line 4541
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->newpwd:Landroid/widget/EditText;

    .line 4542
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 4543
    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4544
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->confirmpwd:Landroid/widget/EditText;

    .line 4545
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 4546
    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 4544
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 4546
    if-eqz v0, :cond_0

    .line 4547
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 4549
    const v2, 0x7f0801d7

    .line 4548
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 4547
    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    .line 4550
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatepwdRun:Ljava/lang/Runnable;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 4551
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 4565
    :goto_0
    return-void

    .line 4553
    :cond_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 4555
    const v2, 0x7f0801d8

    .line 4554
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 4553
    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 4558
    :cond_1
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 4559
    const v2, 0x7f0801d9

    .line 4558
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 4562
    :cond_2
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 4563
    const v2, 0x7f0801da

    .line 4562
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto :goto_0
.end method
