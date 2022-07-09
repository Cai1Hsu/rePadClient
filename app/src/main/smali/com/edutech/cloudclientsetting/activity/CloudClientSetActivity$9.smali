.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$9;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$9;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 1914
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1916
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 1917
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$9;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 1918
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$9;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$6(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 1919
    const/4 v0, 0x1

    .line 1921
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
