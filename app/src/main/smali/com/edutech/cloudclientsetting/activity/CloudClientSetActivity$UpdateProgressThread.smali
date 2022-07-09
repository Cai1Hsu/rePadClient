.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;
.super Ljava/lang/Thread;
.source "CloudClientSetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UpdateProgressThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 732
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 737
    :goto_0
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$61(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)I

    move-result v2

    const/16 v3, 0x12c

    if-ge v2, v3, :cond_0

    sget-boolean v2, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    if-nez v2, :cond_1

    .line 750
    :cond_0
    return-void

    .line 740
    :cond_1
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 741
    .local v1, "msg":Landroid/os/Message;
    const/16 v2, 0x3e9

    iput v2, v1, Landroid/os/Message;->what:I

    .line 742
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$62(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 744
    const-wide/16 v2, 0x3e8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 745
    :catch_0
    move-exception v0

    .line 747
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
