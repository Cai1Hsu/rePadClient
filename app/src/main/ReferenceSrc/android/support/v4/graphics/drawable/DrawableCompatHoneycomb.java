package android.support.v4.graphics.drawable;

import android.annotation.TargetApi;
import android.graphics.drawable.Drawable;
import android.support.annotation.RequiresApi;

@RequiresApi(11)
@TargetApi(11)
/* loaded from: classes.jar:android/support/v4/graphics/drawable/DrawableCompatHoneycomb.class */
class DrawableCompatHoneycomb {
    DrawableCompatHoneycomb() {
    }

    public static void jumpToCurrentState(Drawable drawable) {
        drawable.jumpToCurrentState();
    }

    public static Drawable wrapForTinting(Drawable drawable) {
        DrawableWrapperHoneycomb drawableWrapperHoneycomb = drawable;
        if (!(drawable instanceof TintAwareDrawable)) {
            drawableWrapperHoneycomb = new DrawableWrapperHoneycomb(drawable);
        }
        return drawableWrapperHoneycomb;
    }
}
