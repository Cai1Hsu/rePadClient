package android.support.v4.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.annotation.RequiresApi;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;

@RequiresApi(21)
@TargetApi(21)
/* loaded from: classes.jar:android/support/v4/widget/DrawerLayoutCompatApi21.class */
class DrawerLayoutCompatApi21 {
    private static final int[] THEME_ATTRS = {16843828};

    /* loaded from: classes.jar:android/support/v4/widget/DrawerLayoutCompatApi21$InsetsListener.class */
    static class InsetsListener implements View.OnApplyWindowInsetsListener {
        InsetsListener() {
        }

        @Override // android.view.View.OnApplyWindowInsetsListener
        public WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
            ((DrawerLayoutImpl) view).setChildInsets(windowInsets, windowInsets.getSystemWindowInsetTop() > 0);
            return windowInsets.consumeSystemWindowInsets();
        }
    }

    DrawerLayoutCompatApi21() {
    }

    public static void applyMarginInsets(ViewGroup.MarginLayoutParams marginLayoutParams, Object obj, int i) {
        WindowInsets windowInsets;
        WindowInsets windowInsets2 = (WindowInsets) obj;
        if (i == 3) {
            windowInsets = windowInsets2.replaceSystemWindowInsets(windowInsets2.getSystemWindowInsetLeft(), windowInsets2.getSystemWindowInsetTop(), 0, windowInsets2.getSystemWindowInsetBottom());
        } else {
            windowInsets = windowInsets2;
            if (i == 5) {
                windowInsets = windowInsets2.replaceSystemWindowInsets(0, windowInsets2.getSystemWindowInsetTop(), windowInsets2.getSystemWindowInsetRight(), windowInsets2.getSystemWindowInsetBottom());
            }
        }
        marginLayoutParams.leftMargin = windowInsets.getSystemWindowInsetLeft();
        marginLayoutParams.topMargin = windowInsets.getSystemWindowInsetTop();
        marginLayoutParams.rightMargin = windowInsets.getSystemWindowInsetRight();
        marginLayoutParams.bottomMargin = windowInsets.getSystemWindowInsetBottom();
    }

    public static void configureApplyInsets(View view) {
        if (view instanceof DrawerLayoutImpl) {
            view.setOnApplyWindowInsetsListener(new InsetsListener());
            view.setSystemUiVisibility(1280);
        }
    }

    public static void dispatchChildInsets(View view, Object obj, int i) {
        WindowInsets windowInsets;
        WindowInsets windowInsets2 = (WindowInsets) obj;
        if (i == 3) {
            windowInsets = windowInsets2.replaceSystemWindowInsets(windowInsets2.getSystemWindowInsetLeft(), windowInsets2.getSystemWindowInsetTop(), 0, windowInsets2.getSystemWindowInsetBottom());
        } else {
            windowInsets = windowInsets2;
            if (i == 5) {
                windowInsets = windowInsets2.replaceSystemWindowInsets(0, windowInsets2.getSystemWindowInsetTop(), windowInsets2.getSystemWindowInsetRight(), windowInsets2.getSystemWindowInsetBottom());
            }
        }
        view.dispatchApplyWindowInsets(windowInsets);
    }

    public static Drawable getDefaultStatusBarBackground(Context context) {
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(THEME_ATTRS);
        try {
            return obtainStyledAttributes.getDrawable(0);
        } finally {
            obtainStyledAttributes.recycle();
        }
    }

    public static int getTopInset(Object obj) {
        return obj != null ? ((WindowInsets) obj).getSystemWindowInsetTop() : 0;
    }
}
