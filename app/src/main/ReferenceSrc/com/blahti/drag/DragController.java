package com.blahti.drag;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.IBinder;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import java.util.ArrayList;

/* loaded from: classes.jar:com/blahti/drag/DragController.class */
public class DragController {
    private static final boolean PROFILE_DRAWING_DURING_DRAG = false;
    private static final String TAG = "DragController";
    private static final int VIBRATE_DURATION = 35;
    private Context mContext;
    private Object mDragInfo;
    private DragSource mDragSource;
    private DragView mDragView;
    private boolean mDragging;
    private InputMethodManager mInputMethodManager;
    private DropTarget mLastDropTarget;
    private DragListener mListener;
    private float mMotionDownX;
    private float mMotionDownY;
    private View mMoveTarget;
    private View mOriginator;
    private float mTouchOffsetX;
    private float mTouchOffsetY;
    private IBinder mWindowToken;
    public static int DRAG_ACTION_MOVE = 0;
    public static int DRAG_ACTION_COPY = 1;
    private Rect mRectTemp = new Rect();
    private final int[] mCoordinatesTemp = new int[2];
    private DisplayMetrics mDisplayMetrics = new DisplayMetrics();
    private ArrayList<DropTarget> mDropTargets = new ArrayList<>();

    public DragController(Context context) {
        this.mContext = context;
    }

    private static int clamp(int i, int i2, int i3) {
        if (i >= i2) {
            i2 = i >= i3 ? i3 - 1 : i;
        }
        return i2;
    }

    private boolean drop(float f, float f2) {
        boolean z;
        int[] iArr = this.mCoordinatesTemp;
        DropTarget findDropTarget = findDropTarget((int) f, (int) f2, iArr);
        if (findDropTarget != null) {
            findDropTarget.onDragExit(this.mDragSource, iArr[0], iArr[1], (int) this.mTouchOffsetX, (int) this.mTouchOffsetY, this.mDragView, this.mDragInfo);
            if (findDropTarget.acceptDrop(this.mDragSource, iArr[0], iArr[1], (int) this.mTouchOffsetX, (int) this.mTouchOffsetY, this.mDragView, this.mDragInfo)) {
                findDropTarget.onDrop(this.mDragSource, iArr[0], iArr[1], (int) this.mTouchOffsetX, (int) this.mTouchOffsetY, this.mDragView, this.mDragInfo);
                this.mDragSource.onDropCompleted((View) findDropTarget, true);
                z = true;
            } else {
                this.mDragSource.onDropCompleted((View) findDropTarget, false);
                z = true;
            }
        } else {
            z = false;
        }
        return z;
    }

    private void endDrag() {
        if (this.mDragging) {
            this.mDragging = false;
            if (this.mOriginator != null) {
                this.mOriginator.setVisibility(0);
            }
            if (this.mListener != null) {
                this.mListener.onDragEnd();
            }
            if (this.mDragView == null) {
                return;
            }
            this.mDragView.remove();
            this.mDragView = null;
        }
    }

    private DropTarget findDropTarget(int i, int i2, int[] iArr) {
        DropTarget dropTarget;
        Rect rect = this.mRectTemp;
        ArrayList<DropTarget> arrayList = this.mDropTargets;
        int size = arrayList.size() - 1;
        while (true) {
            if (size < 0) {
                dropTarget = null;
                break;
            }
            DropTarget dropTarget2 = arrayList.get(size);
            dropTarget2.getHitRect(rect);
            dropTarget2.getLocationOnScreen(iArr);
            rect.offset(iArr[0] - dropTarget2.getLeft(), iArr[1] - dropTarget2.getTop());
            if (rect.contains(i, i2)) {
                iArr[0] = i - iArr[0];
                iArr[1] = i2 - iArr[1];
                dropTarget = dropTarget2;
                break;
            }
            size--;
        }
        return dropTarget;
    }

    private Bitmap getViewBitmap(View view) {
        Bitmap bitmap;
        view.clearFocus();
        view.setPressed(false);
        boolean willNotCacheDrawing = view.willNotCacheDrawing();
        view.setWillNotCacheDrawing(false);
        int drawingCacheBackgroundColor = view.getDrawingCacheBackgroundColor();
        view.setDrawingCacheBackgroundColor(0);
        if (drawingCacheBackgroundColor != 0) {
            view.destroyDrawingCache();
        }
        view.buildDrawingCache();
        Bitmap drawingCache = view.getDrawingCache();
        if (drawingCache == null) {
            Log.e(TAG, "failed getViewBitmap(" + view + ")", new RuntimeException());
            bitmap = null;
        } else {
            Bitmap createBitmap = Bitmap.createBitmap(drawingCache);
            view.destroyDrawingCache();
            view.setWillNotCacheDrawing(willNotCacheDrawing);
            view.setDrawingCacheBackgroundColor(drawingCacheBackgroundColor);
            bitmap = createBitmap;
        }
        return bitmap;
    }

    private void recordScreenSize() {
        ((WindowManager) this.mContext.getSystemService("window")).getDefaultDisplay().getMetrics(this.mDisplayMetrics);
    }

    public void addDropTarget(DropTarget dropTarget) {
        this.mDropTargets.add(dropTarget);
    }

    public void cancelDrag() {
        endDrag();
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return this.mDragging;
    }

    public boolean dispatchUnhandledMove(View view, int i) {
        return this.mMoveTarget != null && this.mMoveTarget.dispatchUnhandledMove(view, i);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 0) {
            recordScreenSize();
        }
        int clamp = clamp((int) motionEvent.getRawX(), 0, this.mDisplayMetrics.widthPixels);
        int clamp2 = clamp((int) motionEvent.getRawY(), 0, this.mDisplayMetrics.heightPixels);
        switch (action) {
            case 0:
                this.mMotionDownX = clamp;
                this.mMotionDownY = clamp2;
                this.mLastDropTarget = null;
                break;
            case 1:
            case 3:
                if (this.mDragging) {
                    drop(clamp, clamp2);
                }
                endDrag();
                break;
        }
        return this.mDragging;
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z;
        if (!this.mDragging) {
            z = false;
        } else {
            int action = motionEvent.getAction();
            int clamp = clamp((int) motionEvent.getRawX(), 0, this.mDisplayMetrics.widthPixels);
            int clamp2 = clamp((int) motionEvent.getRawY(), 0, this.mDisplayMetrics.heightPixels);
            switch (action) {
                case 0:
                    this.mMotionDownX = clamp;
                    this.mMotionDownY = clamp2;
                    break;
                case 1:
                    if (this.mDragging) {
                        drop(clamp, clamp2);
                    }
                    endDrag();
                    break;
                case 2:
                    this.mDragView.move((int) motionEvent.getRawX(), (int) motionEvent.getRawY());
                    int[] iArr = this.mCoordinatesTemp;
                    DropTarget findDropTarget = findDropTarget(clamp, clamp2, iArr);
                    if (findDropTarget != null) {
                        if (this.mLastDropTarget == findDropTarget) {
                            findDropTarget.onDragOver(this.mDragSource, iArr[0], iArr[1], (int) this.mTouchOffsetX, (int) this.mTouchOffsetY, this.mDragView, this.mDragInfo);
                        } else {
                            if (this.mLastDropTarget != null) {
                                this.mLastDropTarget.onDragExit(this.mDragSource, iArr[0], iArr[1], (int) this.mTouchOffsetX, (int) this.mTouchOffsetY, this.mDragView, this.mDragInfo);
                            }
                            findDropTarget.onDragEnter(this.mDragSource, iArr[0], iArr[1], (int) this.mTouchOffsetX, (int) this.mTouchOffsetY, this.mDragView, this.mDragInfo);
                        }
                    } else if (this.mLastDropTarget != null) {
                        this.mLastDropTarget.onDragExit(this.mDragSource, iArr[0], iArr[1], (int) this.mTouchOffsetX, (int) this.mTouchOffsetY, this.mDragView, this.mDragInfo);
                    }
                    this.mLastDropTarget = findDropTarget;
                    break;
                case 3:
                    cancelDrag();
                    break;
            }
            z = true;
        }
        return z;
    }

    public void removeDragListener(DragListener dragListener) {
        this.mListener = null;
    }

    public void removeDropTarget(DropTarget dropTarget) {
        this.mDropTargets.remove(dropTarget);
    }

    public void setDragListener(DragListener dragListener) {
        this.mListener = dragListener;
    }

    void setMoveTarget(View view) {
        this.mMoveTarget = view;
    }

    public void setWindowToken(IBinder iBinder) {
        this.mWindowToken = iBinder;
    }

    public void startDrag(Bitmap bitmap, int i, int i2, int i3, int i4, int i5, int i6, DragSource dragSource, Object obj, int i7) {
        if (this.mInputMethodManager == null) {
            this.mInputMethodManager = (InputMethodManager) this.mContext.getSystemService("input_method");
        }
        this.mInputMethodManager.hideSoftInputFromWindow(this.mWindowToken, 0);
        if (this.mListener != null) {
            this.mListener.onDragStart(dragSource, obj, i7);
        }
        int i8 = (int) this.mMotionDownX;
        this.mTouchOffsetX = this.mMotionDownX - i;
        this.mTouchOffsetY = this.mMotionDownY - i2;
        this.mDragging = true;
        this.mDragSource = dragSource;
        this.mDragInfo = obj;
        DragView dragView = new DragView(this.mContext, bitmap, i8 - i, ((int) this.mMotionDownY) - i2, i3, i4, i5, i6);
        this.mDragView = dragView;
        dragView.show(this.mWindowToken, (int) this.mMotionDownX, (int) this.mMotionDownY);
    }

    public void startDrag(View view, DragSource dragSource, Object obj, int i) {
        if (!dragSource.allowDrag()) {
            return;
        }
        this.mOriginator = view;
        Bitmap viewBitmap = getViewBitmap(view);
        if (viewBitmap == null) {
            return;
        }
        int[] iArr = this.mCoordinatesTemp;
        view.getLocationOnScreen(iArr);
        startDrag(viewBitmap, iArr[0], iArr[1], 0, 0, viewBitmap.getWidth(), viewBitmap.getHeight(), dragSource, obj, i);
        viewBitmap.recycle();
        if (i != DRAG_ACTION_MOVE) {
            return;
        }
        view.setVisibility(8);
    }
}
