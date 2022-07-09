package com.mining.app.zxing.decoding;

import android.os.Handler;
import android.os.Looper;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.ResultPointCallback;
import com.mining.app.zxing.activity.MipcaActivityCapture;
import java.util.Collection;
import java.util.Hashtable;
import java.util.Vector;
import java.util.concurrent.CountDownLatch;

/* loaded from: classes.jar:com/mining/app/zxing/decoding/DecodeThread.class */
final class DecodeThread extends Thread {
    public static final String BARCODE_BITMAP = "barcode_bitmap";
    private final MipcaActivityCapture activity;
    private Handler handler;
    private final CountDownLatch handlerInitLatch = new CountDownLatch(1);
    private final Hashtable<DecodeHintType, Object> hints = new Hashtable<>(3);

    /* JADX WARN: Code restructure failed: missing block: B:5:0x002d, code lost:
        if (r7.isEmpty() != false) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    DecodeThread(MipcaActivityCapture mipcaActivityCapture, Collection<BarcodeFormat> collection, String str, ResultPointCallback resultPointCallback) {
        this.activity = mipcaActivityCapture;
        Vector vector = collection != null ? collection : vector;
        vector = new Vector();
        vector.addAll(DecodeFormatManager.ONE_D_FORMATS);
        vector.addAll(DecodeFormatManager.QR_CODE_FORMATS);
        vector.addAll(DecodeFormatManager.DATA_MATRIX_FORMATS);
        this.hints.put(DecodeHintType.POSSIBLE_FORMATS, vector);
        if (str != null) {
            this.hints.put(DecodeHintType.CHARACTER_SET, str);
        }
        this.hints.put(DecodeHintType.NEED_RESULT_POINT_CALLBACK, resultPointCallback);
    }

    Handler getHandler() {
        try {
            this.handlerInitLatch.await();
        } catch (InterruptedException e) {
        }
        return this.handler;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        Looper.prepare();
        this.handler = new DecodeHandler(this.activity, this.hints);
        this.handlerInitLatch.countDown();
        Looper.loop();
    }
}
