package com.mining.app.zxing.decoding;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;
import com.launcher.activity.R;
import com.mining.app.zxing.activity.MipcaActivityCapture;
import com.mining.app.zxing.camera.PlanarYUVLuminanceSource;
import java.util.Map;

/* loaded from: classes.jar:com/mining/app/zxing/decoding/DecodeHandler.class */
final class DecodeHandler extends Handler {
    private static final String TAG = DecodeHandler.class.getSimpleName();
    private final MipcaActivityCapture activity;
    private boolean running = true;
    private final MultiFormatReader multiFormatReader = new MultiFormatReader();

    DecodeHandler(MipcaActivityCapture mipcaActivityCapture, Map<DecodeHintType, Object> map) {
        this.multiFormatReader.setHints(map);
        this.activity = mipcaActivityCapture;
    }

    private void decode(byte[] bArr, int i, int i2) {
        long currentTimeMillis = System.currentTimeMillis();
        PlanarYUVLuminanceSource buildLuminanceSource = this.activity.getCameraManager().buildLuminanceSource(bArr, i, i2);
        Result result = null;
        if (buildLuminanceSource != null) {
            try {
                result = this.multiFormatReader.decodeWithState(new BinaryBitmap(new HybridBinarizer(buildLuminanceSource)));
                this.multiFormatReader.reset();
            } catch (ReaderException e) {
                this.multiFormatReader.reset();
                result = null;
            } catch (Throwable th) {
                this.multiFormatReader.reset();
                throw th;
            }
        }
        Handler handler = this.activity.getHandler();
        if (result == null) {
            if (handler == null) {
                return;
            }
            Message.obtain(handler, (int) R.id.decode_failed).sendToTarget();
            return;
        }
        Log.d(TAG, "Found barcode in " + (System.currentTimeMillis() - currentTimeMillis) + " ms");
        if (handler == null) {
            return;
        }
        Message obtain = Message.obtain(handler, R.id.decode_succeeded, result);
        Bundle bundle = new Bundle();
        bundle.putParcelable(DecodeThread.BARCODE_BITMAP, buildLuminanceSource.renderCroppedGreyscaleBitmap());
        obtain.setData(bundle);
        obtain.sendToTarget();
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (!this.running) {
            return;
        }
        switch (message.what) {
            case R.id.decode /* 2131361796 */:
                decode((byte[]) message.obj, message.arg1, message.arg2);
                return;
            case R.id.quit /* 2131361802 */:
                this.running = false;
                Looper.myLooper().quit();
                return;
            default:
                return;
        }
    }
}
