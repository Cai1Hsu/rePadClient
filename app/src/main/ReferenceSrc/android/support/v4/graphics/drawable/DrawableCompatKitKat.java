package android.support.v4.graphics.drawable;

import android.annotation.TargetApi;
import android.graphics.drawable.Drawable;
import android.support.annotation.RequiresApi;

@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.jar:android/support/v4/graphics/drawable/DrawableCompatKitKat.class */
class DrawableCompatKitKat {
    DrawableCompatKitKat() {
    }

    public static int getAlpha(Drawable drawable) {
        return drawable.getAlpha();
    }

    public static boolean isAutoMirrored(Drawable drawable) {
        return drawable.isAutoMirrored();
    }

    public static void setAutoMirrored(Drawable drawable, boolean z) {
        drawable.setAutoMirrored(z);
    }

    public static Drawable wrapForTinting(Drawable drawable) {
        DrawableWrapperKitKat drawableWrapperKitKat = drawable;
        if (!(drawable instanceof TintAwareDrawable)) {
            drawableWrapperKitKat = new DrawableWrapperKitKat(drawable);
        }
        return drawableWrapperKitKat;
    }
}
