.class public Lcom/edutech/appmanage/SilentUninstall_Service;
.super Landroid/app/Service;
.source "SilentUninstall_Service.java"


# instance fields
.field private first:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/edutech/appmanage/SilentUninstall_Service;->first:Z

    .line 16
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 23
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 63
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/edutech/appmanage/SilentUninstall_Service;->first:Z

    .line 66
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 30
    iget-boolean v1, p0, Lcom/edutech/appmanage/SilentUninstall_Service;->first:Z

    if-nez v1, :cond_0

    .line 31
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v1

    .line 57
    :goto_0
    return v1

    .line 35
    :cond_0
    const-string/jumbo v1, "uninstall_list"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 36
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Lcom/edutech/appmanage/SilentUninstall_Service$1;

    invoke-direct {v1, p0, v0}, Lcom/edutech/appmanage/SilentUninstall_Service$1;-><init>(Lcom/edutech/appmanage/SilentUninstall_Service;Ljava/util/ArrayList;)V

    .line 54
    invoke-virtual {v1}, Lcom/edutech/appmanage/SilentUninstall_Service$1;->start()V

    .line 56
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/edutech/appmanage/SilentUninstall_Service;->first:Z

    .line 57
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v1

    goto :goto_0
.end method
