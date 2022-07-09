package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.HorizontalScrollView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshHorizontalScrollView.class */
public class PullToRefreshHorizontalScrollView extends PullToRefreshBase<HorizontalScrollView> {

    @TargetApi(9)
    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshHorizontalScrollView$InternalHorizontalScrollViewSDK9.class */
    final class InternalHorizontalScrollViewSDK9 extends HorizontalScrollView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalHorizontalScrollViewSDK9(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshHorizontalScrollView.this = r5;
        }

        private int getScrollRange() {
            int i = 0;
            if (getChildCount() > 0) {
                i = Math.max(0, getChildAt(0).getWidth() - ((getWidth() - getPaddingLeft()) - getPaddingRight()));
            }
            return i;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z) {
            boolean overScrollBy = super.overScrollBy(i, i2, i3, i4, i5, i6, i7, i8, z);
            OverscrollHelper.overScrollBy(PullToRefreshHorizontalScrollView.this, i, i3, i2, i4, getScrollRange(), z);
            return overScrollBy;
        }
    }

    public PullToRefreshHorizontalScrollView(Context context) {
        super(context);
    }

    public PullToRefreshHorizontalScrollView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public PullToRefreshHorizontalScrollView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshHorizontalScrollView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle animationStyle) {
        super(context, mode, animationStyle);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public HorizontalScrollView createRefreshableView(Context context, AttributeSet attributeSet) {
        InternalHorizontalScrollViewSDK9 internalHorizontalScrollViewSDK9 = Build.VERSION.SDK_INT >= 9 ? new InternalHorizontalScrollViewSDK9(context, attributeSet) : new HorizontalScrollView(context, attributeSet);
        internalHorizontalScrollViewSDK9.setId(R.id.scrollview);
        return internalHorizontalScrollViewSDK9;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.HORIZONTAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullEnd() {
        View childAt = ((HorizontalScrollView) this.mRefreshableView).getChildAt(0);
        return childAt != null ? ((HorizontalScrollView) this.mRefreshableView).getScrollX() >= childAt.getWidth() - getWidth() : false;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullStart() {
        return ((HorizontalScrollView) this.mRefreshableView).getScrollX() == 0;
    }
}
