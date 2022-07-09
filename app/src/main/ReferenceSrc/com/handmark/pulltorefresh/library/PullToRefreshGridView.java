package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.GridView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshGridView.class */
public class PullToRefreshGridView extends PullToRefreshAdapterViewBase<GridView> {

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshGridView$InternalGridView.class */
    class InternalGridView extends GridView implements EmptyViewMethodAccessor {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalGridView(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshGridView.this = r5;
        }

        @Override // android.widget.AdapterView, com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyView(View view) {
            PullToRefreshGridView.this.setEmptyView(view);
        }

        @Override // com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyViewInternal(View view) {
            super.setEmptyView(view);
        }
    }

    @TargetApi(9)
    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshGridView$InternalGridViewSDK9.class */
    final class InternalGridViewSDK9 extends InternalGridView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalGridViewSDK9(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshGridView.this = r6;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z) {
            boolean overScrollBy = super.overScrollBy(i, i2, i3, i4, i5, i6, i7, i8, z);
            OverscrollHelper.overScrollBy(PullToRefreshGridView.this, i, i3, i2, i4, z);
            return overScrollBy;
        }
    }

    public PullToRefreshGridView(Context context) {
        super(context);
    }

    public PullToRefreshGridView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public PullToRefreshGridView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshGridView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle animationStyle) {
        super(context, mode, animationStyle);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final GridView createRefreshableView(Context context, AttributeSet attributeSet) {
        InternalGridViewSDK9 internalGridViewSDK9 = Build.VERSION.SDK_INT >= 9 ? new InternalGridViewSDK9(context, attributeSet) : new InternalGridView(context, attributeSet);
        internalGridViewSDK9.setId(R.id.gridview);
        return internalGridViewSDK9;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }
}
