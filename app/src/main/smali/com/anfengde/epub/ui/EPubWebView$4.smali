.class Lcom/anfengde/epub/ui/EPubWebView$4;
.super Ljava/lang/Object;
.source "EPubWebView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/anfengde/epub/ui/EPubWebView;->createSelectionLayer(Landroid/content/Context;)V
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
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView$4;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    .line 517
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 522
    const/4 v1, 0x0

    .line 524
    .local v1, "handledHere":Z
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 527
    .local v0, "action":I
    if-nez v0, :cond_0

    .line 528
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView$4;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v2, p1}, Lcom/anfengde/epub/ui/EPubWebView;->access$11(Lcom/anfengde/epub/ui/EPubWebView;Landroid/view/View;)Z

    move-result v1

    .line 529
    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView$4;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v3, v2}, Lcom/anfengde/epub/ui/EPubWebView;->access$5(Lcom/anfengde/epub/ui/EPubWebView;I)V

    .line 532
    :cond_0
    return v1
.end method
