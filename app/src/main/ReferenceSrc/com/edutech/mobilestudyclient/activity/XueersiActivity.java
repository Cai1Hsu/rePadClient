package com.edutech.mobilestudyclient.activity;

import android.app.Activity;
import android.content.Intent;
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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class XueersiActivity extends Activity {
    private WebView webview;
    private String loadurl = "http://www.xueersi.com/";
    private long backpress = 0;
    private int times = 0;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_xueersi);
        this.webview = (WebView) findViewById(R.id.xueersi_webview);
        Intent intent = getIntent();
        this.loadurl = intent.getStringExtra(MagicNames.ANT_FILE_TYPE_URL);
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
        if (this.loadurl != null && !this.loadurl.equals("")) {
            this.webview.loadUrl(this.loadurl);
        } else {
            this.webview.loadUrl("http://www.xueersi.com/");
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.webview != null && this.loadurl != null) {
            this.webview.loadUrl(this.loadurl);
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class MyWebClient extends WebViewClient {
        MyWebClient() {
            XueersiActivity.this = r1;
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            return super.shouldOverrideUrlLoading(view, url);
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            super.onReceivedError(view, errorCode, description, failingUrl);
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            if (this.times == 0) {
                this.backpress = System.currentTimeMillis();
                this.times++;
                Toast.makeText(this, "再按一次退出应用", 0).show();
                return false;
            } else if (System.currentTimeMillis() - this.backpress < 800) {
                finish();
                return super.onKeyDown(keyCode, event);
            } else {
                this.times = 0;
                return false;
            }
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        this.webview.reload();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.webview != null) {
            this.webview.loadUrl("");
            this.webview = null;
        }
    }
}
