package android.support.v4.view;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.util.Log;
import android.view.View;
import android.view.ViewParent;

@RequiresApi(21)
@TargetApi(21)
/* loaded from: classes.jar:android/support/v4/view/ViewParentCompatLollipop.class */
class ViewParentCompatLollipop {
    private static final String TAG = "ViewParentCompat";

    ViewParentCompatLollipop() {
    }

    public static boolean onNestedFling(ViewParent viewParent, View view, float f, float f2, boolean z) {
        boolean z2;
        try {
            z2 = viewParent.onNestedFling(view, f, f2, z);
        } catch (AbstractMethodError e) {
            Log.e(TAG, "ViewParent " + viewParent + " does not implement interface method onNestedFling", e);
            z2 = false;
        }
        return z2;
    }

    public static boolean onNestedPreFling(ViewParent viewParent, View view, float f, float f2) {
        boolean z;
        try {
            z = viewParent.onNestedPreFling(view, f, f2);
        } catch (AbstractMethodError e) {
            Log.e(TAG, "ViewParent " + viewParent + " does not implement interface method onNestedPreFling", e);
            z = false;
        }
        return z;
    }

    public static void onNestedPreScroll(ViewParent viewParent, View view, int i, int i2, int[] iArr) {
        try {
            viewParent.onNestedPreScroll(view, i, i2, iArr);
        } catch (AbstractMethodError e) {
            Log.e(TAG, "ViewParent " + viewParent + " does not implement interface method onNestedPreScroll", e);
        }
    }

    public static void onNestedScroll(ViewParent viewParent, View view, int i, int i2, int i3, int i4) {
        try {
            viewParent.onNestedScroll(view, i, i2, i3, i4);
        } catch (AbstractMethodError e) {
            Log.e(TAG, "ViewParent " + viewParent + " does not implement interface method onNestedScroll", e);
        }
    }

    public static void onNestedScrollAccepted(ViewParent viewParent, View view, View view2, int i) {
        try {
            viewParent.onNestedScrollAccepted(view, view2, i);
        } catch (AbstractMethodError e) {
            Log.e(TAG, "ViewParent " + viewParent + " does not implement interface method onNestedScrollAccepted", e);
        }
    }

    public static boolean onStartNestedScroll(ViewParent viewParent, View view, View view2, int i) {
        boolean z;
        try {
            z = viewParent.onStartNestedScroll(view, view2, i);
        } catch (AbstractMethodError e) {
            Log.e(TAG, "ViewParent " + viewParent + " does not implement interface method onStartNestedScroll", e);
            z = false;
        }
        return z;
    }

    public static void onStopNestedScroll(ViewParent viewParent, View view) {
        try {
            viewParent.onStopNestedScroll(view);
        } catch (AbstractMethodError e) {
            Log.e(TAG, "ViewParent " + viewParent + " does not implement interface method onStopNestedScroll", e);
        }
    }
}
