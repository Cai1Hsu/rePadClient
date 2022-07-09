.class Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "EPubWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anfengde/epub/ui/EPubWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anfengde/epub/ui/EPubWebView;


# direct methods
.method private constructor <init>(Lcom/anfengde/epub/ui/EPubWebView;)V
    .locals 0

    .prologue
    .line 466
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/anfengde/epub/ui/EPubWebView;Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;)V
    .locals 0

    .prologue
    .line 466
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 479
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 480
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-boolean v0, v0, Lcom/anfengde/epub/ui/EPubWebView;->backReadingPage:Z

    if-eqz v0, :cond_0

    .line 482
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnUrl:Z

    .line 488
    :goto_0
    return-void

    .line 485
    :cond_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnUrl:Z

    goto :goto_0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 472
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/anfengde/epub/ui/EPubWebView;->backReadingPage:Z

    .line 473
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 474
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
