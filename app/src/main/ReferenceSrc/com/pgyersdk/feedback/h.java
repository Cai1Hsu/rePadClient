package com.pgyersdk.feedback;

import android.graphics.Bitmap;
import android.os.AsyncTask;

/* loaded from: classes.dex */
final class h extends AsyncTask {
    final /* synthetic */ c a;
    private final /* synthetic */ Bitmap b;
    private final /* synthetic */ String c;

    h(c cVar, Bitmap bitmap, String str) {
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
        b bVar;
        b bVar2;
        b bVar3;
        String str;
        b unused;
        Boolean bool = (Boolean) obj;
        super.onPostExecute(bool);
        if (!bool.booleanValue()) {
            bVar = c.i;
            if (bVar == null) {
                return;
            }
            unused = c.i;
            return;
        }
        bVar2 = c.i;
        if (bVar2 == null) {
            return;
        }
        bVar3 = c.i;
        str = this.a.h;
        bVar3.a(str);
    }
}
