.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;
.super Landroid/content/BroadcastReceiver;
.source "CloudClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WifiReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 4880
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v10, 0x1

    const/4 v8, -0x1

    const v11, 0x7f080215

    const/4 v9, 0x0

    .line 4883
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 4884
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v7, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 4885
    const-string/jumbo v7, "networkInfo"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/net/NetworkInfo;

    .line 4886
    .local v3, "info":Landroid/net/NetworkInfo;
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v7

    sget-object v8, Landroid/net/NetworkInfo$State;->DISCONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v7, v8}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 4887
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$40(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v9, v11}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const v10, 0x7f080216

    invoke-virtual {v9, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4926
    .end local v3    # "info":Landroid/net/NetworkInfo;
    :cond_0
    :goto_0
    return-void

    .line 4888
    .restart local v3    # "info":Landroid/net/NetworkInfo;
    :cond_1
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v7

    sget-object v8, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v7, v8}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 4890
    :try_start_0
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$40(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const v10, 0x7f080215

    invoke-virtual {v9, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v9, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getWIFISSID(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4897
    :goto_1
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$41(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    .line 4898
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdate()V

    goto :goto_0

    .line 4891
    :catch_0
    move-exception v1

    .line 4893
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v7, "wifi"

    invoke-virtual {p1, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 4894
    .local v6, "wifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v5

    .line 4895
    .local v5, "wifiInfo":Landroid/net/wifi/WifiInfo;
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$40(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v9, v11}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 4901
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "info":Landroid/net/NetworkInfo;
    .end local v5    # "wifiInfo":Landroid/net/wifi/WifiInfo;
    .end local v6    # "wifiManager":Landroid/net/wifi/WifiManager;
    :cond_2
    const-string/jumbo v7, "com.edutech.startservice"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 4903
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$42(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    goto/16 :goto_0

    .line 4905
    :cond_3
    const-string/jumbo v7, "edm.intent.action.license.status"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 4907
    const-string/jumbo v7, "edm.intent.extra.license.errorcode"

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 4908
    .local v2, "errorcode":I
    const/16 v7, 0x259

    if-eq v2, v7, :cond_4

    const-string/jumbo v7, "edm.intent.extra.license.result_type"

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    const/16 v8, 0x320

    if-ne v7, v8, :cond_4

    .line 4910
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v7, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$43(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    .line 4911
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const-string/jumbo v8, "license"

    invoke-virtual {v7, v8, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 4912
    .local v4, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string/jumbo v8, "licenseok"

    invoke-interface {v7, v8, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 4913
    const-string/jumbo v7, "license"

    const-string/jumbo v8, "license ok"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 4917
    .end local v4    # "sp":Landroid/content/SharedPreferences;
    :cond_4
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v7, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$43(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    .line 4918
    const-string/jumbo v7, "license"

    const-string/jumbo v8, "license fail"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4919
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const-string/jumbo v8, "license"

    invoke-virtual {v7, v8, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 4920
    .restart local v4    # "sp":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string/jumbo v8, "licenseok"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0

    .line 4922
    .end local v2    # "errorcode":I
    .end local v4    # "sp":Landroid/content/SharedPreferences;
    :cond_5
    const-string/jumbo v7, "com.edutech.getadmin"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method
