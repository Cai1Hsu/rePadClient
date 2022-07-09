package com.handmark.pulltorefresh.library.internal;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Matrix;
import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.R;

/* loaded from: classes.dex */
public class RotateLoadingLayout extends LoadingLayout {
    static final int ROTATION_ANIMATION_DURATION = 1200;
    private final Matrix mHeaderImageMatrix = new Matrix();
    private final Animation mRotateAnimation = new RotateAnimation(0.0f, 720.0f, 1, 0.5f, 1, 0.5f);
    private final boolean mRotateDrawableWhilePulling;
    private float mRotationPivotX;
    private float mRotationPivotY;

    public RotateLoadingLayout(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.Orientation scrollDirection, TypedArray attrs) {
        super(context, mode, scrollDirection, attrs);
        this.mRotateDrawableWhilePulling = attrs.getBoolean(R.styleable.PullToRefresh_ptrRotateDrawableWhilePulling, true);
        this.mHeaderImage.setScaleType(ImageView.ScaleType.MATRIX);
        this.mHeaderImage.setImageMatrix(this.mHeaderImageMatrix);
        this.mRotateAnimation.setInterpolator(ANIMATION_INTERPOLATOR);
        this.mRotateAnimation.setDuration(1200L);
        this.mRotateAnimation.setRepeatCount(-1);
        this.mRotateAnimation.setRepeatMode(1);
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    public void onLoadingDrawableSet(Drawable imageDrawable) {
        if (imageDrawable != null) {
            this.mRotationPivotX = Math.round(imageDrawable.getIntrinsicWidth() / 2.0f);
            this.mRotationPivotY = Math.round(imageDrawable.getIntrinsicHeight() / 2.0f);
        }
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void onPullImpl(float scaleOfLayout) {
        float angle;
        if (this.mRotateDrawableWhilePulling) {
            angle = scaleOfLayout * 90.0f;
        } else {
            angle = Math.max(0.0f, Math.min(180.0f, (360.0f * scaleOfLayout) - 180.0f));
        }
        this.mHeaderImageMatrix.setRotate(angle, this.mRotationPivotX, this.mRotationPivotY);
        this.mHeaderImage.setImageMatrix(this.mHeaderImageMatrix);
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void refreshingImpl() {
        this.mHeaderImage.startAnimation(this.mRotateAnimation);
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void resetImpl() {
        this.mHeaderImage.clearAnimation();
        resetImageRotation();
    }

    private void resetImageRotation() {
        if (this.mHeaderImageMatrix != null) {
            this.mHeaderImageMatrix.reset();
            this.mHeaderImage.setImageMatrix(this.mHeaderImageMatrix);
        }
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void pullToRefreshImpl() {
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void releaseToRefreshImpl() {
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected int getDefaultDrawableResId() {
        return R.drawable.default_ptr_rotate;
    }
}
