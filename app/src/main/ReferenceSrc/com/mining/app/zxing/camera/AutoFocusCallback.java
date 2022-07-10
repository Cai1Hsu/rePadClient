package com.mining.app.zxing.camera;

import android.hardware.Camera;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class AutoFocusCallback implements Camera.AutoFocusCallback {
    private static final long AUTOFOCUS_INTERVAL_MS = 1500;
    private static final String TAG = AutoFocusCallback.class.getSimpleName();
    private Handler autoFocusHandler;
    private int autoFocusMessage;

    public void setHandler(Handler autoFocusHandler, int autoFocusMessage) {
        this.autoFocusHandler = autoFocusHandler;
        this.autoFocusMessage = autoFocusMessage;
    }

    @Override // android.hardware.Camera.AutoFocusCallback
    public void onAutoFocus(boolean success, Camera camera) {
        if (this.autoFocusHandler != null) {
            Message message = this.autoFocusHandler.obtainMessage(this.autoFocusMessage, Boolean.valueOf(success));
            this.autoFocusHandler.sendMessageDelayed(message, AUTOFOCUS_INTERVAL_MS);
            this.autoFocusHandler = null;
            return;
        }
        Log.d(TAG, "Got auto-focus callback, but no handler for it");
    }
}
