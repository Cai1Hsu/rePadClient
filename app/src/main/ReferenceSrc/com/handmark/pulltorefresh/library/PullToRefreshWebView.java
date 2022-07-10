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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PullToRefreshWebView extends PullToRefreshBase<WebView> {
    private static final PullToRefreshBase.OnRefreshListener<WebView> defaultOnRefreshListener = new AnonymousClass1();
    private final WebChromeClient defaultWebChromeClient = new AnonymousClass2();

    /* renamed from: com.handmark.pulltorefresh.library.PullToRefreshWebView$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements PullToRefreshBase.OnRefreshListener<WebView> {
        AnonymousClass1() {
        }

        @Override // com.handmark.pulltorefresh.library.PullToRefreshBase.OnRefreshListener
        public void onRefresh(PullToRefreshBase<WebView> refreshView) {
            refreshView.getRefreshableView().reload();
        }
    }

    /* renamed from: com.handmark.pulltorefresh.library.PullToRefreshWebView$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 extends WebChromeClient {
        AnonymousClass2() {
            PullToRefreshWebView.this = r1;
        }

        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView view, int newProgress) {
            if (newProgress == 100) {
                PullToRefreshWebView.this.onRefreshComplete();
            }
        }
    }

    public PullToRefreshWebView(Context context) {
        super(context);
        setOnRefreshListener(defaultOnRefreshListener);
        ((WebView) this.mRefreshableView).setWebChromeClient(this.defaultWebChromeClient);
    }

    public PullToRefreshWebView(Context context, AttributeSet attrs) {
        super(context, attrs);
        setOnRefreshListener(defaultOnRefreshListener);
        ((WebView) this.mRefreshableView).setWebChromeClient(this.defaultWebChromeClient);
    }

    public PullToRefreshWebView(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
        setOnRefreshListener(defaultOnRefreshListener);
        ((WebView) this.mRefreshableView).setWebChromeClient(this.defaultWebChromeClient);
    }

    public PullToRefreshWebView(Context context, PullToRefreshBase.Mode mode, PullToRefreshBase.AnimationStyle style) {
        super(context, mode, style);
        setOnRefreshListener(defaultOnRefreshListener);
        ((WebView) this.mRefreshableView).setWebChromeClient(this.defaultWebChromeClient);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public final PullToRefreshBase.Orientation getPullToRefreshScrollDirection() {
        return PullToRefreshBase.Orientation.VERTICAL;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public WebView createRefreshableView(Context context, AttributeSet attrs) {
        WebView webView;
        if (Build.VERSION.SDK_INT >= 9) {
            webView = new InternalWebViewSDK9(context, attrs);
        } else {
            webView = new WebView(context, attrs);
        }
        webView.setId(R.id.webview);
        return webView;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullStart() {
        return ((WebView) this.mRefreshableView).getScrollY() == 0;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullEnd() {
        float exactContentHeight = FloatMath.floor(((WebView) this.mRefreshableView).getScale() * ((WebView) this.mRefreshableView).getContentHeight());
        return ((float) ((WebView) this.mRefreshableView).getScrollY()) >= exactContentHeight - ((float) ((WebView) this.mRefreshableView).getHeight());
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public void onPtrRestoreInstanceState(Bundle savedInstanceState) {
        super.onPtrRestoreInstanceState(savedInstanceState);
        ((WebView) this.mRefreshableView).restoreState(savedInstanceState);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshBase
    public void onPtrSaveInstanceState(Bundle saveState) {
        super.onPtrSaveInstanceState(saveState);
        ((WebView) this.mRefreshableView).saveState(saveState);
    }

    @TargetApi(9)
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    final class InternalWebViewSDK9 extends WebView {
        static final int OVERSCROLL_FUZZY_THRESHOLD = 2;
        static final float OVERSCROLL_SCALE_FACTOR = 1.5f;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public InternalWebViewSDK9(Context context, AttributeSet attrs) {
            super(context, attrs);
            PullToRefreshWebView.this = r1;
        }

        @Override // android.view.View
        protected boolean overScrollBy(int deltaX, int deltaY, int scrollX, int scrollY, int scrollRangeX, int scrollRangeY, int maxOverScrollX, int maxOverScrollY, boolean isTouchEvent) {
            boolean returnValue = super.overScrollBy(deltaX, deltaY, scrollX, scrollY, scrollRangeX, scrollRangeY, maxOverScrollX, maxOverScrollY, isTouchEvent);
            OverscrollHelper.overScrollBy(PullToRefreshWebView.this, deltaX, scrollX, deltaY, scrollY, getScrollRange(), 2, OVERSCROLL_SCALE_FACTOR, isTouchEvent);
            return returnValue;
        }

        private int getScrollRange() {
            return (int) Math.max(0.0f, FloatMath.floor(((WebView) PullToRefreshWebView.this.mRefreshableView).getScale() * ((WebView) PullToRefreshWebView.this.mRefreshableView).getContentHeight()) - ((getHeight() - getPaddingBottom()) - getPaddingTop()));
        }
    }
}
