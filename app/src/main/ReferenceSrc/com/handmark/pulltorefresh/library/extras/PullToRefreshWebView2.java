package com.handmark.pulltorefresh.library.extras;

import android.content.Context;
import android.util.AttributeSet;
import android.webkit.WebView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.PullToRefreshWebView;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PullToRefreshWebView2 extends PullToRefreshWebView {
    static final String DEF_JS_READY_PULL_DOWN_CALL = "javascript:isReadyForPullDown();";
    static final String DEF_JS_READY_PULL_UP_CALL = "javascript:isReadyForPullUp();";
    static final String JS_INTERFACE_PKG = "ptr";
    private final AtomicBoolean mIsReadyForPullDown = new AtomicBoolean(false);
    private final AtomicBoolean mIsReadyForPullUp = new AtomicBoolean(false);
    private JsValueCallback mJsCallback;

    public PullToRefreshWebView2(Context context) {
        super(context);
    }

    public PullToRefreshWebView2(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PullToRefreshWebView2(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    static /* synthetic */ AtomicBoolean access$1(PullToRefreshWebView2 pullToRefreshWebView2) {
        return pullToRefreshWebView2.mIsReadyForPullDown;
    }

    static /* synthetic */ AtomicBoolean access$0(PullToRefreshWebView2 pullToRefreshWebView2) {
        return pullToRefreshWebView2.mIsReadyForPullUp;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshWebView, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected WebView createRefreshableView(Context context, AttributeSet attrs) {
        WebView webView = super.createRefreshableView(context, attrs);
        this.mJsCallback = new JsValueCallback();
        webView.addJavascriptInterface(this.mJsCallback, JS_INTERFACE_PKG);
        return webView;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshWebView, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullStart() {
        getRefreshableView().loadUrl(DEF_JS_READY_PULL_DOWN_CALL);
        return this.mIsReadyForPullDown.get();
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshWebView, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullEnd() {
        getRefreshableView().loadUrl(DEF_JS_READY_PULL_UP_CALL);
        return this.mIsReadyForPullUp.get();
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    final class JsValueCallback {
        JsValueCallback() {
            PullToRefreshWebView2.this = r1;
        }

        public void isReadyForPullUpResponse(boolean response) {
            PullToRefreshWebView2.access$0(PullToRefreshWebView2.this).set(response);
        }

        public void isReadyForPullDownResponse(boolean response) {
            PullToRefreshWebView2.access$1(PullToRefreshWebView2.this).set(response);
        }
    }
}
