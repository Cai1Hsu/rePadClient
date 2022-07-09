package com.edutech.appmanage.utils;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import java.io.File;
import java.util.ArrayList;

/* loaded from: classes.jar:com/edutech/appmanage/utils/Delete_APKfile.class */
public class Delete_APKfile extends Service {
    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        ArrayList<String> stringArrayListExtra = intent.getStringArrayListExtra("deletefile");
        for (int i3 = 0; i3 < stringArrayListExtra.size(); i3++) {
            File file = new File(stringArrayListExtra.get(i3));
            if (file.isFile() && file.exists()) {
                file.delete();
            }
        }
        File[] listFiles = new File(intent.getStringExtra("deleteicon")).listFiles();
        if (listFiles != null) {
            for (int i4 = 0; i4 < listFiles.length; i4++) {
                if (listFiles[i4].isFile() && listFiles[i4].exists()) {
                    listFiles[i4].delete();
                }
            }
        }
        ArrayList<String> stringArrayListExtra2 = intent.getStringArrayListExtra("install");
        File[] listFiles2 = new File(intent.getStringExtra("deleteapks")).listFiles();
        boolean z = false;
        if (listFiles2 != null && listFiles2.length > 0) {
            int i5 = 0;
            while (i5 < listFiles2.length) {
                boolean z2 = z;
                if (listFiles2[i5].isFile()) {
                    z2 = z;
                    if (listFiles2[i5].exists()) {
                        int i6 = 0;
                        while (true) {
                            if (i6 >= stringArrayListExtra2.size()) {
                                break;
                            }
                            if (listFiles2[i5].getName().equals(new File(stringArrayListExtra2.get(i6)).getName())) {
                                z = true;
                                break;
                            }
                            i6++;
                        }
                        z2 = z;
                        if (!z) {
                            listFiles2[i5].delete();
                            z2 = z;
                        }
                    }
                }
                i5++;
                z = z2;
            }
        }
        stopSelf();
        return super.onStartCommand(intent, i, i2);
    }
}
