.class Lcom/anfengde/epub/ui/EPubWebView$2;
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
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    .line 585
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "m"    # Landroid/os/Message;

    .prologue
    .line 588
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/EPubWebView;->access$1(Lcom/anfengde/epub/ui/EPubWebView;)Lcom/blahti/drag/DragLayer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->removeView(Landroid/view/View;)V

    .line 589
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v0}, Lcom/anfengde/epub/ui/EPubWebView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v0, v0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-boolean v0, v0, Lcom/anfengde/epub/ui/EPubWebView;->contextMenuVisible:Z

    if-eqz v0, :cond_0

    .line 593
    :try_start_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v0, v0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    invoke-virtual {v0}, Lcom/anfengde/android/QuickAction;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 599
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->access$4(Lcom/anfengde/epub/ui/EPubWebView;Landroid/graphics/Rect;)V

    .line 600
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->access$5(Lcom/anfengde/epub/ui/EPubWebView;I)V

    .line 601
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$2;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const-string/jumbo v1, "javascript: android.selection.clearSelection();"

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 603
    return-void

    .line 595
    :catch_0
    move-exception v0

    goto :goto_0
.end method
