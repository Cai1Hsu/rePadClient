package android.support.v4.graphics;

import android.graphics.Paint;
import android.os.Build;
import android.support.annotation.NonNull;

/* loaded from: classes.jar:android/support/v4/graphics/PaintCompat.class */
public final class PaintCompat {
    private PaintCompat() {
    }

    public static boolean hasGlyph(@NonNull Paint paint, @NonNull String str) {
        return Build.VERSION.SDK_INT >= 23 ? PaintCompatApi23.hasGlyph(paint, str) : PaintCompatGingerbread.hasGlyph(paint, str);
    }
}
