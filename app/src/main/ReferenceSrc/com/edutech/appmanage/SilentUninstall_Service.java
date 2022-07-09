package com.edutech.appmanage;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import java.util.ArrayList;

/* loaded from: classes.jar:com/edutech/appmanage/SilentUninstall_Service.class */
public class SilentUninstall_Service extends Service {
    private boolean first = false;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.first = true;
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [com.edutech.appmanage.SilentUninstall_Service$1] */
    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        int onStartCommand;
        if (!this.first) {
            onStartCommand = super.onStartCommand(intent, i, i2);
        } else {
            final ArrayList<String> stringArrayListExtra = intent.getStringArrayListExtra("uninstall_list");
            new Thread() { // from class: com.edutech.appmanage.SilentUninstall_Service.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    super.run();
                    for (int i3 = 0; i3 < stringArrayListExtra.size(); i3++) {
                        Intent intent2 = new Intent("android.intent.action.apk_uninstall");
                        intent2.putExtra("packagename", (String) stringArrayListExtra.get(i3));
                        SilentUninstall_Service.this.sendBroadcast(intent2);
                    }
                    SilentUninstall_Service.this.stopSelf();
                }
            }.start();
            this.first = false;
            onStartCommand = super.onStartCommand(intent, i, i2);
        }
        return onStartCommand;
    }
}
