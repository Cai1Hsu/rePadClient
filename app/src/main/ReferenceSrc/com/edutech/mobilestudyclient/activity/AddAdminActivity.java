package com.edutech.mobilestudyclient.activity;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import org.jivesoftware.smackx.Form;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/AddAdminActivity.class */
public class AddAdminActivity extends Activity {
    private DevicePolicyManager mDPM;
    private ComponentName mDeviceAdmin;

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        if (i == 0) {
            Log.e(Form.TYPE_RESULT, "code:" + i2);
            finish();
            Intent intent2 = new Intent();
            intent2.setAction("com.edutech.getadmin");
            sendBroadcast(intent2);
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Log.e("admin", "oncreate");
        this.mDPM = (DevicePolicyManager) getSystemService("device_policy");
        this.mDeviceAdmin = new ComponentName(this, SampleAdmin.class);
        Intent intent = new Intent("android.app.action.ADD_DEVICE_ADMIN");
        intent.putExtra("android.app.extra.DEVICE_ADMIN", this.mDeviceAdmin);
        intent.putExtra("android.app.extra.ADD_EXPLANATION", "Additional text explaining why this needs to be added.");
        startActivityForResult(intent, 0);
    }
}
