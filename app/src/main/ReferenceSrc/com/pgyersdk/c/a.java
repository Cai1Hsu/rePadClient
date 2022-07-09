package com.pgyersdk.c;

import android.os.AsyncTask;
import android.os.Build;

/* loaded from: classes.dex */
public final class a {
    public static void a(AsyncTask asyncTask) {
        if (Build.VERSION.SDK_INT <= 12) {
            asyncTask.execute(new Void[0]);
        } else {
            asyncTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
        }
    }
}
