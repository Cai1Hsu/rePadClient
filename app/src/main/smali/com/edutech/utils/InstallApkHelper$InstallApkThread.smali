.class Lcom/edutech/utils/InstallApkHelper$InstallApkThread;
.super Ljava/lang/Object;
.source "InstallApkHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/utils/InstallApkHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InstallApkThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/utils/InstallApkHelper;


# direct methods
.method private constructor <init>(Lcom/edutech/utils/InstallApkHelper;)V
    .locals 0

    .prologue
    .line 109
    iput-object p1, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/edutech/utils/InstallApkHelper;Lcom/edutech/utils/InstallApkHelper$InstallApkThread;)V
    .locals 0

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;-><init>(Lcom/edutech/utils/InstallApkHelper;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 114
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 129
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "DISABLEAPKINSTALLLOCK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 130
    .local v0, "intentDisApkLck":Landroid/content/Intent;
    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$0(Lcom/edutech/utils/InstallApkHelper;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 132
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "N5110ZB"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, ".T360Z"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_1

    .line 133
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$0(Lcom/edutech/utils/InstallApkHelper;)Landroid/content/Context;

    move-result-object v3

    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v2, v3, v1}, Lcom/edutech/utils/InstallApkHelper;->access$5(Lcom/edutech/utils/InstallApkHelper;Landroid/content/Context;Ljava/lang/String;)V

    .line 140
    .end local v0    # "intentDisApkLck":Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 135
    .restart local v0    # "intentDisApkLck":Landroid/content/Intent;
    :cond_1
    iget-object v2, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$0(Lcom/edutech/utils/InstallApkHelper;)Landroid/content/Context;

    move-result-object v3

    iget-object v1, p0, Lcom/edutech/utils/InstallApkHelper$InstallApkThread;->this$0:Lcom/edutech/utils/InstallApkHelper;

    invoke-static {v1}, Lcom/edutech/utils/InstallApkHelper;->access$1(Lcom/edutech/utils/InstallApkHelper;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v2, v3, v1}, Lcom/edutech/utils/InstallApkHelper;->access$6(Lcom/edutech/utils/InstallApkHelper;Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method
