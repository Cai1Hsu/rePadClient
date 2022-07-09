.class public Lcom/blahti/drag/DragLayer;
.super Lcom/blahti/drag/MyAbsoluteLayout;
.source "DragLayer.java"

# interfaces
.implements Lcom/blahti/drag/DragSource;
.implements Lcom/blahti/drag/DropTarget;


# instance fields
.field mDragController:Lcom/blahti/drag/DragController;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Lcom/blahti/drag/MyAbsoluteLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    return-void
.end method


# virtual methods
.method public acceptDrop(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "source"    # Lcom/blahti/drag/DragSource;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I
    .param p6, "dragView"    # Lcom/blahti/drag/DragView;
    .param p7, "dragInfo"    # Ljava/lang/Object;

    .prologue
    .line 175
    const/4 v0, 0x1

    return v0
.end method

.method public allowDrag()Z
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x1

    return v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/blahti/drag/DragLayer;->mDragController:Lcom/blahti/drag/DragController;

    invoke-virtual {v0, p1}, Lcom/blahti/drag/DragController;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/blahti/drag/MyAbsoluteLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public dispatchUnhandledMove(Landroid/view/View;I)Z
    .locals 1
    .param p1, "focused"    # Landroid/view/View;
    .param p2, "direction"    # I

    .prologue
    .line 74
    iget-object v0, p0, Lcom/blahti/drag/DragLayer;->mDragController:Lcom/blahti/drag/DragController;

    invoke-virtual {v0, p1, p2}, Lcom/blahti/drag/DragController;->dispatchUnhandledMove(Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public estimateDropLocation(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 1
    .param p1, "source"    # Lcom/blahti/drag/DragSource;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I
    .param p6, "dragView"    # Lcom/blahti/drag/DragView;
    .param p7, "dragInfo"    # Ljava/lang/Object;
    .param p8, "recycle"    # Landroid/graphics/Rect;

    .prologue
    .line 199
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDragEnter(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V
    .locals 0
    .param p1, "source"    # Lcom/blahti/drag/DragSource;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I
    .param p6, "dragView"    # Lcom/blahti/drag/DragView;
    .param p7, "dragInfo"    # Ljava/lang/Object;

    .prologue
    .line 143
    return-void
.end method

.method public onDragExit(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V
    .locals 0
    .param p1, "source"    # Lcom/blahti/drag/DragSource;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I
    .param p6, "dragView"    # Lcom/blahti/drag/DragView;
    .param p7, "dragInfo"    # Ljava/lang/Object;

    .prologue
    .line 153
    return-void
.end method

.method public onDragOver(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V
    .locals 0
    .param p1, "source"    # Lcom/blahti/drag/DragSource;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I
    .param p6, "dragView"    # Lcom/blahti/drag/DragView;
    .param p7, "dragInfo"    # Ljava/lang/Object;

    .prologue
    .line 148
    return-void
.end method

.method public onDrop(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V
    .locals 6
    .param p1, "source"    # Lcom/blahti/drag/DragSource;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "xOffset"    # I
    .param p5, "yOffset"    # I
    .param p6, "dragView"    # Lcom/blahti/drag/DragView;
    .param p7, "dragInfo"    # Ljava/lang/Object;

    .prologue
    .line 131
    move-object v4, p7

    check-cast v4, Landroid/view/View;

    .line 133
    .local v4, "v":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v5

    .line 134
    .local v5, "w":I
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 135
    .local v0, "h":I
    sub-int v1, p2, p4

    .line 136
    .local v1, "left":I
    sub-int v3, p3, p5

    .line 137
    .local v3, "top":I
    new-instance v2, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    invoke-direct {v2, v5, v0, v1, v3}, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;-><init>(IIII)V

    .line 138
    .local v2, "lp":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    invoke-virtual {p0, v4, v2}, Lcom/blahti/drag/DragLayer;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    return-void
.end method

.method public onDropCompleted(Landroid/view/View;Z)V
    .locals 0
    .param p1, "target"    # Landroid/view/View;
    .param p2, "success"    # Z

    .prologue
    .line 107
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/blahti/drag/DragLayer;->mDragController:Lcom/blahti/drag/DragController;

    invoke-virtual {v0, p1}, Lcom/blahti/drag/DragController;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/blahti/drag/DragLayer;->mDragController:Lcom/blahti/drag/DragController;

    invoke-virtual {v0, p1}, Lcom/blahti/drag/DragController;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setDragController(Lcom/blahti/drag/DragController;)V
    .locals 0
    .param p1, "controller"    # Lcom/blahti/drag/DragController;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/blahti/drag/DragLayer;->mDragController:Lcom/blahti/drag/DragController;

    .line 55
    return-void
.end method
