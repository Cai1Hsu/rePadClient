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

    }

    @Override // java.util.TimerTask, java.lang.Runnable
    @SuppressLint({"NewApi"})
    public void run() {
        
    }
}
