package com.pgyersdk.feedback;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.widget.Toast;

/* loaded from: classes.dex */
final class i extends Handler {
    final /* synthetic */ c a;

    i(c cVar) {
        this.a = cVar;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.os.Handler
    public final void handleMessage(Message msg) {
        Context context;
        Context context2;
        switch (msg.what) {
            case 20001:
                context2 = this.a.g;
                Toast.makeText(context2, "谢谢你的反馈", 0).show();
                break;
            case 20002:
                break;
            default:
                return;
        }
        com.pgyersdk.c.e a = com.pgyersdk.c.e.a();
        com.pgyersdk.c.e a2 = com.pgyersdk.c.e.a();
        context = this.a.g;
        a.a(a2.b(context));
    }
}
