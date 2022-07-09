package com.blahti.drag;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import com.blahti.drag.MyAbsoluteLayout;

/* loaded from: classes.dex */
public class DragLayer extends MyAbsoluteLayout implements DragSource, DropTarget {
    DragController mDragController;

    public DragLayer(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // com.blahti.drag.DragSource
    public void setDragController(DragController controller) {
        this.mDragController = controller;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent event) {
        return this.mDragController.dispatchKeyEvent(event) || super.dispatchKeyEvent(event);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        return this.mDragController.onInterceptTouchEvent(ev);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        return this.mDragController.onTouchEvent(ev);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchUnhandledMove(View focused, int direction) {
        return this.mDragController.dispatchUnhandledMove(focused, direction);
    }

    @Override // com.blahti.drag.DragSource
    public boolean allowDrag() {
        return true;
    }

    @Override // com.blahti.drag.DragSource
    public void onDropCompleted(View target, boolean success) {
    }

    @Override // com.blahti.drag.DropTarget
    public void onDrop(DragSource source, int x, int y, int xOffset, int yOffset, DragView dragView, Object dragInfo) {
        View v = (View) dragInfo;
        int w = v.getWidth();
        int h = v.getHeight();
        int left = x - xOffset;
        int top = y - yOffset;
        MyAbsoluteLayout.LayoutParams lp = new MyAbsoluteLayout.LayoutParams(w, h, left, top);
        updateViewLayout(v, lp);
    }

    @Override // com.blahti.drag.DropTarget
    public void onDragEnter(DragSource source, int x, int y, int xOffset, int yOffset, DragView dragView, Object dragInfo) {
    }

    @Override // com.blahti.drag.DropTarget
    public void onDragOver(DragSource source, int x, int y, int xOffset, int yOffset, DragView dragView, Object dragInfo) {
    }

    @Override // com.blahti.drag.DropTarget
    public void onDragExit(DragSource source, int x, int y, int xOffset, int yOffset, DragView dragView, Object dragInfo) {
    }

    @Override // com.blahti.drag.DropTarget
    public boolean acceptDrop(DragSource source, int x, int y, int xOffset, int yOffset, DragView dragView, Object dragInfo) {
        return true;
    }

    @Override // com.blahti.drag.DropTarget
    public Rect estimateDropLocation(DragSource source, int x, int y, int xOffset, int yOffset, DragView dragView, Object dragInfo, Rect recycle) {
        return null;
    }
}
