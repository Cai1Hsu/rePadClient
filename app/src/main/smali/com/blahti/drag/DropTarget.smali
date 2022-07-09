.class public interface abstract Lcom/blahti/drag/DropTarget;
.super Ljava/lang/Object;
.source "DropTarget.java"


# virtual methods
.method public abstract acceptDrop(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)Z
.end method

.method public abstract estimateDropLocation(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/graphics/Rect;
.end method

.method public abstract getHitRect(Landroid/graphics/Rect;)V
.end method

.method public abstract getLeft()I
.end method

.method public abstract getLocationOnScreen([I)V
.end method

.method public abstract getTop()I
.end method

.method public abstract onDragEnter(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V
.end method

.method public abstract onDragExit(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V
.end method

.method public abstract onDragOver(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V
.end method

.method public abstract onDrop(Lcom/blahti/drag/DragSource;IIIILcom/blahti/drag/DragView;Ljava/lang/Object;)V
.end method
