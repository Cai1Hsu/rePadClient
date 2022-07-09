.class public Lcom/edutech/utils/MoniterServiceHelper;
.super Ljava/lang/Object;
.source "MoniterServiceHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;
    }
.end annotation


# instance fields
.field private isrun:Z

.field private mContext:Landroid/content/Context;

.field private serviceName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/edutech/utils/MoniterServiceHelper;->isrun:Z

    .line 17
    iput-object p1, p0, Lcom/edutech/utils/MoniterServiceHelper;->serviceName:Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lcom/edutech/utils/MoniterServiceHelper;->mContext:Landroid/content/Context;

    .line 19
    return-void
.end method

.method static synthetic access$0(Lcom/edutech/utils/MoniterServiceHelper;)Z
    .locals 1

    .prologue
    .line 14
    iget-boolean v0, p0, Lcom/edutech/utils/MoniterServiceHelper;->isrun:Z

    return v0
.end method

.method static synthetic access$1(Lcom/edutech/utils/MoniterServiceHelper;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, Lcom/edutech/utils/MoniterServiceHelper;->serviceName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/edutech/utils/MoniterServiceHelper;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/edutech/utils/MoniterServiceHelper;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public isServiceRunning(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 4
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    iget-object v2, p0, Lcom/edutech/utils/MoniterServiceHelper;->mContext:Landroid/content/Context;

    const-string/jumbo v3, "activity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 55
    .local v0, "manager":Landroid/app/ActivityManager;
    const v2, 0x7fffffff

    invoke-virtual {v0, v2}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 60
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 55
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 56
    .local v1, "service":Landroid/app/ActivityManager$RunningServiceInfo;
    iget-object v3, v1, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 57
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public startMoniter()V
    .locals 3

    .prologue
    .line 22
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/edutech/utils/MoniterServiceHelper;->isrun:Z

    .line 23
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;-><init>(Lcom/edutech/utils/MoniterServiceHelper;Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 24
    return-void
.end method

.method public stopMoniter()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/edutech/utils/MoniterServiceHelper;->isrun:Z

    .line 28
    return-void
.end method
