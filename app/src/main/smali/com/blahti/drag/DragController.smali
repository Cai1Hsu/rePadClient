.class public Lcom/blahti/drag/DragController;
.super Ljava/lang/Object;
.source "DragController.java"


# static fields
.field public static DRAG_ACTION_COPY:I = 0x0

.field public static DRAG_ACTION_MOVE:I = 0x0

.field private static final PROFILE_DRAWING_DURING_DRAG:Z = false

.field private static final TAG:Ljava/lang/String; = "DragController"

.field private static final VIBRATE_DURATION:I = 0x23


# instance fields
.field private mContext:Landroid/content/Context;

.field private final mCoordinatesTemp:[I

.field private mDisplayMetrics:Landroid/util/DisplayMetrics;

.field private mDragInfo:Ljava/lang/Object;

.field private mDragSource:Lcom/blahti/drag/DragSource;

.field private mDragView:Lcom/blahti/drag/DragView;

.field private mDragging:Z

.field private mDropTargets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/blahti/drag/DropTarget;",
            ">;"
        }
    .end annotation
.end field

.field private mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field private mLastDropTarget:Lcom/blahti/drag/DropTarget;

.field private mListener:Lcom/blahti/drag/DragListener;

.field private mMotionDownX:F

.field private mMotionDownY:F

.field private mMoveTarget:Landroid/view/View;

.field private mOriginator:Landroid/view/View;

.field private mRectTemp:Landroid/graphics/Rect;

.field private mTouchOffsetX:F

.field private mTouchOffsetY:F

.field private mWindowToken:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    const/4 v0, 0x0

    sput v0, Lcom/blahti/drag/DragController;->DRAG_ACTION_MOVE:I

    .line 52
    const/4 v0, 0x1

    sput v0, Lcom/blahti/drag/DragController;->DRAG_ACTION_COPY:I

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/blahti/drag/DragController;->mRectTemp:Landroid/graphics/Rect;

    .line 63
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/blahti/drag/DragController;->mCoordinatesTemp:[I

    .line 75
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/blahti/drag/DragController;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/blahti/drag/DragController;->mDropTargets:Ljava/util/ArrayList;

    .line 116
    iput-object p1, p0, Lcom/blahti/drag/DragController;->mContext:Landroid/content/Context;

    .line 119
    return-void
.end method

.method private static clamp(III)I
    .locals 0
    .param p0, "val"    # I
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 474
    if-ge p0, p1, :cond_0

    .line 479
    .end local p1    # "min":I
    :goto_0
    return p1

    .line 476
    .restart local p1    # "min":I
    :cond_0
    if-lt p0, p2, :cond_1

    .line 477
    add-int/lit8 p1, p2, -0x1

    goto :goto_0

    :cond_1
    move p1, p0

    .line 479
    goto :goto_0
.end method

.method private drop(FF)Z
    .locals 11
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 422
    iget-object v8, p0, Lcom/blahti/drag/DragController;->mCoordinatesTemp:[I

    .line 423
    .local v8, "coordinates":[I
    float-to-int v1, p1

    float-to-int v2, p2

    invoke-direct {p0, v1, v2, v8}, Lcom/blahti/drag/DragController;->findDropTarget(II[I)Lcom/blahti/drag/DropTarget;

    move-result-object v0

    .line 425
    .local v0, "dropTarget":Lcom/blahti/drag/DropTarget;
    if-eqz v0, :cond_1

    .line 426
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    aget v2, v8, v10

    aget v3, v8, v9

    .line 427
    iget v4, p0, Lcom/blahti/drag/DragController;->mTouchOffsetX:F

    float-to-int v4, v4

    iget v5, p0, Lcom/blahti/drag/DragController;->mTouchOffsetY:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    iget-object v7, p0, Lcom/blahti/drag/DragController;->mDragInfo:Ljava/lang/Object;

    .line 426
    invoke-interface/range {v0 .. v7}, Lcom/blahti/drag/DropTarget;->onDragExit(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V

    .line 428
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    aget v2, v8, v10

    aget v3, v8, v9

    .line 429
    iget v4, p0, Lcom/blahti/drag/DragController;->mTouchOffsetX:F

    float-to-int v4, v4

    iget v5, p0, Lcom/blahti/drag/DragController;->mTouchOffsetY:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    iget-object v7, p0, Lcom/blahti/drag/DragController;->mDragInfo:Ljava/lang/Object;

    .line 428
    invoke-interface/range {v0 .. v7}, Lcom/blahti/drag/DropTarget;->acceptDrop(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)Z

    move-result v1

    .line 429
    if-eqz v1, :cond_0

    .line 430
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    aget v2, v8, v10

    aget v3, v8, v9

    .line 431
    iget v4, p0, Lcom/blahti/drag/DragController;->mTouchOffsetX:F

    float-to-int v4, v4

    iget v5, p0, Lcom/blahti/drag/DragController;->mTouchOffsetY:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    iget-object v7, p0, Lcom/blahti/drag/DragController;->mDragInfo:Ljava/lang/Object;

    .line 430
    invoke-interface/range {v0 .. v7}, Lcom/blahti/drag/DropTarget;->onDrop(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V

    .line 432
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    check-cast v0, Landroid/view/View;

    .end local v0    # "dropTarget":Lcom/blahti/drag/DropTarget;
    invoke-interface {v1, v0, v9}, Lcom/blahti/drag/DragSource;->onDropCompleted(Landroid/view/View;Z)V

    move v1, v9

    .line 439
    :goto_0
    return v1

    .line 435
    .restart local v0    # "dropTarget":Lcom/blahti/drag/DropTarget;
    :cond_0
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    check-cast v0, Landroid/view/View;

    .end local v0    # "dropTarget":Lcom/blahti/drag/DropTarget;
    invoke-interface {v1, v0, v10}, Lcom/blahti/drag/DragSource;->onDropCompleted(Landroid/view/View;Z)V

    move v1, v9

    .line 436
    goto :goto_0

    .restart local v0    # "dropTarget":Lcom/blahti/drag/DropTarget;
    :cond_1
    move v1, v10

    .line 439
    goto :goto_0
.end method

.method private endDrag()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 268
    iget-boolean v0, p0, Lcom/blahti/drag/DragController;->mDragging:Z

    if-eqz v0, :cond_2

    .line 269
    iput-boolean v1, p0, Lcom/blahti/drag/DragController;->mDragging:Z

    .line 270
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mOriginator:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mOriginator:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 273
    :cond_0
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mListener:Lcom/blahti/drag/DragListener;

    if-eqz v0, :cond_1

    .line 274
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mListener:Lcom/blahti/drag/DragListener;

    invoke-interface {v0}, Lcom/blahti/drag/DragListener;->onDragEnd()V

    .line 276
    :cond_1
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    if-eqz v0, :cond_2

    .line 277
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    invoke-virtual {v0}, Lcom/blahti/drag/DragView;->remove()V

    .line 278
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    .line 281
    :cond_2
    return-void
.end method

.method private findDropTarget(II[I)Lcom/blahti/drag/DropTarget;
    .locals 10
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "dropCoordinates"    # [I

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 443
    iget-object v3, p0, Lcom/blahti/drag/DragController;->mRectTemp:Landroid/graphics/Rect;

    .line 445
    .local v3, "r":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDropTargets:Ljava/util/ArrayList;

    .line 446
    .local v1, "dropTargets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/blahti/drag/DropTarget;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 447
    .local v0, "count":I
    add-int/lit8 v2, v0, -0x1

    .local v2, "i":I
    :goto_0
    if-gez v2, :cond_0

    .line 458
    const/4 v4, 0x0

    :goto_1
    return-object v4

    .line 448
    :cond_0
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/blahti/drag/DropTarget;

    .line 449
    .local v4, "target":Lcom/blahti/drag/DropTarget;
    invoke-interface {v4, v3}, Lcom/blahti/drag/DropTarget;->getHitRect(Landroid/graphics/Rect;)V

    .line 450
    invoke-interface {v4, p3}, Lcom/blahti/drag/DropTarget;->getLocationOnScreen([I)V

    .line 451
    aget v5, p3, v8

    invoke-interface {v4}, Lcom/blahti/drag/DropTarget;->getLeft()I

    move-result v6

    sub-int/2addr v5, v6

    aget v6, p3, v9

    invoke-interface {v4}, Lcom/blahti/drag/DropTarget;->getTop()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v3, v5, v6}, Landroid/graphics/Rect;->offset(II)V

    .line 452
    invoke-virtual {v3, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 453
    aget v5, p3, v8

    sub-int v5, p1, v5

    aput v5, p3, v8

    .line 454
    aget v5, p3, v9

    sub-int v5, p2, v5

    aput v5, p3, v9

    goto :goto_1

    .line 447
    :cond_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method

.method private getViewBitmap(Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 215
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 216
    invoke-virtual {p1, v4}, Landroid/view/View;->setPressed(Z)V

    .line 218
    invoke-virtual {p1}, Landroid/view/View;->willNotCacheDrawing()Z

    move-result v3

    .line 219
    .local v3, "willNotCache":Z
    invoke-virtual {p1, v4}, Landroid/view/View;->setWillNotCacheDrawing(Z)V

    .line 223
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCacheBackgroundColor()I

    move-result v2

    .line 224
    .local v2, "color":I
    invoke-virtual {p1, v4}, Landroid/view/View;->setDrawingCacheBackgroundColor(I)V

    .line 226
    if-eqz v2, :cond_0

    .line 227
    invoke-virtual {p1}, Landroid/view/View;->destroyDrawingCache()V

    .line 229
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->buildDrawingCache()V

    .line 230
    invoke-virtual {p1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 231
    .local v1, "cacheBitmap":Landroid/graphics/Bitmap;
    if-nez v1, :cond_1

    .line 232
    const-string/jumbo v4, "DragController"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "failed getViewBitmap("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6}, Ljava/lang/RuntimeException;-><init>()V

    invoke-static {v4, v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 233
    const/4 v0, 0x0

    .line 243
    :goto_0
    return-object v0

    .line 236
    :cond_1
    invoke-static {v1}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 239
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p1}, Landroid/view/View;->destroyDrawingCache()V

    .line 240
    invoke-virtual {p1, v3}, Landroid/view/View;->setWillNotCacheDrawing(Z)V

    .line 241
    invoke-virtual {p1, v2}, Landroid/view/View;->setDrawingCacheBackgroundColor(I)V

    goto :goto_0
.end method

.method private recordScreenSize()V
    .locals 2

    .prologue
    .line 466
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 467
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 468
    return-void
.end method


# virtual methods
.method public addDropTarget(Lcom/blahti/drag/DropTarget;)V
    .locals 1
    .param p1, "target"    # Lcom/blahti/drag/DropTarget;

    .prologue
    .line 505
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mDropTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 506
    return-void
.end method

.method public cancelDrag()V
    .locals 0

    .prologue
    .line 264
    invoke-direct {p0}, Lcom/blahti/drag/DragController;->endDrag()V

    .line 265
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/blahti/drag/DragController;->mDragging:Z

    return v0
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 1
    .param p1, "focused"    # Landroid/view/View;
    .param p2, "direction"    # I

    .prologue
    .line 327
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mMoveTarget:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/blahti/drag/DragController;->mMoveTarget:Landroid/view/View;

    invoke-virtual {v0, p1, p2}, Landroid/view/View;->dispatchUnhandledMove(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x0

    .line 287
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 289
    .local v0, "action":I
    if-nez v0, :cond_0

    .line 290
    invoke-direct {p0}, Lcom/blahti/drag/DragController;->recordScreenSize()V

    .line 293
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    float-to-int v3, v3

    iget-object v4, p0, Lcom/blahti/drag/DragController;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v4, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v3, v5, v4}, Lcom/blahti/drag/DragController;->clamp(III)I

    move-result v1

    .line 294
    .local v1, "screenX":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    float-to-int v3, v3

    iget-object v4, p0, Lcom/blahti/drag/DragController;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v4, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v3, v5, v4}, Lcom/blahti/drag/DragController;->clamp(III)I

    move-result v2

    .line 296
    .local v2, "screenY":I
    packed-switch v0, :pswitch_data_0

    .line 316
    :goto_0
    :pswitch_0
    iget-boolean v3, p0, Lcom/blahti/drag/DragController;->mDragging:Z

    return v3

    .line 302
    :pswitch_1
    int-to-float v3, v1

    iput v3, p0, Lcom/blahti/drag/DragController;->mMotionDownX:F

    .line 303
    int-to-float v3, v2

    iput v3, p0, Lcom/blahti/drag/DragController;->mMotionDownY:F

    .line 304
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/blahti/drag/DragController;->mLastDropTarget:Lcom/blahti/drag/DropTarget;

    goto :goto_0

    .line 309
    :pswitch_2
    iget-boolean v3, p0, Lcom/blahti/drag/DragController;->mDragging:Z

    if-eqz v3, :cond_1

    .line 310
    int-to-float v3, v1

    int-to-float v4, v2

    invoke-direct {p0, v3, v4}, Lcom/blahti/drag/DragController;->drop(FF)Z

    .line 312
    :cond_1
    invoke-direct {p0}, Lcom/blahti/drag/DragController;->endDrag()V

    goto :goto_0

    .line 296
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 334
    iget-boolean v1, p0, Lcom/blahti/drag/DragController;->mDragging:Z

    if-nez v1, :cond_0

    .line 335
    const/4 v1, 0x0

    .line 417
    :goto_0
    return v1

    .line 338
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v9

    .line 339
    .local v9, "action":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    float-to-int v1, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/blahti/drag/DragController;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v1, v2, v3}, Lcom/blahti/drag/DragController;->clamp(III)I

    move-result v11

    .line 340
    .local v11, "screenX":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    float-to-int v1, v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/blahti/drag/DragController;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v1, v2, v3}, Lcom/blahti/drag/DragController;->clamp(III)I

    move-result v12

    .line 342
    .local v12, "screenY":I
    packed-switch v9, :pswitch_data_0

    .line 417
    :goto_1
    const/4 v1, 0x1

    goto :goto_0

    .line 345
    :pswitch_0
    int-to-float v1, v11

    iput v1, p0, Lcom/blahti/drag/DragController;->mMotionDownX:F

    .line 346
    int-to-float v1, v12

    iput v1, p0, Lcom/blahti/drag/DragController;->mMotionDownY:F

    goto :goto_1

    .line 351
    :pswitch_1
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/blahti/drag/DragView;->move(II)V

    .line 353
    iget-object v10, p0, Lcom/blahti/drag/DragController;->mCoordinatesTemp:[I

    .line 354
    .local v10, "coordinates":[I
    invoke-direct {p0, v11, v12, v10}, Lcom/blahti/drag/DragController;->findDropTarget(II[I)Lcom/blahti/drag/DropTarget;

    move-result-object v0

    .line 355
    .local v0, "dropTarget":Lcom/blahti/drag/DropTarget;
    if-eqz v0, :cond_4

    .line 356
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mLastDropTarget:Lcom/blahti/drag/DropTarget;

    if-ne v1, v0, :cond_2

    .line 357
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    const/4 v2, 0x0

    aget v2, v10, v2

    const/4 v3, 0x1

    aget v3, v10, v3

    .line 358
    iget v4, p0, Lcom/blahti/drag/DragController;->mTouchOffsetX:F

    float-to-int v4, v4

    iget v5, p0, Lcom/blahti/drag/DragController;->mTouchOffsetY:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    iget-object v7, p0, Lcom/blahti/drag/DragController;->mDragInfo:Ljava/lang/Object;

    .line 357
    invoke-interface/range {v0 .. v7}, Lcom/blahti/drag/DropTarget;->onDragOver(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V

    .line 373
    :cond_1
    :goto_2
    iput-object v0, p0, Lcom/blahti/drag/DragController;->mLastDropTarget:Lcom/blahti/drag/DropTarget;

    goto :goto_1

    .line 360
    :cond_2
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mLastDropTarget:Lcom/blahti/drag/DropTarget;

    if-eqz v1, :cond_3

    .line 361
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mLastDropTarget:Lcom/blahti/drag/DropTarget;

    iget-object v2, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    const/4 v3, 0x0

    aget v3, v10, v3

    const/4 v4, 0x1

    aget v4, v10, v4

    .line 362
    iget v5, p0, Lcom/blahti/drag/DragController;->mTouchOffsetX:F

    float-to-int v5, v5

    iget v6, p0, Lcom/blahti/drag/DragController;->mTouchOffsetY:F

    float-to-int v6, v6

    iget-object v7, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    iget-object v8, p0, Lcom/blahti/drag/DragController;->mDragInfo:Ljava/lang/Object;

    .line 361
    invoke-interface/range {v1 .. v8}, Lcom/blahti/drag/DropTarget;->onDragExit(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V

    .line 364
    :cond_3
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    const/4 v2, 0x0

    aget v2, v10, v2

    const/4 v3, 0x1

    aget v3, v10, v3

    .line 365
    iget v4, p0, Lcom/blahti/drag/DragController;->mTouchOffsetX:F

    float-to-int v4, v4

    iget v5, p0, Lcom/blahti/drag/DragController;->mTouchOffsetY:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    iget-object v7, p0, Lcom/blahti/drag/DragController;->mDragInfo:Ljava/lang/Object;

    .line 364
    invoke-interface/range {v0 .. v7}, Lcom/blahti/drag/DropTarget;->onDragEnter(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V

    goto :goto_2

    .line 368
    :cond_4
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mLastDropTarget:Lcom/blahti/drag/DropTarget;

    if-eqz v1, :cond_1

    .line 369
    iget-object v1, p0, Lcom/blahti/drag/DragController;->mLastDropTarget:Lcom/blahti/drag/DropTarget;

    iget-object v2, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    const/4 v3, 0x0

    aget v3, v10, v3

    const/4 v4, 0x1

    aget v4, v10, v4

    .line 370
    iget v5, p0, Lcom/blahti/drag/DragController;->mTouchOffsetX:F

    float-to-int v5, v5

    iget v6, p0, Lcom/blahti/drag/DragController;->mTouchOffsetY:F

    float-to-int v6, v6

    iget-object v7, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    iget-object v8, p0, Lcom/blahti/drag/DragController;->mDragInfo:Ljava/lang/Object;

    .line 369
    invoke-interface/range {v1 .. v8}, Lcom/blahti/drag/DropTarget;->onDragExit(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V

    goto :goto_2

    .line 407
    .end local v0    # "dropTarget":Lcom/blahti/drag/DropTarget;
    .end local v10    # "coordinates":[I
    :pswitch_2
    iget-boolean v1, p0, Lcom/blahti/drag/DragController;->mDragging:Z

    if-eqz v1, :cond_5

    .line 408
    int-to-float v1, v11

    int-to-float v2, v12

    invoke-direct {p0, v1, v2}, Lcom/blahti/drag/DragController;->drop(FF)Z

    .line 410
    :cond_5
    invoke-direct {p0}, Lcom/blahti/drag/DragController;->endDrag()V

    goto/16 :goto_1

    .line 414
    :pswitch_3
    invoke-virtual {p0}, Lcom/blahti/drag/DragController;->cancelDrag()V

    goto/16 :goto_1

    .line 342
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public removeDragListener(Lcom/blahti/drag/DragListener;)V
    .locals 1
    .param p1, "l"    # Lcom/blahti/drag/DragListener;

    .prologue
    .line 498
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/blahti/drag/DragController;->mListener:Lcom/blahti/drag/DragListener;

    .line 499
    return-void
.end method

.method public removeDropTarget(Lcom/blahti/drag/DropTarget;)V
    .locals 1
    .param p1, "target"    # Lcom/blahti/drag/DropTarget;

    .prologue
    .line 512
    iget-object v0, p0, Lcom/blahti/drag/DragController;->mDropTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 513
    return-void
.end method

.method public setDragListener(Lcom/blahti/drag/DragListener;)V
    .locals 0
    .param p1, "l"    # Lcom/blahti/drag/DragListener;

    .prologue
    .line 491
    iput-object p1, p0, Lcom/blahti/drag/DragController;->mListener:Lcom/blahti/drag/DragListener;

    .line 492
    return-void
.end method

.method setMoveTarget(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 323
    iput-object p1, p0, Lcom/blahti/drag/DragController;->mMoveTarget:Landroid/view/View;

    .line 324
    return-void
.end method

.method public setWindowToken(Landroid/os/IBinder;)V
    .locals 0
    .param p1, "token"    # Landroid/os/IBinder;

    .prologue
    .line 484
    iput-object p1, p0, Lcom/blahti/drag/DragController;->mWindowToken:Landroid/os/IBinder;

    .line 485
    return-void
.end method

.method public startDrag(Landroid/graphics/Bitmap;IIIIIILcom/blahti/drag/DragSource;Ljava/lang/Object;I)V
    .locals 12
    .param p1, "b"    # Landroid/graphics/Bitmap;
    .param p2, "screenX"    # I
    .param p3, "screenY"    # I
    .param p4, "textureLeft"    # I
    .param p5, "textureTop"    # I
    .param p6, "textureWidth"    # I
    .param p7, "textureHeight"    # I
    .param p8, "source"    # Lcom/blahti/drag/DragSource;
    .param p9, "dragInfo"    # Ljava/lang/Object;
    .param p10, "dragAction"    # I

    .prologue
    .line 185
    iget-object v4, p0, Lcom/blahti/drag/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    if-nez v4, :cond_0

    .line 187
    iget-object v4, p0, Lcom/blahti/drag/DragController;->mContext:Landroid/content/Context;

    const-string/jumbo v5, "input_method"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 186
    check-cast v4, Landroid/view/inputmethod/InputMethodManager;

    iput-object v4, p0, Lcom/blahti/drag/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 189
    :cond_0
    iget-object v4, p0, Lcom/blahti/drag/DragController;->mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v5, p0, Lcom/blahti/drag/DragController;->mWindowToken:Landroid/os/IBinder;

    const/4 v8, 0x0

    invoke-virtual {v4, v5, v8}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 191
    iget-object v4, p0, Lcom/blahti/drag/DragController;->mListener:Lcom/blahti/drag/DragListener;

    if-eqz v4, :cond_1

    .line 192
    iget-object v4, p0, Lcom/blahti/drag/DragController;->mListener:Lcom/blahti/drag/DragListener;

    move-object/from16 v0, p8

    move-object/from16 v1, p9

    move/from16 v2, p10

    invoke-interface {v4, v0, v1, v2}, Lcom/blahti/drag/DragListener;->onDragStart(Lcom/blahti/drag/DragSource;Ljava/lang/Object;I)V

    .line 195
    :cond_1
    iget v4, p0, Lcom/blahti/drag/DragController;->mMotionDownX:F

    float-to-int v4, v4

    sub-int v6, v4, p2

    .line 196
    .local v6, "registrationX":I
    iget v4, p0, Lcom/blahti/drag/DragController;->mMotionDownY:F

    float-to-int v4, v4

    sub-int v7, v4, p3

    .line 198
    .local v7, "registrationY":I
    iget v4, p0, Lcom/blahti/drag/DragController;->mMotionDownX:F

    int-to-float v5, p2

    sub-float/2addr v4, v5

    iput v4, p0, Lcom/blahti/drag/DragController;->mTouchOffsetX:F

    .line 199
    iget v4, p0, Lcom/blahti/drag/DragController;->mMotionDownY:F

    int-to-float v5, p3

    sub-float/2addr v4, v5

    iput v4, p0, Lcom/blahti/drag/DragController;->mTouchOffsetY:F

    .line 201
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/blahti/drag/DragController;->mDragging:Z

    .line 202
    move-object/from16 v0, p8

    iput-object v0, p0, Lcom/blahti/drag/DragController;->mDragSource:Lcom/blahti/drag/DragSource;

    .line 203
    move-object/from16 v0, p9

    iput-object v0, p0, Lcom/blahti/drag/DragController;->mDragInfo:Ljava/lang/Object;

    .line 206
    new-instance v3, Lcom/blahti/drag/DragView;

    iget-object v4, p0, Lcom/blahti/drag/DragController;->mContext:Landroid/content/Context;

    move-object v5, p1

    move/from16 v8, p4

    move/from16 v9, p5

    move/from16 v10, p6

    move/from16 v11, p7

    .line 207
    invoke-direct/range {v3 .. v11}, Lcom/blahti/drag/DragView;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;IIIIII)V

    .line 206
    iput-object v3, p0, Lcom/blahti/drag/DragController;->mDragView:Lcom/blahti/drag/DragView;

    .line 208
    .local v3, "dragView":Lcom/blahti/drag/DragView;
    iget-object v4, p0, Lcom/blahti/drag/DragController;->mWindowToken:Landroid/os/IBinder;

    iget v5, p0, Lcom/blahti/drag/DragController;->mMotionDownX:F

    float-to-int v5, v5

    iget v8, p0, Lcom/blahti/drag/DragController;->mMotionDownY:F

    float-to-int v8, v8

    invoke-virtual {v3, v4, v5, v8}, Lcom/blahti/drag/DragView;->show(Landroid/os/IBinder;II)V

    .line 209
    return-void
.end method

.method public startDrag(Landroid/view/View;Lcom/blahti/drag/DragSource;Ljava/lang/Object;I)V
    .locals 14
    .param p1, "v"    # Landroid/view/View;
    .param p2, "source"    # Lcom/blahti/drag/DragSource;
    .param p3, "dragInfo"    # Ljava/lang/Object;
    .param p4, "dragAction"    # I

    .prologue
    .line 134
    invoke-interface/range {p2 .. p2}, Lcom/blahti/drag/DragSource;->allowDrag()Z

    move-result v12

    .line 135
    .local v12, "doDrag":Z
    if-nez v12, :cond_1

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 137
    :cond_1
    iput-object p1, p0, Lcom/blahti/drag/DragController;->mOriginator:Landroid/view/View;

    .line 139
    invoke-direct {p0, p1}, Lcom/blahti/drag/DragController;->getViewBitmap(Landroid/view/View;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 141
    .local v2, "b":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_0

    .line 146
    iget-object v13, p0, Lcom/blahti/drag/DragController;->mCoordinatesTemp:[I

    .line 147
    .local v13, "loc":[I
    invoke-virtual {p1, v13}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 148
    const/4 v1, 0x0

    aget v3, v13, v1

    .line 149
    .local v3, "screenX":I
    const/4 v1, 0x1

    aget v4, v13, v1

    .line 151
    .local v4, "screenY":I
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    move-object v1, p0

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move/from16 v11, p4

    invoke-virtual/range {v1 .. v11}, Lcom/blahti/drag/DragController;->startDrag(Landroid/graphics/Bitmap;IIIIIILcom/blahti/drag/DragSource;Ljava/lang/Object;I)V

    .line 154
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 156
    sget v1, Lcom/blahti/drag/DragController;->DRAG_ACTION_MOVE:I

    move/from16 v0, p4

    if-ne v0, v1, :cond_0

    .line 157
    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
