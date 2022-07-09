.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;
.super Landroid/content/BroadcastReceiver;
.source "CloudClientSetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InstallReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 4888
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "arg1"    # Landroid/content/Intent;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 4893
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    sget-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNewUpdate:Z

    if-eqz v5, :cond_0

    .line 4895
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-gtz v5, :cond_1

    .line 4927
    :cond_0
    :goto_0
    return-void

    .line 4899
    :cond_1
    const/4 v1, 0x1

    .line 4900
    .local v1, "hasFinishedUpdate":Z
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 4901
    .local v4, "uninstalledList":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    invoke-virtual {p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v3

    .line 4902
    .local v3, "packageName":Ljava/lang/String;
    const-string/jumbo v5, "package:"

    const-string/jumbo v6, ""

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 4903
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt v2, v5, :cond_2

    .line 4915
    if-eqz v1, :cond_5

    const-string/jumbo v5, "com.launcher.activity"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 4917
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 4918
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$6(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    goto :goto_0

    .line 4905
    :cond_2
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .line 4906
    .local v0, "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getPackagename()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 4908
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v7, 0x1012

    invoke-static {v5, v2, v6, v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$73(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;ILjava/lang/Object;I)V

    .line 4903
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4909
    :cond_4
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getInstallState()I

    move-result v5

    if-eq v5, v8, :cond_3

    .line 4911
    const/4 v1, 0x0

    .line 4912
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 4919
    .end local v0    # "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    :cond_5
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ne v5, v8, :cond_0

    const-string/jumbo v6, "com.launcher.activity"

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    invoke-virtual {v5}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getPackagename()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 4921
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$72(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 4923
    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const/4 v7, -0x1

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    invoke-virtual {v5}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkLocalPath()Ljava/lang/String;

    move-result-object v5

    const/16 v8, 0x1014

    invoke-static {v6, v7, v5, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$73(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;ILjava/lang/Object;I)V

    goto/16 :goto_0
.end method
