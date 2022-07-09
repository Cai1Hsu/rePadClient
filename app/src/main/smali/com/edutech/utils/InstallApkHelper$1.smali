.class Lcom/edutech/utils/InstallApkHelper$1;
.super Landroid/os/Handler;
.source "InstallApkHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/utils/InstallApkHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/utils/InstallApkHelper;


# direct methods
.method constructor <init>(Lcom/edutech/utils/InstallApkHelper;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/utils/InstallApkHelper$1;->this$0:Lcom/edutech/utils/InstallApkHelper;

    .line 254
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 256
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 265
    :goto_0
    return-void

    .line 259
    :pswitch_0
    iget-object v0, p0, Lcom/edutech/utils/InstallApkHelper$1;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v0}, Lcom/edutech/utils/InstallApkHelper;->access$0(Lcom/edutech/utils/InstallApkHelper;)Landroid/content/Context;

    move-result-object v1

    iget-object v0, p0, Lcom/edutech/utils/InstallApkHelper$1;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v0}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper$1;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v2}, Lcom/edutech/utils/InstallApkHelper;->access$2(Lcom/edutech/utils/InstallApkHelper;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/edutech/utils/InstallApkUtil;->InstallApk(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 256
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
