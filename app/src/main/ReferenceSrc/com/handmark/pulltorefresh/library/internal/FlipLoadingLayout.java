package com.handmark.pulltorefresh.library.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Matrix;
import android.graphics.drawable.Drawable;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.R;
@SuppressLint({"ViewConstructor"})
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class FlipLoadingLayout extends LoadingLayout {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode = null;
    static final int FLIP_ANIMATION_DURATION = 150;
    private final Animation mResetRotateAnimation;
    private final Animation mRotateAnimation;

    static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode() {
        int[] iArr = $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode;
        if (iArr == null) {
            iArr = new int[PullToRefreshBase.Mode.values().length];
            try {
                iArr[PullToRefreshBase.Mode.BOTH.ordinal()] = 4;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[PullToRefreshBase.Mode.DISABLED.ordinal()] = 1;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[PullToRefreshBase.Mode.MANUAL_REFRESH_ONLY.ordinal()] = 5;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[PullToRefreshBase.Mode.PULL_FROM_END.ordinal()] = 3;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[PullToRefreshBase.Mode.PULL_FROM_START.ordinal()] = 2;
            } catch (NoSuchFieldError e5) {
            }
            $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode = iArr;
        }
        return iArr;
    }

    public FlipLoadingLayout(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.Orientation scrollDirection, TypedArray attrs) {
        super(context, mode, scrollDirection, attrs);
        int rotateAngle = mode == PullToRefreshBase.Mode.PULL_FROM_START ? -180 : 180;
        this.mRotateAnimation = new RotateAnimation(0.0f, rotateAngle, 1, 0.5f, 1, 0.5f);
        this.mRotateAnimation.setInterpolator(ANIMATION_INTERPOLATOR);
        this.mRotateAnimation.setDuration(150L);
        this.mRotateAnimation.setFillAfter(true);
        this.mResetRotateAnimation = new RotateAnimation(rotateAngle, 0.0f, 1, 0.5f, 1, 0.5f);
        this.mResetRotateAnimation.setInterpolator(ANIMATION_INTERPOLATOR);
        this.mResetRotateAnimation.setDuration(150L);
        this.mResetRotateAnimation.setFillAfter(true);
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void onLoadingDrawableSet(Drawable imageDrawable) {
        if (imageDrawable != null) {
            int dHeight = imageDrawable.getIntrinsicHeight();
            int dWidth = imageDrawable.getIntrinsicWidth();
            ViewGroup.LayoutParams lp = this.mHeaderImage.getLayoutParams();
            int max = Math.max(dHeight, dWidth);
            lp.height = max;
            lp.width = max;
            this.mHeaderImage.requestLayout();
            this.mHeaderImage.setScaleType(ImageView.ScaleType.MATRIX);
            Matrix matrix = new Matrix();
            matrix.postTranslate((lp.width - dWidth) / 2.0f, (lp.height - dHeight) / 2.0f);
            matrix.postRotate(getDrawableRotationAngle(), lp.width / 2.0f, lp.height / 2.0f);
            this.mHeaderImage.setImageMatrix(matrix);
        }
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void onPullImpl(float scaleOfLayout) {
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void pullToRefreshImpl() {
        if (this.mRotateAnimation == this.mHeaderImage.getAnimation()) {
            this.mHeaderImage.startAnimation(this.mResetRotateAnimation);
        }
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void refreshingImpl() {
        this.mHeaderImage.clearAnimation();
        this.mHeaderImage.setVisibility(4);
        this.mHeaderProgress.setVisibility(0);
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void releaseToRefreshImpl() {
        this.mHeaderImage.startAnimation(this.mRotateAnimation);
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected void resetImpl() {
        this.mHeaderImage.clearAnimation();
        this.mHeaderProgress.setVisibility(8);
        this.mHeaderImage.setVisibility(0);
    }

    @Override // com.handmark.pulltorefresh.library.internal.LoadingLayout
    protected int getDefaultDrawableResId() {
        return R.drawable.default_ptr_flip;
    }

    private float getDrawableRotationAngle() {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mMode.ordinal()]) {
            case 2:
                if (this.mScrollDirection != PullToRefreshBase.Orientation.HORIZONTAL) {
                    return 0.0f;
                }
                return 270.0f;
            case 3:
                if (this.mScrollDirection == PullToRefreshBase.Orientation.HORIZONTAL) {
                    return 90.0f;
                }
                return 180.0f;
            default:
                return 0.0f;
        }
    }
}
