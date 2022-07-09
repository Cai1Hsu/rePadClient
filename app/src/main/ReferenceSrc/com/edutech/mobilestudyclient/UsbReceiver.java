package com.edutech.mobilestudyclient;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Environment;

/* loaded from: classes.dex */
public class UsbReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context arg0, Intent intent) {
        if (intent.getAction().equals("android.intent.action.MEDIA_MOUNTED")) {
            boolean boo = Environment.getExternalStorageDirectory().getPath().equals(intent.getData().getPath());
            if (!boo && !Build.DISPLAY.contains("S1016PRO") && !Build.DISPLAY.contains("M1016Pro") && Build.VERSION.SDK_INT < 24) {
                SharedPreferences sp = arg0.getSharedPreferences("sdcard", 4);
                sp.edit().putBoolean("sdcard", true).commit();
            }
        } else if (intent.getAction().equals("android.intent.action.MEDIA_REMOVED")) {
            SharedPreferences sp2 = arg0.getSharedPreferences("sdcard", 4);
            sp2.edit().putBoolean("sdcard", false).commit();
        } else if (intent.getAction().equals("android.intent.action.MEDIA_UNMOUNTED")) {
            SharedPreferences sp3 = arg0.getSharedPreferences("sdcard", 4);
            sp3.edit().putBoolean("sdcard", false).commit();
        }
    }
}
