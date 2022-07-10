package com.edutech.appmanage;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import java.util.ArrayList;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class SilentUninstall_Service extends Service {
    private boolean first = false;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (!this.first) {
            return super.onStartCommand(intent, flags, startId);
        }
        ArrayList<String> list = intent.getStringArrayListExtra("uninstall_list");
        new AnonymousClass1(list).start();
        this.first = false;
        return super.onStartCommand(intent, flags, startId);
    }

    /* renamed from: com.edutech.appmanage.SilentUninstall_Service$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 extends Thread {
        private final /* synthetic */ ArrayList val$list;

        AnonymousClass1(ArrayList arrayList) {
            SilentUninstall_Service.this = r1;
            this.val$list = arrayList;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            super.run();
            for (int i = 0; i < this.val$list.size(); i++) {
                Intent apk_uninstall = new Intent("android.intent.action.apk_uninstall");
                apk_uninstall.putExtra("packagename", (String) this.val$list.get(i));
                SilentUninstall_Service.this.sendBroadcast(apk_uninstall);
            }
            SilentUninstall_Service.this.stopSelf();
        }
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.first = true;
    }
}
