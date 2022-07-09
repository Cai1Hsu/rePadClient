.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$5;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$5;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 1563
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 1568
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1575
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 1570
    :pswitch_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$5;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$45(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    goto :goto_0

    .line 1568
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
