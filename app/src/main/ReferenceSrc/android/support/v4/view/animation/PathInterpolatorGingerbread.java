package android.support.v4.view.animation;

import android.annotation.TargetApi;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.support.annotation.RequiresApi;
import android.view.animation.Interpolator;

@RequiresApi(9)
@TargetApi(9)
/* loaded from: classes.jar:android/support/v4/view/animation/PathInterpolatorGingerbread.class */
class PathInterpolatorGingerbread implements Interpolator {
    private static final float PRECISION = 0.002f;
    private final float[] mX;
    private final float[] mY;

    public PathInterpolatorGingerbread(float f, float f2) {
        this(createQuad(f, f2));
    }

    public PathInterpolatorGingerbread(float f, float f2, float f3, float f4) {
        this(createCubic(f, f2, f3, f4));
    }

    public PathInterpolatorGingerbread(Path path) {
        PathMeasure pathMeasure = new PathMeasure(path, false);
        float length = pathMeasure.getLength();
        int i = ((int) (length / PRECISION)) + 1;
        this.mX = new float[i];
        this.mY = new float[i];
        float[] fArr = new float[2];
        for (int i2 = 0; i2 < i; i2++) {
            pathMeasure.getPosTan((i2 * length) / (i - 1), fArr, null);
            this.mX[i2] = fArr[0];
            this.mY[i2] = fArr[1];
        }
    }

    private static Path createCubic(float f, float f2, float f3, float f4) {
        Path path = new Path();
        path.moveTo(0.0f, 0.0f);
        path.cubicTo(f, f2, f3, f4, 1.0f, 1.0f);
        return path;
    }

    private static Path createQuad(float f, float f2) {
        Path path = new Path();
        path.moveTo(0.0f, 0.0f);
        path.quadTo(f, f2, 1.0f, 1.0f);
        return path;
    }

    @Override // android.animation.TimeInterpolator
    public float getInterpolation(float f) {
        float f2;
        if (f <= 0.0f) {
            f2 = 0.0f;
        } else if (f >= 1.0f) {
            f2 = 1.0f;
        } else {
            int i = 0;
            int length = this.mX.length - 1;
            while (length - i > 1) {
                int i2 = (i + length) / 2;
                if (f < this.mX[i2]) {
                    length = i2;
                } else {
                    i = i2;
                }
            }
            float f3 = this.mX[length] - this.mX[i];
            if (f3 == 0.0f) {
                f2 = this.mY[i];
            } else {
                float f4 = (f - this.mX[i]) / f3;
                float f5 = this.mY[i];
                f2 = ((this.mY[length] - f5) * f4) + f5;
            }
        }
        return f2;
    }
}
