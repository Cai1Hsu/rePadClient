package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ExpandableListView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshExpandableListView.class */
public class PullToRefreshExpandableListView extends PullToRefreshAdapterViewBase<ExpandableListView> {

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshExpandableListView$InternalExpandableListView.class */
    class InternalExpandableListView extends ExpandableListView implements EmptyViewMethodAccessor {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalExpandableListView(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshExpandableListView.this = r5;
        }

        @Override // android.widget.AdapterView, com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyView(View view) {
            PullToRefreshExpandableListView.this.setEmptyView(view);
        }

        @Override // com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyViewInternal(View view) {
            super.setEmptyView(view);
        }
    }

    @TargetApi(9)
    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshExpandableListView$InternalExpandableListViewSDK9.class */
    final class InternalExpandableListViewSDK9 extends InternalExpandableListView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalExpandableListViewSDK9(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshExpandableListView.this = r6;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z) {
            boolean overScrollBy = super.overScrollBy(i, i2, i3, i4, i5, i6, i7, i8, z);
            OverscrollHelper.overScrollBy(PullToRefreshExpandableListView.this, i, i3, i2, i4, z);
            return overScrollBy;
        }
    }

    public PullToRefreshExpandableListView(Context context) {
        super(context);
    }

    public PullToRefreshExpandableListView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public PullToRefreshExpandableListView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshExpandableListView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle animationStyle) {
        super(context, mode, animationStyle);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public ExpandableListView createRefreshableView(Context context, AttributeSet attributeSet) {
        InternalExpandableListViewSDK9 internalExpandableListViewSDK9 = Build.VERSION.SDK_INT >= 9 ? new InternalExpandableListViewSDK9(context, attributeSet) : new InternalExpandableListView(context, attributeSet);
        internalExpandableListViewSDK9.setId(16908298);
        return internalExpandableListViewSDK9;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }
}
