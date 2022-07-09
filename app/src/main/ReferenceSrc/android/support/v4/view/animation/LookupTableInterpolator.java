package android.support.v4.view.animation;

import android.view.animation.Interpolator;

/* loaded from: classes.jar:android/support/v4/view/animation/LookupTableInterpolator.class */
abstract class LookupTableInterpolator implements Interpolator {
    private final float mStepSize;
    private final float[] mValues;

    public LookupTableInterpolator(float[] fArr) {
        this.mValues = fArr;
        this.mStepSize = 1.0f / (this.mValues.length - 1);
    }

    @Override // android.animation.TimeInterpolator
    public float getInterpolation(float f) {
        float f2;
        if (f >= 1.0f) {
            f2 = 1.0f;
        } else if (f <= 0.0f) {
            f2 = 0.0f;
        } else {
            int min = Math.min((int) ((this.mValues.length - 1) * f), this.mValues.length - 2);
            f2 = this.mValues[min] + ((this.mValues[min + 1] - this.mValues[min]) * ((f - (min * this.mStepSize)) / this.mStepSize));
        }
        return f2;
    }
}
