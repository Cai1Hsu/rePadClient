.class Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

.field private final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->val$context:Landroid/content/Context;

    .line 2784
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized run()V
    .locals 14

    .prologue
    .line 2789
    monitor-enter p0

    :try_start_0
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 2792
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iget-wide v2, v9, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->completeDownloadId:J

    .line 2793
    .local v2, "id":J
    const-string/jumbo v9, "AppmanageMainActivity"

    .line 2794
    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "2618---aaa  :"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2795
    sget-object v11, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 2794
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 2793
    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2796
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lt v1, v9, :cond_1

    .line 3064
    :cond_0
    :goto_1
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v9

    invoke-virtual {v9}, Lcom/edutech/appmanage/MainActivity;->complete()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3065
    monitor-exit p0

    return-void

    .line 2797
    :cond_1
    :try_start_1
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    .line 2798
    const-string/jumbo v10, "downid"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    .line 2797
    cmp-long v9, v2, v10

    if-nez v9, :cond_b

    .line 2799
    sget-object v9, Lcom/edutech/appmanage/MainActivity;->downloadManager:Landroid/app/DownloadManager;

    const/4 v10, 0x1

    new-array v10, v10, [J

    const/4 v11, 0x0

    aput-wide v2, v10, v11

    invoke-virtual {v9, v10}, Landroid/app/DownloadManager;->remove([J)I

    .line 2800
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    .line 2801
    const-string/jumbo v10, "setuped"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    .line 2800
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    .line 2801
    if-nez v9, :cond_0

    .line 2804
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    .line 2805
    const-string/jumbo v10, "setuped"

    const/4 v11, 0x1

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    .line 2804
    invoke-interface {v9, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2806
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 2807
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    const-string/jumbo v10, "position"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    .line 2806
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 2808
    .local v7, "num":I
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 2809
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    const-string/jumbo v10, "type"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    .line 2808
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 2811
    .local v8, "type":I
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    .line 2812
    const-string/jumbo v10, "apkname"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 2813
    .local v6, "name":Ljava/lang/String;
    const-string/jumbo v9, "AppmanageMainActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "2638---name--->"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2814
    const-string/jumbo v9, "AppmanageMainActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "2639---type--->"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2815
    const/4 v9, 0x1

    if-ne v9, v8, :cond_6

    .line 2825
    new-instance v0, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    .line 2826
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    .line 2827
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2828
    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2829
    sget-object v10, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2830
    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2825
    invoke-direct {v0, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2832
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 2833
    const-wide/16 v10, 0x0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v12

    cmp-long v9, v10, v12

    if-nez v9, :cond_3

    .line 2834
    :cond_2
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->val$context:Landroid/content/Context;

    iput-object v10, v9, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->mycontext:Landroid/content/Context;

    .line 2835
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iget-object v9, v9, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->handler:Landroid/os/Handler;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 2877
    :goto_2
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_3
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 2878
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 2877
    if-lt v4, v9, :cond_4

    .line 2901
    :goto_4
    sget-object v9, Lcom/edutech/appmanage/MainActivity;->delete_apkfile:Ljava/util/ArrayList;

    .line 2902
    new-instance v10, Ljava/lang/StringBuilder;

    .line 2903
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v11

    .line 2904
    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2905
    sget-char v11, Ljava/io/File;->separatorChar:C

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 2906
    sget-object v11, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 2907
    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 2902
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    .line 2907
    if-nez v9, :cond_0

    .line 2908
    sget-object v9, Lcom/edutech/appmanage/MainActivity;->delete_apkfile:Ljava/util/ArrayList;

    .line 2909
    new-instance v10, Ljava/lang/StringBuilder;

    .line 2910
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v11

    .line 2911
    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2912
    sget-char v11, Ljava/io/File;->separatorChar:C

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 2913
    sget-object v11, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 2914
    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 2909
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1

    .line 2789
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "i":I
    .end local v2    # "id":J
    .end local v4    # "j":I
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "num":I
    .end local v8    # "type":I
    :catchall_0
    move-exception v9

    monitor-exit p0

    throw v9

    .line 2851
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "i":I
    .restart local v2    # "id":J
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v7    # "num":I
    .restart local v8    # "type":I
    :cond_3
    :try_start_2
    const-string/jumbo v9, "AppmanageMainActivity"

    const-string/jumbo v10, "2671"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2866
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v9

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity;->access$21(Lcom/edutech/appmanage/MainActivity;)Landroid/os/Handler;

    move-result-object v9

    .line 2867
    invoke-virtual {v9}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v5

    .line 2868
    .local v5, "message":Landroid/os/Message;
    invoke-static {}, Lcom/edutech/appmanage/MainActivity;->access$13()I

    move-result v9

    iput v9, v5, Landroid/os/Message;->what:I

    .line 2869
    new-instance v9, Ljava/lang/StringBuilder;

    .line 2870
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    .line 2871
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2872
    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2873
    sget-object v10, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2874
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2869
    iput-object v9, v5, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2875
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v9

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity;->access$21(Lcom/edutech/appmanage/MainActivity;)Landroid/os/Handler;

    move-result-object v9

    invoke-virtual {v9, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_2

    .line 2879
    .end local v5    # "message":Landroid/os/Message;
    .restart local v4    # "j":I
    :cond_4
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 2880
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    const-string/jumbo v10, "apkname"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 2881
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2879
    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    .line 2881
    if-eqz v9, :cond_5

    .line 2883
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 2884
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto/16 :goto_4

    .line 2878
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_3

    .line 2947
    .end local v0    # "file":Ljava/io/File;
    .end local v4    # "j":I
    :cond_6
    if-nez v8, :cond_0

    .line 2948
    sget-object v9, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 2949
    invoke-virtual {v9, v7}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v9, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 2950
    new-instance v0, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    .line 2951
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    .line 2952
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2953
    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2954
    sget-object v10, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2955
    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2950
    invoke-direct {v0, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2957
    .restart local v0    # "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 2958
    const-wide/16 v10, 0x0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v12

    cmp-long v9, v10, v12

    if-nez v9, :cond_8

    .line 2959
    :cond_7
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iget-object v10, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->val$context:Landroid/content/Context;

    iput-object v10, v9, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->mycontext:Landroid/content/Context;

    .line 2961
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    iget-object v9, v9, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->handler:Landroid/os/Handler;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 3003
    :goto_5
    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_6
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 3004
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 3003
    if-lt v4, v9, :cond_9

    .line 3020
    :goto_7
    sget-object v9, Lcom/edutech/appmanage/MainActivity;->delete_apkfile:Ljava/util/ArrayList;

    .line 3021
    new-instance v10, Ljava/lang/StringBuilder;

    .line 3022
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v11

    .line 3023
    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3024
    sget-char v11, Ljava/io/File;->separatorChar:C

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 3025
    sget-object v11, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 3026
    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 3021
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    .line 3026
    if-nez v9, :cond_0

    .line 3027
    sget-object v9, Lcom/edutech/appmanage/MainActivity;->delete_apkfile:Ljava/util/ArrayList;

    .line 3028
    new-instance v10, Ljava/lang/StringBuilder;

    .line 3029
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v11

    .line 3030
    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3031
    sget-char v11, Ljava/io/File;->separatorChar:C

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 3032
    sget-object v11, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 3033
    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 3028
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 2977
    .end local v4    # "j":I
    :cond_8
    const-string/jumbo v9, "AppmanageMainActivity"

    const-string/jumbo v10, "2782"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2992
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v9

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity;->access$21(Lcom/edutech/appmanage/MainActivity;)Landroid/os/Handler;

    move-result-object v9

    .line 2993
    invoke-virtual {v9}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v5

    .line 2994
    .restart local v5    # "message":Landroid/os/Message;
    const/4 v9, 0x0

    iput v9, v5, Landroid/os/Message;->what:I

    .line 2995
    new-instance v9, Ljava/lang/StringBuilder;

    .line 2996
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    .line 2997
    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2998
    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2999
    sget-object v10, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 3000
    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 2995
    iput-object v9, v5, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3001
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->this$1:Lcom/edutech/appmanage/MainActivity$CompleteReceiver;

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v9

    invoke-static {v9}, Lcom/edutech/appmanage/MainActivity;->access$21(Lcom/edutech/appmanage/MainActivity;)Landroid/os/Handler;

    move-result-object v9

    invoke-virtual {v9, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_5

    .line 3005
    .end local v5    # "message":Landroid/os/Message;
    .restart local v4    # "j":I
    :cond_9
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 3006
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    const-string/jumbo v10, "apkname"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 3007
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 3005
    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    .line 3007
    if-eqz v9, :cond_a

    .line 3009
    sget-object v9, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 3010
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_7

    .line 3004
    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_6

    .line 2796
    .end local v0    # "file":Ljava/io/File;
    .end local v4    # "j":I
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "num":I
    .end local v8    # "type":I
    :cond_b
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0
.end method
