package com.handmark.pulltorefresh.library;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.handmark.pulltorefresh.library.internal.FlipLoadingLayout;
import com.handmark.pulltorefresh.library.internal.LoadingLayout;
import com.handmark.pulltorefresh.library.internal.RotateLoadingLayout;
import com.handmark.pulltorefresh.library.internal.Utils;
import com.handmark.pulltorefresh.library.internal.ViewCompat;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase.class */
public abstract class PullToRefreshBase<T extends View> extends LinearLayout implements IPullToRefresh<T> {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode;
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation;
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$State;
    static final boolean DEBUG = true;
    static final int DEMO_SCROLL_INTERVAL = 225;
    static final float FRICTION = 2.0f;
    static final String LOG_TAG = "PullToRefresh";
    public static final int SMOOTH_SCROLL_DURATION_MS = 200;
    public static final int SMOOTH_SCROLL_LONG_DURATION_MS = 325;
    static final String STATE_CURRENT_MODE = "ptr_current_mode";
    static final String STATE_MODE = "ptr_mode";
    static final String STATE_SCROLLING_REFRESHING_ENABLED = "ptr_disable_scrolling";
    static final String STATE_SHOW_REFRESHING_VIEW = "ptr_show_refreshing_view";
    static final String STATE_STATE = "ptr_state";
    static final String STATE_SUPER = "ptr_super";
    static final boolean USE_HW_LAYERS = false;
    private Mode mCurrentMode;
    private PullToRefreshBase<T>.SmoothScrollRunnable mCurrentSmoothScrollRunnable;
    private boolean mFilterTouchEvents;
    private LoadingLayout mFooterLayout;
    private LoadingLayout mHeaderLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private boolean mIsBeingDragged;
    private float mLastMotionX;
    private float mLastMotionY;
    private boolean mLayoutVisibilityChangesEnabled;
    private AnimationStyle mLoadingAnimationStyle;
    private Mode mMode;
    private OnPullEventListener<T> mOnPullEventListener;
    private OnRefreshListener<T> mOnRefreshListener;
    private OnRefreshListener2<T> mOnRefreshListener2;
    private boolean mOverScrollEnabled;
    T mRefreshableView;
    private FrameLayout mRefreshableViewWrapper;
    private Interpolator mScrollAnimationInterpolator;
    private boolean mScrollingWhileRefreshingEnabled;
    private boolean mShowViewWhileRefreshing;
    private State mState;
    private int mTouchSlop;

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$AnimationStyle.class */
    public enum AnimationStyle {
        ROTATE,
        FLIP;
        
        private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$AnimationStyle;

        static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$AnimationStyle() {
            int[] iArr = $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$AnimationStyle;
            if (iArr == null) {
                iArr = new int[values().length];
                try {
                    iArr[FLIP.ordinal()] = 2;
                } catch (NoSuchFieldError e) {
                }
                try {
                    iArr[ROTATE.ordinal()] = 1;
                } catch (NoSuchFieldError e2) {
                }
                $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$AnimationStyle = iArr;
            }
            return iArr;
        }

        static AnimationStyle getDefault() {
            return ROTATE;
        }

        static AnimationStyle mapIntToValue(int i) {
            AnimationStyle animationStyle;
            switch (i) {
                case 1:
                    animationStyle = FLIP;
                    break;
                default:
                    animationStyle = ROTATE;
                    break;
            }
            return animationStyle;
        }

        LoadingLayout createLoadingLayout(Context context, Mode mode, Orientation orientation, TypedArray typedArray) {
            LoadingLayout flipLoadingLayout;
            switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$AnimationStyle()[ordinal()]) {
                case 2:
                    flipLoadingLayout = new FlipLoadingLayout(context, mode, orientation, typedArray);
                    break;
                default:
                    flipLoadingLayout = new RotateLoadingLayout(context, mode, orientation, typedArray);
                    break;
            }
            return flipLoadingLayout;
        }
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$Mode.class */
    public enum Mode {
        DISABLED(0),
        PULL_FROM_START(1),
        PULL_FROM_END(2),
        BOTH(3),
        MANUAL_REFRESH_ONLY(4);
        
        private int mIntValue;
        public static Mode PULL_DOWN_TO_REFRESH = PULL_FROM_START;
        public static Mode PULL_UP_TO_REFRESH = PULL_FROM_END;

        Mode(int i) {
            this.mIntValue = i;
        }

        static Mode getDefault() {
            return PULL_FROM_START;
        }

        static Mode mapIntToValue(int i) {
            Mode mode;
            Mode[] values = values();
            int length = values.length;
            int i2 = 0;
            while (true) {
                if (i2 < length) {
                    Mode mode2 = values[i2];
                    mode = mode2;
                    if (i == mode2.getIntValue()) {
                        break;
                    }
                    i2++;
                } else {
                    mode = getDefault();
                    break;
                }
            }
            return mode;
        }

        int getIntValue() {
            return this.mIntValue;
        }

        boolean permitsPullToRefresh() {
            return (this == DISABLED || this == MANUAL_REFRESH_ONLY) ? false : true;
        }

        public boolean showFooterLoadingLayout() {
            return this == PULL_FROM_END || this == BOTH || this == MANUAL_REFRESH_ONLY;
        }

        public boolean showHeaderLoadingLayout() {
            return this == PULL_FROM_START || this == BOTH;
        }
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$OnLastItemVisibleListener.class */
    public interface OnLastItemVisibleListener {
        void onLastItemVisible();
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$OnPullEventListener.class */
    public interface OnPullEventListener<V extends View> {
        void onPullEvent(PullToRefreshBase<V> pullToRefreshBase, State state, Mode mode);
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$OnRefreshListener.class */
    public interface OnRefreshListener<V extends View> {
        void onRefresh(PullToRefreshBase<V> pullToRefreshBase);
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$OnRefreshListener2.class */
    public interface OnRefreshListener2<V extends View> {
        void onPullDownToRefresh(PullToRefreshBase<V> pullToRefreshBase);

        void onPullUpToRefresh(PullToRefreshBase<V> pullToRefreshBase);
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$OnSmoothScrollFinishedListener.class */
    interface OnSmoothScrollFinishedListener {
        void onSmoothScrollFinished();
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$Orientation.class */
    public enum Orientation {
        VERTICAL,
        HORIZONTAL
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$SmoothScrollRunnable.class */
    final class SmoothScrollRunnable implements Runnable {
        private final long mDuration;
        private final Interpolator mInterpolator;
        private OnSmoothScrollFinishedListener mListener;
        private final int mScrollFromY;
        private final int mScrollToY;
        private boolean mContinueRunning = true;
        private long mStartTime = -1;
        private int mCurrentY = -1;

        public SmoothScrollRunnable(int i, int i2, long j, OnSmoothScrollFinishedListener onSmoothScrollFinishedListener) {
            PullToRefreshBase.this = r5;
            this.mScrollFromY = i;
            this.mScrollToY = i2;
            this.mInterpolator = r5.mScrollAnimationInterpolator;
            this.mDuration = j;
            this.mListener = onSmoothScrollFinishedListener;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.mStartTime == -1) {
                this.mStartTime = System.currentTimeMillis();
            } else {
                this.mCurrentY = this.mScrollFromY - Math.round((this.mScrollFromY - this.mScrollToY) * this.mInterpolator.getInterpolation(((float) Math.max(Math.min(((System.currentTimeMillis() - this.mStartTime) * 1000) / this.mDuration, 1000L), 0L)) / 1000.0f));
                PullToRefreshBase.this.setHeaderScroll(this.mCurrentY);
            }
            if (this.mContinueRunning && this.mScrollToY != this.mCurrentY) {
                ViewCompat.postOnAnimation(PullToRefreshBase.this, this);
            } else if (this.mListener == null) {
            } else {
                this.mListener.onSmoothScrollFinished();
            }
        }

        public void stop() {
            this.mContinueRunning = false;
            PullToRefreshBase.this.removeCallbacks(this);
        }
    }

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshBase$State.class */
    public enum State {
        RESET(0),
        PULL_TO_REFRESH(1),
        RELEASE_TO_REFRESH(2),
        REFRESHING(8),
        MANUAL_REFRESHING(9),
        OVERSCROLLING(16);
        
        private int mIntValue;

        State(int i) {
            this.mIntValue = i;
        }

        static State mapIntToValue(int i) {
            State state;
            State[] values = values();
            int length = values.length;
            int i2 = 0;
            while (true) {
                if (i2 < length) {
                    State state2 = values[i2];
                    state = state2;
                    if (i == state2.getIntValue()) {
                        break;
                    }
                    i2++;
                } else {
                    state = RESET;
                    break;
                }
            }
            return state;
        }

        int getIntValue() {
            return this.mIntValue;
        }
    }

    static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode() {
        int[] iArr = $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode;
        if (iArr == null) {
            iArr = new int[Mode.values().length];
            try {
                iArr[Mode.BOTH.ordinal()] = 4;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[Mode.DISABLED.ordinal()] = 1;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[Mode.MANUAL_REFRESH_ONLY.ordinal()] = 5;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[Mode.PULL_FROM_END.ordinal()] = 3;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[Mode.PULL_FROM_START.ordinal()] = 2;
            } catch (NoSuchFieldError e5) {
            }
            $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode = iArr;
        }
        return iArr;
    }

    static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation() {
        int[] iArr = $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation;
        if (iArr == null) {
            iArr = new int[Orientation.values().length];
            try {
                iArr[Orientation.HORIZONTAL.ordinal()] = 2;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[Orientation.VERTICAL.ordinal()] = 1;
            } catch (NoSuchFieldError e2) {
            }
            $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation = iArr;
        }
        return iArr;
    }

    static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$State() {
        int[] iArr = $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$State;
        if (iArr == null) {
            iArr = new int[State.values().length];
            try {
                iArr[State.MANUAL_REFRESHING.ordinal()] = 5;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[State.OVERSCROLLING.ordinal()] = 6;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[State.PULL_TO_REFRESH.ordinal()] = 2;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[State.REFRESHING.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[State.RELEASE_TO_REFRESH.ordinal()] = 3;
            } catch (NoSuchFieldError e5) {
            }
            try {
                iArr[State.RESET.ordinal()] = 1;
            } catch (NoSuchFieldError e6) {
            }
            $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$State = iArr;
        }
        return iArr;
    }

    public PullToRefreshBase(Context context) {
        super(context);
        this.mIsBeingDragged = false;
        this.mState = State.RESET;
        this.mMode = Mode.getDefault();
        this.mShowViewWhileRefreshing = true;
        this.mScrollingWhileRefreshingEnabled = false;
        this.mFilterTouchEvents = true;
        this.mOverScrollEnabled = true;
        this.mLayoutVisibilityChangesEnabled = true;
        this.mLoadingAnimationStyle = AnimationStyle.getDefault();
        init(context, null);
    }

    public PullToRefreshBase(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mIsBeingDragged = false;
        this.mState = State.RESET;
        this.mMode = Mode.getDefault();
        this.mShowViewWhileRefreshing = true;
        this.mScrollingWhileRefreshingEnabled = false;
        this.mFilterTouchEvents = true;
        this.mOverScrollEnabled = true;
        this.mLayoutVisibilityChangesEnabled = true;
        this.mLoadingAnimationStyle = AnimationStyle.getDefault();
        init(context, attributeSet);
    }

    public PullToRefreshBase(Context context, Mode mode) {
        super(context);
        this.mIsBeingDragged = false;
        this.mState = State.RESET;
        this.mMode = Mode.getDefault();
        this.mShowViewWhileRefreshing = true;
        this.mScrollingWhileRefreshingEnabled = false;
        this.mFilterTouchEvents = true;
        this.mOverScrollEnabled = true;
        this.mLayoutVisibilityChangesEnabled = true;
        this.mLoadingAnimationStyle = AnimationStyle.getDefault();
        this.mMode = mode;
        init(context, null);
    }

    public PullToRefreshBase(Context context, Mode mode, AnimationStyle animationStyle) {
        super(context);
        this.mIsBeingDragged = false;
        this.mState = State.RESET;
        this.mMode = Mode.getDefault();
        this.mShowViewWhileRefreshing = true;
        this.mScrollingWhileRefreshingEnabled = false;
        this.mFilterTouchEvents = true;
        this.mOverScrollEnabled = true;
        this.mLayoutVisibilityChangesEnabled = true;
        this.mLoadingAnimationStyle = AnimationStyle.getDefault();
        this.mMode = mode;
        this.mLoadingAnimationStyle = animationStyle;
        init(context, null);
    }

    private void addRefreshableView(Context context, T t) {
        this.mRefreshableViewWrapper = new FrameLayout(context);
        this.mRefreshableViewWrapper.addView(t, -1, -1);
        addViewInternal(this.mRefreshableViewWrapper, new LinearLayout.LayoutParams(-1, -1));
    }

    public void callRefreshListener() {
        if (this.mOnRefreshListener != null) {
            this.mOnRefreshListener.onRefresh(this);
        } else if (this.mOnRefreshListener2 == null) {
        } else {
            if (this.mCurrentMode == Mode.PULL_FROM_START) {
                this.mOnRefreshListener2.onPullDownToRefresh(this);
            } else if (this.mCurrentMode != Mode.PULL_FROM_END) {
            } else {
                this.mOnRefreshListener2.onPullUpToRefresh(this);
            }
        }
    }

    private LinearLayout.LayoutParams getLoadingLayoutLayoutParams() {
        LinearLayout.LayoutParams layoutParams;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                layoutParams = new LinearLayout.LayoutParams(-2, -1);
                break;
            default:
                layoutParams = new LinearLayout.LayoutParams(-1, -2);
                break;
        }
        return layoutParams;
    }

    private int getMaximumPullScroll() {
        int round;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                round = Math.round(getWidth() / FRICTION);
                break;
            default:
                round = Math.round(getHeight() / FRICTION);
                break;
        }
        return round;
    }

    private void init(Context context, AttributeSet attributeSet) {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                setOrientation(0);
                break;
            default:
                setOrientation(1);
                break;
        }
        setGravity(17);
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.PullToRefresh);
        if (obtainStyledAttributes.hasValue(R.styleable.PullToRefresh_ptrMode)) {
            this.mMode = Mode.mapIntToValue(obtainStyledAttributes.getInteger(R.styleable.PullToRefresh_ptrMode, 0));
        }
        if (obtainStyledAttributes.hasValue(R.styleable.PullToRefresh_ptrAnimationStyle)) {
            this.mLoadingAnimationStyle = AnimationStyle.mapIntToValue(obtainStyledAttributes.getInteger(R.styleable.PullToRefresh_ptrAnimationStyle, 0));
        }
        this.mRefreshableView = createRefreshableView(context, attributeSet);
        addRefreshableView(context, this.mRefreshableView);
        this.mHeaderLayout = createLoadingLayout(context, Mode.PULL_FROM_START, obtainStyledAttributes);
        this.mFooterLayout = createLoadingLayout(context, Mode.PULL_FROM_END, obtainStyledAttributes);
        if (obtainStyledAttributes.hasValue(R.styleable.PullToRefresh_ptrRefreshableViewBackground)) {
            Drawable drawable = obtainStyledAttributes.getDrawable(R.styleable.PullToRefresh_ptrRefreshableViewBackground);
            if (drawable != null) {
                this.mRefreshableView.setBackgroundDrawable(drawable);
            }
        } else if (obtainStyledAttributes.hasValue(R.styleable.PullToRefresh_ptrAdapterViewBackground)) {
            Utils.warnDeprecation("ptrAdapterViewBackground", "ptrRefreshableViewBackground");
            Drawable drawable2 = obtainStyledAttributes.getDrawable(R.styleable.PullToRefresh_ptrAdapterViewBackground);
            if (drawable2 != null) {
                this.mRefreshableView.setBackgroundDrawable(drawable2);
            }
        }
        if (obtainStyledAttributes.hasValue(R.styleable.PullToRefresh_ptrOverScroll)) {
            this.mOverScrollEnabled = obtainStyledAttributes.getBoolean(R.styleable.PullToRefresh_ptrOverScroll, true);
        }
        if (obtainStyledAttributes.hasValue(R.styleable.PullToRefresh_ptrScrollingWhileRefreshingEnabled)) {
            this.mScrollingWhileRefreshingEnabled = obtainStyledAttributes.getBoolean(R.styleable.PullToRefresh_ptrScrollingWhileRefreshingEnabled, false);
        }
        handleStyledAttributes(obtainStyledAttributes);
        obtainStyledAttributes.recycle();
        updateUIForMode();
    }

    private boolean isReadyForPull() {
        boolean z = false;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mMode.ordinal()]) {
            case 2:
                z = isReadyForPullStart();
                break;
            case 3:
                z = isReadyForPullEnd();
                break;
            case 4:
                if (isReadyForPullEnd() || isReadyForPullStart()) {
                    z = true;
                    break;
                }
                break;
        }
        return z;
    }

    private void pullEvent() {
        float f;
        float f2;
        int round;
        int footerSize;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                f = this.mInitialMotionX;
                f2 = this.mLastMotionX;
                break;
            default:
                f = this.mInitialMotionY;
                f2 = this.mLastMotionY;
                break;
        }
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mCurrentMode.ordinal()]) {
            case 3:
                round = Math.round(Math.max(f - f2, 0.0f) / FRICTION);
                footerSize = getFooterSize();
                break;
            default:
                round = Math.round(Math.min(f - f2, 0.0f) / FRICTION);
                footerSize = getHeaderSize();
                break;
        }
        setHeaderScroll(round);
        if (round == 0 || isRefreshing()) {
            return;
        }
        float abs = Math.abs(round) / footerSize;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mCurrentMode.ordinal()]) {
            case 3:
                this.mFooterLayout.onPull(abs);
                break;
            default:
                this.mHeaderLayout.onPull(abs);
                break;
        }
        if (this.mState != State.PULL_TO_REFRESH && footerSize >= Math.abs(round)) {
            setState(State.PULL_TO_REFRESH, new boolean[0]);
        } else if (this.mState != State.PULL_TO_REFRESH || footerSize >= Math.abs(round)) {
        } else {
            setState(State.RELEASE_TO_REFRESH, new boolean[0]);
        }
    }

    private final void smoothScrollTo(int i, long j) {
        smoothScrollTo(i, j, 0L, null);
    }

    public final void smoothScrollTo(int i, long j, long j2, OnSmoothScrollFinishedListener onSmoothScrollFinishedListener) {
        int scrollX;
        if (this.mCurrentSmoothScrollRunnable != null) {
            this.mCurrentSmoothScrollRunnable.stop();
        }
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                scrollX = getScrollX();
                break;
            default:
                scrollX = getScrollY();
                break;
        }
        if (scrollX != i) {
            if (this.mScrollAnimationInterpolator == null) {
                this.mScrollAnimationInterpolator = new DecelerateInterpolator();
            }
            this.mCurrentSmoothScrollRunnable = new SmoothScrollRunnable(scrollX, i, j, onSmoothScrollFinishedListener);
            if (j2 > 0) {
                postDelayed(this.mCurrentSmoothScrollRunnable, j2);
            } else {
                post(this.mCurrentSmoothScrollRunnable);
            }
        }
    }

    private final void smoothScrollToAndBack(int i) {
        smoothScrollTo(i, 200L, 0L, new OnSmoothScrollFinishedListener() { // from class: com.handmark.pulltorefresh.library.PullToRefreshBase.3
            @Override // com.handmark.pulltorefresh.library.PullToRefreshBase.OnSmoothScrollFinishedListener
            public void onSmoothScrollFinished() {
                PullToRefreshBase.this.smoothScrollTo(0, 200L, 225L, null);
            }
        });
    }

    @Override // android.view.ViewGroup
    public void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        Log.d(LOG_TAG, "addView: " + view.getClass().getSimpleName());
        T refreshableView = getRefreshableView();
        if (refreshableView instanceof ViewGroup) {
            ((ViewGroup) refreshableView).addView(view, i, layoutParams);
            return;
        }
        throw new UnsupportedOperationException("Refreshable View is not a ViewGroup so can't addView");
    }

    protected final void addViewInternal(View view, int i, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, i, layoutParams);
    }

    protected final void addViewInternal(View view, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, -1, layoutParams);
    }

    protected LoadingLayout createLoadingLayout(Context context, Mode mode, TypedArray typedArray) {
        LoadingLayout createLoadingLayout = this.mLoadingAnimationStyle.createLoadingLayout(context, mode, getPullToRefreshScrollDirection(), typedArray);
        createLoadingLayout.setVisibility(4);
        return createLoadingLayout;
    }

    protected LoadingLayoutProxy createLoadingLayoutProxy(boolean z, boolean z2) {
        LoadingLayoutProxy loadingLayoutProxy = new LoadingLayoutProxy();
        if (z && this.mMode.showHeaderLoadingLayout()) {
            loadingLayoutProxy.addLayout(this.mHeaderLayout);
        }
        if (z2 && this.mMode.showFooterLoadingLayout()) {
            loadingLayoutProxy.addLayout(this.mFooterLayout);
        }
        return loadingLayoutProxy;
    }

    protected abstract T createRefreshableView(Context context, AttributeSet attributeSet);

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean demo() {
        boolean z = true;
        if (this.mMode.showHeaderLoadingLayout() && isReadyForPullStart()) {
            smoothScrollToAndBack((-getHeaderSize()) * 2);
        } else if (!this.mMode.showFooterLoadingLayout() || !isReadyForPullEnd()) {
            z = false;
        } else {
            smoothScrollToAndBack(getFooterSize() * 2);
        }
        return z;
    }

    protected final void disableLoadingLayoutVisibilityChanges() {
        this.mLayoutVisibilityChangesEnabled = false;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final Mode getCurrentMode() {
        return this.mCurrentMode;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean getFilterTouchEvents() {
        return this.mFilterTouchEvents;
    }

    protected final LoadingLayout getFooterLayout() {
        return this.mFooterLayout;
    }

    protected final int getFooterSize() {
        return this.mFooterLayout.getContentSize();
    }

    protected final LoadingLayout getHeaderLayout() {
        return this.mHeaderLayout;
    }

    protected final int getHeaderSize() {
        return this.mHeaderLayout.getContentSize();
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final ILoadingLayout getLoadingLayoutProxy() {
        return getLoadingLayoutProxy(true, true);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final ILoadingLayout getLoadingLayoutProxy(boolean z, boolean z2) {
        return createLoadingLayoutProxy(z, z2);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final Mode getMode() {
        return this.mMode;
    }

    public abstract Orientation getPullToRefreshScrollDirection();

    protected int getPullToRefreshScrollDuration() {
        return 200;
    }

    protected int getPullToRefreshScrollDurationLonger() {
        return SMOOTH_SCROLL_LONG_DURATION_MS;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final T getRefreshableView() {
        return this.mRefreshableView;
    }

    protected FrameLayout getRefreshableViewWrapper() {
        return this.mRefreshableViewWrapper;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean getShowViewWhileRefreshing() {
        return this.mShowViewWhileRefreshing;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final State getState() {
        return this.mState;
    }

    protected void handleStyledAttributes(TypedArray typedArray) {
    }

    public final boolean isDisableScrollingWhileRefreshing() {
        return !isScrollingWhileRefreshingEnabled();
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean isPullToRefreshEnabled() {
        return this.mMode.permitsPullToRefresh();
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean isPullToRefreshOverScrollEnabled() {
        return Build.VERSION.SDK_INT >= 9 && this.mOverScrollEnabled && OverscrollHelper.isAndroidOverScrollEnabled(this.mRefreshableView);
    }

    protected abstract boolean isReadyForPullEnd();

    protected abstract boolean isReadyForPullStart();

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean isRefreshing() {
        return this.mState == State.REFRESHING || this.mState == State.MANUAL_REFRESHING;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean isScrollingWhileRefreshingEnabled() {
        return this.mScrollingWhileRefreshingEnabled;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float f;
        float f2;
        boolean z = false;
        if (isPullToRefreshEnabled()) {
            int action = motionEvent.getAction();
            if (action == 3 || action == 1) {
                this.mIsBeingDragged = false;
            } else if (action == 0 || !this.mIsBeingDragged) {
                switch (action) {
                    case 0:
                        if (isReadyForPull()) {
                            float y = motionEvent.getY();
                            this.mInitialMotionY = y;
                            this.mLastMotionY = y;
                            float x = motionEvent.getX();
                            this.mInitialMotionX = x;
                            this.mLastMotionX = x;
                            this.mIsBeingDragged = false;
                        }
                        z = this.mIsBeingDragged;
                        break;
                    case 1:
                    default:
                        z = this.mIsBeingDragged;
                        break;
                    case 2:
                        if (!this.mScrollingWhileRefreshingEnabled && isRefreshing()) {
                            z = true;
                            break;
                        } else {
                            if (isReadyForPull()) {
                                float y2 = motionEvent.getY();
                                float x2 = motionEvent.getX();
                                switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
                                    case 2:
                                        f = x2 - this.mLastMotionX;
                                        f2 = y2 - this.mLastMotionY;
                                        break;
                                    default:
                                        f = y2 - this.mLastMotionY;
                                        f2 = x2 - this.mLastMotionX;
                                        break;
                                }
                                float abs = Math.abs(f);
                                if (abs > this.mTouchSlop && (!this.mFilterTouchEvents || abs > Math.abs(f2))) {
                                    if (this.mMode.showHeaderLoadingLayout() && f >= 1.0f && isReadyForPullStart()) {
                                        this.mLastMotionY = y2;
                                        this.mLastMotionX = x2;
                                        this.mIsBeingDragged = true;
                                        if (this.mMode == Mode.BOTH) {
                                            this.mCurrentMode = Mode.PULL_FROM_START;
                                        }
                                    } else if (this.mMode.showFooterLoadingLayout() && f <= -1.0f && isReadyForPullEnd()) {
                                        this.mLastMotionY = y2;
                                        this.mLastMotionX = x2;
                                        this.mIsBeingDragged = true;
                                        if (this.mMode == Mode.BOTH) {
                                            this.mCurrentMode = Mode.PULL_FROM_END;
                                        }
                                    }
                                }
                            }
                            z = this.mIsBeingDragged;
                            break;
                        }
                        break;
                }
            } else {
                z = true;
            }
        }
        return z;
    }

    protected void onPtrRestoreInstanceState(Bundle bundle) {
    }

    protected void onPtrSaveInstanceState(Bundle bundle) {
    }

    protected void onPullToRefresh() {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mCurrentMode.ordinal()]) {
            case 2:
                this.mHeaderLayout.pullToRefresh();
                return;
            case 3:
                this.mFooterLayout.pullToRefresh();
                return;
            default:
                return;
        }
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void onRefreshComplete() {
        if (isRefreshing()) {
            setState(State.RESET, new boolean[0]);
        }
    }

    protected void onRefreshing(boolean z) {
        if (this.mMode.showHeaderLoadingLayout()) {
            this.mHeaderLayout.refreshing();
        }
        if (this.mMode.showFooterLoadingLayout()) {
            this.mFooterLayout.refreshing();
        }
        if (!z) {
            callRefreshListener();
        } else if (!this.mShowViewWhileRefreshing) {
            smoothScrollTo(0);
        } else {
            OnSmoothScrollFinishedListener onSmoothScrollFinishedListener = new OnSmoothScrollFinishedListener() { // from class: com.handmark.pulltorefresh.library.PullToRefreshBase.1
                @Override // com.handmark.pulltorefresh.library.PullToRefreshBase.OnSmoothScrollFinishedListener
                public void onSmoothScrollFinished() {
                    PullToRefreshBase.this.callRefreshListener();
                }
            };
            switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mCurrentMode.ordinal()]) {
                case 3:
                case 5:
                    smoothScrollTo(getFooterSize(), onSmoothScrollFinishedListener);
                    return;
                case 4:
                default:
                    smoothScrollTo(-getHeaderSize(), onSmoothScrollFinishedListener);
                    return;
            }
        }
    }

    protected void onReleaseToRefresh() {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mCurrentMode.ordinal()]) {
            case 2:
                this.mHeaderLayout.releaseToRefresh();
                return;
            case 3:
                this.mFooterLayout.releaseToRefresh();
                return;
            default:
                return;
        }
    }

    protected void onReset() {
        this.mIsBeingDragged = false;
        this.mLayoutVisibilityChangesEnabled = true;
        this.mHeaderLayout.reset();
        this.mFooterLayout.reset();
        smoothScrollTo(0);
    }

    @Override // android.view.View
    protected final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof Bundle)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        Bundle bundle = (Bundle) parcelable;
        setMode(Mode.mapIntToValue(bundle.getInt(STATE_MODE, 0)));
        this.mCurrentMode = Mode.mapIntToValue(bundle.getInt(STATE_CURRENT_MODE, 0));
        this.mScrollingWhileRefreshingEnabled = bundle.getBoolean(STATE_SCROLLING_REFRESHING_ENABLED, false);
        this.mShowViewWhileRefreshing = bundle.getBoolean(STATE_SHOW_REFRESHING_VIEW, true);
        super.onRestoreInstanceState(bundle.getParcelable(STATE_SUPER));
        State mapIntToValue = State.mapIntToValue(bundle.getInt(STATE_STATE, 0));
        if (mapIntToValue == State.REFRESHING || mapIntToValue == State.MANUAL_REFRESHING) {
            setState(mapIntToValue, true);
        }
        onPtrRestoreInstanceState(bundle);
    }

    @Override // android.view.View
    protected final Parcelable onSaveInstanceState() {
        Bundle bundle = new Bundle();
        onPtrSaveInstanceState(bundle);
        bundle.putInt(STATE_STATE, this.mState.getIntValue());
        bundle.putInt(STATE_MODE, this.mMode.getIntValue());
        bundle.putInt(STATE_CURRENT_MODE, this.mCurrentMode.getIntValue());
        bundle.putBoolean(STATE_SCROLLING_REFRESHING_ENABLED, this.mScrollingWhileRefreshingEnabled);
        bundle.putBoolean(STATE_SHOW_REFRESHING_VIEW, this.mShowViewWhileRefreshing);
        bundle.putParcelable(STATE_SUPER, super.onSaveInstanceState());
        return bundle;
    }

    @Override // android.view.View
    protected final void onSizeChanged(int i, int i2, int i3, int i4) {
        Log.d(LOG_TAG, String.format("onSizeChanged. W: %d, H: %d", Integer.valueOf(i), Integer.valueOf(i2)));
        super.onSizeChanged(i, i2, i3, i4);
        refreshLoadingViewsSize();
        refreshRefreshableViewSize(i, i2);
        post(new Runnable() { // from class: com.handmark.pulltorefresh.library.PullToRefreshBase.2
            @Override // java.lang.Runnable
            public void run() {
                PullToRefreshBase.this.requestLayout();
            }
        });
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x002d, code lost:
        if (r8.getEdgeFlags() == 0) goto L16;
     */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z;
        if (!isPullToRefreshEnabled()) {
            z = false;
        } else if (this.mScrollingWhileRefreshingEnabled || !isRefreshing()) {
            if (motionEvent.getAction() == 0) {
                z = false;
            }
            switch (motionEvent.getAction()) {
                case 0:
                    z = false;
                    if (isReadyForPull()) {
                        float y = motionEvent.getY();
                        this.mInitialMotionY = y;
                        this.mLastMotionY = y;
                        float x = motionEvent.getX();
                        this.mInitialMotionX = x;
                        this.mLastMotionX = x;
                        z = true;
                        break;
                    }
                    break;
                case 1:
                case 3:
                    z = false;
                    if (this.mIsBeingDragged) {
                        this.mIsBeingDragged = false;
                        if (this.mState == State.RELEASE_TO_REFRESH && (this.mOnRefreshListener != null || this.mOnRefreshListener2 != null)) {
                            setState(State.REFRESHING, true);
                            z = true;
                            break;
                        } else if (!isRefreshing()) {
                            setState(State.RESET, new boolean[0]);
                            z = true;
                            break;
                        } else {
                            smoothScrollTo(0);
                            z = true;
                            break;
                        }
                    }
                    break;
                case 2:
                    z = false;
                    if (this.mIsBeingDragged) {
                        this.mLastMotionY = motionEvent.getY();
                        this.mLastMotionX = motionEvent.getX();
                        pullEvent();
                        z = true;
                        break;
                    }
                    break;
                default:
                    z = false;
                    break;
            }
        } else {
            z = true;
        }
        return z;
    }

    protected final void refreshLoadingViewsSize() {
        int i;
        int i2;
        int maximumPullScroll = (int) (getMaximumPullScroll() * 1.2f);
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 1:
                if (this.mMode.showHeaderLoadingLayout()) {
                    this.mHeaderLayout.setHeight(maximumPullScroll);
                    i = -maximumPullScroll;
                } else {
                    i = 0;
                }
                if (!this.mMode.showFooterLoadingLayout()) {
                    paddingBottom = 0;
                    break;
                } else {
                    this.mFooterLayout.setHeight(maximumPullScroll);
                    paddingBottom = -maximumPullScroll;
                    break;
                }
            case 2:
                if (this.mMode.showHeaderLoadingLayout()) {
                    this.mHeaderLayout.setWidth(maximumPullScroll);
                    i2 = -maximumPullScroll;
                } else {
                    i2 = 0;
                }
                if (!this.mMode.showFooterLoadingLayout()) {
                    paddingRight = 0;
                    paddingLeft = i2;
                    i = paddingTop;
                    break;
                } else {
                    this.mFooterLayout.setWidth(maximumPullScroll);
                    paddingRight = -maximumPullScroll;
                    paddingLeft = i2;
                    i = paddingTop;
                    break;
                }
            default:
                i = paddingTop;
                break;
        }
        Log.d(LOG_TAG, String.format("Setting Padding. L: %d, T: %d, R: %d, B: %d", Integer.valueOf(paddingLeft), Integer.valueOf(i), Integer.valueOf(paddingRight), Integer.valueOf(paddingBottom)));
        setPadding(paddingLeft, i, paddingRight, paddingBottom);
    }

    protected final void refreshRefreshableViewSize(int i, int i2) {
        LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) this.mRefreshableViewWrapper.getLayoutParams();
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 1:
                if (layoutParams.height == i2) {
                    return;
                }
                layoutParams.height = i2;
                this.mRefreshableViewWrapper.requestLayout();
                return;
            case 2:
                if (layoutParams.width == i) {
                    return;
                }
                layoutParams.width = i;
                this.mRefreshableViewWrapper.requestLayout();
                return;
            default:
                return;
        }
    }

    public void setDisableScrollingWhileRefreshing(boolean z) {
        setScrollingWhileRefreshingEnabled(!z);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setFilterTouchEvents(boolean z) {
        this.mFilterTouchEvents = z;
    }

    protected final void setHeaderScroll(int i) {
        Log.d(LOG_TAG, "setHeaderScroll: " + i);
        int maximumPullScroll = getMaximumPullScroll();
        int min = Math.min(maximumPullScroll, Math.max(-maximumPullScroll, i));
        if (this.mLayoutVisibilityChangesEnabled) {
            if (min < 0) {
                this.mHeaderLayout.setVisibility(0);
            } else if (min > 0) {
                this.mFooterLayout.setVisibility(0);
            } else {
                this.mHeaderLayout.setVisibility(4);
                this.mFooterLayout.setVisibility(4);
            }
        }
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 1:
                scrollTo(0, min);
                return;
            case 2:
                scrollTo(min, 0);
                return;
            default:
                return;
        }
    }

    public void setLastUpdatedLabel(CharSequence charSequence) {
        getLoadingLayoutProxy().setLastUpdatedLabel(charSequence);
    }

    public void setLoadingDrawable(Drawable drawable) {
        getLoadingLayoutProxy().setLoadingDrawable(drawable);
    }

    public void setLoadingDrawable(Drawable drawable, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setLoadingDrawable(drawable);
    }

    @Override // android.view.View
    public void setLongClickable(boolean z) {
        getRefreshableView().setLongClickable(z);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setMode(Mode mode) {
        if (mode != this.mMode) {
            Log.d(LOG_TAG, "Setting mode to: " + mode);
            this.mMode = mode;
            updateUIForMode();
        }
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public void setOnPullEventListener(OnPullEventListener<T> onPullEventListener) {
        this.mOnPullEventListener = onPullEventListener;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setOnRefreshListener(OnRefreshListener2<T> onRefreshListener2) {
        this.mOnRefreshListener2 = onRefreshListener2;
        this.mOnRefreshListener = null;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setOnRefreshListener(OnRefreshListener<T> onRefreshListener) {
        this.mOnRefreshListener = onRefreshListener;
        this.mOnRefreshListener2 = null;
    }

    public void setPullLabel(CharSequence charSequence) {
        getLoadingLayoutProxy().setPullLabel(charSequence);
    }

    public void setPullLabel(CharSequence charSequence, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setPullLabel(charSequence);
    }

    public final void setPullToRefreshEnabled(boolean z) {
        setMode(z ? Mode.getDefault() : Mode.DISABLED);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setPullToRefreshOverScrollEnabled(boolean z) {
        this.mOverScrollEnabled = z;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setRefreshing() {
        setRefreshing(true);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setRefreshing(boolean z) {
        if (!isRefreshing()) {
            setState(State.MANUAL_REFRESHING, z);
        }
    }

    public void setRefreshingLabel(CharSequence charSequence) {
        getLoadingLayoutProxy().setRefreshingLabel(charSequence);
    }

    public void setRefreshingLabel(CharSequence charSequence, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setRefreshingLabel(charSequence);
    }

    public void setReleaseLabel(CharSequence charSequence) {
        setReleaseLabel(charSequence, Mode.BOTH);
    }

    public void setReleaseLabel(CharSequence charSequence, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setReleaseLabel(charSequence);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public void setScrollAnimationInterpolator(Interpolator interpolator) {
        this.mScrollAnimationInterpolator = interpolator;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setScrollingWhileRefreshingEnabled(boolean z) {
        this.mScrollingWhileRefreshingEnabled = z;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setShowViewWhileRefreshing(boolean z) {
        this.mShowViewWhileRefreshing = z;
    }

    final void setState(State state, boolean... zArr) {
        this.mState = state;
        Log.d(LOG_TAG, "State: " + this.mState.name());
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$State()[this.mState.ordinal()]) {
            case 1:
                onReset();
                break;
            case 2:
                onPullToRefresh();
                break;
            case 3:
                onReleaseToRefresh();
                break;
            case 4:
            case 5:
                onRefreshing(zArr[0]);
                break;
        }
        if (this.mOnPullEventListener != null) {
            this.mOnPullEventListener.onPullEvent(this, this.mState, this.mCurrentMode);
        }
    }

    protected final void smoothScrollTo(int i) {
        smoothScrollTo(i, getPullToRefreshScrollDuration());
    }

    protected final void smoothScrollTo(int i, OnSmoothScrollFinishedListener onSmoothScrollFinishedListener) {
        smoothScrollTo(i, getPullToRefreshScrollDuration(), 0L, onSmoothScrollFinishedListener);
    }

    protected final void smoothScrollToLonger(int i) {
        smoothScrollTo(i, getPullToRefreshScrollDurationLonger());
    }

    protected void updateUIForMode() {
        LinearLayout.LayoutParams loadingLayoutLayoutParams = getLoadingLayoutLayoutParams();
        if (this == this.mHeaderLayout.getParent()) {
            removeView(this.mHeaderLayout);
        }
        if (this.mMode.showHeaderLoadingLayout()) {
            addViewInternal(this.mHeaderLayout, 0, loadingLayoutLayoutParams);
        }
        if (this == this.mFooterLayout.getParent()) {
            removeView(this.mFooterLayout);
        }
        if (this.mMode.showFooterLoadingLayout()) {
            addViewInternal(this.mFooterLayout, loadingLayoutLayoutParams);
        }
        refreshLoadingViewsSize();
        this.mCurrentMode = this.mMode != Mode.BOTH ? this.mMode : Mode.PULL_FROM_START;
    }
}
