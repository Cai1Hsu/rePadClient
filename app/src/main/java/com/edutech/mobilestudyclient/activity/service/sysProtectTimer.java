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

/* loaded from: classes.dex */
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
        PackageInfo packageInfo;
        PackageInfo packageInfo2;
        if (this.mContext == null && this.extraContext != null) {
            this.mContext = this.extraContext;
        }
        if (this.mActivityManager == null) {
            this.mActivityManager = (ActivityManager) this.mContext.getSystemService("activity");
        }
        List<ActivityManager.RunningTaskInfo> taskList = this.mActivityManager.getRunningTasks(5);
        if (taskList != null && taskList.size() >= 1) {
            ComponentName topActivity = taskList.get(0).topActivity;
            String packageNameTop = topActivity.getPackageName();
            String classNameTop = topActivity.getClassName();
            flagNeedPasswd = true;
            if (isLiveShow && !this.takeShotAc.equals(classNameTop) && !this.permissionAc.equals(classNameTop) && !this.livePkg.equals(packageNameTop) && !this.liveAc.equals(classNameTop)) {
                int sizeStack = taskList.size();
                int i = 0;
                while (true) {
                    if (i >= sizeStack) {
                        break;
                    }
                    if (!this.livePkg.equals(taskList.get(i).topActivity.getPackageName())) {
                        i++;
                    } else {
                        Log.e("Lock", "Go to liveshow!!," + packageNameTop + "," + classNameTop);
                        Log.e("Lock", "i is" + i);
                        this.mActivityManager.moveTaskToFront(taskList.get(i).id, 2);
                        flagNeedPasswd = false;
                        break;
                    }
                }
            } else if (isInteraction && !this.interPackageName.equals(packageNameTop) && !this.cameraPackageName.equals(packageNameTop) && !this.takeShotAc.equals(classNameTop) && !this.permissionAc.equals(classNameTop) && !this.livePkg.equals(packageNameTop) && !this.liveAc.equals(classNameTop)) {
                int sizeStack2 = taskList.size();
                for (int i2 = 0; i2 < sizeStack2; i2++) {
                    ComponentName tmpcn = taskList.get(i2).topActivity;
                    if (this.interPackageName.equals(tmpcn.getPackageName()) || this.cameraPackageName.equals(tmpcn.getPackageName())) {
                        Log.e("Lock", "Go to Interaction!!," + packageNameTop + "," + classNameTop);
                        Log.e("Lock", "i is" + i2);
                        this.mActivityManager.moveTaskToFront(taskList.get(i2).id, 2);
                        flagNeedPasswd = false;
                        break;
                    }
                }
            }
            SharedPreferences spf = this.mContext.getSharedPreferences("lockscreen", 4);
            boolean locked = spf.getBoolean("locked", false);
            int tempLock = spf.getInt("tmplocked", 0);
            SharedPreferences callSp = this.mContext.getSharedPreferences("allowcall", 4);
            boolean cancall = callSp.getBoolean("cancall", false);
            boolean issdcard = this.mContext.getSharedPreferences("sdcard", 4).getBoolean("sdcard", false);
            if (AppEnvironment.isPDSSZ && flag && (this.testPackageName.equals(packageNameTop) || this.ggpy.equals(packageNameTop) || this.browserPackageName.equals(packageNameTop))) {
                SharedPreferences sharePre = this.mContext.getSharedPreferences("privatekey", 0);
                String ip = sharePre.getString("apihost", "");
                if (!ip.contains("www.ischool365.com")) {
                    if (!locked && tempLock != 1) {
                        SharedPreferences sp = this.mContext.getSharedPreferences("lockscreen", 4);
                        sp.edit().putInt("tmplocked", 1).commit();
                        sp.edit().putLong("tmplockedtime", System.currentTimeMillis()).commit();
                        Intent intent2 = new Intent(AppEnvironment.Intent_LOCKWINDOW);
                        intent2.putExtra("state", LogHelp.TYPE_GUIDANCE);
                        this.mContext.sendBroadcast(intent2);
                    }
                    try {
                        Intent intent = new Intent("android.intent.action.MAIN");
                        intent.setFlags(268468224);
                        intent.addCategory("android.intent.category.LAUNCHER");
                        ComponentName cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                        intent.setComponent(cn);
                        this.mContext.startActivity(intent);
                        return;
                    } catch (Exception e) {
                        return;
                    }
                }
            }
            if (locked && !issdcard) {
                long startTime = spf.getLong("lockstartTime", 0L);
                long delayTime = spf.getLong("lockTime", 0L);
                long currentTime = System.currentTimeMillis();
                if (currentTime - startTime > delayTime) {
                    spf.edit().putLong("lockstartTime", 0L).commit();
                    spf.edit().putLong("lockTime", 0L).commit();
                    spf.edit().putBoolean("locked", false).commit();
                    spf.edit().putInt("tmplocked", 0).commit();
                    spf.edit().putLong("showstarttime", 0L).commit();
                    spf.edit().putInt("shownumber", 1).commit();
                    AppEnvironment.showDialogNumber = 0;
                    AppEnvironment.startTime = 0L;
                    this.mContext.sendBroadcast(new Intent(AppEnvironment.Intent_UNLOCKWINDOW));
                } else if (!"com.launcher.activity".equals(packageNameTop) && !this.wifiWarningClassName.equals(classNameTop) && !"com.android.vpndialogs".equals(packageNameTop) && !"com.edutech.firewall".equals(packageNameTop) && !"com.edutech.wificonn".equals(packageNameTop)) {
                    Intent intent3 = new Intent("android.intent.action.MAIN");
                    intent3.setFlags(268468224);
                    intent3.addCategory("android.intent.category.LAUNCHER");
                    ComponentName cn2 = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                    intent3.setComponent(cn2);
                    this.mContext.startActivity(intent3);
                    return;
                }
            } else if (tempLock == 1 && !issdcard) {
                long tempStartTime = spf.getLong("tmplockedtime", 0L);
                long currentTime2 = System.currentTimeMillis();
                if (currentTime2 - tempStartTime > 300000) {
                    spf.edit().putInt("tmplocked", 2).commit();
                    spf.edit().putLong("tmplockedtime", 0L).commit();
                    this.mContext.sendBroadcast(new Intent(AppEnvironment.Intent_UNLOCKWINDOW));
                } else if (!classNameTop.equals("com.edutech.mobilestudyclient.activity.PasswdDialogActivity") && !"com.launcher.activity".equals(packageNameTop) && !this.wifiWarningClassName.equals(classNameTop) && !"com.android.vpndialogs".equals(packageNameTop) && !"com.edutech.firewall".equals(packageNameTop) && !"com.edutech.wificonn".equals(packageNameTop)) {
                    return;
                }
            }
            if (!classNameTop.equals("com.edutech.mobilestudyclient.activity.PasswdDialogActivity") && !classNameTop.equals("com.android.settings.DeviceAdminAdd")) {
                this.mContext.getSharedPreferences("usbotg", 4);
                if (packageNameTop.contains("com.edutech") || packageNameTop.equals("com.launcher.activity")) {
                    flag = true;
                }
                if (issdcard && flag) {
                    AppEnvironment.showDialogNumber++;
                    Intent intent4 = new Intent("android.intent.action.MAIN");
                    intent4.setFlags(268435456);
                    ComponentName cn3 = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.PasswdDialogActivity");
                    intent4.setComponent(cn3);
                    intent4.setFlags(268468224);
                    intent4.putExtra("number", AppEnvironment.showDialogNumber);
                    intent4.putExtra("lockwarning", 0);
                    intent4.putExtra("packagename", packageNameTop);
                    try {
                        packageInfo2 = this.mContext.getPackageManager().getPackageInfo("com.launcher.activity", 0);
                    } catch (PackageManager.NameNotFoundException e2) {
                        packageInfo2 = null;
                        e2.printStackTrace();
                    }
                    if (packageInfo2 != null) {
                        try {
                            this.mContext.startActivity(intent4);
                        } catch (Exception e3) {
                        }
                    }
                } else if (!this.testPackageName.equals(packageNameTop) || !AppEnvironment.isSDYB || !this.wifiAc.equals(classNameTop)) {
                    if (!this.testPackageName.equals(packageNameTop) || !this.batteryDialogAc.equals(classNameTop)) {
                        if (((this.testPackageName.equals(packageNameTop) && !this.wifiPermission.equals(classNameTop) && !this.wifiWarningClassName.equals(classNameTop)) || this.lenovoWebview.equals(packageNameTop) || this.lenovoQuickSearch.equals(packageNameTop) || this.lananBrowser.equals(packageNameTop) || this.sspy.equals(packageNameTop) || this.lenovoBrowser.equals(packageNameTop) || this.pdfnote.equals(packageNameTop) || this.ssnotes.equals(packageNameTop) || ((this.ggpy.equals(packageNameTop) && !classNameTop.equals(this.permissionQC80A2)) || this.XTPYSZ.equals(classNameTop) || this.emailSM.equals(packageNameTop) || this.uninstallSMPackageActivity.equals(classNameTop) || this.testPackageName2.equals(packageNameTop) || this.huafenPName.equals(packageNameTop) || this.sinaHD.equals(packageNameTop) || this.sinaPhone.equals(packageNameTop) || this.tencentWb.equals(packageNameTop) || this.emailPackageNameP550.equals(packageNameTop) || this.sconnectPackageNameP550.equals(packageNameTop) || this.pinboardPackageNameP550.equals(packageNameTop) || this.inputBaidu.equals(packageNameTop) || this.psharePName.equals(packageNameTop) || ((!cancall && (this.mms.equals(packageNameTop) || this.call.equals(packageNameTop))) || this.hwidPName.equals(packageNameTop) || this.hwdiskPName.equals(packageNameTop) || this.wps1.equals(classNameTop) || this.mobileprintPackageName.equals(packageNameTop) || this.wpsPushActivity.equals(classNameTop) || this.officesuiteClass.equals(classNameTop) || this.emailPName.equals(packageNameTop) || this.wechatPName.equals(packageNameTop) || this.playPName.equals(packageNameTop) || this.qqPName.equals(packageNameTop) || this.walletPName.equals(packageNameTop) || this.baiduMapPName.equals(packageNameTop) || this.storePName.equals(packageNameTop) || this.searchpackageName.equals(packageNameTop) || this.gesturePackageName.equals(packageNameTop) || this.secLauncherPackageName.equals(packageNameTop) || ((this.installerPackageName.equals(packageNameTop) && !classNameTop.equals(this.permissionQC80A) && !classNameTop.equals(this.installAcName)) || this.gallery3dClassName.equals(classNameTop) || this.inputPackageName.equals(packageNameTop) || this.browserPackageName.equals(packageNameTop) || this.tencentBrowserPackageName.equals(packageNameTop) || this.fileBrowserPackageName.equals(packageNameTop) || this.baiduNetdiskPackageName.equals(packageNameTop) || this.activeExplorerPackageName.equals(packageNameTop) || this.kuaiyaPackageName.equals(packageNameTop) || this.samsungAppsPackageName.equals(packageNameTop) || this.autonaviPackageName.equals(packageNameTop) || this.dirPic.equals(packageNameTop) || packageNameTop.contains(this.snote) || this.snotePackageName.equals(packageNameTop))))) && flag && flagNeedPasswd && (!packageNameTop.equals(this.testPackageName) || !classNameTop.equals(this.detailsActivity))) {
                            Log.e(ClearCase.COMMAND_LOCK, String.valueOf(classNameTop) + "," + packageNameTop);
                            SharedPreferences sharePre2 = this.mContext.getSharedPreferences("privatekey", 0);
                            String ip2 = sharePre2.getString("apihost", "");
                            if ((this.testPackageName.equals(packageNameTop) || this.XTPYSZ.equals(classNameTop) || (this.ggpy.equals(packageNameTop) && !classNameTop.equals(this.permissionQC80A2))) && !ip2.contains("www.ischool365.com")) {
                                SharedPreferences sp2 = this.mContext.getSharedPreferences("lockscreen", 4);
                                sp2.edit().putInt("tmplocked", 1).commit();
                                sp2.edit().putLong("tmplockedtime", System.currentTimeMillis()).commit();
                                Intent intent22 = new Intent(AppEnvironment.Intent_LOCKWINDOW);
                                intent22.putExtra("state", LogHelp.TYPE_GUIDANCE);
                                this.mContext.sendBroadcast(intent22);
                                Intent intent5 = new Intent("android.intent.action.MAIN");
                                intent5.setFlags(268468224);
                                intent5.addCategory("android.intent.category.LAUNCHER");
                                ComponentName cn4 = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                                intent5.setComponent(cn4);
                                this.mContext.startActivity(intent5);
                                return;
                            }
                            SharedPreferences sp3 = this.mContext.getSharedPreferences("lockscreen", 4);
                            boolean islocked = sp3.getBoolean("locked", false);
                            long nowTime = System.currentTimeMillis();
                            int showWarning = 0;
                            int istmplocked = sp3.getInt("tmplocked", 0);
                            int tmpNum = sp3.getInt("shownumber", 1);
                            long tmpStartTime = sp3.getLong("showstarttime", 0L);
                            if (tmpNum == 6 || tmpNum == 7 || tmpNum == 13 || tmpNum == 14) {
                                showWarning = 2;
                            }
                            if (tmpStartTime <= 0) {
                                sp3.edit().putLong("showstarttime", nowTime).commit();
                            }
                            if (tmpStartTime <= 0) {
                                tmpStartTime = nowTime;
                            }
                            long second = Math.abs((nowTime - tmpStartTime) / 1000);
                            String state = "0";
                            if (second < TimeConstants.S_HOUR) {
                                if (istmplocked == 0) {
                                    if (tmpNum >= 7) {
                                        islocked = true;
                                        sp3.edit().putInt("tmplocked", 1).commit();
                                        sp3.edit().putLong("tmplockedtime", nowTime).commit();
                                        state = LogHelp.TYPE_GUIDANCE;
                                    }
                                    tmpNum++;
                                    sp3.edit().putInt("shownumber", tmpNum).commit();
                                } else if (istmplocked == 1) {
                                    islocked = true;
                                    state = LogHelp.TYPE_GUIDANCE;
                                } else if (istmplocked == 2) {
                                    if (tmpNum >= 14) {
                                        islocked = true;
                                        state = LogHelp.TYPE_MYWORK;
                                        sp3.edit().putInt("tmplocked", 0).commit();
                                        sp3.edit().putLong("showstarttime", 0L).commit();
                                        sp3.edit().putInt("shownumber", 1).commit();
                                        sp3.edit().putLong("lockstartTime", nowTime).commit();
                                        if (AppEnvironment.isSNZT) {
                                            sp3.edit().putLong("lockTime", 864000000L).commit();
                                        } else {
                                            sp3.edit().putLong("lockTime", 86400000L).commit();
                                        }
                                        sp3.edit().putBoolean("locked", true).commit();
                                        sp3.edit().putBoolean("uploadlockstate", false).commit();
                                    } else {
                                        tmpNum++;
                                        sp3.edit().putInt("shownumber", tmpNum).commit();
                                    }
                                }
                            } else if (second > TimeConstants.S_HOUR && second <= 7200) {
                                if (istmplocked == 0) {
                                    islocked = false;
                                    sp3.edit().putInt("tmplocked", 0).commit();
                                    sp3.edit().putLong("showstarttime", nowTime).commit();
                                    sp3.edit().putInt("shownumber", 1).commit();
                                } else if (istmplocked == 1) {
                                    islocked = true;
                                    state = LogHelp.TYPE_GUIDANCE;
                                    tmpNum++;
                                    sp3.edit().putInt("shownumber", tmpNum).commit();
                                } else if (istmplocked == 2) {
                                    if (tmpNum >= 14) {
                                        islocked = true;
                                        state = LogHelp.TYPE_MYWORK;
                                        sp3.edit().putInt("tmplocked", 0).commit();
                                        sp3.edit().putLong("showstarttime", 0L).commit();
                                        sp3.edit().putInt("shownumber", 1).commit();
                                        sp3.edit().putLong("lockstartTime", nowTime).commit();
                                        if (AppEnvironment.isSNZT) {
                                            sp3.edit().putLong("lockTime", 864000000L).commit();
                                        } else {
                                            sp3.edit().putLong("lockTime", 86400000L).commit();
                                        }
                                        sp3.edit().putBoolean("locked", true).commit();
                                        sp3.edit().putBoolean("uploadlockstate", false).commit();
                                    } else {
                                        tmpNum++;
                                        sp3.edit().putInt("shownumber", tmpNum).commit();
                                    }
                                }
                            } else {
                                islocked = false;
                                sp3.edit().putInt("tmplocked", 0).commit();
                                sp3.edit().putLong("showstarttime", nowTime).commit();
                                sp3.edit().putInt("shownumber", 1).commit();
                            }
                            if (islocked) {
                                try {
                                    Intent intent6 = new Intent(AppEnvironment.Intent_LOCKWINDOW);
                                    intent6.putExtra("state", state);
                                    this.mContext.sendBroadcast(intent6);
                                    Intent newintent = new Intent("android.intent.action.MAIN");
                                    newintent.addCategory("android.intent.category.LAUNCHER");
                                    ComponentName cn5 = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                                    newintent.setComponent(cn5);
                                    this.mContext.startActivity(newintent);
                                    return;
                                } catch (NullPointerException e4) {
                                    return;
                                } catch (Exception e5) {
                                    return;
                                }
                            }
                            Intent intent7 = new Intent("android.intent.action.MAIN");
                            intent7.setFlags(268435456);
                            if (tmpNum > 7) {
                                tmpNum -= 7;
                            }
                            ComponentName cn6 = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.PasswdDialogActivity");
                            intent7.setComponent(cn6);
                            intent7.setFlags(268468224);
                            intent7.putExtra("number", tmpNum);
                            intent7.putExtra("lockwarning", showWarning);
                            intent7.putExtra("packagename", packageNameTop);
                            try {
                                packageInfo = this.mContext.getPackageManager().getPackageInfo("com.launcher.activity", 0);
                            } catch (PackageManager.NameNotFoundException e6) {
                                packageInfo = null;
                                e6.printStackTrace();
                            }
                            if (packageInfo != null) {
                                try {
                                    this.mContext.startActivity(intent7);
                                    return;
                                } catch (Exception e7) {
                                    return;
                                }
                            }
                            return;
                        }
                        if (this.testPackageName.equals(packageNameTop) || this.passwdClassName.equals(classNameTop) || this.testPackageName2.equals(packageNameTop) || this.gesturePackageName.equals(packageNameTop) || this.secLauncherPackageName.equals(packageNameTop) || this.installerPackageName.equals(packageNameTop) || this.gallery3dClassName.equals(classNameTop) || !this.inputPackageName.equals(packageNameTop)) {
                        }
                    }
                }
            }
        }
    }
}
