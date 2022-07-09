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
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import org.apache.commons.net.nntp.NNTP;

/* loaded from: classes.dex */
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
    private BroadcastReceiver BlackDialogReceiver = null;

    private final BroadcastReceiver APKInstallReceiver = null;

    private final BroadcastReceiver NetworkReceiver = null;

    public void startTimer() {

    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    @SuppressLint({"InlinedApi"})
    public void onCreate() {

    }

    @Override // android.app.Service
    @SuppressLint({"NewApi"})
    public void onTaskRemoved(Intent rootIntent) {

    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        return super.onStartCommand(intent, flags, startId);
    }

    @Override // android.app.Service
    public void onDestroy() {
        
    }

    public void showDialog(String state) {

    }

    public void installNewApk(String apkpath) {

    }

    private void apkinstall_samsung(String apkpath) {

    }

    private void apkinstall(String apkpath) {

    }

    private void apkIntentInstall(String apkpath) {

    }

    private static boolean clientInstall(String apkPath) {
        return true;
    }

    private static boolean returnResult(int value) {
        if (value == 0) {
            return true;
        }
        return value == 1 ? false : false;
    }

    public static boolean SlientInstall(String apkPath) throws IOException {
	    return true;
    }

    public static boolean uninstall(String packageName, Context context) {
        return true;
    }

    private static void apkuninstall_samsung(String packageName, Context context) {
    }

    private static void apkUninstall(String packageName, Context context) {

    }

    private static void apkIntentUninstall(String packageName, Context context) {
    
    }
}
