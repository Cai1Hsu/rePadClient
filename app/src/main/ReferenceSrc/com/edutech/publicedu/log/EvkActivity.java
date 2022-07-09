package com.edutech.publicedu.log;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.Log;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.launcher.activity.R;
import org.apache.tools.ant.taskdefs.XSLTLiaison;

@SuppressLint({"NewApi"})
/* loaded from: classes.dex */
public class EvkActivity extends Activity {
    private String gifPath;
    private String jsonPath;
    private String mp3Path;
    private int windowHeight;
    private int windowWidth;
    private WebView wv_evk;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        DisplayMetrics outMetrics = new DisplayMetrics();
        getWindow().getWindowManager().getDefaultDisplay().getMetrics(outMetrics);
        this.windowWidth = (int) (outMetrics.widthPixels / outMetrics.scaledDensity);
        this.windowHeight = (int) (outMetrics.heightPixels / outMetrics.scaledDensity);
        setContentView(R.layout.fragment_evk);
        this.wv_evk = (WebView) findViewById(R.id.wv_evk);
        WebSettings webSettings = this.wv_evk.getSettings();
        webSettings.setJavaScriptEnabled(true);
        this.wv_evk.addJavascriptInterface(new JavascriptInterface(), "Android");
        webSettings.setPluginState(WebSettings.PluginState.ON);
        webSettings.setBuiltInZoomControls(false);
        webSettings.setUseWideViewPort(false);
        webSettings.setLoadWithOverviewMode(true);
        webSettings.setAllowFileAccess(true);
        webSettings.setCacheMode(2);
        Intent intent = getIntent();
        this.gifPath = intent.getStringExtra("gifpath");
        this.mp3Path = intent.getStringExtra("mp3path");
        this.jsonPath = intent.getStringExtra("jsonpath");
        this.wv_evk.loadUrl(XSLTLiaison.FILE_PROTOCOL_PREFIX + AppEnvironment.ASSETS_DIR + "player/player.html?imgpath=" + this.gifPath + "&audiopath=" + this.mp3Path + "&jsonpath=" + this.jsonPath + "&psize=" + this.windowWidth + "," + this.windowHeight + "&flag=1&play=1");
        Log.e("evk", XSLTLiaison.FILE_PROTOCOL_PREFIX + AppEnvironment.ASSETS_DIR + "player/player.html?imgpath=" + this.gifPath + "&audiopath=" + this.mp3Path + "&jsonpath=" + this.jsonPath + "&psize=" + this.windowWidth + "," + this.windowHeight + "&flag=1&play=1");
    }

    /* loaded from: classes.dex */
    class JavascriptInterface {
        JavascriptInterface() {
            EvkActivity.this = r1;
        }

        public void playVideo() {
            Log.i("qwe", "playVideo");
            LogHelp.getInstance().continueLog();
        }

        public void pauseVideo() {
            Log.i("qwe", "pauseVideo");
            LogHelp.getInstance().pauseLog();
        }

        public void goBack() {
            Log.i("qwe", "goBack");
            EvkActivity.this.finish();
        }
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.wv_evk.loadUrl("javascript:stopPlay()");
        LogHelp.getInstance().stopLog();
    }
}
