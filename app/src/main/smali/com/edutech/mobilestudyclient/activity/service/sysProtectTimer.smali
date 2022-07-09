.class public Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;
.super Ljava/util/TimerTask;
.source "sysProtectTimer.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "LockTask"

.field public static flag:Z

.field public static flagNeedPasswd:Z

.field public static isInteraction:Z

.field public static isLiveShow:Z


# instance fields
.field XTPYSZ:Ljava/lang/String;

.field activeExplorerPackageName:Ljava/lang/String;

.field autonaviPackageName:Ljava/lang/String;

.field baiduMapPName:Ljava/lang/String;

.field baiduNetdiskClassName:Ljava/lang/String;

.field baiduNetdiskPackageName:Ljava/lang/String;

.field batteryDialogAc:Ljava/lang/String;

.field browserClassName:Ljava/lang/String;

.field browserPackageName:Ljava/lang/String;

.field call:Ljava/lang/String;

.field camera2Activity:Ljava/lang/String;

.field camera2Pkg:Ljava/lang/String;

.field cameraPackageName:Ljava/lang/String;

.field detailsActivity:Ljava/lang/String;

.field dirPic:Ljava/lang/String;

.field emailPName:Ljava/lang/String;

.field emailPackageNameP550:Ljava/lang/String;

.field emailSM:Ljava/lang/String;

.field public extraContext:Landroid/content/Context;

.field fileBrowserClassName:Ljava/lang/String;

.field fileBrowserPackageName:Ljava/lang/String;

.field gallery3dClassName:Ljava/lang/String;

.field gallery3dPackageName:Ljava/lang/String;

.field gestureClassName:Ljava/lang/String;

.field gesturePackageName:Ljava/lang/String;

.field ggpy:Ljava/lang/String;

.field huafenPName:Ljava/lang/String;

.field hwdiskPName:Ljava/lang/String;

.field hwidPName:Ljava/lang/String;

.field inputBaidu:Ljava/lang/String;

.field inputClassName:Ljava/lang/String;

.field inputPackageName:Ljava/lang/String;

.field installAcName:Ljava/lang/String;

.field installerClassName:Ljava/lang/String;

.field installerPackageName:Ljava/lang/String;

.field interClassName:Ljava/lang/String;

.field interPackageName:Ljava/lang/String;

.field kuaiyaPackageName:Ljava/lang/String;

.field lananBrowser:Ljava/lang/String;

.field lenovoBrowser:Ljava/lang/String;

.field lenovoBrowserActivity:Ljava/lang/String;

.field lenovoQuickSearch:Ljava/lang/String;

.field lenovoWebview:Ljava/lang/String;

.field liveAc:Ljava/lang/String;

.field livePkg:Ljava/lang/String;

.field public mActivityManager:Landroid/app/ActivityManager;

.field public mContext:Landroid/content/Context;

.field mms:Ljava/lang/String;

.field mobileprintPackageName:Ljava/lang/String;

.field officesuiteClass:Ljava/lang/String;

.field passwdClassName:Ljava/lang/String;

.field pdfnote:Ljava/lang/String;

.field permissionAc:Ljava/lang/String;

.field permissionQC80A:Ljava/lang/String;

.field permissionQC80A2:Ljava/lang/String;

.field pinboardPackageNameP550:Ljava/lang/String;

.field playPName:Ljava/lang/String;

.field polarisOffice:Ljava/lang/String;

.field psharePName:Ljava/lang/String;

.field qqPName:Ljava/lang/String;

.field quickOffice:Ljava/lang/String;

.field samsungAppsPackageName:Ljava/lang/String;

.field sconnectPackageNameP550:Ljava/lang/String;

.field searchpackageName:Ljava/lang/String;

.field secLauncherPackageName:Ljava/lang/String;

.field secLauncherclassName:Ljava/lang/String;

.field sinaHD:Ljava/lang/String;

.field sinaPhone:Ljava/lang/String;

.field snote:Ljava/lang/String;

.field snotePackageName:Ljava/lang/String;

.field ssnotes:Ljava/lang/String;

.field sspy:Ljava/lang/String;

.field storePName:Ljava/lang/String;

.field takeShotAc:Ljava/lang/String;

.field takeShotPkg:Ljava/lang/String;

.field tencentBrowseClassName:Ljava/lang/String;

.field tencentBrowserPackageName:Ljava/lang/String;

.field tencentPackageName:Ljava/lang/String;

.field tencentWb:Ljava/lang/String;

.field testClassName:Ljava/lang/String;

.field testPackageName:Ljava/lang/String;

.field testPackageName2:Ljava/lang/String;

.field uninstallSMPackageActivity:Ljava/lang/String;

.field walletPName:Ljava/lang/String;

.field wechatPName:Ljava/lang/String;

.field wifiAc:Ljava/lang/String;

.field wifiPermission:Ljava/lang/String;

.field wifiWarningClassName:Ljava/lang/String;

.field wps1:Ljava/lang/String;

.field wpsPushActivity:Ljava/lang/String;

.field xtPY:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 115
    sput-boolean v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flag:Z

    sput-boolean v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flagNeedPasswd:Z

    .line 116
    sput-boolean v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isInteraction:Z

    .line 117
    const/4 v0, 0x0

    sput-boolean v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isLiveShow:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 156
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 37
    const-string/jumbo v0, "com.android.settings"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName:Ljava/lang/String;

    .line 38
    const-string/jumbo v0, "com.sec.android.app.controlpanel"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName2:Ljava/lang/String;

    .line 39
    const-string/jumbo v0, "com.android.settings.Settings$WifiSettingsActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testClassName:Ljava/lang/String;

    .line 40
    const-string/jumbo v0, "com.android.settings.wifi.WifiWarningDialog"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wifiWarningClassName:Ljava/lang/String;

    .line 41
    const-string/jumbo v0, "com.edutech.android.Protect.PasswdDialogActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->passwdClassName:Ljava/lang/String;

    .line 43
    const-string/jumbo v0, "com.edutech.android.InterAction"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->interPackageName:Ljava/lang/String;

    .line 44
    const-string/jumbo v0, "com.edutech.android.InterAction.HomepageActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->interClassName:Ljava/lang/String;

    .line 46
    const-string/jumbo v0, "com.sec.android.app.camera"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->cameraPackageName:Ljava/lang/String;

    .line 48
    const-string/jumbo v0, "com.sec.android.gesturepad"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->gesturePackageName:Ljava/lang/String;

    .line 49
    const-string/jumbo v0, "com.sec.android.gesturepad.GesturePadActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->gestureClassName:Ljava/lang/String;

    .line 50
    const-string/jumbo v0, "com.sec.android.app.launcher"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->secLauncherPackageName:Ljava/lang/String;

    .line 51
    const-string/jumbo v0, "com.android.launcher2.Launcher"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->secLauncherclassName:Ljava/lang/String;

    .line 53
    const-string/jumbo v0, "com.android.packageinstaller"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->installerPackageName:Ljava/lang/String;

    .line 56
    const-string/jumbo v0, "com.android.packageinstaller.permission.ui.ReviewPermissionsActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->installAcName:Ljava/lang/String;

    .line 57
    const-string/jumbo v0, "com.android.packageinstaller.permission.ui.GrantPermissionsActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->permissionQC80A:Ljava/lang/String;

    .line 58
    const-string/jumbo v0, "com.google.android.apps.inputmethod.libs.framework.core.PermissionsActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->permissionQC80A2:Ljava/lang/String;

    .line 59
    const-string/jumbo v0, "com.android.packageinstaller.UninstallerActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->installerClassName:Ljava/lang/String;

    .line 60
    const-string/jumbo v0, "com.android.mms"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mms:Ljava/lang/String;

    .line 61
    const-string/jumbo v0, "com.android.contacts"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->call:Ljava/lang/String;

    .line 64
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->gallery3dPackageName:Ljava/lang/String;

    .line 65
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->gallery3dClassName:Ljava/lang/String;

    .line 70
    const-string/jumbo v0, "com.samsung.inputmethod"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->inputPackageName:Ljava/lang/String;

    .line 71
    const-string/jumbo v0, "com.samsung.inputmethod.setting.SimeSettingActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->inputClassName:Ljava/lang/String;

    .line 73
    const-string/jumbo v0, "com.android.browser"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->browserPackageName:Ljava/lang/String;

    .line 74
    const-string/jumbo v0, "com.android.browser.BrowserActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->browserClassName:Ljava/lang/String;

    .line 76
    const-string/jumbo v0, "com.tencent.padbrowser"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->tencentBrowserPackageName:Ljava/lang/String;

    .line 77
    const-string/jumbo v0, "com.tencent.padbrowser.MainActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->tencentBrowseClassName:Ljava/lang/String;

    .line 79
    const-string/jumbo v0, "com.sec.android.app.myfiles"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->fileBrowserPackageName:Ljava/lang/String;

    .line 80
    const-string/jumbo v0, "com.sec.android.app.myfiles.Myfiles"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->fileBrowserClassName:Ljava/lang/String;

    .line 82
    const-string/jumbo v0, "com.baidu.netdisk"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->baiduNetdiskPackageName:Ljava/lang/String;

    .line 83
    const-string/jumbo v0, "com.baidu.netdisk.ui.Navigate"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->baiduNetdiskClassName:Ljava/lang/String;

    .line 85
    const-string/jumbo v0, "com.sec.android.app.sbrowser"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->activeExplorerPackageName:Ljava/lang/String;

    .line 87
    const-string/jumbo v0, "com.tencent."

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->tencentPackageName:Ljava/lang/String;

    .line 88
    const-string/jumbo v0, "com.dewmobile.kuaiya"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->kuaiyaPackageName:Ljava/lang/String;

    .line 90
    const-string/jumbo v0, "com.sec.android.app.samsungapps"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->samsungAppsPackageName:Ljava/lang/String;

    .line 92
    const-string/jumbo v0, "com.autonavi.xmgd.navigator.keyboard"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->autonaviPackageName:Ljava/lang/String;

    .line 94
    const-string/jumbo v0, "com.sec.android.app.snotebook"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->snotePackageName:Ljava/lang/String;

    .line 95
    const-string/jumbo v0, "com.baidu.searchbox"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->searchpackageName:Ljava/lang/String;

    .line 96
    const-string/jumbo v0, "com.huawei.fans"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->huafenPName:Ljava/lang/String;

    .line 97
    const-string/jumbo v0, "com.huawei.gamebox"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->playPName:Ljava/lang/String;

    .line 98
    const-string/jumbo v0, "com.huawei.wallet"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->walletPName:Ljava/lang/String;

    .line 99
    const-string/jumbo v0, "com.vmall.client"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->storePName:Ljava/lang/String;

    .line 100
    const-string/jumbo v0, "com.tencent.mobileqq"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->qqPName:Ljava/lang/String;

    .line 101
    const-string/jumbo v0, "com.tencent.mm"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wechatPName:Ljava/lang/String;

    .line 102
    const-string/jumbo v0, "com.baidu.BaiduMap"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->baiduMapPName:Ljava/lang/String;

    .line 103
    const-string/jumbo v0, "com.huawei.gallery.photoshare"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->psharePName:Ljava/lang/String;

    .line 104
    const-string/jumbo v0, "com.android.email"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->emailPName:Ljava/lang/String;

    .line 105
    const-string/jumbo v0, "com.huawei.hwid"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->hwidPName:Ljava/lang/String;

    .line 106
    const-string/jumbo v0, "com.huawei.hidisk"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->hwdiskPName:Ljava/lang/String;

    .line 107
    const-string/jumbo v0, "com.baidu.input_huawei"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->inputBaidu:Ljava/lang/String;

    .line 108
    const-string/jumbo v0, "com.mobisystems.office.files.FileBrowser"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->officesuiteClass:Ljava/lang/String;

    .line 109
    const-string/jumbo v0, "com.android.settings.applications.InstalledAppDetails"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->detailsActivity:Ljava/lang/String;

    .line 110
    const-string/jumbo v0, "cn.wps.moffice.main.local.home.PadHomeActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wpsPushActivity:Ljava/lang/String;

    .line 111
    const-string/jumbo v0, "com.qo.android.am3"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->quickOffice:Ljava/lang/String;

    .line 112
    const-string/jumbo v0, "com.infraware.PolarisOfficeStdForTablet"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->polarisOffice:Ljava/lang/String;

    .line 113
    const-string/jumbo v0, "cn.wps.moffice.documentmanager.DocumentManager"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wps1:Ljava/lang/String;

    .line 114
    const-string/jumbo v0, "com.samsung.android.snote"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->snote:Ljava/lang/String;

    .line 118
    const-string/jumbo v0, "com.sina.weibo"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->sinaPhone:Ljava/lang/String;

    .line 119
    const-string/jumbo v0, "com.sina.weibotab"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->sinaHD:Ljava/lang/String;

    .line 120
    const-string/jumbo v0, "com.tencent.WBlog"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->tencentWb:Ljava/lang/String;

    .line 121
    const-string/jumbo v0, "com.samsung.android.email.ui"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->emailPackageNameP550:Ljava/lang/String;

    .line 122
    const-string/jumbo v0, "com.samsung.android.sconnect"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->sconnectPackageNameP550:Ljava/lang/String;

    .line 123
    const-string/jumbo v0, "com.samsung.android.app.pinboard"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->pinboardPackageNameP550:Ljava/lang/String;

    .line 124
    const-string/jumbo v0, "com.sec.android.app.mobileprint"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mobileprintPackageName:Ljava/lang/String;

    .line 125
    const-string/jumbo v0, "com.sec.android.app.dictionary"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->dirPic:Ljava/lang/String;

    .line 127
    const-string/jumbo v0, "com.samsung.android.email.provider"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->emailSM:Ljava/lang/String;

    .line 129
    const-string/jumbo v0, "com.android.packageinstaller.UninstallerActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->uninstallSMPackageActivity:Ljava/lang/String;

    .line 130
    const-string/jumbo v0, "com.google.android.inputmethod.pinyin"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->ggpy:Ljava/lang/String;

    .line 131
    const-string/jumbo v0, "com.android.inputmethod.latin"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->xtPY:Ljava/lang/String;

    .line 132
    const-string/jumbo v0, "com.android.inputmethod.latin.settings.SettingsActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->XTPYSZ:Ljava/lang/String;

    .line 133
    const-string/jumbo v0, "com.samsung.android.app.notes"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->ssnotes:Ljava/lang/String;

    .line 134
    const-string/jumbo v0, "com.samsung.android.spdfnote"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->pdfnote:Ljava/lang/String;

    .line 135
    const-string/jumbo v0, "com.sec.android.inputmethod"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->sspy:Ljava/lang/String;

    .line 136
    const-string/jumbo v0, "org.codeaurora.swe.browser.dev"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lananBrowser:Ljava/lang/String;

    .line 137
    const-string/jumbo v0, "org.codeaurora.swe.browser.beta"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lenovoBrowser:Ljava/lang/String;

    .line 138
    const-string/jumbo v0, "com.android.browser.BrowserActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lenovoBrowserActivity:Ljava/lang/String;

    .line 139
    const-string/jumbo v0, "com.android.webview"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lenovoWebview:Ljava/lang/String;

    .line 140
    const-string/jumbo v0, "com.android.quicksearchbox"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lenovoQuickSearch:Ljava/lang/String;

    .line 142
    const-string/jumbo v0, "com.android.camera2"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->camera2Pkg:Ljava/lang/String;

    .line 143
    const-string/jumbo v0, "com.android.camera.CameraLauncher"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->camera2Activity:Ljava/lang/String;

    .line 145
    const-string/jumbo v0, "com.edutech.screenshot"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->takeShotPkg:Ljava/lang/String;

    .line 146
    const-string/jumbo v0, "com.edutech.screenshot.ScreenShotActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->takeShotAc:Ljava/lang/String;

    .line 147
    const-string/jumbo v0, "com.android.systemui.media.MediaProjectionPermissionActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->permissionAc:Ljava/lang/String;

    .line 148
    const-string/jumbo v0, "com.edutech.actionplayer"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->livePkg:Ljava/lang/String;

    .line 149
    const-string/jumbo v0, "com.edutech.actionplayer.SmartPlayer"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->liveAc:Ljava/lang/String;

    .line 150
    const-string/jumbo v0, "com.android.settings.wifi.WifiPickerActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wifiAc:Ljava/lang/String;

    .line 151
    const-string/jumbo v0, "com.android.settings.fuelgauge.RequestIgnoreBatteryOptimizations"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->batteryDialogAc:Ljava/lang/String;

    .line 153
    const-string/jumbo v0, "com.android.settings.wifi.RequestToggleWiFiActivity"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wifiPermission:Ljava/lang/String;

    .line 157
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    .line 159
    const-string/jumbo v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 158
    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mActivityManager:Landroid/app/ActivityManager;

    .line 160
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->extraContext:Landroid/content/Context;

    .line 161
    return-void
.end method


# virtual methods
.method public run()V
    .locals 54
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    if-nez v50, :cond_0

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->extraContext:Landroid/content/Context;

    move-object/from16 v50, v0

    if-eqz v50, :cond_0

    .line 169
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->extraContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    .line 172
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mActivityManager:Landroid/app/ActivityManager;

    move-object/from16 v50, v0

    if-nez v50, :cond_1

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "activity"

    invoke-virtual/range {v50 .. v51}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Landroid/app/ActivityManager;

    move-object/from16 v0, v50

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mActivityManager:Landroid/app/ActivityManager;

    .line 175
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mActivityManager:Landroid/app/ActivityManager;

    move-object/from16 v50, v0

    const/16 v51, 0x5

    invoke-virtual/range {v50 .. v51}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v41

    .line 177
    .local v41, "taskList":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningTaskInfo;>;"
    if-eqz v41, :cond_2

    invoke-interface/range {v41 .. v41}, Ljava/util/List;->size()I

    move-result v50

    const/16 v51, 0x1

    move/from16 v0, v50

    move/from16 v1, v51

    if-ge v0, v1, :cond_3

    .line 811
    :cond_2
    :goto_0
    return-void

    .line 181
    :cond_3
    const/16 v50, 0x0

    move-object/from16 v0, v41

    move/from16 v1, v50

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Landroid/app/ActivityManager$RunningTaskInfo;

    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    move-object/from16 v49, v0

    .line 182
    .local v49, "topActivity":Landroid/content/ComponentName;
    invoke-virtual/range {v49 .. v49}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v29

    .line 183
    .local v29, "packageNameTop":Ljava/lang/String;
    invoke-virtual/range {v49 .. v49}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v6

    .line 186
    .local v6, "classNameTop":Ljava/lang/String;
    const/16 v50, 0x1

    sput-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flagNeedPasswd:Z

    .line 187
    sget-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isLiveShow:Z

    if-eqz v50, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->takeShotAc:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->permissionAc:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->livePkg:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->liveAc:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_9

    .line 188
    invoke-interface/range {v41 .. v41}, Ljava/util/List;->size()I

    move-result v34

    .line 190
    .local v34, "sizeStack":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1
    move/from16 v0, v34

    if-lt v13, v0, :cond_7

    .line 222
    .end local v13    # "i":I
    .end local v34    # "sizeStack":I
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "lockscreen"

    const/16 v52, 0x4

    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v37

    .line 223
    .local v37, "spf":Landroid/content/SharedPreferences;
    const-string/jumbo v50, "locked"

    const/16 v51, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, v50

    move/from16 v2, v51

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v20

    .line 224
    .local v20, "locked":Z
    const-string/jumbo v50, "tmplocked"

    const/16 v51, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, v50

    move/from16 v2, v51

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v42

    .line 225
    .local v42, "tempLock":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "allowcall"

    const/16 v52, 0x4

    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 226
    .local v4, "callSp":Landroid/content/SharedPreferences;
    const-string/jumbo v50, "cancall"

    const/16 v51, 0x0

    move-object/from16 v0, v50

    move/from16 v1, v51

    invoke-interface {v4, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 227
    .local v5, "cancall":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "sdcard"

    const/16 v52, 0x4

    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v50

    const-string/jumbo v51, "sdcard"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v18

    .line 229
    .local v18, "issdcard":Z
    sget-boolean v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPDSSZ:Z

    if-eqz v50, :cond_c

    sget-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flag:Z

    if-eqz v50, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->ggpy:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->browserPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_c

    .line 231
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "privatekey"

    .line 232
    const/16 v52, 0x0

    .line 231
    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v32

    .line 233
    .local v32, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v50, "apihost"

    const-string/jumbo v51, ""

    move-object/from16 v0, v32

    move-object/from16 v1, v50

    move-object/from16 v2, v51

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 234
    .local v16, "ip":Ljava/lang/String;
    const-string/jumbo v50, "www.ischool365.com"

    move-object/from16 v0, v16

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v50

    if-nez v50, :cond_c

    .line 235
    if-nez v20, :cond_6

    const/16 v50, 0x1

    move/from16 v0, v42

    move/from16 v1, v50

    if-eq v0, v1, :cond_6

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "lockscreen"

    const/16 v52, 0x4

    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v35

    .line 237
    .local v35, "sp":Landroid/content/SharedPreferences;
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 238
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplockedtime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v52

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 239
    new-instance v15, Landroid/content/Intent;

    sget-object v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_LOCKWINDOW:Ljava/lang/String;

    move-object/from16 v0, v50

    invoke-direct {v15, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 240
    .local v15, "intent2":Landroid/content/Intent;
    const-string/jumbo v50, "state"

    const-string/jumbo v51, "1"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-virtual {v15, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v15}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 244
    .end local v15    # "intent2":Landroid/content/Intent;
    .end local v35    # "sp":Landroid/content/SharedPreferences;
    :cond_6
    :try_start_0
    new-instance v14, Landroid/content/Intent;

    const-string/jumbo v50, "android.intent.action.MAIN"

    move-object/from16 v0, v50

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 245
    .local v14, "intent":Landroid/content/Intent;
    const v50, 0x10008000

    move/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 246
    const-string/jumbo v50, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 247
    new-instance v7, Landroid/content/ComponentName;

    const-string/jumbo v50, "com.launcher.activity"

    const-string/jumbo v51, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-direct {v7, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .local v7, "cn":Landroid/content/ComponentName;
    invoke-virtual {v14, v7}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v14}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 250
    .end local v7    # "cn":Landroid/content/ComponentName;
    .end local v14    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v50

    goto/16 :goto_0

    .line 191
    .end local v4    # "callSp":Landroid/content/SharedPreferences;
    .end local v5    # "cancall":Z
    .end local v16    # "ip":Ljava/lang/String;
    .end local v18    # "issdcard":Z
    .end local v20    # "locked":Z
    .end local v32    # "sharePre":Landroid/content/SharedPreferences;
    .end local v37    # "spf":Landroid/content/SharedPreferences;
    .end local v42    # "tempLock":I
    .restart local v13    # "i":I
    .restart local v34    # "sizeStack":I
    :cond_7
    move-object/from16 v0, v41

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Landroid/app/ActivityManager$RunningTaskInfo;

    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    move-object/from16 v48, v0

    .line 192
    .local v48, "tmpcn":Landroid/content/ComponentName;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->livePkg:Ljava/lang/String;

    move-object/from16 v50, v0

    invoke-virtual/range {v48 .. v48}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v51

    invoke-virtual/range {v50 .. v51}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_8

    .line 194
    const-string/jumbo v50, "Lock"

    new-instance v51, Ljava/lang/StringBuilder;

    const-string/jumbo v52, "Go to liveshow!!,"

    invoke-direct/range {v51 .. v52}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v51

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v51

    const-string/jumbo v52, ","

    invoke-virtual/range {v51 .. v52}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v51

    move-object/from16 v0, v51

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v51

    invoke-virtual/range {v51 .. v51}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v51

    invoke-static/range {v50 .. v51}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    const-string/jumbo v50, "Lock"

    new-instance v51, Ljava/lang/StringBuilder;

    const-string/jumbo v52, "i is"

    invoke-direct/range {v51 .. v52}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v51

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v51

    invoke-virtual/range {v51 .. v51}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v51

    invoke-static/range {v50 .. v51}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mActivityManager:Landroid/app/ActivityManager;

    move-object/from16 v51, v0

    move-object/from16 v0, v41

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Landroid/app/ActivityManager$RunningTaskInfo;

    move-object/from16 v0, v50

    iget v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->id:I

    move/from16 v50, v0

    .line 197
    const/16 v52, 0x2

    .line 196
    move-object/from16 v0, v51

    move/from16 v1, v50

    move/from16 v2, v52

    invoke-virtual {v0, v1, v2}, Landroid/app/ActivityManager;->moveTaskToFront(II)V

    .line 198
    const/16 v50, 0x0

    sput-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flagNeedPasswd:Z

    goto/16 :goto_2

    .line 190
    :cond_8
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1

    .line 202
    .end local v13    # "i":I
    .end local v34    # "sizeStack":I
    .end local v48    # "tmpcn":Landroid/content/ComponentName;
    :cond_9
    sget-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isInteraction:Z

    if-eqz v50, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->interPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_4

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->cameraPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_4

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->takeShotAc:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->permissionAc:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->livePkg:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->liveAc:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_4

    .line 206
    invoke-interface/range {v41 .. v41}, Ljava/util/List;->size()I

    move-result v34

    .line 208
    .restart local v34    # "sizeStack":I
    const/4 v13, 0x0

    .restart local v13    # "i":I
    :goto_3
    move/from16 v0, v34

    if-ge v13, v0, :cond_4

    .line 209
    move-object/from16 v0, v41

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Landroid/app/ActivityManager$RunningTaskInfo;

    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    move-object/from16 v48, v0

    .line 210
    .restart local v48    # "tmpcn":Landroid/content/ComponentName;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->interPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    invoke-virtual/range {v48 .. v48}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v51

    invoke-virtual/range {v50 .. v51}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_a

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->cameraPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    invoke-virtual/range {v48 .. v48}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v51

    invoke-virtual/range {v50 .. v51}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_b

    .line 213
    :cond_a
    const-string/jumbo v50, "Lock"

    new-instance v51, Ljava/lang/StringBuilder;

    const-string/jumbo v52, "Go to Interaction!!,"

    invoke-direct/range {v51 .. v52}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v51

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v51

    const-string/jumbo v52, ","

    invoke-virtual/range {v51 .. v52}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v51

    move-object/from16 v0, v51

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v51

    invoke-virtual/range {v51 .. v51}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v51

    invoke-static/range {v50 .. v51}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    const-string/jumbo v50, "Lock"

    new-instance v51, Ljava/lang/StringBuilder;

    const-string/jumbo v52, "i is"

    invoke-direct/range {v51 .. v52}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v51

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v51

    invoke-virtual/range {v51 .. v51}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v51

    invoke-static/range {v50 .. v51}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mActivityManager:Landroid/app/ActivityManager;

    move-object/from16 v51, v0

    move-object/from16 v0, v41

    invoke-interface {v0, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Landroid/app/ActivityManager$RunningTaskInfo;

    move-object/from16 v0, v50

    iget v0, v0, Landroid/app/ActivityManager$RunningTaskInfo;->id:I

    move/from16 v50, v0

    .line 216
    const/16 v52, 0x2

    .line 215
    move-object/from16 v0, v51

    move/from16 v1, v50

    move/from16 v2, v52

    invoke-virtual {v0, v1, v2}, Landroid/app/ActivityManager;->moveTaskToFront(II)V

    .line 217
    const/16 v50, 0x0

    sput-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flagNeedPasswd:Z

    goto/16 :goto_2

    .line 208
    :cond_b
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_3

    .line 257
    .end local v13    # "i":I
    .end local v34    # "sizeStack":I
    .end local v48    # "tmpcn":Landroid/content/ComponentName;
    .restart local v4    # "callSp":Landroid/content/SharedPreferences;
    .restart local v5    # "cancall":Z
    .restart local v18    # "issdcard":Z
    .restart local v20    # "locked":Z
    .restart local v37    # "spf":Landroid/content/SharedPreferences;
    .restart local v42    # "tempLock":I
    :cond_c
    if-eqz v20, :cond_11

    if-nez v18, :cond_11

    .line 259
    const-string/jumbo v50, "lockstartTime"

    const-wide/16 v52, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, v50

    move-wide/from16 v2, v52

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v38

    .line 260
    .local v38, "startTime":J
    const-string/jumbo v50, "lockTime"

    const-wide/16 v52, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, v50

    move-wide/from16 v2, v52

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 261
    .local v10, "delayTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 263
    .local v8, "currentTime":J
    sub-long v50, v8, v38

    cmp-long v50, v50, v10

    if-lez v50, :cond_10

    .line 265
    invoke-interface/range {v37 .. v37}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "lockstartTime"

    const-wide/16 v52, 0x0

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 266
    invoke-interface/range {v37 .. v37}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "lockTime"

    const-wide/16 v52, 0x0

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 267
    invoke-interface/range {v37 .. v37}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "locked"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 268
    invoke-interface/range {v37 .. v37}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 269
    invoke-interface/range {v37 .. v37}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "showstarttime"

    const-wide/16 v52, 0x0

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 270
    invoke-interface/range {v37 .. v37}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 271
    const/16 v50, 0x0

    sput v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->showDialogNumber:I

    .line 272
    const-wide/16 v50, 0x0

    sput-wide v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->startTime:J

    .line 273
    new-instance v14, Landroid/content/Intent;

    sget-object v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_UNLOCKWINDOW:Ljava/lang/String;

    move-object/from16 v0, v50

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 274
    .restart local v14    # "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v14}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 304
    .end local v8    # "currentTime":J
    .end local v10    # "delayTime":J
    .end local v14    # "intent":Landroid/content/Intent;
    .end local v38    # "startTime":J
    :cond_d
    :goto_4
    const-string/jumbo v50, "com.edutech.mobilestudyclient.activity.PasswdDialogActivity"

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 308
    const-string/jumbo v50, "com.android.settings.DeviceAdminAdd"

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "usbotg"

    const/16 v52, 0x4

    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v36

    .line 334
    .local v36, "sp2":Landroid/content/SharedPreferences;
    const-string/jumbo v50, "com.edutech"

    move-object/from16 v0, v29

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v50

    if-nez v50, :cond_e

    const-string/jumbo v50, "com.launcher.activity"

    move-object/from16 v0, v29

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_f

    .line 336
    :cond_e
    const/16 v50, 0x1

    sput-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flag:Z

    .line 343
    :cond_f
    if-eqz v18, :cond_13

    sget-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flag:Z

    if-eqz v50, :cond_13

    .line 353
    const/16 v33, 0x0

    .line 403
    .local v33, "showWarning":I
    sget v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->showDialogNumber:I

    add-int/lit8 v50, v50, 0x1

    sput v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->showDialogNumber:I

    .line 407
    new-instance v14, Landroid/content/Intent;

    const-string/jumbo v50, "android.intent.action.MAIN"

    move-object/from16 v0, v50

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 408
    .restart local v14    # "intent":Landroid/content/Intent;
    const/high16 v50, 0x10000000

    move/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 413
    new-instance v7, Landroid/content/ComponentName;

    const-string/jumbo v50, "com.launcher.activity"

    .line 414
    const-string/jumbo v51, "com.edutech.mobilestudyclient.activity.PasswdDialogActivity"

    .line 413
    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-direct {v7, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    .restart local v7    # "cn":Landroid/content/ComponentName;
    invoke-virtual {v14, v7}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 416
    const v50, 0x10008000

    move/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 417
    const-string/jumbo v50, "number"

    sget v51, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->showDialogNumber:I

    move-object/from16 v0, v50

    move/from16 v1, v51

    invoke-virtual {v14, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 418
    const-string/jumbo v50, "lockwarning"

    move-object/from16 v0, v50

    move/from16 v1, v33

    invoke-virtual {v14, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 419
    const-string/jumbo v50, "packagename"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v14, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 422
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    invoke-virtual/range {v50 .. v50}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v50

    .line 423
    const-string/jumbo v51, "com.launcher.activity"

    const/16 v52, 0x0

    .line 422
    invoke-virtual/range {v50 .. v52}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v28

    .line 429
    .local v28, "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_5
    if-eqz v28, :cond_2

    .line 430
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v14}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 432
    :catch_1
    move-exception v50

    goto/16 :goto_0

    .line 275
    .end local v7    # "cn":Landroid/content/ComponentName;
    .end local v14    # "intent":Landroid/content/Intent;
    .end local v28    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v33    # "showWarning":I
    .end local v36    # "sp2":Landroid/content/SharedPreferences;
    .restart local v8    # "currentTime":J
    .restart local v10    # "delayTime":J
    .restart local v38    # "startTime":J
    :cond_10
    const-string/jumbo v50, "com.launcher.activity"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wifiWarningClassName:Ljava/lang/String;

    move-object/from16 v50, v0

    .line 276
    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    const-string/jumbo v50, "com.android.vpndialogs"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    const-string/jumbo v50, "com.edutech.firewall"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    const-string/jumbo v50, "com.edutech.wificonn"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    .line 278
    new-instance v14, Landroid/content/Intent;

    const-string/jumbo v50, "android.intent.action.MAIN"

    move-object/from16 v0, v50

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 279
    .restart local v14    # "intent":Landroid/content/Intent;
    const v50, 0x10008000

    move/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 280
    const-string/jumbo v50, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 281
    new-instance v7, Landroid/content/ComponentName;

    const-string/jumbo v50, "com.launcher.activity"

    const-string/jumbo v51, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-direct {v7, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .restart local v7    # "cn":Landroid/content/ComponentName;
    invoke-virtual {v14, v7}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v14}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 286
    .end local v7    # "cn":Landroid/content/ComponentName;
    .end local v8    # "currentTime":J
    .end local v10    # "delayTime":J
    .end local v14    # "intent":Landroid/content/Intent;
    .end local v38    # "startTime":J
    :cond_11
    const/16 v50, 0x1

    move/from16 v0, v42

    move/from16 v1, v50

    if-ne v0, v1, :cond_d

    if-nez v18, :cond_d

    .line 288
    const-string/jumbo v50, "tmplockedtime"

    const-wide/16 v52, 0x0

    move-object/from16 v0, v37

    move-object/from16 v1, v50

    move-wide/from16 v2, v52

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v44

    .line 289
    .local v44, "tempStartTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 290
    .restart local v8    # "currentTime":J
    sub-long v50, v8, v44

    const-wide/32 v52, 0x493e0

    cmp-long v50, v50, v52

    if-lez v50, :cond_12

    .line 292
    invoke-interface/range {v37 .. v37}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x2

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 293
    invoke-interface/range {v37 .. v37}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplockedtime"

    const-wide/16 v52, 0x0

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 294
    new-instance v14, Landroid/content/Intent;

    sget-object v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_UNLOCKWINDOW:Ljava/lang/String;

    move-object/from16 v0, v50

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 295
    .restart local v14    # "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v14}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_4

    .line 297
    .end local v14    # "intent":Landroid/content/Intent;
    :cond_12
    const-string/jumbo v50, "com.edutech.mobilestudyclient.activity.PasswdDialogActivity"

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    const-string/jumbo v50, "com.launcher.activity"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wifiWarningClassName:Ljava/lang/String;

    move-object/from16 v50, v0

    .line 298
    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    const-string/jumbo v50, "com.android.vpndialogs"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    const-string/jumbo v50, "com.edutech.firewall"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    const-string/jumbo v50, "com.edutech.wificonn"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_d

    goto/16 :goto_0

    .line 424
    .end local v8    # "currentTime":J
    .end local v44    # "tempStartTime":J
    .restart local v7    # "cn":Landroid/content/ComponentName;
    .restart local v14    # "intent":Landroid/content/Intent;
    .restart local v33    # "showWarning":I
    .restart local v36    # "sp2":Landroid/content/SharedPreferences;
    :catch_2
    move-exception v12

    .line 425
    .local v12, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/16 v28, 0x0

    .line 426
    .restart local v28    # "packageInfo":Landroid/content/pm/PackageInfo;
    invoke-virtual {v12}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_5

    .line 436
    .end local v7    # "cn":Landroid/content/ComponentName;
    .end local v12    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v14    # "intent":Landroid/content/Intent;
    .end local v28    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v33    # "showWarning":I
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_14

    sget-boolean v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v50, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wifiAc:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 437
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->batteryDialogAc:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 438
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wifiPermission:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wifiWarningClassName:Ljava/lang/String;

    move-object/from16 v50, v0

    .line 439
    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_1a

    .line 440
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lenovoWebview:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 441
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lenovoQuickSearch:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 442
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lananBrowser:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 443
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->sspy:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 444
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->lenovoBrowser:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 445
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->pdfnote:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 446
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->ssnotes:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->ggpy:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->permissionQC80A2:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_1a

    .line 448
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->XTPYSZ:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->emailSM:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->uninstallSMPackageActivity:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 451
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName2:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->huafenPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 453
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->sinaHD:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->sinaPhone:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 455
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->tencentWb:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 456
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->emailPackageNameP550:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 457
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->sconnectPackageNameP550:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 458
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->pinboardPackageNameP550:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 459
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->inputBaidu:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 460
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->psharePName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 461
    if-nez v5, :cond_18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mms:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->call:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 462
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->hwidPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 463
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->hwdiskPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 464
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wps1:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 465
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mobileprintPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 466
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wpsPushActivity:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 467
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->officesuiteClass:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 468
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->emailPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 469
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->wechatPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 470
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->playPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 471
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->qqPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 472
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->walletPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 473
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->baiduMapPName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 474
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->storePName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 475
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->searchpackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 476
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->gesturePackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 477
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->secLauncherPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 478
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->installerPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->permissionQC80A:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->installAcName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_1a

    .line 479
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->gallery3dClassName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->inputPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 481
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->browserPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 482
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->tencentBrowserPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 483
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->fileBrowserPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->baiduNetdiskPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 485
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->activeExplorerPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 486
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->kuaiyaPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 487
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->samsungAppsPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 488
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->autonaviPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 489
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->dirPic:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 490
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->snote:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v50

    if-nez v50, :cond_1a

    .line 491
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->snotePackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_30

    .line 494
    :cond_1a
    sget-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flag:Z

    if-eqz v50, :cond_30

    sget-boolean v50, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->flagNeedPasswd:Z

    if-eqz v50, :cond_30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_1b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->detailsActivity:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_30

    .line 498
    :cond_1b
    const-string/jumbo v50, "lock"

    new-instance v51, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v52

    invoke-direct/range {v51 .. v52}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v52, ","

    invoke-virtual/range {v51 .. v52}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v51

    move-object/from16 v0, v51

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v51

    invoke-virtual/range {v51 .. v51}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v51

    invoke-static/range {v50 .. v51}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "privatekey"

    .line 500
    const/16 v52, 0x0

    .line 499
    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v32

    .line 501
    .restart local v32    # "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v50, "apihost"

    const-string/jumbo v51, ""

    move-object/from16 v0, v32

    move-object/from16 v1, v50

    move-object/from16 v2, v51

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 502
    .restart local v16    # "ip":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->XTPYSZ:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->ggpy:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-eqz v50, :cond_1d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->permissionQC80A2:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_1d

    :cond_1c
    const-string/jumbo v50, "www.ischool365.com"

    move-object/from16 v0, v16

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v50

    if-nez v50, :cond_1d

    .line 503
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "lockscreen"

    const/16 v52, 0x4

    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v35

    .line 504
    .restart local v35    # "sp":Landroid/content/SharedPreferences;
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 505
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplockedtime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v52

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 507
    new-instance v15, Landroid/content/Intent;

    sget-object v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_LOCKWINDOW:Ljava/lang/String;

    move-object/from16 v0, v50

    invoke-direct {v15, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 508
    .restart local v15    # "intent2":Landroid/content/Intent;
    const-string/jumbo v50, "state"

    const-string/jumbo v51, "1"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-virtual {v15, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 509
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v15}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 511
    new-instance v14, Landroid/content/Intent;

    const-string/jumbo v50, "android.intent.action.MAIN"

    move-object/from16 v0, v50

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 512
    .restart local v14    # "intent":Landroid/content/Intent;
    const v50, 0x10008000

    move/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 513
    const-string/jumbo v50, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 514
    new-instance v7, Landroid/content/ComponentName;

    const-string/jumbo v50, "com.launcher.activity"

    const-string/jumbo v51, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-direct {v7, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    .restart local v7    # "cn":Landroid/content/ComponentName;
    invoke-virtual {v14, v7}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 516
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v14}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 519
    .end local v7    # "cn":Landroid/content/ComponentName;
    .end local v14    # "intent":Landroid/content/Intent;
    .end local v15    # "intent2":Landroid/content/Intent;
    .end local v35    # "sp":Landroid/content/SharedPreferences;
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    const-string/jumbo v51, "lockscreen"

    const/16 v52, 0x4

    invoke-virtual/range {v50 .. v52}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v35

    .line 520
    .restart local v35    # "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v50, "locked"

    const/16 v51, 0x0

    move-object/from16 v0, v35

    move-object/from16 v1, v50

    move/from16 v2, v51

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v17

    .line 521
    .local v17, "islocked":Z
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    .line 522
    .local v22, "nowTime":J
    const/16 v33, 0x0

    .line 525
    .restart local v33    # "showWarning":I
    const-string/jumbo v50, "tmplocked"

    const/16 v51, 0x0

    move-object/from16 v0, v35

    move-object/from16 v1, v50

    move/from16 v2, v51

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v19

    .line 526
    .local v19, "istmplocked":I
    const-string/jumbo v50, "shownumber"

    const/16 v51, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v50

    move/from16 v2, v51

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v43

    .line 527
    .local v43, "tmpNum":I
    const-string/jumbo v50, "showstarttime"

    const-wide/16 v52, 0x0

    move-object/from16 v0, v35

    move-object/from16 v1, v50

    move-wide/from16 v2, v52

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v46

    .line 528
    .local v46, "tmpStartTime":J
    const/16 v24, 0x4

    .local v24, "num1":I
    const/16 v25, 0x5

    .local v25, "num2":I
    const/16 v26, 0x9

    .local v26, "num3":I
    const/16 v27, 0xa

    .line 531
    .local v27, "num4":I
    const/16 v24, 0x6

    const/16 v25, 0x7

    const/16 v26, 0xd

    const/16 v27, 0xe

    .line 533
    move/from16 v0, v43

    move/from16 v1, v24

    if-eq v0, v1, :cond_1e

    move/from16 v0, v43

    move/from16 v1, v25

    if-eq v0, v1, :cond_1e

    move/from16 v0, v43

    move/from16 v1, v26

    if-eq v0, v1, :cond_1e

    move/from16 v0, v43

    move/from16 v1, v27

    if-ne v0, v1, :cond_1f

    .line 535
    :cond_1e
    const/16 v33, 0x2

    .line 537
    :cond_1f
    const-wide/16 v50, 0x0

    cmp-long v50, v46, v50

    if-gtz v50, :cond_20

    .line 539
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "showstarttime"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move-wide/from16 v2, v22

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 541
    :cond_20
    const-wide/16 v50, 0x0

    cmp-long v50, v46, v50

    if-gtz v50, :cond_21

    move-wide/from16 v46, v22

    .line 542
    :cond_21
    sub-long v50, v22, v46

    const-wide/16 v52, 0x3e8

    div-long v50, v50, v52

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->abs(J)J

    move-result-wide v30

    .line 543
    .local v30, "second":J
    const-string/jumbo v40, "0"

    .line 545
    .local v40, "state":Ljava/lang/String;
    const-wide/16 v50, 0xe10

    cmp-long v50, v30, v50

    if-gez v50, :cond_28

    .line 548
    if-nez v19, :cond_24

    .line 550
    move/from16 v0, v43

    move/from16 v1, v25

    if-lt v0, v1, :cond_22

    .line 552
    const/16 v17, 0x1

    .line 553
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 554
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplockedtime"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move-wide/from16 v2, v22

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 555
    const-string/jumbo v40, "1"

    .line 558
    :cond_22
    add-int/lit8 v43, v43, 0x1

    .line 560
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move/from16 v2, v43

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 647
    :cond_23
    :goto_6
    if-eqz v17, :cond_2e

    .line 651
    :try_start_3
    new-instance v14, Landroid/content/Intent;

    sget-object v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_LOCKWINDOW:Ljava/lang/String;

    move-object/from16 v0, v50

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 652
    .restart local v14    # "intent":Landroid/content/Intent;
    const-string/jumbo v50, "state"

    move-object/from16 v0, v50

    move-object/from16 v1, v40

    invoke-virtual {v14, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 653
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v14}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 654
    new-instance v21, Landroid/content/Intent;

    const-string/jumbo v50, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v50

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 656
    .local v21, "newintent":Landroid/content/Intent;
    const-string/jumbo v50, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 657
    new-instance v7, Landroid/content/ComponentName;

    const-string/jumbo v50, "com.launcher.activity"

    const-string/jumbo v51, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-direct {v7, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 658
    .restart local v7    # "cn":Landroid/content/ComponentName;
    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 659
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    goto/16 :goto_0

    .line 660
    .end local v7    # "cn":Landroid/content/ComponentName;
    .end local v14    # "intent":Landroid/content/Intent;
    .end local v21    # "newintent":Landroid/content/Intent;
    :catch_3
    move-exception v50

    goto/16 :goto_0

    .line 561
    :cond_24
    const/16 v50, 0x1

    move/from16 v0, v19

    move/from16 v1, v50

    if-ne v0, v1, :cond_25

    .line 563
    const/16 v17, 0x1

    .line 564
    const-string/jumbo v40, "1"

    .line 565
    goto :goto_6

    :cond_25
    const/16 v50, 0x2

    move/from16 v0, v19

    move/from16 v1, v50

    if-ne v0, v1, :cond_23

    .line 568
    move/from16 v0, v43

    move/from16 v1, v27

    if-lt v0, v1, :cond_27

    .line 570
    const/16 v17, 0x1

    .line 571
    const-string/jumbo v40, "2"

    .line 572
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 573
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "showstarttime"

    const-wide/16 v52, 0x0

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 574
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 575
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "lockstartTime"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move-wide/from16 v2, v22

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 576
    sget-boolean v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v50, :cond_26

    .line 578
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "lockTime"

    const-wide/32 v52, 0x337f9800

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 583
    :goto_7
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "locked"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 584
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "uploadlockstate"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_6

    .line 581
    :cond_26
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "lockTime"

    const-wide/32 v52, 0x5265c00

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_7

    .line 588
    :cond_27
    add-int/lit8 v43, v43, 0x1

    .line 589
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move/from16 v2, v43

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_6

    .line 593
    :cond_28
    const-wide/16 v50, 0xe10

    cmp-long v50, v30, v50

    if-lez v50, :cond_2d

    const-wide/16 v50, 0x1c20

    cmp-long v50, v30, v50

    if-gtz v50, :cond_2d

    .line 596
    if-nez v19, :cond_29

    .line 598
    const/16 v17, 0x0

    .line 599
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 600
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "showstarttime"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move-wide/from16 v2, v22

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 601
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_6

    .line 603
    :cond_29
    const/16 v50, 0x1

    move/from16 v0, v19

    move/from16 v1, v50

    if-ne v0, v1, :cond_2a

    .line 605
    const/16 v17, 0x1

    .line 606
    const-string/jumbo v40, "1"

    .line 607
    add-int/lit8 v43, v43, 0x1

    .line 608
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move/from16 v2, v43

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_6

    .line 610
    :cond_2a
    const/16 v50, 0x2

    move/from16 v0, v19

    move/from16 v1, v50

    if-ne v0, v1, :cond_23

    .line 612
    move/from16 v0, v43

    move/from16 v1, v27

    if-lt v0, v1, :cond_2c

    .line 614
    const/16 v17, 0x1

    .line 615
    const-string/jumbo v40, "2"

    .line 616
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 617
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "showstarttime"

    const-wide/16 v52, 0x0

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 618
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 619
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "lockstartTime"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move-wide/from16 v2, v22

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 620
    sget-boolean v50, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v50, :cond_2b

    .line 622
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "lockTime"

    const-wide/32 v52, 0x337f9800

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 627
    :goto_8
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "locked"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 628
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "uploadlockstate"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_6

    .line 625
    :cond_2b
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "lockTime"

    const-wide/32 v52, 0x5265c00

    invoke-interface/range {v50 .. v53}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_8

    .line 632
    :cond_2c
    add-int/lit8 v43, v43, 0x1

    .line 633
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move/from16 v2, v43

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_6

    .line 640
    :cond_2d
    const/16 v17, 0x0

    .line 641
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "tmplocked"

    const/16 v52, 0x0

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 642
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "showstarttime"

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    move-wide/from16 v2, v22

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 643
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    const-string/jumbo v51, "shownumber"

    const/16 v52, 0x1

    invoke-interface/range {v50 .. v52}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v50

    invoke-interface/range {v50 .. v50}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_6

    .line 668
    :cond_2e
    new-instance v14, Landroid/content/Intent;

    const-string/jumbo v50, "android.intent.action.MAIN"

    move-object/from16 v0, v50

    invoke-direct {v14, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 669
    .restart local v14    # "intent":Landroid/content/Intent;
    const/high16 v50, 0x10000000

    move/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 670
    move/from16 v0, v43

    move/from16 v1, v25

    if-le v0, v1, :cond_2f

    .line 672
    sub-int v43, v43, v25

    .line 675
    :cond_2f
    new-instance v7, Landroid/content/ComponentName;

    const-string/jumbo v50, "com.launcher.activity"

    .line 676
    const-string/jumbo v51, "com.edutech.mobilestudyclient.activity.PasswdDialogActivity"

    .line 675
    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-direct {v7, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    .restart local v7    # "cn":Landroid/content/ComponentName;
    invoke-virtual {v14, v7}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 678
    const v50, 0x10008000

    move/from16 v0, v50

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 679
    const-string/jumbo v50, "number"

    move-object/from16 v0, v50

    move/from16 v1, v43

    invoke-virtual {v14, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 680
    const-string/jumbo v50, "lockwarning"

    move-object/from16 v0, v50

    move/from16 v1, v33

    invoke-virtual {v14, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 681
    const-string/jumbo v50, "packagename"

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v14, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 684
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    invoke-virtual/range {v50 .. v50}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v50

    .line 685
    const-string/jumbo v51, "com.launcher.activity"

    const/16 v52, 0x0

    .line 684
    invoke-virtual/range {v50 .. v52}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_5

    move-result-object v28

    .line 691
    .restart local v28    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_9
    if-eqz v28, :cond_2

    .line 692
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->mContext:Landroid/content/Context;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v14}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto/16 :goto_0

    .line 694
    :catch_4
    move-exception v50

    goto/16 :goto_0

    .line 686
    .end local v28    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_5
    move-exception v12

    .line 687
    .restart local v12    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/16 v28, 0x0

    .line 688
    .restart local v28    # "packageInfo":Landroid/content/pm/PackageInfo;
    invoke-virtual {v12}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_9

    .line 801
    .end local v7    # "cn":Landroid/content/ComponentName;
    .end local v12    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v14    # "intent":Landroid/content/Intent;
    .end local v16    # "ip":Ljava/lang/String;
    .end local v17    # "islocked":Z
    .end local v19    # "istmplocked":I
    .end local v22    # "nowTime":J
    .end local v24    # "num1":I
    .end local v25    # "num2":I
    .end local v26    # "num3":I
    .end local v27    # "num4":I
    .end local v28    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v30    # "second":J
    .end local v32    # "sharePre":Landroid/content/SharedPreferences;
    .end local v33    # "showWarning":I
    .end local v35    # "sp":Landroid/content/SharedPreferences;
    .end local v40    # "state":Ljava/lang/String;
    .end local v43    # "tmpNum":I
    .end local v46    # "tmpStartTime":J
    :cond_30
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 802
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->passwdClassName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 803
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->testPackageName2:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 804
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->gesturePackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 805
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->secLauncherPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 806
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->installerPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 807
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->gallery3dClassName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    .line 808
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->inputPackageName:Ljava/lang/String;

    move-object/from16 v50, v0

    move-object/from16 v0, v50

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v50

    if-nez v50, :cond_2

    goto/16 :goto_0

    .line 662
    .restart local v16    # "ip":Ljava/lang/String;
    .restart local v17    # "islocked":Z
    .restart local v19    # "istmplocked":I
    .restart local v22    # "nowTime":J
    .restart local v24    # "num1":I
    .restart local v25    # "num2":I
    .restart local v26    # "num3":I
    .restart local v27    # "num4":I
    .restart local v30    # "second":J
    .restart local v32    # "sharePre":Landroid/content/SharedPreferences;
    .restart local v33    # "showWarning":I
    .restart local v35    # "sp":Landroid/content/SharedPreferences;
    .restart local v40    # "state":Ljava/lang/String;
    .restart local v43    # "tmpNum":I
    .restart local v46    # "tmpStartTime":J
    :catch_6
    move-exception v50

    goto/16 :goto_0
.end method
