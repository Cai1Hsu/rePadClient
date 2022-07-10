package com.edutech.mobilestudyclient;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.widget.Toast;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class UsbAttachReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context arg0, Intent intent) {
        Toast.makeText(arg0, "attach:--" + intent.getAction(), 0).show();
        if (intent.getAction().equals("android.hardware.usb.action.USB_DEVICE_ATTACHED")) {
            SharedPreferences sp = arg0.getSharedPreferences("usbotg", 4);
            sp.edit().putBoolean("isusbotg", true).commit();
            Toast.makeText(arg0, "attach:true--", 0).show();
        } else if (intent.getAction().equals("android.hardware.usb.action.USB_DEVICE_DETACHED")) {
            SharedPreferences sp2 = arg0.getSharedPreferences("usbotg", 4);
            sp2.edit().putBoolean("isusbotg", false).commit();
            Toast.makeText(arg0, "attach:false--", 0).show();
        }
    }
}
