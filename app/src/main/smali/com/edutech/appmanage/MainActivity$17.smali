.class Lcom/edutech/appmanage/MainActivity$17;
.super Ljava/util/TimerTask;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity;->startTimer()V
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$17;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 2085
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 2088
    invoke-static {}, Lcom/edutech/appmanage/MainActivity;->access$26()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$27(I)V

    .line 2089
    const-string/jumbo v0, "AppmanageMainActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/edutech/appmanage/MainActivity;->access$26()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2090
    const/16 v0, 0x1e

    invoke-static {}, Lcom/edutech/appmanage/MainActivity;->access$26()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 2091
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$17;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 2092
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$17;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v0, v0, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 2094
    :cond_0
    return-void
.end method
