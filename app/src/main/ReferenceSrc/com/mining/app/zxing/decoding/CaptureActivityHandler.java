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

/* loaded from: classes.jar:com/mining/app/zxing/decoding/CaptureActivityHandler.class */
public final class CaptureActivityHandler extends Handler {
    private static final String TAG = CaptureActivityHandler.class.getSimpleName();
    private final MipcaActivityCapture activity;
    private final CameraManager cameraManager;
    private final DecodeThread decodeThread;
    private State state = State.SUCCESS;

    /* loaded from: classes.jar:com/mining/app/zxing/decoding/CaptureActivityHandler$State.class */
    private enum State {
        PREVIEW,
        SUCCESS,
        DONE
    }

    public CaptureActivityHandler(MipcaActivityCapture mipcaActivityCapture, Collection<BarcodeFormat> collection, String str, CameraManager cameraManager) {
        this.activity = mipcaActivityCapture;
        this.decodeThread = new DecodeThread(mipcaActivityCapture, collection, str, new ViewfinderResultPointCallback(mipcaActivityCapture.getViewfinderView()));
        this.decodeThread.start();
        this.cameraManager = cameraManager;
        cameraManager.startPreview();
        restartPreviewAndDecode();
    }

    private void restartPreviewAndDecode() {
        if (this.state == State.SUCCESS) {
            this.state = State.PREVIEW;
            this.cameraManager.requestPreviewFrame(this.decodeThread.getHandler(), R.id.decode);
            this.cameraManager.requestAutoFocus(this, R.id.auto_focus);
            this.activity.drawViewfinder();
        }
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        switch (message.what) {
            case R.id.auto_focus /* 2131361795 */:
                if (this.state != State.PREVIEW) {
                    return;
                }
                this.cameraManager.requestAutoFocus(this, R.id.auto_focus);
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
                Bundle data = message.getData();
                this.activity.handleDecode((Result) message.obj, data == null ? null : (Bitmap) data.getParcelable(DecodeThread.BARCODE_BITMAP));
                return;
            case R.id.launch_product_query /* 2131361801 */:
                Log.d(TAG, "Got product query message");
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse((String) message.obj));
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
        Message.obtain(this.decodeThread.getHandler(), (int) R.id.quit).sendToTarget();
        try {
            this.decodeThread.join(500L);
        } catch (InterruptedException e) {
        }
        removeMessages(R.id.decode_succeeded);
        removeMessages(R.id.decode_failed);
    }
}
