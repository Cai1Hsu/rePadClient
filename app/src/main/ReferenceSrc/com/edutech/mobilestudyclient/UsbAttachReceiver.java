package com.edutech.mobilestudyclient;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.widget.Toast;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/UsbAttachReceiver.class */
public class UsbAttachReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Toast.makeText(context, "attach:--" + intent.getAction(), 0).show();
        if (intent.getAction().equals("android.hardware.usb.action.USB_DEVICE_ATTACHED")) {
            context.getSharedPreferences("usbotg", 4).edit().putBoolean("isusbotg", true).commit();
            Toast.makeText(context, "attach:true--", 0).show();
        } else if (!intent.getAction().equals("android.hardware.usb.action.USB_DEVICE_DETACHED")) {
        } else {
            context.getSharedPreferences("usbotg", 4).edit().putBoolean("isusbotg", false).commit();
            Toast.makeText(context, "attach:false--", 0).show();
        }
    }
}
