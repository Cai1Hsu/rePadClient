.class Lcom/anfengde/epub/ui/EPubWebView$1;
.super Landroid/os/Handler;
.source "EPubWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anfengde/epub/ui/EPubWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anfengde/epub/ui/EPubWebView;


# direct methods
.method constructor <init>(Lcom/anfengde/epub/ui/EPubWebView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    .line 549
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "m"    # Landroid/os/Message;

    .prologue
    .line 553
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$0(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/graphics/Rect;

    move-result-object v2

    if-nez v2, :cond_0

    .line 569
    :goto_0
    return-void

    .line 556
    :cond_0
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v3}, Lcom/anfengde/epub/ui/EPubWebView;->access$1(Lcom/anfengde/epub/ui/EPubWebView;)Lcom/blahti/drag/DragLayer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/ui/EPubWebView;->addView(Landroid/view/View;)V

    .line 558
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$2(Lcom/anfengde/epub/ui/EPubWebView;)V

    .line 561
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v3}, Lcom/anfengde/epub/ui/EPubWebView;->getContentHeight()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v4}, Lcom/anfengde/epub/ui/EPubWebView;->access$3(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    .line 564
    .local v0, "contentHeight":I
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$1(Lcom/anfengde/epub/ui/EPubWebView;)Lcom/blahti/drag/DragLayer;

    move-result-object v2

    invoke-virtual {v2}, Lcom/blahti/drag/DragLayer;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 565
    .local v1, "layerParams":Landroid/view/ViewGroup$LayoutParams;
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 566
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget v2, v2, Lcom/anfengde/epub/ui/EPubWebView;->contentWidth:I

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 567
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$1;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$1(Lcom/anfengde/epub/ui/EPubWebView;)Lcom/blahti/drag/DragLayer;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/blahti/drag/DragLayer;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method
