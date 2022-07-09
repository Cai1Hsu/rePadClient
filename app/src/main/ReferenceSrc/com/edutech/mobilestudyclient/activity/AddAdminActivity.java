package com.edutech.mobilestudyclient.activity;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import org.jivesoftware.smackx.Form;

/* loaded from: classes.dex */
public class AddAdminActivity extends Activity {
    private DevicePolicyManager mDPM;
    private ComponentName mDeviceAdmin;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.e("admin", "oncreate");
        this.mDPM = (DevicePolicyManager) getSystemService("device_policy");
        this.mDeviceAdmin = new ComponentName(this, SampleAdmin.class);
        Intent intent = new Intent("android.app.action.ADD_DEVICE_ADMIN");
        intent.putExtra("android.app.extra.DEVICE_ADMIN", this.mDeviceAdmin);
        intent.putExtra("android.app.extra.ADD_EXPLANATION", "Additional text explaining why this needs to be added.");
        startActivityForResult(intent, 0);
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 0) {
            Log.e(Form.TYPE_RESULT, "code:" + resultCode);
            finish();
            Intent intent = new Intent();
            intent.setAction("com.edutech.getadmin");
            sendBroadcast(intent);
        }
    }
}
