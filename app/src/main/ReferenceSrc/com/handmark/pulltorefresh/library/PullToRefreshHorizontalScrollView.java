package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.HorizontalScrollView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;

/* loaded from: classes.dex */
public class PullToRefreshHorizontalScrollView extends PullToRefreshBase<HorizontalScrollView> {
    public PullToRefreshHorizontalScrollView(Context context) {
        super(context);
    }

    public PullToRefreshHorizontalScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PullToRefreshHorizontalScrollView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshHorizontalScrollView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle style) {
        super(context, mode, style);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.HORIZONTAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public HorizontalScrollView createRefreshableView(Context context, AttributeSet attrs) {
        HorizontalScrollView scrollView;
        if (Build.VERSION.SDK_INT >= 9) {
            scrollView = new InternalHorizontalScrollViewSDK9(context, attrs);
        } else {
            scrollView = new HorizontalScrollView(context, attrs);
        }
        scrollView.setId(R.id.scrollview);
        return scrollView;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullStart() {
        return ((HorizontalScrollView) this.mRefreshableView).getScrollX() == 0;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullEnd() {
        View scrollViewChild = ((HorizontalScrollView) this.mRefreshableView).getChildAt(0);
        return scrollViewChild != null && ((HorizontalScrollView) this.mRefreshableView).getScrollX() >= scrollViewChild.getWidth() - getWidth();
    }

    @TargetApi(9)
    /* loaded from: classes.dex */
    final class InternalHorizontalScrollViewSDK9 extends HorizontalScrollView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalHorizontalScrollViewSDK9(Context context, AttributeSet attrs) {
            super(context, attrs);
            PullToRefreshHorizontalScrollView.this = r1;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int deltaX, int deltaY, int scrollX, int scrollY, int scrollRangeX, int scrollRangeY, int maxOverScrollX, int maxOverScrollY, boolean isTouchEvent) {
            boolean returnValue = super.overScrollBy(deltaX, deltaY, scrollX, scrollY, scrollRangeX, scrollRangeY, maxOverScrollX, maxOverScrollY, isTouchEvent);
            OverscrollHelper.overScrollBy(PullToRefreshHorizontalScrollView.this, deltaX, scrollX, deltaY, scrollY, getScrollRange(), isTouchEvent);
            return returnValue;
        }

        private int getScrollRange() {
            if (getChildCount() <= 0) {
                return 0;
            }
            View child = getChildAt(0);
            int scrollRange = Math.max(0, child.getWidth() - ((getWidth() - getPaddingLeft()) - getPaddingRight()));
            return scrollRange;
        }
    }
}
