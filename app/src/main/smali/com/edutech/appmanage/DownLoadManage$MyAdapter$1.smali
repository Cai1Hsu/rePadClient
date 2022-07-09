.class Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;
.super Ljava/lang/Object;
.source "DownLoadManage.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

.field private final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/DownLoadManage$MyAdapter;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;->this$1:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    iput p2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;->val$position:I

    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 283
    sget-object v1, Lcom/edutech/appmanage/MainActivity;->downloadManager:Landroid/app/DownloadManager;

    const/4 v0, 0x1

    new-array v2, v0, [J

    const/4 v3, 0x0

    .line 284
    sget-object v0, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 285
    iget v4, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;->val$position:I

    .line 284
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 285
    const-string/jumbo v4, "downid"

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 284
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    aput-wide v4, v2, v3

    invoke-virtual {v1, v2}, Landroid/app/DownloadManager;->remove([J)I

    .line 286
    sget-object v0, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    iget v1, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;->val$position:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 287
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;->this$1:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    invoke-static {v0}, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->access$0(Lcom/edutech/appmanage/DownLoadManage$MyAdapter;)Lcom/edutech/appmanage/DownLoadManage;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/appmanage/DownLoadManage;->access$2(Lcom/edutech/appmanage/DownLoadManage;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;->this$1:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->access$0(Lcom/edutech/appmanage/DownLoadManage$MyAdapter;)Lcom/edutech/appmanage/DownLoadManage;

    move-result-object v1

    iget-object v1, v1, Lcom/edutech/appmanage/DownLoadManage;->runnableUi:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 288
    return-void
.end method
