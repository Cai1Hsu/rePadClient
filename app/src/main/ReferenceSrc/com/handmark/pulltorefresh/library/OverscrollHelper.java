package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.util.Log;
import android.view.View;
import com.handmark.pulltorefresh.library.PullToRefreshBase;

@TargetApi(9)
/* loaded from: classes.jar:com/handmark/pulltorefresh/library/OverscrollHelper.class */
public final class OverscrollHelper {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation;
    static final float DEFAULT_OVERSCROLL_SCALE = 1.0f;
    static final String LOG_TAG = "OverscrollHelper";

    static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation() {
        int[] iArr = $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation;
        if (iArr == null) {
            iArr = new int[PullToRefreshBase.Orientation.values().length];
            try {
                iArr[PullToRefreshBase.Orientation.HORIZONTAL.ordinal()] = 2;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[PullToRefreshBase.Orientation.VERTICAL.ordinal()] = 1;
            } catch (NoSuchFieldError e2) {
            }
            $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation = iArr;
        }
        return iArr;
    }

    static boolean isAndroidOverScrollEnabled(View view) {
        return view.getOverScrollMode() != 2;
    }

    public static void overScrollBy(PullToRefreshBase<?> pullToRefreshBase, int i, int i2, int i3, int i4, int i5, int i6, float f, boolean z) {
        int i7;
        int i8;
        int scrollX;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[pullToRefreshBase.getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                i7 = i;
                i8 = i2;
                scrollX = pullToRefreshBase.getScrollX();
                break;
            default:
                i7 = i3;
                i8 = i4;
                scrollX = pullToRefreshBase.getScrollY();
                break;
        }
        if (!pullToRefreshBase.isPullToRefreshOverScrollEnabled() || pullToRefreshBase.isRefreshing()) {
            return;
        }
        PullToRefreshBase.Mode mode = pullToRefreshBase.getMode();
        if (!mode.permitsPullToRefresh() || z || i7 == 0) {
            if (!z || PullToRefreshBase.State.OVERSCROLLING != pullToRefreshBase.getState()) {
                return;
            }
            pullToRefreshBase.setState(PullToRefreshBase.State.RESET, new boolean[0]);
            return;
        }
        int i9 = i7 + i8;
        Log.d(LOG_TAG, "OverScroll. DeltaX: " + i + ", ScrollX: " + i2 + ", DeltaY: " + i3 + ", ScrollY: " + i4 + ", NewY: " + i9 + ", ScrollRange: " + i5 + ", CurrentScroll: " + scrollX);
        if (i9 < 0 - i6) {
            if (!mode.showHeaderLoadingLayout()) {
                return;
            }
            if (scrollX == 0) {
                pullToRefreshBase.setState(PullToRefreshBase.State.OVERSCROLLING, new boolean[0]);
            }
            pullToRefreshBase.setHeaderScroll((int) ((scrollX + i9) * f));
        } else if (i9 <= i5 + i6) {
            if (Math.abs(i9) > i6 && Math.abs(i9 - i5) > i6) {
                return;
            }
            pullToRefreshBase.setState(PullToRefreshBase.State.RESET, new boolean[0]);
        } else if (!mode.showFooterLoadingLayout()) {
        } else {
            if (scrollX == 0) {
                pullToRefreshBase.setState(PullToRefreshBase.State.OVERSCROLLING, new boolean[0]);
            }
            pullToRefreshBase.setHeaderScroll((int) (((scrollX + i9) - i5) * f));
        }
    }

    public static void overScrollBy(PullToRefreshBase<?> pullToRefreshBase, int i, int i2, int i3, int i4, int i5, boolean z) {
        overScrollBy(pullToRefreshBase, i, i2, i3, i4, i5, 0, DEFAULT_OVERSCROLL_SCALE, z);
    }

    public static void overScrollBy(PullToRefreshBase<?> pullToRefreshBase, int i, int i2, int i3, int i4, boolean z) {
        overScrollBy(pullToRefreshBase, i, i2, i3, i4, 0, z);
    }
}
