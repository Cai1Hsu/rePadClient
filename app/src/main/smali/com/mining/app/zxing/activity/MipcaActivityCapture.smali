.class public Lcom/mining/app/zxing/activity/MipcaActivityCapture;
.super Landroid/app/Activity;
.source "MipcaActivityCapture.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field private static final BEEP_VOLUME:F = 0.1f

.field private static final VIBRATE_DURATION:J = 0xc8L


# instance fields
.field private final beepListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

.field private characterSet:Ljava/lang/String;

.field private decodeFormats:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation
.end field

.field private handler:Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

.field private hasSurface:Z

.field private inactivityTimer:Lcom/mining/app/zxing/decoding/InactivityTimer;

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field private playBeep:Z

.field private vibrate:Z

.field private viewfinderView:Lcom/mining/app/zxing/view/ViewfinderView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 207
    new-instance v0, Lcom/mining/app/zxing/activity/MipcaActivityCapture$1;

    invoke-direct {v0, p0}, Lcom/mining/app/zxing/activity/MipcaActivityCapture$1;-><init>(Lcom/mining/app/zxing/activity/MipcaActivityCapture;)V

    iput-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->beepListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 38
    return-void
.end method

.method private initCamera(Landroid/view/SurfaceHolder;)V
    .locals 6
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 146
    :try_start_0
    iget-object v2, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    invoke-virtual {v2, p1}, Lcom/mining/app/zxing/camera/CameraManager;->openDriver(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 152
    iget-object v2, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->handler:Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

    if-nez v2, :cond_0

    .line 153
    new-instance v2, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

    iget-object v3, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->decodeFormats:Ljava/util/Vector;

    .line 154
    iget-object v4, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->characterSet:Ljava/lang/String;

    iget-object v5, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    invoke-direct {v2, p0, v3, v4, v5}, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;-><init>(Lcom/mining/app/zxing/activity/MipcaActivityCapture;Ljava/util/Collection;Ljava/lang/String;Lcom/mining/app/zxing/camera/CameraManager;)V

    .line 153
    iput-object v2, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->handler:Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

    .line 156
    :cond_0
    :goto_0
    return-void

    .line 147
    :catch_0
    move-exception v1

    .line 148
    .local v1, "ioe":Ljava/io/IOException;
    goto :goto_0

    .line 149
    .end local v1    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 150
    .local v0, "e":Ljava/lang/RuntimeException;
    goto :goto_0
.end method

.method private playBeepSoundAndVibrate()V
    .locals 4

    .prologue
    .line 195
    iget-boolean v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->playBeep:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 196
    iget-object v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 198
    :cond_0
    iget-boolean v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->vibrate:Z

    if-eqz v1, :cond_1

    .line 199
    const-string/jumbo v1, "vibrator"

    invoke-virtual {p0, v1}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 200
    .local v0, "vibrator":Landroid/os/Vibrator;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 202
    .end local v0    # "vibrator":Landroid/os/Vibrator;
    :cond_1
    return-void
.end method


# virtual methods
.method public drawViewfinder()V
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->viewfinderView:Lcom/mining/app/zxing/view/ViewfinderView;

    invoke-virtual {v0}, Lcom/mining/app/zxing/view/ViewfinderView;->drawViewfinder()V

    .line 190
    return-void
.end method

.method public getCameraManager()Lcom/mining/app/zxing/camera/CameraManager;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    return-object v0
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->handler:Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

    return-object v0
.end method

.method public getViewfinderView()Lcom/mining/app/zxing/view/ViewfinderView;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->viewfinderView:Lcom/mining/app/zxing/view/ViewfinderView;

    return-object v0
.end method

.method public handleDecode(Lcom/google/zxing/Result;Landroid/graphics/Bitmap;)V
    .locals 6
    .param p1, "result"    # Lcom/google/zxing/Result;
    .param p2, "barcode"    # Landroid/graphics/Bitmap;

    .prologue
    .line 127
    iget-object v3, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->inactivityTimer:Lcom/mining/app/zxing/decoding/InactivityTimer;

    invoke-virtual {v3}, Lcom/mining/app/zxing/decoding/InactivityTimer;->onActivity()V

    .line 128
    invoke-direct {p0}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->playBeepSoundAndVibrate()V

    .line 129
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "resultString":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 131
    const-string/jumbo v3, "Scan failed!"

    .line 132
    const/4 v4, 0x0

    .line 131
    invoke-static {p0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    .line 132
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 141
    :goto_0
    invoke-virtual {p0}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->finish()V

    .line 142
    return-void

    .line 134
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 135
    .local v1, "resultIntent":Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 136
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v3, "TAG"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "resultString = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    const-string/jumbo v3, "SCAN_RESULT"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 139
    const/4 v3, -0x1

    invoke-virtual {p0, v3, v1}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->setResult(ILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 56
    const/high16 v1, 0x7f030000

    invoke-virtual {p0, v1}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->setContentView(I)V

    .line 59
    invoke-virtual {p0}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-static {v1}, Lcom/mining/app/zxing/camera/CameraManager;->init(Landroid/content/Context;)V

    .line 60
    invoke-static {}, Lcom/mining/app/zxing/camera/CameraManager;->get()Lcom/mining/app/zxing/camera/CameraManager;

    move-result-object v1

    iput-object v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    .line 61
    const v1, 0x7f0a001b

    invoke-virtual {p0, v1}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/mining/app/zxing/view/ViewfinderView;

    iput-object v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->viewfinderView:Lcom/mining/app/zxing/view/ViewfinderView;

    .line 62
    iget-object v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->viewfinderView:Lcom/mining/app/zxing/view/ViewfinderView;

    iget-object v2, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    invoke-virtual {v1, v2}, Lcom/mining/app/zxing/view/ViewfinderView;->setCameraManager(Lcom/mining/app/zxing/camera/CameraManager;)V

    .line 64
    const v1, 0x7f0a001d

    invoke-virtual {p0, v1}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 65
    .local v0, "mButtonBack":Landroid/widget/Button;
    new-instance v1, Lcom/mining/app/zxing/activity/MipcaActivityCapture$2;

    invoke-direct {v1, p0}, Lcom/mining/app/zxing/activity/MipcaActivityCapture$2;-><init>(Lcom/mining/app/zxing/activity/MipcaActivityCapture;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->hasSurface:Z

    .line 74
    new-instance v1, Lcom/mining/app/zxing/decoding/InactivityTimer;

    invoke-direct {v1, p0}, Lcom/mining/app/zxing/decoding/InactivityTimer;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->inactivityTimer:Lcom/mining/app/zxing/decoding/InactivityTimer;

    .line 75
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->inactivityTimer:Lcom/mining/app/zxing/decoding/InactivityTimer;

    invoke-virtual {v0}, Lcom/mining/app/zxing/decoding/InactivityTimer;->shutdown()V

    .line 117
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 118
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 106
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 107
    iget-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->handler:Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->handler:Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

    invoke-virtual {v0}, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->quitSynchronously()V

    .line 109
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->handler:Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    invoke-virtual {v0}, Lcom/mining/app/zxing/camera/CameraManager;->closeDriver()V

    .line 112
    return-void
.end method

.method protected onResume()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 79
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 80
    const v3, 0x7f0a001a

    invoke-virtual {p0, v3}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/SurfaceView;

    .line 81
    .local v2, "surfaceView":Landroid/view/SurfaceView;
    invoke-virtual {v2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    .line 82
    .local v1, "surfaceHolder":Landroid/view/SurfaceHolder;
    iget-boolean v3, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->hasSurface:Z

    if-eqz v3, :cond_1

    .line 83
    invoke-direct {p0, v1}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->initCamera(Landroid/view/SurfaceHolder;)V

    .line 88
    :goto_0
    iput-object v4, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->decodeFormats:Ljava/util/Vector;

    .line 89
    iput-object v4, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->characterSet:Ljava/lang/String;

    .line 91
    iput-boolean v5, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->playBeep:Z

    .line 92
    const-string/jumbo v3, "audio"

    invoke-virtual {p0, v3}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 93
    .local v0, "audioService":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    .line 94
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->playBeep:Z

    .line 96
    :cond_0
    iput-boolean v5, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->vibrate:Z

    .line 98
    return-void

    .line 85
    .end local v0    # "audioService":Landroid/media/AudioManager;
    :cond_1
    invoke-interface {v1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 86
    const/4 v3, 0x3

    invoke-interface {v1, v3}, Landroid/view/SurfaceHolder;->setType(I)V

    goto :goto_0
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 162
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->hasSurface:Z

    if-nez v0, :cond_0

    .line 167
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->hasSurface:Z

    .line 168
    invoke-direct {p0, p1}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->initCamera(Landroid/view/SurfaceHolder;)V

    .line 171
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 175
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->hasSurface:Z

    .line 177
    return-void
.end method
