.class Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity$CompleteReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    .line 3132
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    .line 3137
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 3138
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 3165
    :goto_0
    return-void

    .line 3141
    :pswitch_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->mycontext:Landroid/content/Context;

    .line 3142
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 3143
    const v2, 0x7f0801af

    .line 3142
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 3140
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 3144
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 3148
    :pswitch_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->mycontext:Landroid/content/Context;

    .line 3149
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 3150
    const v2, 0x7f0801b0

    .line 3149
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 3147
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 3151
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 3155
    :pswitch_2
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->mycontext:Landroid/content/Context;

    .line 3156
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 3157
    const v2, 0x7f0801b1

    .line 3156
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 3154
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 3158
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 3138
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
