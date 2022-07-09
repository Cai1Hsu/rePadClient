.class Lcom/edutech/appmanage/MainActivity$2;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 453
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const v4, 0x7f080199

    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 458
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 459
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 490
    :goto_0
    return-void

    .line 461
    :pswitch_0
    sget-object v0, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 462
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 464
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 465
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$5(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f020299

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 466
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$6(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 467
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$7(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/GridView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/GridView;->setVisibility(I)V

    goto :goto_0

    .line 469
    :cond_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 470
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$6(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 471
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$7(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/GridView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/GridView;->setVisibility(I)V

    goto :goto_0

    .line 476
    :pswitch_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 477
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 475
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 479
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 482
    :pswitch_2
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 483
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$6(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 484
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$2;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$7(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/GridView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/GridView;->setVisibility(I)V

    goto/16 :goto_0

    .line 459
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
