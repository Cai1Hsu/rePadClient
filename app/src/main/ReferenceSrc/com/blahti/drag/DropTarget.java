package com.blahti.drag;

import android.graphics.Rect;

/* loaded from: classes.jar:com/blahti/drag/DropTarget.class */
public interface DropTarget {
    boolean acceptDrop(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj);

    Rect estimateDropLocation(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj, Rect rect);

    void getHitRect(Rect rect);

    int getLeft();

    void getLocationOnScreen(int[] iArr);

    int getTop();

    void onDragEnter(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj);

    void onDragExit(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj);

    void onDragOver(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj);

    void onDrop(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj);
}
