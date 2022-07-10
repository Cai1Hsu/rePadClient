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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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
    private BroadcastReceiver BlackDialogReceiver = new AnonymousClass1();
    private final BroadcastReceiver APKInstallReceiver = new AnonymousClass2();
    private final BroadcastReceiver NetworkReceiver = new AnonymousClass3();

    static /* synthetic */ Timer access$5(sysProtectService sysprotectservice) {
        return sysprotectservice.mTimer;
    }

    static /* synthetic */ void access$6(sysProtectService sysprotectservice, Timer timer) {
        sysprotectservice.mTimer = timer;
    }

    static /* synthetic */ Timer access$7(sysProtectService sysprotectservice) {
        return sysprotectservice.mTimerLogUpload;
    }

    static /* synthetic */ void access$8(sysProtectService sysprotectservice, Timer timer) {
        sysprotectservice.mTimerLogUpload = timer;
    }

    static /* synthetic */ Dialog access$0(sysProtectService sysprotectservice) {
        return sysprotectservice.blackDialog;
    }

    static /* synthetic */ void access$1(sysProtectService sysprotectservice, Dialog dialog) {
        sysprotectservice.blackDialog = dialog;
    }

    static /* synthetic */ List access$2(sysProtectService sysprotectservice) {
        return sysprotectservice.addedApps;
    }

    static /* synthetic */ void access$3(sysProtectService sysprotectservice, List list) {
        sysprotectservice.addedApps = list;
    }

    static /* synthetic */ void access$9(sysProtectService sysprotectservice) {
        sysprotectservice.startTimer();
    }

    private void startTimer() {
        Log.v("LockTask", "startTimer");
        if (this.mTimer == null) {
            this.mTimer = new Timer();
            this.lockTask = new sysProtectTimer(this);
            this.mTimer.schedule(this.lockTask, 50L, 100L);
        }
        SharedPreferences tempSp = getSharedPreferences("livemode", 0);
        sysProtectTimer.isLiveShow = tempSp.getBoolean("islive", false);
        if (this.mTimerLogUpload == null) {
            this.mTimerLogUpload = new Timer();
            this.logUploadTask = new logUploadTimer(this);
            this.mTimerLogUpload.schedule(this.logUploadTask, 50L, 300000L);
        }
        tempSp.edit().putBoolean("islive", true).commit();
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

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
        IntentFilter intentApkFilter = new IntentFilter();
        intentApkFilter.addAction("android.intent.action.PACKAGE_ADDED");
        intentApkFilter.addAction("android.intent.action.PACKAGE_REMOVED");
        intentApkFilter.addDataScheme("package");
        registerReceiver(this.APKInstallReceiver, intentApkFilter);
        IntentFilter intentFilter3 = new IntentFilter();
        intentFilter3.addAction(AppEnvironment.Intent_LOCKWINDOW);
        intentFilter3.addAction(AppEnvironment.Intent_UNLOCKWINDOW);
        registerReceiver(this.BlackDialogReceiver, intentFilter3);
        this.usbReceiver = new UsbReceiver();
        IntentFilter usbFilter = new IntentFilter();
        usbFilter.addAction("android.intent.action.MEDIA_MOUNTED");
        usbFilter.addAction("android.intent.action.MEDIA_MOUNTED");
        registerReceiver(this.usbReceiver, usbFilter);
        sendBroadcast(new Intent(SERVICE_START));
    }

    @Override // android.app.Service
    @SuppressLint({"NewApi"})
    public void onTaskRemoved(Intent rootIntent) {
        Log.v("LockTask", "onTaskRemoved");
        Intent restartServiceIntent = new Intent(getApplicationContext(), getClass());
        restartServiceIntent.setPackage(getPackageName());
        PendingIntent restartServicePendingIntent = PendingIntent.getService(getApplicationContext(), 1, restartServiceIntent, 1073741824);
        AlarmManager alarmService = (AlarmManager) getApplicationContext().getSystemService("alarm");
        alarmService.set(3, SystemClock.elapsedRealtime() + 1000, restartServicePendingIntent);
        super.onTaskRemoved(rootIntent);
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        startTimer();
        Log.v("LockTask", "onStartCommand");
        return super.onStartCommand(intent, flags, startId);
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

    /* renamed from: com.edutech.mobilestudyclient.activity.service.sysProtectService$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 extends BroadcastReceiver {
        AnonymousClass1() {
            sysProtectService.this = r1;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            Log.i("NetworkService", "action = " + action);
            if (action.equals(AppEnvironment.Intent_LOCKWINDOW)) {
                String info = intent.getStringExtra("state");
                if (info == null || info.equals("")) {
                    info = LogHelp.TYPE_MYWORK;
                }
                sysProtectService.this.showDialog(info);
            } else if (action.equals(AppEnvironment.Intent_UNLOCKWINDOW) && sysProtectService.access$0(sysProtectService.this) != null && sysProtectService.access$0(sysProtectService.this).isShowing()) {
                sysProtectService.access$0(sysProtectService.this).dismiss();
                sysProtectService.access$1(sysProtectService.this, null);
            }
        }
    }

    public void showDialog(String state) {
        boolean canshow = false;
        if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
            canshow = true;
        }
        if (Build.DISPLAY.indexOf("M1016Pro") >= 0 || Build.DISPLAY.indexOf("P990S.V") >= 0 || Build.DISPLAY.indexOf("S1016PRO") >= 0 || Build.DISPLAY.indexOf("D13B") >= 0 || Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("P583") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("M856.V") >= 0 || Build.DISPLAY.indexOf("S1016.V1") >= 0 || Build.DISPLAY.indexOf("S106.V1") >= 0 || Build.DISPLAY.indexOf("S1016E") >= 0) {
            canshow = true;
        }
        if (canshow && this.blackDialog == null) {
            this.blackDialog = new Dialog(getApplicationContext(), R.style.BlackScreenDialog);
            View view = View.inflate(getApplicationContext(), R.layout.blackdilogview, null);
            new WindowManager.LayoutParams(1024, 1024);
            this.blackDialog.setContentView(view);
            this.blackDialog.setCancelable(false);
            this.blackDialog.getWindow().setGravity(NNTP.DEFAULT_PORT);
            TextView wifiTxt = (TextView) view.findViewById(R.id.dialog_wifi_btn);
            TextView infoTxt = (TextView) view.findViewById(R.id.dialog_info);
            if (LogHelp.TYPE_GUIDANCE.equals(state)) {
                if (AppEnvironment.isSNZT) {
                    infoTxt.setText("违规操作，若再次违规，平板将不可用。\n 温馨提示：平板是工具，不是玩具，请君自重。");
                } else {
                    infoTxt.setText("违规操作，平板将锁定五分钟，若再次违规，平板将被长期锁定。");
                }
                wifiTxt.setVisibility(4);
            } else {
                if (AppEnvironment.isSNZT) {
                    infoTxt.setText("违规操作，平板将永远不能使用！！！");
                } else {
                    infoTxt.setText("非法操作,请速与老师联系！！！");
                }
                wifiTxt.setVisibility(0);
            }
            wifiTxt.setOnClickListener(new AnonymousClass4());
            this.blackDialog.getWindow().setType(2003);
            this.blackDialog.setOnKeyListener(new AnonymousClass5());
            this.blackDialog.show();
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.service.sysProtectService$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass4 implements View.OnClickListener {
        AnonymousClass4() {
            sysProtectService.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View arg0) {
            if (sysProtectService.access$0(sysProtectService.this) != null && sysProtectService.access$0(sysProtectService.this).isShowing()) {
                sysProtectService.access$0(sysProtectService.this).dismiss();
                sysProtectService.access$1(sysProtectService.this, null);
            }
            try {
                PackageInfo pinfo = sysProtectService.this.getPackageManager().getPackageInfo("com.edutech.wificonn", 0);
                if (pinfo != null) {
                    ComponentName component = new ComponentName("com.edutech.wificonn", "com.edutech.wificonn.WifiConnActivity");
                    Intent intent_book = new Intent();
                    intent_book.addCategory("android.intent.category.LAUNCHER");
                    intent_book.setComponent(component);
                    intent_book.setAction("android.intent.action.MAIN");
                    intent_book.setFlags(268435456);
                    sysProtectService.this.startActivity(intent_book);
                }
            } catch (PackageManager.NameNotFoundException e1) {
                e1.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.service.sysProtectService$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass5 implements DialogInterface.OnKeyListener {
        AnonymousClass5() {
            sysProtectService.this = r1;
        }

        @Override // android.content.DialogInterface.OnKeyListener
        public boolean onKey(DialogInterface dialog, int keyCode, KeyEvent event) {
            return keyCode == 4;
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.service.sysProtectService$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 extends BroadcastReceiver {
        AnonymousClass2() {
            sysProtectService.this = r1;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            PackageInfo packageInfo2;
            PackageInfo packageInfo22;
            PackageInfo packageInfo23;
            String action = intent.getAction();
            Log.i("APKInstallReceiver", "action = " + action);
            if (action.equals("android.intent.action.PACKAGE_ADDED")) {
                ArrayList<String> selfApps = new ArrayList<>();
                selfApps.add("com.launcher.activity");
                selfApps.add("dolphin.video.players");
                selfApps.add("com.onlinesys.student");
                selfApps.add("com.google.android.inputmethod.pinyin");
                selfApps.add("com.akson.timeep");
                selfApps.add("com.akson.timeepstudent");
                selfApps.add("com.webgenie.swf.play");
                selfApps.add("com.ashleytech.falswf");
                selfApps.add("cn.wps.moffice_eng");
                if (AppEnvironment.isDEMO) {
                    selfApps.add("com.lejent.zuoyeshenqi.afanti");
                    selfApps.add("com.A17zuoye.mobile.homework");
                    selfApps.add("com.jinxin.namibox");
                    selfApps.add("com.haojiazhang.activity");
                    selfApps.add(AppEnvironment.YOUDAO_PACKNAME);
                    selfApps.add("org.hisand.zidian.zhs");
                    selfApps.add("com.record.ing");
                    selfApps.add("com.xueersi.parentsmeeting");
                    selfApps.add("com.hjwordgames");
                }
                String packageName = intent.getDataString();
                System.out.println("安装了:" + packageName + "包名的程序");
                String packageName2 = packageName.replace("package:", "");
                boolean hasApp = sysProtectService.access$2(sysProtectService.this) != null && sysProtectService.access$2(sysProtectService.this).contains(packageName2);
                boolean isYjapp = packageName2.contains("com.edutech") || packageName2.contains("com.launcher.activity") || selfApps.contains(packageName2);
                if (!isYjapp && !hasApp) {
                    sysProtectService.uninstall(packageName2, sysProtectService.this.getApplicationContext());
                }
                if (packageName2 != null && packageName2.contains("com.edutech.firewall")) {
                    Intent in = new Intent();
                    in.setAction("com.edutech.intent.TrafficStatsService");
                    in.setClassName("com.edutech.firewall", "eu.faircode.netguard.TrafficStatsService");
                    sysProtectService.this.startService(in);
                    Log.i("APKInstallReceiver", "send service ");
                }
                if (sysProtectService.this.logUploadTask != null && !packageName2.contains("com.edutech") && !packageName2.contains("dolphin.video.players") && !packageName2.contains("cn.wps.moffice_eng") && !packageName2.contains("com.webgenie.swf.play")) {
                    logUploadTimer.invalidApkInstall = true;
                    SharedPreferences sp = sysProtectService.this.getSharedPreferences("lockscreen", 0);
                    AppEnvironment.installOtherAppTime = System.currentTimeMillis();
                    sp.edit().putLong("installtime", AppEnvironment.installOtherAppTime).commit();
                    sp.edit().putString("installpkg", packageName2).commit();
                }
                if (packageName2.contains("com.edutech.assistantdemo")) {
                    Intent intent2 = new Intent("android.intent.action.MAIN");
                    intent2.addFlags(268435456);
                    ComponentName cn = new ComponentName("com.edutech.assistantdemo", "com.edutech.assistantdemo.MainActivity");
                    intent2.setComponent(cn);
                    try {
                        packageInfo23 = sysProtectService.this.getPackageManager().getPackageInfo("com.edutech.assistantdemo", 0);
                    } catch (PackageManager.NameNotFoundException e) {
                        packageInfo23 = null;
                        e.printStackTrace();
                    }
                    if (packageInfo23 != null) {
                        sysProtectService.this.startActivity(intent2);
                    }
                } else if (packageName2.contains("com.edutech.screenshot")) {
                    Intent intent22 = new Intent("android.intent.action.MAIN");
                    intent22.addFlags(268435456);
                    ComponentName cn2 = new ComponentName("com.edutech.screenshot", "com.edutech.screenshot.ScreenShotActivity");
                    intent22.setComponent(cn2);
                    try {
                        packageInfo22 = sysProtectService.this.getPackageManager().getPackageInfo("com.edutech.screenshot", 0);
                    } catch (PackageManager.NameNotFoundException e2) {
                        packageInfo22 = null;
                        e2.printStackTrace();
                    }
                    if (packageInfo22 != null) {
                        sysProtectService.this.startActivity(intent22);
                    }
                    SharedPreferences sp2 = sysProtectService.this.getSharedPreferences("screenshot", 0);
                    sp2.edit().putBoolean("opened", true).commit();
                } else if (packageName2.contains("com.edutech.lockscreen")) {
                    Intent intent23 = new Intent("android.intent.action.MAIN");
                    intent23.addFlags(268435456);
                    ComponentName cn3 = new ComponentName("com.edutech.lockscreen", "com.edutech.lockscreen.MainActivity");
                    intent23.setComponent(cn3);
                    try {
                        packageInfo2 = sysProtectService.this.getPackageManager().getPackageInfo("com.edutech.lockscreen", 0);
                    } catch (PackageManager.NameNotFoundException e3) {
                        packageInfo2 = null;
                        e3.printStackTrace();
                    }
                    if (packageInfo2 != null) {
                        sysProtectService.this.startActivity(intent23);
                    }
                    SharedPreferences sp3 = sysProtectService.this.getSharedPreferences("screenshot", 0);
                    sp3.edit().putBoolean("locked", true).commit();
                }
            } else if (action.equals("android.intent.action.PACKAGE_REMOVED")) {
                String packageName3 = intent.getDataString();
                System.out.println("卸载了:" + packageName3 + "包名的程序");
                if (packageName3 == null || !packageName3.contains("com.edutech.firewall")) {
                    return;
                }
                boolean z = AppEnvironment.openBMD;
            }
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.service.sysProtectService$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass3 extends BroadcastReceiver {
        AnonymousClass3() {
            sysProtectService.this = r1;
        }

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
                    String path = intent.getStringExtra("apkpath");
                    String packageName = intent.getStringExtra("packagename");
                    if (sysProtectService.access$2(sysProtectService.this) == null) {
                        sysProtectService.access$3(sysProtectService.this, new ArrayList());
                    }
                    if (packageName != null && !packageName.equals("") && !sysProtectService.access$2(sysProtectService.this).contains(packageName)) {
                        sysProtectService.access$2(sysProtectService.this).add(packageName);
                    }
                    sysProtectService.access$4(sysProtectService.this, path);
                } else if (action.equals(sysProtectService.UNSTALLAPK)) {
                    sysProtectService.uninstall(intent.getStringExtra("packagename"), sysProtectService.this.getApplicationContext());
                } else if (action.equals(sysProtectService.ADDINSTALL)) {
                    ArrayList<String> pkgs = intent.getStringArrayListExtra("packages");
                    if (sysProtectService.access$2(sysProtectService.this) == null) {
                        sysProtectService.access$3(sysProtectService.this, new ArrayList());
                    }
                    if (pkgs != null && pkgs.size() > 0) {
                        for (int i = 0; i < pkgs.size(); i++) {
                            try {
                                if (!sysProtectService.access$2(sysProtectService.this).contains(pkgs.get(i))) {
                                    sysProtectService.access$2(sysProtectService.this).add(pkgs.get(i));
                                }
                            } catch (Exception e) {
                                return;
                            }
                        }
                    }
                } else if (action.equals(sysProtectService.USEDESIGNDESKTOP)) {
                    SharedPreferences sp = sysProtectService.this.getSharedPreferences("design", 4);
                    sp.edit().putBoolean("usedesign", true).commit();
                } else if (action.equals(sysProtectService.RESTART_TIMER)) {
                    if (sysProtectService.access$5(sysProtectService.this) != null) {
                        sysProtectService.this.lockTask.cancel();
                        sysProtectService.access$5(sysProtectService.this).cancel();
                        sysProtectService.access$5(sysProtectService.this).purge();
                        sysProtectService.access$6(sysProtectService.this, null);
                        sysProtectService.this.lockTask = null;
                    }
                    if (sysProtectService.access$7(sysProtectService.this) != null) {
                        sysProtectService.this.logUploadTask.cancel();
                        sysProtectService.access$7(sysProtectService.this).cancel();
                        sysProtectService.access$7(sysProtectService.this).purge();
                        sysProtectService.access$8(sysProtectService.this, null);
                        sysProtectService.this.logUploadTask = null;
                    }
                    sysProtectService.access$9(sysProtectService.this);
                } else if (action.equals(sysProtectService.ON_LIVE_SHOW)) {
                    sysProtectTimer.isLiveShow = true;
                    SharedPreferences tempSp = sysProtectService.this.getSharedPreferences("livemode", 0);
                    tempSp.edit().putBoolean("islive", true).commit();
                    Intent closeFloat = new Intent();
                    closeFloat.setAction(sysProtectService.YJ_HIDE_FLOATVIEW);
                    sysProtectService.this.sendBroadcast(closeFloat);
                } else if (action.equals(sysProtectService.OFF_LIVE_SHOW)) {
                    sysProtectTimer.isLiveShow = false;
                    SharedPreferences tempSp2 = sysProtectService.this.getSharedPreferences("livemode", 0);
                    tempSp2.edit().putBoolean("islive", false).commit();
                }
            }
        }
    }

    static /* synthetic */ void access$4(sysProtectService sysprotectservice, String str) {
        sysprotectservice.installNewApk(str);
    }

    private void installNewApk(String apkpath) {
        if (apkpath != null) {
            MiaMdmPolicyManager mMiaMdmPolicyManager = new MiaMdmPolicyManager(getApplicationContext());
            boolean boo = false;
            try {
                boo = this.mHwPDM.isRecentTaskButtonDisabled(this.cn);
            } catch (Exception e) {
                Log.e("exception", e.getMessage());
                e.printStackTrace();
            }
            if (apkpath.lastIndexOf(".apk") != -1) {
                if (boo) {
                    try {
                        this.mHwPDM.installPackage(this.cn, apkpath);
                        Log.e("aaaa", "bbbbbb");
                    } catch (Exception e2) {
                    }
                } else if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
                    mMiaMdmPolicyManager.silentInstall(apkpath);
                } else {
                    try {
                        if (getApplicationContext() != null) {
                            if (Build.DISPLAY.indexOf("M1016Pro") < 0 && Build.DISPLAY.indexOf("P990S.V") < 0 && Build.DISPLAY.indexOf("S1016PRO") < 0 && Build.DISPLAY.indexOf("D13B") < 0 && Build.DISPLAY.indexOf("QC80A") < 0 && Build.DISPLAY.indexOf("N5110ZB") < 0 && Build.DISPLAY.indexOf(".T360Z") < 0 && Build.DISPLAY.indexOf("P583") < 0 && Build.DISPLAY.indexOf("P350") < 0 && Build.DISPLAY.indexOf("P550") < 0 && Build.DISPLAY.indexOf("M856.V") < 0 && Build.DISPLAY.indexOf("S1016.V1") < 0 && Build.DISPLAY.indexOf("S106.V1") < 0 && Build.DISPLAY.indexOf("S1016E") < 0) {
                                Log.e("apkinstall", "apkinstall");
                                apkinstall(apkpath);
                            } else {
                                Log.e("apkinstall", "apkinstall_samsung");
                                apkinstall_samsung(apkpath);
                            }
                        }
                    } catch (Exception e3) {
                    }
                }
            }
        }
    }

    private void apkinstall_samsung(String apkpath) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_INSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent.putExtra("uri", apkpath);
        } else {
            intent.setDataAndType(Uri.fromFile(new File(apkpath)), "application/vnd.android.package-archive");
        }
        sendBroadcast(intent);
    }

    private void apkinstall(String apkpath) {
        try {
            if (!InstallApkUtil.SlientInstall(apkpath)) {
                if (!InstallApkUtil.SuSlientInstall(apkpath)) {
                    apkIntentInstall(apkpath);
                } else {
                    Log.d("sysService", String.valueOf(apkpath) + ":SuSlientInstall安装成功！");
                }
            } else {
                Log.d("sysService", String.valueOf(apkpath) + ":SlientInstall安装成功！");
            }
        } catch (Exception e) {
            try {
                if (!InstallApkUtil.SuSlientInstall(apkpath)) {
                    apkIntentInstall(apkpath);
                } else {
                    Log.d("sysService", String.valueOf(apkpath) + ":SuSlientInstall安装成功！");
                }
            } catch (Exception e2) {
                apkIntentInstall(apkpath);
                Log.d("sysService", String.valueOf(apkpath) + ":InstallApk安装成功！");
            }
        }
    }

    private void apkIntentInstall(String apkpath) {
        Intent intent = new Intent();
        intent.setAction(INSTALL);
        sendBroadcast(intent);
        Intent installIntent = new Intent("android.intent.action.VIEW");
        installIntent.setDataAndType(Uri.fromFile(new File(apkpath)), "application/vnd.android.package-archive");
        installIntent.setFlags(268435456);
        startActivity(installIntent);
    }

    private static boolean clientInstall(String apkPath) {
        Throwable th;
        Exception e;
        PrintWriter PrintWriter;
        Process process = null;
        try {
            try {
                process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                PrintWriter = new PrintWriter(process.getOutputStream());
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e2) {
            e = e2;
        }
        try {
            PrintWriter.println("chmod 777 " + apkPath);
            PrintWriter.println("export LD_LIBRARY_PATH=/vendor/lib:/system/lib");
            PrintWriter.println("pm install -r " + apkPath);
            PrintWriter.flush();
            PrintWriter.close();
            int value = process.waitFor();
            boolean returnResult = returnResult(value);
            if (process != null) {
                process.destroy();
            }
            return returnResult;
        } catch (Exception e3) {
            e = e3;
            e.printStackTrace();
            if (process != null) {
                process.destroy();
            }
            return false;
        } catch (Throwable th3) {
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
    }

    private static boolean returnResult(int value) {
        if (value == 0) {
            return true;
        }
        return value == 1 ? false : false;
    }

    public static boolean SlientInstall(String apkPath) throws IOException {
        Runtime runtime = Runtime.getRuntime();
        Process proc = runtime.exec("pm install -r " + apkPath);
        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String line = bufferedreader.readLine();
            if (line != null) {
                sb.append(line);
            } else {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            }
        }
        if (proc.waitFor() != 0) {
            System.err.println("exit value = " + proc.exitValue());
        }
        String result = sb.toString();
        if (result.equals("Success")) {
            Log.d("InstallApkUtil", "SlientInstall success");
            return true;
        }
        Log.d("InstallApkUtil", "SlientInstall failed");
        return false;
    }

    public static boolean uninstall(String packageName, Context context) {
        if (packageName == null) {
            return false;
        }
        boolean boo = false;
        ComponentName cn = new ComponentName("com.launcher.activity", ApkController.class.getSimpleName());
        HwDevicePolicyManager mHwPDM = new HwDevicePolicyManager(context);
        MiaMdmPolicyManager mMiaMdmPolicyManager = new MiaMdmPolicyManager(context);
        try {
            boo = mHwPDM.isRecentTaskButtonDisabled(cn);
        } catch (Exception e) {
            Log.e("exception", e.getMessage());
            e.printStackTrace();
        }
        if (boo) {
            try {
                mHwPDM.uninstallPackage(cn, packageName, true);
                return true;
            } catch (Exception e2) {
                return false;
            }
        } else if (Build.DISPLAY.contains("A10-70LC") || Build.DISPLAY.contains("TB-8703N") || Build.DISPLAY.contains("TB-8604F") || Build.DISPLAY.contains("A10-70F") || Build.DISPLAY.contains("YiJiao") || Build.DISPLAY.contains("YOGATablet2-1050LC")) {
            mMiaMdmPolicyManager.silentUnInstall(packageName);
            return true;
        } else {
            try {
                if (Build.DISPLAY.indexOf("M1016Pro") < 0 && Build.DISPLAY.indexOf("P990S.V") < 0 && Build.DISPLAY.indexOf("S1016PRO") < 0 && Build.DISPLAY.indexOf("D13B") < 0 && Build.DISPLAY.indexOf("QC80A") < 0 && Build.DISPLAY.indexOf("N5110ZB") < 0 && Build.DISPLAY.indexOf(".T360Z") < 0 && Build.DISPLAY.indexOf("P583") < 0 && Build.DISPLAY.indexOf("P350") < 0 && Build.DISPLAY.indexOf("P550") < 0 && Build.DISPLAY.indexOf("M856.V") < 0 && Build.DISPLAY.indexOf("S1016.V1") < 0 && Build.DISPLAY.indexOf("S106.V1") < 0 && Build.DISPLAY.indexOf("S1016E") < 0) {
                    Log.e("uninstall", "apkUninstall");
                    apkUninstall(packageName, context);
                } else {
                    apkuninstall_samsung(packageName, context);
                }
                return true;
            } catch (Exception e3) {
                return false;
            }
        }
    }

    private static void apkuninstall_samsung(String packageName, Context context) {
        Intent intent1 = new Intent();
        intent1.setAction("android.intent.action.SILENCE_UNINSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent1.putExtra("pgk", packageName);
        } else {
            intent1.setData(Uri.parse("package://" + packageName));
        }
        context.sendBroadcast(intent1);
    }

    private static void apkUninstall(String packageName, Context context) {
        Log.e("uninstall", "apkUninstall enter");
        try {
            if (!InstallApkUtil.SuSlientUninstall(packageName)) {
                Log.e("uninstall", "SuSlientUninstall 1 false");
                if (!InstallApkUtil.SlientUninstall(packageName)) {
                    Log.e("uninstall", "SlientUninstall 1 false");
                    apkIntentUninstall(packageName, context);
                } else {
                    Log.d("sysService", String.valueOf(packageName) + ":SlientInstall卸载成功！");
                }
            } else {
                Log.d("sysService", String.valueOf(packageName) + ":SuSlientInstall卸载成功！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (!InstallApkUtil.SuSlientUninstall(packageName)) {
                    apkIntentUninstall(packageName, context);
                    Log.d("uninstall", String.valueOf(packageName) + ":apkIntentUninstall卸载！");
                } else {
                    Log.d("sysService", String.valueOf(packageName) + ":SuSlientInstall卸载成功！");
                }
            } catch (Exception e2) {
                apkIntentUninstall(packageName, context);
                Log.d("uninstall", String.valueOf(packageName) + ":apkIntentUninstall卸载！");
            }
        }
    }

    private static void apkIntentUninstall(String packageName, Context context) {
        Intent intent = new Intent();
        intent.setAction(INSTALL);
        context.sendBroadcast(intent);
        Uri packageURI = Uri.parse("package:" + packageName);
        Intent uninstallIntent = new Intent("android.intent.action.DELETE", packageURI);
        uninstallIntent.addFlags(268435456);
        context.startActivity(uninstallIntent);
    }
}
