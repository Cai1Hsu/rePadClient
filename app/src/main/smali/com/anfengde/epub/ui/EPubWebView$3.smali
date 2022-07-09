.class Lcom/anfengde/epub/ui/EPubWebView$3;
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
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    .line 625
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "m"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    .line 628
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$6(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    .line 629
    .local v1, "startParams":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$0(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget-object v4, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v4}, Lcom/anfengde/epub/ui/EPubWebView;->access$6(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    sub-int/2addr v2, v4

    iput v2, v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    .line 630
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$0(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget-object v4, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v4}, Lcom/anfengde/epub/ui/EPubWebView;->access$6(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    sub-int/2addr v2, v4

    iput v2, v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    .line 633
    iget v2, v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    if-gez v2, :cond_0

    move v2, v3

    :goto_0
    iput v2, v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    .line 634
    iget v2, v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    if-gez v2, :cond_1

    move v2, v3

    :goto_1
    iput v2, v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    .line 636
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$6(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 638
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$7(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    .line 639
    .local v0, "endParams":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$0(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    iput v2, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    .line 640
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$0(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    iput v2, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    .line 643
    iget v2, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    if-gez v2, :cond_2

    move v2, v3

    :goto_2
    iput v2, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    .line 644
    iget v2, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    if-gez v2, :cond_3

    :goto_3
    iput v3, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    .line 646
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$3;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$7(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 648
    return-void

    .line 633
    .end local v0    # "endParams":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    :cond_0
    iget v2, v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    goto :goto_0

    .line 634
    :cond_1
    iget v2, v1, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    goto :goto_1

    .line 643
    .restart local v0    # "endParams":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    :cond_2
    iget v2, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    goto :goto_2

    .line 644
    :cond_3
    iget v3, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    goto :goto_3
.end method
