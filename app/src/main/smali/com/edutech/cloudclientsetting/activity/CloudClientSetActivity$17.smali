.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$17;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showClearDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$17;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 2044
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2049
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$17;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$84(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2051
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$17;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-direct {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;->start()V

    .line 2053
    :cond_0
    if-eqz p1, :cond_1

    .line 2054
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 2056
    :cond_1
    return-void
.end method
