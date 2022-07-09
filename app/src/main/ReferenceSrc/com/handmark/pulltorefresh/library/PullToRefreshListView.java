package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.os.Build;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor;
import com.handmark.pulltorefresh.library.internal.LoadingLayout;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshListView.class */
public class PullToRefreshListView extends PullToRefreshAdapterViewBase<ListView> {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode;
    private LoadingLayout mFooterLoadingView;
    private LoadingLayout mHeaderLoadingView;
    private boolean mListViewExtrasEnabled;
    private FrameLayout mLvFooterLoadingFrame;

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshListView$InternalListView.class */
    protected class InternalListView extends ListView implements EmptyViewMethodAccessor {
        private boolean mAddedLvFooter = false;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalListView(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshListView.this = r5;
        }

        @Override // android.widget.ListView, android.widget.AbsListView, android.view.ViewGroup, android.view.View
        protected void dispatchDraw(Canvas canvas) {
            try {
                super.dispatchDraw(canvas);
            } catch (IndexOutOfBoundsException e) {
                e.printStackTrace();
            }
        }

        @Override // android.view.ViewGroup, android.view.View
        public boolean dispatchTouchEvent(MotionEvent motionEvent) {
            boolean z;
            try {
                z = super.dispatchTouchEvent(motionEvent);
            } catch (IndexOutOfBoundsException e) {
                e.printStackTrace();
                z = false;
            }
            return z;
        }

        @Override // android.widget.ListView, android.widget.AbsListView
        public void setAdapter(ListAdapter listAdapter) {
            if (PullToRefreshListView.this.mLvFooterLoadingFrame != null && !this.mAddedLvFooter) {
                addFooterView(PullToRefreshListView.this.mLvFooterLoadingFrame, null, false);
                this.mAddedLvFooter = true;
            }
            super.setAdapter(listAdapter);
        }

        @Override // android.widget.AdapterView, com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyView(View view) {
            PullToRefreshListView.this.setEmptyView(view);
        }

        @Override // com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyViewInternal(View view) {
            super.setEmptyView(view);
        }
    }

    @TargetApi(9)
    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshListView$InternalListViewSDK9.class */
    final class InternalListViewSDK9 extends InternalListView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalListViewSDK9(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshListView.this = r6;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z) {
            boolean overScrollBy = super.overScrollBy(i, i2, i3, i4, i5, i6, i7, i8, z);
            OverscrollHelper.overScrollBy(PullToRefreshListView.this, i, i3, i2, i4, z);
            return overScrollBy;
        }
    }

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

    public PullToRefreshListView(Context context) {
        super(context);
    }

    public PullToRefreshListView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public PullToRefreshListView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshListView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle animationStyle) {
        super(context, mode, animationStyle);
    }

    protected ListView createListView(Context context, AttributeSet attributeSet) {
        return Build.VERSION.SDK_INT >= 9 ? new InternalListViewSDK9(context, attributeSet) : new InternalListView(context, attributeSet);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected LoadingLayoutProxy createLoadingLayoutProxy(boolean z, boolean z2) {
        LoadingLayoutProxy createLoadingLayoutProxy = super.createLoadingLayoutProxy(z, z2);
        if (this.mListViewExtrasEnabled) {
            PullToRefreshBase.Mode mode = getMode();
            if (z && mode.showHeaderLoadingLayout()) {
                createLoadingLayoutProxy.addLayout(this.mHeaderLoadingView);
            }
            if (z2 && mode.showFooterLoadingLayout()) {
                createLoadingLayoutProxy.addLayout(this.mFooterLoadingView);
            }
        }
        return createLoadingLayoutProxy;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public ListView createRefreshableView(Context context, AttributeSet attributeSet) {
        ListView createListView = createListView(context, attributeSet);
        createListView.setId(16908298);
        return createListView;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshAdapterViewBase, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected void handleStyledAttributes(TypedArray typedArray) {
        super.handleStyledAttributes(typedArray);
        this.mListViewExtrasEnabled = typedArray.getBoolean(R.styleable.PullToRefresh_ptrListViewExtrasEnabled, true);
        if (this.mListViewExtrasEnabled) {
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2, 1);
            FrameLayout frameLayout = new FrameLayout(getContext());
            this.mHeaderLoadingView = createLoadingLayout(getContext(), PullToRefreshBase.Mode.PULL_FROM_START, typedArray);
            this.mHeaderLoadingView.setVisibility(8);
            frameLayout.addView(this.mHeaderLoadingView, layoutParams);
            ((ListView) this.mRefreshableView).addHeaderView(frameLayout, null, false);
            this.mLvFooterLoadingFrame = new FrameLayout(getContext());
            this.mFooterLoadingView = createLoadingLayout(getContext(), PullToRefreshBase.Mode.PULL_FROM_END, typedArray);
            this.mFooterLoadingView.setVisibility(8);
            this.mLvFooterLoadingFrame.addView(this.mFooterLoadingView, layoutParams);
            if (typedArray.hasValue(R.styleable.PullToRefresh_ptrScrollingWhileRefreshingEnabled)) {
                return;
            }
            setScrollingWhileRefreshingEnabled(true);
        }
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshAdapterViewBase, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected void onRefreshing(boolean z) {
        LoadingLayout footerLayout;
        LoadingLayout loadingLayout;
        LoadingLayout loadingLayout2;
        int count;
        int scrollY;
        ListAdapter adapter = ((ListView) this.mRefreshableView).getAdapter();
        if (!this.mListViewExtrasEnabled || !getShowViewWhileRefreshing() || adapter == null || adapter.isEmpty()) {
            super.onRefreshing(z);
            return;
        }
        super.onRefreshing(false);
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[getCurrentMode().ordinal()]) {
            case 3:
            case 5:
                footerLayout = getFooterLayout();
                loadingLayout = this.mFooterLoadingView;
                loadingLayout2 = this.mHeaderLoadingView;
                count = ((ListView) this.mRefreshableView).getCount() - 1;
                scrollY = getScrollY() - getFooterSize();
                break;
            case 4:
            default:
                footerLayout = getHeaderLayout();
                loadingLayout = this.mHeaderLoadingView;
                loadingLayout2 = this.mFooterLoadingView;
                count = 0;
                scrollY = getScrollY() + getHeaderSize();
                break;
        }
        footerLayout.reset();
        footerLayout.hideAllViews();
        loadingLayout2.setVisibility(8);
        loadingLayout.setVisibility(0);
        loadingLayout.refreshing();
        if (!z) {
            return;
        }
        disableLoadingLayoutVisibilityChanges();
        setHeaderScroll(scrollY);
        ((ListView) this.mRefreshableView).setSelection(count);
        smoothScrollTo(0);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshAdapterViewBase, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected void onReset() {
        LoadingLayout footerLayout;
        LoadingLayout loadingLayout;
        int count;
        int footerSize;
        boolean z = true;
        if (!this.mListViewExtrasEnabled) {
            super.onReset();
            return;
        }
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[getCurrentMode().ordinal()]) {
            case 3:
            case 5:
                footerLayout = getFooterLayout();
                loadingLayout = this.mFooterLoadingView;
                count = ((ListView) this.mRefreshableView).getCount() - 1;
                footerSize = getFooterSize();
                if (Math.abs(((ListView) this.mRefreshableView).getLastVisiblePosition() - count) > 1) {
                    z = false;
                    break;
                } else {
                    z = true;
                    break;
                }
            case 4:
            default:
                footerLayout = getHeaderLayout();
                loadingLayout = this.mHeaderLoadingView;
                footerSize = -getHeaderSize();
                count = 0;
                if (Math.abs(((ListView) this.mRefreshableView).getFirstVisiblePosition() - 0) > 1) {
                    z = false;
                    break;
                }
                break;
        }
        if (loadingLayout.getVisibility() == 0) {
            footerLayout.showInvisibleViews();
            loadingLayout.setVisibility(8);
            if (z && getState() != PullToRefreshBase.State.MANUAL_REFRESHING) {
                ((ListView) this.mRefreshableView).setSelection(count);
                setHeaderScroll(footerSize);
            }
        }
        super.onReset();
    }
}
