.class Lcom/edutech/appmanage/MainActivity$4;
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 1326
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1331
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 1335
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 1366
    :goto_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1368
    return-void

    .line 1337
    :pswitch_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1338
    const v2, 0x7f08019e

    .line 1337
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1339
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$5(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f020147

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 1341
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$8(Lcom/edutech/appmanage/MainActivity;Z)V

    .line 1342
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$9(Lcom/edutech/appmanage/MainActivity;Z)V

    goto :goto_0

    .line 1345
    :pswitch_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1346
    const v2, 0x7f080199

    .line 1345
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1347
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$5(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f020299

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 1349
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$8(Lcom/edutech/appmanage/MainActivity;Z)V

    .line 1350
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$9(Lcom/edutech/appmanage/MainActivity;Z)V

    goto :goto_0

    .line 1353
    :pswitch_2
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1354
    const v2, 0x7f08019f

    .line 1353
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1355
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$5(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f020297

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 1357
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$8(Lcom/edutech/appmanage/MainActivity;Z)V

    .line 1358
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$9(Lcom/edutech/appmanage/MainActivity;Z)V

    .line 1359
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_net:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1360
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$6(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 1361
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$4;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$7(Lcom/edutech/appmanage/MainActivity;)Landroid/widget/GridView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setVisibility(I)V

    goto/16 :goto_0

    .line 1335
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
