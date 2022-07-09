.class Lcom/edutech/appmanage/MainActivity$13;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity;->parse(Ljava/lang/String;)V
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$13;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 788
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 793
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 795
    new-instance v1, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    .line 796
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 797
    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 798
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 799
    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "icon"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 795
    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 800
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 801
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 803
    :cond_0
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    if-lt v4, v5, :cond_1

    .line 818
    :goto_1
    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$13;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v5}, Lcom/edutech/appmanage/MainActivity;->access$22(Lcom/edutech/appmanage/MainActivity;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 826
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    if-lt v2, v5, :cond_3

    .line 849
    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$13;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v5, v5, Lcom/edutech/appmanage/MainActivity;->handler:Landroid/os/Handler;

    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$13;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity;->runnableUi:Ljava/lang/Runnable;

    invoke-virtual {v5, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 850
    return-void

    .line 806
    .end local v2    # "i":I
    :cond_1
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v5, v4}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v5, Lcom/edutech/appmanage/MainActivity$AppInfo;->iconurl:Ljava/lang/String;

    .line 807
    new-instance v5, Ljava/lang/StringBuilder;

    .line 808
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v7

    .line 809
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 810
    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 811
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 812
    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 813
    const-string/jumbo v7, "icon"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 814
    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 815
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v5, v4}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v5, v5, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 816
    const-string/jumbo v7, ".png"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 807
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 816
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$13;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 805
    invoke-static {v6, v5, v7}, Lcom/edutech/appmanage/HttpHelper;->httpDownload(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    .line 803
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 820
    :cond_2
    const-wide/16 v6, 0x1f4

    :try_start_0
    invoke-static {v6, v7}, Lcom/edutech/appmanage/MainActivity$13;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 821
    :catch_0
    move-exception v0

    .line 823
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_1

    .line 827
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .restart local v2    # "i":I
    :cond_3
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_3
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    if-lt v3, v5, :cond_4

    .line 826
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_2

    .line 828
    :cond_4
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v5, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v5, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 829
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist_local:Ljava/util/LinkedList;

    invoke-virtual {v5, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v5, v5, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 831
    :try_start_1
    sget-object v5, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v5, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$13;->this$0:Lcom/edutech/appmanage/MainActivity;

    new-instance v6, Ljava/lang/StringBuilder;

    .line 832
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    .line 833
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 834
    sget-char v8, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 835
    sget-object v8, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 836
    sget-char v8, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 837
    const-string/jumbo v8, "icon"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 838
    sget-char v8, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 839
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 840
    const-string/jumbo v8, ".png"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 831
    invoke-virtual {v7, v6}, Lcom/edutech/appmanage/MainActivity;->getImageDrawable(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v6

    iput-object v6, v5, Lcom/edutech/appmanage/MainActivity$AppInfo;->appicon:Landroid/graphics/drawable/Drawable;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    .line 841
    :catch_1
    move-exception v0

    .line 843
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 827
    .end local v0    # "e":Ljava/io/IOException;
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_3
.end method
