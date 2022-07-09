package com.pgyersdk.d;

import android.os.Handler;
import android.os.Message;
import android.widget.ImageView;
import com.pgyersdk.c.i;

/* loaded from: classes.dex */
final class b extends Handler {
    final /* synthetic */ a a;

    b(a aVar) {
        this.a = aVar;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message msg) {
        ImageView imageView;
        Handler handler;
        Handler handler2;
        ImageView imageView2;
        switch (msg.what) {
            case 20002:
                String obj = msg.obj.toString();
                imageView = this.a.f;
                if (imageView != null) {
                    imageView2 = this.a.f;
                    imageView2.setImageBitmap(i.a(obj));
                    return;
                }
                handler = this.a.n;
                Message obtainMessage = handler.obtainMessage();
                obtainMessage.what = 20002;
                obtainMessage.obj = msg.obj.toString();
                handler2 = this.a.n;
                handler2.sendMessageDelayed(obtainMessage, 100L);
                return;
            default:
                return;
        }
    }
}
