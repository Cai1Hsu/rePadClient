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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class DecodeHandler extends Handler {
    private static final String TAG = DecodeHandler.class.getSimpleName();
    private final MipcaActivityCapture activity;
    private boolean running = true;
    private final MultiFormatReader multiFormatReader = new MultiFormatReader();

    public DecodeHandler(MipcaActivityCapture activity, Map<DecodeHintType, Object> hints) {
        this.multiFormatReader.setHints(hints);
        this.activity = activity;
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        if (this.running) {
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

    private void decode(byte[] data, int width, int height) {
        long start = System.currentTimeMillis();
        Result rawResult = null;
        PlanarYUVLuminanceSource source = this.activity.getCameraManager().buildLuminanceSource(data, width, height);
        if (source != null) {
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
            try {
                rawResult = this.multiFormatReader.decodeWithState(bitmap);
            } catch (ReaderException e) {
            } finally {
                this.multiFormatReader.reset();
            }
        }
        Handler handler = this.activity.getHandler();
        if (rawResult != null) {
            long end = System.currentTimeMillis();
            Log.d(TAG, "Found barcode in " + (end - start) + " ms");
            if (handler != null) {
                Message message = Message.obtain(handler, R.id.decode_succeeded, rawResult);
                Bundle bundle = new Bundle();
                bundle.putParcelable(DecodeThread.BARCODE_BITMAP, source.renderCroppedGreyscaleBitmap());
                message.setData(bundle);
                message.sendToTarget();
            }
        } else if (handler != null) {
            Message.obtain(handler, (int) R.id.decode_failed).sendToTarget();
        }
    }
}
