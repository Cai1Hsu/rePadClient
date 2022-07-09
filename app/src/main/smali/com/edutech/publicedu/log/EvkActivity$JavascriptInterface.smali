.class Lcom/edutech/publicedu/log/EvkActivity$JavascriptInterface;
.super Ljava/lang/Object;
.source "EvkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/publicedu/log/EvkActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "JavascriptInterface"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/publicedu/log/EvkActivity;


# direct methods
.method constructor <init>(Lcom/edutech/publicedu/log/EvkActivity;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/edutech/publicedu/log/EvkActivity$JavascriptInterface;->this$0:Lcom/edutech/publicedu/log/EvkActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public goBack()V
    .locals 2

    .prologue
    .line 81
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "goBack"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    iget-object v0, p0, Lcom/edutech/publicedu/log/EvkActivity$JavascriptInterface;->this$0:Lcom/edutech/publicedu/log/EvkActivity;

    invoke-virtual {v0}, Lcom/edutech/publicedu/log/EvkActivity;->finish()V

    .line 83
    return-void
.end method

.method public pauseVideo()V
    .locals 2

    .prologue
    .line 76
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "pauseVideo"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-static {}, Lcom/edutech/publicedu/log/LogHelp;->getInstance()Lcom/edutech/publicedu/log/LogHelp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/edutech/publicedu/log/LogHelp;->pauseLog()V

    .line 78
    return-void
.end method

.method public playVideo()V
    .locals 2

    .prologue
    .line 71
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "playVideo"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    invoke-static {}, Lcom/edutech/publicedu/log/LogHelp;->getInstance()Lcom/edutech/publicedu/log/LogHelp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/edutech/publicedu/log/LogHelp;->continueLog()V

    .line 73
    return-void
.end method
