package com.handmark.pulltorefresh.library.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Matrix;
import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.R;
@SuppressLint({"ViewConstructor"})
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class IndicatorLayout extends FrameLayout implements Animation.AnimationListener {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode = null;
    static final int DEFAULT_ROTATION_ANIMATION_DURATION = 150;
    private ImageView mArrowImageView;
    private Animation mInAnim;
    private Animation mOutAnim;
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

    public IndicatorLayout(Context context, PullToRefreshBase.Mode mode) {
        super(context);
        int inAnimResId;
        int outAnimResId;
        this.mArrowImageView = new ImageView(context);
        Drawable arrowD = getResources().getDrawable(R.drawable.indicator_arrow);
        this.mArrowImageView.setImageDrawable(arrowD);
        int padding = getResources().getDimensionPixelSize(R.dimen.indicator_internal_padding);
        this.mArrowImageView.setPadding(padding, padding, padding, padding);
        addView(this.mArrowImageView);
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[mode.ordinal()]) {
            case 3:
                inAnimResId = R.anim.slide_in_from_bottom;
                outAnimResId = R.anim.slide_out_to_bottom;
                setBackgroundResource(R.drawable.indicator_bg_bottom);
                this.mArrowImageView.setScaleType(ImageView.ScaleType.MATRIX);
                Matrix matrix = new Matrix();
                matrix.setRotate(180.0f, arrowD.getIntrinsicWidth() / 2.0f, arrowD.getIntrinsicHeight() / 2.0f);
                this.mArrowImageView.setImageMatrix(matrix);
                break;
            default:
                inAnimResId = R.anim.slide_in_from_top;
                outAnimResId = R.anim.slide_out_to_top;
                setBackgroundResource(R.drawable.indicator_bg_top);
                break;
        }
        this.mInAnim = AnimationUtils.loadAnimation(context, inAnimResId);
        this.mInAnim.setAnimationListener(this);
        this.mOutAnim = AnimationUtils.loadAnimation(context, outAnimResId);
        this.mOutAnim.setAnimationListener(this);
        Interpolator interpolator = new LinearInterpolator();
        this.mRotateAnimation = new RotateAnimation(0.0f, -180.0f, 1, 0.5f, 1, 0.5f);
        this.mRotateAnimation.setInterpolator(interpolator);
        this.mRotateAnimation.setDuration(150L);
        this.mRotateAnimation.setFillAfter(true);
        this.mResetRotateAnimation = new RotateAnimation(-180.0f, 0.0f, 1, 0.5f, 1, 0.5f);
        this.mResetRotateAnimation.setInterpolator(interpolator);
        this.mResetRotateAnimation.setDuration(150L);
        this.mResetRotateAnimation.setFillAfter(true);
    }

    public final boolean isVisible() {
        Animation currentAnim = getAnimation();
        return currentAnim != null ? this.mInAnim == currentAnim : getVisibility() == 0;
    }

    public void hide() {
        startAnimation(this.mOutAnim);
    }

    public void show() {
        this.mArrowImageView.clearAnimation();
        startAnimation(this.mInAnim);
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationEnd(Animation animation) {
        if (animation == this.mOutAnim) {
            this.mArrowImageView.clearAnimation();
            setVisibility(8);
        } else if (animation == this.mInAnim) {
            setVisibility(0);
        }
        clearAnimation();
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationRepeat(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public void onAnimationStart(Animation animation) {
        setVisibility(0);
    }

    public void releaseToRefresh() {
        this.mArrowImageView.startAnimation(this.mRotateAnimation);
    }

    public void pullToRefresh() {
        this.mArrowImageView.startAnimation(this.mResetRotateAnimation);
    }
}
