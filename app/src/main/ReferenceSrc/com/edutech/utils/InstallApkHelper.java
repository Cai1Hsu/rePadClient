package com.edutech.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.MainActivity;
import java.io.File;
import java.util.ArrayList;

/* loaded from: classes.jar:com/edutech/utils/InstallApkHelper.class */
public class InstallApkHelper {
    private Context mContext;
    private String selfPackageName;
    private File[] mFileList = null;
    private ArrayList<String> apkList = null;
    private int nummetod = 0;
    private Thread ApkThread = null;
    private Message msg = null;
    private Handler InstallApkHandler = new Handler() { // from class: com.edutech.utils.InstallApkHelper.1
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    InstallApkUtil.InstallApk(InstallApkHelper.this.mContext, (String) InstallApkHelper.this.apkList.get(0), InstallApkHelper.this.selfPackageName);
                    return;
                default:
                    return;
            }
        }
    };
    private final BroadcastReceiver installReceiver = new BroadcastReceiver() { // from class: com.edutech.utils.InstallApkHelper.2
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.intent.action.PACKAGE_ADDED")) {
                if (InstallApkHelper.this.apkList != null && InstallApkHelper.this.apkList.size() > 0) {
                    InstallApkHelper.this.apkList.remove(0);
                }
                if (InstallApkHelper.this.apkList == null || InstallApkHelper.this.apkList.size() <= 0) {
                    return;
                }
                if (InstallApkHelper.this.ApkThread != null) {
                    InstallApkHelper.this.ApkThread = null;
                }
                InstallApkHelper.this.ApkThread = new Thread(new InstallApkThread(InstallApkHelper.this, null));
                InstallApkHelper.this.ApkThread.start();
            }
        }
    };

    /* loaded from: classes.jar:com/edutech/utils/InstallApkHelper$InstallApkThread.class */
    private class InstallApkThread implements Runnable {
        private InstallApkThread() {
            InstallApkHelper.this = r4;
        }

        /* synthetic */ InstallApkThread(InstallApkHelper installApkHelper, InstallApkThread installApkThread) {
            this();
        }

        @Override // java.lang.Runnable
        public void run() {
            if (InstallApkHelper.this.apkList == null || InstallApkHelper.this.apkList.size() <= 0) {
                return;
            }
            InstallApkHelper.this.mContext.sendBroadcast(new Intent("DISABLEAPKINSTALLLOCK"));
            if (Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0) {
                InstallApkHelper.this.apkinstall_samsung(InstallApkHelper.this.mContext, (String) InstallApkHelper.this.apkList.get(0));
            } else {
                InstallApkHelper.this.apkinstall(InstallApkHelper.this.mContext, (String) InstallApkHelper.this.apkList.get(0));
            }
        }
    }

    public InstallApkHelper(MainActivity mainActivity, String str) {
        this.selfPackageName = "";
        this.selfPackageName = str;
        this.mContext = mainActivity.mContext;
        IntentFilter intentFilter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
        intentFilter.addDataScheme("package");
        this.mContext.registerReceiver(this.installReceiver, intentFilter);
    }

    public void apkinstall(Context context, String str) {
        if (this.nummetod > 0) {
            try {
                switch (this.nummetod) {
                    case 1:
                        if (InstallApkUtil.SlientInstall(str)) {
                            this.msg = this.InstallApkHandler.obtainMessage(1, str);
                            this.InstallApkHandler.sendMessage(this.msg);
                            break;
                        }
                        break;
                    case 2:
                        if (InstallApkUtil.SuSlientInstall(str)) {
                            this.msg = this.InstallApkHandler.obtainMessage(1, str);
                            this.InstallApkHandler.sendMessage(this.msg);
                            break;
                        }
                        break;
                    case 3:
                        this.InstallApkHandler.sendEmptyMessage(0);
                        break;
                }
                return;
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        try {
            if (InstallApkUtil.SlientInstall(str)) {
                this.nummetod = 1;
                this.msg = this.InstallApkHandler.obtainMessage(1, str);
                this.InstallApkHandler.sendMessage(this.msg);
            } else if (InstallApkUtil.SlientInstall(str)) {
                this.nummetod = 1;
                this.msg = this.InstallApkHandler.obtainMessage(1, str);
                this.InstallApkHandler.sendMessage(this.msg);
            } else if (InstallApkUtil.SuSlientInstall(str)) {
                this.nummetod = 2;
                this.msg = this.InstallApkHandler.obtainMessage(1, str);
                this.InstallApkHandler.sendMessage(this.msg);
            } else if (!InstallApkUtil.SuSlientInstall(str)) {
                this.nummetod = 3;
                this.InstallApkHandler.sendEmptyMessage(0);
            } else {
                this.nummetod = 2;
                this.msg = this.InstallApkHandler.obtainMessage(1, str);
                this.InstallApkHandler.sendMessage(this.msg);
            }
        } catch (Exception e2) {
            try {
                if (!InstallApkUtil.SuSlientInstall(str)) {
                    this.nummetod = 3;
                    this.InstallApkHandler.sendEmptyMessage(0);
                } else {
                    this.nummetod = 2;
                    this.msg = this.InstallApkHandler.obtainMessage(1, str);
                    this.InstallApkHandler.sendMessage(this.msg);
                }
            } catch (Exception e3) {
                this.InstallApkHandler.sendEmptyMessage(0);
            }
        }
    }

    public void apkinstall_samsung(Context context, String str) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_INSTALL");
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        context.sendBroadcast(intent);
    }

    private boolean initApksInfo(String str) {
        PackageInfo packageArchiveInfo = this.mContext.getPackageManager().getPackageArchiveInfo(str, 1);
        boolean z = true;
        if (packageArchiveInfo != null) {
            z = true;
            if (packageArchiveInfo.applicationInfo.packageName.equals(this.selfPackageName)) {
                z = false;
            }
        }
        return z;
    }

    public void InstallAll() {
        File file = new File(AppEnvironment.FOLDER_EDUTECH);
        if (this.mFileList != null) {
            this.mFileList = null;
        }
        if (this.apkList != null) {
            this.apkList.clear();
            this.apkList = null;
        }
        if (!file.exists() || !file.isDirectory()) {
            this.mFileList = null;
        } else {
            this.mFileList = file.listFiles();
            this.apkList = new ArrayList<>();
        }
        int i = -1;
        boolean z = false;
        int i2 = -1;
        if (this.mFileList != null) {
            z = false;
            i2 = -1;
            if (this.mFileList.length > 0) {
                z = false;
                for (int i3 = 0; i3 < this.mFileList.length; i3++) {
                    if (this.mFileList[i3].getAbsolutePath().lastIndexOf(".apk") != -1) {
                        if (initApksInfo(this.mFileList[i3].getAbsolutePath())) {
                            this.apkList.add(this.mFileList[i3].getAbsolutePath());
                        } else {
                            z = true;
                            i = i3;
                        }
                    }
                }
                i2 = i;
            }
        }
        if (z && i2 >= 0) {
            this.apkList.add(this.mFileList[i2].getAbsolutePath());
        }
        if (this.apkList != null && this.apkList.size() > 0) {
            this.nummetod = 0;
        }
        if (this.ApkThread != null) {
            this.ApkThread = null;
        }
        this.ApkThread = new Thread(new InstallApkThread(this, null));
        this.ApkThread.start();
    }
}
