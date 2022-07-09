package com.edutech.appmanage;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import java.util.ArrayList;

/* loaded from: classes.dex */
public class SilentUninstall_Service extends Service {
    private boolean first = false;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [com.edutech.appmanage.SilentUninstall_Service$1] */
    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (!this.first) {
            return super.onStartCommand(intent, flags, startId);
        }
        final ArrayList<String> list = intent.getStringArrayListExtra("uninstall_list");
        new Thread() { // from class: com.edutech.appmanage.SilentUninstall_Service.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                for (int i = 0; i < list.size(); i++) {
                    Intent apk_uninstall = new Intent("android.intent.action.apk_uninstall");
                    apk_uninstall.putExtra("packagename", (String) list.get(i));
                    SilentUninstall_Service.this.sendBroadcast(apk_uninstall);
                }
                SilentUninstall_Service.this.stopSelf();
            }
        }.start();
        this.first = false;
        return super.onStartCommand(intent, flags, startId);
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.first = true;
    }
}
