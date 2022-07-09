package com.mining.app.zxing.activity;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.Vibrator;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import com.launcher.activity.R;
import com.mining.app.zxing.camera.CameraManager;
import com.mining.app.zxing.decoding.CaptureActivityHandler;
import com.mining.app.zxing.decoding.InactivityTimer;
import com.mining.app.zxing.decoding.Intents;
import com.mining.app.zxing.view.ViewfinderView;
import java.io.IOException;
import java.util.Vector;

/* loaded from: classes.jar:com/mining/app/zxing/activity/MipcaActivityCapture.class */
public class MipcaActivityCapture extends Activity implements SurfaceHolder.Callback {
    private static final float BEEP_VOLUME = 0.1f;
    private static final long VIBRATE_DURATION = 200;
    private final MediaPlayer.OnCompletionListener beepListener = new MediaPlayer.OnCompletionListener() { // from class: com.mining.app.zxing.activity.MipcaActivityCapture.1
        @Override // android.media.MediaPlayer.OnCompletionListener
        public void onCompletion(MediaPlayer mediaPlayer) {
            mediaPlayer.seekTo(0);
        }
    };
    private CameraManager cameraManager;
    private String characterSet;
    private Vector<BarcodeFormat> decodeFormats;
    private CaptureActivityHandler handler;
    private boolean hasSurface;
    private InactivityTimer inactivityTimer;
    private MediaPlayer mediaPlayer;
    private boolean playBeep;
    private boolean vibrate;
    private ViewfinderView viewfinderView;

    private void initCamera(SurfaceHolder surfaceHolder) {
        try {
            this.cameraManager.openDriver(surfaceHolder);
            if (this.handler != null) {
                return;
            }
            this.handler = new CaptureActivityHandler(this, this.decodeFormats, this.characterSet, this.cameraManager);
        } catch (IOException e) {
        } catch (RuntimeException e2) {
        }
    }

    private void playBeepSoundAndVibrate() {
        if (this.playBeep && this.mediaPlayer != null) {
            this.mediaPlayer.start();
        }
        if (this.vibrate) {
            ((Vibrator) getSystemService("vibrator")).vibrate(VIBRATE_DURATION);
        }
    }

    public void drawViewfinder() {
        this.viewfinderView.drawViewfinder();
    }

    public CameraManager getCameraManager() {
        return this.cameraManager;
    }

    public Handler getHandler() {
        return this.handler;
    }

    public ViewfinderView getViewfinderView() {
        return this.viewfinderView;
    }

    public void handleDecode(Result result, Bitmap bitmap) {
        this.inactivityTimer.onActivity();
        playBeepSoundAndVibrate();
        String text = result.getText();
        if (text.equals("")) {
            Toast.makeText(this, "Scan failed!", 0).show();
        } else {
            Intent intent = new Intent();
            Bundle bundle = new Bundle();
            Log.i("TAG", "resultString = " + text);
            bundle.putString(Intents.Scan.RESULT, text);
            intent.putExtras(bundle);
            setResult(-1, intent);
        }
        finish();
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_capture);
        CameraManager.init(getApplication());
        this.cameraManager = CameraManager.get();
        this.viewfinderView = (ViewfinderView) findViewById(R.id.viewfinder_view);
        this.viewfinderView.setCameraManager(this.cameraManager);
        ((Button) findViewById(R.id.button_back)).setOnClickListener(new View.OnClickListener() { // from class: com.mining.app.zxing.activity.MipcaActivityCapture.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                MipcaActivityCapture.this.finish();
            }
        });
        this.hasSurface = false;
        this.inactivityTimer = new InactivityTimer(this);
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        this.inactivityTimer.shutdown();
        super.onDestroy();
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        if (this.handler != null) {
            this.handler.quitSynchronously();
            this.handler = null;
        }
        this.cameraManager.closeDriver();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        SurfaceHolder holder = ((SurfaceView) findViewById(R.id.preview_view)).getHolder();
        if (this.hasSurface) {
            initCamera(holder);
        } else {
            holder.addCallback(this);
            holder.setType(3);
        }
        this.decodeFormats = null;
        this.characterSet = null;
        this.playBeep = true;
        if (((AudioManager) getSystemService("audio")).getRingerMode() != 2) {
            this.playBeep = false;
        }
        this.vibrate = true;
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        if (!this.hasSurface) {
            this.hasSurface = true;
            initCamera(surfaceHolder);
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        this.hasSurface = false;
    }
}
