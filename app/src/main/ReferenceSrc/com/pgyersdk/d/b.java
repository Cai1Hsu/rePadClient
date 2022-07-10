package com.pgyersdk.d;

import android.os.Handler;
import android.os.Message;
import com.pgyersdk.c.i;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class b extends Handler {
    final /* synthetic */ a a;

    public b(a aVar) {
        this.a = aVar;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message msg) {
        switch (msg.what) {
            case 20002:
                String obj = msg.obj.toString();
                if (a.a(this.a) != null) {
                    a.a(this.a).setImageBitmap(i.a(obj));
                    return;
                }
                Message obtainMessage = a.b(this.a).obtainMessage();
                obtainMessage.what = 20002;
                obtainMessage.obj = msg.obj.toString();
                a.b(this.a).sendMessageDelayed(obtainMessage, 100L);
                return;
            default:
                return;
        }
    }
}
