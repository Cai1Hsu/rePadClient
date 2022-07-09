.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getNetworkTime(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

.field private final synthetic val$type:I


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iput p2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;->val$type:I

    .line 2493
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    const/4 v13, 0x4

    .line 2500
    :try_start_0
    new-instance v9, Ljava/net/URL;

    const-string/jumbo v10, "http://www.ntsc.ac.cn"

    invoke-direct {v9, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 2501
    .local v9, "url":Ljava/net/URL;
    invoke-virtual {v9}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v8

    .line 2502
    .local v8, "uc":Ljava/net/URLConnection;
    invoke-virtual {v8}, Ljava/net/URLConnection;->connect()V

    .line 2503
    invoke-virtual {v8}, Ljava/net/URLConnection;->getDate()J

    move-result-wide v4

    .line 2504
    .local v4, "ld":J
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 2506
    .local v1, "date":Ljava/util/Date;
    invoke-virtual {v1}, Ljava/util/Date;->getHours()I

    move-result v3

    .line 2507
    .local v3, "hour":I
    invoke-virtual {v1}, Ljava/util/Date;->getMinutes()I

    move-result v6

    .line 2508
    .local v6, "minute":I
    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iget-object v10, v10, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->callHandler:Landroid/os/Handler;

    invoke-virtual {v10}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v7

    .line 2509
    .local v7, "msg":Landroid/os/Message;
    iget v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;->val$type:I

    iput v10, v7, Landroid/os/Message;->what:I

    .line 2510
    invoke-virtual {v7}, Landroid/os/Message;->sendToTarget()V

    .line 2511
    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const-string/jumbo v11, "allowcall"

    const/4 v12, 0x4

    invoke-virtual {v10, v11, v12}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2512
    .local v0, "callSp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const-string/jumbo v11, "cancall"

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2522
    .end local v1    # "date":Ljava/util/Date;
    .end local v3    # "hour":I
    .end local v4    # "ld":J
    .end local v6    # "minute":I
    .end local v8    # "uc":Ljava/net/URLConnection;
    .end local v9    # "url":Ljava/net/URL;
    :goto_0
    return-void

    .line 2513
    .end local v0    # "callSp":Landroid/content/SharedPreferences;
    .end local v7    # "msg":Landroid/os/Message;
    :catch_0
    move-exception v2

    .line 2515
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 2516
    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iget-object v10, v10, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->callHandler:Landroid/os/Handler;

    invoke-virtual {v10}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v7

    .line 2517
    .restart local v7    # "msg":Landroid/os/Message;
    const/4 v10, 0x2

    iput v10, v7, Landroid/os/Message;->what:I

    .line 2518
    invoke-virtual {v7}, Landroid/os/Message;->sendToTarget()V

    .line 2519
    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const-string/jumbo v11, "allowcall"

    invoke-virtual {v10, v11, v13}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2520
    .restart local v0    # "callSp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const-string/jumbo v11, "cancall"

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method
