.class Lcom/edutech/appmanage/MainActivity$9;
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$9;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 3250
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 3255
    iget v1, p1, Landroid/os/Message;->what:I

    .line 3256
    .local v1, "what":I
    packed-switch v1, :pswitch_data_0

    .line 3271
    :goto_0
    return-void

    .line 3259
    :pswitch_0
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$9;->this$0:Lcom/edutech/appmanage/MainActivity;

    const-string/jumbo v4, "connectivity"

    invoke-virtual {v3, v4}, Lcom/edutech/appmanage/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 3260
    .local v0, "manager":Landroid/net/ConnectivityManager;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v3

    .line 3261
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v2

    .line 3262
    .local v2, "wifi":Landroid/net/NetworkInfo$State;
    sget-object v3, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v2, v3, :cond_0

    .line 3263
    new-instance v3, Ljava/lang/Thread;

    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$9;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v4, v4, Lcom/edutech/appmanage/MainActivity;->net_thread:Ljava/lang/Runnable;

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 3265
    :cond_0
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$9;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->load_info()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/edutech/appmanage/MainActivity;->unlink_parse(Ljava/lang/String;)V

    goto :goto_0

    .line 3256
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
