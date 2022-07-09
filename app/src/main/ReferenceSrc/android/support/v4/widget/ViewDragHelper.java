package android.support.v4.widget;

import android.content.Context;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import java.util.Arrays;

/* loaded from: classes.jar:android/support/v4/widget/ViewDragHelper.class */
public class ViewDragHelper {
    private static final int BASE_SETTLE_DURATION = 256;
    public static final int DIRECTION_ALL = 3;
    public static final int DIRECTION_HORIZONTAL = 1;
    public static final int DIRECTION_VERTICAL = 2;
    public static final int EDGE_ALL = 15;
    public static final int EDGE_BOTTOM = 8;
    public static final int EDGE_LEFT = 1;
    public static final int EDGE_RIGHT = 2;
    private static final int EDGE_SIZE = 20;
    public static final int EDGE_TOP = 4;
    public static final int INVALID_POINTER = -1;
    private static final int MAX_SETTLE_DURATION = 600;
    public static final int STATE_DRAGGING = 1;
    public static final int STATE_IDLE = 0;
    public static final int STATE_SETTLING = 2;
    private static final String TAG = "ViewDragHelper";
    private static final Interpolator sInterpolator = new Interpolator() { // from class: android.support.v4.widget.ViewDragHelper.1
        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float f) {
            float f2 = f - 1.0f;
            return (f2 * f2 * f2 * f2 * f2) + 1.0f;
        }
    };
    private final Callback mCallback;
    private View mCapturedView;
    private int mDragState;
    private int[] mEdgeDragsInProgress;
    private int[] mEdgeDragsLocked;
    private int mEdgeSize;
    private int[] mInitialEdgesTouched;
    private float[] mInitialMotionX;
    private float[] mInitialMotionY;
    private float[] mLastMotionX;
    private float[] mLastMotionY;
    private float mMaxVelocity;
    private float mMinVelocity;
    private final ViewGroup mParentView;
    private int mPointersDown;
    private boolean mReleaseInProgress;
    private ScrollerCompat mScroller;
    private int mTouchSlop;
    private int mTrackingEdges;
    private VelocityTracker mVelocityTracker;
    private int mActivePointerId = -1;
    private final Runnable mSetIdleRunnable = new Runnable() { // from class: android.support.v4.widget.ViewDragHelper.2
        @Override // java.lang.Runnable
        public void run() {
            ViewDragHelper.this.setDragState(0);
        }
    };

    /* loaded from: classes.jar:android/support/v4/widget/ViewDragHelper$Callback.class */
    public static abstract class Callback {
        public int clampViewPositionHorizontal(View view, int i, int i2) {
            return 0;
        }

        public int clampViewPositionVertical(View view, int i, int i2) {
            return 0;
        }

        public int getOrderedChildIndex(int i) {
            return i;
        }

        public int getViewHorizontalDragRange(View view) {
            return 0;
        }

        public int getViewVerticalDragRange(View view) {
            return 0;
        }

        public void onEdgeDragStarted(int i, int i2) {
        }

        public boolean onEdgeLock(int i) {
            return false;
        }

        public void onEdgeTouched(int i, int i2) {
        }

        public void onViewCaptured(View view, int i) {
        }

        public void onViewDragStateChanged(int i) {
        }

        public void onViewPositionChanged(View view, int i, int i2, int i3, int i4) {
        }

        public void onViewReleased(View view, float f, float f2) {
        }

        public abstract boolean tryCaptureView(View view, int i);
    }

    private ViewDragHelper(Context context, ViewGroup viewGroup, Callback callback) {
        if (viewGroup == null) {
            throw new IllegalArgumentException("Parent view may not be null");
        }
        if (callback == null) {
            throw new IllegalArgumentException("Callback may not be null");
        }
        this.mParentView = viewGroup;
        this.mCallback = callback;
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.mEdgeSize = (int) ((20.0f * context.getResources().getDisplayMetrics().density) + 0.5f);
        this.mTouchSlop = viewConfiguration.getScaledTouchSlop();
        this.mMaxVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
        this.mMinVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
        this.mScroller = ScrollerCompat.create(context, sInterpolator);
    }

    private boolean checkNewEdgeDrag(float f, float f2, int i, int i2) {
        float abs = Math.abs(f);
        float abs2 = Math.abs(f2);
        boolean z = false;
        if ((this.mInitialEdgesTouched[i] & i2) == i2) {
            z = false;
            if ((this.mTrackingEdges & i2) != 0) {
                z = false;
                if ((this.mEdgeDragsLocked[i] & i2) != i2) {
                    z = false;
                    if ((this.mEdgeDragsInProgress[i] & i2) != i2) {
                        if (abs <= this.mTouchSlop && abs2 <= this.mTouchSlop) {
                            z = false;
                        } else if (abs >= 0.5f * abs2 || !this.mCallback.onEdgeLock(i2)) {
                            z = false;
                            if ((this.mEdgeDragsInProgress[i] & i2) == 0) {
                                z = false;
                                if (abs > this.mTouchSlop) {
                                    z = true;
                                }
                            }
                        } else {
                            int[] iArr = this.mEdgeDragsLocked;
                            iArr[i] = iArr[i] | i2;
                            z = false;
                        }
                    }
                }
            }
        }
        return z;
    }

    private boolean checkTouchSlop(View view, float f, float f2) {
        boolean z = true;
        if (view == null) {
            z = false;
        } else {
            boolean z2 = this.mCallback.getViewHorizontalDragRange(view) > 0;
            boolean z3 = this.mCallback.getViewVerticalDragRange(view) > 0;
            if (!z2 || !z3) {
                if (z2) {
                    if (Math.abs(f) <= this.mTouchSlop) {
                        z = false;
                    }
                } else if (!z3) {
                    z = false;
                } else if (Math.abs(f2) <= this.mTouchSlop) {
                    z = false;
                }
            } else if ((f * f) + (f2 * f2) <= this.mTouchSlop * this.mTouchSlop) {
                z = false;
            }
        }
        return z;
    }

    private float clampMag(float f, float f2, float f3) {
        float f4;
        float abs = Math.abs(f);
        if (abs < f2) {
            f4 = 0.0f;
        } else if (abs > f3) {
            f4 = f3;
            if (f <= 0.0f) {
                f4 = -f3;
            }
        } else {
            f4 = f;
        }
        return f4;
    }

    private int clampMag(int i, int i2, int i3) {
        int i4;
        int abs = Math.abs(i);
        if (abs < i2) {
            i4 = 0;
        } else if (abs > i3) {
            i4 = i3;
            if (i <= 0) {
                i4 = -i3;
            }
        } else {
            i4 = i;
        }
        return i4;
    }

    private void clearMotionHistory() {
        if (this.mInitialMotionX == null) {
            return;
        }
        Arrays.fill(this.mInitialMotionX, 0.0f);
        Arrays.fill(this.mInitialMotionY, 0.0f);
        Arrays.fill(this.mLastMotionX, 0.0f);
        Arrays.fill(this.mLastMotionY, 0.0f);
        Arrays.fill(this.mInitialEdgesTouched, 0);
        Arrays.fill(this.mEdgeDragsInProgress, 0);
        Arrays.fill(this.mEdgeDragsLocked, 0);
        this.mPointersDown = 0;
    }

    private void clearMotionHistory(int i) {
        if (this.mInitialMotionX == null || !isPointerDown(i)) {
            return;
        }
        this.mInitialMotionX[i] = 0.0f;
        this.mInitialMotionY[i] = 0.0f;
        this.mLastMotionX[i] = 0.0f;
        this.mLastMotionY[i] = 0.0f;
        this.mInitialEdgesTouched[i] = 0;
        this.mEdgeDragsInProgress[i] = 0;
        this.mEdgeDragsLocked[i] = 0;
        this.mPointersDown &= (1 << i) ^ (-1);
    }

    private int computeAxisDuration(int i, int i2, int i3) {
        int min;
        if (i == 0) {
            min = 0;
        } else {
            int width = this.mParentView.getWidth();
            int i4 = width / 2;
            float f = i4;
            float f2 = i4;
            float distanceInfluenceForSnapDuration = distanceInfluenceForSnapDuration(Math.min(1.0f, Math.abs(i) / width));
            int abs = Math.abs(i2);
            min = Math.min(abs > 0 ? Math.round(1000.0f * Math.abs((f + (f2 * distanceInfluenceForSnapDuration)) / abs)) * 4 : (int) (((Math.abs(i) / i3) + 1.0f) * 256.0f), (int) MAX_SETTLE_DURATION);
        }
        return min;
    }

    private int computeSettleDuration(View view, int i, int i2, int i3, int i4) {
        int clampMag = clampMag(i3, (int) this.mMinVelocity, (int) this.mMaxVelocity);
        int clampMag2 = clampMag(i4, (int) this.mMinVelocity, (int) this.mMaxVelocity);
        int abs = Math.abs(i);
        int abs2 = Math.abs(i2);
        int abs3 = Math.abs(clampMag);
        int abs4 = Math.abs(clampMag2);
        int i5 = abs3 + abs4;
        int i6 = abs + abs2;
        return (int) ((computeAxisDuration(i, clampMag, this.mCallback.getViewHorizontalDragRange(view)) * (clampMag != 0 ? abs3 / i5 : abs / i6)) + (computeAxisDuration(i2, clampMag2, this.mCallback.getViewVerticalDragRange(view)) * (clampMag2 != 0 ? abs4 / i5 : abs2 / i6)));
    }

    public static ViewDragHelper create(ViewGroup viewGroup, float f, Callback callback) {
        ViewDragHelper create = create(viewGroup, callback);
        create.mTouchSlop = (int) (create.mTouchSlop * (1.0f / f));
        return create;
    }

    public static ViewDragHelper create(ViewGroup viewGroup, Callback callback) {
        return new ViewDragHelper(viewGroup.getContext(), viewGroup, callback);
    }

    private void dispatchViewReleased(float f, float f2) {
        this.mReleaseInProgress = true;
        this.mCallback.onViewReleased(this.mCapturedView, f, f2);
        this.mReleaseInProgress = false;
        if (this.mDragState == 1) {
            setDragState(0);
        }
    }

    private float distanceInfluenceForSnapDuration(float f) {
        return (float) Math.sin((float) ((f - 0.5f) * 0.4712389167638204d));
    }

    private void dragTo(int i, int i2, int i3, int i4) {
        int i5 = i;
        int i6 = i2;
        int left = this.mCapturedView.getLeft();
        int top = this.mCapturedView.getTop();
        if (i3 != 0) {
            i5 = this.mCallback.clampViewPositionHorizontal(this.mCapturedView, i, i3);
            ViewCompat.offsetLeftAndRight(this.mCapturedView, i5 - left);
        }
        if (i4 != 0) {
            i6 = this.mCallback.clampViewPositionVertical(this.mCapturedView, i2, i4);
            ViewCompat.offsetTopAndBottom(this.mCapturedView, i6 - top);
        }
        if (i3 == 0 && i4 == 0) {
            return;
        }
        this.mCallback.onViewPositionChanged(this.mCapturedView, i5, i6, i5 - left, i6 - top);
    }

    private void ensureMotionHistorySizeForId(int i) {
        if (this.mInitialMotionX == null || this.mInitialMotionX.length <= i) {
            float[] fArr = new float[i + 1];
            float[] fArr2 = new float[i + 1];
            float[] fArr3 = new float[i + 1];
            float[] fArr4 = new float[i + 1];
            int[] iArr = new int[i + 1];
            int[] iArr2 = new int[i + 1];
            int[] iArr3 = new int[i + 1];
            if (this.mInitialMotionX != null) {
                System.arraycopy(this.mInitialMotionX, 0, fArr, 0, this.mInitialMotionX.length);
                System.arraycopy(this.mInitialMotionY, 0, fArr2, 0, this.mInitialMotionY.length);
                System.arraycopy(this.mLastMotionX, 0, fArr3, 0, this.mLastMotionX.length);
                System.arraycopy(this.mLastMotionY, 0, fArr4, 0, this.mLastMotionY.length);
                System.arraycopy(this.mInitialEdgesTouched, 0, iArr, 0, this.mInitialEdgesTouched.length);
                System.arraycopy(this.mEdgeDragsInProgress, 0, iArr2, 0, this.mEdgeDragsInProgress.length);
                System.arraycopy(this.mEdgeDragsLocked, 0, iArr3, 0, this.mEdgeDragsLocked.length);
            }
            this.mInitialMotionX = fArr;
            this.mInitialMotionY = fArr2;
            this.mLastMotionX = fArr3;
            this.mLastMotionY = fArr4;
            this.mInitialEdgesTouched = iArr;
            this.mEdgeDragsInProgress = iArr2;
            this.mEdgeDragsLocked = iArr3;
        }
    }

    private boolean forceSettleCapturedViewAt(int i, int i2, int i3, int i4) {
        boolean z = false;
        int left = this.mCapturedView.getLeft();
        int top = this.mCapturedView.getTop();
        int i5 = i - left;
        int i6 = i2 - top;
        if (i5 == 0 && i6 == 0) {
            this.mScroller.abortAnimation();
            setDragState(0);
        } else {
            this.mScroller.startScroll(left, top, i5, i6, computeSettleDuration(this.mCapturedView, i5, i6, i3, i4));
            setDragState(2);
            z = true;
        }
        return z;
    }

    private int getEdgesTouched(int i, int i2) {
        int i3 = 0;
        if (i < this.mParentView.getLeft() + this.mEdgeSize) {
            i3 = 0 | 1;
        }
        int i4 = i3;
        if (i2 < this.mParentView.getTop() + this.mEdgeSize) {
            i4 = i3 | 4;
        }
        int i5 = i4;
        if (i > this.mParentView.getRight() - this.mEdgeSize) {
            i5 = i4 | 2;
        }
        int i6 = i5;
        if (i2 > this.mParentView.getBottom() - this.mEdgeSize) {
            i6 = i5 | 8;
        }
        return i6;
    }

    private boolean isValidPointerForActionMove(int i) {
        boolean z;
        if (!isPointerDown(i)) {
            Log.e(TAG, "Ignoring pointerId=" + i + " because ACTION_DOWN was not received for this pointer before ACTION_MOVE. It likely happened because  ViewDragHelper did not receive all the events in the event stream.");
            z = false;
        } else {
            z = true;
        }
        return z;
    }

    private void releaseViewForPointerUp() {
        this.mVelocityTracker.computeCurrentVelocity(1000, this.mMaxVelocity);
        dispatchViewReleased(clampMag(VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), this.mMinVelocity, this.mMaxVelocity), clampMag(VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId), this.mMinVelocity, this.mMaxVelocity));
    }

    private void reportNewEdgeDrags(float f, float f2, int i) {
        int i2 = 0;
        if (checkNewEdgeDrag(f, f2, i, 1)) {
            i2 = 0 | 1;
        }
        int i3 = i2;
        if (checkNewEdgeDrag(f2, f, i, 4)) {
            i3 = i2 | 4;
        }
        int i4 = i3;
        if (checkNewEdgeDrag(f, f2, i, 2)) {
            i4 = i3 | 2;
        }
        int i5 = i4;
        if (checkNewEdgeDrag(f2, f, i, 8)) {
            i5 = i4 | 8;
        }
        if (i5 != 0) {
            int[] iArr = this.mEdgeDragsInProgress;
            iArr[i] = iArr[i] | i5;
            this.mCallback.onEdgeDragStarted(i5, i);
        }
    }

    private void saveInitialMotion(float f, float f2, int i) {
        ensureMotionHistorySizeForId(i);
        float[] fArr = this.mInitialMotionX;
        this.mLastMotionX[i] = f;
        fArr[i] = f;
        float[] fArr2 = this.mInitialMotionY;
        this.mLastMotionY[i] = f2;
        fArr2[i] = f2;
        this.mInitialEdgesTouched[i] = getEdgesTouched((int) f, (int) f2);
        this.mPointersDown |= 1 << i;
    }

    private void saveLastMotion(MotionEvent motionEvent) {
        int pointerCount = motionEvent.getPointerCount();
        for (int i = 0; i < pointerCount; i++) {
            int pointerId = motionEvent.getPointerId(i);
            if (isValidPointerForActionMove(pointerId)) {
                float x = motionEvent.getX(i);
                float y = motionEvent.getY(i);
                this.mLastMotionX[pointerId] = x;
                this.mLastMotionY[pointerId] = y;
            }
        }
    }

    public void abort() {
        cancel();
        if (this.mDragState == 2) {
            int currX = this.mScroller.getCurrX();
            int currY = this.mScroller.getCurrY();
            this.mScroller.abortAnimation();
            int currX2 = this.mScroller.getCurrX();
            int currY2 = this.mScroller.getCurrY();
            this.mCallback.onViewPositionChanged(this.mCapturedView, currX2, currY2, currX2 - currX, currY2 - currY);
        }
        setDragState(0);
    }

    protected boolean canScroll(View view, boolean z, int i, int i2, int i3, int i4) {
        boolean z2;
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                if (i3 + scrollX >= childAt.getLeft() && i3 + scrollX < childAt.getRight() && i4 + scrollY >= childAt.getTop() && i4 + scrollY < childAt.getBottom() && canScroll(childAt, true, i, i2, (i3 + scrollX) - childAt.getLeft(), (i4 + scrollY) - childAt.getTop())) {
                    z2 = true;
                    break;
                }
            }
        }
        z2 = z && (ViewCompat.canScrollHorizontally(view, -i) || ViewCompat.canScrollVertically(view, -i2));
        return z2;
    }

    public void cancel() {
        this.mActivePointerId = -1;
        clearMotionHistory();
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    public void captureChildView(View view, int i) {
        if (view.getParent() != this.mParentView) {
            throw new IllegalArgumentException("captureChildView: parameter must be a descendant of the ViewDragHelper's tracked parent view (" + this.mParentView + ")");
        }
        this.mCapturedView = view;
        this.mActivePointerId = i;
        this.mCallback.onViewCaptured(view, i);
        setDragState(1);
    }

    public boolean checkTouchSlop(int i) {
        boolean z;
        int length = this.mInitialMotionX.length;
        int i2 = 0;
        while (true) {
            if (i2 >= length) {
                z = false;
                break;
            } else if (checkTouchSlop(i, i2)) {
                z = true;
                break;
            } else {
                i2++;
            }
        }
        return z;
    }

    public boolean checkTouchSlop(int i, int i2) {
        boolean z = true;
        if (!isPointerDown(i2)) {
            z = false;
        } else {
            boolean z2 = (i & 1) == 1;
            boolean z3 = (i & 2) == 2;
            float f = this.mLastMotionX[i2] - this.mInitialMotionX[i2];
            float f2 = this.mLastMotionY[i2] - this.mInitialMotionY[i2];
            if (!z2 || !z3) {
                if (z2) {
                    if (Math.abs(f) <= this.mTouchSlop) {
                        z = false;
                    }
                } else if (!z3) {
                    z = false;
                } else if (Math.abs(f2) <= this.mTouchSlop) {
                    z = false;
                }
            } else if ((f * f) + (f2 * f2) <= this.mTouchSlop * this.mTouchSlop) {
                z = false;
            }
        }
        return z;
    }

    public boolean continueSettling(boolean z) {
        if (this.mDragState == 2) {
            boolean computeScrollOffset = this.mScroller.computeScrollOffset();
            int currX = this.mScroller.getCurrX();
            int currY = this.mScroller.getCurrY();
            int left = currX - this.mCapturedView.getLeft();
            int top = currY - this.mCapturedView.getTop();
            if (left != 0) {
                ViewCompat.offsetLeftAndRight(this.mCapturedView, left);
            }
            if (top != 0) {
                ViewCompat.offsetTopAndBottom(this.mCapturedView, top);
            }
            if (left != 0 || top != 0) {
                this.mCallback.onViewPositionChanged(this.mCapturedView, currX, currY, left, top);
            }
            boolean z2 = computeScrollOffset;
            if (computeScrollOffset) {
                z2 = computeScrollOffset;
                if (currX == this.mScroller.getFinalX()) {
                    z2 = computeScrollOffset;
                    if (currY == this.mScroller.getFinalY()) {
                        this.mScroller.abortAnimation();
                        z2 = false;
                    }
                }
            }
            if (!z2) {
                if (z) {
                    this.mParentView.post(this.mSetIdleRunnable);
                } else {
                    setDragState(0);
                }
            }
        }
        return this.mDragState == 2;
    }

    public View findTopChildUnder(int i, int i2) {
        View view;
        int childCount = this.mParentView.getChildCount() - 1;
        while (true) {
            if (childCount < 0) {
                view = null;
                break;
            }
            view = this.mParentView.getChildAt(this.mCallback.getOrderedChildIndex(childCount));
            if (i >= view.getLeft() && i < view.getRight() && i2 >= view.getTop() && i2 < view.getBottom()) {
                break;
            }
            childCount--;
        }
        return view;
    }

    public void flingCapturedView(int i, int i2, int i3, int i4) {
        if (!this.mReleaseInProgress) {
            throw new IllegalStateException("Cannot flingCapturedView outside of a call to Callback#onViewReleased");
        }
        this.mScroller.fling(this.mCapturedView.getLeft(), this.mCapturedView.getTop(), (int) VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), (int) VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId), i, i3, i2, i4);
        setDragState(2);
    }

    public int getActivePointerId() {
        return this.mActivePointerId;
    }

    public View getCapturedView() {
        return this.mCapturedView;
    }

    public int getEdgeSize() {
        return this.mEdgeSize;
    }

    public float getMinVelocity() {
        return this.mMinVelocity;
    }

    public int getTouchSlop() {
        return this.mTouchSlop;
    }

    public int getViewDragState() {
        return this.mDragState;
    }

    public boolean isCapturedViewUnder(int i, int i2) {
        return isViewUnder(this.mCapturedView, i, i2);
    }

    public boolean isEdgeTouched(int i) {
        boolean z;
        int length = this.mInitialEdgesTouched.length;
        int i2 = 0;
        while (true) {
            if (i2 >= length) {
                z = false;
                break;
            } else if (isEdgeTouched(i, i2)) {
                z = true;
                break;
            } else {
                i2++;
            }
        }
        return z;
    }

    public boolean isEdgeTouched(int i, int i2) {
        return isPointerDown(i2) && (this.mInitialEdgesTouched[i2] & i) != 0;
    }

    public boolean isPointerDown(int i) {
        boolean z = true;
        if ((this.mPointersDown & (1 << i)) == 0) {
            z = false;
        }
        return z;
    }

    public boolean isViewUnder(View view, int i, int i2) {
        boolean z;
        if (view == null) {
            z = false;
        } else {
            z = false;
            if (i >= view.getLeft()) {
                z = false;
                if (i < view.getRight()) {
                    z = false;
                    if (i2 >= view.getTop()) {
                        z = false;
                        if (i2 < view.getBottom()) {
                            z = true;
                        }
                    }
                }
            }
        }
        return z;
    }

    public void processTouchEvent(MotionEvent motionEvent) {
        int i;
        int actionMasked = MotionEventCompat.getActionMasked(motionEvent);
        int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
        if (actionMasked == 0) {
            cancel();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        switch (actionMasked) {
            case 0:
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                int pointerId = motionEvent.getPointerId(0);
                View findTopChildUnder = findTopChildUnder((int) x, (int) y);
                saveInitialMotion(x, y, pointerId);
                tryCaptureViewForDrag(findTopChildUnder, pointerId);
                int i2 = this.mInitialEdgesTouched[pointerId];
                if ((this.mTrackingEdges & i2) == 0) {
                    return;
                }
                this.mCallback.onEdgeTouched(this.mTrackingEdges & i2, pointerId);
                return;
            case 1:
                if (this.mDragState == 1) {
                    releaseViewForPointerUp();
                }
                cancel();
                return;
            case 2:
                if (this.mDragState == 1) {
                    if (!isValidPointerForActionMove(this.mActivePointerId)) {
                        return;
                    }
                    int findPointerIndex = motionEvent.findPointerIndex(this.mActivePointerId);
                    float x2 = motionEvent.getX(findPointerIndex);
                    float y2 = motionEvent.getY(findPointerIndex);
                    int i3 = (int) (x2 - this.mLastMotionX[this.mActivePointerId]);
                    int i4 = (int) (y2 - this.mLastMotionY[this.mActivePointerId]);
                    dragTo(this.mCapturedView.getLeft() + i3, this.mCapturedView.getTop() + i4, i3, i4);
                    saveLastMotion(motionEvent);
                    return;
                }
                int pointerCount = motionEvent.getPointerCount();
                for (int i5 = 0; i5 < pointerCount; i5++) {
                    int pointerId2 = motionEvent.getPointerId(i5);
                    if (isValidPointerForActionMove(pointerId2)) {
                        float x3 = motionEvent.getX(i5);
                        float y3 = motionEvent.getY(i5);
                        float f = x3 - this.mInitialMotionX[pointerId2];
                        float f2 = y3 - this.mInitialMotionY[pointerId2];
                        reportNewEdgeDrags(f, f2, pointerId2);
                        if (this.mDragState != 1) {
                            View findTopChildUnder2 = findTopChildUnder((int) x3, (int) y3);
                            if (checkTouchSlop(findTopChildUnder2, f, f2) && tryCaptureViewForDrag(findTopChildUnder2, pointerId2)) {
                            }
                        }
                        saveLastMotion(motionEvent);
                        return;
                    }
                }
                saveLastMotion(motionEvent);
                return;
            case 3:
                if (this.mDragState == 1) {
                    dispatchViewReleased(0.0f, 0.0f);
                }
                cancel();
                return;
            case 4:
            default:
                return;
            case 5:
                int pointerId3 = motionEvent.getPointerId(actionIndex);
                float x4 = motionEvent.getX(actionIndex);
                float y4 = motionEvent.getY(actionIndex);
                saveInitialMotion(x4, y4, pointerId3);
                if (this.mDragState != 0) {
                    if (!isCapturedViewUnder((int) x4, (int) y4)) {
                        return;
                    }
                    tryCaptureViewForDrag(this.mCapturedView, pointerId3);
                    return;
                }
                tryCaptureViewForDrag(findTopChildUnder((int) x4, (int) y4), pointerId3);
                int i6 = this.mInitialEdgesTouched[pointerId3];
                if ((this.mTrackingEdges & i6) == 0) {
                    return;
                }
                this.mCallback.onEdgeTouched(this.mTrackingEdges & i6, pointerId3);
                return;
            case 6:
                int pointerId4 = motionEvent.getPointerId(actionIndex);
                if (this.mDragState == 1 && pointerId4 == this.mActivePointerId) {
                    int pointerCount2 = motionEvent.getPointerCount();
                    int i7 = 0;
                    while (true) {
                        i = -1;
                        if (i7 < pointerCount2) {
                            int pointerId5 = motionEvent.getPointerId(i7);
                            if (pointerId5 != this.mActivePointerId) {
                                if (findTopChildUnder((int) motionEvent.getX(i7), (int) motionEvent.getY(i7)) == this.mCapturedView && tryCaptureViewForDrag(this.mCapturedView, pointerId5)) {
                                    i = this.mActivePointerId;
                                }
                            }
                            i7++;
                        }
                    }
                    if (i == -1) {
                        releaseViewForPointerUp();
                    }
                }
                clearMotionHistory(pointerId4);
                return;
        }
    }

    void setDragState(int i) {
        this.mParentView.removeCallbacks(this.mSetIdleRunnable);
        if (this.mDragState != i) {
            this.mDragState = i;
            this.mCallback.onViewDragStateChanged(i);
            if (this.mDragState != 0) {
                return;
            }
            this.mCapturedView = null;
        }
    }

    public void setEdgeTrackingEnabled(int i) {
        this.mTrackingEdges = i;
    }

    public void setMinVelocity(float f) {
        this.mMinVelocity = f;
    }

    public boolean settleCapturedViewAt(int i, int i2) {
        if (!this.mReleaseInProgress) {
            throw new IllegalStateException("Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased");
        }
        return forceSettleCapturedViewAt(i, i2, (int) VelocityTrackerCompat.getXVelocity(this.mVelocityTracker, this.mActivePointerId), (int) VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId));
    }

    /* JADX WARN: Code restructure failed: missing block: B:55:0x0208, code lost:
        if (r0 != r0) goto L64;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean shouldInterceptTouchEvent(MotionEvent motionEvent) {
        View findTopChildUnder;
        int actionMasked = MotionEventCompat.getActionMasked(motionEvent);
        int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
        if (actionMasked == 0) {
            cancel();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        switch (actionMasked) {
            case 0:
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                int pointerId = motionEvent.getPointerId(0);
                saveInitialMotion(x, y, pointerId);
                View findTopChildUnder2 = findTopChildUnder((int) x, (int) y);
                if (findTopChildUnder2 == this.mCapturedView && this.mDragState == 2) {
                    tryCaptureViewForDrag(findTopChildUnder2, pointerId);
                }
                int i = this.mInitialEdgesTouched[pointerId];
                if ((this.mTrackingEdges & i) != 0) {
                    this.mCallback.onEdgeTouched(this.mTrackingEdges & i, pointerId);
                    break;
                }
                break;
            case 1:
            case 3:
                cancel();
                break;
            case 2:
                if (this.mInitialMotionX != null && this.mInitialMotionY != null) {
                    int pointerCount = motionEvent.getPointerCount();
                    for (int i2 = 0; i2 < pointerCount; i2++) {
                        int pointerId2 = motionEvent.getPointerId(i2);
                        if (isValidPointerForActionMove(pointerId2)) {
                            float x2 = motionEvent.getX(i2);
                            float y2 = motionEvent.getY(i2);
                            float f = x2 - this.mInitialMotionX[pointerId2];
                            float f2 = y2 - this.mInitialMotionY[pointerId2];
                            View findTopChildUnder3 = findTopChildUnder((int) x2, (int) y2);
                            boolean z = findTopChildUnder3 != null && checkTouchSlop(findTopChildUnder3, f, f2);
                            if (z) {
                                int left = findTopChildUnder3.getLeft();
                                int clampViewPositionHorizontal = this.mCallback.clampViewPositionHorizontal(findTopChildUnder3, left + ((int) f), (int) f);
                                int top = findTopChildUnder3.getTop();
                                int clampViewPositionVertical = this.mCallback.clampViewPositionVertical(findTopChildUnder3, top + ((int) f2), (int) f2);
                                int viewHorizontalDragRange = this.mCallback.getViewHorizontalDragRange(findTopChildUnder3);
                                int viewVerticalDragRange = this.mCallback.getViewVerticalDragRange(findTopChildUnder3);
                                if (viewHorizontalDragRange != 0) {
                                    if (viewHorizontalDragRange > 0) {
                                        break;
                                    }
                                }
                                if (viewVerticalDragRange != 0) {
                                    if (viewVerticalDragRange > 0 && clampViewPositionVertical == top) {
                                    }
                                }
                                saveLastMotion(motionEvent);
                                break;
                            }
                            reportNewEdgeDrags(f, f2, pointerId2);
                            if (this.mDragState != 1) {
                                if (z && tryCaptureViewForDrag(findTopChildUnder3, pointerId2)) {
                                }
                            }
                            saveLastMotion(motionEvent);
                        }
                    }
                    saveLastMotion(motionEvent);
                }
                break;
            case 5:
                int pointerId3 = motionEvent.getPointerId(actionIndex);
                float x3 = motionEvent.getX(actionIndex);
                float y3 = motionEvent.getY(actionIndex);
                saveInitialMotion(x3, y3, pointerId3);
                if (this.mDragState == 0) {
                    int i3 = this.mInitialEdgesTouched[pointerId3];
                    if ((this.mTrackingEdges & i3) != 0) {
                        this.mCallback.onEdgeTouched(this.mTrackingEdges & i3, pointerId3);
                        break;
                    }
                } else if (this.mDragState == 2 && (findTopChildUnder = findTopChildUnder((int) x3, (int) y3)) == this.mCapturedView) {
                    tryCaptureViewForDrag(findTopChildUnder, pointerId3);
                    break;
                }
                break;
            case 6:
                clearMotionHistory(motionEvent.getPointerId(actionIndex));
                break;
        }
        return this.mDragState == 1;
    }

    public boolean smoothSlideViewTo(View view, int i, int i2) {
        this.mCapturedView = view;
        this.mActivePointerId = -1;
        boolean forceSettleCapturedViewAt = forceSettleCapturedViewAt(i, i2, 0, 0);
        if (!forceSettleCapturedViewAt && this.mDragState == 0 && this.mCapturedView != null) {
            this.mCapturedView = null;
        }
        return forceSettleCapturedViewAt;
    }

    boolean tryCaptureViewForDrag(View view, int i) {
        boolean z = true;
        if (view != this.mCapturedView || this.mActivePointerId != i) {
            if (view == null || !this.mCallback.tryCaptureView(view, i)) {
                z = false;
            } else {
                this.mActivePointerId = i;
                captureChildView(view, i);
            }
        }
        return z;
    }
}
