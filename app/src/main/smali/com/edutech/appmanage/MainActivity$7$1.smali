.class Lcom/edutech/appmanage/MainActivity$7$1;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity$7;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/edutech/appmanage/MainActivity$7;

.field private final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$7;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$7$1;->this$1:Lcom/edutech/appmanage/MainActivity$7;

    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$7$1;->val$path:Ljava/lang/String;

    .line 3181
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 3183
    const-string/jumbo v0, "AppmanageMainActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "path-->"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$7$1;->val$path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3185
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$7$1;->val$path:Ljava/lang/String;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$7$1;->this$1:Lcom/edutech/appmanage/MainActivity$7;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$7;->access$0(Lcom/edutech/appmanage/MainActivity$7;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edutech/appmanage/utils/ApkController;->install(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3188
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$7$1;->this$1:Lcom/edutech/appmanage/MainActivity$7;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity$7;->access$0(Lcom/edutech/appmanage/MainActivity$7;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$7$1;->this$1:Lcom/edutech/appmanage/MainActivity$7;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$7;->access$0(Lcom/edutech/appmanage/MainActivity$7;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 3189
    const v2, 0x7f0801b2

    .line 3188
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/edutech/appmanage/MainActivity;->toast(Ljava/lang/String;)V

    .line 3191
    :cond_0
    return-void
.end method
