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

/* loaded from: classes.dex */
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

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_capture);
        CameraManager.init(getApplication());
        this.cameraManager = CameraManager.get();
        this.viewfinderView = (ViewfinderView) findViewById(R.id.viewfinder_view);
        this.viewfinderView.setCameraManager(this.cameraManager);
        Button mButtonBack = (Button) findViewById(R.id.button_back);
        mButtonBack.setOnClickListener(new View.OnClickListener() { // from class: com.mining.app.zxing.activity.MipcaActivityCapture.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                MipcaActivityCapture.this.finish();
            }
        });
        this.hasSurface = false;
        this.inactivityTimer = new InactivityTimer(this);
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        SurfaceView surfaceView = (SurfaceView) findViewById(R.id.preview_view);
        SurfaceHolder surfaceHolder = surfaceView.getHolder();
        if (this.hasSurface) {
            initCamera(surfaceHolder);
        } else {
            surfaceHolder.addCallback(this);
            surfaceHolder.setType(3);
        }
        this.decodeFormats = null;
        this.characterSet = null;
        this.playBeep = true;
        AudioManager audioService = (AudioManager) getSystemService("audio");
        if (audioService.getRingerMode() != 2) {
            this.playBeep = false;
        }
        this.vibrate = true;
    }

    public CameraManager getCameraManager() {
        return this.cameraManager;
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
    protected void onDestroy() {
        this.inactivityTimer.shutdown();
        super.onDestroy();
    }

    public void handleDecode(Result result, Bitmap barcode) {
        this.inactivityTimer.onActivity();
        playBeepSoundAndVibrate();
        String resultString = result.getText();
        if (resultString.equals("")) {
            Toast.makeText(this, "Scan failed!", 0).show();
        } else {
            Intent resultIntent = new Intent();
            Bundle bundle = new Bundle();
            Log.i("TAG", "resultString = " + resultString);
            bundle.putString(Intents.Scan.RESULT, resultString);
            resultIntent.putExtras(bundle);
            setResult(-1, resultIntent);
        }
        finish();
    }

    private void initCamera(SurfaceHolder surfaceHolder) {
        try {
            this.cameraManager.openDriver(surfaceHolder);
            if (this.handler == null) {
                this.handler = new CaptureActivityHandler(this, this.decodeFormats, this.characterSet, this.cameraManager);
            }
        } catch (IOException e) {
        } catch (RuntimeException e2) {
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder holder) {
        if (!this.hasSurface) {
            this.hasSurface = true;
            initCamera(holder);
        }
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder holder) {
        this.hasSurface = false;
    }

    public ViewfinderView getViewfinderView() {
        return this.viewfinderView;
    }

    public Handler getHandler() {
        return this.handler;
    }

    public void drawViewfinder() {
        this.viewfinderView.drawViewfinder();
    }

    private void playBeepSoundAndVibrate() {
        if (this.playBeep && this.mediaPlayer != null) {
            this.mediaPlayer.start();
        }
        if (this.vibrate) {
            Vibrator vibrator = (Vibrator) getSystemService("vibrator");
            vibrator.vibrate(VIBRATE_DURATION);
        }
    }
}
