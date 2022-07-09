.class Lcom/edutech/appmanage/MainActivity$8;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$8;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 3230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 3233
    const/4 v0, 0x0

    .line 3235
    .local v0, "flag":Z
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "http://"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$8;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v5}, Lcom/edutech/appmanage/MainActivity;->access$0(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/api/config/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3236
    .local v3, "url":Ljava/lang/String;
    const-string/jumbo v4, "AppmanageMainActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "URL:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3239
    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$8;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$8;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v5}, Lcom/edutech/appmanage/MainActivity;->access$15(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v3, v5}, Lcom/edutech/appmanage/MainActivity;->access$16(Lcom/edutech/appmanage/MainActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3240
    .local v2, "result":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 3241
    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$8;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v4, v2}, Lcom/edutech/appmanage/MainActivity;->access$17(Lcom/edutech/appmanage/MainActivity;Ljava/lang/String;)Z

    move-result v0

    .line 3243
    :cond_0
    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$8;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v4, v4, Lcom/edutech/appmanage/MainActivity;->getMarkertHandler:Landroid/os/Handler;

    invoke-virtual {v4}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 3244
    .local v1, "msg":Landroid/os/Message;
    const/4 v4, 0x1

    iput v4, v1, Landroid/os/Message;->what:I

    .line 3245
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 3248
    return-void
.end method
