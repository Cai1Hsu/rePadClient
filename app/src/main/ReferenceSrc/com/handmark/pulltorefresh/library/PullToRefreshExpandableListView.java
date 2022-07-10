package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ExpandableListView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PullToRefreshExpandableListView extends PullToRefreshAdapterViewBase<ExpandableListView> {
    public PullToRefreshExpandableListView(Context context) {
        super(context);
    }

    public PullToRefreshExpandableListView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PullToRefreshExpandableListView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    public PullToRefreshExpandableListView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle style) {
        super(context, mode, style);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public ExpandableListView createRefreshableView(Context context, AttributeSet attrs) {
        ExpandableListView lv;
        if (Build.VERSION.SDK_INT >= 9) {
            lv = new InternalExpandableListViewSDK9(context, attrs);
        } else {
            lv = new InternalExpandableListView(context, attrs);
        }
        lv.setId(16908298);
        return lv;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class InternalExpandableListView extends ExpandableListView implements EmptyViewMethodAccessor {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalExpandableListView(Context context, AttributeSet attrs) {
            super(context, attrs);
            PullToRefreshExpandableListView.this = r1;
        }

        @Override // android.widget.AdapterView, com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyView(View emptyView) {
            PullToRefreshExpandableListView.this.setEmptyView(emptyView);
        }

        @Override // com.handmark.pulltorefresh.library.internal.EmptyViewMethodAccessor
        public void setEmptyViewInternal(View emptyView) {
            super.setEmptyView(emptyView);
        }
    }

    @TargetApi(9)
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    final class InternalExpandableListViewSDK9 extends InternalExpandableListView {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalExpandableListViewSDK9(Context context, AttributeSet attrs) {
            super(context, attrs);
            PullToRefreshExpandableListView.this = r1;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int deltaX, int deltaY, int scrollX, int scrollY, int scrollRangeX, int scrollRangeY, int maxOverScrollX, int maxOverScrollY, boolean isTouchEvent) {
            boolean returnValue = super.overScrollBy(deltaX, deltaY, scrollX, scrollY, scrollRangeX, scrollRangeY, maxOverScrollX, maxOverScrollY, isTouchEvent);
            OverscrollHelper.overScrollBy(PullToRefreshExpandableListView.this, deltaX, scrollX, deltaY, scrollY, isTouchEvent);
            return returnValue;
        }
    }
}
