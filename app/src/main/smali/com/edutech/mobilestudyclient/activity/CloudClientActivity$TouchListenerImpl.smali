.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TouchListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;


# direct methods
.method private constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 4815
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;)V
    .locals 0

    .prologue
    .line 4815
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x0

    .line 4818
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 4838
    :cond_0
    :goto_0
    :pswitch_0
    return v5

    .line 4823
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v2

    .line 4824
    .local v2, "scrollY":I
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 4825
    .local v0, "height":I
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$38(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/ScrollView;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 4828
    .local v1, "scrollViewMeasuredHeight":I
    const/16 v3, 0x14

    if-le v1, v3, :cond_1

    .line 4829
    add-int/lit8 v1, v1, -0x14

    .line 4830
    :cond_1
    add-int v3, v2, v0

    if-le v3, v1, :cond_0

    .line 4831
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$39(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/Button;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 4818
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
