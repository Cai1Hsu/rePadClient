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
/* loaded from: classes.jar:com/edutech/publicedu/log/EvkActivity.class */
public class EvkActivity extends Activity {
    private String gifPath;
    private String jsonPath;
    private String mp3Path;
    private int windowHeight;
    private int windowWidth;
    private WebView wv_evk;

    /* loaded from: classes.jar:com/edutech/publicedu/log/EvkActivity$JavascriptInterface.class */
    class JavascriptInterface {
        JavascriptInterface() {
            EvkActivity.this = r4;
        }

        public void goBack() {
            Log.i("qwe", "goBack");
            EvkActivity.this.finish();
        }

        public void pauseVideo() {
            Log.i("qwe", "pauseVideo");
            LogHelp.getInstance().pauseLog();
        }

        public void playVideo() {
            Log.i("qwe", "playVideo");
            LogHelp.getInstance().continueLog();
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        DisplayMetrics displayMetrics = new DisplayMetrics();
        getWindow().getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        this.windowWidth = (int) (displayMetrics.widthPixels / displayMetrics.scaledDensity);
        this.windowHeight = (int) (displayMetrics.heightPixels / displayMetrics.scaledDensity);
        setContentView(R.layout.fragment_evk);
        this.wv_evk = (WebView) findViewById(R.id.wv_evk);
        WebSettings settings = this.wv_evk.getSettings();
        settings.setJavaScriptEnabled(true);
        this.wv_evk.addJavascriptInterface(new JavascriptInterface(), "Android");
        settings.setPluginState(WebSettings.PluginState.ON);
        settings.setBuiltInZoomControls(false);
        settings.setUseWideViewPort(false);
        settings.setLoadWithOverviewMode(true);
        settings.setAllowFileAccess(true);
        settings.setCacheMode(2);
        Intent intent = getIntent();
        this.gifPath = intent.getStringExtra("gifpath");
        this.mp3Path = intent.getStringExtra("mp3path");
        this.jsonPath = intent.getStringExtra("jsonpath");
        this.wv_evk.loadUrl(XSLTLiaison.FILE_PROTOCOL_PREFIX + AppEnvironment.ASSETS_DIR + "player/player.html?imgpath=" + this.gifPath + "&audiopath=" + this.mp3Path + "&jsonpath=" + this.jsonPath + "&psize=" + this.windowWidth + "," + this.windowHeight + "&flag=1&play=1");
        Log.e("evk", XSLTLiaison.FILE_PROTOCOL_PREFIX + AppEnvironment.ASSETS_DIR + "player/player.html?imgpath=" + this.gifPath + "&audiopath=" + this.mp3Path + "&jsonpath=" + this.jsonPath + "&psize=" + this.windowWidth + "," + this.windowHeight + "&flag=1&play=1");
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.wv_evk.loadUrl("javascript:stopPlay()");
        LogHelp.getInstance().stopLog();
    }
}
