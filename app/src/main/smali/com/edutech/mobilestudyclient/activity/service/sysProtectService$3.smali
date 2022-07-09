.class Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;
.super Landroid/content/BroadcastReceiver;
.source "sysProtectService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    .line 511
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 515
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 516
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v8, "NetworkService"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "action = "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    const-string/jumbo v8, "PASSWDPASS"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 518
    const/4 v8, 0x0

    sput-boolean v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flag:Z

    .line 616
    :cond_0
    :goto_0
    return-void

    .line 519
    :cond_1
    const-string/jumbo v8, "android.intent.action.STATUSBAR_INVISIBILITY"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 521
    const/4 v8, 0x1

    sput-boolean v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isInteraction:Z

    goto :goto_0

    .line 522
    :cond_2
    const-string/jumbo v8, "android.intent.action.STATUSBAR_VISIBILITY"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 524
    const/4 v8, 0x0

    sput-boolean v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isInteraction:Z

    goto :goto_0

    .line 525
    :cond_3
    const-string/jumbo v8, "android.intent.action.mdm"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 528
    const-string/jumbo v8, "ENTERPASS"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 530
    const/4 v8, 0x1

    sput-boolean v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flag:Z

    goto :goto_0

    .line 531
    :cond_4
    const-string/jumbo v8, "com.edutech.install"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 533
    const/4 v8, 0x0

    sput-boolean v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flag:Z

    goto :goto_0

    .line 534
    :cond_5
    const-string/jumbo v8, "com.launch.install"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 536
    const-string/jumbo v8, "apkpath"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 539
    .local v4, "path":Ljava/lang/String;
    const-string/jumbo v8, "packagename"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 540
    .local v3, "packageName":Ljava/lang/String;
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;

    move-result-object v8

    if-nez v8, :cond_6

    .line 542
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v8, v9}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$3(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/util/List;)V

    .line 544
    :cond_6
    if-eqz v3, :cond_7

    const-string/jumbo v8, ""

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 546
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 550
    :cond_7
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8, v4}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$4(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 551
    .end local v3    # "packageName":Ljava/lang/String;
    .end local v4    # "path":Ljava/lang/String;
    :cond_8
    const-string/jumbo v8, "com.launch.uninstall"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 553
    const-string/jumbo v8, "packagename"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 554
    .restart local v3    # "packageName":Ljava/lang/String;
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v3, v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->uninstall(Ljava/lang/String;Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 556
    .end local v3    # "packageName":Ljava/lang/String;
    :cond_9
    const-string/jumbo v8, "com.launch.addapks"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 560
    const-string/jumbo v8, "packages"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    .line 561
    .local v5, "pkgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;

    move-result-object v8

    if-nez v8, :cond_a

    .line 563
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v8, v9}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$3(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/util/List;)V

    .line 565
    :cond_a
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_0

    .line 569
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    :try_start_0
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v2, v8, :cond_0

    .line 571
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;

    move-result-object v8

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_b

    .line 573
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;

    move-result-object v9

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 569
    :cond_b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 581
    .end local v2    # "i":I
    .end local v5    # "pkgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_c
    const-string/jumbo v8, "com.edutech.design"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 583
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const-string/jumbo v9, "design"

    const/4 v10, 0x4

    invoke-virtual {v8, v9, v10}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 584
    .local v6, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string/jumbo v9, "usedesign"

    const/4 v10, 0x1

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0

    .line 585
    .end local v6    # "sp":Landroid/content/SharedPreferences;
    :cond_d
    const-string/jumbo v8, "com.edutech.restarttimer"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_10

    .line 586
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$5(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/Timer;

    move-result-object v8

    if-eqz v8, :cond_e

    .line 588
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    iget-object v8, v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->lockTask:Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;

    invoke-virtual {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->cancel()Z

    .line 589
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$5(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/Timer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Timer;->cancel()V

    .line 590
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$5(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/Timer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Timer;->purge()I

    .line 591
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$6(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/util/Timer;)V

    .line 592
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const/4 v9, 0x0

    iput-object v9, v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->lockTask:Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;

    .line 594
    :cond_e
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$7(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/Timer;

    move-result-object v8

    if-eqz v8, :cond_f

    .line 596
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    iget-object v8, v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->logUploadTask:Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

    invoke-virtual {v8}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->cancel()Z

    .line 597
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$7(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/Timer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Timer;->cancel()V

    .line 598
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$7(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/Timer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Timer;->purge()I

    .line 599
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$8(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/util/Timer;)V

    .line 600
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const/4 v9, 0x0

    iput-object v9, v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->logUploadTask:Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

    .line 602
    :cond_f
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$9(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V

    goto/16 :goto_0

    .line 603
    :cond_10
    const-string/jumbo v8, "com.edutech.liveshow.on"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 604
    const/4 v8, 0x1

    sput-boolean v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isLiveShow:Z

    .line 605
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const-string/jumbo v9, "livemode"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 606
    .local v7, "tempSp":Landroid/content/SharedPreferences;
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string/jumbo v9, "islive"

    const/4 v10, 0x1

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 607
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 608
    .local v1, "closeFloat":Landroid/content/Intent;
    const-string/jumbo v8, "android.yj.hide.floatview"

    invoke-virtual {v1, v8}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 609
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v8, v1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 610
    .end local v1    # "closeFloat":Landroid/content/Intent;
    .end local v7    # "tempSp":Landroid/content/SharedPreferences;
    :cond_11
    const-string/jumbo v8, "com.edutech.liveshow.off"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 611
    const/4 v8, 0x0

    sput-boolean v8, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isLiveShow:Z

    .line 612
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const-string/jumbo v9, "livemode"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 613
    .restart local v7    # "tempSp":Landroid/content/SharedPreferences;
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string/jumbo v9, "islive"

    const/4 v10, 0x0

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0

    .line 576
    .end local v7    # "tempSp":Landroid/content/SharedPreferences;
    .restart local v2    # "i":I
    .restart local v5    # "pkgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v8

    goto/16 :goto_0
.end method
