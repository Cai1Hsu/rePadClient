.class Lcom/edutech/appmanage/DownLoadManage$1;
.super Ljava/lang/Object;
.source "DownLoadManage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/DownLoadManage;
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
    iput-object p1, p0, Lcom/edutech/appmanage/DownLoadManage$1;->this$0:Lcom/edutech/appmanage/DownLoadManage;

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage$1;->this$0:Lcom/edutech/appmanage/DownLoadManage;

    invoke-static {v0}, Lcom/edutech/appmanage/DownLoadManage;->access$0(Lcom/edutech/appmanage/DownLoadManage;)Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->notifyDataSetChanged()V

    .line 82
    sget-object v0, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 83
    sget-object v0, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage$1;->this$0:Lcom/edutech/appmanage/DownLoadManage;

    invoke-static {v0}, Lcom/edutech/appmanage/DownLoadManage;->access$1(Lcom/edutech/appmanage/DownLoadManage;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 86
    :cond_1
    return-void
.end method
