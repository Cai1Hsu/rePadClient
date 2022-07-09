.class public Lcom/edutech/publicedu/log/EvkActivity;
.super Landroid/app/Activity;
.source "EvkActivity.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/publicedu/log/EvkActivity$JavascriptInterface;
    }
.end annotation


# instance fields
.field private gifPath:Ljava/lang/String;

.field private jsonPath:Ljava/lang/String;

.field private mp3Path:Ljava/lang/String;

.field private windowHeight:I

.field private windowWidth:I

.field private wv_evk:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 33
    .local v1, "outMetrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/edutech/publicedu/log/EvkActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 34
    iget v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v3, v3

    iget v4, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    div-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->windowWidth:I

    .line 35
    iget v3, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v3, v3

    iget v4, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    div-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->windowHeight:I

    .line 36
    const v3, 0x7f030022

    invoke-virtual {p0, v3}, Lcom/edutech/publicedu/log/EvkActivity;->setContentView(I)V

    .line 37
    const v3, 0x7f0a008d

    invoke-virtual {p0, v3}, Lcom/edutech/publicedu/log/EvkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    iput-object v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->wv_evk:Landroid/webkit/WebView;

    .line 38
    iget-object v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->wv_evk:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    .line 39
    .local v2, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v2, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 41
    iget-object v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->wv_evk:Landroid/webkit/WebView;

    new-instance v4, Lcom/edutech/publicedu/log/EvkActivity$JavascriptInterface;

    invoke-direct {v4, p0}, Lcom/edutech/publicedu/log/EvkActivity$JavascriptInterface;-><init>(Lcom/edutech/publicedu/log/EvkActivity;)V

    const-string/jumbo v5, "Android"

    invoke-virtual {v3, v4, v5}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    sget-object v3, Landroid/webkit/WebSettings$PluginState;->ON:Landroid/webkit/WebSettings$PluginState;

    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

    .line 46
    invoke-virtual {v2, v7}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 47
    invoke-virtual {v2, v7}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 48
    invoke-virtual {v2, v6}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 51
    invoke-virtual {v2, v6}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 52
    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 53
    invoke-virtual {p0}, Lcom/edutech/publicedu/log/EvkActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 54
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "gifpath"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->gifPath:Ljava/lang/String;

    .line 55
    const-string/jumbo v3, "mp3path"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->mp3Path:Ljava/lang/String;

    .line 56
    const-string/jumbo v3, "jsonpath"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->jsonPath:Ljava/lang/String;

    .line 58
    iget-object v3, p0, Lcom/edutech/publicedu/log/EvkActivity;->wv_evk:Landroid/webkit/WebView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "file://"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 59
    const-string/jumbo v5, "player/player.html?imgpath="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->gifPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "&audiopath="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 60
    iget-object v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->mp3Path:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "&jsonpath="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->jsonPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "&psize="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->windowWidth:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 61
    const-string/jumbo v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->windowHeight:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "&flag=1&play=1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 58
    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 62
    const-string/jumbo v3, "evk"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "file://"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 63
    const-string/jumbo v5, "player/player.html?imgpath="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->gifPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "&audiopath="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 64
    iget-object v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->mp3Path:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "&jsonpath="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->jsonPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "&psize="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->windowWidth:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 65
    const-string/jumbo v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/edutech/publicedu/log/EvkActivity;->windowHeight:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "&flag=1&play=1"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 62
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 88
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 90
    iget-object v0, p0, Lcom/edutech/publicedu/log/EvkActivity;->wv_evk:Landroid/webkit/WebView;

    const-string/jumbo v1, "javascript:stopPlay()"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 92
    invoke-static {}, Lcom/edutech/publicedu/log/LogHelp;->getInstance()Lcom/edutech/publicedu/log/LogHelp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/edutech/publicedu/log/LogHelp;->stopLog()V

    .line 93
    return-void
.end method
