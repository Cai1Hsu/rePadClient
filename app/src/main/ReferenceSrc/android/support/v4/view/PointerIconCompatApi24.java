package android.support.v4.view;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.support.annotation.RequiresApi;
import android.view.PointerIcon;

@RequiresApi(24)
@TargetApi(24)
/* loaded from: classes.jar:android/support/v4/view/PointerIconCompatApi24.class */
class PointerIconCompatApi24 {
    PointerIconCompatApi24() {
    }

    public static Object create(Bitmap bitmap, float f, float f2) {
        return PointerIcon.create(bitmap, f, f2);
    }

    public static Object getSystemIcon(Context context, int i) {
        return PointerIcon.getSystemIcon(context, i);
    }

    public static Object load(Resources resources, int i) {
        return PointerIcon.load(resources, i);
    }
}
