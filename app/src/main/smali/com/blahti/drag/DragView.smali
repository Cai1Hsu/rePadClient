.class public Lcom/blahti/drag/DragView;
.super Landroid/view/View;
.source "DragView.java"


# static fields
.field private static final DRAG_SCALE:I


# instance fields
.field private mAnimationScale:F

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mLayoutParams:Landroid/view/WindowManager$LayoutParams;

.field private mPaint:Landroid/graphics/Paint;

.field private mRegistrationX:I

.field private mRegistrationY:I

.field private mScale:F

.field private mWindowManager:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;IIIIII)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "registrationX"    # I
    .param p4, "registrationY"    # I
    .param p5, "left"    # I
    .param p6, "top"    # I
    .param p7, "width"    # I
    .param p8, "height"    # I

    .prologue
    .line 70
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 52
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/blahti/drag/DragView;->mAnimationScale:F

    .line 73
    const-string/jumbo v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/blahti/drag/DragView;->mWindowManager:Landroid/view/WindowManager;

    .line 75
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 76
    .local v5, "scale":Landroid/graphics/Matrix;
    int-to-float v7, p7

    .line 77
    .local v7, "scaleFactor":F
    const/4 v0, 0x0

    add-float/2addr v0, v7

    div-float v7, v0, v7

    iput v7, p0, Lcom/blahti/drag/DragView;->mScale:F

    .line 78
    invoke-virtual {v5, v7, v7}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 79
    const/4 v6, 0x1

    move-object v0, p2

    move v1, p5

    move v2, p6

    move v3, p7

    move/from16 v4, p8

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/blahti/drag/DragView;->mBitmap:Landroid/graphics/Bitmap;

    .line 82
    add-int/lit8 v0, p3, 0x0

    iput v0, p0, Lcom/blahti/drag/DragView;->mRegistrationX:I

    .line 83
    add-int/lit8 v0, p4, 0x0

    iput v0, p0, Lcom/blahti/drag/DragView;->mRegistrationY:I

    .line 84
    return-void
.end method


# virtual methods
.method move(II)V
    .locals 2
    .param p1, "touchX"    # I
    .param p2, "touchY"    # I

    .prologue
    .line 161
    iget-object v0, p0, Lcom/blahti/drag/DragView;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 162
    .local v0, "lp":Landroid/view/WindowManager$LayoutParams;
    iget v1, p0, Lcom/blahti/drag/DragView;->mRegistrationX:I

    sub-int v1, p1, v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 163
    iget v1, p0, Lcom/blahti/drag/DragView;->mRegistrationY:I

    sub-int v1, p2, v1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 164
    iget-object v1, p0, Lcom/blahti/drag/DragView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v1, p0, v0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 112
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 113
    iget-object v0, p0, Lcom/blahti/drag/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 114
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    .line 100
    iget v1, p0, Lcom/blahti/drag/DragView;->mAnimationScale:F

    .line 101
    .local v1, "scale":F
    const v3, 0x3f7fbe77    # 0.999f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_0

    .line 102
    iget-object v3, p0, Lcom/blahti/drag/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v2, v3

    .line 103
    .local v2, "width":F
    mul-float v3, v2, v1

    sub-float v3, v2, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v0, v3, v4

    .line 104
    .local v0, "offset":F
    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 105
    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 107
    .end local v0    # "offset":F
    .end local v2    # "width":F
    :cond_0
    iget-object v3, p0, Lcom/blahti/drag/DragView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/blahti/drag/DragView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v5, v5, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 108
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 88
    iget-object v0, p0, Lcom/blahti/drag/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/blahti/drag/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/blahti/drag/DragView;->setMeasuredDimension(II)V

    .line 89
    return-void
.end method

.method remove()V
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/blahti/drag/DragView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0, p0}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 169
    return-void
.end method

.method public setPaint(Landroid/graphics/Paint;)V
    .locals 0
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/blahti/drag/DragView;->mPaint:Landroid/graphics/Paint;

    .line 118
    invoke-virtual {p0}, Lcom/blahti/drag/DragView;->invalidate()V

    .line 119
    return-void
.end method

.method public show(Landroid/os/IBinder;II)V
    .locals 8
    .param p1, "windowToken"    # Landroid/os/IBinder;
    .param p2, "touchX"    # I
    .param p3, "touchY"    # I

    .prologue
    const/4 v1, -0x2

    .line 132
    const/4 v7, -0x3

    .line 134
    .local v7, "pixelFormat":I
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 137
    iget v2, p0, Lcom/blahti/drag/DragView;->mRegistrationX:I

    sub-int v3, p2, v2

    iget v2, p0, Lcom/blahti/drag/DragView;->mRegistrationY:I

    sub-int v4, p3, v2

    .line 138
    const/16 v5, 0x3ea

    .line 139
    const/16 v6, 0x300

    move v2, v1

    .line 134
    invoke-direct/range {v0 .. v7}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIIIII)V

    .line 144
    .local v0, "lp":Landroid/view/WindowManager$LayoutParams;
    const/16 v1, 0x33

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 145
    iput-object p1, v0, Landroid/view/WindowManager$LayoutParams;->token:Landroid/os/IBinder;

    .line 146
    const-string/jumbo v1, "DragView"

    invoke-virtual {v0, v1}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    .line 147
    iput-object v0, p0, Lcom/blahti/drag/DragView;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 149
    iget-object v1, p0, Lcom/blahti/drag/DragView;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v1, p0, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    return-void
.end method
