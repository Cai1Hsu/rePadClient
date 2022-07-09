package android.support.v4.view;

import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.support.annotation.RequiresApi;
import android.view.Display;
import android.view.View;
import android.view.ViewParent;
import android.view.WindowManager;
import java.lang.reflect.Field;

@RequiresApi(9)
@TargetApi(9)
/* loaded from: classes.jar:android/support/v4/view/ViewCompatBase.class */
class ViewCompatBase {
    private static final String TAG = "ViewCompatBase";
    private static Field sMinHeightField;
    private static boolean sMinHeightFieldFetched;
    private static Field sMinWidthField;
    private static boolean sMinWidthFieldFetched;

    ViewCompatBase() {
    }

    static ColorStateList getBackgroundTintList(View view) {
        return view instanceof TintableBackgroundView ? ((TintableBackgroundView) view).getSupportBackgroundTintList() : null;
    }

    static PorterDuff.Mode getBackgroundTintMode(View view) {
        return view instanceof TintableBackgroundView ? ((TintableBackgroundView) view).getSupportBackgroundTintMode() : null;
    }

    static Display getDisplay(View view) {
        return isAttachedToWindow(view) ? ((WindowManager) view.getContext().getSystemService("window")).getDefaultDisplay() : null;
    }

    static int getMinimumHeight(View view) {
        int intValue;
        if (!sMinHeightFieldFetched) {
            try {
                sMinHeightField = View.class.getDeclaredField("mMinHeight");
                sMinHeightField.setAccessible(true);
            } catch (NoSuchFieldException e) {
            }
            sMinHeightFieldFetched = true;
        }
        if (sMinHeightField != null) {
            try {
                intValue = ((Integer) sMinHeightField.get(view)).intValue();
            } catch (Exception e2) {
            }
            return intValue;
        }
        intValue = 0;
        return intValue;
    }

    static int getMinimumWidth(View view) {
        int intValue;
        if (!sMinWidthFieldFetched) {
            try {
                sMinWidthField = View.class.getDeclaredField("mMinWidth");
                sMinWidthField.setAccessible(true);
            } catch (NoSuchFieldException e) {
            }
            sMinWidthFieldFetched = true;
        }
        if (sMinWidthField != null) {
            try {
                intValue = ((Integer) sMinWidthField.get(view)).intValue();
            } catch (Exception e2) {
            }
            return intValue;
        }
        intValue = 0;
        return intValue;
    }

    static boolean isAttachedToWindow(View view) {
        return view.getWindowToken() != null;
    }

    static boolean isLaidOut(View view) {
        return view.getWidth() > 0 && view.getHeight() > 0;
    }

    static void offsetLeftAndRight(View view, int i) {
        int left = view.getLeft();
        view.offsetLeftAndRight(i);
        if (i != 0) {
            ViewParent parent = view.getParent();
            if (!(parent instanceof View)) {
                view.invalidate();
                return;
            }
            int abs = Math.abs(i);
            ((View) parent).invalidate(left - abs, view.getTop(), view.getWidth() + left + abs, view.getBottom());
        }
    }

    static void offsetTopAndBottom(View view, int i) {
        int top = view.getTop();
        view.offsetTopAndBottom(i);
        if (i != 0) {
            ViewParent parent = view.getParent();
            if (!(parent instanceof View)) {
                view.invalidate();
                return;
            }
            int abs = Math.abs(i);
            ((View) parent).invalidate(view.getLeft(), top - abs, view.getRight(), view.getHeight() + top + abs);
        }
    }

    static void setBackgroundTintList(View view, ColorStateList colorStateList) {
        if (view instanceof TintableBackgroundView) {
            ((TintableBackgroundView) view).setSupportBackgroundTintList(colorStateList);
        }
    }

    static void setBackgroundTintMode(View view, PorterDuff.Mode mode) {
        if (view instanceof TintableBackgroundView) {
            ((TintableBackgroundView) view).setSupportBackgroundTintMode(mode);
        }
    }
}
