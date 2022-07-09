package com.handmark.pulltorefresh.library.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.handmark.pulltorefresh.library.ILoadingLayout;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.R;

@SuppressLint({"ViewConstructor"})
/* loaded from: classes.jar:com/handmark/pulltorefresh/library/internal/LoadingLayout.class */
public abstract class LoadingLayout extends FrameLayout implements ILoadingLayout {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode;
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation;
    static final Interpolator ANIMATION_INTERPOLATOR = new LinearInterpolator();
    static final String LOG_TAG = "PullToRefresh-LoadingLayout";
    protected final ImageView mHeaderImage;
    protected final ProgressBar mHeaderProgress;
    private final TextView mHeaderText;
    private LinearLayout mInnerLayout;
    protected final PullToRefreshBase.Mode mMode;
    private CharSequence mPullLabel;
    private CharSequence mRefreshingLabel;
    private CharSequence mReleaseLabel;
    protected final PullToRefreshBase.Orientation mScrollDirection;
    private final TextView mSubHeaderText;
    private boolean mUseIntrinsicAnimation;

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

    static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation() {
        int[] iArr = $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation;
        if (iArr == null) {
            iArr = new int[PullToRefreshBase.Orientation.values().length];
            try {
                iArr[PullToRefreshBase.Orientation.HORIZONTAL.ordinal()] = 2;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[PullToRefreshBase.Orientation.VERTICAL.ordinal()] = 1;
            } catch (NoSuchFieldError e2) {
            }
            $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation = iArr;
        }
        return iArr;
    }

    public LoadingLayout(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.Orientation orientation, TypedArray typedArray) {
        super(context);
        Drawable drawable;
        ColorStateList colorStateList;
        ColorStateList colorStateList2;
        Drawable drawable2;
        this.mMode = mode;
        this.mScrollDirection = orientation;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[orientation.ordinal()]) {
            case 2:
                LayoutInflater.from(context).inflate(R.layout.pull_to_refresh_header_horizontal, this);
                break;
            default:
                LayoutInflater.from(context).inflate(R.layout.pull_to_refresh_header_vertical, this);
                break;
        }
        this.mInnerLayout = (LinearLayout) findViewById(R.id.fl_inner);
        this.mHeaderText = (TextView) this.mInnerLayout.findViewById(R.id.pull_to_refresh_text);
        this.mHeaderProgress = (ProgressBar) this.mInnerLayout.findViewById(R.id.pull_to_refresh_progress);
        this.mSubHeaderText = (TextView) this.mInnerLayout.findViewById(R.id.pull_to_refresh_sub_text);
        this.mHeaderImage = (ImageView) this.mInnerLayout.findViewById(R.id.pull_to_refresh_image);
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) this.mInnerLayout.getLayoutParams();
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[mode.ordinal()]) {
            case 3:
                layoutParams.gravity = orientation == PullToRefreshBase.Orientation.VERTICAL ? 48 : 3;
                this.mPullLabel = context.getString(R.string.pull_to_refresh_from_bottom_pull_label);
                this.mRefreshingLabel = context.getString(R.string.pull_to_refresh_from_bottom_refreshing_label);
                this.mReleaseLabel = context.getString(R.string.pull_to_refresh_from_bottom_release_label);
                break;
            default:
                layoutParams.gravity = orientation == PullToRefreshBase.Orientation.VERTICAL ? 80 : 5;
                this.mPullLabel = context.getString(R.string.pull_to_refresh_pull_down_label);
                this.mRefreshingLabel = context.getString(R.string.pull_to_refresh_refreshing_label);
                this.mReleaseLabel = context.getString(R.string.pull_to_refresh_release_label);
                break;
        }
        if (typedArray.hasValue(R.styleable.PullToRefresh_ptrHeaderBackground) && (drawable2 = typedArray.getDrawable(R.styleable.PullToRefresh_ptrHeaderBackground)) != null) {
            ViewCompat.setBackground(this, drawable2);
        }
        if (typedArray.hasValue(R.styleable.PullToRefresh_ptrHeaderTextAppearance)) {
            TypedValue typedValue = new TypedValue();
            typedArray.getValue(R.styleable.PullToRefresh_ptrHeaderTextAppearance, typedValue);
            setTextAppearance(typedValue.data);
        }
        if (typedArray.hasValue(R.styleable.PullToRefresh_ptrSubHeaderTextAppearance)) {
            TypedValue typedValue2 = new TypedValue();
            typedArray.getValue(R.styleable.PullToRefresh_ptrSubHeaderTextAppearance, typedValue2);
            setSubTextAppearance(typedValue2.data);
        }
        if (typedArray.hasValue(R.styleable.PullToRefresh_ptrHeaderTextColor) && (colorStateList2 = typedArray.getColorStateList(R.styleable.PullToRefresh_ptrHeaderTextColor)) != null) {
            setTextColor(colorStateList2);
        }
        if (typedArray.hasValue(R.styleable.PullToRefresh_ptrHeaderSubTextColor) && (colorStateList = typedArray.getColorStateList(R.styleable.PullToRefresh_ptrHeaderSubTextColor)) != null) {
            setSubTextColor(colorStateList);
        }
        Drawable drawable3 = typedArray.hasValue(R.styleable.PullToRefresh_ptrDrawable) ? typedArray.getDrawable(R.styleable.PullToRefresh_ptrDrawable) : null;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[mode.ordinal()]) {
            case 3:
                if (!typedArray.hasValue(R.styleable.PullToRefresh_ptrDrawableEnd)) {
                    drawable = drawable3;
                    if (typedArray.hasValue(R.styleable.PullToRefresh_ptrDrawableBottom)) {
                        Utils.warnDeprecation("ptrDrawableBottom", "ptrDrawableEnd");
                        drawable = typedArray.getDrawable(R.styleable.PullToRefresh_ptrDrawableBottom);
                        break;
                    }
                } else {
                    drawable = typedArray.getDrawable(R.styleable.PullToRefresh_ptrDrawableEnd);
                    break;
                }
                break;
            default:
                if (!typedArray.hasValue(R.styleable.PullToRefresh_ptrDrawableStart)) {
                    drawable = drawable3;
                    if (typedArray.hasValue(R.styleable.PullToRefresh_ptrDrawableTop)) {
                        Utils.warnDeprecation("ptrDrawableTop", "ptrDrawableStart");
                        drawable = typedArray.getDrawable(R.styleable.PullToRefresh_ptrDrawableTop);
                        break;
                    }
                } else {
                    drawable = typedArray.getDrawable(R.styleable.PullToRefresh_ptrDrawableStart);
                    break;
                }
                break;
        }
        setLoadingDrawable(drawable == null ? context.getResources().getDrawable(getDefaultDrawableResId()) : drawable);
        reset();
    }

    private void setSubHeaderText(CharSequence charSequence) {
        if (this.mSubHeaderText != null) {
            if (TextUtils.isEmpty(charSequence)) {
                this.mSubHeaderText.setVisibility(8);
                return;
            }
            this.mSubHeaderText.setText(charSequence);
            if (8 != this.mSubHeaderText.getVisibility()) {
                return;
            }
            this.mSubHeaderText.setVisibility(0);
        }
    }

    private void setSubTextAppearance(int i) {
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextAppearance(getContext(), i);
        }
    }

    private void setSubTextColor(ColorStateList colorStateList) {
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextColor(colorStateList);
        }
    }

    private void setTextAppearance(int i) {
        if (this.mHeaderText != null) {
            this.mHeaderText.setTextAppearance(getContext(), i);
        }
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextAppearance(getContext(), i);
        }
    }

    private void setTextColor(ColorStateList colorStateList) {
        if (this.mHeaderText != null) {
            this.mHeaderText.setTextColor(colorStateList);
        }
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextColor(colorStateList);
        }
    }

    public final int getContentSize() {
        int width;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[this.mScrollDirection.ordinal()]) {
            case 2:
                width = this.mInnerLayout.getWidth();
                break;
            default:
                width = this.mInnerLayout.getHeight();
                break;
        }
        return width;
    }

    protected abstract int getDefaultDrawableResId();

    public final void hideAllViews() {
        if (this.mHeaderText.getVisibility() == 0) {
            this.mHeaderText.setVisibility(4);
        }
        if (this.mHeaderProgress.getVisibility() == 0) {
            this.mHeaderProgress.setVisibility(4);
        }
        if (this.mHeaderImage.getVisibility() == 0) {
            this.mHeaderImage.setVisibility(4);
        }
        if (this.mSubHeaderText.getVisibility() == 0) {
            this.mSubHeaderText.setVisibility(4);
        }
    }

    protected abstract void onLoadingDrawableSet(Drawable drawable);

    public final void onPull(float f) {
        if (!this.mUseIntrinsicAnimation) {
            onPullImpl(f);
        }
    }

    protected abstract void onPullImpl(float f);

    public final void pullToRefresh() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mPullLabel);
        }
        pullToRefreshImpl();
    }

    protected abstract void pullToRefreshImpl();

    public final void refreshing() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mRefreshingLabel);
        }
        if (this.mUseIntrinsicAnimation) {
            ((AnimationDrawable) this.mHeaderImage.getDrawable()).start();
        } else {
            refreshingImpl();
        }
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setVisibility(8);
        }
    }

    protected abstract void refreshingImpl();

    public final void releaseToRefresh() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mReleaseLabel);
        }
        releaseToRefreshImpl();
    }

    protected abstract void releaseToRefreshImpl();

    public final void reset() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mPullLabel);
        }
        this.mHeaderImage.setVisibility(0);
        if (this.mUseIntrinsicAnimation) {
            ((AnimationDrawable) this.mHeaderImage.getDrawable()).stop();
        } else {
            resetImpl();
        }
        if (this.mSubHeaderText != null) {
            if (TextUtils.isEmpty(this.mSubHeaderText.getText())) {
                this.mSubHeaderText.setVisibility(8);
            } else {
                this.mSubHeaderText.setVisibility(0);
            }
        }
    }

    protected abstract void resetImpl();

    public final void setHeight(int i) {
        getLayoutParams().height = i;
        requestLayout();
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setLastUpdatedLabel(CharSequence charSequence) {
        setSubHeaderText(charSequence);
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public final void setLoadingDrawable(Drawable drawable) {
        this.mHeaderImage.setImageDrawable(drawable);
        this.mUseIntrinsicAnimation = drawable instanceof AnimationDrawable;
        onLoadingDrawableSet(drawable);
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setPullLabel(CharSequence charSequence) {
        this.mPullLabel = charSequence;
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setRefreshingLabel(CharSequence charSequence) {
        this.mRefreshingLabel = charSequence;
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setReleaseLabel(CharSequence charSequence) {
        this.mReleaseLabel = charSequence;
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setTextTypeface(Typeface typeface) {
        this.mHeaderText.setTypeface(typeface);
    }

    public final void setWidth(int i) {
        getLayoutParams().width = i;
        requestLayout();
    }

    public final void showInvisibleViews() {
        if (4 == this.mHeaderText.getVisibility()) {
            this.mHeaderText.setVisibility(0);
        }
        if (4 == this.mHeaderProgress.getVisibility()) {
            this.mHeaderProgress.setVisibility(0);
        }
        if (4 == this.mHeaderImage.getVisibility()) {
            this.mHeaderImage.setVisibility(0);
        }
        if (4 == this.mSubHeaderText.getVisibility()) {
            this.mSubHeaderText.setVisibility(0);
        }
    }
}
