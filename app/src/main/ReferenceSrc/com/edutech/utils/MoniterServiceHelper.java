package com.edutech.utils;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.dex */
public class MoniterServiceHelper {
    private boolean isrun = true;
    private Context mContext;
    private String serviceName;

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

    /* loaded from: classes.dex */
    private class ListenerRun implements Runnable {
        private ListenerRun() {
            MoniterServiceHelper.this = r1;
        }

        /* synthetic */ ListenerRun(MoniterServiceHelper moniterServiceHelper, ListenerRun listenerRun) {
            this();
        }

        @Override // java.lang.Runnable
        public void run() {
            while (MoniterServiceHelper.this.isrun) {
                try {
                    Thread.sleep(1000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (MoniterServiceHelper.this.isServiceRunning(MoniterServiceHelper.this.serviceName, MoniterServiceHelper.this.mContext)) {
                    Log.i("Autorun", "����������");
                } else {
                    Intent intent = new Intent("android.intent.action.START_SERVICE");
                    MoniterServiceHelper.this.mContext.sendBroadcast(intent);
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
