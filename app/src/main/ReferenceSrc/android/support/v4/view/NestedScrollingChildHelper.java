package android.support.v4.view;

import android.view.View;
import android.view.ViewParent;

/* loaded from: classes.jar:android/support/v4/view/NestedScrollingChildHelper.class */
public class NestedScrollingChildHelper {
    private boolean mIsNestedScrollingEnabled;
    private ViewParent mNestedScrollingParent;
    private int[] mTempNestedScrollConsumed;
    private final View mView;

    public NestedScrollingChildHelper(View view) {
        this.mView = view;
    }

    public boolean dispatchNestedFling(float f, float f2, boolean z) {
        return (!isNestedScrollingEnabled() || this.mNestedScrollingParent == null) ? false : ViewParentCompat.onNestedFling(this.mNestedScrollingParent, this.mView, f, f2, z);
    }

    public boolean dispatchNestedPreFling(float f, float f2) {
        return (!isNestedScrollingEnabled() || this.mNestedScrollingParent == null) ? false : ViewParentCompat.onNestedPreFling(this.mNestedScrollingParent, this.mView, f, f2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x00a8, code lost:
        if (r15[1] != 0) goto L26;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean dispatchNestedPreScroll(int i, int i2, int[] iArr, int[] iArr2) {
        boolean z = false;
        if (isNestedScrollingEnabled()) {
            z = false;
            if (this.mNestedScrollingParent != null) {
                if (i == 0 && i2 == 0) {
                    z = false;
                    if (iArr2 != null) {
                        iArr2[0] = 0;
                        iArr2[1] = 0;
                        z = false;
                    }
                } else {
                    int i3 = 0;
                    int i4 = 0;
                    if (iArr2 != null) {
                        this.mView.getLocationInWindow(iArr2);
                        i3 = iArr2[0];
                        i4 = iArr2[1];
                    }
                    int[] iArr3 = iArr;
                    if (iArr == null) {
                        if (this.mTempNestedScrollConsumed == null) {
                            this.mTempNestedScrollConsumed = new int[2];
                        }
                        iArr3 = this.mTempNestedScrollConsumed;
                    }
                    iArr3[0] = 0;
                    iArr3[1] = 0;
                    ViewParentCompat.onNestedPreScroll(this.mNestedScrollingParent, this.mView, i, i2, iArr3);
                    if (iArr2 != null) {
                        this.mView.getLocationInWindow(iArr2);
                        iArr2[0] = iArr2[0] - i3;
                        iArr2[1] = iArr2[1] - i4;
                    }
                    if (iArr3[0] == 0) {
                        z = false;
                    }
                    z = true;
                }
            }
        }
        return z;
    }

    public boolean dispatchNestedScroll(int i, int i2, int i3, int i4, int[] iArr) {
        boolean z;
        if (isNestedScrollingEnabled() && this.mNestedScrollingParent != null) {
            if (i != 0 || i2 != 0 || i3 != 0 || i4 != 0) {
                int i5 = 0;
                int i6 = 0;
                if (iArr != null) {
                    this.mView.getLocationInWindow(iArr);
                    i5 = iArr[0];
                    i6 = iArr[1];
                }
                ViewParentCompat.onNestedScroll(this.mNestedScrollingParent, this.mView, i, i2, i3, i4);
                if (iArr != null) {
                    this.mView.getLocationInWindow(iArr);
                    iArr[0] = iArr[0] - i5;
                    iArr[1] = iArr[1] - i6;
                }
                z = true;
                return z;
            } else if (iArr != null) {
                iArr[0] = 0;
                iArr[1] = 0;
            }
        }
        z = false;
        return z;
    }

    public boolean hasNestedScrollingParent() {
        return this.mNestedScrollingParent != null;
    }

    public boolean isNestedScrollingEnabled() {
        return this.mIsNestedScrollingEnabled;
    }

    public void onDetachedFromWindow() {
        ViewCompat.stopNestedScroll(this.mView);
    }

    public void onStopNestedScroll(View view) {
        ViewCompat.stopNestedScroll(this.mView);
    }

    public void setNestedScrollingEnabled(boolean z) {
        if (this.mIsNestedScrollingEnabled) {
            ViewCompat.stopNestedScroll(this.mView);
        }
        this.mIsNestedScrollingEnabled = z;
    }

    public boolean startNestedScroll(int i) {
        boolean z = true;
        if (!hasNestedScrollingParent()) {
            if (isNestedScrollingEnabled()) {
                View view = this.mView;
                for (ViewParent parent = this.mView.getParent(); parent != null; parent = parent.getParent()) {
                    if (ViewParentCompat.onStartNestedScroll(parent, view, this.mView, i)) {
                        this.mNestedScrollingParent = parent;
                        ViewParentCompat.onNestedScrollAccepted(parent, view, this.mView, i);
                        break;
                    }
                    if (parent instanceof View) {
                        view = (View) parent;
                    }
                }
            }
            z = false;
        }
        return z;
    }

    public void stopNestedScroll() {
        if (this.mNestedScrollingParent != null) {
            ViewParentCompat.onStopNestedScroll(this.mNestedScrollingParent, this.mView);
            this.mNestedScrollingParent = null;
        }
    }
}
