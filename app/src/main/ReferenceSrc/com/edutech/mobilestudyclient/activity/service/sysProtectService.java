package com.edutech.mobilestudyclient.activity.service;

import android.annotation.SuppressLint;
import android.app.AlarmManager;
import android.app.Dialog;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.app.mia.MiaMdmPolicyManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.IBinder;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.TextView;
import com.edutech.appmanage.utils.ApkController;
import com.edutech.appmanage.utils.ShellUtils;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.mobilestudyclient.UsbReceiver;
import com.edutech.publicedu.log.LogHelp;
import com.edutech.utils.InstallApkUtil;
import com.huawei.android.app.admin.HwDevicePolicyManager;
import com.launcher.activity.R;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import org.apache.commons.net.nntp.NNTP;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/service/sysProtectService.class */
public class sysProtectService extends Service {
    public static final String ADDINSTALL = "com.launch.addapks";
    public static final int FOREGROUND_ID = 0;
    public static final String INSTALL = "com.edutech.install";
    public static final String INSTALLAPK = "com.launch.install";
    public static final String Intent_STATUSBAR_INVISIBILITY = "android.intent.action.STATUSBAR_INVISIBILITY";
    public static final String Intent_STATUSBAR_VISIBILITY = "android.intent.action.STATUSBAR_VISIBILITY";
    public static final String OFF_LIVE_SHOW = "com.edutech.liveshow.off";
    public static final String ON_LIVE_SHOW = "com.edutech.liveshow.on";
    public static final String RESTART_TIMER = "com.edutech.restarttimer";
    public static final String SERVICE_START = "com.edutech.startservice";
    public static final String Samsung_MDM = "android.intent.action.mdm";
    public static final String TAG = "LockTask";
    public static final String UNSTALLAPK = "com.launch.uninstall";
    public static final String USEDESIGNDESKTOP = "com.edutech.design";
    private static final String YJ_HIDE_FLOATVIEW = "android.yj.hide.floatview";
    private static final String YJ_SHOW_FLOATVIEW = "android.yj.show.floatview";
    private ComponentName cn;
    sysProtectTimer lockTask;
    logUploadTimer logUploadTask;
    private ComponentName mDeviceAdmin;
    private HwDevicePolicyManager mHwPDM;
    private Timer mTimer;
    private Timer mTimerLogUpload;
    private UsbReceiver usbReceiver;
    private Dialog blackDialog = null;
    private List<String> addedApps = new ArrayList();
    private BroadcastReceiver BlackDialogReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.service.sysProtectService.1
        /* JADX WARN: Code restructure failed: missing block: B:7:0x0038, code lost:
            if (r0.equals("") != false) goto L8;
         */
        @Override // android.content.BroadcastReceiver
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void onReceive(Context context, Intent intent) {
            String str;
            String action = intent.getAction();
            Log.i("NetworkService", "action = " + action);
            if (action.equals(AppEnvironment.Intent_LOCKWINDOW)) {
                String stringExtra = intent.getStringExtra("state");
                if (stringExtra != null) {
                    str = stringExtra;
                }
                str = LogHelp.TYPE_MYWORK;
                sysProtectService.this.showDialog(str);
            } else if (!action.equals(AppEnvironment.Intent_UNLOCKWINDOW) || sysProtectService.this.blackDialog == null || !sysProtectService.this.blackDialog.isShowing()) {
            } else {
                sysProtectService.this.blackDialog.dismiss();
                sysProtectService.this.blackDialog = null;
            }
        }
    };
    private final BroadcastReceiver APKInstallReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.service.sysProtectService.2
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            PackageInfo packageInfo;
            PackageInfo packageInfo2;
            PackageInfo packageInfo3;
            String action = intent.getAction();
            Log.i("APKInstallReceiver", "action = " + action);
            if (!action.equals("android.intent.action.PACKAGE_ADDED")) {
                if (!action.equals("android.intent.action.PACKAGE_REMOVED")) {
                    return;
                }
                String dataString = intent.getDataString();
                System.out.println("卸载了:" + dataString + "包名的程序");
                if (dataString == null || !dataString.contains("com.edutech.firewall")) {
                    return;
                }
                boolean z = AppEnvironment.openBMD;
                return;
            }
            ArrayList arrayList = new ArrayList();
            arrayList.add("com.launcher.activity");
            arrayList.add("dolphin.video.players");
            arrayList.add("com.onlinesys.student");
            arrayList.add("com.google.android.inputmethod.pinyin");
            arrayList.add("com.akson.timeep");
            arrayList.add("com.akson.timeepstudent");
            arrayList.add("com.webgenie.swf.play");
            arrayList.add("com.ashleytech.falswf");
            arrayList.add("cn.wps.moffice_eng");
            if (AppEnvironment.isDEMO) {
                arrayList.add("com.lejent.zuoyeshenqi.afanti");
                arrayList.add("com.A17zuoye.mobile.homework");
                arrayList.add("com.jinxin.namibox");
                arrayList.add("com.haojiazhang.activity");
                arrayList.add(AppEnvironment.YOUDAO_PACKNAME);
                arrayList.add("org.hisand.zidian.zhs");
                arrayList.add("com.record.ing");
                arrayList.add("com.xueersi.parentsmeeting");
                arrayList.add("com.hjwordgames");
            }
            String dataString2 = intent.getDataString();
            System.out.println("安装了:" + dataString2 + "包名的程序");
            String replace = dataString2.replace("package:", "");
            boolean z2 = sysProtectService.this.addedApps != null && sysProtectService.this.addedApps.contains(replace);
            if (!(replace.contains("com.edutech") || replace.contains("com.launcher.activity") || arrayList.contains(replace)) && !z2) {
                sysProtectService.uninstall(replace, sysProtectService.this.getApplicationContext());
            }
            if (replace != null && replace.contains("com.edutech.firewall")) {
                Intent intent2 = new Intent();
                intent2.setAction("com.edutech.intent.TrafficStatsService");
                intent2.setClassName("com.edutech.firewall", "eu.faircode.netguard.TrafficStatsService");
                sysProtectService.this.startService(intent2);
                Log.i("APKInstallReceiver", "send service ");
            }
            if (sysProtectService.this.logUploadTask != null && !replace.contains("com.edutech") && !replace.contains("dolphin.video.players") && !replace.contains("cn.wps.moffice_eng") && !replace.contains("com.webgenie.swf.play")) {
                logUploadTimer.invalidApkInstall = true;
                SharedPreferences sharedPreferences = sysProtectService.this.getSharedPreferences("lockscreen", 0);
                AppEnvironment.installOtherAppTime = System.currentTimeMillis();
                sharedPreferences.edit().putLong("installtime", AppEnvironment.installOtherAppTime).commit();
                sharedPreferences.edit().putString("installpkg", replace).commit();
            }
            if (replace.contains("com.edutech.assistantdemo")) {
                Intent intent3 = new Intent("android.intent.action.MAIN");
                intent3.addFlags(268435456);
                intent3.setComponent(new ComponentName("com.edutech.assistantdemo", "com.edutech.assistantdemo.MainActivity"));
                try {
                    packageInfo3 = sysProtectService.this.getPackageManager().getPackageInfo("com.edutech.assistantdemo", 0);
                } catch (PackageManager.NameNotFoundException e) {
                    packageInfo3 = null;
                    e.printStackTrace();
                }
                if (packageInfo3 == null) {
                    return;
                }
                sysProtectService.this.startActivity(intent3);
            } else if (replace.contains("com.edutech.screenshot")) {
                Intent intent4 = new Intent("android.intent.action.MAIN");
                intent4.addFlags(268435456);
                intent4.setComponent(new ComponentName("com.edutech.screenshot", "com.edutech.screenshot.ScreenShotActivity"));
                try {
                    packageInfo2 = sysProtectService.this.getPackageManager().getPackageInfo("com.edutech.screenshot", 0);
                } catch (PackageManager.NameNotFoundException e2) {
                    packageInfo2 = null;
                    e2.printStackTrace();
                }
                if (packageInfo2 != null) {
                    sysProtectService.this.startActivity(intent4);
                }
                sysProtectService.this.getSharedPreferences("screenshot", 0).edit().putBoolean("opened", true).commit();
            } else if (!replace.contains("com.edutech.lockscreen")) {
            } else {
                Intent intent5 = new Intent("android.intent.action.MAIN");
                intent5.addFlags(268435456);
                intent5.setComponent(new ComponentName("com.edutech.lockscreen", "com.edutech.lockscreen.MainActivity"));
                try {
                    packageInfo = sysProtectService.this.getPackageManager().getPackageInfo("com.edutech.lockscreen", 0);
                } catch (PackageManager.NameNotFoundException e3) {
                    packageInfo = null;
                    e3.printStackTrace();
                }
                if (packageInfo != null) {
                    sysProtectService.this.startActivity(intent5);
                }
                sysProtectService.this.getSharedPreferences("screenshot", 0).edit().putBoolean("locked", true).commit();
            }
        }
    };
    private final BroadcastReceiver NetworkReceiver = new BroadcastReceiver() { // from class: com.edutech.mobilestudyclient.activity.service.sysProtectService.3
        @Override // android.content.BroadcastReceiver
        @SuppressLint({"InlinedApi"})
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            Log.i("NetworkService", "action = " + action);
            if (action.equals("PASSWDPASS")) {
                sysProtectTimer.flag = false;
            } else if (action.equals("android.intent.action.STATUSBAR_INVISIBILITY")) {
                sysProtectTimer.isInteraction = true;
            } else if (action.equals("android.intent.action.STATUSBAR_VISIBILITY")) {
                sysProtectTimer.isInteraction = false;
            } else if (!action.equals("android.intent.action.mdm")) {
                if (action.equals("ENTERPASS")) {
                    sysProtectTimer.flag = true;
                } else if (action.equals(sysProtectService.INSTALL)) {
                    sysProtectTimer.flag = false;
                } else if (action.equals(sysProtectService.INSTALLAPK)) {
                    String stringExtra = intent.getStringExtra("apkpath");
                    String stringExtra2 = intent.getStringExtra("packagename");
                    if (sysProtectService.this.addedApps == null) {
                        sysProtectService.this.addedApps = new ArrayList();
                    }
                    if (stringExtra2 != null && !stringExtra2.equals("") && !sysProtectService.this.addedApps.contains(stringExtra2)) {
                        sysProtectService.this.addedApps.add(stringExtra2);
                    }
                    sysProtectService.this.installNewApk(stringExtra);
                } else if (action.equals(sysProtectService.UNSTALLAPK)) {
                    sysProtectService.uninstall(intent.getStringExtra("packagename"), sysProtectService.this.getApplicationContext());
                } else if (action.equals(sysProtectService.ADDINSTALL)) {
                    ArrayList<String> stringArrayListExtra = intent.getStringArrayListExtra("packages");
                    if (sysProtectService.this.addedApps == null) {
                        sysProtectService.this.addedApps = new ArrayList();
                    }
                    if (stringArrayListExtra == null || stringArrayListExtra.size() <= 0) {
                        return;
                    }
                    for (int i = 0; i < stringArrayListExtra.size(); i++) {
                        try {
                            if (!sysProtectService.this.addedApps.contains(stringArrayListExtra.get(i))) {
                                sysProtectService.this.addedApps.add(stringArrayListExtra.get(i));
                            }
                        } catch (Exception e) {
                            return;
                        }
                    }
                } else if (action.equals(sysProtectService.USEDESIGNDESKTOP)) {
                    sysProtectService.this.getSharedPreferences("design", 4).edit().putBoolean("usedesign", true).commit();
                } else if (!action.equals(sysProtectService.RESTART_TIMER)) {
                    if (!action.equals(sysProtectService.ON_LIVE_SHOW)) {
                        if (!action.equals(sysProtectService.OFF_LIVE_SHOW)) {
                            return;
                        }
                        sysProtectTimer.isLiveShow = false;
                        sysProtectService.this.getSharedPreferences("livemode", 0).edit().putBoolean("islive", false).commit();
                        return;
                    }
                    sysProtectTimer.isLiveShow = true;
                    sysProtectService.this.getSharedPreferences("livemode", 0).edit().putBoolean("islive", true).commit();
                    Intent intent2 = new Intent();
                    intent2.setAction(sysProtectService.YJ_HIDE_FLOATVIEW);
                    sysProtectService.this.sendBroadcast(intent2);
                } else {
                    if (sysProtectService.this.mTimer != null) {
                        sysProtectService.this.lockTask.cancel();
                        sysProtectService.this.mTimer.cancel();
                        sysProtectService.this.mTimer.purge();
                        sysProtectService.this.mTimer = null;
                        sysProtectService.this.lockTask = null;
                    }
                    if (sysProtectService.this.mTimerLogUpload != null) {
                        sysProtectService.this.logUploadTask.cancel();
                        sysProtectService.this.mTimerLogUpload.cancel();
                        sysProtectService.this.mTimerLogUpload.purge();
                        sysProtectService.this.mTimerLogUpload = null;
                        sysProtectService.this.logUploadTask = null;
                    }
                    sysProtectService.this.startTimer();
                }
            }
        }
    };

    public static boolean SlientInstall(String str) throws IOException {
        boolean z;
        Process exec = Runtime.getRuntime().exec("pm install -r " + str);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            } else {
                sb.append(readLine);
            }
        }
        if (exec.waitFor() != 0) {
            System.err.println("exit value = " + exec.exitValue());
        }
        if (sb.toString().equals("Success")) {
            Log.d("InstallApkUtil", "SlientInstall success");
            z = true;
        } else {
            Log.d("InstallApkUtil", "SlientInstall failed");
            z = false;
        }
        return z;
    }

    private void apkIntentInstall(String str) {
        Intent intent = new Intent();
        intent.setAction(INSTALL);
        sendBroadcast(intent);
        Intent intent2 = new Intent("android.intent.action.VIEW");
        intent2.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        intent2.setFlags(268435456);
        startActivity(intent2);
    }

    private static void apkIntentUninstall(String str, Context context) {
        Intent intent = new Intent();
        intent.setAction(INSTALL);
        context.sendBroadcast(intent);
        Intent intent2 = new Intent("android.intent.action.DELETE", Uri.parse("package:" + str));
        intent2.addFlags(268435456);
        context.startActivity(intent2);
    }

    private static void apkUninstall(String str, Context context) {
        Log.e("uninstall", "apkUninstall enter");
        try {
            if (!InstallApkUtil.SuSlientUninstall(str)) {
                Log.e("uninstall", "SuSlientUninstall 1 false");
                if (!InstallApkUtil.SlientUninstall(str)) {
                    Log.e("uninstall", "SlientUninstall 1 false");
                    apkIntentUninstall(str, context);
                } else {
                    Log.d("sysService", String.valueOf(str) + ":SlientInstall卸载成功！");
                }
            } else {
                Log.d("sysService", String.valueOf(str) + ":SuSlientInstall卸载成功！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (!InstallApkUtil.SuSlientUninstall(str)) {
                    apkIntentUninstall(str, context);
                    Log.d("uninstall", String.valueOf(str) + ":apkIntentUninstall卸载！");
                } else {
                    Log.d("sysService", String.valueOf(str) + ":SuSlientInstall卸载成功！");
                }
            } catch (Exception e2) {
                apkIntentUninstall(str, context);
                Log.d("uninstall", String.valueOf(str) + ":apkIntentUninstall卸载！");
            }
        }
    }

    private void apkinstall(String str) {
        try {
            if (InstallApkUtil.SlientInstall(str)) {
                Log.d("sysService", String.valueOf(str) + ":SlientInstall安装成功！");
            } else if (!InstallApkUtil.SuSlientInstall(str)) {
                apkIntentInstall(str);
            } else {
                Log.d("sysService", String.valueOf(str) + ":SuSlientInstall安装成功！");
            }
        } catch (Exception e) {
            try {
                if (!InstallApkUtil.SuSlientInstall(str)) {
                    apkIntentInstall(str);
                } else {
                    Log.d("sysService", String.valueOf(str) + ":SuSlientInstall安装成功！");
                }
            } catch (Exception e2) {
                apkIntentInstall(str);
                Log.d("sysService", String.valueOf(str) + ":InstallApk安装成功！");
            }
        }
    }

    private void apkinstall_samsung(String str) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_INSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent.putExtra("uri", str);
        } else {
            intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        }
        sendBroadcast(intent);
    }

    private static void apkuninstall_samsung(String str, Context context) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_UNINSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent.putExtra("pgk", str);
        } else {
            intent.setData(Uri.parse("package://" + str));
        }
        context.sendBroadcast(intent);
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:30:0x0004 */
    /* JADX DEBUG: Multi-variable search result rejected for r5v7, resolved type: java.lang.StringBuilder */
    /* JADX WARN: Multi-variable type inference failed */
    private static boolean clientInstall(String str) {
        Process process;
        Throwable th;
        Exception e;
        boolean z;
        PrintWriter printWriter;
        Process process2 = null;
        Process process3 = null;
        try {
            try {
                process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                process3 = process;
                printWriter = new PrintWriter(process.getOutputStream());
            } catch (Throwable th2) {
                th = th2;
                process = process2 == 1 ? 1 : 0;
            }
        } catch (Exception e2) {
            e = e2;
            process = process3;
        }
        try {
            printWriter.println("chmod 777 " + str);
            printWriter.println("export LD_LIBRARY_PATH=/vendor/lib:/system/lib");
            StringBuilder sb = new StringBuilder("pm install -r ");
            printWriter.println(sb.append(str).toString());
            printWriter.flush();
            printWriter.close();
            z = returnResult(process.waitFor());
            process2 = sb;
            if (process != null) {
                process.destroy();
                process2 = sb;
            }
        } catch (Exception e3) {
            e = e3;
            process2 = process;
            e.printStackTrace();
            if (process != null) {
                process.destroy();
            }
            z = false;
            return z;
        } catch (Throwable th3) {
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
        return z;
    }

    public void installNewApk(String str) {
        if (str == null) {
            return;
        }
        MiaMdmPolicyManager miaMdmPolicyManager = new MiaMdmPolicyManager(getApplicationContext());
        boolean z = false;
        try {
            z = this.mHwPDM.isRecentTaskButtonDisabled(this.cn);
        } catch (Exception e) {
            Log.e("exception", e.getMessage());
            e.printStackTrace();
        }
        if (str.lastIndexOf(".apk") == -1) {
            return;
        }
        if (z) {
            try {
                this.mHwPDM.installPackage(this.cn, str);
                Log.e("aaaa", "bbbbbb");
            } catch (Exception e2) {
            }
        } else if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
            miaMdmPolicyManager.silentInstall(str);
        } else {
            try {
                if (getApplicationContext() != null) {
                    if (Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P583") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0) {
                        Log.e("apkinstall", "apkinstall_samsung");
                        apkinstall_samsung(str);
                    } else {
                        Log.e("apkinstall", "apkinstall");
                        apkinstall(str);
                    }
                }
            } catch (Exception e3) {
            }
        }
    }

    private static boolean returnResult(int i) {
        boolean z = true;
        if (i != 0) {
            z = i == 1 ? false : false;
        }
        return z;
    }

    public void startTimer() {
        Log.v("LockTask", "startTimer");
        if (this.mTimer == null) {
            this.mTimer = new Timer();
            this.lockTask = new sysProtectTimer(this);
            this.mTimer.schedule(this.lockTask, 50L, 100L);
        }
        SharedPreferences sharedPreferences = getSharedPreferences("livemode", 0);
        sysProtectTimer.isLiveShow = sharedPreferences.getBoolean("islive", false);
        if (this.mTimerLogUpload == null) {
            this.mTimerLogUpload = new Timer();
            this.logUploadTask = new logUploadTimer(this);
            this.mTimerLogUpload.schedule(this.logUploadTask, 50L, 300000L);
        }
        sharedPreferences.edit().putBoolean("islive", true).commit();
    }

    public static boolean uninstall(String str, Context context) {
        boolean z;
        if (str == null) {
            z = false;
        } else {
            boolean z2 = false;
            ComponentName componentName = new ComponentName("com.launcher.activity", ApkController.class.getSimpleName());
            HwDevicePolicyManager hwDevicePolicyManager = new HwDevicePolicyManager(context);
            MiaMdmPolicyManager miaMdmPolicyManager = new MiaMdmPolicyManager(context);
            try {
                z2 = hwDevicePolicyManager.isRecentTaskButtonDisabled(componentName);
            } catch (Exception e) {
                Log.e("exception", e.getMessage());
                e.printStackTrace();
            }
            if (z2) {
                try {
                    hwDevicePolicyManager.uninstallPackage(componentName, str, true);
                    z = true;
                } catch (Exception e2) {
                    z = false;
                }
            } else if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
                miaMdmPolicyManager.silentUnInstall(str);
                z = true;
            } else {
                try {
                    if (Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P583") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0) {
                        apkuninstall_samsung(str, context);
                    } else {
                        Log.e("uninstall", "apkUninstall");
                        apkUninstall(str, context);
                    }
                    z = true;
                } catch (Exception e3) {
                    z = false;
                }
            }
        }
        return z;
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0194 -> B:12:0x00a3). Please submit an issue!!! */
    @Override // android.app.Service
    @SuppressLint({"InlinedApi"})
    public void onCreate() {
        Log.v("LockTask", "onCreate");
        super.onCreate();
        startForeground(0, new Notification());
        this.cn = new ComponentName("com.example.demo", "MainActivity");
        this.mHwPDM = new HwDevicePolicyManager(this);
        try {
            Log.e("exception", new StringBuilder(String.valueOf(this.mHwPDM.isRecentTaskButtonDisabled(this.cn))).toString());
            if (!this.mHwPDM.isRecentTaskButtonDisabled(this.cn)) {
                this.mHwPDM.setRecentTaskButtonDisabled(this.cn, true);
            }
            if (!this.mHwPDM.isStatusBarExpandPanelDisabled(this.cn)) {
                this.mHwPDM.setStatusBarExpandPanelDisabled(this.cn, true);
            }
            this.mHwPDM.setSafeModeDisabled(this.cn, true);
            this.mHwPDM.setBluetoothDisabled(this.cn, true);
        } catch (Exception e) {
            Log.e("exception", e.getMessage());
            e.printStackTrace();
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("PASSWDPASS");
        intentFilter.addAction("ENTERPASS");
        intentFilter.addAction("android.intent.action.STATUSBAR_INVISIBILITY");
        intentFilter.addAction("android.intent.action.STATUSBAR_VISIBILITY");
        intentFilter.addAction("android.intent.action.mdm");
        intentFilter.addAction(INSTALL);
        intentFilter.addAction(INSTALLAPK);
        intentFilter.addAction(UNSTALLAPK);
        intentFilter.addAction(ADDINSTALL);
        intentFilter.addAction(RESTART_TIMER);
        intentFilter.addAction("android.intent.action.MEDIA_MOUNTED");
        intentFilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
        intentFilter.addAction(USEDESIGNDESKTOP);
        intentFilter.addAction(ON_LIVE_SHOW);
        intentFilter.addAction(OFF_LIVE_SHOW);
        registerReceiver(this.NetworkReceiver, intentFilter);
        IntentFilter intentFilter2 = new IntentFilter();
        intentFilter2.addAction("android.intent.action.PACKAGE_ADDED");
        intentFilter2.addAction("android.intent.action.PACKAGE_REMOVED");
        intentFilter2.addDataScheme("package");
        registerReceiver(this.APKInstallReceiver, intentFilter2);
        IntentFilter intentFilter3 = new IntentFilter();
        intentFilter3.addAction(AppEnvironment.Intent_LOCKWINDOW);
        intentFilter3.addAction(AppEnvironment.Intent_UNLOCKWINDOW);
        registerReceiver(this.BlackDialogReceiver, intentFilter3);
        this.usbReceiver = new UsbReceiver();
        IntentFilter intentFilter4 = new IntentFilter();
        intentFilter4.addAction("android.intent.action.MEDIA_MOUNTED");
        intentFilter4.addAction("android.intent.action.MEDIA_MOUNTED");
        registerReceiver(this.usbReceiver, intentFilter4);
        sendBroadcast(new Intent(SERVICE_START));
    }

    @Override // android.app.Service
    public void onDestroy() {
        Log.v("LockTask", "onDestroy");
        stopForeground(true);
        if (this.mTimer != null) {
            this.lockTask.cancel();
            this.mTimer.cancel();
            this.mTimer.purge();
            this.mTimer = null;
            this.lockTask = null;
        }
        if (this.mTimerLogUpload != null) {
            this.logUploadTask.cancel();
            this.mTimerLogUpload.cancel();
            this.mTimerLogUpload.purge();
            this.mTimerLogUpload = null;
            this.logUploadTask = null;
        }
        unregisterReceiver(this.NetworkReceiver);
        unregisterReceiver(this.APKInstallReceiver);
        unregisterReceiver(this.BlackDialogReceiver);
        unregisterReceiver(this.usbReceiver);
        super.onDestroy();
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        startTimer();
        Log.v("LockTask", "onStartCommand");
        return super.onStartCommand(intent, i, i2);
    }

    @Override // android.app.Service
    @SuppressLint({"NewApi"})
    public void onTaskRemoved(Intent intent) {
        Log.v("LockTask", "onTaskRemoved");
        Intent intent2 = new Intent(getApplicationContext(), getClass());
        intent2.setPackage(getPackageName());
        ((AlarmManager) getApplicationContext().getSystemService("alarm")).set(3, SystemClock.elapsedRealtime() + 1000, PendingIntent.getService(getApplicationContext(), 1, intent2, 1073741824));
        super.onTaskRemoved(intent);
    }

    public void showDialog(String str) {
        boolean z = false;
        if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
            z = true;
        }
        if (Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("P583") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0) {
            z = true;
        }
        if (z && this.blackDialog == null) {
            this.blackDialog = new Dialog(getApplicationContext(), R.style.BlackScreenDialog);
            View inflate = View.inflate(getApplicationContext(), R.layout.blackdilogview, null);
            new WindowManager.LayoutParams(1024, 1024);
            this.blackDialog.setContentView(inflate);
            this.blackDialog.setCancelable(false);
            this.blackDialog.getWindow().setGravity(NNTP.DEFAULT_PORT);
            TextView textView = (TextView) inflate.findViewById(R.id.dialog_wifi_btn);
            TextView textView2 = (TextView) inflate.findViewById(R.id.dialog_info);
            if (LogHelp.TYPE_GUIDANCE.equals(str)) {
                if (AppEnvironment.isSNZT) {
                    textView2.setText("违规操作，若再次违规，平板将不可用。\n 温馨提示：平板是工具，不是玩具，请君自重。");
                } else {
                    textView2.setText("违规操作，平板将锁定五分钟，若再次违规，平板将被长期锁定。");
                }
                textView.setVisibility(4);
            } else {
                if (AppEnvironment.isSNZT) {
                    textView2.setText("违规操作，平板将永远不能使用！！！");
                } else {
                    textView2.setText("非法操作,请速与老师联系！！！");
                }
                textView.setVisibility(0);
            }
            textView.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.service.sysProtectService.4
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (sysProtectService.this.blackDialog != null && sysProtectService.this.blackDialog.isShowing()) {
                        sysProtectService.this.blackDialog.dismiss();
                        sysProtectService.this.blackDialog = null;
                    }
                    try {
                        if (sysProtectService.this.getPackageManager().getPackageInfo("com.edutech.wificonn", 0) == null) {
                            return;
                        }
                        ComponentName componentName = new ComponentName("com.edutech.wificonn", "com.edutech.wificonn.WifiConnActivity");
                        Intent intent = new Intent();
                        intent.addCategory("android.intent.category.LAUNCHER");
                        intent.setComponent(componentName);
                        intent.setAction("android.intent.action.MAIN");
                        intent.setFlags(268435456);
                        sysProtectService.this.startActivity(intent);
                    } catch (PackageManager.NameNotFoundException e) {
                        e.printStackTrace();
                    } catch (Exception e2) {
                        e2.printStackTrace();
                    }
                }
            });
            this.blackDialog.getWindow().setType(2003);
            this.blackDialog.setOnKeyListener(new DialogInterface.OnKeyListener() { // from class: com.edutech.mobilestudyclient.activity.service.sysProtectService.5
                @Override // android.content.DialogInterface.OnKeyListener
                public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                    return i == 4;
                }
            });
            this.blackDialog.show();
        }
    }
}
