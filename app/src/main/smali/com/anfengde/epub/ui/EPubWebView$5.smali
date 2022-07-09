.class Lcom/anfengde/epub/ui/EPubWebView$5;
.super Ljava/lang/Object;
.source "EPubWebView.java"

# interfaces
.implements Lcom/anfengde/android/QuickAction$OnActionItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/anfengde/epub/ui/EPubWebView;->showContextMenu(Landroid/graphics/Rect;)V
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
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView$5;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    .line 770
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Lcom/anfengde/android/QuickAction;II)V
    .locals 2
    .param p1, "source"    # Lcom/anfengde/android/QuickAction;
    .param p2, "pos"    # I
    .param p3, "actionId"    # I

    .prologue
    .line 784
    packed-switch p3, :pswitch_data_0

    .line 798
    :goto_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$5;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/anfengde/epub/ui/EPubWebView;->contextMenuVisible:Z

    .line 799
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$5;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v0}, Lcom/anfengde/epub/ui/EPubWebView;->endSelectionMode()V

    .line 800
    return-void

    .line 787
    :pswitch_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$5;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const-string/jumbo v1, "javascript:androidCopySelectionText();"

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 790
    :pswitch_1
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$5;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const-string/jumbo v1, "javascript:showSharingPage();"

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 793
    :pswitch_2
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$5;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const-string/jumbo v1, "javascript:ttsSpeaking()"

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 784
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
