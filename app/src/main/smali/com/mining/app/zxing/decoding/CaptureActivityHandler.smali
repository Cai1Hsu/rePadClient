.class public final Lcom/mining/app/zxing/decoding/CaptureActivityHandler;
.super Landroid/os/Handler;
.source "CaptureActivityHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

.field private final cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

.field private final decodeThread:Lcom/mining/app/zxing/decoding/DecodeThread;

.field private state:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/mining/app/zxing/activity/MipcaActivityCapture;Ljava/util/Collection;Ljava/lang/String;Lcom/mining/app/zxing/camera/CameraManager;)V
    .locals 3
    .param p1, "activity"    # Lcom/mining/app/zxing/activity/MipcaActivityCapture;
    .param p3, "characterSet"    # Ljava/lang/String;
    .param p4, "cameraManager"    # Lcom/mining/app/zxing/camera/CameraManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mining/app/zxing/activity/MipcaActivityCapture;",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/mining/app/zxing/camera/CameraManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 57
    .local p2, "decodeFormats":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/BarcodeFormat;>;"
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    .line 62
    new-instance v0, Lcom/mining/app/zxing/decoding/DecodeThread;

    .line 63
    new-instance v1, Lcom/mining/app/zxing/view/ViewfinderResultPointCallback;

    invoke-virtual {p1}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->getViewfinderView()Lcom/mining/app/zxing/view/ViewfinderView;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mining/app/zxing/view/ViewfinderResultPointCallback;-><init>(Lcom/mining/app/zxing/view/ViewfinderView;)V

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/mining/app/zxing/decoding/DecodeThread;-><init>(Lcom/mining/app/zxing/activity/MipcaActivityCapture;Ljava/util/Collection;Ljava/lang/String;Lcom/google/zxing/ResultPointCallback;)V

    .line 62
    iput-object v0, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->decodeThread:Lcom/mining/app/zxing/decoding/DecodeThread;

    .line 64
    iget-object v0, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->decodeThread:Lcom/mining/app/zxing/decoding/DecodeThread;

    invoke-virtual {v0}, Lcom/mining/app/zxing/decoding/DecodeThread;->start()V

    .line 65
    sget-object v0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;->SUCCESS:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    iput-object v0, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->state:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    .line 68
    iput-object p4, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    .line 69
    invoke-virtual {p4}, Lcom/mining/app/zxing/camera/CameraManager;->startPreview()V

    .line 70
    invoke-direct {p0}, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->restartPreviewAndDecode()V

    .line 71
    return-void
.end method

.method private restartPreviewAndDecode()V
    .locals 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->state:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    sget-object v1, Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;->SUCCESS:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    if-ne v0, v1, :cond_0

    .line 135
    sget-object v0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;->PREVIEW:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    iput-object v0, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->state:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    .line 136
    iget-object v0, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    iget-object v1, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->decodeThread:Lcom/mining/app/zxing/decoding/DecodeThread;

    invoke-virtual {v1}, Lcom/mining/app/zxing/decoding/DecodeThread;->getHandler()Landroid/os/Handler;

    move-result-object v1

    const v2, 0x7f0a0004

    invoke-virtual {v0, v1, v2}, Lcom/mining/app/zxing/camera/CameraManager;->requestPreviewFrame(Landroid/os/Handler;I)V

    .line 137
    iget-object v0, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    const v1, 0x7f0a0003

    invoke-virtual {v0, p0, v1}, Lcom/mining/app/zxing/camera/CameraManager;->requestAutoFocus(Landroid/os/Handler;I)V

    .line 138
    iget-object v0, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    invoke-virtual {v0}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->drawViewfinder()V

    .line 140
    :cond_0
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 75
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    .line 114
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 80
    :pswitch_1
    iget-object v4, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->state:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    sget-object v5, Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;->PREVIEW:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    if-ne v4, v5, :cond_0

    .line 81
    iget-object v4, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    const v5, 0x7f0a0003

    invoke-virtual {v4, p0, v5}, Lcom/mining/app/zxing/camera/CameraManager;->requestAutoFocus(Landroid/os/Handler;I)V

    goto :goto_0

    .line 85
    :pswitch_2
    sget-object v4, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "Got restart preview message"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-direct {p0}, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->restartPreviewAndDecode()V

    goto :goto_0

    .line 89
    :pswitch_3
    sget-object v4, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "Got decode succeeded message"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    sget-object v4, Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;->SUCCESS:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    iput-object v4, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->state:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    .line 91
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    .line 92
    .local v1, "bundle":Landroid/os/Bundle;
    if-nez v1, :cond_1

    const/4 v0, 0x0

    .line 94
    .local v0, "barcode":Landroid/graphics/Bitmap;
    :goto_1
    iget-object v5, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lcom/google/zxing/Result;

    invoke-virtual {v5, v4, v0}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->handleDecode(Lcom/google/zxing/Result;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 93
    .end local v0    # "barcode":Landroid/graphics/Bitmap;
    :cond_1
    const-string/jumbo v4, "barcode_bitmap"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    move-object v0, v4

    goto :goto_1

    .line 98
    .end local v1    # "bundle":Landroid/os/Bundle;
    :pswitch_4
    sget-object v4, Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;->PREVIEW:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    iput-object v4, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->state:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    .line 99
    iget-object v4, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    iget-object v5, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->decodeThread:Lcom/mining/app/zxing/decoding/DecodeThread;

    invoke-virtual {v5}, Lcom/mining/app/zxing/decoding/DecodeThread;->getHandler()Landroid/os/Handler;

    move-result-object v5

    const v6, 0x7f0a0004

    invoke-virtual {v4, v5, v6}, Lcom/mining/app/zxing/camera/CameraManager;->requestPreviewFrame(Landroid/os/Handler;I)V

    goto :goto_0

    .line 102
    :pswitch_5
    sget-object v4, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "Got return scan result message"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    iget-object v5, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    const/4 v6, -0x1

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/content/Intent;

    invoke-virtual {v5, v6, v4}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->setResult(ILandroid/content/Intent;)V

    .line 104
    iget-object v4, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    invoke-virtual {v4}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->finish()V

    goto :goto_0

    .line 107
    :pswitch_6
    sget-object v4, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "Got product query message"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .line 109
    .local v3, "url":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 110
    .local v2, "intent":Landroid/content/Intent;
    const/high16 v4, 0x80000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 111
    iget-object v4, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    invoke-virtual {v4, v2}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 75
    :pswitch_data_0
    .packed-switch 0x7f0a0003
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_2
        :pswitch_5
    .end packed-switch
.end method

.method public quitSynchronously()V
    .locals 4

    .prologue
    .line 117
    sget-object v1, Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;->DONE:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    iput-object v1, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->state:Lcom/mining/app/zxing/decoding/CaptureActivityHandler$State;

    .line 118
    iget-object v1, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    invoke-virtual {v1}, Lcom/mining/app/zxing/camera/CameraManager;->stopPreview()V

    .line 119
    iget-object v1, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->decodeThread:Lcom/mining/app/zxing/decoding/DecodeThread;

    invoke-virtual {v1}, Lcom/mining/app/zxing/decoding/DecodeThread;->getHandler()Landroid/os/Handler;

    move-result-object v1

    const v2, 0x7f0a000a

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 120
    .local v0, "quit":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 123
    :try_start_0
    iget-object v1, p0, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->decodeThread:Lcom/mining/app/zxing/decoding/DecodeThread;

    const-wide/16 v2, 0x1f4

    invoke-virtual {v1, v2, v3}, Lcom/mining/app/zxing/decoding/DecodeThread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :goto_0
    const v1, 0x7f0a0006

    invoke-virtual {p0, v1}, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->removeMessages(I)V

    .line 130
    const v1, 0x7f0a0005

    invoke-virtual {p0, v1}, Lcom/mining/app/zxing/decoding/CaptureActivityHandler;->removeMessages(I)V

    .line 131
    return-void

    .line 124
    :catch_0
    move-exception v1

    goto :goto_0
.end method
