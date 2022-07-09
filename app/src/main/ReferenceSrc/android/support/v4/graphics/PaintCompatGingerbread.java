package android.support.v4.graphics;

import android.graphics.Paint;
import android.graphics.Rect;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import android.support.v4.util.Pair;

@RequiresApi(9)
/* loaded from: classes.jar:android/support/v4/graphics/PaintCompatGingerbread.class */
class PaintCompatGingerbread {
    private static final String TOFU_STRING = "��";
    private static final ThreadLocal<Pair<Rect, Rect>> sRectThreadLocal = new ThreadLocal<>();

    PaintCompatGingerbread() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x008a, code lost:
        if (r0 < r14) goto L21;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    static boolean hasGlyph(@NonNull Paint paint, @NonNull String str) {
        boolean z;
        int length = str.length();
        if (length != 1 || !Character.isWhitespace(str.charAt(0))) {
            float measureText = paint.measureText(TOFU_STRING);
            float measureText2 = paint.measureText(str);
            z = false;
            if (measureText2 != 0.0f) {
                if (str.codePointCount(0, str.length()) > 1) {
                    z = false;
                    if (measureText2 <= 2.0f * measureText) {
                        float f = 0.0f;
                        int i = 0;
                        while (true) {
                            int i2 = i;
                            if (i2 >= length) {
                                break;
                            }
                            int charCount = Character.charCount(str.codePointAt(i2));
                            f += paint.measureText(str, i2, i2 + charCount);
                            i = i2 + charCount;
                        }
                        z = false;
                    }
                }
                if (measureText2 != measureText) {
                    z = true;
                } else {
                    Pair<Rect, Rect> obtainEmptyRects = obtainEmptyRects();
                    paint.getTextBounds(TOFU_STRING, 0, TOFU_STRING.length(), obtainEmptyRects.first);
                    paint.getTextBounds(str, 0, length, obtainEmptyRects.second);
                    z = !obtainEmptyRects.first.equals(obtainEmptyRects.second);
                }
            }
        } else {
            z = true;
        }
        return z;
    }

    private static Pair<Rect, Rect> obtainEmptyRects() {
        Pair<Rect, Rect> pair = sRectThreadLocal.get();
        if (pair == null) {
            pair = new Pair<>(new Rect(), new Rect());
            sRectThreadLocal.set(pair);
        } else {
            pair.first.setEmpty();
            pair.second.setEmpty();
        }
        return pair;
    }
}
