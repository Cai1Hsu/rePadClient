package com.pgyersdk.update;

import android.app.Activity;
import android.os.AsyncTask;
import com.pgyersdk.b.a;
import com.pgyersdk.b.b;
import com.pgyersdk.c.n;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PgyUpdateManager {
    private static a a = null;
    private static UpdateManagerListener b = null;

    private static void a(Activity activity, String str, String str2, UpdateManagerListener updateManagerListener) {
        try {
            com.pgyersdk.a.a.k = str2;
            String a2 = n.a(str2);
            b = updateManagerListener;
            if (a == null || a.getStatus() == AsyncTask.Status.FINISHED) {
                b bVar = new b(activity, str, a2, updateManagerListener);
                a = bVar;
                com.pgyersdk.c.a.a(bVar);
            } else {
                a.a(activity);
            }
        } catch (Exception e) {
        }
    }

    public static void register(Activity activity, String appId) {
        a(activity, "http://www.pgyer.com/", appId, null);
    }

    public static void register(Activity activity, String appId, UpdateManagerListener listener) {
        a(activity, "http://www.pgyer.com/", appId, listener);
    }

    public static void unregister() {
        if (a != null) {
            a.cancel(true);
            a.a();
            a = null;
        }
        b = null;
    }
}
