package com.edutech.appmanage.utils;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import java.io.File;
import java.util.ArrayList;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class Delete_APKfile extends Service {
    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        ArrayList<String> delete_apkfile = intent.getStringArrayListExtra("deletefile");
        for (int i = 0; i < delete_apkfile.size(); i++) {
            File file = new File(delete_apkfile.get(i));
            if (file.isFile() && file.exists()) {
                file.delete();
            }
        }
        String iconpath = intent.getStringExtra("deleteicon");
        File fileicon = new File(iconpath);
        File[] icons = fileicon.listFiles();
        if (icons != null) {
            for (int i2 = 0; i2 < icons.length; i2++) {
                if (icons[i2].isFile() && icons[i2].exists()) {
                    icons[i2].delete();
                }
            }
        }
        ArrayList<String> install_num = intent.getStringArrayListExtra("install");
        String apkpath = intent.getStringExtra("deleteapks");
        File apk = new File(apkpath);
        File[] apks = apk.listFiles();
        boolean exist = false;
        if (apks != null && apks.length > 0) {
            for (int i3 = 0; i3 < apks.length; i3++) {
                if (apks[i3].isFile() && apks[i3].exists()) {
                    int j = 0;
                    while (true) {
                        if (j >= install_num.size()) {
                            break;
                        }
                        if (!apks[i3].getName().equals(new File(install_num.get(j)).getName())) {
                            j++;
                        } else {
                            exist = true;
                            break;
                        }
                    }
                    if (!exist) {
                        apks[i3].delete();
                    }
                }
            }
        }
        stopSelf();
        return super.onStartCommand(intent, flags, startId);
    }
}
