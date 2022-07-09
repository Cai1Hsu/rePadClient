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

/* loaded from: classes.dex */
public abstract class PullToRefreshBase<T extends View> extends LinearLayout implements IPullToRefresh<T> {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode = null;
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation = null;
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$State = null;
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

    /* loaded from: classes.dex */
    public interface OnLastItemVisibleListener {
        void onLastItemVisible();
    }

    /* loaded from: classes.dex */
    public interface OnPullEventListener<V extends View> {
        void onPullEvent(PullToRefreshBase<V> pullToRefreshBase, State state, Mode mode);
    }

    /* loaded from: classes.dex */
    public interface OnRefreshListener<V extends View> {
        void onRefresh(PullToRefreshBase<V> pullToRefreshBase);
    }

    /* loaded from: classes.dex */
    public interface OnRefreshListener2<V extends View> {
        void onPullDownToRefresh(PullToRefreshBase<V> pullToRefreshBase);

        void onPullUpToRefresh(PullToRefreshBase<V> pullToRefreshBase);
    }

    /* loaded from: classes.dex */
    interface OnSmoothScrollFinishedListener {
        void onSmoothScrollFinished();
    }

    /* loaded from: classes.dex */
    public enum Orientation {
        VERTICAL,
        HORIZONTAL
    }

    protected abstract T createRefreshableView(Context context, AttributeSet attributeSet);

    public abstract Orientation getPullToRefreshScrollDirection();

    protected abstract boolean isReadyForPullEnd();

    protected abstract boolean isReadyForPullStart();

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

    public PullToRefreshBase(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mIsBeingDragged = false;
        this.mState = State.RESET;
        this.mMode = Mode.getDefault();
        this.mShowViewWhileRefreshing = true;
        this.mScrollingWhileRefreshingEnabled = false;
        this.mFilterTouchEvents = true;
        this.mOverScrollEnabled = true;
        this.mLayoutVisibilityChangesEnabled = true;
        this.mLoadingAnimationStyle = AnimationStyle.getDefault();
        init(context, attrs);
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

    public PullToRefreshBase(Context context, Mode mode, AnimationStyle animStyle) {
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
        this.mLoadingAnimationStyle = animStyle;
        init(context, null);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        Log.d(LOG_TAG, "addView: " + child.getClass().getSimpleName());
        T refreshableView = getRefreshableView();
        if (refreshableView instanceof ViewGroup) {
            ((ViewGroup) refreshableView).addView(child, index, params);
            return;
        }
        throw new UnsupportedOperationException("Refreshable View is not a ViewGroup so can't addView");
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean demo() {
        if (this.mMode.showHeaderLoadingLayout() && isReadyForPullStart()) {
            smoothScrollToAndBack((-getHeaderSize()) * 2);
            return true;
        } else if (this.mMode.showFooterLoadingLayout() && isReadyForPullEnd()) {
            smoothScrollToAndBack(getFooterSize() * 2);
            return true;
        } else {
            return false;
        }
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final Mode getCurrentMode() {
        return this.mCurrentMode;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean getFilterTouchEvents() {
        return this.mFilterTouchEvents;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final ILoadingLayout getLoadingLayoutProxy() {
        return getLoadingLayoutProxy(true, true);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final ILoadingLayout getLoadingLayoutProxy(boolean includeStart, boolean includeEnd) {
        return createLoadingLayoutProxy(includeStart, includeEnd);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final Mode getMode() {
        return this.mMode;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final T getRefreshableView() {
        return this.mRefreshableView;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean getShowViewWhileRefreshing() {
        return this.mShowViewWhileRefreshing;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final State getState() {
        return this.mState;
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

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean isRefreshing() {
        return this.mState == State.REFRESHING || this.mState == State.MANUAL_REFRESHING;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final boolean isScrollingWhileRefreshingEnabled() {
        return this.mScrollingWhileRefreshingEnabled;
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent event) {
        float diff;
        float oppositeDiff;
        if (!isPullToRefreshEnabled()) {
            return false;
        }
        int action = event.getAction();
        if (action == 3 || action == 1) {
            this.mIsBeingDragged = false;
            return false;
        } else if (action != 0 && this.mIsBeingDragged) {
            return true;
        } else {
            switch (action) {
                case 0:
                    if (isReadyForPull()) {
                        float y = event.getY();
                        this.mInitialMotionY = y;
                        this.mLastMotionY = y;
                        float x = event.getX();
                        this.mInitialMotionX = x;
                        this.mLastMotionX = x;
                        this.mIsBeingDragged = false;
                        break;
                    }
                    break;
                case 2:
                    if (!this.mScrollingWhileRefreshingEnabled && isRefreshing()) {
                        return true;
                    }
                    if (isReadyForPull()) {
                        float y2 = event.getY();
                        float x2 = event.getX();
                        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
                            case 2:
                                diff = x2 - this.mLastMotionX;
                                oppositeDiff = y2 - this.mLastMotionY;
                                break;
                            default:
                                diff = y2 - this.mLastMotionY;
                                oppositeDiff = x2 - this.mLastMotionX;
                                break;
                        }
                        float absDiff = Math.abs(diff);
                        if (absDiff > this.mTouchSlop && (!this.mFilterTouchEvents || absDiff > Math.abs(oppositeDiff))) {
                            if (this.mMode.showHeaderLoadingLayout() && diff >= 1.0f && isReadyForPullStart()) {
                                this.mLastMotionY = y2;
                                this.mLastMotionX = x2;
                                this.mIsBeingDragged = true;
                                if (this.mMode == Mode.BOTH) {
                                    this.mCurrentMode = Mode.PULL_FROM_START;
                                    break;
                                }
                            } else if (this.mMode.showFooterLoadingLayout() && diff <= -1.0f && isReadyForPullEnd()) {
                                this.mLastMotionY = y2;
                                this.mLastMotionX = x2;
                                this.mIsBeingDragged = true;
                                if (this.mMode == Mode.BOTH) {
                                    this.mCurrentMode = Mode.PULL_FROM_END;
                                    break;
                                }
                            }
                        }
                    }
                    break;
            }
            return this.mIsBeingDragged;
        }
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void onRefreshComplete() {
        if (isRefreshing()) {
            setState(State.RESET, new boolean[0]);
        }
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent event) {
        if (!isPullToRefreshEnabled()) {
            return false;
        }
        if (!this.mScrollingWhileRefreshingEnabled && isRefreshing()) {
            return true;
        }
        if (event.getAction() == 0 && event.getEdgeFlags() != 0) {
            return false;
        }
        switch (event.getAction()) {
            case 0:
                if (!isReadyForPull()) {
                    return false;
                }
                float y = event.getY();
                this.mInitialMotionY = y;
                this.mLastMotionY = y;
                float x = event.getX();
                this.mInitialMotionX = x;
                this.mLastMotionX = x;
                return true;
            case 1:
            case 3:
                if (!this.mIsBeingDragged) {
                    return false;
                }
                this.mIsBeingDragged = false;
                if (this.mState == State.RELEASE_TO_REFRESH && (this.mOnRefreshListener != null || this.mOnRefreshListener2 != null)) {
                    setState(State.REFRESHING, true);
                    return true;
                } else if (isRefreshing()) {
                    smoothScrollTo(0);
                    return true;
                } else {
                    setState(State.RESET, new boolean[0]);
                    return true;
                }
            case 2:
                if (!this.mIsBeingDragged) {
                    return false;
                }
                this.mLastMotionY = event.getY();
                this.mLastMotionX = event.getX();
                pullEvent();
                return true;
            default:
                return false;
        }
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setScrollingWhileRefreshingEnabled(boolean allowScrollingWhileRefreshing) {
        this.mScrollingWhileRefreshingEnabled = allowScrollingWhileRefreshing;
    }

    public void setDisableScrollingWhileRefreshing(boolean disableScrollingWhileRefreshing) {
        setScrollingWhileRefreshingEnabled(!disableScrollingWhileRefreshing);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setFilterTouchEvents(boolean filterEvents) {
        this.mFilterTouchEvents = filterEvents;
    }

    public void setLastUpdatedLabel(CharSequence label) {
        getLoadingLayoutProxy().setLastUpdatedLabel(label);
    }

    public void setLoadingDrawable(Drawable drawable) {
        getLoadingLayoutProxy().setLoadingDrawable(drawable);
    }

    public void setLoadingDrawable(Drawable drawable, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setLoadingDrawable(drawable);
    }

    @Override // android.view.View
    public void setLongClickable(boolean longClickable) {
        getRefreshableView().setLongClickable(longClickable);
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
    public void setOnPullEventListener(OnPullEventListener<T> listener) {
        this.mOnPullEventListener = listener;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setOnRefreshListener(OnRefreshListener<T> listener) {
        this.mOnRefreshListener = listener;
        this.mOnRefreshListener2 = null;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setOnRefreshListener(OnRefreshListener2<T> listener) {
        this.mOnRefreshListener2 = listener;
        this.mOnRefreshListener = null;
    }

    public void setPullLabel(CharSequence pullLabel) {
        getLoadingLayoutProxy().setPullLabel(pullLabel);
    }

    public void setPullLabel(CharSequence pullLabel, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setPullLabel(pullLabel);
    }

    public final void setPullToRefreshEnabled(boolean enable) {
        setMode(enable ? Mode.getDefault() : Mode.DISABLED);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setPullToRefreshOverScrollEnabled(boolean enabled) {
        this.mOverScrollEnabled = enabled;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setRefreshing() {
        setRefreshing(true);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setRefreshing(boolean doScroll) {
        if (!isRefreshing()) {
            setState(State.MANUAL_REFRESHING, doScroll);
        }
    }

    public void setRefreshingLabel(CharSequence refreshingLabel) {
        getLoadingLayoutProxy().setRefreshingLabel(refreshingLabel);
    }

    public void setRefreshingLabel(CharSequence refreshingLabel, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setRefreshingLabel(refreshingLabel);
    }

    public void setReleaseLabel(CharSequence releaseLabel) {
        setReleaseLabel(releaseLabel, Mode.BOTH);
    }

    public void setReleaseLabel(CharSequence releaseLabel, Mode mode) {
        getLoadingLayoutProxy(mode.showHeaderLoadingLayout(), mode.showFooterLoadingLayout()).setReleaseLabel(releaseLabel);
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public void setScrollAnimationInterpolator(Interpolator interpolator) {
        this.mScrollAnimationInterpolator = interpolator;
    }

    @Override // com.handmark.pulltorefresh.library.IPullToRefresh
    public final void setShowViewWhileRefreshing(boolean showView) {
        this.mShowViewWhileRefreshing = showView;
    }

    final void setState(State state, boolean... params) {
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
                onRefreshing(params[0]);
                break;
        }
        if (this.mOnPullEventListener != null) {
            this.mOnPullEventListener.onPullEvent(this, this.mState, this.mCurrentMode);
        }
    }

    protected final void addViewInternal(View child, int index, ViewGroup.LayoutParams params) {
        super.addView(child, index, params);
    }

    protected final void addViewInternal(View child, ViewGroup.LayoutParams params) {
        super.addView(child, -1, params);
    }

    protected LoadingLayout createLoadingLayout(Context context, Mode mode, TypedArray attrs) {
        LoadingLayout layout = this.mLoadingAnimationStyle.createLoadingLayout(context, mode, getPullToRefreshScrollDirection(), attrs);
        layout.setVisibility(4);
        return layout;
    }

    protected LoadingLayoutProxy createLoadingLayoutProxy(boolean includeStart, boolean includeEnd) {
        LoadingLayoutProxy proxy = new LoadingLayoutProxy();
        if (includeStart && this.mMode.showHeaderLoadingLayout()) {
            proxy.addLayout(this.mHeaderLayout);
        }
        if (includeEnd && this.mMode.showFooterLoadingLayout()) {
            proxy.addLayout(this.mFooterLayout);
        }
        return proxy;
    }

    protected final void disableLoadingLayoutVisibilityChanges() {
        this.mLayoutVisibilityChangesEnabled = false;
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

    protected int getPullToRefreshScrollDuration() {
        return 200;
    }

    protected int getPullToRefreshScrollDurationLonger() {
        return SMOOTH_SCROLL_LONG_DURATION_MS;
    }

    protected FrameLayout getRefreshableViewWrapper() {
        return this.mRefreshableViewWrapper;
    }

    protected void handleStyledAttributes(TypedArray a) {
    }

    protected void onPtrRestoreInstanceState(Bundle savedInstanceState) {
    }

    protected void onPtrSaveInstanceState(Bundle saveState) {
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

    protected void onRefreshing(boolean doScroll) {
        if (this.mMode.showHeaderLoadingLayout()) {
            this.mHeaderLayout.refreshing();
        }
        if (this.mMode.showFooterLoadingLayout()) {
            this.mFooterLayout.refreshing();
        }
        if (doScroll) {
            if (this.mShowViewWhileRefreshing) {
                OnSmoothScrollFinishedListener listener = new OnSmoothScrollFinishedListener() { // from class: com.handmark.pulltorefresh.library.PullToRefreshBase.1
                    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase.OnSmoothScrollFinishedListener
                    public void onSmoothScrollFinished() {
                        PullToRefreshBase.this.callRefreshListener();
                    }
                };
                switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mCurrentMode.ordinal()]) {
                    case 3:
                    case 5:
                        smoothScrollTo(getFooterSize(), listener);
                        return;
                    case 4:
                    default:
                        smoothScrollTo(-getHeaderSize(), listener);
                        return;
                }
            }
            smoothScrollTo(0);
            return;
        }
        callRefreshListener();
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
    protected final void onRestoreInstanceState(Parcelable state) {
        if (state instanceof Bundle) {
            Bundle bundle = (Bundle) state;
            setMode(Mode.mapIntToValue(bundle.getInt(STATE_MODE, 0)));
            this.mCurrentMode = Mode.mapIntToValue(bundle.getInt(STATE_CURRENT_MODE, 0));
            this.mScrollingWhileRefreshingEnabled = bundle.getBoolean(STATE_SCROLLING_REFRESHING_ENABLED, false);
            this.mShowViewWhileRefreshing = bundle.getBoolean(STATE_SHOW_REFRESHING_VIEW, true);
            super.onRestoreInstanceState(bundle.getParcelable(STATE_SUPER));
            State viewState = State.mapIntToValue(bundle.getInt(STATE_STATE, 0));
            if (viewState == State.REFRESHING || viewState == State.MANUAL_REFRESHING) {
                setState(viewState, true);
            }
            onPtrRestoreInstanceState(bundle);
            return;
        }
        super.onRestoreInstanceState(state);
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
    protected final void onSizeChanged(int w, int h, int oldw, int oldh) {
        Log.d(LOG_TAG, String.format("onSizeChanged. W: %d, H: %d", Integer.valueOf(w), Integer.valueOf(h)));
        super.onSizeChanged(w, h, oldw, oldh);
        refreshLoadingViewsSize();
        refreshRefreshableViewSize(w, h);
        post(new Runnable() { // from class: com.handmark.pulltorefresh.library.PullToRefreshBase.2
            @Override // java.lang.Runnable
            public void run() {
                PullToRefreshBase.this.requestLayout();
            }
        });
    }

    protected final void refreshLoadingViewsSize() {
        int maximumPullScroll = (int) (getMaximumPullScroll() * 1.2f);
        int pLeft = getPaddingLeft();
        int pTop = getPaddingTop();
        int pRight = getPaddingRight();
        int pBottom = getPaddingBottom();
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 1:
                if (this.mMode.showHeaderLoadingLayout()) {
                    this.mHeaderLayout.setHeight(maximumPullScroll);
                    pTop = -maximumPullScroll;
                } else {
                    pTop = 0;
                }
                if (this.mMode.showFooterLoadingLayout()) {
                    this.mFooterLayout.setHeight(maximumPullScroll);
                    pBottom = -maximumPullScroll;
                    break;
                } else {
                    pBottom = 0;
                    break;
                }
            case 2:
                if (this.mMode.showHeaderLoadingLayout()) {
                    this.mHeaderLayout.setWidth(maximumPullScroll);
                    pLeft = -maximumPullScroll;
                } else {
                    pLeft = 0;
                }
                if (this.mMode.showFooterLoadingLayout()) {
                    this.mFooterLayout.setWidth(maximumPullScroll);
                    pRight = -maximumPullScroll;
                    break;
                } else {
                    pRight = 0;
                    break;
                }
        }
        Log.d(LOG_TAG, String.format("Setting Padding. L: %d, T: %d, R: %d, B: %d", Integer.valueOf(pLeft), Integer.valueOf(pTop), Integer.valueOf(pRight), Integer.valueOf(pBottom)));
        setPadding(pLeft, pTop, pRight, pBottom);
    }

    protected final void refreshRefreshableViewSize(int width, int height) {
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) this.mRefreshableViewWrapper.getLayoutParams();
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 1:
                if (lp.height != height) {
                    lp.height = height;
                    this.mRefreshableViewWrapper.requestLayout();
                    return;
                }
                return;
            case 2:
                if (lp.width != width) {
                    lp.width = width;
                    this.mRefreshableViewWrapper.requestLayout();
                    return;
                }
                return;
            default:
                return;
        }
    }

    protected final void setHeaderScroll(int value) {
        Log.d(LOG_TAG, "setHeaderScroll: " + value);
        int maximumPullScroll = getMaximumPullScroll();
        int value2 = Math.min(maximumPullScroll, Math.max(-maximumPullScroll, value));
        if (this.mLayoutVisibilityChangesEnabled) {
            if (value2 < 0) {
                this.mHeaderLayout.setVisibility(0);
            } else if (value2 > 0) {
                this.mFooterLayout.setVisibility(0);
            } else {
                this.mHeaderLayout.setVisibility(4);
                this.mFooterLayout.setVisibility(4);
            }
        }
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 1:
                scrollTo(0, value2);
                return;
            case 2:
                scrollTo(value2, 0);
                return;
            default:
                return;
        }
    }

    protected final void smoothScrollTo(int scrollValue) {
        smoothScrollTo(scrollValue, getPullToRefreshScrollDuration());
    }

    protected final void smoothScrollTo(int scrollValue, OnSmoothScrollFinishedListener listener) {
        smoothScrollTo(scrollValue, getPullToRefreshScrollDuration(), 0L, listener);
    }

    protected final void smoothScrollToLonger(int scrollValue) {
        smoothScrollTo(scrollValue, getPullToRefreshScrollDurationLonger());
    }

    protected void updateUIForMode() {
        LinearLayout.LayoutParams lp = getLoadingLayoutLayoutParams();
        if (this == this.mHeaderLayout.getParent()) {
            removeView(this.mHeaderLayout);
        }
        if (this.mMode.showHeaderLoadingLayout()) {
            addViewInternal(this.mHeaderLayout, 0, lp);
        }
        if (this == this.mFooterLayout.getParent()) {
            removeView(this.mFooterLayout);
        }
        if (this.mMode.showFooterLoadingLayout()) {
            addViewInternal(this.mFooterLayout, lp);
        }
        refreshLoadingViewsSize();
        this.mCurrentMode = this.mMode != Mode.BOTH ? this.mMode : Mode.PULL_FROM_START;
    }

    private void addRefreshableView(Context context, T refreshableView) {
        this.mRefreshableViewWrapper = new FrameLayout(context);
        this.mRefreshableViewWrapper.addView(refreshableView, -1, -1);
        addViewInternal(this.mRefreshableViewWrapper, new LinearLayout.LayoutParams(-1, -1));
    }

    public void callRefreshListener() {
        if (this.mOnRefreshListener != null) {
            this.mOnRefreshListener.onRefresh(this);
        } else if (this.mOnRefreshListener2 != null) {
            if (this.mCurrentMode == Mode.PULL_FROM_START) {
                this.mOnRefreshListener2.onPullDownToRefresh(this);
            } else if (this.mCurrentMode == Mode.PULL_FROM_END) {
                this.mOnRefreshListener2.onPullUpToRefresh(this);
            }
        }
    }

    private void init(Context context, AttributeSet attrs) {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                setOrientation(0);
                break;
            default:
                setOrientation(1);
                break;
        }
        setGravity(17);
        ViewConfiguration config = ViewConfiguration.get(context);
        this.mTouchSlop = config.getScaledTouchSlop();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.PullToRefresh);
        if (a.hasValue(R.styleable.PullToRefresh_ptrMode)) {
            this.mMode = Mode.mapIntToValue(a.getInteger(R.styleable.PullToRefresh_ptrMode, 0));
        }
        if (a.hasValue(R.styleable.PullToRefresh_ptrAnimationStyle)) {
            this.mLoadingAnimationStyle = AnimationStyle.mapIntToValue(a.getInteger(R.styleable.PullToRefresh_ptrAnimationStyle, 0));
        }
        this.mRefreshableView = createRefreshableView(context, attrs);
        addRefreshableView(context, this.mRefreshableView);
        this.mHeaderLayout = createLoadingLayout(context, Mode.PULL_FROM_START, a);
        this.mFooterLayout = createLoadingLayout(context, Mode.PULL_FROM_END, a);
        if (a.hasValue(R.styleable.PullToRefresh_ptrRefreshableViewBackground)) {
            Drawable background = a.getDrawable(R.styleable.PullToRefresh_ptrRefreshableViewBackground);
            if (background != null) {
                this.mRefreshableView.setBackgroundDrawable(background);
            }
        } else if (a.hasValue(R.styleable.PullToRefresh_ptrAdapterViewBackground)) {
            Utils.warnDeprecation("ptrAdapterViewBackground", "ptrRefreshableViewBackground");
            Drawable background2 = a.getDrawable(R.styleable.PullToRefresh_ptrAdapterViewBackground);
            if (background2 != null) {
                this.mRefreshableView.setBackgroundDrawable(background2);
            }
        }
        if (a.hasValue(R.styleable.PullToRefresh_ptrOverScroll)) {
            this.mOverScrollEnabled = a.getBoolean(R.styleable.PullToRefresh_ptrOverScroll, true);
        }
        if (a.hasValue(R.styleable.PullToRefresh_ptrScrollingWhileRefreshingEnabled)) {
            this.mScrollingWhileRefreshingEnabled = a.getBoolean(R.styleable.PullToRefresh_ptrScrollingWhileRefreshingEnabled, false);
        }
        handleStyledAttributes(a);
        a.recycle();
        updateUIForMode();
    }

    private boolean isReadyForPull() {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mMode.ordinal()]) {
            case 2:
                return isReadyForPullStart();
            case 3:
                return isReadyForPullEnd();
            case 4:
                return isReadyForPullEnd() || isReadyForPullStart();
            default:
                return false;
        }
    }

    private void pullEvent() {
        float initialMotionValue;
        float lastMotionValue;
        int newScrollValue;
        int itemDimension;
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                initialMotionValue = this.mInitialMotionX;
                lastMotionValue = this.mLastMotionX;
                break;
            default:
                initialMotionValue = this.mInitialMotionY;
                lastMotionValue = this.mLastMotionY;
                break;
        }
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mCurrentMode.ordinal()]) {
            case 3:
                newScrollValue = Math.round(Math.max(initialMotionValue - lastMotionValue, 0.0f) / FRICTION);
                itemDimension = getFooterSize();
                break;
            default:
                newScrollValue = Math.round(Math.min(initialMotionValue - lastMotionValue, 0.0f) / FRICTION);
                itemDimension = getHeaderSize();
                break;
        }
        setHeaderScroll(newScrollValue);
        if (newScrollValue != 0 && !isRefreshing()) {
            float scale = Math.abs(newScrollValue) / itemDimension;
            switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[this.mCurrentMode.ordinal()]) {
                case 3:
                    this.mFooterLayout.onPull(scale);
                    break;
                default:
                    this.mHeaderLayout.onPull(scale);
                    break;
            }
            if (this.mState != State.PULL_TO_REFRESH && itemDimension >= Math.abs(newScrollValue)) {
                setState(State.PULL_TO_REFRESH, new boolean[0]);
            } else if (this.mState == State.PULL_TO_REFRESH && itemDimension < Math.abs(newScrollValue)) {
                setState(State.RELEASE_TO_REFRESH, new boolean[0]);
            }
        }
    }

    private LinearLayout.LayoutParams getLoadingLayoutLayoutParams() {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                return new LinearLayout.LayoutParams(-2, -1);
            default:
                return new LinearLayout.LayoutParams(-1, -2);
        }
    }

    private int getMaximumPullScroll() {
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                return Math.round(getWidth() / FRICTION);
            default:
                return Math.round(getHeight() / FRICTION);
        }
    }

    private final void smoothScrollTo(int scrollValue, long duration) {
        smoothScrollTo(scrollValue, duration, 0L, null);
    }

    public final void smoothScrollTo(int newScrollValue, long duration, long delayMillis, OnSmoothScrollFinishedListener listener) {
        int oldScrollValue;
        if (this.mCurrentSmoothScrollRunnable != null) {
            this.mCurrentSmoothScrollRunnable.stop();
        }
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Orientation()[getPullToRefreshScrollDirection().ordinal()]) {
            case 2:
                oldScrollValue = getScrollX();
                break;
            default:
                oldScrollValue = getScrollY();
                break;
        }
        if (oldScrollValue != newScrollValue) {
            if (this.mScrollAnimationInterpolator == null) {
                this.mScrollAnimationInterpolator = new DecelerateInterpolator();
            }
            this.mCurrentSmoothScrollRunnable = new SmoothScrollRunnable(oldScrollValue, newScrollValue, duration, listener);
            if (delayMillis > 0) {
                postDelayed(this.mCurrentSmoothScrollRunnable, delayMillis);
            } else {
                post(this.mCurrentSmoothScrollRunnable);
            }
        }
    }

    private final void smoothScrollToAndBack(int y) {
        smoothScrollTo(y, 200L, 0L, new OnSmoothScrollFinishedListener() { // from class: com.handmark.pulltorefresh.library.PullToRefreshBase.3
            @Override // com.handmark.pulltorefresh.library.PullToRefreshBase.OnSmoothScrollFinishedListener
            public void onSmoothScrollFinished() {
                PullToRefreshBase.this.smoothScrollTo(0, 200L, 225L, null);
            }
        });
    }

    /* loaded from: classes.dex */
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

        static AnimationStyle mapIntToValue(int modeInt) {
            switch (modeInt) {
                case 1:
                    return FLIP;
                default:
                    return ROTATE;
            }
        }

        LoadingLayout createLoadingLayout(Context context, Mode mode, Orientation scrollDirection, TypedArray attrs) {
            switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$AnimationStyle()[ordinal()]) {
                case 2:
                    return new FlipLoadingLayout(context, mode, scrollDirection, attrs);
                default:
                    return new RotateLoadingLayout(context, mode, scrollDirection, attrs);
            }
        }
    }

    /* loaded from: classes.dex */
    public enum Mode {
        DISABLED(0),
        PULL_FROM_START(1),
        PULL_FROM_END(2),
        BOTH(3),
        MANUAL_REFRESH_ONLY(4);
        
        private int mIntValue;
        public static Mode PULL_DOWN_TO_REFRESH = PULL_FROM_START;
        public static Mode PULL_UP_TO_REFRESH = PULL_FROM_END;

        static Mode mapIntToValue(int modeInt) {
            Mode[] values;
            for (Mode value : values()) {
                if (modeInt == value.getIntValue()) {
                    return value;
                }
            }
            return getDefault();
        }

        static Mode getDefault() {
            return PULL_FROM_START;
        }

        Mode(int modeInt) {
            this.mIntValue = modeInt;
        }

        boolean permitsPullToRefresh() {
            return (this == DISABLED || this == MANUAL_REFRESH_ONLY) ? false : true;
        }

        public boolean showHeaderLoadingLayout() {
            return this == PULL_FROM_START || this == BOTH;
        }

        public boolean showFooterLoadingLayout() {
            return this == PULL_FROM_END || this == BOTH || this == MANUAL_REFRESH_ONLY;
        }

        int getIntValue() {
            return this.mIntValue;
        }
    }

    /* loaded from: classes.dex */
    public enum State {
        RESET(0),
        PULL_TO_REFRESH(1),
        RELEASE_TO_REFRESH(2),
        REFRESHING(8),
        MANUAL_REFRESHING(9),
        OVERSCROLLING(16);
        
        private int mIntValue;

        static State mapIntToValue(int stateInt) {
            State[] values;
            for (State value : values()) {
                if (stateInt == value.getIntValue()) {
                    return value;
                }
            }
            return RESET;
        }

        State(int intValue) {
            this.mIntValue = intValue;
        }

        int getIntValue() {
            return this.mIntValue;
        }
    }

    /* loaded from: classes.dex */
    final class SmoothScrollRunnable implements Runnable {
        private final long mDuration;
        private final Interpolator mInterpolator;
        private OnSmoothScrollFinishedListener mListener;
        private final int mScrollFromY;
        private final int mScrollToY;
        private boolean mContinueRunning = true;
        private long mStartTime = -1;
        private int mCurrentY = -1;

        public SmoothScrollRunnable(int fromY, int toY, long duration, OnSmoothScrollFinishedListener listener) {
            PullToRefreshBase.this = r3;
            this.mScrollFromY = fromY;
            this.mScrollToY = toY;
            this.mInterpolator = r3.mScrollAnimationInterpolator;
            this.mDuration = duration;
            this.mListener = listener;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.mStartTime == -1) {
                this.mStartTime = System.currentTimeMillis();
            } else {
                long normalizedTime = ((System.currentTimeMillis() - this.mStartTime) * 1000) / this.mDuration;
                int deltaY = Math.round((this.mScrollFromY - this.mScrollToY) * this.mInterpolator.getInterpolation(((float) Math.max(Math.min(normalizedTime, 1000L), 0L)) / 1000.0f));
                this.mCurrentY = this.mScrollFromY - deltaY;
                PullToRefreshBase.this.setHeaderScroll(this.mCurrentY);
            }
            if (this.mContinueRunning && this.mScrollToY != this.mCurrentY) {
                ViewCompat.postOnAnimation(PullToRefreshBase.this, this);
            } else if (this.mListener != null) {
                this.mListener.onSmoothScrollFinished();
            }
        }

        public void stop() {
            this.mContinueRunning = false;
            PullToRefreshBase.this.removeCallbacks(this);
        }
    }
}
