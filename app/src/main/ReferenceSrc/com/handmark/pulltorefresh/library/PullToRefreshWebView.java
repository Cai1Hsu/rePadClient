package com.handmark.pulltorefresh.library;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.FloatMath;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshWebView.class */
public class PullToRefreshWebView extends PullToRefreshBase<WebView> {
    private static final PullToRefreshBase.OnRefreshListener<WebView> defaultOnRefreshListener = new PullToRefreshBase.OnRefreshListener<WebView>() { // from class: com.handmark.pulltorefresh.library.PullToRefreshWebView.1
        @Override // com.handmark.pulltorefresh.library.PullToRefreshBase.OnRefreshListener
        public void onRefresh(PullToRefreshBase<WebView> pullToRefreshBase) {
            pullToRefreshBase.getRefreshableView().reload();
        }
    };
    private final WebChromeClient defaultWebChromeClient = new WebChromeClient() { // from class: com.handmark.pulltorefresh.library.PullToRefreshWebView.2
        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView webView, int i) {
            if (i == 100) {
                PullToRefreshWebView.this.onRefreshComplete();
            }
        }
    };

    @TargetApi(9)
    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/PullToRefreshWebView$InternalWebViewSDK9.class */
    final class InternalWebViewSDK9 extends WebView {
        static final int OVERSCROLL_FUZZY_THRESHOLD = 2;
        static final float OVERSCROLL_SCALE_FACTOR = 1.5f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalWebViewSDK9(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            PullToRefreshWebView.this = r5;
        }

        private int getScrollRange() {
            return (int) Math.max(0.0f, FloatMath.floor(((WebView) PullToRefreshWebView.this.mRefreshableView).getScale() * ((WebView) PullToRefreshWebView.this.mRefreshableView).getContentHeight()) - ((getHeight() - getPaddingBottom()) - getPaddingTop()));
        }

        @Override // android.view.View
        protected boolean overScrollBy(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, boolean z) {
            boolean overScrollBy = super.overScrollBy(i, i2, i3, i4, i5, i6, i7, i8, z);
            OverscrollHelper.overScrollBy(PullToRefreshWebView.this, i, i3, i2, i4, getScrollRange(), 2, OVERSCROLL_SCALE_FACTOR, z);
            return overScrollBy;
        }
    }

    public PullToRefreshWebView(Context context) {
        super(context);
        setOnRefreshListener(defaultOnRefreshListener);
        ((WebView) this.mRefreshableView).setWebChromeClient(this.defaultWebChromeClient);
    }

    public PullToRefreshWebView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setOnRefreshListener(defaultOnRefreshListener);
        ((WebView) this.mRefreshableView).setWebChromeClient(this.defaultWebChromeClient);
    }

    public PullToRefreshWebView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
        setOnRefreshListener(defaultOnRefreshListener);
        ((WebView) this.mRefreshableView).setWebChromeClient(this.defaultWebChromeClient);
    }

    public PullToRefreshWebView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle animationStyle) {
        super(context, mode, animationStyle);
        setOnRefreshListener(defaultOnRefreshListener);
        ((WebView) this.mRefreshableView).setWebChromeClient(this.defaultWebChromeClient);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public WebView createRefreshableView(Context context, AttributeSet attributeSet) {
        InternalWebViewSDK9 internalWebViewSDK9 = Build.VERSION.SDK_INT >= 9 ? new InternalWebViewSDK9(context, attributeSet) : new WebView(context, attributeSet);
        internalWebViewSDK9.setId(R.id.webview);
        return internalWebViewSDK9;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullEnd() {
        return ((float) ((WebView) this.mRefreshableView).getScrollY()) >= FloatMath.floor(((WebView) this.mRefreshableView).getScale() * ((float) ((WebView) this.mRefreshableView).getContentHeight())) - ((float) ((WebView) this.mRefreshableView).getHeight());
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullStart() {
        return ((WebView) this.mRefreshableView).getScrollY() == 0;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected void onPtrRestoreInstanceState(Bundle bundle) {
        super.onPtrRestoreInstanceState(bundle);
        ((WebView) this.mRefreshableView).restoreState(bundle);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected void onPtrSaveInstanceState(Bundle bundle) {
        super.onPtrSaveInstanceState(bundle);
        ((WebView) this.mRefreshableView).saveState(bundle);
    }
}
