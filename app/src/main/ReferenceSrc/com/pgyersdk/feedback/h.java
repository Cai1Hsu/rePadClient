package com.pgyersdk.feedback;

import android.graphics.Bitmap;
import android.os.AsyncTask;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class h extends AsyncTask {
    final /* synthetic */ c a;
    private final /* synthetic */ Bitmap b;
    private final /* synthetic */ String c;

    public h(c cVar, Bitmap bitmap, String str) {
        this.a = cVar;
        this.b = bitmap;
        this.c = str;
    }

    @Override // android.os.AsyncTask
    protected final /* synthetic */ Object doInBackground(Object... objArr) {
        return com.pgyersdk.c.i.a(this.b, this.c).booleanValue();
    }

    @Override // android.os.AsyncTask
    protected final /* synthetic */ void onPostExecute(Object obj) {
        Boolean bool = (Boolean) obj;
        super.onPostExecute(bool);
        if (bool.booleanValue()) {
            if (c.b() == null) {
                return;
            }
            c.b().a(c.b(this.a));
        } else if (c.b() == null) {
        } else {
            c.b();
        }
    }
}
