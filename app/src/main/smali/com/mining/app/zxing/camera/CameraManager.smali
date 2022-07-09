.class public final Lcom/mining/app/zxing/camera/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# static fields
.field private static final MAX_FRAME_HEIGHT:I = 0x2a3

.field private static final MAX_FRAME_WIDTH:I = 0x4b0

.field private static final MIN_FRAME_HEIGHT:I = 0xf0

.field private static final MIN_FRAME_WIDTH:I = 0xf0

.field static final SDK_INT:I

.field private static final TAG:Ljava/lang/String;

.field private static cameraManager:Lcom/mining/app/zxing/camera/CameraManager;


# instance fields
.field private final autoFocusCallback:Lcom/mining/app/zxing/camera/AutoFocusCallback;

.field private camera:Landroid/hardware/Camera;

.field private final configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

.field private final context:Landroid/content/Context;

.field private framingRect:Landroid/graphics/Rect;

.field private framingRectInPreview:Landroid/graphics/Rect;

.field private initialized:Z

.field private final previewCallback:Lcom/mining/app/zxing/camera/PreviewCallback;

.field private previewing:Z

.field private final useOneShotPreviewCallback:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 39
    const-class v2, Lcom/mining/app/zxing/camera/CameraManager;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/mining/app/zxing/camera/CameraManager;->TAG:Ljava/lang/String;

    .line 52
    :try_start_0
    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 57
    .local v1, "sdkInt":I
    :goto_0
    sput v1, Lcom/mining/app/zxing/camera/CameraManager;->SDK_INT:I

    .line 58
    return-void

    .line 53
    .end local v1    # "sdkInt":I
    :catch_0
    move-exception v0

    .line 55
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    const/16 v1, 0x2710

    .restart local v1    # "sdkInt":I
    goto :goto_0
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lcom/mining/app/zxing/camera/CameraManager;->context:Landroid/content/Context;

    .line 99
    new-instance v0, Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    invoke-direct {v0, p1}, Lcom/mining/app/zxing/camera/CameraConfigurationManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    .line 106
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->useOneShotPreviewCallback:Z

    .line 108
    new-instance v0, Lcom/mining/app/zxing/camera/PreviewCallback;

    iget-object v1, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    iget-boolean v2, p0, Lcom/mining/app/zxing/camera/CameraManager;->useOneShotPreviewCallback:Z

    invoke-direct {v0, v1, v2}, Lcom/mining/app/zxing/camera/PreviewCallback;-><init>(Lcom/mining/app/zxing/camera/CameraConfigurationManager;Z)V

    iput-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewCallback:Lcom/mining/app/zxing/camera/PreviewCallback;

    .line 109
    new-instance v0, Lcom/mining/app/zxing/camera/AutoFocusCallback;

    invoke-direct {v0}, Lcom/mining/app/zxing/camera/AutoFocusCallback;-><init>()V

    iput-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->autoFocusCallback:Lcom/mining/app/zxing/camera/AutoFocusCallback;

    .line 110
    return-void

    .line 106
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static findDesiredDimensionInRange(III)I
    .locals 2
    .param p0, "resolution"    # I
    .param p1, "hardMin"    # I
    .param p2, "hardMax"    # I

    .prologue
    .line 242
    mul-int/lit8 v1, p0, 0x5

    div-int/lit8 v0, v1, 0x8

    .line 243
    .local v0, "dim":I
    if-ge v0, p1, :cond_0

    .line 249
    .end local p1    # "hardMin":I
    :goto_0
    return p1

    .line 246
    .restart local p1    # "hardMin":I
    :cond_0
    if-le v0, p2, :cond_1

    move p1, p2

    .line 247
    goto :goto_0

    :cond_1
    move p1, v0

    .line 249
    goto :goto_0
.end method

.method public static get()Lcom/mining/app/zxing/camera/CameraManager;
    .locals 1

    .prologue
    .line 93
    sget-object v0, Lcom/mining/app/zxing/camera/CameraManager;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    return-object v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 82
    sget-object v0, Lcom/mining/app/zxing/camera/CameraManager;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    if-nez v0, :cond_0

    .line 83
    new-instance v0, Lcom/mining/app/zxing/camera/CameraManager;

    invoke-direct {v0, p0}, Lcom/mining/app/zxing/camera/CameraManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/mining/app/zxing/camera/CameraManager;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    .line 85
    :cond_0
    return-void
.end method


# virtual methods
.method public buildLuminanceSource([BII)Lcom/mining/app/zxing/camera/PlanarYUVLuminanceSource;
    .locals 11
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 303
    invoke-virtual {p0}, Lcom/mining/app/zxing/camera/CameraManager;->getFramingRectInPreview()Landroid/graphics/Rect;

    move-result-object v10

    .line 304
    .local v10, "rect":Landroid/graphics/Rect;
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    invoke-virtual {v0}, Lcom/mining/app/zxing/camera/CameraConfigurationManager;->getPreviewFormat()I

    move-result v8

    .line 305
    .local v8, "previewFormat":I
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    invoke-virtual {v0}, Lcom/mining/app/zxing/camera/CameraConfigurationManager;->getPreviewFormatString()Ljava/lang/String;

    move-result-object v9

    .line 306
    .local v9, "previewFormatString":Ljava/lang/String;
    sget-object v0, Lcom/mining/app/zxing/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "width = "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " height = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " rect.left = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v10, Landroid/graphics/Rect;->left:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " rect.top = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v10, Landroid/graphics/Rect;->top:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " rect.width = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " rect.height = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    packed-switch v8, :pswitch_data_0

    .line 319
    const-string/jumbo v0, "yuv420p"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    new-instance v0, Lcom/mining/app/zxing/camera/PlanarYUVLuminanceSource;

    iget v4, v10, Landroid/graphics/Rect;->left:I

    iget v5, v10, Landroid/graphics/Rect;->top:I

    .line 321
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v7

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 320
    invoke-direct/range {v0 .. v7}, Lcom/mining/app/zxing/camera/PlanarYUVLuminanceSource;-><init>([BIIIIII)V

    :goto_0
    return-object v0

    .line 314
    :pswitch_0
    new-instance v0, Lcom/mining/app/zxing/camera/PlanarYUVLuminanceSource;

    iget v4, v10, Landroid/graphics/Rect;->left:I

    iget v5, v10, Landroid/graphics/Rect;->top:I

    .line 315
    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v7

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 314
    invoke-direct/range {v0 .. v7}, Lcom/mining/app/zxing/camera/PlanarYUVLuminanceSource;-><init>([BIIIIII)V

    goto :goto_0

    .line 324
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Unsupported picture format: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 325
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 324
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 307
    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public closeDriver()V
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 147
    invoke-static {}, Lcom/mining/app/zxing/camera/FlashlightManager;->disableFlashlight()V

    .line 148
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 149
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 151
    :cond_0
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->context:Landroid/content/Context;

    return-object v0
.end method

.method public declared-synchronized getFramingRect()Landroid/graphics/Rect;
    .locals 8

    .prologue
    const/4 v5, 0x0

    .line 220
    monitor-enter p0

    :try_start_0
    iget-object v6, p0, Lcom/mining/app/zxing/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    if-nez v6, :cond_2

    .line 221
    iget-object v6, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v6, :cond_1

    .line 238
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v5

    .line 224
    :cond_1
    :try_start_1
    iget-object v6, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    invoke-virtual {v6}, Lcom/mining/app/zxing/camera/CameraConfigurationManager;->getScreenResolution()Landroid/graphics/Point;

    move-result-object v2

    .line 225
    .local v2, "screenResolution":Landroid/graphics/Point;
    if-eqz v2, :cond_0

    .line 230
    iget v5, v2, Landroid/graphics/Point;->x:I

    const/16 v6, 0xf0

    const/16 v7, 0x4b0

    invoke-static {v5, v6, v7}, Lcom/mining/app/zxing/camera/CameraManager;->findDesiredDimensionInRange(III)I

    move-result v4

    .line 231
    .local v4, "width":I
    iget v5, v2, Landroid/graphics/Point;->y:I

    const/16 v6, 0xf0

    const/16 v7, 0x2a3

    invoke-static {v5, v6, v7}, Lcom/mining/app/zxing/camera/CameraManager;->findDesiredDimensionInRange(III)I

    move-result v0

    .line 233
    .local v0, "height":I
    iget v5, v2, Landroid/graphics/Point;->x:I

    sub-int/2addr v5, v4

    div-int/lit8 v1, v5, 0x2

    .line 234
    .local v1, "leftOffset":I
    iget v5, v2, Landroid/graphics/Point;->y:I

    sub-int/2addr v5, v0

    div-int/lit8 v3, v5, 0x2

    .line 235
    .local v3, "topOffset":I
    new-instance v5, Landroid/graphics/Rect;

    add-int v6, v1, v4

    add-int v7, v3, v0

    invoke-direct {v5, v1, v3, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v5, p0, Lcom/mining/app/zxing/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    .line 236
    sget-object v5, Lcom/mining/app/zxing/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "Calculated framing rect: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/mining/app/zxing/camera/CameraManager;->framingRect:Landroid/graphics/Rect;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    .end local v0    # "height":I
    .end local v1    # "leftOffset":I
    .end local v2    # "screenResolution":Landroid/graphics/Point;
    .end local v3    # "topOffset":I
    .end local v4    # "width":I
    :cond_2
    iget-object v5, p0, Lcom/mining/app/zxing/camera/CameraManager;->framingRect:Landroid/graphics/Rect;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 220
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public getFramingRectInPreview()Landroid/graphics/Rect;
    .locals 6

    .prologue
    .line 257
    iget-object v3, p0, Lcom/mining/app/zxing/camera/CameraManager;->framingRectInPreview:Landroid/graphics/Rect;

    if-nez v3, :cond_0

    .line 258
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/mining/app/zxing/camera/CameraManager;->getFramingRect()Landroid/graphics/Rect;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 259
    .local v1, "rect":Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    invoke-virtual {v3}, Lcom/mining/app/zxing/camera/CameraConfigurationManager;->getCameraResolution()Landroid/graphics/Point;

    move-result-object v0

    .line 260
    .local v0, "cameraResolution":Landroid/graphics/Point;
    iget-object v3, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    invoke-virtual {v3}, Lcom/mining/app/zxing/camera/CameraConfigurationManager;->getScreenResolution()Landroid/graphics/Point;

    move-result-object v2

    .line 261
    .local v2, "screenResolution":Landroid/graphics/Point;
    iget v3, v1, Landroid/graphics/Rect;->left:I

    iget v4, v0, Landroid/graphics/Point;->x:I

    mul-int/2addr v3, v4

    iget v4, v2, Landroid/graphics/Point;->x:I

    div-int/2addr v3, v4

    iput v3, v1, Landroid/graphics/Rect;->left:I

    .line 262
    iget v3, v1, Landroid/graphics/Rect;->right:I

    iget v4, v0, Landroid/graphics/Point;->x:I

    mul-int/2addr v3, v4

    iget v4, v2, Landroid/graphics/Point;->x:I

    div-int/2addr v3, v4

    iput v3, v1, Landroid/graphics/Rect;->right:I

    .line 263
    iget v3, v1, Landroid/graphics/Rect;->top:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    mul-int/2addr v3, v4

    iget v4, v2, Landroid/graphics/Point;->y:I

    div-int/2addr v3, v4

    iput v3, v1, Landroid/graphics/Rect;->top:I

    .line 264
    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    mul-int/2addr v3, v4

    iget v4, v2, Landroid/graphics/Point;->y:I

    div-int/2addr v3, v4

    iput v3, v1, Landroid/graphics/Rect;->bottom:I

    .line 266
    sget-object v3, Lcom/mining/app/zxing/camera/CameraManager;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "rect = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    iput-object v1, p0, Lcom/mining/app/zxing/camera/CameraManager;->framingRectInPreview:Landroid/graphics/Rect;

    .line 269
    .end local v0    # "cameraResolution":Landroid/graphics/Point;
    .end local v1    # "rect":Landroid/graphics/Rect;
    .end local v2    # "screenResolution":Landroid/graphics/Point;
    :cond_0
    iget-object v3, p0, Lcom/mining/app/zxing/camera/CameraManager;->framingRectInPreview:Landroid/graphics/Rect;

    return-object v3
.end method

.method public openDriver(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-nez v0, :cond_2

    .line 120
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v0

    iput-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 121
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 126
    iget-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->initialized:Z

    if-nez v0, :cond_1

    .line 127
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->initialized:Z

    .line 128
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    iget-object v1, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Lcom/mining/app/zxing/camera/CameraConfigurationManager;->initFromCameraParameters(Landroid/hardware/Camera;)V

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->configManager:Lcom/mining/app/zxing/camera/CameraConfigurationManager;

    iget-object v1, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Lcom/mining/app/zxing/camera/CameraConfigurationManager;->setDesiredCameraParameters(Landroid/hardware/Camera;)V

    .line 138
    invoke-static {}, Lcom/mining/app/zxing/camera/FlashlightManager;->enableFlashlight()V

    .line 140
    :cond_2
    return-void
.end method

.method public requestAutoFocus(Landroid/os/Handler;I)V
    .locals 2
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "message"    # I

    .prologue
    .line 204
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewing:Z

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->autoFocusCallback:Lcom/mining/app/zxing/camera/AutoFocusCallback;

    invoke-virtual {v0, p1, p2}, Lcom/mining/app/zxing/camera/AutoFocusCallback;->setHandler(Landroid/os/Handler;I)V

    .line 207
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/mining/app/zxing/camera/CameraManager;->autoFocusCallback:Lcom/mining/app/zxing/camera/AutoFocusCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 209
    :cond_0
    return-void
.end method

.method public requestPreviewFrame(Landroid/os/Handler;I)V
    .locals 2
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "message"    # I

    .prologue
    .line 187
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewing:Z

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewCallback:Lcom/mining/app/zxing/camera/PreviewCallback;

    invoke-virtual {v0, p1, p2}, Lcom/mining/app/zxing/camera/PreviewCallback;->setHandler(Landroid/os/Handler;I)V

    .line 189
    iget-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->useOneShotPreviewCallback:Z

    if-eqz v0, :cond_1

    .line 190
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewCallback:Lcom/mining/app/zxing/camera/PreviewCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 195
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    iget-object v1, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewCallback:Lcom/mining/app/zxing/camera/PreviewCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    goto :goto_0
.end method

.method public startPreview()V
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewing:Z

    if-nez v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewing:Z

    .line 161
    :cond_0
    return-void
.end method

.method public stopPreview()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 167
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewing:Z

    if-eqz v0, :cond_1

    .line 168
    iget-boolean v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->useOneShotPreviewCallback:Z

    if-nez v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 171
    :cond_0
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 172
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewCallback:Lcom/mining/app/zxing/camera/PreviewCallback;

    invoke-virtual {v0, v2, v1}, Lcom/mining/app/zxing/camera/PreviewCallback;->setHandler(Landroid/os/Handler;I)V

    .line 173
    iget-object v0, p0, Lcom/mining/app/zxing/camera/CameraManager;->autoFocusCallback:Lcom/mining/app/zxing/camera/AutoFocusCallback;

    invoke-virtual {v0, v2, v1}, Lcom/mining/app/zxing/camera/AutoFocusCallback;->setHandler(Landroid/os/Handler;I)V

    .line 174
    iput-boolean v1, p0, Lcom/mining/app/zxing/camera/CameraManager;->previewing:Z

    .line 176
    :cond_1
    return-void
.end method
