.class Lcom/edutech/appmanage/MainActivity$7;
.super Landroid/os/Handler;
.source "MainActivity.java"


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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$7;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 3171
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/edutech/appmanage/MainActivity$7;)Lcom/edutech/appmanage/MainActivity;
    .locals 1

    .prologue
    .line 3171
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$7;->this$0:Lcom/edutech/appmanage/MainActivity;

    return-object v0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 3177
    iget v1, p1, Landroid/os/Message;->what:I

    invoke-static {}, Lcom/edutech/appmanage/MainActivity;->access$13()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 3178
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 3179
    .local v0, "path":Ljava/lang/String;
    const-string/jumbo v1, "AppmanageMainActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "path-->"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3181
    new-instance v1, Lcom/edutech/appmanage/MainActivity$7$1;

    invoke-direct {v1, p0, v0}, Lcom/edutech/appmanage/MainActivity$7$1;-><init>(Lcom/edutech/appmanage/MainActivity$7;Ljava/lang/String;)V

    .line 3192
    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity$7$1;->start()V

    .line 3216
    .end local v0    # "path":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 3217
    return-void

    .line 3193
    :cond_1
    iget v1, p1, Landroid/os/Message;->what:I

    invoke-static {}, Lcom/edutech/appmanage/MainActivity;->access$14()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 3194
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 3195
    .restart local v0    # "path":Ljava/lang/String;
    const-string/jumbo v1, "AppmanageMainActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "path-->"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3197
    new-instance v1, Lcom/edutech/appmanage/MainActivity$7$2;

    invoke-direct {v1, p0, v0}, Lcom/edutech/appmanage/MainActivity$7$2;-><init>(Lcom/edutech/appmanage/MainActivity$7;Ljava/lang/String;)V

    .line 3207
    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity$7$2;->start()V

    goto :goto_0
.end method
