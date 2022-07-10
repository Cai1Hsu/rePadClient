package com.mining.app.zxing.decoding;

import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import com.launcher.activity.R;
import com.mining.app.zxing.activity.MipcaActivityCapture;
import com.mining.app.zxing.camera.CameraManager;
import com.mining.app.zxing.view.ViewfinderResultPointCallback;
import java.util.Collection;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class CaptureActivityHandler extends Handler {
    private static final String TAG = CaptureActivityHandler.class.getSimpleName();
    private final MipcaActivityCapture activity;
    private final CameraManager cameraManager;
    private final DecodeThread decodeThread;
    private State state = State.SUCCESS;

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private enum State {
        PREVIEW,
        SUCCESS,
        DONE
    }

    public CaptureActivityHandler(MipcaActivityCapture activity, Collection<BarcodeFormat> decodeFormats, String characterSet, CameraManager cameraManager) {
        this.activity = activity;
        this.decodeThread = new DecodeThread(activity, decodeFormats, characterSet, new ViewfinderResultPointCallback(activity.getViewfinderView()));
        this.decodeThread.start();
        this.cameraManager = cameraManager;
        cameraManager.startPreview();
        restartPreviewAndDecode();
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        switch (message.what) {
            case R.id.auto_focus /* 2131361795 */:
                if (this.state == State.PREVIEW) {
                    this.cameraManager.requestAutoFocus(this, R.id.auto_focus);
                    return;
                }
                return;
            case R.id.decode /* 2131361796 */:
            case R.id.encode_failed /* 2131361799 */:
            case R.id.encode_succeeded /* 2131361800 */:
            case R.id.quit /* 2131361802 */:
            default:
                return;
            case R.id.decode_failed /* 2131361797 */:
                this.state = State.PREVIEW;
                this.cameraManager.requestPreviewFrame(this.decodeThread.getHandler(), R.id.decode);
                return;
            case R.id.decode_succeeded /* 2131361798 */:
                Log.d(TAG, "Got decode succeeded message");
                this.state = State.SUCCESS;
                Bundle bundle = message.getData();
                Bitmap barcode = bundle == null ? null : (Bitmap) bundle.getParcelable(DecodeThread.BARCODE_BITMAP);
                this.activity.handleDecode((Result) message.obj, barcode);
                return;
            case R.id.launch_product_query /* 2131361801 */:
                Log.d(TAG, "Got product query message");
                String url = (String) message.obj;
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
                intent.addFlags(524288);
                this.activity.startActivity(intent);
                return;
            case R.id.restart_preview /* 2131361803 */:
                Log.d(TAG, "Got restart preview message");
                restartPreviewAndDecode();
                return;
            case R.id.return_scan_result /* 2131361804 */:
                Log.d(TAG, "Got return scan result message");
                this.activity.setResult(-1, (Intent) message.obj);
                this.activity.finish();
                return;
        }
    }

    public void quitSynchronously() {
        this.state = State.DONE;
        this.cameraManager.stopPreview();
        Message quit = Message.obtain(this.decodeThread.getHandler(), (int) R.id.quit);
        quit.sendToTarget();
        try {
            this.decodeThread.join(500L);
        } catch (InterruptedException e) {
        }
        removeMessages(R.id.decode_succeeded);
        removeMessages(R.id.decode_failed);
    }

    private void restartPreviewAndDecode() {
        if (this.state == State.SUCCESS) {
            this.state = State.PREVIEW;
            this.cameraManager.requestPreviewFrame(this.decodeThread.getHandler(), R.id.decode);
            this.cameraManager.requestAutoFocus(this, R.id.auto_focus);
            this.activity.drawViewfinder();
        }
    }
}
