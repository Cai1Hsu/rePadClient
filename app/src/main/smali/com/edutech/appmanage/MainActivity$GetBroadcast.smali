.class Lcom/edutech/appmanage/MainActivity$GetBroadcast;
.super Landroid/content/BroadcastReceiver;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GetBroadcast"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 2621
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$GetBroadcast;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 2625
    monitor-enter p0

    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v1, v2, v3

    .line 2628
    .local v1, "package_name":Ljava/lang/String;
    const-string/jumbo v2, "AppmanageMainActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2629
    const-string/jumbo v2, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2632
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    if-eqz v2, :cond_0

    .line 2633
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_0
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-lt v0, v2, :cond_3

    .line 2644
    .end local v0    # "j":I
    :cond_0
    :goto_1
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 2645
    const/4 v0, 0x0

    .restart local v0    # "j":I
    :goto_2
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_5

    .line 2663
    .end local v0    # "j":I
    :cond_1
    :goto_3
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$GetBroadcast;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->complete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2746
    :cond_2
    :goto_4
    monitor-exit p0

    return-void

    .line 2634
    .restart local v0    # "j":I
    :cond_3
    :try_start_1
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 2635
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2636
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->doing:Z

    .line 2637
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 2625
    .end local v0    # "j":I
    .end local v1    # "package_name":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 2633
    .restart local v0    # "j":I
    .restart local v1    # "package_name":Ljava/lang/String;
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2646
    :cond_5
    :try_start_2
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 2647
    const-string/jumbo v3, "packagename"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2646
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 2647
    if-eqz v2, :cond_6

    .line 2649
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$GetBroadcast;->this$0:Lcom/edutech/appmanage/MainActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    .line 2650
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 2651
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2652
    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2653
    sget-object v4, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2654
    const-string/jumbo v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2655
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 2656
    const-string/jumbo v5, "apkname"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2655
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2649
    invoke-virtual {v3, v2}, Lcom/edutech/appmanage/MainActivity;->deleteFile(Ljava/lang/String;)Z

    .line 2658
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto/16 :goto_3

    .line 2645
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 2664
    .end local v0    # "j":I
    :cond_7
    const-string/jumbo v2, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 2667
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    if-eqz v2, :cond_8

    .line 2668
    const/4 v0, 0x0

    .restart local v0    # "j":I
    :goto_5
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-lt v0, v2, :cond_a

    .line 2679
    .end local v0    # "j":I
    :cond_8
    :goto_6
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    if-eqz v2, :cond_9

    .line 2680
    const/4 v0, 0x0

    .restart local v0    # "j":I
    :goto_7
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_c

    .line 2690
    .end local v0    # "j":I
    :cond_9
    :goto_8
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$GetBroadcast;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->complete()V

    goto/16 :goto_4

    .line 2669
    .restart local v0    # "j":I
    :cond_a
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 2670
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 2671
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->doing:Z

    .line 2672
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    goto :goto_6

    .line 2668
    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 2681
    :cond_c
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 2682
    const-string/jumbo v3, "packagename"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2681
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 2682
    if-eqz v2, :cond_d

    .line 2685
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_8

    .line 2680
    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 2698
    .end local v0    # "j":I
    :cond_e
    const-string/jumbo v2, "android.intent.action.PACKAGE_REPLACED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2701
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    if-eqz v2, :cond_f

    .line 2702
    const/4 v0, 0x0

    .restart local v0    # "j":I
    :goto_9
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-lt v0, v2, :cond_11

    .line 2713
    .end local v0    # "j":I
    :cond_f
    :goto_a
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    if-eqz v2, :cond_10

    .line 2714
    const/4 v0, 0x0

    .restart local v0    # "j":I
    :goto_b
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_13

    .line 2732
    .end local v0    # "j":I
    :cond_10
    :goto_c
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$GetBroadcast;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->complete()V

    goto/16 :goto_4

    .line 2703
    .restart local v0    # "j":I
    :cond_11
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 2704
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 2705
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->doing:Z

    .line 2706
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->update:Z

    goto :goto_a

    .line 2702
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 2715
    :cond_13
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 2716
    const-string/jumbo v3, "packagename"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2715
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 2716
    if-eqz v2, :cond_14

    .line 2719
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$GetBroadcast;->this$0:Lcom/edutech/appmanage/MainActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    .line 2720
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 2721
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2722
    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2723
    sget-object v4, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2724
    const-string/jumbo v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2725
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 2726
    const-string/jumbo v5, "apkname"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2725
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2719
    invoke-virtual {v3, v2}, Lcom/edutech/appmanage/MainActivity;->deleteFile(Ljava/lang/String;)Z

    .line 2727
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_c

    .line 2714
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_b
.end method
