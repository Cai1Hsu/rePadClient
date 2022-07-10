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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PullToRefreshListView extends PullToRefreshAdapterViewBase<ListView> {
    private static /* synthetic */ int[] $SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode;
    private LoadingLayout mFooterLoadingView;
    private LoadingLayout mHeaderLoadingView;
    private boolean mListViewExtrasEnabled;
    private FrameLayout mLvFooterLoadingFrame;

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

    static /* synthetic */ FrameLayout access$1(PullToRefreshListView pullToRefreshListView) {
        return pullToRefreshListView.mLvFooterLoadingFrame;
    }

    public PullToRefreshListView(Context context) {
        super(context);
    }

    public PullToRefreshListView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PullToRefreshListView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshListView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle style) {
        super(context, mode, style);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshAdapterViewBase, com.handmark.pulltorefresh.library.PullToRefreshBase
    public void onRefreshing(boolean doScroll) {
        LoadingLayout origLoadingView;
        LoadingLayout listViewLoadingView;
        LoadingLayout oppositeListViewLoadingView;
        int selection;
        int scrollToY;
        ListAdapter adapter = ((ListView) this.mRefreshableView).getAdapter();
        if (!this.mListViewExtrasEnabled || !getShowViewWhileRefreshing() || adapter == null || adapter.isEmpty()) {
            super.onRefreshing(doScroll);
            return;
        }
        super.onRefreshing(false);
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[getCurrentMode().ordinal()]) {
            case 3:
            case 5:
                origLoadingView = getFooterLayout();
                listViewLoadingView = this.mFooterLoadingView;
                oppositeListViewLoadingView = this.mHeaderLoadingView;
                selection = ((ListView) this.mRefreshableView).getCount() - 1;
                scrollToY = getScrollY() - getFooterSize();
                break;
            case 4:
            default:
                origLoadingView = getHeaderLayout();
                listViewLoadingView = this.mHeaderLoadingView;
                oppositeListViewLoadingView = this.mFooterLoadingView;
                selection = 0;
                scrollToY = getScrollY() + getHeaderSize();
                break;
        }
        origLoadingView.reset();
        origLoadingView.hideAllViews();
        oppositeListViewLoadingView.setVisibility(8);
        listViewLoadingView.setVisibility(0);
        listViewLoadingView.refreshing();
        if (doScroll) {
            disableLoadingLayoutVisibilityChanges();
            setHeaderScroll(scrollToY);
            ((ListView) this.mRefreshableView).setSelection(selection);
            smoothScrollTo(0);
        }
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshAdapterViewBase, com.handmark.pulltorefresh.library.PullToRefreshBase
    public void onReset() {
        LoadingLayout originalLoadingLayout;
        LoadingLayout listViewLoadingLayout;
        int selection;
        int scrollToHeight;
        boolean scrollLvToEdge = true;
        if (!this.mListViewExtrasEnabled) {
            super.onReset();
            return;
        }
        switch ($SWITCH_TABLE$com$handmark$pulltorefresh$library$PullToRefreshBase$Mode()[getCurrentMode().ordinal()]) {
            case 3:
            case 5:
                originalLoadingLayout = getFooterLayout();
                listViewLoadingLayout = this.mFooterLoadingView;
                selection = ((ListView) this.mRefreshableView).getCount() - 1;
                scrollToHeight = getFooterSize();
                if (Math.abs(((ListView) this.mRefreshableView).getLastVisiblePosition() - selection) > 1) {
                    scrollLvToEdge = false;
                    break;
                }
                break;
            case 4:
            default:
                originalLoadingLayout = getHeaderLayout();
                listViewLoadingLayout = this.mHeaderLoadingView;
                scrollToHeight = -getHeaderSize();
                selection = 0;
                if (Math.abs(((ListView) this.mRefreshableView).getFirstVisiblePosition() - 0) > 1) {
                    scrollLvToEdge = false;
                    break;
                }
                break;
        }
        if (listViewLoadingLayout.getVisibility() == 0) {
            originalLoadingLayout.showInvisibleViews();
            listViewLoadingLayout.setVisibility(8);
            if (scrollLvToEdge && getState() != PullToRefreshBase.State.MANUAL_REFRESHING) {
                ((ListView) this.mRefreshableView).setSelection(selection);
                setHeaderScroll(scrollToHeight);
            }
        }
        super.onReset();
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public LoadingLayoutProxy createLoadingLayoutProxy(boolean includeStart, boolean includeEnd) {
        LoadingLayoutProxy proxy = super.createLoadingLayoutProxy(includeStart, includeEnd);
        if (this.mListViewExtrasEnabled) {
            PullToRefreshBase.Mode mode = getMode();
            if (includeStart && mode.showHeaderLoadingLayout()) {
                proxy.addLayout(this.mHeaderLoadingView);
            }
            if (includeEnd && mode.showFooterLoadingLayout()) {
                proxy.addLayout(this.mFooterLoadingView);
            }
        }
        return proxy;
    }

    protected ListView createListView(Context context, AttributeSet attrs) {
        if (Build.VERSION.SDK_INT >= 9) {
            ListView lv = new InternalListViewSDK9(context, attrs);
            return lv;
        }
        ListView lv2 = new InternalListView(context, attrs);
        return lv2;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public ListView createRefreshableView(Context context, AttributeSet attrs) {
        ListView lv = createListView(context, attrs);
        lv.setId(16908298);
        return lv;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshAdapterViewBase, com.handmark.pulltorefresh.library.PullToRefreshBase
    public void handleStyledAttributes(TypedArray a) {
        super.handleStyledAttributes(a);
        this.mListViewExtrasEnabled = a.getBoolean(R.styleable.PullToRefresh_ptrListViewExtrasEnabled, true);
        if (this.mListViewExtrasEnabled) {
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-1, -2, 1);
            FrameLayout frame = new FrameLayout(getContext());
            this.mHeaderLoadingView = createLoadingLayout(getContext(), PullToRefreshBase.Mode.PULL_FROM_START, a);
            this.mHeaderLoadingView.setVisibility(8);
            frame.addView(this.mHeaderLoadingView, lp);
            ((ListView) this.mRefreshableView).addHeaderView(frame, null, false);
            this.mLvFooterLoadingFrame = new FrameLayout(getContext());
            this.mFooterLoadingView = createLoadingLayout(getContext(), PullToRefreshBase.Mode.PULL_FROM_END, a);
            this.mFooterLoadingView.setVisibility(8);
            this.mLvFooterLoadingFrame.addView(this.mFooterLoadingView, lp);
            if (!a.hasValue(R.styleable.PullToRefresh_ptrScrollingWhileRefreshingEnabled)) {
                setScrollingWhileRefreshingEnabled(true);
            }
        }
    }

    @TargetApi(9)
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    final class InternalListViewSDK9 extends InternalListView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalListViewSDK9(Context context, AttributeSet attrs) {
            super(context, attrs);
            PullToRefreshListView.this = r1;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int deltaX, int deltaY, int scrollX, int scrollY, int scrollRangeX, int scrollRangeY, int maxOverScrollX, int maxOverScrollY, boolean isTouchEvent) {
            boolean returnValue = super.overScrollBy(deltaX, deltaY, scrollX, scrollY, scrollRangeX, scrollRangeY, maxOverScrollX, maxOverScrollY, isTouchEvent);
            OverscrollHelper.overScrollBy(PullToRefreshListView.this, deltaX, scrollX, deltaY, scrollY, isTouchEvent);
            return returnValue;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    protected class InternalListView extends ListView implements EmptyViewMethodAccessor {
        private boolean mAddedLvFooter = false;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalListView(Context context, AttributeSet attrs) {
            super(context, attrs);
            PullToRefreshListView.this = r2;
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
        public boolean dispatchTouchEvent(MotionEvent ev) {
            try {
                return super.dispatchTouchEvent(ev);
            } catch (IndexOutOfBoundsException e) {
                e.printStackTrace();
                return false;
            }
        }

        @Override // android.widget.ListView, android.widget.AbsListView
        public void setAdapter(ListAdapter adapter) {
            if (PullToRefreshListView.access$1(PullToRefreshListView.this) != null && !this.mAddedLvFooter) {
                addFooterView(PullToRefreshListView.access$1(PullToRefreshListView.this), null, false);
                this.mAddedLvFooter = true;
            }
            super.setAdapter(adapter);
        }

        @Override // android.widget.AdapterView, com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyView(View emptyView) {
            PullToRefreshListView.this.setEmptyView(emptyView);
        }

        @Override // com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyViewInternal(View emptyView) {
            super.setEmptyView(emptyView);
        }
    }
}
