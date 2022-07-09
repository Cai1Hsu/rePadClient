.class Lcom/edutech/appmanage/MainActivity$CompleteReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CompleteReceiver"
.end annotation


# instance fields
.field completeDownloadId:J

.field handler:Landroid/os/Handler;

.field mycontext:Landroid/content/Context;

.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 2

    .prologue
    .line 2754
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2755
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->completeDownloadId:J

    .line 3132
    new-instance v0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$1;-><init>(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)V

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->handler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$0(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;)Lcom/edutech/appmanage/MainActivity;
    .locals 1

    .prologue
    .line 2754
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->this$0:Lcom/edutech/appmanage/MainActivity;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 2761
    monitor-enter p0

    :try_start_0
    const-string/jumbo v5, "AppmanageMainActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "2586---RECEIVICE"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2762
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    .line 2763
    const-string/jumbo v6, "android.intent.action.DOWNLOAD_COMPLETE"

    .line 2762
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 2763
    if-eqz v5, :cond_0

    .line 2764
    iget-wide v6, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->completeDownloadId:J

    .line 2765
    const-string/jumbo v5, "extra_download_id"

    const-wide/16 v8, -0x1

    .line 2764
    invoke-virtual {p2, v5, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-eqz v5, :cond_0

    .line 2768
    const-string/jumbo v5, "extra_download_id"

    const-wide/16 v6, -0x1

    .line 2767
    invoke-virtual {p2, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->completeDownloadId:J

    .line 2772
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->downloadManagerPro:Lcom/edutech/appmanage/utils/DownloadManagerPro;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v5, :cond_1

    .line 3105
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 2777
    :cond_1
    :try_start_1
    const-string/jumbo v5, "AppmanageMainActivity"

    .line 2778
    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "2603---RECEIVICE"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2779
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->downloadManagerPro:Lcom/edutech/appmanage/utils/DownloadManagerPro;

    .line 2780
    iget-wide v8, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->completeDownloadId:J

    invoke-virtual {v7, v8, v9}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getStatusById(J)I

    move-result v7

    .line 2779
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 2778
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2777
    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2781
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->downloadManagerPro:Lcom/edutech/appmanage/utils/DownloadManagerPro;

    .line 2782
    iget-wide v6, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->completeDownloadId:J

    invoke-virtual {v5, v6, v7}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getStatusById(J)I

    move-result v5

    const/16 v6, 0x8

    .line 2781
    if-ne v5, v6, :cond_2

    .line 2784
    new-instance v5, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;

    invoke-direct {v5, p0, p1}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;-><init>(Lcom/edutech/appmanage/MainActivity$CompleteReceiver;Landroid/content/Context;)V

    .line 3066
    invoke-virtual {v5}, Lcom/edutech/appmanage/MainActivity$CompleteReceiver$2;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2761
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 3067
    :cond_2
    :try_start_2
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->downloadManagerPro:Lcom/edutech/appmanage/utils/DownloadManagerPro;

    .line 3068
    iget-wide v6, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->completeDownloadId:J

    invoke-virtual {v5, v6, v7}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getStatusById(J)I

    move-result v5

    const/4 v6, 0x4

    if-eq v5, v6, :cond_0

    .line 3069
    iget-wide v2, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->completeDownloadId:J

    .line 3070
    .local v2, "id":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    sget-object v5, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v0, v5, :cond_4

    .line 3102
    :cond_3
    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v5}, Lcom/edutech/appmanage/MainActivity;->complete()V

    goto :goto_0

    .line 3071
    :cond_4
    sget-object v5, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 3072
    const-string/jumbo v6, "downid"

    .line 3071
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v5, v2, v6

    if-nez v5, :cond_5

    .line 3073
    sget-object v5, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 3074
    const-string/jumbo v6, "setuped"

    .line 3073
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    .line 3074
    if-nez v5, :cond_3

    .line 3078
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->mycontext:Landroid/content/Context;

    .line 3079
    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$CompleteReceiver;->handler:Landroid/os/Handler;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 3081
    sget-object v5, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 3082
    const-string/jumbo v6, "apkname"

    .line 3081
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 3083
    .local v4, "name":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2
    sget-object v5, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v1, v5, :cond_6

    .line 3092
    :goto_3
    const/4 v1, 0x0

    :goto_4
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 3093
    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    .line 3092
    if-lt v1, v5, :cond_8

    .line 3070
    .end local v1    # "j":I
    .end local v4    # "name":Ljava/lang/String;
    :cond_5
    :goto_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3084
    .restart local v1    # "j":I
    .restart local v4    # "name":Ljava/lang/String;
    :cond_6
    sget-object v5, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 3085
    const-string/jumbo v6, "apkname"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 3084
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 3085
    if-eqz v5, :cond_7

    .line 3088
    sget-object v5, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_3

    .line 3083
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 3094
    :cond_8
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v5, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v5, v5, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 3095
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 3096
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v5, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/appmanage/MainActivity$AppInfo;

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/edutech/appmanage/MainActivity$AppInfo;->doing:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_5

    .line 3093
    :cond_9
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method
