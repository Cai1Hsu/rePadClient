package com.edutech.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Message;
import com.edutech.idauthentication.AppEnvironment;
import com.edutech.idauthentication.MainActivity;
import java.io.File;
import java.util.ArrayList;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class InstallApkHelper {
    private Context mContext;
    private String selfPackageName;
    private File[] mFileList = null;
    private ArrayList<String> apkList = null;
    private int nummetod = 0;
    private Thread ApkThread = null;
    private Message msg = null;
    private Handler InstallApkHandler = new AnonymousClass1();
    private final BroadcastReceiver installReceiver = new AnonymousClass2();

    static /* synthetic */ ArrayList access$1(InstallApkHelper installApkHelper) {
        return installApkHelper.apkList;
    }

    static /* synthetic */ Thread access$3(InstallApkHelper installApkHelper) {
        return installApkHelper.ApkThread;
    }

    static /* synthetic */ void access$4(InstallApkHelper installApkHelper, Thread thread) {
        installApkHelper.ApkThread = thread;
    }

    static /* synthetic */ Context access$0(InstallApkHelper installApkHelper) {
        return installApkHelper.mContext;
    }

    static /* synthetic */ String access$2(InstallApkHelper installApkHelper) {
        return installApkHelper.selfPackageName;
    }

    public InstallApkHelper(MainActivity mainActivity, String packageName) {
        this.selfPackageName = "";
        this.selfPackageName = packageName;
        this.mContext = mainActivity.mContext;
        IntentFilter filter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
        filter.addDataScheme("package");
        this.mContext.registerReceiver(this.installReceiver, filter);
    }

    public void InstallAll() {
        File apkFolder = new File(AppEnvironment.FOLDER_EDUTECH);
        if (this.mFileList != null) {
            this.mFileList = null;
        }
        if (this.apkList != null) {
            this.apkList.clear();
            this.apkList = null;
        }
        if (apkFolder.exists() && apkFolder.isDirectory()) {
            this.mFileList = apkFolder.listFiles();
            this.apkList = new ArrayList<>();
        } else {
            this.mFileList = null;
        }
        boolean haveself = false;
        int j = -1;
        if (this.mFileList != null && this.mFileList.length > 0) {
            for (int i = 0; i < this.mFileList.length; i++) {
                String path = this.mFileList[i].getAbsolutePath();
                if (path.lastIndexOf(".apk") != -1) {
                    if (initApksInfo(this.mFileList[i].getAbsolutePath())) {
                        this.apkList.add(this.mFileList[i].getAbsolutePath());
                    } else {
                        haveself = true;
                        j = i;
                    }
                }
            }
        }
        if (haveself && j >= 0) {
            this.apkList.add(this.mFileList[j].getAbsolutePath());
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

    private boolean initApksInfo(String path) {
        PackageManager pm = this.mContext.getPackageManager();
        PackageInfo info = pm.getPackageArchiveInfo(path, 1);
        if (info != null) {
            ApplicationInfo appInfo = info.applicationInfo;
            String packageName = appInfo.packageName;
            return !packageName.equals(this.selfPackageName);
        }
        return true;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private class InstallApkThread implements Runnable {
        private InstallApkThread() {
            InstallApkHelper.this = r1;
        }

        /* synthetic */ InstallApkThread(InstallApkHelper installApkHelper, InstallApkThread installApkThread) {
            this();
        }

        @Override // java.lang.Runnable
        public void run() {
            if (InstallApkHelper.access$1(InstallApkHelper.this) != null && InstallApkHelper.access$1(InstallApkHelper.this).size() > 0) {
                Intent intentDisApkLck = new Intent("DISABLEAPKINSTALLLOCK");
                InstallApkHelper.access$0(InstallApkHelper.this).sendBroadcast(intentDisApkLck);
                if (Build.DISPLAY.indexOf("N5110ZB") < 0 && Build.DISPLAY.indexOf(".T360Z") < 0) {
                    InstallApkHelper.access$5(InstallApkHelper.this, InstallApkHelper.access$0(InstallApkHelper.this), (String) InstallApkHelper.access$1(InstallApkHelper.this).get(0));
                } else {
                    InstallApkHelper.access$6(InstallApkHelper.this, InstallApkHelper.access$0(InstallApkHelper.this), (String) InstallApkHelper.access$1(InstallApkHelper.this).get(0));
                }
            }
        }
    }

    static /* synthetic */ void access$6(InstallApkHelper installApkHelper, Context context, String str) {
        installApkHelper.apkinstall_samsung(context, str);
    }

    private void apkinstall_samsung(Context context, String apkpath) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_INSTALL");
        intent.setDataAndType(Uri.fromFile(new File(apkpath)), "application/vnd.android.package-archive");
        context.sendBroadcast(intent);
    }

    static /* synthetic */ void access$5(InstallApkHelper installApkHelper, Context context, String str) {
        installApkHelper.apkinstall(context, str);
    }

    private void apkinstall(Context context, String apkpath) {
        if (this.nummetod > 0) {
            try {
                switch (this.nummetod) {
                    case 1:
                        if (InstallApkUtil.SlientInstall(apkpath)) {
                            this.msg = this.InstallApkHandler.obtainMessage(1, apkpath);
                            this.InstallApkHandler.sendMessage(this.msg);
                            break;
                        }
                        break;
                    case 2:
                        if (InstallApkUtil.SuSlientInstall(apkpath)) {
                            this.msg = this.InstallApkHandler.obtainMessage(1, apkpath);
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
            if (!InstallApkUtil.SlientInstall(apkpath)) {
                if (!InstallApkUtil.SlientInstall(apkpath)) {
                    if (!InstallApkUtil.SuSlientInstall(apkpath)) {
                        if (!InstallApkUtil.SuSlientInstall(apkpath)) {
                            this.nummetod = 3;
                            this.InstallApkHandler.sendEmptyMessage(0);
                        } else {
                            this.nummetod = 2;
                            this.msg = this.InstallApkHandler.obtainMessage(1, apkpath);
                            this.InstallApkHandler.sendMessage(this.msg);
                        }
                    } else {
                        this.nummetod = 2;
                        this.msg = this.InstallApkHandler.obtainMessage(1, apkpath);
                        this.InstallApkHandler.sendMessage(this.msg);
                    }
                } else {
                    this.nummetod = 1;
                    this.msg = this.InstallApkHandler.obtainMessage(1, apkpath);
                    this.InstallApkHandler.sendMessage(this.msg);
                }
            } else {
                this.nummetod = 1;
                this.msg = this.InstallApkHandler.obtainMessage(1, apkpath);
                this.InstallApkHandler.sendMessage(this.msg);
            }
        } catch (Exception e2) {
            try {
                if (!InstallApkUtil.SuSlientInstall(apkpath)) {
                    this.nummetod = 3;
                    this.InstallApkHandler.sendEmptyMessage(0);
                } else {
                    this.nummetod = 2;
                    this.msg = this.InstallApkHandler.obtainMessage(1, apkpath);
                    this.InstallApkHandler.sendMessage(this.msg);
                }
            } catch (Exception e3) {
                this.InstallApkHandler.sendEmptyMessage(0);
            }
        }
    }

    /* renamed from: com.edutech.utils.InstallApkHelper$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 extends Handler {
        AnonymousClass1() {
            InstallApkHelper.this = r1;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 0:
                    InstallApkUtil.InstallApk(InstallApkHelper.access$0(InstallApkHelper.this), (String) InstallApkHelper.access$1(InstallApkHelper.this).get(0), InstallApkHelper.access$2(InstallApkHelper.this));
                    return;
                default:
                    return;
            }
        }
    }

    /* renamed from: com.edutech.utils.InstallApkHelper$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 extends BroadcastReceiver {
        AnonymousClass2() {
            InstallApkHelper.this = r1;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (action.equals("android.intent.action.PACKAGE_ADDED")) {
                if (InstallApkHelper.access$1(InstallApkHelper.this) != null && InstallApkHelper.access$1(InstallApkHelper.this).size() > 0) {
                    InstallApkHelper.access$1(InstallApkHelper.this).remove(0);
                }
                if (InstallApkHelper.access$1(InstallApkHelper.this) != null && InstallApkHelper.access$1(InstallApkHelper.this).size() > 0) {
                    if (InstallApkHelper.access$3(InstallApkHelper.this) != null) {
                        InstallApkHelper.access$4(InstallApkHelper.this, null);
                    }
                    InstallApkHelper.access$4(InstallApkHelper.this, new Thread(new InstallApkThread(InstallApkHelper.this, null)));
                    InstallApkHelper.access$3(InstallApkHelper.this).start();
                }
            }
        }
    }
}
