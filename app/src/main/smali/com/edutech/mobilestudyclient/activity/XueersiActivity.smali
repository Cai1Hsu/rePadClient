.class public Lcom/edutech/mobilestudyclient/activity/XueersiActivity;
.super Landroid/app/Activity;
.source "XueersiActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/mobilestudyclient/activity/XueersiActivity$MyWebClient;
    }
.end annotation


# instance fields
.field private backpress:J

.field private loadurl:Ljava/lang/String;

.field private times:I

.field private webview:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 21
    const-string/jumbo v0, "http://www.xueersi.com/"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->loadurl:Ljava/lang/String;

    .line 22
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->backpress:J

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->times:I

    .line 18
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 56
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->loadurl:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->loadurl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 60
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 27
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const v2, 0x7f030004

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->setContentView(I)V

    .line 29
    const v2, 0x7f0a001f

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/webkit/WebView;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    .line 30
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 31
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "url"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->loadurl:Ljava/lang/String;

    .line 32
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 33
    .local v1, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 34
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 35
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 36
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 37
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 38
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 39
    invoke-virtual {v1, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 40
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    new-instance v3, Lcom/edutech/mobilestudyclient/activity/XueersiActivity$MyWebClient;

    invoke-direct {v3, p0}, Lcom/edutech/mobilestudyclient/activity/XueersiActivity$MyWebClient;-><init>(Lcom/edutech/mobilestudyclient/activity/XueersiActivity;)V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 41
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    new-instance v3, Landroid/webkit/WebChromeClient;

    invoke-direct {v3}, Landroid/webkit/WebChromeClient;-><init>()V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 42
    const-string/jumbo v2, "User-Agent:Android"

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 43
    const-string/jumbo v2, "url"

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->loadurl:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->loadurl:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->loadurl:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 46
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->loadurl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 51
    :goto_0
    return-void

    .line 49
    :cond_0
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    const-string/jumbo v3, "http://www.xueersi.com/"

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 116
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 117
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    .line 122
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 6
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x0

    .line 83
    const/4 v1, 0x4

    if-ne p1, v1, :cond_2

    .line 84
    iget v1, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->times:I

    if-nez v1, :cond_0

    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->backpress:J

    .line 87
    iget v1, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->times:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->times:I

    .line 88
    const-string/jumbo v1, "\u518d\u6309\u4e00\u6b21\u9000\u51fa\u5e94\u7528"

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 103
    :goto_0
    return v0

    .line 92
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->backpress:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x320

    cmp-long v1, v2, v4

    if-gez v1, :cond_1

    .line 94
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->finish()V

    .line 95
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0

    .line 98
    :cond_1
    iput v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->times:I

    goto :goto_0

    .line 103
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 109
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 110
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/XueersiActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->reload()V

    .line 111
    return-void
.end method
