package android.support.v4.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.support.annotation.RequiresApi;
import android.widget.EdgeEffect;

@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.jar:android/support/v4/widget/EdgeEffectCompatIcs.class */
class EdgeEffectCompatIcs {
    EdgeEffectCompatIcs() {
    }

    public static boolean draw(Object obj, Canvas canvas) {
        return ((EdgeEffect) obj).draw(canvas);
    }

    public static void finish(Object obj) {
        ((EdgeEffect) obj).finish();
    }

    public static boolean isFinished(Object obj) {
        return ((EdgeEffect) obj).isFinished();
    }

    public static Object newEdgeEffect(Context context) {
        return new EdgeEffect(context);
    }

    public static boolean onAbsorb(Object obj, int i) {
        ((EdgeEffect) obj).onAbsorb(i);
        return true;
    }

    public static boolean onPull(Object obj, float f) {
        ((EdgeEffect) obj).onPull(f);
        return true;
    }

    public static boolean onRelease(Object obj) {
        EdgeEffect edgeEffect = (EdgeEffect) obj;
        edgeEffect.onRelease();
        return edgeEffect.isFinished();
    }

    public static void setSize(Object obj, int i, int i2) {
        ((EdgeEffect) obj).setSize(i, i2);
    }
}
