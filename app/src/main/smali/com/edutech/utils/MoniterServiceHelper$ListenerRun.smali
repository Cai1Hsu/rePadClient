.class Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;
.super Ljava/lang/Object;
.source "MoniterServiceHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/utils/MoniterServiceHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ListenerRun"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/utils/MoniterServiceHelper;


# direct methods
.method private constructor <init>(Lcom/edutech/utils/MoniterServiceHelper;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;->this$0:Lcom/edutech/utils/MoniterServiceHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/edutech/utils/MoniterServiceHelper;Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;)V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;-><init>(Lcom/edutech/utils/MoniterServiceHelper;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 34
    :goto_0
    iget-object v2, p0, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;->this$0:Lcom/edutech/utils/MoniterServiceHelper;

    invoke-static {v2}, Lcom/edutech/utils/MoniterServiceHelper;->access$0(Lcom/edutech/utils/MoniterServiceHelper;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 48
    return-void

    .line 36
    :cond_0
    const-wide/16 v2, 0x3e8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :goto_1
    iget-object v2, p0, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;->this$0:Lcom/edutech/utils/MoniterServiceHelper;

    iget-object v3, p0, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;->this$0:Lcom/edutech/utils/MoniterServiceHelper;

    invoke-static {v3}, Lcom/edutech/utils/MoniterServiceHelper;->access$1(Lcom/edutech/utils/MoniterServiceHelper;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;->this$0:Lcom/edutech/utils/MoniterServiceHelper;

    invoke-static {v4}, Lcom/edutech/utils/MoniterServiceHelper;->access$2(Lcom/edutech/utils/MoniterServiceHelper;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/edutech/utils/MoniterServiceHelper;->isServiceRunning(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 41
    const-string/jumbo v2, "Autorun"

    const-string/jumbo v3, "\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 43
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.START_SERVICE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 44
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/edutech/utils/MoniterServiceHelper$ListenerRun;->this$0:Lcom/edutech/utils/MoniterServiceHelper;

    invoke-static {v2}, Lcom/edutech/utils/MoniterServiceHelper;->access$2(Lcom/edutech/utils/MoniterServiceHelper;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 45
    const-string/jumbo v2, "Autorun"

    const-string/jumbo v3, "\ufffd\ufffd\ufffd\ufffd\u0363\u05b9"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
