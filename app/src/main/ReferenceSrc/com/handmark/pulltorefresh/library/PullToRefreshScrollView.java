package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ScrollView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshScrollView.class */
public class PullToRefreshScrollView extends PullToRefreshBase<ScrollView> {

    @TargetApi(9)
    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshScrollView$InternalScrollViewSDK9.class */
    final class InternalScrollViewSDK9 extends ScrollView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalScrollViewSDK9(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshScrollView.this = r5;
        }

        private int getScrollRange() {
            int i = 0;
            if (getChildCount() > 0) {
                i = Math.max(0, getChildAt(0).getHeight() - ((getHeight() - getPaddingBottom()) - getPaddingTop()));
            }
            return i;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z) {
            boolean overScrollBy = super.overScrollBy(i, i2, i3, i4, i5, i6, i7, i8, z);
            OverscrollHelper.overScrollBy(PullToRefreshScrollView.this, i, i3, i2, i4, getScrollRange(), z);
            return overScrollBy;
        }
    }

    public PullToRefreshScrollView(Context context) {
        super(context);
    }

    public PullToRefreshScrollView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public PullToRefreshScrollView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshScrollView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle animationStyle) {
        super(context, mode, animationStyle);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public ScrollView createRefreshableView(Context context, AttributeSet attributeSet) {
        InternalScrollViewSDK9 internalScrollViewSDK9 = Build.VERSION.SDK_INT >= 9 ? new InternalScrollViewSDK9(context, attributeSet) : new ScrollView(context, attributeSet);
        internalScrollViewSDK9.setId(R.id.scrollview);
        return internalScrollViewSDK9;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullEnd() {
        View childAt = ((ScrollView) this.mRefreshableView).getChildAt(0);
        return childAt != null ? ((ScrollView) this.mRefreshableView).getScrollY() >= childAt.getHeight() - getHeight() : false;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullStart() {
        return ((ScrollView) this.mRefreshableView).getScrollY() == 0;
    }
}
