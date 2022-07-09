package com.handmark.pulltorefresh.library.extras;

import android.content.Context;
import android.util.AttributeSet;
import android.webkit.WebView;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.PullToRefreshWebView;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/extras/PullToRefreshWebView2.class */
public class PullToRefreshWebView2 extends PullToRefreshWebView {
    static final String DEF_JS_READY_PULL_DOWN_CALL = "javascript:isReadyForPullDown();";
    static final String DEF_JS_READY_PULL_UP_CALL = "javascript:isReadyForPullUp();";
    static final String JS_INTERFACE_PKG = "ptr";
    private final AtomicBoolean mIsReadyForPullDown = new AtomicBoolean(false);
    private final AtomicBoolean mIsReadyForPullUp = new AtomicBoolean(false);
    private JsValueCallback mJsCallback;

    /* loaded from: classes.jar:com/handmark/pulltorefresh/library/extras/PullToRefreshWebView2$JsValueCallback.class */
    final class JsValueCallback {
        JsValueCallback() {
            PullToRefreshWebView2.this = r4;
        }

        public void isReadyForPullDownResponse(boolean z) {
            PullToRefreshWebView2.this.mIsReadyForPullDown.set(z);
        }

        public void isReadyForPullUpResponse(boolean z) {
            PullToRefreshWebView2.this.mIsReadyForPullUp.set(z);
        }
    }

    public PullToRefreshWebView2(Context context) {
        super(context);
    }

    public PullToRefreshWebView2(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public PullToRefreshWebView2(Context context, PullToRefreshBase.Mode mode) {
        super(context, mode);
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshWebView, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected WebView createRefreshableView(Context context, AttributeSet attributeSet) {
        WebView createRefreshableView = super.createRefreshableView(context, attributeSet);
        this.mJsCallback = new JsValueCallback();
        createRefreshableView.addJavascriptInterface(this.mJsCallback, JS_INTERFACE_PKG);
        return createRefreshableView;
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshWebView, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullEnd() {
        getRefreshableView().loadUrl(DEF_JS_READY_PULL_UP_CALL);
        return this.mIsReadyForPullUp.get();
    }

    @Override // com.handmark.pulltorefresh.library.PullToRefreshWebView, com.handmark.pulltorefresh.library.PullToRefreshBase
    protected boolean isReadyForPullStart() {
        getRefreshableView().loadUrl(DEF_JS_READY_PULL_DOWN_CALL);
        return this.mIsReadyForPullDown.get();
    }
}
