.class Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "EPubWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anfengde/epub/ui/EPubWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyWebChromeClient"
.end annotation


# instance fields
.field private mDefaultVideoPoster:Landroid/graphics/Bitmap;

.field private mVideoProgressView:Landroid/view/View;

.field final synthetic this$0:Lcom/anfengde/epub/ui/EPubWebView;


# direct methods
.method private constructor <init>(Lcom/anfengde/epub/ui/EPubWebView;)V
    .locals 0

    .prologue
    .line 367
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/anfengde/epub/ui/EPubWebView;Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;)V
    .locals 0

    .prologue
    .line 367
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    return-void
.end method


# virtual methods
.method public getDefaultVideoPoster()Landroid/graphics/Bitmap;
    .locals 2

    .prologue
    .line 413
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->mDefaultVideoPoster:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 415
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v0}, Lcom/anfengde/epub/ui/EPubWebView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/anfengde/epub/ui/R$drawable;->default_video_poster:I

    .line 414
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->mDefaultVideoPoster:Landroid/graphics/Bitmap;

    .line 417
    :cond_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->mDefaultVideoPoster:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getVideoLoadingProgressView()Landroid/view/View;
    .locals 3

    .prologue
    .line 424
    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->mVideoProgressView:Landroid/view/View;

    if-nez v1, :cond_0

    .line 425
    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/EPubWebView;->access$3(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 427
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v1, Lcom/anfengde/epub/ui/R$layout;->afd_video_loading_progress:I

    const/4 v2, 0x0

    .line 426
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->mVideoProgressView:Landroid/view/View;

    .line 429
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->mVideoProgressView:Landroid/view/View;

    return-object v1
.end method

.method public onExceededDatabaseQuota(Ljava/lang/String;Ljava/lang/String;JJJLandroid/webkit/WebStorage$QuotaUpdater;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "databaseIdentifier"    # Ljava/lang/String;
    .param p3, "currentQuota"    # J
    .param p5, "estimatedSize"    # J
    .param p7, "totalUsedQuota"    # J
    .param p9, "quotaUpdater"    # Landroid/webkit/WebStorage$QuotaUpdater;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 455
    const-wide/16 v0, 0x2

    mul-long/2addr v0, p5

    invoke-interface {p9, v0, v1}, Landroid/webkit/WebStorage$QuotaUpdater;->updateQuota(J)V

    .line 456
    return-void
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 2
    .param p1, "origin"    # Ljava/lang/String;
    .param p2, "callback"    # Landroid/webkit/GeolocationPermissions$Callback;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 447
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-interface {p2, p1, v0, v1}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    .line 448
    return-void
.end method

.method public onHideCustomView()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v2, 0x8

    .line 394
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v0, v0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 408
    :goto_0
    return-void

    .line 398
    :cond_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v0, v0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 400
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/EPubWebView;->access$8(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v1, v1, Lcom/anfengde/epub/ui/EPubWebView;->mCustomView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 401
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomView:Landroid/view/View;

    .line 402
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/EPubWebView;->access$8(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 403
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/EPubWebView;->access$10(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    move-result-object v0

    invoke-interface {v0}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 405
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->setVisibility(I)V

    goto :goto_0
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 439
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/EPubWebView;->access$3(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 440
    const/4 v1, 0x2

    mul-int/lit8 v2, p2, 0x64

    .line 439
    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFeatureInt(II)V

    .line 441
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 434
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/EPubWebView;->access$3(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0, p2}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 435
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "callback"    # Landroid/webkit/WebChromeClient$CustomViewCallback;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 376
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->setVisibility(I)V

    .line 377
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x1

    iput v1, v0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnVideo:I

    .line 379
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iget-object v0, v0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 380
    invoke-interface {p2}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    .line 388
    :goto_0
    return-void

    .line 383
    :cond_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/EPubWebView;->access$8(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 384
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    iput-object p1, v0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomView:Landroid/view/View;

    .line 385
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v0, p2}, Lcom/anfengde/epub/ui/EPubWebView;->access$9(Lcom/anfengde/epub/ui/EPubWebView;Landroid/webkit/WebChromeClient$CustomViewCallback;)V

    .line 386
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->this$0:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/EPubWebView;->access$8(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto :goto_0
.end method
