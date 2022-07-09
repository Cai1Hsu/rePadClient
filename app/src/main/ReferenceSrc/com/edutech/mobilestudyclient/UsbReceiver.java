package com.edutech.mobilestudyclient;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Environment;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/UsbReceiver.class */
public class UsbReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.intent.action.MEDIA_MOUNTED")) {
            if (Environment.getExternalStorageDirectory().getPath().equals(intent.getData().getPath()) || Build.DISPLAY.contains("S1016PRO") || Build.DISPLAY.contains("M1016Pro") || Build.VERSION.SDK_INT >= 24) {
                return;
            }
            context.getSharedPreferences("sdcard", 4).edit().putBoolean("sdcard", true).commit();
        } else if (intent.getAction().equals("android.intent.action.MEDIA_REMOVED")) {
            context.getSharedPreferences("sdcard", 4).edit().putBoolean("sdcard", false).commit();
        } else if (!intent.getAction().equals("android.intent.action.MEDIA_UNMOUNTED")) {
        } else {
            context.getSharedPreferences("sdcard", 4).edit().putBoolean("sdcard", false).commit();
        }
    }
}
