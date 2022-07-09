.class final Lcom/mining/app/zxing/decoding/DecodeHandler;
.super Landroid/os/Handler;
.source "DecodeHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

.field private final multiFormatReader:Lcom/google/zxing/MultiFormatReader;

.field private running:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lcom/mining/app/zxing/decoding/DecodeHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mining/app/zxing/decoding/DecodeHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/mining/app/zxing/activity/MipcaActivityCapture;Ljava/util/Map;)V
    .locals 1
    .param p1, "activity"    # Lcom/mining/app/zxing/activity/MipcaActivityCapture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mining/app/zxing/activity/MipcaActivityCapture;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mining/app/zxing/decoding/DecodeHandler;->running:Z

    .line 46
    new-instance v0, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object v0, p0, Lcom/mining/app/zxing/decoding/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    .line 47
    iget-object v0, p0, Lcom/mining/app/zxing/decoding/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v0, p2}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 48
    iput-object p1, p0, Lcom/mining/app/zxing/decoding/DecodeHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    .line 49
    return-void
.end method

.method private decode([BII)V
    .locals 18
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 77
    .local v12, "start":J
    const/4 v10, 0x0

    .line 78
    .local v10, "rawResult":Lcom/google/zxing/Result;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mining/app/zxing/decoding/DecodeHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    invoke-virtual {v14}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->getCameraManager()Lcom/mining/app/zxing/camera/CameraManager;

    move-result-object v14

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v14, v0, v1, v2}, Lcom/mining/app/zxing/camera/CameraManager;->buildLuminanceSource([BII)Lcom/mining/app/zxing/camera/PlanarYUVLuminanceSource;

    move-result-object v11

    .line 79
    .local v11, "source":Lcom/mining/app/zxing/camera/PlanarYUVLuminanceSource;
    if-eqz v11, :cond_0

    .line 80
    new-instance v4, Lcom/google/zxing/BinaryBitmap;

    new-instance v14, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {v14, v11}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    invoke-direct {v4, v14}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    .line 82
    .local v4, "bitmap":Lcom/google/zxing/BinaryBitmap;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mining/app/zxing/decoding/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v14, v4}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v10

    .line 86
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mining/app/zxing/decoding/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v14}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 90
    .end local v4    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mining/app/zxing/decoding/DecodeHandler;->activity:Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    invoke-virtual {v14}, Lcom/mining/app/zxing/activity/MipcaActivityCapture;->getHandler()Landroid/os/Handler;

    move-result-object v8

    .line 91
    .local v8, "handler":Landroid/os/Handler;
    if-eqz v10, :cond_2

    .line 93
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 94
    .local v6, "end":J
    sget-object v14, Lcom/mining/app/zxing/decoding/DecodeHandler;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    const-string/jumbo v16, "Found barcode in "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v16, v6, v12

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " ms"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    if-eqz v8, :cond_1

    .line 96
    const v14, 0x7f0a0006

    invoke-static {v8, v14, v10}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v9

    .line 97
    .local v9, "message":Landroid/os/Message;
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 98
    .local v5, "bundle":Landroid/os/Bundle;
    const-string/jumbo v14, "barcode_bitmap"

    invoke-virtual {v11}, Lcom/mining/app/zxing/camera/PlanarYUVLuminanceSource;->renderCroppedGreyscaleBitmap()Landroid/graphics/Bitmap;

    move-result-object v15

    invoke-virtual {v5, v14, v15}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 99
    invoke-virtual {v9, v5}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 100
    invoke-virtual {v9}, Landroid/os/Message;->sendToTarget()V

    .line 108
    .end local v5    # "bundle":Landroid/os/Bundle;
    .end local v6    # "end":J
    .end local v9    # "message":Landroid/os/Message;
    :cond_1
    :goto_1
    return-void

    .line 83
    .end local v8    # "handler":Landroid/os/Handler;
    .restart local v4    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    :catch_0
    move-exception v14

    .line 86
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mining/app/zxing/decoding/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v14}, Lcom/google/zxing/MultiFormatReader;->reset()V

    goto :goto_0

    .line 85
    :catchall_0
    move-exception v14

    .line 86
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mining/app/zxing/decoding/DecodeHandler;->multiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v15}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 87
    throw v14

    .line 103
    .end local v4    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    .restart local v8    # "handler":Landroid/os/Handler;
    :cond_2
    if-eqz v8, :cond_1

    .line 104
    const v14, 0x7f0a0005

    invoke-static {v8, v14}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v9

    .line 105
    .restart local v9    # "message":Landroid/os/Message;
    invoke-virtual {v9}, Landroid/os/Message;->sendToTarget()V

    goto :goto_1
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/mining/app/zxing/decoding/DecodeHandler;->running:Z

    if-nez v0, :cond_0

    .line 65
    :goto_0
    return-void

    .line 56
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 58
    :sswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v0, v1, v2}, Lcom/mining/app/zxing/decoding/DecodeHandler;->decode([BII)V

    goto :goto_0

    .line 61
    :sswitch_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mining/app/zxing/decoding/DecodeHandler;->running:Z

    .line 62
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    goto :goto_0

    .line 56
    :sswitch_data_0
    .sparse-switch
        0x7f0a0004 -> :sswitch_0
        0x7f0a000a -> :sswitch_1
    .end sparse-switch
.end method
