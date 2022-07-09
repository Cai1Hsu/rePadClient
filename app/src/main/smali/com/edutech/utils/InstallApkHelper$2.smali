.class Lcom/edutech/utils/InstallApkHelper$2;
.super Landroid/content/BroadcastReceiver;
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
    iput-object p1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    .line 267
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    .line 272
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 274
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 277
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 279
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 281
    :cond_0
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 284
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$3(Lcom/edutech/utils/InstallApkHelper;)Ljava/lang/Thread;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 285
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1, v5}, Lcom/edutech/utils/InstallApkHelper;->access$4(Lcom/edutech/utils/InstallApkHelper;Ljava/lang/Thread;)V

    .line 286
    :cond_1
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;

    iget-object v4, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-direct {v3, v4, v5}, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;-><init>(Lcom/edutech/utils/InstallApkHelper;Lcom/edutech/utils/InstallApkHelper$InstallApkThread;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-static {v1, v2}, Lcom/edutech/utils/InstallApkHelper;->access$4(Lcom/edutech/utils/InstallApkHelper;Ljava/lang/Thread;)V

    .line 287
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$2;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$3(Lcom/edutech/utils/InstallApkHelper;)Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 290
    :cond_2
    return-void
.end method
