package com.edutech.utils;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import org.apache.tools.ant.taskdefs.Execute;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MoniterServiceHelper {
    private boolean isrun = true;
    private Context mContext;
    private String serviceName;

    static /* synthetic */ String access$1(MoniterServiceHelper moniterServiceHelper) {
        return moniterServiceHelper.serviceName;
    }

    static /* synthetic */ Context access$2(MoniterServiceHelper moniterServiceHelper) {
        return moniterServiceHelper.mContext;
    }

    static /* synthetic */ boolean access$0(MoniterServiceHelper moniterServiceHelper) {
        return moniterServiceHelper.isrun;
    }

    public MoniterServiceHelper(String serviceName, Context context) {
        this.serviceName = serviceName;
        this.mContext = context;
    }

    public void startMoniter() {
        this.isrun = true;
        new Thread(new ListenerRun(this, null)).start();
    }

    public void stopMoniter() {
        this.isrun = false;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private class ListenerRun implements Runnable {
        private ListenerRun() {
            MoniterServiceHelper.this = r1;
        }

        /* synthetic */ ListenerRun(MoniterServiceHelper moniterServiceHelper, ListenerRun listenerRun) {
            this();
        }

        @Override // java.lang.Runnable
        public void run() {
            while (MoniterServiceHelper.access$0(MoniterServiceHelper.this)) {
                try {
                    Thread.sleep(1000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (MoniterServiceHelper.this.isServiceRunning(MoniterServiceHelper.access$1(MoniterServiceHelper.this), MoniterServiceHelper.access$2(MoniterServiceHelper.this))) {
                    Log.i("Autorun", "����������");
                } else {
                    Intent intent = new Intent("android.intent.action.START_SERVICE");
                    MoniterServiceHelper.access$2(MoniterServiceHelper.this).sendBroadcast(intent);
                    Log.i("Autorun", "����ֹͣ");
                }
            }
        }
    }

    public boolean isServiceRunning(String serviceName, Context context) {
        ActivityManager manager = (ActivityManager) this.mContext.getSystemService("activity");
        for (ActivityManager.RunningServiceInfo service : manager.getRunningServices(Execute.INVALID)) {
            if (serviceName.equals(service.service.getClassName())) {
                return true;
            }
        }
        return false;
    }
}
