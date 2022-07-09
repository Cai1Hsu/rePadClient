.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;
.super Landroid/os/Handler;
.source "CloudClientSetActivity.java"


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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 318
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 323
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 324
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    .line 325
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->finish()V

    .line 347
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 348
    return-void

    .line 326
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x65

    if-ne v0, v1, :cond_2

    .line 329
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$1(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 330
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 331
    const v2, 0x7f0801dd

    .line 330
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    goto :goto_0

    .line 332
    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x66

    if-ne v0, v1, :cond_3

    .line 334
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v1, "chinese"

    invoke-static {v0, v1}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    .line 335
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v1, "chinese"

    invoke-static {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$2(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 336
    const-string/jumbo v0, "chinese"

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->createLanuage(Ljava/lang/String;)Z

    .line 337
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->finish()V

    .line 338
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 339
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x67

    if-ne v0, v1, :cond_0

    .line 341
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v1, "en"

    invoke-static {v0, v1}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    .line 342
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v1, "english"

    invoke-static {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$2(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 343
    const-string/jumbo v0, "en"

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->createLanuage(Ljava/lang/String;)Z

    .line 344
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->finish()V

    .line 345
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    goto :goto_0
.end method
