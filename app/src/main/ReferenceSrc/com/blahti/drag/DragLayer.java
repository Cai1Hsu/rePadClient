package com.blahti.drag;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import com.blahti.drag.MyAbsoluteLayout;

/* loaded from: classes.jar:com/blahti/drag/DragLayer.class */
public class DragLayer extends MyAbsoluteLayout implements DragSource, DropTarget {
    DragController mDragController;

    public DragLayer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // com.blahti.drag.DropTarget
    public boolean acceptDrop(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj) {
        return true;
    }

    @Override // com.blahti.drag.DragSource
    public boolean allowDrag() {
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return this.mDragController.dispatchKeyEvent(keyEvent) || super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchUnhandledMove(View view, int i) {
        return this.mDragController.dispatchUnhandledMove(view, i);
    }

    @Override // com.blahti.drag.DropTarget
    public Rect estimateDropLocation(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj, Rect rect) {
        return null;
    }

    @Override // com.blahti.drag.DropTarget
    public void onDragEnter(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj) {
    }

    @Override // com.blahti.drag.DropTarget
    public void onDragExit(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj) {
    }

    @Override // com.blahti.drag.DropTarget
    public void onDragOver(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj) {
    }

    @Override // com.blahti.drag.DropTarget
    public void onDrop(DragSource dragSource, int i, int i2, int i3, int i4, DragView dragView, Object obj) {
        View view = (View) obj;
        updateViewLayout(view, new MyAbsoluteLayout.LayoutParams(view.getWidth(), view.getHeight(), i - i3, i2 - i4));
    }

    @Override // com.blahti.drag.DragSource
    public void onDropCompleted(View view, boolean z) {
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        return this.mDragController.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        return this.mDragController.onTouchEvent(motionEvent);
    }

    @Override // com.blahti.drag.DragSource
    public void setDragController(DragController dragController) {
        this.mDragController = dragController;
    }
}
