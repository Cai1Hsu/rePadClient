.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;
.super Ljava/lang/Thread;
.source "CloudClientSetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HostPwd"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 4288
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 4295
    :try_start_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$78(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$79(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 4296
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$80(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$81(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4300
    :goto_0
    return-void

    .line 4297
    :catch_0
    move-exception v0

    goto :goto_0
.end method
