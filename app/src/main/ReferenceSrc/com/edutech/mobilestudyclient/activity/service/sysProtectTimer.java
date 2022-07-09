package com.edutech.mobilestudyclient.activity.service;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.publicedu.log.LogHelp;
import com.mongodb.util.TimeConstants;
import java.util.List;
import java.util.TimerTask;
import org.apache.tools.ant.taskdefs.optional.clearcase.ClearCase;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/service/sysProtectTimer.class */
public class sysProtectTimer extends TimerTask {
    public static final String TAG = "LockTask";
    public static boolean flag = true;
    public static boolean flagNeedPasswd = true;
    public static boolean isInteraction = true;
    public static boolean isLiveShow = false;
    public Context extraContext;
    public ActivityManager mActivityManager;
    public Context mContext;
    String testPackageName = "com.android.settings";
    String testPackageName2 = "com.sec.android.app.controlpanel";
    String testClassName = "com.android.settings.Settings$WifiSettingsActivity";
    String wifiWarningClassName = "com.android.settings.wifi.WifiWarningDialog";
    String passwdClassName = "com.edutech.android.Protect.PasswdDialogActivity";
    String interPackageName = AppEnvironment.INTERACTION_PACKNAME;
    String interClassName = "com.edutech.android.InterAction.HomepageActivity";
    String cameraPackageName = "com.sec.android.app.camera";
    String gesturePackageName = "com.sec.android.gesturepad";
    String gestureClassName = "com.sec.android.gesturepad.GesturePadActivity";
    String secLauncherPackageName = "com.sec.android.app.launcher";
    String secLauncherclassName = "com.android.launcher2.Launcher";
    String installerPackageName = "com.android.packageinstaller";
    String installAcName = "com.android.packageinstaller.permission.ui.ReviewPermissionsActivity";
    String permissionQC80A = "com.android.packageinstaller.permission.ui.GrantPermissionsActivity";
    String permissionQC80A2 = "com.google.android.apps.inputmethod.libs.framework.core.PermissionsActivity";
    String installerClassName = "com.android.packageinstaller.UninstallerActivity";
    String mms = "com.android.mms";
    String call = "com.android.contacts";
    String gallery3dPackageName = "";
    String gallery3dClassName = "";
    String inputPackageName = "com.samsung.inputmethod";
    String inputClassName = "com.samsung.inputmethod.setting.SimeSettingActivity";
    String browserPackageName = "com.android.browser";
    String browserClassName = "com.android.browser.BrowserActivity";
    String tencentBrowserPackageName = "com.tencent.padbrowser";
    String tencentBrowseClassName = "com.tencent.padbrowser.MainActivity";
    String fileBrowserPackageName = "com.sec.android.app.myfiles";
    String fileBrowserClassName = "com.sec.android.app.myfiles.Myfiles";
    String baiduNetdiskPackageName = "com.baidu.netdisk";
    String baiduNetdiskClassName = "com.baidu.netdisk.ui.Navigate";
    String activeExplorerPackageName = "com.sec.android.app.sbrowser";
    String tencentPackageName = "com.tencent.";
    String kuaiyaPackageName = "com.dewmobile.kuaiya";
    String samsungAppsPackageName = "com.sec.android.app.samsungapps";
    String autonaviPackageName = "com.autonavi.xmgd.navigator.keyboard";
    String snotePackageName = AppEnvironment.SPEN_PACKNAME;
    String searchpackageName = "com.baidu.searchbox";
    String huafenPName = "com.huawei.fans";
    String playPName = "com.huawei.gamebox";
    String walletPName = "com.huawei.wallet";
    String storePName = "com.vmall.client";
    String qqPName = "com.tencent.mobileqq";
    String wechatPName = "com.tencent.mm";
    String baiduMapPName = "com.baidu.BaiduMap";
    String psharePName = "com.huawei.gallery.photoshare";
    String emailPName = "com.android.email";
    String hwidPName = "com.huawei.hwid";
    String hwdiskPName = "com.huawei.hidisk";
    String inputBaidu = "com.baidu.input_huawei";
    String officesuiteClass = "com.mobisystems.office.files.FileBrowser";
    String detailsActivity = "com.android.settings.applications.InstalledAppDetails";
    String wpsPushActivity = "cn.wps.moffice.main.local.home.PadHomeActivity";
    String quickOffice = "com.qo.android.am3";
    String polarisOffice = "com.infraware.PolarisOfficeStdForTablet";
    String wps1 = "cn.wps.moffice.documentmanager.DocumentManager";
    String snote = "com.samsung.android.snote";
    String sinaPhone = "com.sina.weibo";
    String sinaHD = "com.sina.weibotab";
    String tencentWb = "com.tencent.WBlog";
    String emailPackageNameP550 = "com.samsung.android.email.ui";
    String sconnectPackageNameP550 = "com.samsung.android.sconnect";
    String pinboardPackageNameP550 = "com.samsung.android.app.pinboard";
    String mobileprintPackageName = "com.sec.android.app.mobileprint";
    String dirPic = "com.sec.android.app.dictionary";
    String emailSM = "com.samsung.android.email.provider";
    String uninstallSMPackageActivity = "com.android.packageinstaller.UninstallerActivity";
    String ggpy = "com.google.android.inputmethod.pinyin";
    String xtPY = "com.android.inputmethod.latin";
    String XTPYSZ = "com.android.inputmethod.latin.settings.SettingsActivity";
    String ssnotes = "com.samsung.android.app.notes";
    String pdfnote = "com.samsung.android.spdfnote";
    String sspy = "com.sec.android.inputmethod";
    String lananBrowser = "org.codeaurora.swe.browser.dev";
    String lenovoBrowser = "org.codeaurora.swe.browser.beta";
    String lenovoBrowserActivity = "com.android.browser.BrowserActivity";
    String lenovoWebview = "com.android.webview";
    String lenovoQuickSearch = "com.android.quicksearchbox";
    String camera2Pkg = "com.android.camera2";
    String camera2Activity = "com.android.camera.CameraLauncher";
    String takeShotPkg = "com.edutech.screenshot";
    String takeShotAc = "com.edutech.screenshot.ScreenShotActivity";
    String permissionAc = "com.android.systemui.media.MediaProjectionPermissionActivity";
    String livePkg = "com.edutech.actionplayer";
    String liveAc = "com.edutech.actionplayer.SmartPlayer";
    String wifiAc = "com.android.settings.wifi.WifiPickerActivity";
    String batteryDialogAc = "com.android.settings.fuelgauge.RequestIgnoreBatteryOptimizations";
    String wifiPermission = "com.android.settings.wifi.RequestToggleWiFiActivity";

    public sysProtectTimer(Context context) {
        this.mContext = context;
        this.mActivityManager = (ActivityManager) context.getSystemService("activity");
        this.extraContext = context.getApplicationContext();
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    @SuppressLint({"NewApi"})
    public void run() {
        boolean z;
        String str;
        int i;
        PackageInfo packageInfo;
        PackageInfo packageInfo2;
        if (this.mContext == null && this.extraContext != null) {
            this.mContext = this.extraContext;
        }
        if (this.mActivityManager == null) {
            this.mActivityManager = (ActivityManager) this.mContext.getSystemService("activity");
        }
        List<ActivityManager.RunningTaskInfo> runningTasks = this.mActivityManager.getRunningTasks(5);
        if (runningTasks == null || runningTasks.size() < 1) {
            return;
        }
        ComponentName componentName = runningTasks.get(0).topActivity;
        String packageName = componentName.getPackageName();
        String className = componentName.getClassName();
        flagNeedPasswd = true;
        if (isLiveShow && !this.takeShotAc.equals(className) && !this.permissionAc.equals(className) && !this.livePkg.equals(packageName) && !this.liveAc.equals(className)) {
            int size = runningTasks.size();
            int i2 = 0;
            while (true) {
                if (i2 >= size) {
                    break;
                }
                if (this.livePkg.equals(runningTasks.get(i2).topActivity.getPackageName())) {
                    Log.e("Lock", "Go to liveshow!!," + packageName + "," + className);
                    Log.e("Lock", "i is" + i2);
                    this.mActivityManager.moveTaskToFront(runningTasks.get(i2).id, 2);
                    flagNeedPasswd = false;
                    break;
                }
                i2++;
            }
        } else if (isInteraction && !this.interPackageName.equals(packageName) && !this.cameraPackageName.equals(packageName) && !this.takeShotAc.equals(className) && !this.permissionAc.equals(className) && !this.livePkg.equals(packageName) && !this.liveAc.equals(className)) {
            int size2 = runningTasks.size();
            for (int i3 = 0; i3 < size2; i3++) {
                ComponentName componentName2 = runningTasks.get(i3).topActivity;
                if (this.interPackageName.equals(componentName2.getPackageName()) || this.cameraPackageName.equals(componentName2.getPackageName())) {
                    Log.e("Lock", "Go to Interaction!!," + packageName + "," + className);
                    Log.e("Lock", "i is" + i3);
                    this.mActivityManager.moveTaskToFront(runningTasks.get(i3).id, 2);
                    flagNeedPasswd = false;
                    break;
                }
            }
        }
        SharedPreferences sharedPreferences = this.mContext.getSharedPreferences("lockscreen", 4);
        boolean z2 = sharedPreferences.getBoolean("locked", false);
        int i4 = sharedPreferences.getInt("tmplocked", 0);
        boolean z3 = this.mContext.getSharedPreferences("allowcall", 4).getBoolean("cancall", false);
        boolean z4 = this.mContext.getSharedPreferences("sdcard", 4).getBoolean("sdcard", false);
        if (AppEnvironment.isPDSSZ && flag && ((this.testPackageName.equals(packageName) || this.ggpy.equals(packageName) || this.browserPackageName.equals(packageName)) && !this.mContext.getSharedPreferences("privatekey", 0).getString("apihost", "").contains("www.ischool365.com"))) {
            if (!z2 && i4 != 1) {
                SharedPreferences sharedPreferences2 = this.mContext.getSharedPreferences("lockscreen", 4);
                sharedPreferences2.edit().putInt("tmplocked", 1).commit();
                sharedPreferences2.edit().putLong("tmplockedtime", System.currentTimeMillis()).commit();
                Intent intent = new Intent(AppEnvironment.Intent_LOCKWINDOW);
                intent.putExtra("state", LogHelp.TYPE_GUIDANCE);
                this.mContext.sendBroadcast(intent);
            }
            try {
                Intent intent2 = new Intent("android.intent.action.MAIN");
                intent2.setFlags(268468224);
                intent2.addCategory("android.intent.category.LAUNCHER");
                intent2.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity"));
                this.mContext.startActivity(intent2);
                return;
            } catch (Exception e) {
                return;
            }
        }
        if (z2 && !z4) {
            if (System.currentTimeMillis() - sharedPreferences.getLong("lockstartTime", 0L) > sharedPreferences.getLong("lockTime", 0L)) {
                sharedPreferences.edit().putLong("lockstartTime", 0L).commit();
                sharedPreferences.edit().putLong("lockTime", 0L).commit();
                sharedPreferences.edit().putBoolean("locked", false).commit();
                sharedPreferences.edit().putInt("tmplocked", 0).commit();
                sharedPreferences.edit().putLong("showstarttime", 0L).commit();
                sharedPreferences.edit().putInt("shownumber", 1).commit();
                AppEnvironment.showDialogNumber = 0;
                AppEnvironment.startTime = 0L;
                this.mContext.sendBroadcast(new Intent(AppEnvironment.Intent_UNLOCKWINDOW));
            } else if (!"com.launcher.activity".equals(packageName) && !this.wifiWarningClassName.equals(className) && !"com.android.vpndialogs".equals(packageName) && !"com.edutech.firewall".equals(packageName) && !"com.edutech.wificonn".equals(packageName)) {
                Intent intent3 = new Intent("android.intent.action.MAIN");
                intent3.setFlags(268468224);
                intent3.addCategory("android.intent.category.LAUNCHER");
                intent3.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity"));
                this.mContext.startActivity(intent3);
                return;
            }
        } else if (i4 == 1 && !z4) {
            if (System.currentTimeMillis() - sharedPreferences.getLong("tmplockedtime", 0L) > 300000) {
                sharedPreferences.edit().putInt("tmplocked", 2).commit();
                sharedPreferences.edit().putLong("tmplockedtime", 0L).commit();
                this.mContext.sendBroadcast(new Intent(AppEnvironment.Intent_UNLOCKWINDOW));
            } else if (!className.equals("com.edutech.mobilestudyclient.activity.PasswdDialogActivity") && !"com.launcher.activity".equals(packageName) && !this.wifiWarningClassName.equals(className) && !"com.android.vpndialogs".equals(packageName) && !"com.edutech.firewall".equals(packageName) && !"com.edutech.wificonn".equals(packageName)) {
                return;
            }
        }
        if (className.equals("com.edutech.mobilestudyclient.activity.PasswdDialogActivity") || className.equals("com.android.settings.DeviceAdminAdd")) {
            return;
        }
        this.mContext.getSharedPreferences("usbotg", 4);
        if (packageName.contains("com.edutech") || packageName.equals("com.launcher.activity")) {
            flag = true;
        }
        if (z4 && flag) {
            AppEnvironment.showDialogNumber++;
            Intent intent4 = new Intent("android.intent.action.MAIN");
            intent4.setFlags(268435456);
            intent4.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.PasswdDialogActivity"));
            intent4.setFlags(268468224);
            intent4.putExtra("number", AppEnvironment.showDialogNumber);
            intent4.putExtra("lockwarning", 0);
            intent4.putExtra("packagename", packageName);
            try {
                packageInfo2 = this.mContext.getPackageManager().getPackageInfo("com.launcher.activity", 0);
            } catch (PackageManager.NameNotFoundException e2) {
                packageInfo2 = null;
                e2.printStackTrace();
            }
            if (packageInfo2 == null) {
                return;
            }
            try {
                this.mContext.startActivity(intent4);
            } catch (Exception e3) {
            }
        } else if (!this.testPackageName.equals(packageName) || !AppEnvironment.isSDYB || !this.wifiAc.equals(className)) {
            if (this.testPackageName.equals(packageName) && this.batteryDialogAc.equals(className)) {
                return;
            }
            if (((!this.testPackageName.equals(packageName) || this.wifiPermission.equals(className) || this.wifiWarningClassName.equals(className)) && !this.lenovoWebview.equals(packageName) && !this.lenovoQuickSearch.equals(packageName) && !this.lananBrowser.equals(packageName) && !this.sspy.equals(packageName) && !this.lenovoBrowser.equals(packageName) && !this.pdfnote.equals(packageName) && !this.ssnotes.equals(packageName) && ((!this.ggpy.equals(packageName) || className.equals(this.permissionQC80A2)) && !this.XTPYSZ.equals(className) && !this.emailSM.equals(packageName) && !this.uninstallSMPackageActivity.equals(className) && !this.testPackageName2.equals(packageName) && !this.huafenPName.equals(packageName) && !this.sinaHD.equals(packageName) && !this.sinaPhone.equals(packageName) && !this.tencentWb.equals(packageName) && !this.emailPackageNameP550.equals(packageName) && !this.sconnectPackageNameP550.equals(packageName) && !this.pinboardPackageNameP550.equals(packageName) && !this.inputBaidu.equals(packageName) && !this.psharePName.equals(packageName) && ((z3 || (!this.mms.equals(packageName) && !this.call.equals(packageName))) && !this.hwidPName.equals(packageName) && !this.hwdiskPName.equals(packageName) && !this.wps1.equals(className) && !this.mobileprintPackageName.equals(packageName) && !this.wpsPushActivity.equals(className) && !this.officesuiteClass.equals(className) && !this.emailPName.equals(packageName) && !this.wechatPName.equals(packageName) && !this.playPName.equals(packageName) && !this.qqPName.equals(packageName) && !this.walletPName.equals(packageName) && !this.baiduMapPName.equals(packageName) && !this.storePName.equals(packageName) && !this.searchpackageName.equals(packageName) && !this.gesturePackageName.equals(packageName) && !this.secLauncherPackageName.equals(packageName) && ((!this.installerPackageName.equals(packageName) || className.equals(this.permissionQC80A) || className.equals(this.installAcName)) && !this.gallery3dClassName.equals(className) && !this.inputPackageName.equals(packageName) && !this.browserPackageName.equals(packageName) && !this.tencentBrowserPackageName.equals(packageName) && !this.fileBrowserPackageName.equals(packageName) && !this.baiduNetdiskPackageName.equals(packageName) && !this.activeExplorerPackageName.equals(packageName) && !this.kuaiyaPackageName.equals(packageName) && !this.samsungAppsPackageName.equals(packageName) && !this.autonaviPackageName.equals(packageName) && !this.dirPic.equals(packageName) && !packageName.contains(this.snote) && !this.snotePackageName.equals(packageName))))) || !flag || !flagNeedPasswd || (packageName.equals(this.testPackageName) && className.equals(this.detailsActivity))) {
                if (this.testPackageName.equals(packageName) || this.passwdClassName.equals(className) || this.testPackageName2.equals(packageName) || this.gesturePackageName.equals(packageName) || this.secLauncherPackageName.equals(packageName) || this.installerPackageName.equals(packageName) || this.gallery3dClassName.equals(className) || !this.inputPackageName.equals(packageName)) {
                }
                return;
            }
            Log.e(ClearCase.COMMAND_LOCK, String.valueOf(className) + "," + packageName);
            String string = this.mContext.getSharedPreferences("privatekey", 0).getString("apihost", "");
            if ((this.testPackageName.equals(packageName) || this.XTPYSZ.equals(className) || (this.ggpy.equals(packageName) && !className.equals(this.permissionQC80A2))) && !string.contains("www.ischool365.com")) {
                SharedPreferences sharedPreferences3 = this.mContext.getSharedPreferences("lockscreen", 4);
                sharedPreferences3.edit().putInt("tmplocked", 1).commit();
                sharedPreferences3.edit().putLong("tmplockedtime", System.currentTimeMillis()).commit();
                Intent intent5 = new Intent(AppEnvironment.Intent_LOCKWINDOW);
                intent5.putExtra("state", LogHelp.TYPE_GUIDANCE);
                this.mContext.sendBroadcast(intent5);
                Intent intent6 = new Intent("android.intent.action.MAIN");
                intent6.setFlags(268468224);
                intent6.addCategory("android.intent.category.LAUNCHER");
                intent6.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity"));
                this.mContext.startActivity(intent6);
                return;
            }
            SharedPreferences sharedPreferences4 = this.mContext.getSharedPreferences("lockscreen", 4);
            boolean z5 = sharedPreferences4.getBoolean("locked", false);
            long currentTimeMillis = System.currentTimeMillis();
            int i5 = 0;
            int i6 = sharedPreferences4.getInt("tmplocked", 0);
            int i7 = sharedPreferences4.getInt("shownumber", 1);
            long j = sharedPreferences4.getLong("showstarttime", 0L);
            if (i7 == 6 || i7 == 7 || i7 == 13 || i7 == 14) {
                i5 = 2;
            }
            if (j <= 0) {
                sharedPreferences4.edit().putLong("showstarttime", currentTimeMillis).commit();
            }
            long j2 = j;
            if (j <= 0) {
                j2 = currentTimeMillis;
            }
            long abs = Math.abs((currentTimeMillis - j2) / 1000);
            if (abs < TimeConstants.S_HOUR) {
                if (i6 == 0) {
                    z = z5;
                    str = "0";
                    if (i7 >= 7) {
                        z = true;
                        sharedPreferences4.edit().putInt("tmplocked", 1).commit();
                        sharedPreferences4.edit().putLong("tmplockedtime", currentTimeMillis).commit();
                        str = LogHelp.TYPE_GUIDANCE;
                    }
                    i = i7 + 1;
                    sharedPreferences4.edit().putInt("shownumber", i).commit();
                } else if (i6 == 1) {
                    z = true;
                    str = LogHelp.TYPE_GUIDANCE;
                    i = i7;
                } else {
                    z = z5;
                    str = "0";
                    i = i7;
                    if (i6 == 2) {
                        if (i7 >= 14) {
                            z = true;
                            str = LogHelp.TYPE_MYWORK;
                            sharedPreferences4.edit().putInt("tmplocked", 0).commit();
                            sharedPreferences4.edit().putLong("showstarttime", 0L).commit();
                            sharedPreferences4.edit().putInt("shownumber", 1).commit();
                            sharedPreferences4.edit().putLong("lockstartTime", currentTimeMillis).commit();
                            if (AppEnvironment.isSNZT) {
                                sharedPreferences4.edit().putLong("lockTime", 864000000L).commit();
                            } else {
                                sharedPreferences4.edit().putLong("lockTime", 86400000L).commit();
                            }
                            sharedPreferences4.edit().putBoolean("locked", true).commit();
                            sharedPreferences4.edit().putBoolean("uploadlockstate", false).commit();
                            i = i7;
                        } else {
                            i = i7 + 1;
                            sharedPreferences4.edit().putInt("shownumber", i).commit();
                            z = z5;
                            str = "0";
                        }
                    }
                }
            } else if (abs <= TimeConstants.S_HOUR || abs > 7200) {
                z = false;
                sharedPreferences4.edit().putInt("tmplocked", 0).commit();
                sharedPreferences4.edit().putLong("showstarttime", currentTimeMillis).commit();
                sharedPreferences4.edit().putInt("shownumber", 1).commit();
                str = "0";
                i = i7;
            } else if (i6 == 0) {
                z = false;
                sharedPreferences4.edit().putInt("tmplocked", 0).commit();
                sharedPreferences4.edit().putLong("showstarttime", currentTimeMillis).commit();
                sharedPreferences4.edit().putInt("shownumber", 1).commit();
                str = "0";
                i = i7;
            } else if (i6 == 1) {
                z = true;
                str = LogHelp.TYPE_GUIDANCE;
                i = i7 + 1;
                sharedPreferences4.edit().putInt("shownumber", i).commit();
            } else {
                z = z5;
                str = "0";
                i = i7;
                if (i6 == 2) {
                    if (i7 >= 14) {
                        z = true;
                        str = LogHelp.TYPE_MYWORK;
                        sharedPreferences4.edit().putInt("tmplocked", 0).commit();
                        sharedPreferences4.edit().putLong("showstarttime", 0L).commit();
                        sharedPreferences4.edit().putInt("shownumber", 1).commit();
                        sharedPreferences4.edit().putLong("lockstartTime", currentTimeMillis).commit();
                        if (AppEnvironment.isSNZT) {
                            sharedPreferences4.edit().putLong("lockTime", 864000000L).commit();
                        } else {
                            sharedPreferences4.edit().putLong("lockTime", 86400000L).commit();
                        }
                        sharedPreferences4.edit().putBoolean("locked", true).commit();
                        sharedPreferences4.edit().putBoolean("uploadlockstate", false).commit();
                        i = i7;
                    } else {
                        i = i7 + 1;
                        sharedPreferences4.edit().putInt("shownumber", i).commit();
                        z = z5;
                        str = "0";
                    }
                }
            }
            if (z) {
                try {
                    Intent intent7 = new Intent(AppEnvironment.Intent_LOCKWINDOW);
                    intent7.putExtra("state", str);
                    this.mContext.sendBroadcast(intent7);
                    Intent intent8 = new Intent("android.intent.action.MAIN");
                    intent8.addCategory("android.intent.category.LAUNCHER");
                    intent8.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity"));
                    this.mContext.startActivity(intent8);
                    return;
                } catch (NullPointerException e4) {
                    return;
                } catch (Exception e5) {
                    return;
                }
            }
            Intent intent9 = new Intent("android.intent.action.MAIN");
            intent9.setFlags(268435456);
            int i8 = i;
            if (i > 7) {
                i8 = i - 7;
            }
            intent9.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.PasswdDialogActivity"));
            intent9.setFlags(268468224);
            intent9.putExtra("number", i8);
            intent9.putExtra("lockwarning", i5);
            intent9.putExtra("packagename", packageName);
            try {
                packageInfo = this.mContext.getPackageManager().getPackageInfo("com.launcher.activity", 0);
            } catch (PackageManager.NameNotFoundException e6) {
                packageInfo = null;
                e6.printStackTrace();
            }
            if (packageInfo == null) {
                return;
            }
            try {
                this.mContext.startActivity(intent9);
            } catch (Exception e7) {
            }
        }
    }
}
