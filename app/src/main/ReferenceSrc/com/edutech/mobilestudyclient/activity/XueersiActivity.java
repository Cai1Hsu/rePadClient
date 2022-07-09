package com.edutech.mobilestudyclient.activity;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import com.launcher.activity.R;
import org.apache.tools.ant.MagicNames;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/XueersiActivity.class */
public class XueersiActivity extends Activity {
    private WebView webview;
    private String loadurl = "http://www.xueersi.com/";
    private long backpress = 0;
    private int times = 0;

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/XueersiActivity$MyWebClient.class */
    class MyWebClient extends WebViewClient {
        MyWebClient() {
            XueersiActivity.this = r4;
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView webView, int i, String str, String str2) {
            super.onReceivedError(webView, i, str, str2);
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            return super.shouldOverrideUrlLoading(webView, str);
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.webview == null || this.loadurl == null) {
            return;
        }
        this.webview.loadUrl(this.loadurl);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_xueersi);
        this.webview = (WebView) findViewById(R.id.xueersi_webview);
        this.loadurl = getIntent().getStringExtra(MagicNames.ANT_FILE_TYPE_URL);
        WebSettings settings = this.webview.getSettings();
        settings.setBuiltInZoomControls(true);
        settings.setJavaScriptEnabled(true);
        settings.setUseWideViewPort(true);
        settings.setLoadWithOverviewMode(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        settings.setSupportZoom(true);
        settings.setDomStorageEnabled(true);
        this.webview.setWebViewClient(new MyWebClient());
        this.webview.setWebChromeClient(new WebChromeClient());
        settings.setUserAgentString("User-Agent:Android");
        Log.e(MagicNames.ANT_FILE_TYPE_URL, this.loadurl);
        if (this.loadurl == null || this.loadurl.equals("")) {
            this.webview.loadUrl("http://www.xueersi.com/");
        } else {
            this.webview.loadUrl(this.loadurl);
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.webview != null) {
            this.webview.loadUrl("");
            this.webview = null;
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        boolean z = false;
        if (i != 4) {
            z = super.onKeyDown(i, keyEvent);
        } else if (this.times == 0) {
            this.backpress = System.currentTimeMillis();
            this.times++;
            Toast.makeText(this, "再按一次退出应用", 0).show();
        } else if (System.currentTimeMillis() - this.backpress < 800) {
            finish();
            z = super.onKeyDown(i, keyEvent);
        } else {
            this.times = 0;
        }
        return z;
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        this.webview.reload();
    }
}
