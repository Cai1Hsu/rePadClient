package com.pgyersdk.feedback;

import android.os.Handler;
import android.os.Message;
import android.widget.Toast;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class i extends Handler {
    final /* synthetic */ c a;

    public i(c cVar) {
        this.a = cVar;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.os.Handler
    public final void handleMessage(Message msg) {
        switch (msg.what) {
            case 20001:
                Toast.makeText(c.a(this.a), "谢谢你的反馈", 0).show();
                break;
            case 20002:
                break;
            default:
                return;
        }
        com.pgyersdk.c.e.a().a(com.pgyersdk.c.e.a().b(c.a(this.a)));
    }
}
