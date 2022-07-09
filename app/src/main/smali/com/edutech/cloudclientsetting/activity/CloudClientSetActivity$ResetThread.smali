.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;
.super Ljava/lang/Thread;
.source "CloudClientSetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ResetThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 2015
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 2021
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$75(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V

    .line 2022
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$76(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 2023
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$77(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 2024
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$75(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V

    .line 2025
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 2026
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x70

    iput v1, v0, Landroid/os/Message;->what:I

    .line 2027
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 2028
    return-void
.end method
