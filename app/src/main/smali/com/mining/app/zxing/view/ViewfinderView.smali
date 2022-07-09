.class public final Lcom/mining/app/zxing/view/ViewfinderView;
.super Landroid/view/View;
.source "ViewfinderView.java"


# static fields
.field private static final ANIMATION_DELAY:J = 0x50L

.field private static final CURRENT_POINT_OPACITY:I = 0xa0

.field private static final MAX_RESULT_POINTS:I = 0x14

.field private static final POINT_SIZE:I = 0x6

.field private static final SCANNER_ALPHA:[I


# instance fields
.field private cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

.field private final frameColor:I

.field private final laserColor:I

.field private lastPossibleResultPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/ResultPoint;",
            ">;"
        }
    .end annotation
.end field

.field private final maskColor:I

.field private final paint:Landroid/graphics/Paint;

.field private possibleResultPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/zxing/ResultPoint;",
            ">;"
        }
    .end annotation
.end field

.field private resultBitmap:Landroid/graphics/Bitmap;

.field private final resultColor:I

.field private final resultPointColor:I

.field private scannerAlpha:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v5, 0xc0

    const/16 v4, 0x80

    const/16 v3, 0x40

    .line 43
    const/16 v0, 0x8

    new-array v0, v0, [I

    const/4 v1, 0x1

    aput v3, v0, v1

    const/4 v1, 0x2

    aput v4, v0, v1

    const/4 v1, 0x3

    aput v5, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0xff

    aput v2, v0, v1

    const/4 v1, 0x5

    aput v5, v0, v1

    const/4 v1, 0x6

    aput v4, v0, v1

    const/4 v1, 0x7

    aput v3, v0, v1

    sput-object v0, Lcom/mining/app/zxing/view/ViewfinderView;->SCANNER_ALPHA:[I

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 66
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    .line 67
    invoke-virtual {p0}, Lcom/mining/app/zxing/view/ViewfinderView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 68
    .local v0, "resources":Landroid/content/res/Resources;
    const v1, 0x7f0c000c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->maskColor:I

    .line 69
    const v1, 0x7f0c000b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->resultColor:I

    .line 70
    const v1, 0x7f0c000e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->frameColor:I

    .line 71
    const v1, 0x7f0c000f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->laserColor:I

    .line 72
    const v1, 0x7f0c000d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->resultPointColor:I

    .line 73
    const/4 v1, 0x0

    iput v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->scannerAlpha:I

    .line 74
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->possibleResultPoints:Ljava/util/List;

    .line 75
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->lastPossibleResultPoints:Ljava/util/List;

    .line 76
    return-void
.end method


# virtual methods
.method public addPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V
    .locals 4
    .param p1, "point"    # Lcom/google/zxing/ResultPoint;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/mining/app/zxing/view/ViewfinderView;->possibleResultPoints:Ljava/util/List;

    .line 185
    .local v0, "points":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    monitor-enter v0

    .line 186
    :try_start_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 188
    .local v1, "size":I
    const/16 v2, 0x14

    if-le v1, v2, :cond_0

    .line 190
    const/4 v2, 0x0

    add-int/lit8 v3, v1, -0xa

    invoke-interface {v0, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 185
    :cond_0
    monitor-exit v0

    .line 193
    return-void

    .line 185
    .end local v1    # "size":I
    :catchall_0
    move-exception v2

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public drawResultBitmap(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "barcode"    # Landroid/graphics/Bitmap;

    .prologue
    .line 179
    iput-object p1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    .line 180
    invoke-virtual {p0}, Lcom/mining/app/zxing/view/ViewfinderView;->invalidate()V

    .line 181
    return-void
.end method

.method public drawViewfinder()V
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/mining/app/zxing/view/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    .line 166
    .local v0, "resultBitmap":Landroid/graphics/Bitmap;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    .line 167
    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 170
    :cond_0
    invoke-virtual {p0}, Lcom/mining/app/zxing/view/ViewfinderView;->invalidate()V

    .line 171
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 23
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 84
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    invoke-virtual {v2}, Lcom/mining/app/zxing/camera/CameraManager;->getFramingRect()Landroid/graphics/Rect;

    move-result-object v12

    .line 85
    .local v12, "frame":Landroid/graphics/Rect;
    if-nez v12, :cond_0

    .line 162
    :goto_0
    return-void

    .line 88
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v22

    .line 89
    .local v22, "width":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v15

    .line 92
    .local v15, "height":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_1

    move-object/from16 v0, p0

    iget v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->resultColor:I

    :goto_1
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 93
    const/4 v3, 0x0

    const/4 v4, 0x0

    move/from16 v0, v22

    int-to-float v5, v0

    iget v2, v12, Landroid/graphics/Rect;->top:I

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 94
    const/4 v3, 0x0

    iget v2, v12, Landroid/graphics/Rect;->top:I

    int-to-float v4, v2

    iget v2, v12, Landroid/graphics/Rect;->left:I

    int-to-float v5, v2

    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 95
    iget v2, v12, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v3, v2

    iget v2, v12, Landroid/graphics/Rect;->top:I

    int-to-float v4, v2

    move/from16 v0, v22

    int-to-float v5, v0

    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 96
    const/4 v3, 0x0

    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v4, v2

    move/from16 v0, v22

    int-to-float v5, v0

    int-to-float v6, v15

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 98
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_2

    .line 100
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 101
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->resultBitmap:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v12, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 92
    :cond_1
    move-object/from16 v0, p0

    iget v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->maskColor:I

    goto :goto_1

    .line 105
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/mining/app/zxing/view/ViewfinderView;->frameColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 106
    iget v2, v12, Landroid/graphics/Rect;->left:I

    int-to-float v3, v2

    iget v2, v12, Landroid/graphics/Rect;->top:I

    int-to-float v4, v2

    iget v2, v12, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v5, v2

    iget v2, v12, Landroid/graphics/Rect;->top:I

    add-int/lit8 v2, v2, 0x2

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 107
    iget v2, v12, Landroid/graphics/Rect;->left:I

    int-to-float v3, v2

    iget v2, v12, Landroid/graphics/Rect;->top:I

    add-int/lit8 v2, v2, 0x2

    int-to-float v4, v2

    iget v2, v12, Landroid/graphics/Rect;->left:I

    add-int/lit8 v2, v2, 0x2

    int-to-float v5, v2

    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 108
    iget v2, v12, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v3, v2

    iget v2, v12, Landroid/graphics/Rect;->top:I

    int-to-float v4, v2

    iget v2, v12, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v5, v2

    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 109
    iget v2, v12, Landroid/graphics/Rect;->left:I

    int-to-float v3, v2

    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v4, v2

    iget v2, v12, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v5, v2

    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v2, v2, 0x1

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 112
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/mining/app/zxing/view/ViewfinderView;->laserColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 113
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    sget-object v3, Lcom/mining/app/zxing/view/ViewfinderView;->SCANNER_ALPHA:[I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/mining/app/zxing/view/ViewfinderView;->scannerAlpha:I

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 114
    move-object/from16 v0, p0

    iget v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->scannerAlpha:I

    add-int/lit8 v2, v2, 0x1

    sget-object v3, Lcom/mining/app/zxing/view/ViewfinderView;->SCANNER_ALPHA:[I

    array-length v3, v3

    rem-int/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->scannerAlpha:I

    .line 115
    invoke-virtual {v12}, Landroid/graphics/Rect;->height()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iget v3, v12, Landroid/graphics/Rect;->top:I

    add-int v16, v2, v3

    .line 116
    .local v16, "middle":I
    iget v2, v12, Landroid/graphics/Rect;->left:I

    add-int/lit8 v2, v2, 0x2

    int-to-float v3, v2

    add-int/lit8 v2, v16, -0x1

    int-to-float v4, v2

    iget v2, v12, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v2, -0x1

    int-to-float v5, v2

    add-int/lit8 v2, v16, 0x2

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 118
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    invoke-virtual {v2}, Lcom/mining/app/zxing/camera/CameraManager;->getFramingRectInPreview()Landroid/graphics/Rect;

    move-result-object v18

    .line 119
    .local v18, "previewFrame":Landroid/graphics/Rect;
    invoke-virtual {v12}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float v20, v2, v3

    .line 120
    .local v20, "scaleX":F
    invoke-virtual {v12}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    div-float v21, v2, v3

    .line 122
    .local v21, "scaleY":F
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mining/app/zxing/view/ViewfinderView;->possibleResultPoints:Ljava/util/List;

    .line 123
    .local v11, "currentPossible":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/mining/app/zxing/view/ViewfinderView;->lastPossibleResultPoints:Ljava/util/List;

    .line 124
    .local v10, "currentLast":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/ResultPoint;>;"
    iget v13, v12, Landroid/graphics/Rect;->left:I

    .line 125
    .local v13, "frameLeft":I
    iget v14, v12, Landroid/graphics/Rect;->top:I

    .line 126
    .local v14, "frameTop":I
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 127
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->lastPossibleResultPoints:Ljava/util/List;

    .line 141
    :goto_2
    if-eqz v10, :cond_3

    .line 142
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    const/16 v3, 0x50

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 143
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/mining/app/zxing/view/ViewfinderView;->resultPointColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 144
    monitor-enter v10

    .line 145
    const/high16 v19, 0x40400000    # 3.0f

    .line 146
    .local v19, "radius":F
    :try_start_0
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_6

    .line 144
    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 156
    .end local v19    # "radius":F
    :cond_3
    const-wide/16 v4, 0x50

    .line 157
    iget v2, v12, Landroid/graphics/Rect;->left:I

    add-int/lit8 v6, v2, -0x6

    .line 158
    iget v2, v12, Landroid/graphics/Rect;->top:I

    add-int/lit8 v7, v2, -0x6

    .line 159
    iget v2, v12, Landroid/graphics/Rect;->right:I

    add-int/lit8 v8, v2, 0x6

    .line 160
    iget v2, v12, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v9, v2, 0x6

    move-object/from16 v3, p0

    .line 156
    invoke-virtual/range {v3 .. v9}, Lcom/mining/app/zxing/view/ViewfinderView;->postInvalidateDelayed(JIIII)V

    goto/16 :goto_0

    .line 129
    :cond_4
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x5

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->possibleResultPoints:Ljava/util/List;

    .line 130
    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/mining/app/zxing/view/ViewfinderView;->lastPossibleResultPoints:Ljava/util/List;

    .line 131
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xa0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 132
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/mining/app/zxing/view/ViewfinderView;->resultPointColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 133
    monitor-enter v11

    .line 134
    :try_start_1
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_5

    .line 133
    monitor-exit v11

    goto :goto_2

    :catchall_0
    move-exception v2

    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 134
    :cond_5
    :try_start_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/google/zxing/ResultPoint;

    .line 135
    .local v17, "point":Lcom/google/zxing/ResultPoint;
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    mul-float v3, v3, v20

    float-to-int v3, v3

    add-int/2addr v3, v13

    int-to-float v3, v3

    .line 136
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    mul-float v4, v4, v21

    float-to-int v4, v4

    add-int/2addr v4, v14

    int-to-float v4, v4

    .line 137
    const/high16 v5, 0x40c00000    # 6.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    .line 135
    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_4

    .line 146
    .end local v17    # "point":Lcom/google/zxing/ResultPoint;
    .restart local v19    # "radius":F
    :cond_6
    :try_start_3
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/google/zxing/ResultPoint;

    .line 147
    .restart local v17    # "point":Lcom/google/zxing/ResultPoint;
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    mul-float v3, v3, v20

    float-to-int v3, v3

    add-int/2addr v3, v13

    int-to-float v3, v3

    .line 148
    invoke-virtual/range {v17 .. v17}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    mul-float v4, v4, v21

    float-to-int v4, v4

    add-int/2addr v4, v14

    int-to-float v4, v4

    .line 149
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mining/app/zxing/view/ViewfinderView;->paint:Landroid/graphics/Paint;

    .line 147
    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v3, v4, v1, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_3

    .line 144
    .end local v17    # "point":Lcom/google/zxing/ResultPoint;
    :catchall_1
    move-exception v2

    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v2
.end method

.method public setCameraManager(Lcom/mining/app/zxing/camera/CameraManager;)V
    .locals 0
    .param p1, "cameraManager"    # Lcom/mining/app/zxing/camera/CameraManager;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/mining/app/zxing/view/ViewfinderView;->cameraManager:Lcom/mining/app/zxing/camera/CameraManager;

    .line 80
    return-void
.end method
