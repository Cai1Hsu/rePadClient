.class Lcom/edutech/appmanage/DownLoadManage$2;
.super Ljava/lang/Thread;
.source "DownLoadManage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/DownLoadManage;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/DownLoadManage;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/DownLoadManage;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/DownLoadManage$2;->this$0:Lcom/edutech/appmanage/DownLoadManage;

    .line 56
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 61
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 62
    :goto_0
    sget-object v1, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 71
    return-void

    .line 64
    :cond_0
    const-wide/16 v2, 0x3e8

    :try_start_0
    invoke-static {v2, v3}, Lcom/edutech/appmanage/DownLoadManage$2;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :goto_1
    iget-object v1, p0, Lcom/edutech/appmanage/DownLoadManage$2;->this$0:Lcom/edutech/appmanage/DownLoadManage;

    invoke-static {v1}, Lcom/edutech/appmanage/DownLoadManage;->access$2(Lcom/edutech/appmanage/DownLoadManage;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$2;->this$0:Lcom/edutech/appmanage/DownLoadManage;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage;->runnableUi:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 65
    :catch_0
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method
