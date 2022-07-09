.class public Lcom/lee/demo/view/VideoPlayActivity;
.super Landroid/app/Activity;
.source "VideoPlayActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# instance fields
.field private dm:Landroid/util/DisplayMetrics;

.field private duration:I

.field private isPlaying:Z

.field private play:Landroid/widget/ImageView;

.field private seekBar:Landroid/widget/SeekBar;

.field private surface_holder:Landroid/view/SurfaceHolder;

.field private surface_view:Landroid/view/SurfaceView;

.field private timer:Ljava/util/Timer;

.field private timerTask:Ljava/util/TimerTask;

.field private tv_time:Landroid/widget/TextView;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 43
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->url:Ljava/lang/String;

    .line 31
    return-void
.end method

.method static synthetic access$0(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/widget/SeekBar;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->seekBar:Landroid/widget/SeekBar;

    return-object v0
.end method

.method static synthetic access$1(Lcom/lee/demo/view/VideoPlayActivity;)V
    .locals 0

    .prologue
    .line 209
    invoke-direct {p0}, Lcom/lee/demo/view/VideoPlayActivity;->pauseVideo()V

    return-void
.end method

.method static synthetic access$2(Lcom/lee/demo/view/VideoPlayActivity;I)V
    .locals 0

    .prologue
    .line 37
    iput p1, p0, Lcom/lee/demo/view/VideoPlayActivity;->duration:I

    return-void
.end method

.method static synthetic access$3(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->tv_time:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4(Lcom/lee/demo/view/VideoPlayActivity;)V
    .locals 0

    .prologue
    .line 183
    invoke-direct {p0}, Lcom/lee/demo/view/VideoPlayActivity;->playVideo()V

    return-void
.end method

.method static synthetic access$5(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/view/SurfaceView;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->surface_view:Landroid/view/SurfaceView;

    return-object v0
.end method

.method static synthetic access$6(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/util/DisplayMetrics;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->dm:Landroid/util/DisplayMetrics;

    return-object v0
.end method

.method static synthetic access$7(Lcom/lee/demo/view/VideoPlayActivity;)I
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->duration:I

    return v0
.end method

.method private initViews()V
    .locals 2

    .prologue
    .line 138
    const v0, 0x7f0a008e

    invoke-virtual {p0, v0}, Lcom/lee/demo/view/VideoPlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->surface_view:Landroid/view/SurfaceView;

    .line 139
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->surface_view:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->surface_holder:Landroid/view/SurfaceHolder;

    .line 140
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->surface_holder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 142
    const v0, 0x7f0a008f

    invoke-virtual {p0, v0}, Lcom/lee/demo/view/VideoPlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->play:Landroid/widget/ImageView;

    .line 143
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->play:Landroid/widget/ImageView;

    new-instance v1, Lcom/lee/demo/view/VideoPlayActivity$6;

    invoke-direct {v1, p0}, Lcom/lee/demo/view/VideoPlayActivity$6;-><init>(Lcom/lee/demo/view/VideoPlayActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    const v0, 0x7f0a0091

    invoke-virtual {p0, v0}, Lcom/lee/demo/view/VideoPlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->tv_time:Landroid/widget/TextView;

    .line 158
    const v0, 0x7f0a0090

    invoke-virtual {p0, v0}, Lcom/lee/demo/view/VideoPlayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->seekBar:Landroid/widget/SeekBar;

    .line 159
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->seekBar:Landroid/widget/SeekBar;

    new-instance v1, Lcom/lee/demo/view/VideoPlayActivity$7;

    invoke-direct {v1, p0}, Lcom/lee/demo/view/VideoPlayActivity$7;-><init>(Lcom/lee/demo/view/VideoPlayActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 181
    return-void
.end method

.method private mpInitialize()V
    .locals 2

    .prologue
    .line 69
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    .line 70
    new-instance v1, Lcom/lee/demo/view/VideoPlayActivity$1;

    invoke-direct {v1, p0}, Lcom/lee/demo/view/VideoPlayActivity$1;-><init>(Lcom/lee/demo/view/VideoPlayActivity;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 78
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    new-instance v1, Lcom/lee/demo/view/VideoPlayActivity$2;

    invoke-direct {v1, p0}, Lcom/lee/demo/view/VideoPlayActivity$2;-><init>(Lcom/lee/demo/view/VideoPlayActivity;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 86
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    new-instance v1, Lcom/lee/demo/view/VideoPlayActivity$3;

    invoke-direct {v1, p0}, Lcom/lee/demo/view/VideoPlayActivity$3;-><init>(Lcom/lee/demo/view/VideoPlayActivity;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnSeekCompleteListener(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    .line 94
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    new-instance v1, Lcom/lee/demo/view/VideoPlayActivity$4;

    invoke-direct {v1, p0}, Lcom/lee/demo/view/VideoPlayActivity$4;-><init>(Lcom/lee/demo/view/VideoPlayActivity;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 106
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    new-instance v1, Lcom/lee/demo/view/VideoPlayActivity$5;

    invoke-direct {v1, p0}, Lcom/lee/demo/view/VideoPlayActivity$5;-><init>(Lcom/lee/demo/view/VideoPlayActivity;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 125
    return-void
.end method

.method private pauseVideo()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 210
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    if-nez v0, :cond_1

    .line 226
    :cond_0
    :goto_0
    return-void

    .line 214
    :cond_1
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 215
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 216
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->play:Landroid/widget/ImageView;

    const v1, 0x7f020333

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 220
    :cond_2
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 222
    iput-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity;->timerTask:Ljava/util/TimerTask;

    .line 223
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 224
    iput-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    goto :goto_0
.end method

.method private playVideo()V
    .locals 6

    .prologue
    .line 184
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    if-nez v0, :cond_1

    .line 207
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 189
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 190
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->play:Landroid/widget/ImageView;

    const v1, 0x7f020334

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 192
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    .line 193
    new-instance v0, Lcom/lee/demo/view/VideoPlayActivity$8;

    invoke-direct {v0, p0}, Lcom/lee/demo/view/VideoPlayActivity$8;-><init>(Lcom/lee/demo/view/VideoPlayActivity;)V

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timerTask:Ljava/util/TimerTask;

    .line 204
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/lee/demo/view/VideoPlayActivity;->timerTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x1f4

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    goto :goto_0
.end method


# virtual methods
.method public getTime(I)Ljava/lang/String;
    .locals 5
    .param p1, "t"    # I

    .prologue
    const/16 v4, 0x9

    .line 128
    int-to-float v1, p1

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v1, v2

    float-to-double v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->rint(D)D

    move-result-wide v2

    double-to-int v0, v2

    .line 130
    .local v0, "cRint":I
    new-instance v2, Ljava/lang/StringBuilder;

    div-int/lit8 v1, v0, 0x3c

    if-le v1, v4, :cond_0

    const-string/jumbo v1, ""

    :goto_0
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    div-int/lit8 v1, v0, 0x3c

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 131
    rem-int/lit8 v1, v0, 0x3c

    if-le v1, v4, :cond_1

    const-string/jumbo v1, ""

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    rem-int/lit8 v2, v0, 0x3c

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 130
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_0
    const-string/jumbo v1, "0"

    goto :goto_0

    .line 131
    :cond_1
    const-string/jumbo v1, "0"

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity;->dm:Landroid/util/DisplayMetrics;

    .line 50
    invoke-virtual {p0}, Lcom/lee/demo/view/VideoPlayActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    iget-object v3, p0, Lcom/lee/demo/view/VideoPlayActivity;->dm:Landroid/util/DisplayMetrics;

    invoke-virtual {v2, v3}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 51
    const v2, 0x7f030023

    invoke-virtual {p0, v2}, Lcom/lee/demo/view/VideoPlayActivity;->setContentView(I)V

    .line 52
    invoke-direct {p0}, Lcom/lee/demo/view/VideoPlayActivity;->initViews()V

    .line 53
    const-string/jumbo v2, "qwe"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "dataSource:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/lee/demo/view/VideoPlayActivity;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-virtual {p0}, Lcom/lee/demo/view/VideoPlayActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 55
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "mediaurl"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity;->url:Ljava/lang/String;

    .line 57
    invoke-direct {p0}, Lcom/lee/demo/view/VideoPlayActivity;->mpInitialize()V

    .line 59
    :try_start_0
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v2

    iget-object v3, p0, Lcom/lee/demo/view/VideoPlayActivity;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 60
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 61
    const-string/jumbo v2, "qwe"

    const-string/jumbo v3, "prepareAsync"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :goto_0
    return-void

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 300
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 301
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->isPlaying:Z

    .line 302
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    .line 303
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "ondestory"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 276
    packed-switch p1, :pswitch_data_0

    .line 285
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 278
    :pswitch_0
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/lee/demo/view/VideoPlayActivity;->setResult(I)V

    .line 279
    invoke-virtual {p0}, Lcom/lee/demo/view/VideoPlayActivity;->finish()V

    goto :goto_0

    .line 276
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 289
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 290
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "onpause"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    invoke-direct {p0}, Lcom/lee/demo/view/VideoPlayActivity;->pauseVideo()V

    .line 296
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 254
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 256
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->isPlaying:Z

    if-eqz v0, :cond_0

    .line 257
    invoke-direct {p0}, Lcom/lee/demo/view/VideoPlayActivity;->playVideo()V

    .line 258
    :cond_0
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "activity onresume"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    return-void
.end method

.method protected onStop()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 263
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "activity stop"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 265
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 266
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 267
    iput-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity;->timerTask:Ljava/util/TimerTask;

    .line 268
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 269
    iput-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity;->timer:Ljava/util/Timer;

    .line 272
    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .param p1, "arg0"    # Landroid/view/SurfaceHolder;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "arg3"    # I

    .prologue
    .line 233
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 240
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 241
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 248
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 249
    return-void
.end method
