package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ScrollView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PullToRefreshScrollView extends PullToRefreshBase<ScrollView> {
    public PullToRefreshScrollView(Context context) {
        super(context);
    }

    public PullToRefreshScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PullToRefreshScrollView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshScrollView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle style) {
        super(context, mode, style);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public ScrollView createRefreshableView(Context context, AttributeSet attrs) {
        ScrollView scrollView;
        if (Build.VERSION.SDK_INT >= 9) {
            scrollView = new InternalScrollViewSDK9(context, attrs);
        } else {
            scrollView = new ScrollView(context, attrs);
        }
        scrollView.setId(R.id.scrollview);
        return scrollView;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullStart() {
        return ((ScrollView) this.mRefreshableView).getScrollY() == 0;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullEnd() {
        View scrollViewChild = ((ScrollView) this.mRefreshableView).getChildAt(0);
        return scrollViewChild != null && ((ScrollView) this.mRefreshableView).getScrollY() >= scrollViewChild.getHeight() - getHeight();
    }

    @TargetApi(9)
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    final class InternalScrollViewSDK9 extends ScrollView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalScrollViewSDK9(Context context, AttributeSet attrs) {
            super(context, attrs);
            PullToRefreshScrollView.this = r1;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int deltaX, int deltaY, int scrollX, int scrollY, int scrollRangeX, int scrollRangeY, int maxOverScrollX, int maxOverScrollY, boolean isTouchEvent) {
            boolean returnValue = super.overScrollBy(deltaX, deltaY, scrollX, scrollY, scrollRangeX, scrollRangeY, maxOverScrollX, maxOverScrollY, isTouchEvent);
            OverscrollHelper.overScrollBy(PullToRefreshScrollView.this, deltaX, scrollX, deltaY, scrollY, getScrollRange(), isTouchEvent);
            return returnValue;
        }

        private int getScrollRange() {
            if (getChildCount() <= 0) {
                return 0;
            }
            View child = getChildAt(0);
            int scrollRange = Math.max(0, child.getHeight() - ((getHeight() - getPaddingBottom()) - getPaddingTop()));
            return scrollRange;
        }
    }
}
