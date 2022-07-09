.class Lcom/edutech/appmanage/SilentUninstall_Service$1;
.super Ljava/lang/Thread;
.source "SilentUninstall_Service.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/SilentUninstall_Service;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/SilentUninstall_Service;

.field private final synthetic val$list:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/SilentUninstall_Service;Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/SilentUninstall_Service$1;->this$0:Lcom/edutech/appmanage/SilentUninstall_Service;

    iput-object p2, p0, Lcom/edutech/appmanage/SilentUninstall_Service$1;->val$list:Ljava/util/ArrayList;

    .line 36
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 41
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 43
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/edutech/appmanage/SilentUninstall_Service$1;->val$list:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 52
    iget-object v2, p0, Lcom/edutech/appmanage/SilentUninstall_Service$1;->this$0:Lcom/edutech/appmanage/SilentUninstall_Service;

    invoke-virtual {v2}, Lcom/edutech/appmanage/SilentUninstall_Service;->stopSelf()V

    .line 53
    return-void

    .line 46
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .line 47
    const-string/jumbo v2, "android.intent.action.apk_uninstall"

    .line 46
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 48
    .local v0, "apk_uninstall":Landroid/content/Intent;
    const-string/jumbo v3, "packagename"

    iget-object v2, p0, Lcom/edutech/appmanage/SilentUninstall_Service$1;->val$list:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    iget-object v2, p0, Lcom/edutech/appmanage/SilentUninstall_Service$1;->this$0:Lcom/edutech/appmanage/SilentUninstall_Service;

    invoke-virtual {v2, v0}, Lcom/edutech/appmanage/SilentUninstall_Service;->sendBroadcast(Landroid/content/Intent;)V

    .line 43
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
