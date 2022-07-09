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
import android.view.ViewGroup;
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
/* loaded from: classes.dex */
public abstract class LoadingLayout extends FrameLayout implements ILoadingLayout {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode = null;
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation = null;
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

    protected abstract int getDefaultDrawableResId();

    protected abstract void onLoadingDrawableSet(Drawable drawable);

    protected abstract void onPullImpl(float f);

    protected abstract void pullToRefreshImpl();

    protected abstract void refreshingImpl();

    protected abstract void releaseToRefreshImpl();

    protected abstract void resetImpl();

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

    public LoadingLayout(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.Orientation scrollDirection, TypedArray attrs) {
        super(context);
        ColorStateList colors;
        ColorStateList colors2;
        Drawable background;
        this.mMode = mode;
        this.mScrollDirection = scrollDirection;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[scrollDirection.ordinal()]) {
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
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) this.mInnerLayout.getLayoutParams();
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[mode.ordinal()]) {
            case 3:
                lp.gravity = scrollDirection == PullToRefreshBase.Orientation.VERTICAL ? 48 : 3;
                this.mPullLabel = context.getString(R.string.pull_to_refresh_from_bottom_pull_label);
                this.mRefreshingLabel = context.getString(R.string.pull_to_refresh_from_bottom_refreshing_label);
                this.mReleaseLabel = context.getString(R.string.pull_to_refresh_from_bottom_release_label);
                break;
            default:
                lp.gravity = scrollDirection == PullToRefreshBase.Orientation.VERTICAL ? 80 : 5;
                this.mPullLabel = context.getString(R.string.pull_to_refresh_pull_down_label);
                this.mRefreshingLabel = context.getString(R.string.pull_to_refresh_refreshing_label);
                this.mReleaseLabel = context.getString(R.string.pull_to_refresh_release_label);
                break;
        }
        if (attrs.hasValue(R.styleable.PullToRefresh_ptrHeaderBackground) && (background = attrs.getDrawable(R.styleable.PullToRefresh_ptrHeaderBackground)) != null) {
            ViewCompat.setBackground(this, background);
        }
        if (attrs.hasValue(R.styleable.PullToRefresh_ptrHeaderTextAppearance)) {
            TypedValue styleID = new TypedValue();
            attrs.getValue(R.styleable.PullToRefresh_ptrHeaderTextAppearance, styleID);
            setTextAppearance(styleID.data);
        }
        if (attrs.hasValue(R.styleable.PullToRefresh_ptrSubHeaderTextAppearance)) {
            TypedValue styleID2 = new TypedValue();
            attrs.getValue(R.styleable.PullToRefresh_ptrSubHeaderTextAppearance, styleID2);
            setSubTextAppearance(styleID2.data);
        }
        if (attrs.hasValue(R.styleable.PullToRefresh_ptrHeaderTextColor) && (colors2 = attrs.getColorStateList(R.styleable.PullToRefresh_ptrHeaderTextColor)) != null) {
            setTextColor(colors2);
        }
        if (attrs.hasValue(R.styleable.PullToRefresh_ptrHeaderSubTextColor) && (colors = attrs.getColorStateList(R.styleable.PullToRefresh_ptrHeaderSubTextColor)) != null) {
            setSubTextColor(colors);
        }
        Drawable imageDrawable = null;
        imageDrawable = attrs.hasValue(R.styleable.PullToRefresh_ptrDrawable) ? attrs.getDrawable(R.styleable.PullToRefresh_ptrDrawable) : imageDrawable;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[mode.ordinal()]) {
            case 3:
                if (!attrs.hasValue(R.styleable.PullToRefresh_ptrDrawableEnd)) {
                    if (attrs.hasValue(R.styleable.PullToRefresh_ptrDrawableBottom)) {
                        Utils.warnDeprecation("ptrDrawableBottom", "ptrDrawableEnd");
                        imageDrawable = attrs.getDrawable(R.styleable.PullToRefresh_ptrDrawableBottom);
                        break;
                    }
                } else {
                    imageDrawable = attrs.getDrawable(R.styleable.PullToRefresh_ptrDrawableEnd);
                    break;
                }
                break;
            default:
                if (attrs.hasValue(R.styleable.PullToRefresh_ptrDrawableStart)) {
                    imageDrawable = attrs.getDrawable(R.styleable.PullToRefresh_ptrDrawableStart);
                    break;
                } else if (attrs.hasValue(R.styleable.PullToRefresh_ptrDrawableTop)) {
                    Utils.warnDeprecation("ptrDrawableTop", "ptrDrawableStart");
                    imageDrawable = attrs.getDrawable(R.styleable.PullToRefresh_ptrDrawableTop);
                    break;
                }
                break;
        }
        setLoadingDrawable(imageDrawable == null ? context.getResources().getDrawable(getDefaultDrawableResId()) : imageDrawable);
        reset();
    }

    public final void setHeight(int height) {
        ViewGroup.LayoutParams lp = getLayoutParams();
        lp.height = height;
        requestLayout();
    }

    public final void setWidth(int width) {
        ViewGroup.LayoutParams lp = getLayoutParams();
        lp.width = width;
        requestLayout();
    }

    public final int getContentSize() {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[this.mScrollDirection.ordinal()]) {
            case 2:
                return this.mInnerLayout.getWidth();
            default:
                return this.mInnerLayout.getHeight();
        }
    }

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

    public final void onPull(float scaleOfLayout) {
        if (!this.mUseIntrinsicAnimation) {
            onPullImpl(scaleOfLayout);
        }
    }

    public final void pullToRefresh() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mPullLabel);
        }
        pullToRefreshImpl();
    }

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

    public final void releaseToRefresh() {
        if (this.mHeaderText != null) {
            this.mHeaderText.setText(this.mReleaseLabel);
        }
        releaseToRefreshImpl();
    }

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

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setLastUpdatedLabel(CharSequence label) {
        setSubHeaderText(label);
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public final void setLoadingDrawable(Drawable imageDrawable) {
        this.mHeaderImage.setImageDrawable(imageDrawable);
        this.mUseIntrinsicAnimation = imageDrawable instanceof AnimationDrawable;
        onLoadingDrawableSet(imageDrawable);
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setPullLabel(CharSequence pullLabel) {
        this.mPullLabel = pullLabel;
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setRefreshingLabel(CharSequence refreshingLabel) {
        this.mRefreshingLabel = refreshingLabel;
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setReleaseLabel(CharSequence releaseLabel) {
        this.mReleaseLabel = releaseLabel;
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setTextTypeface(Typeface tf) {
        this.mHeaderText.setTypeface(tf);
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

    private void setSubHeaderText(CharSequence label) {
        if (this.mSubHeaderText != null) {
            if (TextUtils.isEmpty(label)) {
                this.mSubHeaderText.setVisibility(8);
                return;
            }
            this.mSubHeaderText.setText(label);
            if (8 == this.mSubHeaderText.getVisibility()) {
                this.mSubHeaderText.setVisibility(0);
            }
        }
    }

    private void setSubTextAppearance(int value) {
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextAppearance(getContext(), value);
        }
    }

    private void setSubTextColor(ColorStateList color) {
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextColor(color);
        }
    }

    private void setTextAppearance(int value) {
        if (this.mHeaderText != null) {
            this.mHeaderText.setTextAppearance(getContext(), value);
        }
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextAppearance(getContext(), value);
        }
    }

    private void setTextColor(ColorStateList color) {
        if (this.mHeaderText != null) {
            this.mHeaderText.setTextColor(color);
        }
        if (this.mSubHeaderText != null) {
            this.mSubHeaderText.setTextColor(color);
        }
    }
}
