package com.edutech.utils;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import java.util.Iterator;
import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.jar:com/edutech/utils/MoniterServiceHelper.class */
public class MoniterServiceHelper {
    private boolean isrun = true;
    private Context mContext;
    private String serviceName;

    /* loaded from: classes.jar:com/edutech/utils/MoniterServiceHelper$ListenerRun.class */
    private class ListenerRun implements Runnable {
        private ListenerRun() {
            MoniterServiceHelper.this = r4;
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
                    MoniterServiceHelper.this.mContext.sendBroadcast(new Intent("android.intent.action.START_SERVICE"));
                    Log.i("Autorun", "����ֹͣ");
                }
            }
        }
    }

    public MoniterServiceHelper(String str, Context context) {
        this.serviceName = str;
        this.mContext = context;
    }

    public boolean isServiceRunning(String str, Context context) {
        boolean z;
        Iterator<ActivityManager.RunningServiceInfo> it = ((ActivityManager) this.mContext.getSystemService("activity")).getRunningServices(Execute.INVALID).iterator();
        while (true) {
            if (it.hasNext()) {
                if (str.equals(it.next().service.getClassName())) {
                    z = true;
                    break;
                }
            } else {
                z = false;
                break;
            }
        }
        return z;
    }

    public void startMoniter() {
        this.isrun = true;
        new Thread(new ListenerRun(this, null)).start();
    }

    public void stopMoniter() {
        this.isrun = false;
    }
}
