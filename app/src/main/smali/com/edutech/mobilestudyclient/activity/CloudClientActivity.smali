.class public Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.super Lcom/edutech/mobilestudyclient/activity/ActivityBase;
.source "CloudClientActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;,
        Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$HostPwd;,
        Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;,
        Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;,
        Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;,
        Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;
    }
.end annotation


# static fields
.field public static final BROADCASTER_LOCKSCREEN:Ljava/lang/String; = "com.edu.action.LAUNCHER_STRAT"

.field public static final Intent_STATUSBAR_INVISIBILITY:Ljava/lang/String; = "android.intent.action.STATUSBAR_INVISIBILITY"

.field public static final Intent_STATUSBAR_VISIBILITY:Ljava/lang/String; = "android.intent.action.STATUSBAR_VISIBILITY"

.field private static final SKEY:Ljava/lang/String; = "064F7FE4BE6AEC1360CF63E2E5A0B6B37E233ED563C6C1FB92E27920821DB97B2A7228F88CC76E0C53B4308201453B96888B37289AAAB829777702FEEE1E0028"

.field private static final START_PROGRESS:I = 0x1013

.field public static final Samsung_MDM:Ljava/lang/String; = "android.intent.action.mdm"

.field private static final TAG:Ljava/lang/String; = "CloudClientActivity"

.field public static final TEMP:Ljava/lang/String;

.field private static final UPDATE_INSTALLSINGLE:I = 0x1014

.field private static final UPDATE_INSTALLSTATE:I = 0x1012

.field private static final UPDATE_PROGRESS:I = 0x1011

.field public static apkTaskList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/edutech/mobilestudyclient/download/Async;",
            ">;>;"
        }
    .end annotation
.end field

.field public static apkdownloadlist:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static apkdownloadlistTemp:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static apkfinList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static installApkFlag:I

.field public static isDown:Z

.field public static jsonAppInfoListMobileStudy:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static mHight:I

.field public static mWidth:I


# instance fields
.field private InteractionReceiver:Landroid/content/BroadcastReceiver;

.field private LANGUAGEPATH:Ljava/lang/String;

.field private LicenseOK:Z

.field UPDATEAPK:Ljava/lang/String;

.field private addApksList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private agreement_sp:Landroid/content/SharedPreferences;

.field apkHandler:Landroid/os/Handler;

.field apkInstallReceiver:Landroid/content/BroadcastReceiver;

.field private apkList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private apkUpdateList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/ApkUpdateBean;",
            ">;"
        }
    .end annotation
.end field

.field private apkUpdatePkgList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private batteryChangedHandler:Landroid/os/Handler;

.field private batteryReceiver:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;

.field private btnYes:Landroid/widget/Button;

.field callHandler:Landroid/os/Handler;

.field private canRefresh:Z

.field private cb:Landroid/widget/CheckBox;

.field checkIdThread:Ljava/lang/Runnable;

.field private cn:Landroid/content/ComponentName;

.field private currentCacheLength:J

.field private currentCachePosition:J

.field private deletingFiles:Z

.field private dialog_noticemessage_listview:Landroid/widget/ListView;

.field private dialog_noticemessage_tvnotice:Landroid/widget/TextView;

.field private dialog_noticemessage_tvok:Landroid/widget/TextView;

.field private hasGeted:Z

.field private hasUpdated:Z

.field private hashmap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final idauth:Lcom/edutech/idauthentication/MainActivity;

.field private imageViewSetting:Landroid/widget/TextView;

.field private imageViews:[Landroid/widget/ImageView;

.field installHandler:Landroid/os/Handler;

.field private is3G:Ljava/lang/Boolean;

.field private isGetApks:Z

.field private isGetLauncher:Z

.field private isInteraction:Z

.field private isLenovo:Ljava/lang/Boolean;

.field private isnotice:Z

.field keylistener:Landroid/content/DialogInterface$OnKeyListener;

.field private language:Ljava/lang/String;

.field private launcherPath:Ljava/lang/String;

.field private ll_eight:Landroid/widget/LinearLayout;

.field private ll_eleven:Landroid/widget/LinearLayout;

.field private ll_five:Landroid/widget/LinearLayout;

.field private ll_four:Landroid/widget/LinearLayout;

.field private ll_nine:Landroid/widget/LinearLayout;

.field private ll_one:Landroid/widget/LinearLayout;

.field private ll_seven:Landroid/widget/LinearLayout;

.field private ll_six:Landroid/widget/LinearLayout;

.field private ll_sms:Landroid/widget/LinearLayout;

.field private ll_ten:Landroid/widget/LinearLayout;

.field private ll_three:Landroid/widget/LinearLayout;

.field private ll_twelve:Landroid/widget/LinearLayout;

.field private ll_two:Landroid/widget/LinearLayout;

.field public mActivityManager:Landroid/app/ActivityManager;

.field private mAllApps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mDPM:Landroid/app/admin/DevicePolicyManager;

.field private mDeviceAdmin:Landroid/content/ComponentName;

.field private mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

.field mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

.field private mPackageManager:Landroid/content/pm/PackageManager;

.field private mainbackground:Landroid/widget/LinearLayout;

.field public mobileStudyClientUpdateThread:Ljava/lang/Thread;

.field private myappList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private noticeAdapter:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;

.field private noticeDialog:Landroid/app/AlertDialog;

.field noticeHandler:Landroid/os/Handler;

.field private noticeMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/Noticebean;",
            ">;"
        }
    .end annotation
.end field

.field private noticeNum:I

.field noticeRunnable:Ljava/lang/Runnable;

.field private noticeThread:Ljava/lang/Thread;

.field private officesuitPackage:Ljava/lang/String;

.field private onconfigureChange:Z

.field private scrollView:Landroid/widget/ScrollView;

.field private sdyb_btn1:Landroid/widget/ImageButton;

.field private sdyb_btn2:Landroid/widget/ImageButton;

.field private sdyb_btn3:Landroid/widget/ImageButton;

.field private sdyb_btn4:Landroid/widget/ImageButton;

.field private sdyb_btn5:Landroid/widget/ImageButton;

.field private sdyb_myapp:Landroid/widget/TextView;

.field private sdyb_time:Landroid/widget/TextView;

.field private send_demo:Ljava/lang/String;

.field private send_ip:Ljava/lang/String;

.field private send_name:Ljava/lang/String;

.field private send_privatekey:Ljava/lang/String;

.field private send_pwd:Ljava/lang/String;

.field private send_schoolid:Ljava/lang/String;

.field private send_usercode:Ljava/lang/String;

.field private showTime:Z

.field private textViews:[Landroid/widget/TextView;

.field private three_noticetv:Landroid/widget/TextView;

.field timeHandler:Landroid/os/Handler;

.field timeRunnable:Ljava/lang/Runnable;

.field private timeThread:Ljava/lang/Thread;

.field private tv_battery:Landroid/widget/TextView;

.field private tv_line:Landroid/widget/TextView;

.field private tv_main_eryproc:Landroid/widget/Switch;

.field public tv_msg:Landroid/widget/TextView;

.field private tv_stuname:Landroid/widget/TextView;

.field public tv_tel:Landroid/widget/TextView;

.field private tv_updatemsg:Landroid/widget/TextView;

.field private tv_wifi:Landroid/widget/TextView;

.field private updateThread:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;

.field private updateTime:I

.field private username:Ljava/lang/String;

.field private wifiReceiver:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;

.field private wifi_btn:Landroid/widget/TextView;

.field private wpsPackage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 191
    const/4 v0, 0x0

    sput-boolean v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isDown:Z

    .line 193
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkdownloadlist:Ljava/util/ArrayList;

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkdownloadlistTemp:Ljava/util/ArrayList;

    .line 197
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkTaskList:Ljava/util/ArrayList;

    .line 198
    const/4 v0, 0x0

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkfinList:Ljava/util/ArrayList;

    .line 200
    const/4 v0, -0x1

    sput v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installApkFlag:I

    .line 213
    new-instance v0, Ljava/lang/StringBuilder;

    .line 214
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 215
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 216
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 217
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 218
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 219
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 220
    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 221
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 222
    const-string/jumbo v1, "temp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 223
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 213
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->TEMP:Ljava/lang/String;

    .line 289
    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    const/16 v4, 0xc

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 306
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;-><init>()V

    .line 177
    new-array v0, v4, [Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    .line 178
    new-array v0, v4, [Landroid/widget/TextView;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    .line 186
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 187
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    .line 188
    new-instance v0, Lcom/edutech/idauthentication/MainActivity;

    invoke-direct {v0, p0}, Lcom/edutech/idauthentication/MainActivity;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->idauth:Lcom/edutech/idauthentication/MainActivity;

    .line 190
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mobileStudyClientUpdateThread:Ljava/lang/Thread;

    .line 203
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->is3G:Ljava/lang/Boolean;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isLenovo:Ljava/lang/Boolean;

    .line 205
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hashmap:Ljava/util/HashMap;

    .line 206
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->username:Ljava/lang/String;

    .line 224
    const-string/jumbo v0, "android.edutech.updateapk"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->UPDATEAPK:Ljava/lang/String;

    .line 229
    iput-boolean v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isInteraction:Z

    .line 232
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    .line 233
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_name:Ljava/lang/String;

    .line 234
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_privatekey:Ljava/lang/String;

    .line 235
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_demo:Ljava/lang/String;

    .line 236
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_pwd:Ljava/lang/String;

    .line 237
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_usercode:Ljava/lang/String;

    .line 238
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_schoolid:Ljava/lang/String;

    .line 240
    const-string/jumbo v0, "cn.wps.moffice_eng"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wpsPackage:Ljava/lang/String;

    .line 241
    const-string/jumbo v0, "com.mobisystems.office"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->officesuitPackage:Ljava/lang/String;

    .line 242
    new-instance v0, Ljava/lang/StringBuilder;

    .line 243
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 245
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 246
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 247
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "language.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->LANGUAGEPATH:Ljava/lang/String;

    .line 249
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->onconfigureChange:Z

    .line 251
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->launcherPath:Ljava/lang/String;

    .line 252
    iput v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->updateTime:I

    .line 260
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetLauncher:Z

    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasGeted:Z

    .line 261
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetApks:Z

    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasUpdated:Z

    .line 262
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->addApksList:Ljava/util/ArrayList;

    .line 263
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->myappList:Ljava/util/List;

    .line 275
    iput-boolean v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showTime:Z

    .line 278
    iput-boolean v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isnotice:Z

    .line 281
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deletingFiles:Z

    .line 282
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->LicenseOK:Z

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdateList:Ljava/util/List;

    .line 285
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    .line 290
    iput-wide v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCachePosition:J

    .line 291
    iput-wide v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCacheLength:J

    .line 300
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->canRefresh:Z

    .line 301
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->language:Ljava/lang/String;

    .line 1107
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installHandler:Landroid/os/Handler;

    .line 1193
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$2;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$2;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->InteractionReceiver:Landroid/content/BroadcastReceiver;

    .line 2526
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->callHandler:Landroid/os/Handler;

    .line 4291
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$4;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$4;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->checkIdThread:Ljava/lang/Runnable;

    .line 4475
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->batteryChangedHandler:Landroid/os/Handler;

    .line 4845
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$6;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$6;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->keylistener:Landroid/content/DialogInterface$OnKeyListener;

    .line 4929
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkInstallReceiver:Landroid/content/BroadcastReceiver;

    .line 4953
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$8;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$8;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkHandler:Landroid/os/Handler;

    .line 4999
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$9;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$9;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeRunnable:Ljava/lang/Runnable;

    .line 5131
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$10;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$10;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeHandler:Landroid/os/Handler;

    .line 5155
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeHandler:Landroid/os/Handler;

    .line 5188
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeRunnable:Ljava/lang/Runnable;

    .line 308
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 8
    .param p1, "pContext"    # Landroid/content/Context;

    .prologue
    const-wide/16 v6, 0x0

    const/16 v4, 0xc

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 302
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;-><init>()V

    .line 177
    new-array v0, v4, [Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    .line 178
    new-array v0, v4, [Landroid/widget/TextView;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    .line 186
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 187
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    .line 188
    new-instance v0, Lcom/edutech/idauthentication/MainActivity;

    invoke-direct {v0, p0}, Lcom/edutech/idauthentication/MainActivity;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->idauth:Lcom/edutech/idauthentication/MainActivity;

    .line 190
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mobileStudyClientUpdateThread:Ljava/lang/Thread;

    .line 203
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->is3G:Ljava/lang/Boolean;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isLenovo:Ljava/lang/Boolean;

    .line 205
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hashmap:Ljava/util/HashMap;

    .line 206
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->username:Ljava/lang/String;

    .line 224
    const-string/jumbo v0, "android.edutech.updateapk"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->UPDATEAPK:Ljava/lang/String;

    .line 229
    iput-boolean v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isInteraction:Z

    .line 232
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    .line 233
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_name:Ljava/lang/String;

    .line 234
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_privatekey:Ljava/lang/String;

    .line 235
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_demo:Ljava/lang/String;

    .line 236
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_pwd:Ljava/lang/String;

    .line 237
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_usercode:Ljava/lang/String;

    .line 238
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_schoolid:Ljava/lang/String;

    .line 240
    const-string/jumbo v0, "cn.wps.moffice_eng"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wpsPackage:Ljava/lang/String;

    .line 241
    const-string/jumbo v0, "com.mobisystems.office"

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->officesuitPackage:Ljava/lang/String;

    .line 242
    new-instance v0, Ljava/lang/StringBuilder;

    .line 243
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 245
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 246
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 247
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "language.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->LANGUAGEPATH:Ljava/lang/String;

    .line 249
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->onconfigureChange:Z

    .line 251
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->launcherPath:Ljava/lang/String;

    .line 252
    iput v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->updateTime:I

    .line 260
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetLauncher:Z

    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasGeted:Z

    .line 261
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetApks:Z

    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasUpdated:Z

    .line 262
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->addApksList:Ljava/util/ArrayList;

    .line 263
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->myappList:Ljava/util/List;

    .line 275
    iput-boolean v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showTime:Z

    .line 278
    iput-boolean v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isnotice:Z

    .line 281
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deletingFiles:Z

    .line 282
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->LicenseOK:Z

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdateList:Ljava/util/List;

    .line 285
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    .line 290
    iput-wide v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCachePosition:J

    .line 291
    iput-wide v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCacheLength:J

    .line 300
    iput-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->canRefresh:Z

    .line 301
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->language:Ljava/lang/String;

    .line 1107
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$1;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installHandler:Landroid/os/Handler;

    .line 1193
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$2;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$2;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->InteractionReceiver:Landroid/content/BroadcastReceiver;

    .line 2526
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$3;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->callHandler:Landroid/os/Handler;

    .line 4291
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$4;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$4;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->checkIdThread:Ljava/lang/Runnable;

    .line 4475
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$5;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->batteryChangedHandler:Landroid/os/Handler;

    .line 4845
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$6;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$6;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->keylistener:Landroid/content/DialogInterface$OnKeyListener;

    .line 4929
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$7;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkInstallReceiver:Landroid/content/BroadcastReceiver;

    .line 4953
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$8;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$8;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkHandler:Landroid/os/Handler;

    .line 4999
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$9;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$9;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeRunnable:Ljava/lang/Runnable;

    .line 5131
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$10;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$10;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeHandler:Landroid/os/Handler;

    .line 5155
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$11;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeHandler:Landroid/os/Handler;

    .line 5188
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeRunnable:Ljava/lang/Runnable;

    .line 304
    return-void
.end method

.method public static SlientInstall(Ljava/lang/String;)Z
    .locals 12
    .param p0, "apkPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 4439
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    .line 4440
    .local v7, "runtime":Ljava/lang/Runtime;
    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "pm install -r "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    .line 4444
    .local v5, "proc":Ljava/lang/Process;
    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 4445
    .local v2, "inputstream":Ljava/io/InputStream;
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 4446
    .local v3, "inputstreamreader":Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 4447
    .local v0, "bufferedreader":Ljava/io/BufferedReader;
    const-string/jumbo v4, ""

    .line 4448
    .local v4, "line":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 4449
    .local v8, "sb":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 4456
    :try_start_0
    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I

    move-result v9

    if-eqz v9, :cond_0

    .line 4457
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "exit value = "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Process;->exitValue()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4463
    :cond_0
    :goto_1
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 4464
    .local v6, "result":Ljava/lang/String;
    const-string/jumbo v9, "Success"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 4465
    const-string/jumbo v9, "InstallApkUtil"

    const-string/jumbo v10, "SlientInstall success"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4466
    const/4 v9, 0x1

    .line 4469
    :goto_2
    return v9

    .line 4450
    .end local v6    # "result":Ljava/lang/String;
    :cond_1
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 4459
    :catch_0
    move-exception v1

    .line 4460
    .local v1, "e":Ljava/lang/InterruptedException;
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v9, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_1

    .line 4468
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .restart local v6    # "result":Ljava/lang/String;
    :cond_2
    const-string/jumbo v9, "InstallApkUtil"

    const-string/jumbo v10, "SlientInstall failed"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4469
    const/4 v9, 0x0

    goto :goto_2
.end method

.method static synthetic access$0(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 4325
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installNewApk()V

    return-void
.end method

.method static synthetic access$1(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;)V
    .locals 0

    .prologue
    .line 250
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->updateThread:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;

    return-void
.end method

.method static synthetic access$10(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Lcom/edutech/idauthentication/MainActivity;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->idauth:Lcom/edutech/idauthentication/MainActivity;

    return-object v0
.end method

.method static synthetic access$11(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_battery:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$12(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$13(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Z
    .locals 1

    .prologue
    .line 275
    iget-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showTime:Z

    return v0
.end method

.method static synthetic access$14(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 5054
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getWeekDay(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$15(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->language:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$16(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;I)Ljava/lang/String;
    .locals 1

    .prologue
    .line 5085
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getMonth(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$17(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_time:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$18(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->three_noticetv:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$19(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 5288
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showNoticeDetails()V

    return-void
.end method

.method static synthetic access$2(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;I)V
    .locals 0

    .prologue
    .line 252
    iput p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->updateTime:I

    return-void
.end method

.method static synthetic access$20(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Z
    .locals 1

    .prologue
    .line 278
    iget-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isnotice:Z

    return v0
.end method

.method static synthetic access$21(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 5213
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getMyWorkNotification()V

    return-void
.end method

.method static synthetic access$22(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V
    .locals 0

    .prologue
    .line 261
    iput-boolean p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetApks:Z

    return-void
.end method

.method static synthetic access$23(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->addApksList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$24(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 262
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->addApksList:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$25(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 251
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->launcherPath:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$26(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 1366
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$27(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 284
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdateList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$28(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 285
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$29(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;J)V
    .locals 1

    .prologue
    .line 291
    iput-wide p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCacheLength:J

    return-void
.end method

.method static synthetic access$3(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 4959
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showFailedApkInfo()V

    return-void
.end method

.method static synthetic access$30(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;J)V
    .locals 1

    .prologue
    .line 290
    iput-wide p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCachePosition:J

    return-void
.end method

.method static synthetic access$31(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V
    .locals 0

    .prologue
    .line 260
    iput-boolean p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasGeted:Z

    return-void
.end method

.method static synthetic access$32(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)J
    .locals 2

    .prologue
    .line 291
    iget-wide v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCacheLength:J

    return-wide v0
.end method

.method static synthetic access$33(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdateList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$34(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 1

    .prologue
    .line 1011
    invoke-direct {p0, p1, p2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->parseDownload(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$35(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->launcherPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$36(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;ILjava/lang/Object;I)V
    .locals 0

    .prologue
    .line 1099
    invoke-direct {p0, p1, p2, p3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    return-void
.end method

.method static synthetic access$37(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 4475
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->batteryChangedHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$38(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/ScrollView;
    .locals 1

    .prologue
    .line 4727
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->scrollView:Landroid/widget/ScrollView;

    return-object v0
.end method

.method static synthetic access$39(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 4726
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->btnYes:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$4(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$40(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_wifi:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$41(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 648
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getDesignView()V

    return-void
.end method

.method static synthetic access$42(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 1516
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->lockPad()V

    return-void
.end method

.method static synthetic access$43(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V
    .locals 0

    .prologue
    .line 282
    iput-boolean p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->LicenseOK:Z

    return-void
.end method

.method static synthetic access$44(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Landroid/content/Context;Z)V
    .locals 0

    .prologue
    .line 5393
    invoke-direct {p0, p1, p2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->broadEyeProc(Landroid/content/Context;Z)V

    return-void
.end method

.method static synthetic access$45(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V
    .locals 0

    .prologue
    .line 281
    iput-boolean p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deletingFiles:Z

    return-void
.end method

.method static synthetic access$46(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 673
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deleteCameraFiles()V

    return-void
.end method

.method static synthetic access$47(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V
    .locals 0

    .prologue
    .line 260
    iput-boolean p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetLauncher:Z

    return-void
.end method

.method static synthetic access$48(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 2027
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSpecialLauncher()V

    return-void
.end method

.method static synthetic access$49(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 1170
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->refreshDownloadPB()V

    return-void
.end method

.method static synthetic access$50(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_privatekey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$51(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_name:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$52(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 1677
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setDesignView()V

    return-void
.end method

.method static synthetic access$53(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;I)V
    .locals 0

    .prologue
    .line 2491
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getNetworkTime(I)V

    return-void
.end method

.method static synthetic access$54(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 2601
    invoke-direct {p0, p1, p2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getMyApps(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$55(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Landroid/content/SharedPreferences;)V
    .locals 0

    .prologue
    .line 248
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->agreement_sp:Landroid/content/SharedPreferences;

    return-void
.end method

.method static synthetic access$56(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->agreement_sp:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$57(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/widget/CheckBox;
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cb:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$58(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/app/AlertDialog;
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$6(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 962
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installSingleApk(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$7(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V
    .locals 0

    .prologue
    .line 229
    iput-boolean p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isInteraction:Z

    return-void
.end method

.method static synthetic access$8(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->is3G:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$9(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isLenovo:Ljava/lang/Boolean;

    return-object v0
.end method

.method private apkIntentInstall(Ljava/lang/String;)V
    .locals 3
    .param p1, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 4425
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4426
    .local v0, "installIntent":Landroid/content/Intent;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 4427
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 4426
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 4428
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 4429
    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    .line 4430
    return-void
.end method

.method private apkinstall(Ljava/lang/String;)V
    .locals 5
    .param p1, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 4400
    :try_start_0
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 4401
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 4402
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkIntentInstall(Ljava/lang/String;)V

    .line 4421
    :goto_0
    return-void

    .line 4404
    :cond_0
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SuSlientInstall\u5b89\u88c5\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4408
    :catch_0
    move-exception v0

    .line 4410
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 4411
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkIntentInstall(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 4414
    :catch_1
    move-exception v1

    .line 4416
    .local v1, "e1":Ljava/lang/Exception;
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkIntentInstall(Ljava/lang/String;)V

    .line 4417
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":InstallApk\u5b89\u88c5\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 4406
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "e1":Ljava/lang/Exception;
    :cond_1
    :try_start_2
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SlientInstall\u5b89\u88c5\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 4413
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_3
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SuSlientInstall\u5b89\u88c5\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method

.method private apkinstall_samsung(Ljava/lang/String;)V
    .locals 3
    .param p1, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 4386
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4387
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.SILENCE_INSTALL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4388
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "M1016Pro"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4389
    const-string/jumbo v1, "uri"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4394
    :goto_0
    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 4396
    return-void

    .line 4391
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 4392
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 4391
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private assignment()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/16 v8, 0xb

    const/high16 v7, -0x1000000

    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 2977
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v2, :cond_1

    .line 2979
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    const v3, 0x7f0202c6

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2980
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2981
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    const-string/jumbo v3, "\u65f6\u4ee3e\u5b66"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2982
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2983
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2984
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    const v3, 0x7f0202c6

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2985
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2986
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    const-string/jumbo v3, "\u65f6\u4ee3e\u6559"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2987
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2988
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2990
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    const v3, 0x7f020273

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2991
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2992
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080030

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2993
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2994
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2996
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    const v3, 0x7f020131

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2997
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2998
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080031

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2999
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3000
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3003
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    const v3, 0x7f02006b

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3004
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3005
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    .line 3006
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08017d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3007
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3008
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3011
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    const v3, 0x7f020271

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3012
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3013
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3014
    const v4, 0x7f08003b

    .line 3013
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3015
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3016
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3019
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    const v3, 0x7f020272

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3020
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3021
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3022
    const v4, 0x7f08004d

    .line 3021
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3023
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3024
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3027
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    const v3, 0x7f02027c

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3028
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3029
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3030
    const v4, 0x7f08004f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 3029
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3031
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3032
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3035
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v6

    const v3, 0x7f020176

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3036
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3037
    const v4, 0x7f080049

    .line 3036
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3041
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v6

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3042
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3043
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3046
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    const v3, 0x7f020178

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3047
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3048
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3049
    const v4, 0x7f08004e

    .line 3048
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3050
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3051
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3054
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    const v3, 0x7f020302

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3055
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3056
    const v4, 0x7f08004b

    .line 3055
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3060
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3061
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3062
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3082
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    const v3, 0x7f020172

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3083
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3084
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3085
    const v4, 0x7f080050

    .line 3084
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3086
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3087
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3405
    :goto_0
    const/16 v0, 0xc

    .line 3407
    .local v0, "count":I
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    if-eqz v2, :cond_27

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_27

    .line 3409
    move v1, v0

    .local v1, "i":I
    :goto_1
    const/16 v2, 0xa

    if-lt v1, v2, :cond_25

    .line 3444
    :cond_0
    return-void

    .line 3091
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_1
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_3

    .line 3093
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    const v3, 0x7f020284

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3104
    :goto_2
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3105
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_5

    .line 3107
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    const-string/jumbo v3, "\u963f\u51e1\u9898"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3115
    :goto_3
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3116
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3117
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_6

    .line 3119
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    const v3, 0x7f020295

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3130
    :goto_4
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3131
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_8

    .line 3133
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    const-string/jumbo v3, "\u4e00\u8d77\u4f5c\u4e1a"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3138
    :goto_5
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_2

    .line 3140
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    const-string/jumbo v3, "\u8f85\u5bfc\u8d44\u6e90"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3142
    :cond_2
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3143
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3144
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_9

    .line 3146
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    const v3, 0x7f020291

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3157
    :goto_6
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3158
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_b

    .line 3160
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    const-string/jumbo v3, "\u7eb3\u7c73\u76d2"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3168
    :goto_7
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3169
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3171
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_c

    .line 3173
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    const v3, 0x7f020283

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3184
    :goto_8
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3185
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_e

    .line 3187
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    const-string/jumbo v3, "\u7eb3\u7c73\u76d2"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3195
    :goto_9
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3196
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3199
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_f

    .line 3201
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    const v3, 0x7f02028f

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3209
    :goto_a
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3210
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_11

    .line 3212
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    const-string/jumbo v3, "\u5c0f\u5b66\u5b9d"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3218
    :goto_b
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3219
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3222
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_12

    .line 3224
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3235
    :goto_c
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3236
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3237
    const v4, 0x7f08003b

    .line 3236
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3238
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3239
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3242
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_14

    .line 3244
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    const v3, 0x7f02028e

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3255
    :goto_d
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3256
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3257
    const v4, 0x7f08004d

    .line 3256
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3258
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3259
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3268
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_16

    .line 3270
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    const v3, 0x7f02028d

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3281
    :goto_e
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3282
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3283
    const v4, 0x7f08004f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 3282
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3284
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3285
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3288
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_18

    .line 3290
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v6

    const v3, 0x7f020287

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3298
    :goto_f
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_1a

    .line 3300
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    const-string/jumbo v3, "\u7f51\u6613\u6709\u9053\u8bcd\u5178"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3309
    :goto_10
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v6

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3310
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3311
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3314
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_1b

    .line 3316
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    const v3, 0x7f020285

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3324
    :goto_11
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3325
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_1d

    .line 3327
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    const-string/jumbo v3, "\u6c49\u8bed\u5b57\u5178"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3333
    :goto_12
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3334
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3337
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_1e

    .line 3339
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    const v3, 0x7f020293

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3347
    :goto_13
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_20

    .line 3349
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    const-string/jumbo v3, "\u5f55\u97f3\u673a"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3358
    :goto_14
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3359
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3360
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3370
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v2, :cond_21

    .line 3372
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    const v3, 0x7f0202c6

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3373
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3374
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    const-string/jumbo v3, "\u65f6\u4ee3e\u5b66"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3375
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3376
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 3097
    :cond_3
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_4

    .line 3099
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_2

    .line 3102
    :cond_4
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    const v3, 0x7f020145

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_2

    .line 3110
    :cond_5
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08002d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 3123
    :cond_6
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_7

    .line 3125
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 3128
    :cond_7
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    const v3, 0x7f02034a

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 3136
    :cond_8
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08002f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 3150
    :cond_9
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_a

    .line 3152
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_6

    .line 3155
    :cond_a
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    const v3, 0x7f020273

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_6

    .line 3163
    :cond_b
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080030

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_7

    .line 3177
    :cond_c
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_d

    .line 3179
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_8

    .line 3182
    :cond_d
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    const v3, 0x7f020131

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_8

    .line 3190
    :cond_e
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x3

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080031

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_9

    .line 3202
    :cond_f
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_10

    .line 3204
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_a

    .line 3207
    :cond_10
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    const v3, 0x7f02006b

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_a

    .line 3215
    :cond_11
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    .line 3216
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08017d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_b

    .line 3228
    :cond_12
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_13

    .line 3230
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_c

    .line 3233
    :cond_13
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    const v3, 0x7f020271

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_c

    .line 3248
    :cond_14
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_15

    .line 3250
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    const v3, 0x7f02028e

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_d

    .line 3253
    :cond_15
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    const v3, 0x7f020272

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_d

    .line 3274
    :cond_16
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_17

    .line 3276
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    const v3, 0x7f02028d

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_e

    .line 3279
    :cond_17
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    const v3, 0x7f02027c

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_e

    .line 3291
    :cond_18
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_19

    .line 3293
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v6

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_f

    .line 3296
    :cond_19
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v6

    const v3, 0x7f020176

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_f

    .line 3303
    :cond_1a
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3304
    const v4, 0x7f080049

    .line 3303
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_10

    .line 3317
    :cond_1b
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_1c

    .line 3319
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_11

    .line 3322
    :cond_1c
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    const v3, 0x7f020178

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_11

    .line 3330
    :cond_1d
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3331
    const v4, 0x7f08004e

    .line 3330
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_12

    .line 3340
    :cond_1e
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_1f

    .line 3342
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_13

    .line 3345
    :cond_1f
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    const v3, 0x7f020302

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_13

    .line 3352
    :cond_20
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3353
    const v4, 0x7f08004b

    .line 3352
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_14

    .line 3379
    :cond_21
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v2, :cond_22

    .line 3381
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    const v3, 0x7f020294

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 3392
    :goto_15
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3393
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_24

    .line 3395
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    const-string/jumbo v3, "\u5b66\u800c\u601d"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3401
    :goto_16
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3402
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_0

    .line 3385
    :cond_22
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_23

    .line 3387
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    const v3, 0x7f020290

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_15

    .line 3390
    :cond_23
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    const v3, 0x7f020172

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_15

    .line 3398
    :cond_24
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3399
    const v4, 0x7f080050

    .line 3398
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_16

    .line 3410
    .restart local v0    # "count":I
    .restart local v1    # "i":I
    :cond_25
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v2, v0

    if-le v2, v1, :cond_26

    .line 3411
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    sub-int v3, v1, v0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_26

    .line 3412
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v3, v2, v1

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    sub-int v4, v1, v0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 3413
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v4}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 3412
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3414
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3415
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v3, v2, v1

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    sub-int v4, v1, v0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 3416
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v4}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3415
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3417
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3418
    const v4, 0x7f0c0003

    .line 3417
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3419
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3409
    :goto_17
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1

    .line 3421
    :cond_26
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3422
    const v4, 0x7f020092

    .line 3421
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3423
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3424
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3425
    const v4, 0x7f080028

    .line 3424
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3426
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3427
    const v4, 0x7f0c0002

    .line 3426
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3428
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_17

    .line 3433
    .end local v1    # "i":I
    :cond_27
    move v1, v0

    .restart local v1    # "i":I
    :goto_18
    const/16 v2, 0xc

    if-ge v1, v2, :cond_0

    .line 3434
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3435
    const v4, 0x7f020092

    .line 3434
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3436
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3437
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    .line 3438
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080028

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3439
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 3440
    const v4, 0x7f0c0002

    .line 3439
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 3441
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 3433
    add-int/lit8 v1, v1, 0x1

    goto :goto_18
.end method

.method private assignmentSuining()V
    .locals 10

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 2850
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    const v3, 0x7f02006b

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2851
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    const v3, 0x7f020276

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2852
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2853
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2854
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08017d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2855
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2857
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v7

    const v3, 0x7f020145

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2858
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v7

    const v3, 0x7f020146

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2859
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v7

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2860
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v7

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2861
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v7

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08002d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2862
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v7

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2864
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    const v3, 0x7f02034a

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2865
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    const v3, 0x7f02034b

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2866
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2867
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2868
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08002f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2869
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2871
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    const v3, 0x7f020131

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2872
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    const v3, 0x7f020132

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2873
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2874
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2875
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080031

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2876
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v9

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2879
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    const v3, 0x7f020172

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2880
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    const v3, 0x7f020348

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2881
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2882
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2883
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    .line 2884
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080050

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2885
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2888
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    const v3, 0x7f020273

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2889
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    const v3, 0x7f02034c

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2890
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2891
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2892
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2893
    const v4, 0x7f080030

    .line 2892
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2894
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2897
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    const v3, 0x7f020271

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2898
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    const v3, 0x7f02025c

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2899
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2900
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2901
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2902
    const v4, 0x7f08003b

    .line 2901
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2903
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2906
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    const v3, 0x7f02027c

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2907
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    const v3, 0x7f0200c9

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2908
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2909
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2910
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2911
    const v4, 0x7f080223

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 2910
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2912
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2915
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    const v3, 0x7f020272

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2916
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    const v3, 0x7f020312

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2917
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2918
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2919
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2920
    const v4, 0x7f08004d

    .line 2919
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2921
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2924
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    const v3, 0x7f02027c

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2925
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    const v3, 0x7f020277

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2926
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2927
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2928
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2929
    const v4, 0x7f08004f

    .line 2928
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2930
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2932
    const/16 v0, 0xa

    .line 2934
    .local v0, "count":I
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 2936
    move v1, v0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0xa

    if-lt v1, v2, :cond_1

    .line 2971
    :cond_0
    return-void

    .line 2937
    :cond_1
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v2, v0

    if-le v2, v1, :cond_2

    .line 2938
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    sub-int v3, v1, v0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 2939
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v3, v2, v1

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    sub-int v4, v1, v0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 2940
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v4}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 2939
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2941
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2942
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v3, v2, v1

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mAllApps:Ljava/util/List;

    sub-int v4, v1, v0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    .line 2943
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, v4}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2942
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2944
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2945
    const v4, 0x7f0c0003

    .line 2944
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2946
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2936
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2948
    :cond_2
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2949
    const v4, 0x7f020092

    .line 2948
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2950
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2951
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2952
    const v4, 0x7f080028

    .line 2951
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2953
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2954
    const v4, 0x7f0c0002

    .line 2953
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2955
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 2960
    .end local v1    # "i":I
    :cond_3
    move v1, v0

    .restart local v1    # "i":I
    :goto_2
    const/16 v2, 0xa

    if-ge v1, v2, :cond_0

    .line 2961
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2962
    const v4, 0x7f020092

    .line 2961
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2963
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2964
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    .line 2965
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080028

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2966
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 2967
    const v4, 0x7f0c0002

    .line 2966
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 2968
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v1

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2960
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private autoUpdateApks()V
    .locals 12

    .prologue
    .line 1643
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 1644
    .local v6, "time":J
    const-string/jumbo v8, "resumeconfig"

    const/4 v9, 0x0

    invoke-virtual {p0, v8, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 1645
    .local v5, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v8, "updateapks"

    const-wide/16 v10, 0x0

    invoke-interface {v5, v8, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 1646
    .local v2, "pretime":J
    sub-long v8, v6, v2

    const-wide/32 v10, 0x5265c00

    cmp-long v8, v8, v10

    if-gtz v8, :cond_0

    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-nez v8, :cond_2

    .line 1648
    :cond_0
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasUpdated:Z

    .line 1649
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdate()V

    .line 1662
    :cond_1
    :goto_0
    return-void

    .line 1650
    :cond_2
    sub-long v8, v6, v2

    const-wide/32 v10, 0x36ee80

    cmp-long v8, v8, v10

    if-lez v8, :cond_1

    .line 1652
    const-string/jumbo v8, "privatekey"

    .line 1653
    const/4 v9, 0x0

    .line 1652
    invoke-virtual {p0, v8, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 1654
    .local v4, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v8, "apihost"

    const-string/jumbo v9, ""

    invoke-interface {v4, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1655
    .local v1, "ip":Ljava/lang/String;
    invoke-static {p0, v1}, Lcom/edutech/mobilestudyclient/util/Utils;->getFailedEbagUpdated(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 1656
    .local v0, "failedApks":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_1

    .line 1658
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasUpdated:Z

    .line 1659
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdate()V

    goto :goto_0
.end method

.method private autoUpdateDesigns()V
    .locals 14

    .prologue
    const-wide/16 v12, 0x0

    const/4 v10, 0x0

    .line 1668
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1669
    .local v4, "time":J
    const-string/jumbo v3, "resumeconfig"

    invoke-virtual {p0, v3, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 1670
    .local v2, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "updatedesign"

    invoke-interface {v2, v3, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 1671
    .local v0, "pretime":J
    sub-long v6, v4, v0

    const-wide/32 v8, 0x5265c00

    cmp-long v3, v6, v8

    if-gtz v3, :cond_0

    cmp-long v3, v0, v12

    if-nez v3, :cond_1

    .line 1673
    :cond_0
    iput-boolean v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasGeted:Z

    .line 1674
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getDesignView()V

    .line 1676
    :cond_1
    return-void
.end method

.method private broadEyeProc(Landroid/content/Context;Z)V
    .locals 2
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "boo"    # Z

    .prologue
    .line 5394
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 5395
    .local v0, "intent1":Landroid/content/Intent;
    const-string/jumbo v1, "com.android.eyeprotection"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 5396
    const-string/jumbo v1, "ep_mode"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 5397
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 5398
    return-void
.end method

.method private changeIcons(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/mobilestudyclient/activity/AppBean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2018
    .local p1, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 2019
    sget-object v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-direct {p0, v2, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getDataFromLocal(Ljava/lang/String;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2026
    :cond_0
    :goto_0
    return-void

    .line 2020
    :catch_0
    move-exception v0

    .line 2022
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "privatekey"

    .line 2023
    const/4 v3, 0x0

    .line 2022
    invoke-virtual {p0, v2, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2024
    .local v1, "sharePre":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "updatetime"

    const-string/jumbo v4, "0"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public static cleanApplicationData(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1446
    sget-object v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->TEMP:Ljava/lang/String;

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cleanCacheFile(Ljava/lang/String;)V

    .line 1447
    return-void
.end method

.method private static cleanCacheFile(Ljava/lang/String;)V
    .locals 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 1464
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1465
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1467
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 1468
    .local v1, "files":[Ljava/io/File;
    if-eqz v1, :cond_0

    .line 1470
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-lt v2, v4, :cond_1

    .line 1477
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    :cond_0
    return-void

    .line 1472
    .restart local v1    # "files":[Ljava/io/File;
    .restart local v2    # "i":I
    :cond_1
    aget-object v3, v1, v2

    .line 1473
    .local v3, "tep":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 1470
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static cleanExternalCache(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1437
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 1438
    const-string/jumbo v1, "mounted"

    .line 1437
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1438
    if-eqz v0, :cond_0

    .line 1439
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deleteFilesByDirectory(Ljava/io/File;)V

    .line 1441
    :cond_0
    return-void
.end method

.method public static cleanFiles(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1429
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deleteFilesByDirectory(Ljava/io/File;)V

    .line 1430
    return-void
.end method

.method public static cleanInternalCache(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1414
    const-string/jumbo v0, "CloudClientActivity"

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1415
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deleteFilesByDirectory(Ljava/io/File;)V

    .line 1416
    return-void
.end method

.method public static cleanSharedPreference(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1423
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "/data/data/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1424
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/shared_prefs"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1423
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deleteFilesByDirectory(Ljava/io/File;)V

    .line 1425
    return-void
.end method

.method private deleteCameraFiles()V
    .locals 8

    .prologue
    .line 677
    sget-object v6, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    .line 676
    invoke-static {v6}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .line 677
    invoke-virtual {v6}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    .line 678
    .local v0, "OPEN_DCIM":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string/jumbo v6, ""

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 709
    :cond_0
    :goto_0
    return-void

    .line 682
    :cond_1
    new-instance v1, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "/Camera/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 683
    .local v1, "file":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "/Screenshots/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 684
    .local v2, "file2":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 686
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 687
    .local v3, "files":[Ljava/io/File;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v6, v3

    if-lt v4, v6, :cond_4

    .line 696
    .end local v3    # "files":[Ljava/io/File;
    .end local v4    # "i":I
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 698
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 699
    .restart local v3    # "files":[Ljava/io/File;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_2
    array-length v6, v3

    if-lt v4, v6, :cond_6

    .line 708
    .end local v3    # "files":[Ljava/io/File;
    .end local v4    # "i":I
    :cond_3
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deletingFiles:Z

    goto :goto_0

    .line 689
    .restart local v3    # "files":[Ljava/io/File;
    .restart local v4    # "i":I
    :cond_4
    aget-object v5, v3, v4

    .line 690
    .local v5, "tempFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 692
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 687
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 701
    .end local v5    # "tempFile":Ljava/io/File;
    :cond_6
    aget-object v5, v3, v4

    .line 702
    .restart local v5    # "tempFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 704
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 699
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_2
.end method

.method private static deleteFilesByDirectory(Ljava/io/File;)V
    .locals 5
    .param p0, "directory"    # Ljava/io/File;

    .prologue
    .line 1451
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1452
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 1453
    .local v1, "items":[Ljava/io/File;
    if-nez v1, :cond_1

    .line 1461
    .end local v1    # "items":[Ljava/io/File;
    :cond_0
    return-void

    .line 1457
    .restart local v1    # "items":[Ljava/io/File;
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v0, v3, v2

    .line 1458
    .local v0, "item":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1457
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private enableButtons(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/mobilestudyclient/activity/AppBean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    const/4 v5, 0x0

    .line 1778
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-gtz v4, :cond_1

    .line 1801
    :cond_0
    return-void

    .line 1782
    :cond_1
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ONE_IMG:Z

    .line 1783
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TWO_IMG:Z

    .line 1784
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->THREE_IMG:Z

    .line 1785
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->FOUR_IMG:Z

    .line 1786
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->FIVE_IMG:Z

    .line 1787
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->SIX_IMG:Z

    .line 1788
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->SEVEN_IMG:Z

    .line 1789
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->EIGHT_IMG:Z

    .line 1790
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->NINE_IMG:Z

    .line 1791
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TEN_IMG:Z

    .line 1792
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ELEVEN_IMG:Z

    .line 1793
    sput-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TWELVE_IMG:Z

    .line 1794
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 1796
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/activity/AppBean;

    .line 1797
    .local v0, "app":Lcom/edutech/mobilestudyclient/activity/AppBean;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getCode()Ljava/lang/String;

    move-result-object v1

    .line 1798
    .local v1, "code":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getEnable()I

    move-result v2

    .line 1799
    .local v2, "enable":I
    invoke-direct {p0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->judgeApp(Ljava/lang/String;I)V

    .line 1794
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private getDataFromLocal(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 12
    .param p1, "path"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/mobilestudyclient/activity/AppBean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    const/4 v11, 0x0

    .line 2078
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    :try_start_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v4, v7, :cond_0

    .line 2109
    :goto_1
    return-void

    .line 2079
    :cond_0
    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v7}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getCode()Ljava/lang/String;

    move-result-object v1

    .line 2080
    .local v1, "code":Ljava/lang/String;
    const-string/jumbo v7, "wifi"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string/jumbo v7, "large"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string/jumbo v7, "normal"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string/jumbo v7, "small"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 2082
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    sget-object v7, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v7}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIcon()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v7}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIcon()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v10, "/"

    invoke-virtual {v7, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v9, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2083
    .local v5, "iconpath":Ljava/lang/String;
    if-eqz v5, :cond_2

    const-string/jumbo v7, "large"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 2085
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2086
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 2088
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    new-instance v8, Ljava/lang/StringBuilder;

    sget-object v7, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v7}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIcon()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v7}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIcon()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v10, "/"

    invoke-virtual {v7, v10}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v9, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-direct {v0, v7}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 2089
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mainbackground:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2078
    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    .end local v3    # "file":Ljava/io/File;
    .end local v5    # "iconpath":Ljava/lang/String;
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 2092
    .restart local v3    # "file":Ljava/io/File;
    .restart local v5    # "iconpath":Ljava/lang/String;
    :cond_3
    const-string/jumbo v7, "privatekey"

    .line 2093
    const/4 v8, 0x0

    .line 2092
    invoke-virtual {p0, v7, v8}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 2094
    .local v6, "sharePre":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string/jumbo v8, "updatetime"

    const-string/jumbo v9, "0"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 2101
    .end local v1    # "code":Ljava/lang/String;
    .end local v3    # "file":Ljava/io/File;
    .end local v5    # "iconpath":Ljava/lang/String;
    .end local v6    # "sharePre":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v2

    .line 2103
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 2104
    const-string/jumbo v7, "liu"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "Exception:"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2105
    const-string/jumbo v7, "privatekey"

    invoke-virtual {p0, v7, v11}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 2107
    .restart local v6    # "sharePre":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string/jumbo v8, "updatetime"

    const-string/jumbo v9, "0"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_1

    .line 2099
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v6    # "sharePre":Landroid/content/SharedPreferences;
    .restart local v1    # "code":Ljava/lang/String;
    :cond_4
    :try_start_1
    invoke-virtual {p2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-direct {p0, v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->judgeIcon(Lcom/edutech/mobilestudyclient/activity/AppBean;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method private getDesignView()V
    .locals 2

    .prologue
    .line 650
    iget-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasGeted:Z

    if-eqz v0, :cond_1

    .line 672
    :cond_0
    :goto_0
    return-void

    .line 653
    :cond_1
    iget-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetLauncher:Z

    if-nez v0, :cond_0

    .line 655
    const-string/jumbo v0, "design"

    const-string/jumbo v1, "design"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 656
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$15;

    invoke-direct {v1, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$15;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 670
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 13
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 1367
    const/4 v6, 0x0

    .line 1370
    .local v6, "jsonString":Ljava/lang/String;
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v11

    const/16 v12, 0xc8

    if-ne v11, v12, :cond_2

    .line 1372
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 1373
    .local v5, "is":Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1374
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const/4 v11, 0x2

    invoke-virtual {v0, v11}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 1376
    const/4 v11, 0x2

    new-array v3, v11, [B

    .line 1377
    .local v3, "header":[B
    invoke-virtual {v0, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v9

    .line 1379
    .local v9, "result":I
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->reset()V

    .line 1381
    invoke-direct {p0, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getShort([B)I

    move-result v4

    .line 1383
    .local v4, "headerData":I
    const/4 v11, -0x1

    if-eq v9, v11, :cond_0

    const/16 v11, 0x1f8b

    if-ne v4, v11, :cond_0

    .line 1384
    new-instance v5, Ljava/util/zip/GZIPInputStream;

    .end local v5    # "is":Ljava/io/InputStream;
    invoke-direct {v5, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1388
    .restart local v5    # "is":Ljava/io/InputStream;
    :goto_0
    new-instance v8, Ljava/io/InputStreamReader;

    const-string/jumbo v11, "utf-8"

    invoke-direct {v8, v5, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 1389
    .local v8, "reader":Ljava/io/InputStreamReader;
    const/16 v11, 0x64

    new-array v1, v11, [C

    .line 1391
    .local v1, "data":[C
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    .line 1392
    .local v10, "sb":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v8, v1}, Ljava/io/InputStreamReader;->read([C)I

    move-result v7

    .local v7, "readSize":I
    if-gtz v7, :cond_1

    .line 1395
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1396
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 1397
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V

    .line 1406
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "data":[C
    .end local v3    # "header":[B
    .end local v4    # "headerData":I
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v7    # "readSize":I
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .end local v9    # "result":I
    .end local v10    # "sb":Ljava/lang/StringBuffer;
    :goto_2
    return-object v6

    .line 1386
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "header":[B
    .restart local v4    # "headerData":I
    .restart local v5    # "is":Ljava/io/InputStream;
    .restart local v9    # "result":I
    :cond_0
    move-object v5, v0

    goto :goto_0

    .line 1393
    .restart local v1    # "data":[C
    .restart local v7    # "readSize":I
    .restart local v8    # "reader":Ljava/io/InputStreamReader;
    .restart local v10    # "sb":Ljava/lang/StringBuffer;
    :cond_1
    const/4 v11, 0x0

    invoke-virtual {v10, v1, v11, v7}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1402
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "data":[C
    .end local v3    # "header":[B
    .end local v4    # "headerData":I
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v7    # "readSize":I
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .end local v9    # "result":I
    .end local v10    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v2

    .line 1403
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v11, "CloudClientActivity"

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1404
    const-string/jumbo v6, ""

    goto :goto_2

    .line 1399
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_1
    const-string/jumbo v11, "CloudClientActivity"

    const-string/jumbo v12, "\u4e0e\u670d\u52a1\u7aef\u8fde\u63a5\u5931\u8d25\u3002\u3002\u3002"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1400
    const-string/jumbo v6, ""
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method private getLanguage()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 1209
    new-instance v3, Ljava/io/File;

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->LANGUAGEPATH:Ljava/lang/String;

    invoke-direct {v3, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1210
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_1

    .line 1255
    :cond_0
    :goto_0
    return-void

    .line 1214
    :cond_1
    const/16 v9, 0x200

    new-array v0, v9, [B

    .line 1215
    .local v0, "by":[B
    const/4 v4, 0x0

    .line 1217
    .local v4, "in":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4    # "in":Ljava/io/FileInputStream;
    .local v5, "in":Ljava/io/FileInputStream;
    move-object v4, v5

    .line 1222
    .end local v5    # "in":Ljava/io/FileInputStream;
    .restart local v4    # "in":Ljava/io/FileInputStream;
    :goto_1
    if-eqz v4, :cond_0

    .line 1226
    const-string/jumbo v8, ""

    .line 1231
    .local v8, "strs":Ljava/lang/String;
    :goto_2
    :try_start_1
    invoke-virtual {v4, v0}, Ljava/io/FileInputStream;->read([B)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v6

    .line 1232
    .local v6, "length":I
    if-gtz v6, :cond_2

    .line 1242
    const-string/jumbo v9, "english"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 1244
    const-string/jumbo v9, "language"

    invoke-virtual {p0, v9, v12}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 1245
    .local v7, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v9, "en"

    invoke-static {p0, v9}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    .line 1246
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string/jumbo v10, "language"

    const-string/jumbo v11, "en"

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1247
    const-string/jumbo v9, "en"

    iput-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->language:Ljava/lang/String;

    goto :goto_0

    .line 1218
    .end local v6    # "length":I
    .end local v7    # "sp":Landroid/content/SharedPreferences;
    .end local v8    # "strs":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 1220
    .local v2, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 1236
    .end local v2    # "e1":Ljava/io/FileNotFoundException;
    .restart local v6    # "length":I
    .restart local v8    # "strs":Ljava/lang/String;
    :cond_2
    :try_start_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v10, Ljava/lang/String;

    const/4 v11, 0x0

    invoke-direct {v10, v0, v11, v6}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v8

    goto :goto_2

    .line 1237
    .end local v6    # "length":I
    :catch_1
    move-exception v1

    .line 1239
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 1250
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v6    # "length":I
    :cond_3
    const-string/jumbo v9, "language"

    invoke-virtual {p0, v9, v12}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 1251
    .restart local v7    # "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v9, "chinese"

    invoke-static {p0, v9}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    .line 1252
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string/jumbo v10, "language"

    const-string/jumbo v11, "chinese"

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1253
    const-string/jumbo v9, "chinese"

    iput-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->language:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method private getMonth(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 5087
    const-string/jumbo v0, ""

    .line 5088
    .local v0, "month":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 5129
    :goto_0
    return-object v0

    .line 5091
    :pswitch_0
    const-string/jumbo v0, "Jan"

    .line 5092
    goto :goto_0

    .line 5094
    :pswitch_1
    const-string/jumbo v0, "Feb"

    .line 5095
    goto :goto_0

    .line 5097
    :pswitch_2
    const-string/jumbo v0, "Mar"

    .line 5098
    goto :goto_0

    .line 5100
    :pswitch_3
    const-string/jumbo v0, "Apr"

    .line 5101
    goto :goto_0

    .line 5103
    :pswitch_4
    const-string/jumbo v0, "May"

    .line 5104
    goto :goto_0

    .line 5106
    :pswitch_5
    const-string/jumbo v0, "Jun"

    .line 5107
    goto :goto_0

    .line 5109
    :pswitch_6
    const-string/jumbo v0, "Jul"

    .line 5110
    goto :goto_0

    .line 5112
    :pswitch_7
    const-string/jumbo v0, "Aug"

    .line 5113
    goto :goto_0

    .line 5115
    :pswitch_8
    const-string/jumbo v0, "Sept"

    .line 5116
    goto :goto_0

    .line 5118
    :pswitch_9
    const-string/jumbo v0, "Oct"

    .line 5119
    goto :goto_0

    .line 5121
    :pswitch_a
    const-string/jumbo v0, "Nov"

    .line 5122
    goto :goto_0

    .line 5124
    :pswitch_b
    const-string/jumbo v0, "Dec"

    .line 5125
    goto :goto_0

    .line 5088
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method

.method private getMyApps(Ljava/lang/String;Ljava/lang/String;)V
    .locals 30
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "privatekey"    # Ljava/lang/String;

    .prologue
    .line 2603
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->myappList:Ljava/util/List;

    move-object/from16 v25, v0

    if-nez v25, :cond_0

    .line 2605
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->myappList:Ljava/util/List;

    .line 2607
    :cond_0
    if-eqz p1, :cond_1

    const-string/jumbo v25, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 2702
    :cond_1
    :goto_0
    return-void

    .line 2611
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    .line 2612
    .local v19, "sppref":Ljava/lang/String;
    if-eqz v19, :cond_1

    const-string/jumbo v25, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_1

    .line 2616
    const/16 v18, 0x0

    .line 2618
    .local v18, "sp":Landroid/content/SharedPreferences;
    const/16 v25, 0x0

    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v18

    .line 2626
    :goto_1
    if-eqz v18, :cond_1

    .line 2630
    const-string/jumbo v25, "updatetime"

    const-wide/16 v26, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    move-wide/from16 v2, v26

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    .line 2631
    .local v14, "lasttime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    .line 2632
    .local v22, "time":J
    const-string/jumbo v25, "data"

    const-string/jumbo v26, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 2633
    .local v16, "myapps":Ljava/lang/String;
    move-object/from16 v13, v16

    .line 2634
    .local v13, "mmm":Ljava/lang/String;
    sub-long v26, v22, v14

    const-wide/16 v28, 0x3e8

    div-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->abs(J)J

    move-result-wide v26

    const-wide/16 v28, 0x2a30

    cmp-long v25, v26, v28

    if-ltz v25, :cond_3

    .line 2636
    new-instance v25, Ljava/lang/StringBuilder;

    const-string/jumbo v26, "http://"

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 2637
    const-string/jumbo v26, "/api/app/projectcode/myapp/os/android"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 2636
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 2638
    .local v24, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->username:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p2

    move-object/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->httpGetInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v7

    .line 2640
    .local v7, "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    :try_start_1
    new-instance v25, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct/range {v25 .. v25}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 2641
    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v8

    .line 2643
    .local v8, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v25

    const/16 v26, 0xc8

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_3

    .line 2646
    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v25

    .line 2645
    invoke-static/range {v25 .. v25}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v21

    .line 2647
    .local v21, "strResult":Ljava/lang/String;
    sget-object v25, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v26, Ljava/lang/StringBuilder;

    const-string/jumbo v27, "strResult:"

    invoke-direct/range {v26 .. v27}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 2649
    if-eqz v21, :cond_3

    const-string/jumbo v25, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_3

    .line 2651
    new-instance v11, Lorg/json/JSONObject;

    move-object/from16 v0, v21

    invoke-direct {v11, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 2652
    .local v11, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v25, "status"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v20

    .line 2653
    .local v20, "status":Z
    const-string/jumbo v25, "errorInfo"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2654
    .local v6, "errorinfo":Ljava/lang/String;
    if-eqz v20, :cond_3

    .line 2656
    invoke-interface/range {v18 .. v18}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v25

    const-string/jumbo v26, "updatetime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v28

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-wide/from16 v2, v28

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2657
    invoke-interface/range {v18 .. v18}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v25

    const-string/jumbo v26, "data"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    .line 2658
    move-object/from16 v16, v21

    .line 2671
    .end local v6    # "errorinfo":Ljava/lang/String;
    .end local v7    # "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    .end local v8    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v11    # "jobj":Lorg/json/JSONObject;
    .end local v20    # "status":Z
    .end local v21    # "strResult":Ljava/lang/String;
    .end local v24    # "url":Ljava/lang/String;
    :cond_3
    :goto_2
    if-eqz v16, :cond_4

    :try_start_2
    const-string/jumbo v25, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_4

    .line 2673
    new-instance v11, Lorg/json/JSONObject;

    move-object/from16 v0, v16

    invoke-direct {v11, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 2674
    .restart local v11    # "jobj":Lorg/json/JSONObject;
    const-string/jumbo v25, "status"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v20

    .line 2675
    .restart local v20    # "status":Z
    const-string/jumbo v25, "errorInfo"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2676
    .restart local v6    # "errorinfo":Ljava/lang/String;
    if-eqz v20, :cond_4

    .line 2678
    const-string/jumbo v25, "data"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 2679
    .local v10, "jdata":Lorg/json/JSONObject;
    const-string/jumbo v25, "app"

    move-object/from16 v0, v25

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    .line 2680
    .local v12, "jsonArray":Lorg/json/JSONArray;
    if-eqz v12, :cond_4

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v25

    if-lez v25, :cond_4

    .line 2682
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->myappList:Ljava/util/List;

    move-object/from16 v25, v0

    invoke-interface/range {v25 .. v25}, Ljava/util/List;->clear()V

    .line 2683
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_3
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7

    move-result v25

    move/from16 v0, v25

    if-lt v9, v0, :cond_5

    .line 2701
    .end local v6    # "errorinfo":Ljava/lang/String;
    .end local v9    # "i":I
    .end local v10    # "jdata":Lorg/json/JSONObject;
    .end local v11    # "jobj":Lorg/json/JSONObject;
    .end local v12    # "jsonArray":Lorg/json/JSONArray;
    .end local v20    # "status":Z
    :cond_4
    :goto_4
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getOtherApps()V

    goto/16 :goto_0

    .line 2619
    .end local v13    # "mmm":Ljava/lang/String;
    .end local v14    # "lasttime":J
    .end local v16    # "myapps":Ljava/lang/String;
    .end local v22    # "time":J
    :catch_0
    move-exception v5

    .line 2621
    .local v5, "e":Ljava/lang/NullPointerException;
    const/16 v18, 0x0

    goto/16 :goto_1

    .line 2622
    .end local v5    # "e":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v5

    .line 2624
    .local v5, "e":Ljava/lang/Exception;
    const/16 v18, 0x0

    goto/16 :goto_1

    .line 2662
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v7    # "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    .restart local v13    # "mmm":Ljava/lang/String;
    .restart local v14    # "lasttime":J
    .restart local v16    # "myapps":Ljava/lang/String;
    .restart local v22    # "time":J
    .restart local v24    # "url":Ljava/lang/String;
    :catch_2
    move-exception v5

    .line 2663
    .local v5, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v5}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto :goto_2

    .line 2664
    .end local v5    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_3
    move-exception v5

    .line 2665
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 2666
    .end local v5    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v5

    .line 2667
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 2685
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v7    # "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    .end local v24    # "url":Ljava/lang/String;
    .restart local v6    # "errorinfo":Ljava/lang/String;
    .restart local v9    # "i":I
    .restart local v10    # "jdata":Lorg/json/JSONObject;
    .restart local v11    # "jobj":Lorg/json/JSONObject;
    .restart local v12    # "jsonArray":Lorg/json/JSONArray;
    .restart local v20    # "status":Z
    :cond_5
    :try_start_3
    invoke-virtual {v12, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v25

    const-string/jumbo v26, "packagename"

    invoke-virtual/range {v25 .. v26}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2686
    .local v17, "pkg":Ljava/lang/String;
    invoke-virtual {v12, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v25

    const-string/jumbo v26, "apptype"

    invoke-virtual/range {v25 .. v26}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2687
    .local v4, "apptype":Ljava/lang/String;
    const-string/jumbo v25, "1"

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_6

    .line 2688
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->myappList:Ljava/util/List;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_7

    .line 2683
    :cond_6
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 2693
    .end local v4    # "apptype":Ljava/lang/String;
    .end local v6    # "errorinfo":Ljava/lang/String;
    .end local v9    # "i":I
    .end local v10    # "jdata":Lorg/json/JSONObject;
    .end local v11    # "jobj":Lorg/json/JSONObject;
    .end local v12    # "jsonArray":Lorg/json/JSONArray;
    .end local v17    # "pkg":Ljava/lang/String;
    .end local v20    # "status":Z
    :catch_5
    move-exception v5

    .line 2695
    .local v5, "e":Lorg/json/JSONException;
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_4

    .line 2696
    .end local v5    # "e":Lorg/json/JSONException;
    :catch_6
    move-exception v5

    .line 2697
    .local v5, "e":Ljava/lang/NullPointerException;
    invoke-virtual {v5}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto :goto_4

    .line 2698
    .end local v5    # "e":Ljava/lang/NullPointerException;
    :catch_7
    move-exception v5

    .line 2699
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4
.end method

.method private getMyWorkNotification()V
    .locals 23

    .prologue
    .line 5215
    const-string/jumbo v20, "privatekey"

    .line 5216
    const/16 v21, 0x0

    .line 5215
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v16

    .line 5217
    .local v16, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v20, "apihost"

    const-string/jumbo v21, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 5218
    .local v8, "ip":Ljava/lang/String;
    const-string/jumbo v20, "name"

    const-string/jumbo v21, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 5219
    .local v19, "username":Ljava/lang/String;
    const-string/jumbo v20, "key"

    const-string/jumbo v21, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 5220
    .local v15, "privatekey":Ljava/lang/String;
    if-eqz v8, :cond_0

    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_0

    if-eqz v19, :cond_0

    const-string/jumbo v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 5221
    :cond_0
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v6

    .line 5222
    .local v6, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v6, :cond_2

    .line 5287
    .end local v6    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    :goto_0
    return-void

    .line 5226
    .restart local v6    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    const-string/jumbo v20, "ip"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "ip":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 5227
    .restart local v8    # "ip":Ljava/lang/String;
    const-string/jumbo v20, "usercode"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    .end local v19    # "username":Ljava/lang/String;
    check-cast v19, Ljava/lang/String;

    .line 5228
    .restart local v19    # "username":Ljava/lang/String;
    const-string/jumbo v20, "privatekey"

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "privatekey":Ljava/lang/String;
    check-cast v15, Ljava/lang/String;

    .line 5231
    .end local v6    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v15    # "privatekey":Ljava/lang/String;
    :cond_3
    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, "http://"

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 5232
    const-string/jumbo v21, "/api/notification/"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 5231
    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 5233
    .local v18, "url":Ljava/lang/String;
    if-eqz v19, :cond_1

    const-string/jumbo v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_1

    .line 5237
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeNum:I

    .line 5238
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeMessages:Ljava/util/List;

    .line 5239
    const-string/jumbo v20, "notification"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "url:"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5240
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v15}, Lcom/edutech/mobilestudyclient/download/HttpUtils;->getNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 5241
    .local v12, "json":Ljava/lang/String;
    const-string/jumbo v20, "notification"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "json:"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5242
    if-eqz v12, :cond_5

    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_5

    .line 5245
    :try_start_0
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11, v12}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 5246
    .local v11, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v20, "status"

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v17

    .line 5247
    .local v17, "status":Z
    const-string/jumbo v20, "data"

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 5248
    .local v10, "jdata":Lorg/json/JSONObject;
    if-eqz v17, :cond_5

    if-eqz v10, :cond_5

    .line 5250
    const-string/jumbo v20, "count"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 5251
    .local v4, "count":I
    move-object/from16 v0, p0

    iput v4, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeNum:I

    .line 5252
    const-string/jumbo v20, "Message"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_4

    .line 5254
    const-string/jumbo v20, "Message"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 5255
    .local v9, "jarray":Lorg/json/JSONArray;
    if-eqz v9, :cond_4

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v20

    if-lez v20, :cond_4

    .line 5258
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-lt v7, v0, :cond_6

    .line 5270
    .end local v7    # "i":I
    .end local v9    # "jarray":Lorg/json/JSONArray;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeHandler:Landroid/os/Handler;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v13

    .line 5271
    .local v13, "msg":Landroid/os/Message;
    iput v4, v13, Landroid/os/Message;->arg1:I

    .line 5272
    const/16 v20, 0x1

    move/from16 v0, v20

    iput v0, v13, Landroid/os/Message;->what:I

    .line 5273
    invoke-virtual {v13}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 5283
    .end local v4    # "count":I
    .end local v10    # "jdata":Lorg/json/JSONObject;
    .end local v11    # "jobj":Lorg/json/JSONObject;
    .end local v13    # "msg":Landroid/os/Message;
    .end local v17    # "status":Z
    :cond_5
    :goto_2
    if-eqz v12, :cond_1

    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_1

    goto/16 :goto_0

    .line 5260
    .restart local v4    # "count":I
    .restart local v7    # "i":I
    .restart local v9    # "jarray":Lorg/json/JSONArray;
    .restart local v10    # "jdata":Lorg/json/JSONObject;
    .restart local v11    # "jobj":Lorg/json/JSONObject;
    .restart local v17    # "status":Z
    :cond_6
    :try_start_1
    new-instance v3, Lcom/edutech/mobilestudyclient/util/Noticebean;

    invoke-direct {v3}, Lcom/edutech/mobilestudyclient/util/Noticebean;-><init>()V

    .line 5261
    .local v3, "bean":Lcom/edutech/mobilestudyclient/util/Noticebean;
    invoke-virtual {v9, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    .line 5262
    .local v14, "ob":Lorg/json/JSONObject;
    const-string/jumbo v20, "ActionID"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lcom/edutech/mobilestudyclient/util/Noticebean;->setActionid(Ljava/lang/String;)V

    .line 5263
    const-string/jumbo v20, "create"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lcom/edutech/mobilestudyclient/util/Noticebean;->setCreattime(Ljava/lang/String;)V

    .line 5264
    const-string/jumbo v20, "message"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lcom/edutech/mobilestudyclient/util/Noticebean;->setMessage(Ljava/lang/String;)V

    .line 5265
    const-string/jumbo v20, "messageid"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lcom/edutech/mobilestudyclient/util/Noticebean;->setMessageid(Ljava/lang/String;)V

    .line 5266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeMessages:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 5258
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 5275
    .end local v3    # "bean":Lcom/edutech/mobilestudyclient/util/Noticebean;
    .end local v4    # "count":I
    .end local v7    # "i":I
    .end local v9    # "jarray":Lorg/json/JSONArray;
    .end local v10    # "jdata":Lorg/json/JSONObject;
    .end local v11    # "jobj":Lorg/json/JSONObject;
    .end local v14    # "ob":Lorg/json/JSONObject;
    .end local v17    # "status":Z
    :catch_0
    move-exception v5

    .line 5277
    .local v5, "e":Lorg/json/JSONException;
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 5278
    .end local v5    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v20

    goto :goto_2
.end method

.method private getNetworkTime(I)V
    .locals 2
    .param p1, "type"    # I

    .prologue
    .line 2493
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;

    invoke-direct {v1, p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$23;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;I)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 2523
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 2525
    return-void
.end method

.method private getOtherApps()V
    .locals 10

    .prologue
    .line 2715
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2716
    .local v3, "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 2717
    .local v7, "uninstallpackages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 2718
    .local v6, "selfApps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v8, "com.launcher.activity"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2719
    const-string/jumbo v8, "dolphin.video.players"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2720
    const-string/jumbo v8, "com.onlinesys.student"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2721
    const-string/jumbo v8, "com.google.android.inputmethod.pinyin"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2722
    const-string/jumbo v8, "com.akson.timeep"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2723
    const-string/jumbo v8, "com.akson.timeepstudent"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2724
    const-string/jumbo v8, "com.webgenie.swf.play"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2725
    const-string/jumbo v8, "com.ashleytech.falswf"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2726
    sget-boolean v8, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v8, :cond_0

    .line 2728
    const-string/jumbo v8, "com.lejent.zuoyeshenqi.afanti"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2729
    const-string/jumbo v8, "com.A17zuoye.mobile.homework"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2730
    const-string/jumbo v8, "com.jinxin.namibox"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2731
    const-string/jumbo v8, "com.haojiazhang.activity"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2732
    const-string/jumbo v8, "com.youdao.dict"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2733
    const-string/jumbo v8, "org.hisand.zidian.zhs"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2734
    const-string/jumbo v8, "com.record.ing"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2735
    const-string/jumbo v8, "com.xueersi.parentsmeeting"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2736
    const-string/jumbo v8, "com.hjwordgames"

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2740
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v3

    .line 2741
    if-eqz v3, :cond_1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_1

    .line 2743
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    if-lt v0, v8, :cond_3

    .line 2771
    .end local v0    # "i":I
    :cond_1
    if-eqz v7, :cond_2

    invoke-interface {v7}, Ljava/util/List;->size()I
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v8

    if-lez v8, :cond_2

    .line 2774
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    :try_start_1
    invoke-interface {v7}, Ljava/util/List;->size()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v8

    if-lt v0, v8, :cond_7

    .line 2791
    .end local v0    # "i":I
    :cond_2
    :goto_2
    return-void

    .line 2745
    .restart local v0    # "i":I
    :cond_3
    :try_start_2
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageInfo;

    .line 2747
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget-object v4, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 2748
    .local v4, "pkName":Ljava/lang/String;
    iget-object v8, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v8, v8, 0x1

    if-lez v8, :cond_5

    .line 2743
    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2752
    :cond_5
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 2756
    const-string/jumbo v8, "com.edutech"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    const-string/jumbo v8, "cn.wps.moffice_eng"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 2760
    iget-object v8, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v8, v8, 0x1

    if-gtz v8, :cond_4

    .line 2764
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->myappList:Ljava/util/List;

    if-eqz v8, :cond_6

    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->myappList:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 2768
    :cond_6
    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 2786
    .end local v0    # "i":I
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v4    # "pkName":Ljava/lang/String;
    :catch_0
    move-exception v8

    goto :goto_2

    .line 2776
    .restart local v0    # "i":I
    :cond_7
    :try_start_3
    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 2777
    .local v5, "pkname":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v8, "com.launch.uninstall"

    invoke-direct {v2, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2778
    .local v2, "installIntent":Landroid/content/Intent;
    const-string/jumbo v8, "packagename"

    invoke-virtual {v2, v8, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2779
    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 2780
    const-wide/16 v8, 0x64

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_0

    .line 2774
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2788
    .end local v0    # "i":I
    .end local v2    # "installIntent":Landroid/content/Intent;
    .end local v5    # "pkname":Ljava/lang/String;
    :catch_1
    move-exception v8

    goto :goto_2

    .line 2782
    .restart local v0    # "i":I
    :catch_2
    move-exception v8

    goto :goto_2
.end method

.method private getShort([B)I
    .locals 2
    .param p1, "data"    # [B

    .prologue
    .line 1410
    const/4 v0, 0x0

    aget-byte v0, p1, v0

    shl-int/lit8 v0, v0, 0x8

    const/4 v1, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private getSpecialLauncher()V
    .locals 15

    .prologue
    const/4 v14, 0x1

    const/4 v11, 0x0

    .line 2029
    iput-boolean v14, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetLauncher:Z

    .line 2030
    const-string/jumbo v9, "privatekey"

    invoke-virtual {p0, v9, v11}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 2032
    .local v4, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v9, "apihost"

    const-string/jumbo v10, ""

    invoke-interface {v4, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2033
    .local v1, "ip":Ljava/lang/String;
    const-string/jumbo v9, "name"

    const-string/jumbo v10, ""

    invoke-interface {v4, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 2034
    .local v8, "username":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string/jumbo v9, ""

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    if-eqz v8, :cond_0

    const-string/jumbo v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 2035
    :cond_0
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v0

    .line 2036
    .local v0, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v0, :cond_2

    .line 2073
    .end local v0    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    :goto_0
    return-void

    .line 2040
    .restart local v0    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    const-string/jumbo v9, "ip"

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "ip":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 2041
    .restart local v1    # "ip":Ljava/lang/String;
    const-string/jumbo v9, "usercode"

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "username":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 2043
    .end local v0    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v8    # "username":Ljava/lang/String;
    :cond_3
    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "http://"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2044
    const-string/jumbo v10, "/api/config/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 2043
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2045
    .local v7, "url":Ljava/lang/String;
    if-eqz v8, :cond_4

    const-string/jumbo v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 2047
    :cond_4
    iput-boolean v11, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetLauncher:Z

    goto :goto_0

    .line 2050
    :cond_5
    invoke-static {v7, v8}, Lcom/edutech/mobilestudyclient/download/HttpUtils;->getConfigData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2051
    .local v2, "json":Ljava/lang/String;
    iput-boolean v11, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetLauncher:Z

    .line 2052
    const-string/jumbo v9, "resumeconfig"

    invoke-virtual {p0, v9, v11}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 2053
    .local v5, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string/jumbo v10, "updatedesign"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-interface {v9, v10, v12, v13}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2054
    if-eqz v2, :cond_6

    const-string/jumbo v9, ""

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 2058
    :cond_6
    invoke-static {v2, p0}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->saveLauncher(Ljava/lang/String;Landroid/content/Context;)I

    move-result v3

    .line 2059
    .local v3, "result":I
    if-ne v3, v14, :cond_7

    .line 2061
    iput-boolean v14, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasGeted:Z

    .line 2063
    :cond_7
    const-string/jumbo v9, "splauncher"

    invoke-virtual {p0, v9, v11}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 2064
    .local v6, "spLauncher":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string/jumbo v10, "refreshtime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-interface {v9, v10, v12, v13}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2065
    new-instance v9, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$18;

    invoke-direct {v9, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$18;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {p0, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method

.method private getWeekDay(I)Ljava/lang/String;
    .locals 3
    .param p1, "index"    # I

    .prologue
    .line 5056
    const-string/jumbo v0, ""

    .line 5057
    .local v0, "weekday":Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 5083
    :goto_0
    return-object v0

    .line 5060
    :pswitch_0
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080230

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 5061
    goto :goto_0

    .line 5063
    :pswitch_1
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080231

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 5064
    goto :goto_0

    .line 5066
    :pswitch_2
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080232

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 5067
    goto :goto_0

    .line 5069
    :pswitch_3
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080233

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 5070
    goto :goto_0

    .line 5072
    :pswitch_4
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080234

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 5073
    goto :goto_0

    .line 5075
    :pswitch_5
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080235

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 5076
    goto :goto_0

    .line 5078
    :pswitch_6
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080236

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 5079
    goto :goto_0

    .line 5057
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public static httpGetInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;
    .locals 7
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "privatekey"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    .line 2705
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 2706
    .local v0, "get":Lorg/apache/http/client/methods/HttpGet;
    const-string/jumbo v4, "X-Edutech-Entity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 2707
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2706
    invoke-virtual {v0, v4, v5}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 2708
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 2709
    .local v2, "imestamp":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2710
    .local v1, "sign":Ljava/lang/String;
    const-string/jumbo v4, "X-Edutech-Sign"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 2711
    return-object v0
.end method

.method public static httpPostInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    .locals 7
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "privatekey"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    .line 1768
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 1769
    .local v2, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v4, "X-Edutech-Entity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1770
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1769
    invoke-virtual {v2, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1771
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1772
    .local v0, "imestamp":J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1773
    .local v3, "sign":Ljava/lang/String;
    const-string/jumbo v4, "X-Edutech-Sign"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1774
    return-object v2
.end method

.method private initBroadReceiver()V
    .locals 5

    .prologue
    .line 522
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 523
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v3, "android.net.wifi.STATE_CHANGE"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 524
    const-string/jumbo v3, "com.edutech.startservice"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 525
    const-string/jumbo v3, "edm.intent.action.license.status"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 526
    const-string/jumbo v3, "com.edutech.getadmin"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 527
    new-instance v3, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;

    invoke-direct {v3, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wifiReceiver:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;

    .line 528
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wifiReceiver:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;

    invoke-virtual {p0, v3, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 529
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 530
    .local v2, "intentApkFilter":Landroid/content/IntentFilter;
    const-string/jumbo v3, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 531
    const-string/jumbo v3, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 532
    const-string/jumbo v3, "package"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 533
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 534
    sget-boolean v3, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->openBMD:Z

    if-eqz v3, :cond_0

    .line 536
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 537
    .local v1, "in":Landroid/content/Intent;
    const-string/jumbo v3, "com.edutech.intent.TrafficStatsService"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 538
    const-string/jumbo v3, "com.edutech.firewall"

    const-string/jumbo v4, "eu.faircode.netguard.TrafficStatsService"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 539
    const-string/jumbo v3, "ip"

    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 540
    const-string/jumbo v3, "privatekey"

    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_privatekey:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 541
    const-string/jumbo v3, "name"

    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_name:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 542
    const-string/jumbo v3, "schoolid"

    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_schoolid:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 543
    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 545
    .end local v1    # "in":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private initListener()V
    .locals 2

    .prologue
    .line 2805
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-nez v1, :cond_0

    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-nez v1, :cond_0

    .line 2807
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0xc

    if-lt v0, v1, :cond_1

    .line 2821
    .end local v0    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViewSetting:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2822
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wifi_btn:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2823
    return-void

    .line 2808
    .restart local v0    # "i":I
    :cond_1
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2807
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private initNewLayout()V
    .locals 2

    .prologue
    .line 712
    const v0, 0x7f0a017f

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_one:Landroid/widget/LinearLayout;

    .line 713
    const v0, 0x7f0a0180

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_two:Landroid/widget/LinearLayout;

    .line 714
    const v0, 0x7f0a018d

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_three:Landroid/widget/LinearLayout;

    .line 715
    const v0, 0x7f0a0181

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_four:Landroid/widget/LinearLayout;

    .line 716
    const v0, 0x7f0a0182

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_five:Landroid/widget/LinearLayout;

    .line 717
    const v0, 0x7f0a0189

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_six:Landroid/widget/LinearLayout;

    .line 718
    const v0, 0x7f0a0187

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_seven:Landroid/widget/LinearLayout;

    .line 719
    const v0, 0x7f0a0188

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_eight:Landroid/widget/LinearLayout;

    .line 720
    const v0, 0x7f0a0184

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_nine:Landroid/widget/LinearLayout;

    .line 721
    const v0, 0x7f0a0185

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_ten:Landroid/widget/LinearLayout;

    .line 722
    const v0, 0x7f0a0186

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_eleven:Landroid/widget/LinearLayout;

    .line 723
    const v0, 0x7f0a0183

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_twelve:Landroid/widget/LinearLayout;

    .line 724
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v0, :cond_0

    .line 726
    const v0, 0x7f0a018a

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_sms:Landroid/widget/LinearLayout;

    .line 727
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_sms:Landroid/widget/LinearLayout;

    new-instance v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$16;

    invoke-direct {v1, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$16;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 741
    :cond_0
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_one:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 742
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_two:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 743
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_three:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 744
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_four:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 745
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_five:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 746
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_six:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 747
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_seven:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 748
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_eight:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 749
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_nine:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 750
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_ten:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 751
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_eleven:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 752
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->ll_twelve:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 753
    return-void
.end method

.method private initSuiningListener()V
    .locals 2

    .prologue
    .line 2828
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    .line 2831
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViewSetting:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2832
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wifi_btn:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2833
    return-void

    .line 2829
    :cond_0
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2828
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private initSuiningView()V
    .locals 9

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/16 v5, 0x8

    const/4 v4, 0x1

    .line 2350
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a016b

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v6

    .line 2351
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a0162

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v4

    .line 2352
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a0164

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v7

    .line 2353
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a0169

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v8

    .line 2354
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    const v1, 0x7f0a0179

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2355
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    const v1, 0x7f0a0166

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2356
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    const v1, 0x7f0a016d

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2357
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    const v1, 0x7f0a01a0

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2358
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a016f

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v5

    .line 2359
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    const v1, 0x7f0a0171

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2361
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a016c

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v6

    .line 2362
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a0163

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v4

    .line 2363
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a0165

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v7

    .line 2364
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a016a

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v8

    .line 2365
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    const v1, 0x7f0a017a

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2366
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    const v1, 0x7f0a0168

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2367
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    const v1, 0x7f0a016e

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2368
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    const v1, 0x7f0a01a1

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2369
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a0170

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v5

    .line 2370
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    const v1, 0x7f0a0172

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2371
    const v1, 0x7f0a015e

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViewSetting:Landroid/widget/TextView;

    .line 2373
    const v1, 0x7f0a015d

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wifi_btn:Landroid/widget/TextView;

    .line 2374
    const v1, 0x7f0a017b

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_wifi:Landroid/widget/TextView;

    .line 2375
    const v1, 0x7f0a015c

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_battery:Landroid/widget/TextView;

    .line 2377
    const v1, 0x7f0a017e

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_msg:Landroid/widget/TextView;

    .line 2378
    const v1, 0x7f0a017d

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_tel:Landroid/widget/TextView;

    .line 2386
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_msg:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2387
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_tel:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2389
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_msg:Landroid/widget/TextView;

    new-instance v2, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$19;

    invoke-direct {v2, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$19;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2397
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_tel:Landroid/widget/TextView;

    new-instance v2, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$20;

    invoke-direct {v2, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$20;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2406
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    const/16 v1, 0xa

    if-lt v0, v1, :cond_1

    .line 2410
    :cond_0
    return-void

    .line 2407
    :cond_1
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isShowView(Landroid/view/View;Z)V

    .line 2408
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isShowView(Landroid/view/View;Z)V

    .line 2406
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private initVariable()V
    .locals 2

    .prologue
    .line 2838
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 2840
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 2841
    .local v0, "mDisplayMetrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 2842
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mWidth:I

    .line 2843
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    sput v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mHight:I

    .line 2844
    return-void
.end method

.method private initView()V
    .locals 9

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/16 v5, 0x8

    const/4 v4, 0x1

    .line 2415
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a0162

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v6

    .line 2416
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a0164

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v4

    .line 2417
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a0166

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v7

    .line 2418
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a0169

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v8

    .line 2419
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x4

    const v1, 0x7f0a016b

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2420
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    const v1, 0x7f0a016d

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2421
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    const v1, 0x7f0a016f

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2422
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    const v1, 0x7f0a0171

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2423
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const v1, 0x7f0a0173

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v5

    .line 2424
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    const v1, 0x7f0a0175

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2425
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xa

    const v1, 0x7f0a0177

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2426
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xb

    const v1, 0x7f0a0179

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    aput-object v1, v2, v3

    .line 2428
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a0163

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v6

    .line 2429
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a0165

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v4

    .line 2430
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a0168

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v7

    .line 2431
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a016a

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v8

    .line 2432
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x4

    const v1, 0x7f0a016c

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2433
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    const v1, 0x7f0a016e

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2434
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    const v1, 0x7f0a0170

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2435
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    const v1, 0x7f0a0172

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2436
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const v1, 0x7f0a0174

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v5

    .line 2437
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    const v1, 0x7f0a0176

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2438
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    const v1, 0x7f0a0178

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2439
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xb

    const v1, 0x7f0a017a

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    aput-object v1, v2, v3

    .line 2441
    const v1, 0x7f0a015a

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mainbackground:Landroid/widget/LinearLayout;

    .line 2450
    const v1, 0x7f0a015e

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViewSetting:Landroid/widget/TextView;

    .line 2452
    const v1, 0x7f0a015d

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wifi_btn:Landroid/widget/TextView;

    .line 2453
    const v1, 0x7f0a017b

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_wifi:Landroid/widget/TextView;

    .line 2454
    const v1, 0x7f0a015c

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_battery:Landroid/widget/TextView;

    .line 2456
    const v1, 0x7f0a017e

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_msg:Landroid/widget/TextView;

    .line 2457
    const v1, 0x7f0a017d

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_tel:Landroid/widget/TextView;

    .line 2465
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_msg:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2466
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_tel:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 2468
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_msg:Landroid/widget/TextView;

    new-instance v2, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$21;

    invoke-direct {v2, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$21;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2476
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_tel:Landroid/widget/TextView;

    new-instance v2, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$22;

    invoke-direct {v2, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$22;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2485
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    array-length v1, v1

    if-lt v0, v1, :cond_1

    .line 2489
    :cond_0
    return-void

    .line 2486
    :cond_1
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isShowView(Landroid/view/View;Z)V

    .line 2487
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isShowView(Landroid/view/View;Z)V

    .line 2485
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private initWidget()V
    .locals 6

    .prologue
    const v5, 0x7f0a015b

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 426
    const v2, 0x7f0a0160

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_line:Landroid/widget/TextView;

    .line 427
    const v2, 0x7f0a015f

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Switch;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_main_eryproc:Landroid/widget/Switch;

    .line 428
    const v2, 0x7f0a0161

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_stuname:Landroid/widget/TextView;

    .line 429
    invoke-virtual {p0, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_time:Landroid/widget/TextView;

    .line 430
    invoke-virtual {p0, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_time:Landroid/widget/TextView;

    .line 431
    const v2, 0x7f0a017c

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    .line 432
    iput-boolean v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showTime:Z

    .line 433
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_stuname:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 435
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-nez v2, :cond_0

    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_7

    .line 437
    :cond_0
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_stuname:Landroid/widget/TextView;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 443
    :cond_1
    :goto_0
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v2, :cond_8

    .line 445
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initSuiningView()V

    .line 450
    :goto_1
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v2, :cond_2

    .line 452
    const v2, 0x7f0a019b

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn1:Landroid/widget/ImageButton;

    .line 453
    const v2, 0x7f0a019c

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn2:Landroid/widget/ImageButton;

    .line 454
    const v2, 0x7f0a019d

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn3:Landroid/widget/ImageButton;

    .line 455
    const v2, 0x7f0a019e

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn4:Landroid/widget/ImageButton;

    .line 456
    const v2, 0x7f0a019f

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn5:Landroid/widget/ImageButton;

    .line 457
    const v2, 0x7f0a019a

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_myapp:Landroid/widget/TextView;

    .line 459
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn1:Landroid/widget/ImageButton;

    invoke-virtual {v2, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 460
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn2:Landroid/widget/ImageButton;

    invoke-virtual {v2, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 461
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn3:Landroid/widget/ImageButton;

    invoke-virtual {v2, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 462
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn4:Landroid/widget/ImageButton;

    invoke-virtual {v2, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 463
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_btn5:Landroid/widget/ImageButton;

    invoke-virtual {v2, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 464
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sdyb_myapp:Landroid/widget/TextView;

    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 466
    :cond_2
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initVariable()V

    .line 467
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v2, :cond_9

    .line 469
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initSuiningListener()V

    .line 474
    :goto_2
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-nez v2, :cond_3

    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v2, :cond_4

    .line 476
    :cond_3
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initNewLayout()V

    .line 478
    :cond_4
    const v2, 0x7f0a0167

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->three_noticetv:Landroid/widget/TextView;

    .line 479
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->three_noticetv:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 480
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v2, :cond_a

    .line 482
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->assignmentSuining()V

    .line 487
    :goto_3
    const-string/jumbo v2, "eyeproc"

    invoke-virtual {p0, v2, v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 488
    .local v1, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "state"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 489
    .local v0, "boo":Z
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_main_eryproc:Landroid/widget/Switch;

    if-eqz v2, :cond_5

    .line 490
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_main_eryproc:Landroid/widget/Switch;

    invoke-virtual {v2, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 491
    invoke-direct {p0, p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->broadEyeProc(Landroid/content/Context;Z)V

    .line 493
    :cond_5
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_main_eryproc:Landroid/widget/Switch;

    new-instance v3, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$13;

    invoke-direct {v3, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$13;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 505
    :try_start_0
    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "M1016Pro"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "P990S.V"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "S1016"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "M856.V"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 506
    :cond_6
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_line:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 507
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_main_eryproc:Landroid/widget/Switch;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 517
    :goto_4
    return-void

    .line 440
    .end local v0    # "boo":Z
    .end local v1    # "sp":Landroid/content/SharedPreferences;
    :cond_7
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_stuname:Landroid/widget/TextView;

    const-string/jumbo v3, "\u5b66\u751f: "

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 448
    :cond_8
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initView()V

    goto/16 :goto_1

    .line 472
    :cond_9
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initListener()V

    goto/16 :goto_2

    .line 485
    :cond_a
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->assignment()V

    goto :goto_3

    .line 509
    .restart local v0    # "boo":Z
    .restart local v1    # "sp":Landroid/content/SharedPreferences;
    :cond_b
    :try_start_1
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_line:Landroid/widget/TextView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 510
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_main_eryproc:Landroid/widget/Switch;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setVisibility(I)V

    .line 511
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_main_eryproc:Landroid/widget/Switch;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setWidth(I)V

    .line 512
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_main_eryproc:Landroid/widget/Switch;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setHeight(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    .line 514
    :catch_0
    move-exception v2

    goto :goto_4
.end method

.method private init_public_infor()V
    .locals 5

    .prologue
    .line 2323
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hashmap:Ljava/util/HashMap;

    .line 2325
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hashmap:Ljava/util/HashMap;

    if-nez v1, :cond_0

    .line 2345
    :goto_0
    return-void

    .line 2329
    :cond_0
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v2, "username"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->username:Ljava/lang/String;

    .line 2330
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v2, "stuname"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2332
    :cond_1
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hashmap:Ljava/util/HashMap;

    const-string/jumbo v2, "stuname"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2333
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_stuname:Landroid/widget/TextView;

    if-eqz v1, :cond_3

    .line 2335
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-nez v1, :cond_2

    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v1, :cond_4

    .line 2337
    :cond_2
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_stuname:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2344
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->username:Ljava/lang/String;

    sput-object v1, Lcom/mobilestudyclient/application/My_Application;->LoginName:Ljava/lang/String;

    goto :goto_0

    .line 2340
    :cond_4
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_stuname:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080226

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private installNewApk()V
    .locals 8

    .prologue
    .line 4326
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkList:Ljava/util/List;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-gtz v5, :cond_1

    .line 4383
    :cond_0
    :goto_0
    return-void

    .line 4329
    :cond_1
    new-instance v5, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-direct {v5, p0}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

    .line 4330
    const/4 v0, 0x0

    .line 4332
    .local v0, "boo":Z
    :try_start_0
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cn:Landroid/content/ComponentName;

    invoke-virtual {v5, v6}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 4338
    :goto_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt v2, v5, :cond_2

    .line 4382
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->finish()V

    goto :goto_0

    .line 4334
    .end local v2    # "i":I
    :catch_0
    move-exception v1

    .line 4336
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 4339
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "i":I
    :cond_2
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 4340
    .local v4, "path":Ljava/lang/String;
    const-string/jumbo v5, ".apk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_4

    .line 4338
    :cond_3
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 4344
    :cond_4
    if-eqz v0, :cond_5

    .line 4347
    :try_start_1
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cn:Landroid/content/ComponentName;

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v7, v5}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->installPackage(Landroid/content/ComponentName;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 4348
    :catch_1
    move-exception v5

    goto :goto_3

    .line 4350
    :cond_5
    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "A10-70LC"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "TB-8703N"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "TB-8604F"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "A10-70F"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "YiJiao"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "YOGATablet2-1050LC"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 4351
    :cond_6
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Landroid/app/mia/MiaMdmPolicyManager;->silentInstall(Ljava/lang/String;)V

    goto :goto_3

    .line 4356
    :cond_7
    if-eqz p0, :cond_3

    .line 4357
    :try_start_2
    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P990S.V"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "M1016Pro"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "S1016PRO"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "D13B"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "QC80A"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "N5110ZB"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, ".T360Z"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P583"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P350"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P550"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "M856.V"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "S1016.V1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "S106.V1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "S1016E"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    .line 4359
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 4360
    .local v3, "intent":Landroid/content/Intent;
    const-string/jumbo v5, "com.edutech.install"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4361
    invoke-virtual {p0, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 4362
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkinstall(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 4377
    .end local v3    # "intent":Landroid/content/Intent;
    :catch_2
    move-exception v5

    goto/16 :goto_3

    .line 4372
    :cond_8
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkinstall_samsung(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_3
.end method

.method private installSingleApk(Ljava/lang/String;)V
    .locals 5
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 964
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, ".apk"

    invoke-virtual {p1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 1003
    :cond_0
    :goto_0
    return-void

    .line 967
    :cond_1
    const/4 v0, 0x0

    .line 968
    .local v0, "boo":Z
    new-instance v3, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-direct {v3, p0}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

    .line 970
    :try_start_0
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cn:Landroid/content/ComponentName;

    invoke-virtual {v3, v4}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    .line 975
    :goto_1
    if-eqz v0, :cond_2

    .line 978
    :try_start_1
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cn:Landroid/content/ComponentName;

    invoke-virtual {v3, v4, p1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->installPackage(Landroid/content/ComponentName;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 979
    :catch_0
    move-exception v3

    goto :goto_0

    .line 971
    :catch_1
    move-exception v1

    .line 973
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 980
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "A10-70LC"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "TB-8703N"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "TB-8604F"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "A10-70F"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "YiJiao"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "YOGATablet2-1050LC"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 981
    :cond_3
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

    invoke-virtual {v3, p1}, Landroid/app/mia/MiaMdmPolicyManager;->silentInstall(Ljava/lang/String;)V

    goto :goto_0

    .line 985
    :cond_4
    :try_start_2
    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "M1016Pro"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "P990S.V"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "S1016PRO"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "D13B"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "QC80A"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "N5110ZB"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, ".T360Z"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "P350"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "P550"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "M856.V"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "S1016.V1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "S106.V1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "S1016E"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v4, "P583"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_5

    .line 986
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 987
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "com.edutech.install"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 988
    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 989
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkinstall(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 999
    .end local v2    # "intent":Landroid/content/Intent;
    :catch_2
    move-exception v3

    goto/16 :goto_0

    .line 996
    :cond_5
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkinstall_samsung(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0
.end method

.method private isApkUpdating(Ljava/lang/String;)Z
    .locals 14
    .param p1, "pkg"    # Ljava/lang/String;

    .prologue
    .line 4128
    const/4 v0, 0x1

    .line 4129
    .local v0, "canStart":Z
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 4130
    .local v8, "time":J
    const-string/jumbo v7, "resumeconfig"

    const/4 v10, 0x0

    invoke-virtual {p0, v7, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 4131
    .local v6, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "updateapks"

    const-wide/16 v10, 0x0

    invoke-interface {v6, v7, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 4132
    .local v4, "pretime":J
    sub-long v10, v8, v4

    const-wide/32 v12, 0x75300

    cmp-long v7, v10, v12

    if-lez v7, :cond_0

    const-wide/16 v10, 0x0

    cmp-long v7, v4, v10

    if-eqz v7, :cond_0

    .line 4134
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    .line 4136
    :cond_0
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    :cond_1
    move v1, v0

    .line 4146
    .end local v0    # "canStart":Z
    .local v1, "canStart":I
    :goto_0
    return v1

    .line 4139
    .end local v1    # "canStart":I
    .restart local v0    # "canStart":Z
    :cond_2
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lt v2, v7, :cond_3

    :goto_2
    move v1, v0

    .line 4146
    .restart local v1    # "canStart":I
    goto :goto_0

    .line 4140
    .end local v1    # "canStart":I
    :cond_3
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdatePkgList:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 4141
    .local v3, "pkgName":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 4142
    const/4 v0, 0x0

    .line 4143
    goto :goto_2

    .line 4139
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static isServiceExisted(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 4258
    .line 4259
    const-string/jumbo v6, "activity"

    invoke-virtual {p0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 4258
    check-cast v0, Landroid/app/ActivityManager;

    .line 4261
    .local v0, "activityManager":Landroid/app/ActivityManager;
    const v6, 0x7fffffff

    invoke-virtual {v0, v6}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v3

    .line 4263
    .local v3, "serviceList":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningServiceInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    if-gtz v6, :cond_1

    .line 4275
    :cond_0
    :goto_0
    return v5

    .line 4267
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 4268
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 4269
    .local v2, "serviceInfo":Landroid/app/ActivityManager$RunningServiceInfo;
    iget-object v4, v2, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    .line 4271
    .local v4, "serviceName":Landroid/content/ComponentName;
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 4272
    const/4 v5, 0x1

    goto :goto_0

    .line 4267
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private isShowView(Landroid/view/View;Z)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "flag"    # Z

    .prologue
    .line 2796
    if-eqz p2, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 2797
    return-void

    .line 2796
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method private judgeApp(Ljava/lang/String;I)V
    .locals 3
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "enable"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1917
    const-string/jumbo v0, "daoxueben"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1919
    if-ne p2, v1, :cond_1

    .line 1921
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ONE_IMG:Z

    .line 2014
    :cond_0
    :goto_0
    return-void

    .line 1923
    :cond_1
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ONE_IMG:Z

    goto :goto_0

    .line 1925
    :cond_2
    const-string/jumbo v0, "zuoyefudao"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1927
    if-ne p2, v1, :cond_3

    .line 1929
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TWO_IMG:Z

    goto :goto_0

    .line 1931
    :cond_3
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TWO_IMG:Z

    goto :goto_0

    .line 1933
    :cond_4
    const-string/jumbo v0, "myhomework"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1935
    if-ne p2, v1, :cond_5

    .line 1937
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->THREE_IMG:Z

    goto :goto_0

    .line 1939
    :cond_5
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->THREE_IMG:Z

    goto :goto_0

    .line 1941
    :cond_6
    const-string/jumbo v0, "cuotiji"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1943
    if-ne p2, v1, :cond_7

    .line 1945
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->FOUR_IMG:Z

    goto :goto_0

    .line 1947
    :cond_7
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->FOUR_IMG:Z

    goto :goto_0

    .line 1949
    :cond_8
    const-string/jumbo v0, "afd_mybook"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1951
    if-ne p2, v1, :cond_9

    .line 1953
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->FIVE_IMG:Z

    goto :goto_0

    .line 1955
    :cond_9
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->FIVE_IMG:Z

    goto :goto_0

    .line 1957
    :cond_a
    const-string/jumbo v0, "my_app"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1959
    if-ne p2, v1, :cond_b

    .line 1961
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->SIX_IMG:Z

    goto :goto_0

    .line 1963
    :cond_b
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->SIX_IMG:Z

    goto :goto_0

    .line 1965
    :cond_c
    const-string/jumbo v0, "my_camera"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1967
    if-ne p2, v1, :cond_d

    .line 1969
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->SEVEN_IMG:Z

    goto :goto_0

    .line 1971
    :cond_d
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->SEVEN_IMG:Z

    goto :goto_0

    .line 1973
    :cond_e
    const-string/jumbo v0, "myfiles"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1975
    if-ne p2, v1, :cond_f

    .line 1977
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->EIGHT_IMG:Z

    goto :goto_0

    .line 1979
    :cond_f
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->EIGHT_IMG:Z

    goto :goto_0

    .line 1981
    :cond_10
    const-string/jumbo v0, "home_school"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 1983
    if-ne p2, v1, :cond_11

    .line 1985
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->NINE_IMG:Z

    goto/16 :goto_0

    .line 1987
    :cond_11
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->NINE_IMG:Z

    goto/16 :goto_0

    .line 1989
    :cond_12
    const-string/jumbo v0, "hudongtaolun"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1991
    if-ne p2, v1, :cond_13

    .line 1993
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TEN_IMG:Z

    goto/16 :goto_0

    .line 1995
    :cond_13
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TEN_IMG:Z

    goto/16 :goto_0

    .line 1997
    :cond_14
    const-string/jumbo v0, "study_store"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 1999
    if-ne p2, v1, :cond_15

    .line 2001
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ELEVEN_IMG:Z

    goto/16 :goto_0

    .line 2003
    :cond_15
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ELEVEN_IMG:Z

    goto/16 :goto_0

    .line 2005
    :cond_16
    const-string/jumbo v0, "happ_class"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2007
    if-ne p2, v1, :cond_17

    .line 2009
    sput-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TWELVE_IMG:Z

    goto/16 :goto_0

    .line 2011
    :cond_17
    sput-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TWELVE_IMG:Z

    goto/16 :goto_0
.end method

.method private judgeIcon(Lcom/edutech/mobilestudyclient/activity/AppBean;)V
    .locals 9
    .param p1, "app"    # Lcom/edutech/mobilestudyclient/activity/AppBean;

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1804
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getCode()Ljava/lang/String;

    move-result-object v1

    .line 1805
    .local v1, "code":Ljava/lang/String;
    const-string/jumbo v2, "daoxueben"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1807
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1808
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v4

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1810
    :cond_0
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v4

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1811
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1812
    .local v0, "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1813
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v4

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 1914
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_1
    :goto_0
    return-void

    .line 1814
    :cond_2
    const-string/jumbo v2, "zuoyefudao"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1816
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 1817
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1819
    :cond_3
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v5

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1820
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1821
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1822
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v5

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 1823
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_4
    const-string/jumbo v2, "myhomework"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1825
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 1826
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1828
    :cond_5
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v6

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1829
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1830
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1831
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v6

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 1832
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_6
    const-string/jumbo v2, "cuotiji"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1834
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 1835
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v7

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1837
    :cond_7
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v7

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1838
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1839
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1840
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v7

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1841
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_8
    const-string/jumbo v2, "afd_mybook"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 1843
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 1844
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1846
    :cond_9
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    aget-object v2, v2, v8

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1847
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1848
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1849
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    aget-object v2, v2, v8

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1850
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_a
    const-string/jumbo v2, "my_app"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1852
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 1853
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1855
    :cond_b
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1856
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1857
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1858
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1859
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_c
    const-string/jumbo v2, "my_camera"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 1861
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 1862
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1864
    :cond_d
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1865
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1866
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1867
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x6

    aget-object v2, v2, v3

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1868
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_e
    const-string/jumbo v2, "myfiles"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 1870
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 1871
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1873
    :cond_f
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1874
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1875
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1876
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/4 v3, 0x7

    aget-object v2, v2, v3

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1877
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_10
    const-string/jumbo v2, "home_school"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1879
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 1880
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1882
    :cond_11
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1883
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1884
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1885
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x8

    aget-object v2, v2, v3

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1886
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_12
    const-string/jumbo v2, "hudongtaolun"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 1888
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_13

    .line 1889
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1891
    :cond_13
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1892
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1893
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1894
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0x9

    aget-object v2, v2, v3

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1895
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_14
    const-string/jumbo v2, "study_store"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 1897
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_15

    .line 1898
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1900
    :cond_15
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1901
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1902
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1903
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xa

    aget-object v2, v2, v3

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1904
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_16
    const-string/jumbo v2, "happ_class"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1906
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_17

    .line 1907
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xb

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1909
    :cond_17
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->textViews:[Landroid/widget/TextView;

    const/16 v3, 0xb

    aget-object v2, v2, v3

    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1910
    invoke-virtual {p1}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1911
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 1912
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViews:[Landroid/widget/ImageView;

    const/16 v3, 0xb

    aget-object v2, v2, v3

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0
.end method

.method private judgePadType()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1481
    :try_start_0
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1482
    const-string/jumbo v3, "com.android.mms"

    const/4 v4, 0x0

    .line 1481
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 1487
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    if-nez v1, :cond_0

    .line 1488
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v3, "\u975e3G"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1489
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->is3G:Ljava/lang/Boolean;

    .line 1494
    :goto_1
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v3, "Lenovo B8000-H"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1495
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isLenovo:Ljava/lang/Boolean;

    .line 1496
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->is3G:Ljava/lang/Boolean;

    .line 1501
    :goto_2
    :try_start_1
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1502
    const-string/jumbo v3, "cn.sh.mhedu.mhzx.mobiledesktop"

    const/4 v4, 0x0

    .line 1501
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    .line 1507
    :goto_3
    return-void

    .line 1483
    .end local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v0

    .line 1484
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v1, 0x0

    .line 1485
    .restart local v1    # "packageInfo":Landroid/content/pm/PackageInfo;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 1491
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v3, "3G"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1492
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->is3G:Ljava/lang/Boolean;

    goto :goto_1

    .line 1498
    :cond_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isLenovo:Ljava/lang/Boolean;

    goto :goto_2

    .line 1503
    :catch_1
    move-exception v0

    .line 1504
    .restart local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v1, 0x0

    .line 1505
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_3
.end method

.method private loadUserInfo()V
    .locals 6

    .prologue
    .line 756
    const-string/jumbo v3, "privatekey"

    .line 757
    const/4 v4, 0x0

    .line 756
    invoke-virtual {p0, v3, v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 758
    .local v1, "sharePre":Landroid/content/SharedPreferences;
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v0

    .line 759
    .local v0, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    .line 760
    const-string/jumbo v3, "ip"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    .line 761
    const-string/jumbo v3, "username"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_name:Ljava/lang/String;

    .line 762
    const-string/jumbo v3, "usercode"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_usercode:Ljava/lang/String;

    .line 764
    const-string/jumbo v3, "privatekey"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_privatekey:Ljava/lang/String;

    .line 765
    const-string/jumbo v3, "pwd"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_pwd:Ljava/lang/String;

    .line 766
    const-string/jumbo v3, "schoolid"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_schoolid:Ljava/lang/String;

    .line 767
    const-string/jumbo v3, "stuid"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 768
    .local v2, "userid":Ljava/lang/String;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "key"

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_privatekey:Ljava/lang/String;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 769
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "apihost"

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 770
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "name"

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_usercode:Ljava/lang/String;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 771
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "pwd"

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_pwd:Ljava/lang/String;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 772
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "userid"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 773
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "schoolid"

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_schoolid:Ljava/lang/String;

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 776
    .end local v2    # "userid":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private lockPad()V
    .locals 14

    .prologue
    const/4 v11, 0x0

    const-wide/16 v12, 0x0

    .line 1518
    const-string/jumbo v7, "lockscreen"

    const/4 v10, 0x4

    invoke-virtual {p0, v7, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 1519
    .local v3, "spf":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "locked"

    invoke-interface {v3, v7, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 1520
    .local v2, "locked":Z
    const-string/jumbo v7, "lockstartTime"

    invoke-interface {v3, v7, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 1521
    .local v4, "startTime":J
    const-string/jumbo v7, "tmplockedtime"

    invoke-interface {v3, v7, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 1522
    .local v8, "tempStartTime":J
    const-string/jumbo v7, "tmplocked"

    invoke-interface {v3, v7, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 1523
    .local v6, "tempLock":I
    if-eqz v2, :cond_0

    cmp-long v7, v4, v12

    if-eqz v7, :cond_0

    .line 1525
    new-instance v0, Landroid/content/Intent;

    sget-object v7, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_LOCKWINDOW:Ljava/lang/String;

    invoke-direct {v0, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1526
    .local v0, "intent2":Landroid/content/Intent;
    const-string/jumbo v7, "state"

    const-string/jumbo v10, "2"

    invoke-virtual {v0, v7, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1527
    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1538
    .end local v0    # "intent2":Landroid/content/Intent;
    :goto_0
    return-void

    .line 1528
    :cond_0
    const/4 v7, 0x1

    if-ne v6, v7, :cond_1

    cmp-long v7, v8, v12

    if-eqz v7, :cond_1

    .line 1530
    new-instance v0, Landroid/content/Intent;

    sget-object v7, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_LOCKWINDOW:Ljava/lang/String;

    invoke-direct {v0, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1531
    .restart local v0    # "intent2":Landroid/content/Intent;
    const-string/jumbo v7, "state"

    const-string/jumbo v10, "1"

    invoke-virtual {v0, v7, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1532
    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 1535
    .end local v0    # "intent2":Landroid/content/Intent;
    :cond_1
    new-instance v1, Landroid/content/Intent;

    sget-object v7, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_UNLOCKWINDOW:Ljava/lang/String;

    invoke-direct {v1, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1536
    .local v1, "intent3":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private openCamera()V
    .locals 19

    .prologue
    .line 4200
    const-string/jumbo v12, "com.edutech.mycamera"

    .line 4201
    .local v12, "packageCamera":Ljava/lang/String;
    const-string/jumbo v13, "com.edutech.mycamera.gallery.PhotoPickerActivity"

    .line 4203
    .local v13, "packageCameraActivity":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v17

    .line 4204
    const/16 v18, 0x0

    .line 4203
    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v12, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v15

    .line 4205
    .local v15, "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v15, :cond_0

    .line 4206
    new-instance v5, Landroid/content/ComponentName;

    invoke-direct {v5, v12, v13}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4208
    .local v5, "component":Landroid/content/ComponentName;
    new-instance v10, Landroid/content/Intent;

    invoke-direct {v10}, Landroid/content/Intent;-><init>()V

    .line 4209
    .local v10, "intent_book":Landroid/content/Intent;
    const-string/jumbo v17, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 4210
    invoke-virtual {v10, v5}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4211
    const-string/jumbo v17, "android.intent.action.MAIN"

    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4212
    const/high16 v17, 0x10000000

    move/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 4213
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 4248
    .end local v5    # "component":Landroid/content/ComponentName;
    .end local v10    # "intent_book":Landroid/content/Intent;
    .end local v15    # "pinfo":Landroid/content/pm/PackageInfo;
    :goto_0
    return-void

    .line 4216
    :catch_0
    move-exception v7

    .line 4218
    .local v7, "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v7}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 4222
    .end local v7    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    :goto_1
    sget-boolean v17, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isZBYZ:Z

    if-eqz v17, :cond_1

    .line 4224
    const-string/jumbo v17, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 4230
    :cond_1
    :try_start_1
    new-instance v8, Landroid/content/Intent;

    const-string/jumbo v17, "android.media.action.IMAGE_CAPTURE"

    move-object/from16 v0, v17

    invoke-direct {v8, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4231
    .local v8, "infoIntent":Landroid/content/Intent;
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v8, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v16

    .line 4234
    .local v16, "res":Landroid/content/pm/ResolveInfo;
    move-object/from16 v0, v16

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v14, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 4235
    .local v14, "packageName":Ljava/lang/String;
    move-object/from16 v0, v16

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v3, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 4236
    .local v3, "classname":Ljava/lang/String;
    new-instance v11, Landroid/content/Intent;

    invoke-direct {v11}, Landroid/content/Intent;-><init>()V

    .line 4237
    .local v11, "mIntent":Landroid/content/Intent;
    new-instance v4, Landroid/content/ComponentName;

    invoke-direct {v4, v14, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4238
    .local v4, "comp":Landroid/content/ComponentName;
    invoke-virtual {v11, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4239
    const-string/jumbo v17, "android.intent.action.MAIN"

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4240
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 4241
    .end local v3    # "classname":Ljava/lang/String;
    .end local v4    # "comp":Landroid/content/ComponentName;
    .end local v8    # "infoIntent":Landroid/content/Intent;
    .end local v11    # "mIntent":Landroid/content/Intent;
    .end local v14    # "packageName":Ljava/lang/String;
    .end local v16    # "res":Landroid/content/pm/ResolveInfo;
    :catch_1
    move-exception v6

    .line 4243
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 4244
    new-instance v9, Landroid/content/Intent;

    .line 4245
    const-string/jumbo v17, "android.media.action.IMAGE_CAPTURE"

    .line 4244
    move-object/from16 v0, v17

    invoke-direct {v9, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4246
    .local v9, "intentP":Landroid/content/Intent;
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 4219
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v9    # "intentP":Landroid/content/Intent;
    :catch_2
    move-exception v17

    goto :goto_1
.end method

.method private openLockScreen()V
    .locals 9

    .prologue
    .line 394
    :try_start_0
    const-string/jumbo v6, "screenshot"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 395
    .local v5, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v6, "locked"

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 397
    .local v0, "boo":Z
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.MAIN"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 398
    .local v3, "intent2":Landroid/content/Intent;
    const/high16 v6, 0x10000000

    invoke-virtual {v3, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 400
    new-instance v1, Landroid/content/ComponentName;

    const-string/jumbo v6, "com.edutech.lockscreen"

    .line 401
    const-string/jumbo v7, "com.edutech.lockscreen.MainActivity"

    .line 400
    invoke-direct {v1, v6, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    .local v1, "cn":Landroid/content/ComponentName;
    invoke-virtual {v3, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 405
    :try_start_1
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 406
    const-string/jumbo v7, "com.edutech.lockscreen"

    const/4 v8, 0x0

    .line 405
    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 411
    .local v4, "packageInfo2":Landroid/content/pm/PackageInfo;
    :goto_0
    if-eqz v4, :cond_0

    .line 412
    :try_start_2
    invoke-virtual {p0, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    .line 414
    :cond_0
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "locked"

    const/4 v8, 0x1

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 421
    .end local v0    # "boo":Z
    .end local v1    # "cn":Landroid/content/ComponentName;
    .end local v3    # "intent2":Landroid/content/Intent;
    .end local v4    # "packageInfo2":Landroid/content/pm/PackageInfo;
    .end local v5    # "sp":Landroid/content/SharedPreferences;
    :goto_1
    return-void

    .line 407
    .restart local v0    # "boo":Z
    .restart local v1    # "cn":Landroid/content/ComponentName;
    .restart local v3    # "intent2":Landroid/content/Intent;
    .restart local v5    # "sp":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v2

    .line 408
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v4, 0x0

    .line 409
    .restart local v4    # "packageInfo2":Landroid/content/pm/PackageInfo;
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 417
    .end local v0    # "boo":Z
    .end local v1    # "cn":Landroid/content/ComponentName;
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v3    # "intent2":Landroid/content/Intent;
    .end local v4    # "packageInfo2":Landroid/content/pm/PackageInfo;
    .end local v5    # "sp":Landroid/content/SharedPreferences;
    :catch_1
    move-exception v6

    goto :goto_1
.end method

.method private openScreenShot()V
    .locals 9

    .prologue
    .line 360
    :try_start_0
    const-string/jumbo v6, "screenshot"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 361
    .local v5, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v6, "opened"

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 362
    .local v0, "boo":Z
    const-string/jumbo v6, "CloudClientActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "open screenshot:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.MAIN"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 365
    .local v3, "intent2":Landroid/content/Intent;
    const/high16 v6, 0x10000000

    invoke-virtual {v3, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 367
    new-instance v1, Landroid/content/ComponentName;

    const-string/jumbo v6, "com.edutech.screenshot"

    .line 368
    const-string/jumbo v7, "com.edutech.screenshot.ScreenShotActivity"

    .line 367
    invoke-direct {v1, v6, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    .local v1, "cn":Landroid/content/ComponentName;
    invoke-virtual {v3, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 372
    :try_start_1
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 373
    const-string/jumbo v7, "com.edutech.screenshot"

    const/4 v8, 0x0

    .line 372
    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 378
    .local v4, "packageInfo2":Landroid/content/pm/PackageInfo;
    :goto_0
    if-eqz v4, :cond_0

    .line 379
    :try_start_2
    invoke-virtual {p0, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    .line 381
    :cond_0
    const-string/jumbo v6, "CloudClientActivity"

    const-string/jumbo v7, "open screenshot....."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "opened"

    const/4 v8, 0x1

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 387
    .end local v0    # "boo":Z
    .end local v1    # "cn":Landroid/content/ComponentName;
    .end local v3    # "intent2":Landroid/content/Intent;
    .end local v4    # "packageInfo2":Landroid/content/pm/PackageInfo;
    .end local v5    # "sp":Landroid/content/SharedPreferences;
    :goto_1
    return-void

    .line 374
    .restart local v0    # "boo":Z
    .restart local v1    # "cn":Landroid/content/ComponentName;
    .restart local v3    # "intent2":Landroid/content/Intent;
    .restart local v5    # "sp":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v2

    .line 375
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v4, 0x0

    .line 376
    .restart local v4    # "packageInfo2":Landroid/content/pm/PackageInfo;
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 384
    .end local v0    # "boo":Z
    .end local v1    # "cn":Landroid/content/ComponentName;
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v3    # "intent2":Landroid/content/Intent;
    .end local v4    # "packageInfo2":Landroid/content/pm/PackageInfo;
    .end local v5    # "sp":Landroid/content/SharedPreferences;
    :catch_1
    move-exception v6

    goto :goto_1
.end method

.method private openSetting()V
    .locals 8

    .prologue
    .line 4172
    const-string/jumbo v4, "com.edutech.settingapp"

    .line 4173
    .local v4, "packageEword":Ljava/lang/String;
    const-string/jumbo v3, "com.edutech.settingapp.CloudClientSetActivity"

    .line 4175
    .local v3, "packageClassEword":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 4176
    const/4 v7, 0x0

    .line 4175
    invoke-virtual {v6, v4, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 4177
    .local v5, "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v5, :cond_0

    .line 4178
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, v4, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4180
    .local v0, "component":Landroid/content/ComponentName;
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 4181
    .local v2, "intent_book":Landroid/content/Intent;
    const-string/jumbo v6, "android.intent.category.LAUNCHER"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 4182
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4183
    const-string/jumbo v6, "android.intent.action.MAIN"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4184
    const/high16 v6, 0x10000000

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 4185
    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4194
    .end local v0    # "component":Landroid/content/ComponentName;
    .end local v2    # "intent_book":Landroid/content/Intent;
    .end local v5    # "pinfo":Landroid/content/pm/PackageInfo;
    :goto_0
    return-void

    .line 4188
    :catch_0
    move-exception v1

    .line 4190
    .local v1, "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 4192
    .end local v1    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    const-class v6, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {p0, v6}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->openActivity(Ljava/lang/Class;)V

    goto :goto_0
.end method

.method private parseDownload(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 28
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/ApkUpdateBean;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1013
    .local p1, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p2, "apks":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    const/4 v6, 0x0

    .line 1014
    .local v6, "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v24

    move/from16 v0, v24

    if-lt v11, v0, :cond_0

    .line 1097
    return-object p1

    .line 1016
    :cond_0
    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    check-cast v6, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .line 1017
    .restart local v6    # "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getPackagename()Ljava/lang/String;

    move-result-object v19

    .line 1018
    .local v19, "packagename":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkUrl()Ljava/lang/String;

    move-result-object v5

    .line 1019
    .local v5, "apkUrl":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getAppName()Ljava/lang/String;

    move-result-object v16

    .line 1020
    .local v16, "name":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkSize()J

    move-result-wide v20

    .line 1021
    .local v20, "size":J
    new-instance v8, Ljava/io/File;

    sget-object v24, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_APKS:Ljava/lang/String;

    move-object/from16 v0, v24

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1022
    .local v8, "dir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v24

    if-nez v24, :cond_1

    .line 1023
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 1025
    :cond_1
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v24

    if-eqz v24, :cond_6

    .line 1026
    new-instance v10, Ljava/io/File;

    .line 1027
    new-instance v24, Ljava/lang/StringBuilder;

    sget-object v25, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 1026
    move-object/from16 v0, v24

    invoke-direct {v10, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1028
    .local v10, "file":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v24

    if-eqz v24, :cond_2

    .line 1029
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 1032
    :cond_2
    const/16 v24, 0x2800

    move/from16 v0, v24

    new-array v7, v0, [B

    .line 1033
    .local v7, "bys":[B
    const-wide/16 v12, 0x0

    .line 1034
    .local v12, "getsize":J
    const/16 v23, 0x0

    .line 1036
    .local v23, "urlConnection":Ljava/net/HttpURLConnection;
    :try_start_0
    new-instance v22, Ljava/net/URL;

    move-object/from16 v0, v22

    invoke-direct {v0, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1038
    .local v22, "url2":Ljava/net/URL;
    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v24

    .line 1037
    move-object/from16 v0, v24

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object/from16 v23, v0

    .line 1039
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->connect()V

    .line 1040
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v14

    .line 1041
    .local v14, "in":Ljava/io/InputStream;
    new-instance v18, Ljava/io/FileOutputStream;

    move-object/from16 v0, v18

    invoke-direct {v0, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1043
    .local v18, "out":Ljava/io/FileOutputStream;
    const/16 v17, 0x0

    .line 1044
    .local v17, "num":I
    :cond_3
    :goto_1
    cmp-long v24, v12, v20

    if-ltz v24, :cond_7

    .line 1057
    :cond_4
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    const/16 v25, 0x1011

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 1058
    invoke-virtual/range {v18 .. v18}, Ljava/io/FileOutputStream;->close()V

    .line 1059
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 1069
    .end local v14    # "in":Ljava/io/InputStream;
    .end local v17    # "num":I
    .end local v18    # "out":Ljava/io/FileOutputStream;
    .end local v22    # "url2":Ljava/net/URL;
    :goto_2
    if-eqz v23, :cond_5

    .line 1070
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1072
    :cond_5
    cmp-long v24, v12, v20

    if-nez v24, :cond_a

    .line 1073
    const-string/jumbo v24, "com.launcher.activity"

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_8

    .line 1074
    new-instance v24, Ljava/lang/StringBuilder;

    sget-object v25, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1075
    const/16 v24, -0x1

    new-instance v25, Ljava/lang/StringBuilder;

    sget-object v26, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    const/16 v26, 0x1014

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v25

    move/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 1076
    const/16 v24, 0x0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    const/16 v25, 0x1012

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 1077
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->addApksList:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1014
    .end local v7    # "bys":[B
    .end local v10    # "file":Ljava/io/File;
    .end local v12    # "getsize":J
    .end local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_6
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_0

    .line 1045
    .restart local v7    # "bys":[B
    .restart local v10    # "file":Ljava/io/File;
    .restart local v12    # "getsize":J
    .restart local v14    # "in":Ljava/io/InputStream;
    .restart local v17    # "num":I
    .restart local v18    # "out":Ljava/io/FileOutputStream;
    .restart local v22    # "url2":Ljava/net/URL;
    .restart local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_7
    :try_start_1
    invoke-virtual {v14, v7}, Ljava/io/InputStream;->read([B)I

    move-result v15

    .line 1046
    .local v15, "length":I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v15, v0, :cond_4

    .line 1049
    int-to-long v0, v15

    move-wide/from16 v24, v0

    add-long v12, v12, v24

    .line 1050
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCachePosition:J

    move-wide/from16 v24, v0

    int-to-long v0, v15

    move-wide/from16 v26, v0

    add-long v24, v24, v26

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCachePosition:J

    .line 1051
    const/16 v24, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v24

    invoke-virtual {v0, v7, v1, v15}, Ljava/io/FileOutputStream;->write([BII)V

    .line 1052
    add-int/lit8 v17, v17, 0x1

    .line 1053
    rem-int/lit8 v24, v17, 0xa

    if-nez v24, :cond_3

    .line 1054
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    const/16 v25, 0x1011

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendInstallMessage(ILjava/lang/Object;I)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    goto/16 :goto_1

    .line 1060
    .end local v14    # "in":Ljava/io/InputStream;
    .end local v15    # "length":I
    .end local v17    # "num":I
    .end local v18    # "out":Ljava/io/FileOutputStream;
    .end local v22    # "url2":Ljava/net/URL;
    :catch_0
    move-exception v9

    .line 1062
    .local v9, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v9}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_2

    .line 1063
    .end local v9    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v9

    .line 1065
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 1080
    .end local v9    # "e":Ljava/io/IOException;
    :cond_8
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdateList:Ljava/util/List;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .line 1081
    .local v4, "apkBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    new-instance v24, Ljava/lang/StringBuilder;

    sget-object v25, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkLocalPath(Ljava/lang/String;)V

    .line 1082
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkUpdateList:Ljava/util/List;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-interface {v0, v11, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1086
    .end local v4    # "apkBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    :goto_4
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_9

    .line 1087
    const/16 v24, -0x1

    new-instance v25, Ljava/lang/StringBuilder;

    sget-object v26, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    const/16 v26, 0x1014

    move-object/from16 v0, p0

    move/from16 v1, v24

    move-object/from16 v2, v25

    move/from16 v3, v26

    invoke-direct {v0, v1, v2, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 1088
    const/16 v24, 0x0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    const/16 v25, 0x1012

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 1090
    :cond_9
    new-instance v24, Ljava/lang/StringBuilder;

    sget-object v25, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->launcherPath:Ljava/lang/String;

    goto/16 :goto_3

    .line 1093
    :cond_a
    const/16 v24, -0x2

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    const/16 v25, 0x1012

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    goto/16 :goto_3

    .line 1083
    :catch_2
    move-exception v24

    goto :goto_4

    .line 1066
    :catch_3
    move-exception v24

    goto/16 :goto_2
.end method

.method private refreshDownloadPB()V
    .locals 10

    .prologue
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v6, 0x4090000000000000L    # 1024.0

    .line 1172
    iget-boolean v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->canRefresh:Z

    if-nez v4, :cond_1

    .line 1184
    :cond_0
    :goto_0
    return-void

    .line 1176
    :cond_1
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    if-eqz v4, :cond_0

    .line 1178
    new-instance v3, Ljava/text/DecimalFormat;

    const-string/jumbo v4, "##0.00"

    invoke-direct {v3, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 1179
    .local v3, "df":Ljava/text/DecimalFormat;
    iget-wide v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCacheLength:J

    long-to-double v4, v4

    mul-double/2addr v4, v8

    div-double/2addr v4, v6

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    .line 1180
    .local v1, "alllength":Ljava/lang/String;
    iget-wide v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->currentCachePosition:J

    long-to-double v4, v4

    mul-double/2addr v4, v8

    div-double/2addr v4, v6

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    .line 1181
    .local v2, "currentPosition":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "MB/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "MB"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1182
    .local v0, "allStateString":Ljava/lang/String;
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f08022b

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private removeIllegalApks()V
    .locals 2

    .prologue
    .line 2574
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$24;

    invoke-direct {v1, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$24;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 2595
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 2596
    return-void
.end method

.method private resetAutoSp()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const-wide/16 v4, 0x0

    .line 1631
    const-string/jumbo v2, "resumeconfig"

    invoke-virtual {p0, v2, v6}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1632
    .local v1, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "updateapks"

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1633
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "updatedesign"

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1634
    const-string/jumbo v2, "noticemessage"

    invoke-virtual {p0, v2, v6}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1635
    .local v0, "callSp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "noticetime"

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1636
    return-void
.end method

.method private sendInstallMessage(ILjava/lang/Object;I)V
    .locals 2
    .param p1, "arg1"    # I
    .param p2, "obj"    # Ljava/lang/Object;
    .param p3, "what"    # I

    .prologue
    .line 1101
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 1102
    .local v0, "msgInstall":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 1103
    iput p3, v0, Landroid/os/Message;->what:I

    .line 1104
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1105
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1106
    return-void
.end method

.method private setDefaultSetting()V
    .locals 6

    .prologue
    .line 550
    new-instance v2, Landroid/content/ComponentName;

    const-string/jumbo v3, "com.launcher.activity"

    const-string/jumbo v4, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cn:Landroid/content/ComponentName;

    .line 551
    new-instance v2, Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    invoke-direct {v2, p0}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    .line 552
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cn:Landroid/content/ComponentName;

    const-string/jumbo v4, "com.launcher.activity"

    const-string/jumbo v5, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    invoke-virtual {v2, v3, v4, v5}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->setCustomLauncher(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "TB-8703N"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "TB-8604F"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "A10-70F"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "YiJiao"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v3, "YOGATablet2-1050LC"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 554
    :cond_0
    new-instance v1, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    .line 555
    .local v1, "miaMdmPolicyManager":Landroid/app/mia/MiaMdmPolicyManager;
    const-string/jumbo v2, "com.launcher.activity"

    invoke-virtual {v1, v2}, Landroid/app/mia/MiaMdmPolicyManager;->setCustomLauncher(Ljava/lang/String;)Z

    .line 556
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/mia/MiaMdmPolicyManager;->controlBluetooth(Z)Z

    .line 558
    .end local v1    # "miaMdmPolicyManager":Landroid/app/mia/MiaMdmPolicyManager;
    :cond_1
    const-string/jumbo v2, "device_policy"

    invoke-virtual {p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/admin/DevicePolicyManager;

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mDPM:Landroid/app/admin/DevicePolicyManager;

    .line 559
    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/edutech/mobilestudyclient/activity/SampleAdmin;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mDeviceAdmin:Landroid/content/ComponentName;

    .line 560
    const-string/jumbo v0, "20c52e3ae9125e32506e5e813dde3f88"

    .line 561
    .local v0, "appId":Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/pgyersdk/crash/PgyCrashManager;->register(Landroid/content/Context;Ljava/lang/String;)V

    .line 569
    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNL:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNLEZ:Z

    if-eqz v2, :cond_3

    .line 571
    :cond_2
    :try_start_0
    iget-boolean v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->deletingFiles:Z

    if-nez v2, :cond_3

    .line 572
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$14;

    invoke-direct {v3, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$14;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 579
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 583
    :cond_3
    :goto_0
    return-void

    .line 581
    :catch_0
    move-exception v2

    goto :goto_0

    .line 580
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method private setDesignView()V
    .locals 2

    .prologue
    .line 1680
    :try_start_0
    iget-boolean v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetLauncher:Z

    if-nez v1, :cond_0

    .line 1682
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1683
    .local v0, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml2()Ljava/util/ArrayList;

    move-result-object v0

    .line 1684
    invoke-direct {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->enableButtons(Ljava/util/ArrayList;)V

    .line 1685
    invoke-direct {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->changeIcons(Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1690
    .end local v0    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    :cond_0
    :goto_0
    return-void

    .line 1687
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private setMainView()V
    .locals 1

    .prologue
    .line 588
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v0, :cond_0

    .line 590
    const v0, 0x7f03005d

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    .line 644
    :goto_0
    return-void

    .line 591
    :cond_0
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v0, :cond_1

    .line 593
    const v0, 0x7f03005c

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 594
    :cond_1
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isQZEZ:Z

    if-eqz v0, :cond_2

    .line 596
    const v0, 0x7f03005b

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 597
    :cond_2
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPDSSZ:Z

    if-eqz v0, :cond_3

    .line 599
    const v0, 0x7f030058

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 600
    :cond_3
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNL:Z

    if-eqz v0, :cond_4

    .line 602
    const v0, 0x7f030056

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 603
    :cond_4
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNLEZ:Z

    if-eqz v0, :cond_5

    .line 605
    const v0, 0x7f030055

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 606
    :cond_5
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v0, :cond_6

    .line 608
    const v0, 0x7f030052

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 609
    :cond_6
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isMAINNEW:Z

    if-eqz v0, :cond_7

    .line 611
    const v0, 0x7f030054

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 616
    :cond_7
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWYT:Z

    if-eqz v0, :cond_8

    .line 618
    const v0, 0x7f030063

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 619
    :cond_8
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWJD:Z

    if-eqz v0, :cond_9

    .line 621
    const v0, 0x7f030062

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 622
    :cond_9
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXF:Z

    if-eqz v0, :cond_a

    .line 624
    const v0, 0x7f03005f

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 625
    :cond_a
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCH:Z

    if-eqz v0, :cond_b

    .line 627
    const v0, 0x7f030050

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto :goto_0

    .line 628
    :cond_b
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXH:Z

    if-eqz v0, :cond_c

    .line 630
    const v0, 0x7f030060

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto/16 :goto_0

    .line 631
    :cond_c
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWHZ:Z

    if-eqz v0, :cond_d

    .line 633
    const v0, 0x7f030061

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto/16 :goto_0

    .line 634
    :cond_d
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPHNS:Z

    if-eqz v0, :cond_e

    .line 636
    const v0, 0x7f03005a

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto/16 :goto_0

    .line 637
    :cond_e
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCJLY:Z

    if-eqz v0, :cond_f

    .line 639
    const v0, 0x7f030051

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto/16 :goto_0

    .line 642
    :cond_f
    const v0, 0x7f03004e

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setContentView(I)V

    goto/16 :goto_0
.end method

.method private showFailedApkInfo()V
    .locals 8

    .prologue
    .line 4961
    iget-boolean v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->canRefresh:Z

    if-nez v6, :cond_1

    .line 4998
    :cond_0
    :goto_0
    return-void

    .line 4965
    :cond_1
    sget-boolean v6, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNewUpdate:Z

    if-nez v6, :cond_2

    .line 4967
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    if-eqz v6, :cond_0

    .line 4969
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    const/4 v7, 0x4

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 4974
    :cond_2
    :try_start_0
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    if-eqz v6, :cond_0

    .line 4978
    const-string/jumbo v6, "privatekey"

    .line 4979
    const/4 v7, 0x0

    .line 4978
    invoke-virtual {p0, v6, v7}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 4980
    .local v5, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v6, "apihost"

    const-string/jumbo v7, ""

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 4981
    .local v4, "ip":Ljava/lang/String;
    invoke-static {p0, v4}, Lcom/edutech/mobilestudyclient/util/Utils;->getFailedEbagUpdated(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 4982
    .local v1, "failedApks":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-gtz v6, :cond_4

    .line 4984
    :cond_3
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4994
    .end local v1    # "failedApks":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "ip":Ljava/lang/String;
    .end local v5    # "sharePre":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v0

    .line 4996
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 4987
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "failedApks":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v4    # "ip":Ljava/lang/String;
    .restart local v5    # "sharePre":Landroid/content/SharedPreferences;
    :cond_4
    :try_start_1
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f08022a

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 4988
    .local v2, "failedStr":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-lt v3, v6, :cond_5

    .line 4992
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4993
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 4990
    :cond_5
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 4988
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private showNoticeDetails()V
    .locals 12

    .prologue
    .line 5290
    iget-boolean v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->canRefresh:Z

    if-nez v7, :cond_1

    .line 5339
    :cond_0
    :goto_0
    return-void

    .line 5294
    :cond_1
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeDialog:Landroid/app/AlertDialog;

    if-nez v7, :cond_2

    .line 5296
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 5297
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    const v8, 0x7f030011

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    .line 5298
    .local v6, "view":Landroid/view/View;
    const v7, 0x7f0a003a

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ListView;

    iput-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->dialog_noticemessage_listview:Landroid/widget/ListView;

    .line 5299
    const v7, 0x7f0a0039

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->dialog_noticemessage_tvnotice:Landroid/widget/TextView;

    .line 5300
    const v7, 0x7f0a003b

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->dialog_noticemessage_tvok:Landroid/widget/TextView;

    .line 5301
    new-instance v7, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;

    invoke-direct {v7, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeAdapter:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;

    .line 5302
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->dialog_noticemessage_listview:Landroid/widget/ListView;

    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeAdapter:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;

    invoke-virtual {v7, v8}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 5303
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->dialog_noticemessage_tvok:Landroid/widget/TextView;

    new-instance v8, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$28;

    invoke-direct {v8, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$28;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 5314
    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 5315
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    iput-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeDialog:Landroid/app/AlertDialog;

    .line 5318
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v6    # "view":Landroid/view/View;
    :cond_2
    iget v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeNum:I

    if-lez v7, :cond_0

    .line 5322
    const-string/jumbo v7, "noticemessage"

    const/4 v8, 0x0

    invoke-virtual {p0, v7, v8}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 5323
    .local v1, "callSp":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "noticetime"

    const-wide/16 v8, 0x0

    invoke-interface {v1, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 5324
    .local v4, "time":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 5325
    .local v2, "current":J
    sub-long v8, v2, v4

    const-wide/32 v10, 0x36ee80

    cmp-long v7, v8, v10

    if-ltz v7, :cond_0

    .line 5329
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string/jumbo v8, "noticetime"

    invoke-interface {v7, v8, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 5330
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->dialog_noticemessage_listview:Landroid/widget/ListView;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeMessages:Ljava/util/List;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeAdapter:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;

    if-eqz v7, :cond_3

    .line 5332
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeAdapter:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;

    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeMessages:Ljava/util/List;

    invoke-virtual {v7, v8}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->setDatas(Ljava/util/List;)V

    .line 5334
    :cond_3
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->dialog_noticemessage_tvnotice:Landroid/widget/TextView;

    if-eqz v7, :cond_4

    .line 5336
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->dialog_noticemessage_tvnotice:Landroid/widget/TextView;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "\u672a\u67e5\u770b\u4f5c\u4e1a\uff1a"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeNum:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\u4efd"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5338
    :cond_4
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0
.end method

.method private showNoticeDialog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 4152
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 4153
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 4154
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 4156
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 4157
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 4159
    :cond_1
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08022e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$25;

    invoke-direct {v3, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$25;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 4167
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 4168
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 4169
    return-void
.end method

.method private showPackageMain()V
    .locals 4

    .prologue
    .line 1187
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.MAIN"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1188
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "android.intent.category.HOME"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 1189
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1190
    .local v2, "manager":Landroid/content/pm/PackageManager;
    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    .line 1191
    .local v0, "info":Landroid/content/pm/ResolveInfo;
    return-void
.end method

.method private startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "pkg"    # Ljava/lang/String;

    .prologue
    .line 4119
    const/4 v0, 0x1

    .line 4120
    .local v0, "canStart":Z
    invoke-direct {p0, p2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isApkUpdating(Ljava/lang/String;)Z

    move-result v0

    .line 4121
    if-eqz v0, :cond_0

    .line 4122
    invoke-virtual {p0, p1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    .line 4126
    :goto_0
    return-void

    .line 4124
    :cond_0
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08022c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08022d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showNoticeDialog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private startWifiActivity()V
    .locals 9

    .prologue
    const/high16 v8, 0x10000000

    .line 2243
    sget-object v6, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v7, "YOGATablet2-1050LC"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    sget-object v6, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v7, "YiJiao"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2246
    const-string/jumbo v5, "zte.com.wilink"

    .line 2247
    .local v5, "pkgWifi":Ljava/lang/String;
    const-string/jumbo v0, "zte.com.wilink.wifi.WifiSettingActivity"

    .line 2249
    .local v0, "clsWifi":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 2250
    const/4 v7, 0x0

    .line 2249
    invoke-virtual {v6, v5, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 2258
    .local v4, "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 2259
    const/4 v7, 0x0

    .line 2258
    invoke-virtual {v6, v5, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5

    move-result-object v4

    .line 2270
    :goto_1
    if-eqz v4, :cond_0

    .line 2271
    const-string/jumbo v6, "qwe"

    const-string/jumbo v7, "packageInfo != null"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2272
    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, v5, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2273
    .local v1, "componet":Landroid/content/ComponentName;
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 2274
    .local v3, "intent":Landroid/content/Intent;
    invoke-virtual {v3, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 2275
    invoke-virtual {v3, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2276
    const-string/jumbo v6, "android.intent.action.MAIN"

    invoke-virtual {v3, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2277
    const-string/jumbo v6, "android.intent.category.LAUNCHER"

    invoke-virtual {v3, v6}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 2278
    invoke-direct {p0, v3, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    .line 2318
    .end local v1    # "componet":Landroid/content/ComponentName;
    .end local v3    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_2
    return-void

    .line 2251
    .end local v4    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v2

    .line 2252
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v4, 0x0

    .line 2253
    .restart local v4    # "packageInfo":Landroid/content/pm/PackageInfo;
    const-string/jumbo v5, "com.edutech.wificonn"

    .line 2254
    const-string/jumbo v0, "com.edutech.wificonn.WifiConnActivity"

    .line 2255
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 2260
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v2

    .line 2261
    .restart local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v4, 0x0

    .line 2262
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 2283
    .end local v0    # "clsWifi":Ljava/lang/String;
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v4    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v5    # "pkgWifi":Ljava/lang/String;
    :cond_1
    const-string/jumbo v5, "com.edutech.wificonn"

    .line 2284
    .restart local v5    # "pkgWifi":Ljava/lang/String;
    const-string/jumbo v0, "com.edutech.wificonn.WifiConnActivity"

    .line 2286
    .restart local v0    # "clsWifi":Ljava/lang/String;
    :try_start_2
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 2287
    const/4 v7, 0x0

    .line 2286
    invoke-virtual {v6, v5, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v4

    .line 2295
    .restart local v4    # "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_3
    :try_start_3
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 2296
    const/4 v7, 0x0

    .line 2295
    invoke-virtual {v6, v5, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    move-result-object v4

    .line 2307
    :goto_4
    if-eqz v4, :cond_0

    .line 2308
    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, v5, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2309
    .restart local v1    # "componet":Landroid/content/ComponentName;
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 2310
    .restart local v3    # "intent":Landroid/content/Intent;
    invoke-virtual {v3, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 2311
    invoke-virtual {v3, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2312
    const-string/jumbo v6, "android.intent.action.MAIN"

    invoke-virtual {v3, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2313
    const-string/jumbo v6, "android.intent.category.LAUNCHER"

    invoke-virtual {v3, v6}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 2314
    invoke-direct {p0, v3, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_2

    .line 2288
    .end local v1    # "componet":Landroid/content/ComponentName;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_2
    move-exception v2

    .line 2289
    .restart local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v4, 0x0

    .line 2290
    .restart local v4    # "packageInfo":Landroid/content/pm/PackageInfo;
    const-string/jumbo v5, "zte.com.wilink"

    .line 2291
    const-string/jumbo v0, "zte.com.wilink.wifi.WifiSettingActivity"

    .line 2292
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_3

    .line 2297
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_3
    move-exception v2

    .line 2298
    .restart local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v4, 0x0

    .line 2299
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_4

    .line 2300
    .end local v2    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_4
    move-exception v6

    goto :goto_4

    .line 2263
    :catch_5
    move-exception v6

    goto/16 :goto_1
.end method

.method private uploadLogs()V
    .locals 10

    .prologue
    .line 1696
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->LOG_PATH:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1697
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1758
    :cond_0
    :goto_0
    return-void

    .line 1701
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    .line 1702
    .local v4, "lastModified":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1703
    .local v0, "currentMill":J
    sub-long v6, v0, v4

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    const-wide/32 v8, 0x36ee80

    cmp-long v3, v6, v8

    if-lez v3, :cond_0

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    const-string/jumbo v6, ""

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1705
    new-instance v3, Ljava/lang/Thread;

    new-instance v6, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;

    invoke-direct {v6, p0, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/io/File;)V

    invoke-direct {v3, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1756
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method


# virtual methods
.method public SamSungInCharge()V
    .locals 12

    .prologue
    .line 2115
    :try_start_0
    iget-boolean v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->LicenseOK:Z
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    if-nez v9, :cond_2

    .line 2118
    :try_start_1
    invoke-static {p0}, Landroid/app/enterprise/license/EnterpriseLicenseManager;->getInstance(Landroid/content/Context;)Landroid/app/enterprise/license/EnterpriseLicenseManager;

    move-result-object v3

    .line 2119
    .local v3, "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isWifiConn()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 2120
    const-string/jumbo v9, "064F7FE4BE6AEC1360CF63E2E5A0B6B37E233ED563C6C1FB92E27920821DB97B2A7228F88CC76E0C53B4308201453B96888B37289AAAB829777702FEEE1E0028"

    invoke-virtual {v3, v9}, Landroid/app/enterprise/license/EnterpriseLicenseManager;->activateLicense(Ljava/lang/String;)V

    .line 2214
    .end local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    :cond_0
    :goto_0
    return-void

    .line 2123
    .restart local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    :cond_1
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startWifiActivity()V
    :try_end_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    goto :goto_0

    .line 2125
    .end local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    :catch_0
    move-exception v9

    goto :goto_0

    .line 2129
    :cond_2
    :try_start_2
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mDPM:Landroid/app/admin/DevicePolicyManager;

    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mDeviceAdmin:Landroid/content/ComponentName;

    invoke-virtual {v9, v10}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z
    :try_end_2
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    move-result v9

    if-eqz v9, :cond_0

    .line 2131
    :try_start_3
    invoke-static {p0}, Landroid/app/enterprise/multiuser/MultiUserManager;->getInstance(Landroid/content/Context;)Landroid/app/enterprise/multiuser/MultiUserManager;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/enterprise/multiuser/MultiUserManager;->isUserCreationAllowed()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 2132
    invoke-static {p0}, Landroid/app/enterprise/multiuser/MultiUserManager;->getInstance(Landroid/content/Context;)Landroid/app/enterprise/multiuser/MultiUserManager;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/app/enterprise/multiuser/MultiUserManager;->allowUserCreation(Z)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_b
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_3 .. :try_end_3} :catch_2

    .line 2138
    :cond_3
    :goto_1
    :try_start_4
    invoke-static {p0}, Landroid/app/enterprise/multiuser/MultiUserManager;->getInstance(Landroid/content/Context;)Landroid/app/enterprise/multiuser/MultiUserManager;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/enterprise/multiuser/MultiUserManager;->multipleUsersAllowed()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 2139
    invoke-static {p0}, Landroid/app/enterprise/multiuser/MultiUserManager;->getInstance(Landroid/content/Context;)Landroid/app/enterprise/multiuser/MultiUserManager;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/app/enterprise/multiuser/MultiUserManager;->allowMultipleUsers(Z)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_a
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_4 .. :try_end_4} :catch_2

    .line 2145
    :cond_4
    :goto_2
    :try_start_5
    invoke-static {p0}, Landroid/app/enterprise/kioskmode/KioskMode;->getInstance(Landroid/content/Context;)Landroid/app/enterprise/kioskmode/KioskMode;

    move-result-object v4

    .line 2146
    .local v4, "kioskMode":Landroid/app/enterprise/kioskmode/KioskMode;
    const/4 v9, 0x1

    invoke-virtual {v4, v9}, Landroid/app/enterprise/kioskmode/KioskMode;->allowMultiWindowMode(Z)Z

    .line 2147
    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Landroid/app/enterprise/kioskmode/KioskMode;->allowMultiWindowMode(Z)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_9
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_5 .. :try_end_5} :catch_2

    .line 2151
    .end local v4    # "kioskMode":Landroid/app/enterprise/kioskmode/KioskMode;
    :goto_3
    :try_start_6
    const-string/jumbo v9, "enterprise_policy"

    invoke-virtual {p0, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/enterprise/EnterpriseDeviceManager;

    .line 2152
    .local v2, "edm":Landroid/app/enterprise/EnterpriseDeviceManager;
    invoke-virtual {v2}, Landroid/app/enterprise/EnterpriseDeviceManager;->getRestrictionPolicy()Landroid/app/enterprise/RestrictionPolicy;
    :try_end_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    move-result-object v7

    .line 2154
    .local v7, "restrictionPolicy":Landroid/app/enterprise/RestrictionPolicy;
    const/4 v9, 0x0

    :try_start_7
    invoke-virtual {v7, v9}, Landroid/app/enterprise/RestrictionPolicy;->allowStatusBarExpansion(Z)Z
    :try_end_7
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4

    .line 2164
    :goto_4
    const/4 v9, 0x0

    :try_start_8
    invoke-virtual {v7, v9}, Landroid/app/enterprise/RestrictionPolicy;->allowBluetooth(Z)Z

    move-result v8

    .line 2165
    .local v8, "result":Z
    if-eqz v8, :cond_5

    .line 2166
    const-string/jumbo v9, "CloudClientActivity"

    const-string/jumbo v10, "Bluetooth is disabled and cannot be enabled by user "

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catch Ljava/lang/SecurityException; {:try_start_8 .. :try_end_8} :catch_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    .line 2172
    .end local v8    # "result":Z
    :cond_5
    :goto_5
    const/4 v9, 0x0

    :try_start_9
    invoke-virtual {v7, v9}, Landroid/app/enterprise/RestrictionPolicy;->setUsbMediaPlayerAvailability(Z)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 2173
    const-string/jumbo v9, "mainactivity"

    const-string/jumbo v10, "set MTP disallow true"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_9} :catch_7
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4

    .line 2190
    :goto_6
    :try_start_a
    const-string/jumbo v9, "enterprise_policy"

    invoke-virtual {p0, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 2189
    check-cast v6, Landroid/app/enterprise/EnterpriseDeviceManager;

    .line 2191
    .local v6, "mEDM":Landroid/app/enterprise/EnterpriseDeviceManager;
    invoke-virtual {v6}, Landroid/app/enterprise/EnterpriseDeviceManager;->getDateTimePolicy()Landroid/app/enterprise/DateTimePolicy;
    :try_end_a
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    move-result-object v5

    .line 2192
    .local v5, "mDateTimePolicy":Landroid/app/enterprise/DateTimePolicy;
    const/4 v0, 0x1

    .line 2194
    .local v0, "automaticTime":Z
    :try_start_b
    invoke-virtual {v5, v0}, Landroid/app/enterprise/DateTimePolicy;->setAutomaticTime(Z)Z
    :try_end_b
    .catch Ljava/lang/SecurityException; {:try_start_b .. :try_end_b} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_b .. :try_end_b} :catch_2
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    goto/16 :goto_0

    .line 2195
    :catch_1
    move-exception v1

    .line 2196
    .local v1, "e":Ljava/lang/SecurityException;
    :try_start_c
    const-string/jumbo v9, "CloudClientActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "SecurityException: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_c .. :try_end_c} :catch_2
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4

    goto/16 :goto_0

    .line 2199
    .end local v0    # "automaticTime":Z
    .end local v1    # "e":Ljava/lang/SecurityException;
    .end local v2    # "edm":Landroid/app/enterprise/EnterpriseDeviceManager;
    .end local v5    # "mDateTimePolicy":Landroid/app/enterprise/DateTimePolicy;
    .end local v6    # "mEDM":Landroid/app/enterprise/EnterpriseDeviceManager;
    .end local v7    # "restrictionPolicy":Landroid/app/enterprise/RestrictionPolicy;
    :catch_2
    move-exception v1

    .line 2200
    .local v1, "e":Ljava/lang/NoClassDefFoundError;
    invoke-virtual {v1}, Ljava/lang/NoClassDefFoundError;->printStackTrace()V

    goto/16 :goto_0

    .line 2159
    .end local v1    # "e":Ljava/lang/NoClassDefFoundError;
    .restart local v2    # "edm":Landroid/app/enterprise/EnterpriseDeviceManager;
    .restart local v7    # "restrictionPolicy":Landroid/app/enterprise/RestrictionPolicy;
    :catch_3
    move-exception v1

    .line 2160
    .local v1, "e":Ljava/lang/SecurityException;
    :try_start_d
    const-string/jumbo v9, "CloudClientActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "SecurityException: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_d .. :try_end_d} :catch_2
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4

    goto :goto_4

    .line 2201
    .end local v1    # "e":Ljava/lang/SecurityException;
    .end local v2    # "edm":Landroid/app/enterprise/EnterpriseDeviceManager;
    .end local v7    # "restrictionPolicy":Landroid/app/enterprise/RestrictionPolicy;
    :catch_4
    move-exception v1

    .line 2202
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2205
    :try_start_e
    invoke-static {p0}, Landroid/app/enterprise/license/EnterpriseLicenseManager;->getInstance(Landroid/content/Context;)Landroid/app/enterprise/license/EnterpriseLicenseManager;

    move-result-object v3

    .line 2206
    .restart local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isWifiConn()Z

    move-result v9

    if-eqz v9, :cond_8

    .line 2207
    const-string/jumbo v9, "064F7FE4BE6AEC1360CF63E2E5A0B6B37E233ED563C6C1FB92E27920821DB97B2A7228F88CC76E0C53B4308201453B96888B37289AAAB829777702FEEE1E0028"

    invoke-virtual {v3, v9}, Landroid/app/enterprise/license/EnterpriseLicenseManager;->activateLicense(Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_e .. :try_end_e} :catch_5

    goto/16 :goto_0

    .line 2211
    .end local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    :catch_5
    move-exception v9

    goto/16 :goto_0

    .line 2168
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "edm":Landroid/app/enterprise/EnterpriseDeviceManager;
    .restart local v7    # "restrictionPolicy":Landroid/app/enterprise/RestrictionPolicy;
    :catch_6
    move-exception v1

    .line 2169
    .local v1, "e":Ljava/lang/SecurityException;
    :try_start_f
    const-string/jumbo v9, "CloudClientActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "SecurityException: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_f .. :try_end_f} :catch_2
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_4

    goto/16 :goto_5

    .line 2175
    .end local v1    # "e":Ljava/lang/SecurityException;
    :cond_6
    :try_start_10
    const-string/jumbo v9, "mainactivity"

    const-string/jumbo v10, "set MTP disallow false"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_10} :catch_7
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_10 .. :try_end_10} :catch_2
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_4

    goto/16 :goto_6

    .line 2177
    :catch_7
    move-exception v1

    .line 2178
    .restart local v1    # "e":Ljava/lang/SecurityException;
    :try_start_11
    const-string/jumbo v9, "mainactivity"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "SecurityException: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_11
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_11 .. :try_end_11} :catch_2
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_4

    .line 2180
    :try_start_12
    invoke-static {p0}, Landroid/app/enterprise/license/EnterpriseLicenseManager;->getInstance(Landroid/content/Context;)Landroid/app/enterprise/license/EnterpriseLicenseManager;

    move-result-object v3

    .line 2181
    .restart local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isWifiConn()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 2182
    const-string/jumbo v9, "064F7FE4BE6AEC1360CF63E2E5A0B6B37E233ED563C6C1FB92E27920821DB97B2A7228F88CC76E0C53B4308201453B96888B37289AAAB829777702FEEE1E0028"

    invoke-virtual {v3, v9}, Landroid/app/enterprise/license/EnterpriseLicenseManager;->activateLicense(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 2186
    .end local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    :catch_8
    move-exception v9

    goto/16 :goto_6

    .line 2184
    .restart local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    :cond_7
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startWifiActivity()V
    :try_end_12
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_12 .. :try_end_12} :catch_8
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_4

    goto/16 :goto_6

    .line 2209
    .end local v2    # "edm":Landroid/app/enterprise/EnterpriseDeviceManager;
    .end local v7    # "restrictionPolicy":Landroid/app/enterprise/RestrictionPolicy;
    .local v1, "e":Ljava/lang/Exception;
    :cond_8
    :try_start_13
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startWifiActivity()V
    :try_end_13
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_13 .. :try_end_13} :catch_5

    goto/16 :goto_0

    .line 2148
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "elmMgr":Landroid/app/enterprise/license/EnterpriseLicenseManager;
    :catch_9
    move-exception v9

    goto/16 :goto_3

    .line 2141
    :catch_a
    move-exception v9

    goto/16 :goto_2

    .line 2134
    :catch_b
    move-exception v9

    goto/16 :goto_1
.end method

.method public apkUpdate()V
    .locals 2

    .prologue
    .line 778
    iget-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->hasUpdated:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isGetApks:Z

    if-eqz v0, :cond_1

    .line 793
    :cond_0
    :goto_0
    return-void

    .line 781
    :cond_1
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->updateThread:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;

    if-nez v0, :cond_3

    .line 782
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    .line 784
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->tv_updatemsg:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 786
    :cond_2
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->updateThread:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;

    .line 787
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->updateThread:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;

    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->start()V

    goto :goto_0

    .line 790
    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->updateThread:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;

    goto :goto_0
.end method

.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 4
    .param p1, "newBase"    # Landroid/content/Context;

    .prologue
    .line 1260
    :try_start_0
    const-string/jumbo v2, "language"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1261
    .local v0, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "language"

    const-string/jumbo v3, "chinese"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1262
    .local v1, "type":Ljava/lang/String;
    invoke-static {p1, v1}, Lcom/edutech/mobilestudyclient/LanguageUtils;->attachBaseContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v2

    invoke-super {p0, v2}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->attachBaseContext(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1266
    .end local v0    # "sp":Landroid/content/SharedPreferences;
    .end local v1    # "type":Ljava/lang/String;
    :goto_0
    return-void

    .line 1263
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public getDataFromAssets(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 4791
    const/4 v0, 0x0

    .line 4792
    .local v0, "br":Ljava/io/BufferedReader;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 4794
    .local v4, "sb":Ljava/lang/StringBuffer;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    invoke-virtual {v6, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4796
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 4803
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    move-object v0, v1

    .line 4808
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_1
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 4797
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :cond_0
    :try_start_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 4799
    .end local v3    # "line":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v0, v1

    .line 4800
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .local v2, "e":Ljava/io/IOException;
    :goto_2
    :try_start_4
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 4803
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 4804
    :catch_1
    move-exception v2

    .line 4805
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 4801
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 4803
    :goto_3
    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 4807
    :goto_4
    throw v5

    .line 4804
    :catch_2
    move-exception v2

    .line 4805
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 4804
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    :catch_3
    move-exception v2

    .line 4805
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_1

    .line 4801
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "line":Ljava/lang/String;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_3

    .line 4799
    :catch_4
    move-exception v2

    goto :goto_2
.end method

.method public getWIFISSID(Landroid/app/Activity;)Ljava/lang/String;
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 4856
    const-string/jumbo v2, "unknown ssid"

    .line 4857
    .local v2, "ssid":Ljava/lang/String;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1a

    if-lt v5, v6, :cond_1

    .line 4860
    const-string/jumbo v5, "connectivity"

    invoke-virtual {p0, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 4859
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 4861
    .local v0, "ctm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 4862
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v2

    .line 4863
    if-nez v2, :cond_0

    .line 4866
    const-string/jumbo v5, "wifi"

    invoke-virtual {p0, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 4867
    .local v4, "wifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    .line 4868
    .local v3, "wifiInfo":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v2

    .line 4869
    if-nez v2, :cond_0

    .line 4870
    const-string/jumbo v2, "unknown ssid"

    .line 4878
    .end local v0    # "ctm":Landroid/net/ConnectivityManager;
    .end local v1    # "networkInfo":Landroid/net/NetworkInfo;
    .end local v3    # "wifiInfo":Landroid/net/wifi/WifiInfo;
    .end local v4    # "wifiManager":Landroid/net/wifi/WifiManager;
    :cond_0
    :goto_0
    return-object v2

    .line 4874
    :cond_1
    const-string/jumbo v5, "wifi"

    invoke-virtual {p0, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 4875
    .restart local v4    # "wifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    .line 4876
    .restart local v3    # "wifiInfo":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public isWifiConn()Z
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2221
    const-string/jumbo v4, "wifi"

    invoke-virtual {p0, v4}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 2222
    .local v0, "wifiManager":Landroid/net/wifi/WifiManager;
    if-nez v0, :cond_1

    .line 2226
    :cond_0
    :goto_0
    return v2

    .line 2225
    :cond_1
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v1

    .line 2226
    .local v1, "wifiState":I
    if-eq v1, v3, :cond_0

    move v2, v3

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 62
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 3450
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0162

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0164

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    .line 3451
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0166

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0169

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    .line 3452
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a016b

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a016d

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    .line 3453
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a016f

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0171

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    .line 3454
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0173

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0175

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    .line 3455
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0177

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0179

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a01a0

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    .line 3456
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a017f

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0180

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a018d

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0181

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    .line 3457
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0182

    move/from16 v0, v57

    move/from16 v1, v58

    if-eq v0, v1, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v57

    const v58, 0x7f0a0183

    move/from16 v0, v57

    move/from16 v1, v58

    if-ne v0, v1, :cond_2

    .line 3459
    :cond_0
    sget-boolean v57, Lcom/mobilestudyclient/application/My_Application;->Allow_Flag:Z

    if-nez v57, :cond_2

    .line 3460
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->imageViewSetting:Landroid/widget/TextView;

    move-object/from16 v57, v0

    invoke-virtual/range {v57 .. v57}, Landroid/widget/TextView;->performClick()Z

    .line 4111
    :cond_1
    :goto_0
    return-void

    .line 3465
    :cond_2
    const-string/jumbo v57, "RIO"

    new-instance v58, Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v59

    invoke-static/range {v59 .. v59}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v59

    invoke-direct/range {v58 .. v59}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v58 .. v58}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v58

    invoke-static/range {v57 .. v58}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3466
    const-string/jumbo v45, ""

    .line 3467
    .local v45, "pkg":Ljava/lang/String;
    const-string/jumbo v6, ""

    .line 3468
    .local v6, "cls":Ljava/lang/String;
    const/16 v51, 0x0

    .line 3469
    .local v51, "resolveInfo":Landroid/content/pm/ResolveInfo;
    const-string/jumbo v57, "language"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v53

    .line 3470
    .local v53, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v57, "language"

    const-string/jumbo v58, "chinese"

    move-object/from16 v0, v53

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v55

    .line 3471
    .local v55, "type":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v16

    .line 3472
    .local v16, "id":I
    packed-switch v16, :pswitch_data_0

    .line 4102
    :cond_3
    :goto_1
    :pswitch_0
    invoke-virtual/range {v45 .. v45}, Ljava/lang/String;->length()I

    move-result v57

    if-lez v57, :cond_1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v57

    if-lez v57, :cond_1

    .line 4103
    new-instance v12, Landroid/content/ComponentName;

    move-object/from16 v0, v45

    invoke-direct {v12, v0, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4104
    .local v12, "componet":Landroid/content/ComponentName;
    new-instance v18, Landroid/content/Intent;

    invoke-direct/range {v18 .. v18}, Landroid/content/Intent;-><init>()V

    .line 4105
    .local v18, "intent":Landroid/content/Intent;
    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4106
    const/high16 v57, 0x10000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 4107
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v18

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4108
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v18

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 4109
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v45

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 3486
    .end local v12    # "componet":Landroid/content/ComponentName;
    .end local v18    # "intent":Landroid/content/Intent;
    :pswitch_1
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v57, :cond_4

    .line 3488
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v48

    .line 3489
    .local v48, "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v57, "com.lejent.zuoyeshenqi.afanti"

    move-object/from16 v0, v48

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v18

    .line 3490
    .restart local v18    # "intent":Landroid/content/Intent;
    const/high16 v57, 0x14000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3491
    if-eqz v18, :cond_3

    .line 3492
    const-string/jumbo v57, "com.lejent.zuoyeshenqi.afanti"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_1

    .line 3494
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v48    # "pm":Landroid/content/pm/PackageManager;
    :cond_4
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v57, :cond_5

    .line 3499
    const-string/jumbo v43, "com.akson.launch.eplauncher"

    .line 3500
    .local v43, "packageSDYB":Ljava/lang/String;
    const-string/jumbo v33, "com.akson.launch.eplauncher.SplashActivity"

    .line 3502
    .local v33, "packageClassSDYB":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3503
    const/16 v58, 0x0

    .line 3502
    move-object/from16 v0, v57

    move-object/from16 v1, v43

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3504
    .local v44, "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3505
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v43

    move-object/from16 v1, v33

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3507
    .local v11, "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3508
    .local v21, "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3509
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3510
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3511
    const/high16 v57, 0x14000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3512
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_12

    goto/16 :goto_1

    .line 3514
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v14

    .line 3516
    .local v14, "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_1

    .line 3522
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v33    # "packageClassSDYB":Ljava/lang/String;
    .end local v43    # "packageSDYB":Ljava/lang/String;
    :cond_5
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ONE_IMG:Z

    if-eqz v57, :cond_6

    .line 3524
    const-string/jumbo v27, "com.edutech.guidance"

    .line 3525
    .local v27, "packageBookdx":Ljava/lang/String;
    const-string/jumbo v35, "com.edutech.guidance.MainActivity"

    .line 3527
    .local v35, "packageClassdx":Ljava/lang/String;
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3528
    const/16 v58, 0x0

    .line 3527
    move-object/from16 v0, v57

    move-object/from16 v1, v27

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3529
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3530
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v27

    move-object/from16 v1, v35

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3532
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3533
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3534
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3535
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3536
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3537
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 3539
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_1
    move-exception v14

    .line 3541
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3542
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3546
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v27    # "packageBookdx":Ljava/lang/String;
    .end local v35    # "packageClassdx":Ljava/lang/String;
    :cond_6
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3551
    :pswitch_2
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v57, :cond_7

    .line 3554
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v48

    .line 3555
    .restart local v48    # "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v57, "com.A17zuoye.mobile.homework"

    move-object/from16 v0, v48

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v18

    .line 3556
    .restart local v18    # "intent":Landroid/content/Intent;
    const/high16 v57, 0x14000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3557
    if-eqz v18, :cond_3

    .line 3558
    const-string/jumbo v57, "com.A17zuoye.mobile.homework"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3560
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v48    # "pm":Landroid/content/pm/PackageManager;
    :cond_7
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v57, :cond_8

    .line 3562
    const-string/jumbo v43, "com.akson.timeep"

    .line 3563
    .restart local v43    # "packageSDYB":Ljava/lang/String;
    const-string/jumbo v33, "com.akson.timeep.SplashActivity"

    .line 3565
    .restart local v33    # "packageClassSDYB":Ljava/lang/String;
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3566
    const/16 v58, 0x0

    .line 3565
    move-object/from16 v0, v57

    move-object/from16 v1, v43

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3567
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3568
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v43

    move-object/from16 v1, v33

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3570
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3571
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3572
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3573
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3574
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3575
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_11

    goto/16 :goto_1

    .line 3577
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_2
    move-exception v14

    .line 3579
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_1

    .line 3585
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v33    # "packageClassSDYB":Ljava/lang/String;
    .end local v43    # "packageSDYB":Ljava/lang/String;
    :cond_8
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TWO_IMG:Z

    if-eqz v57, :cond_9

    .line 3587
    const-string/jumbo v25, "com.edutech.zuoyefudao3"

    .line 3588
    .local v25, "packageBook":Ljava/lang/String;
    const-string/jumbo v29, "com.edutech.zuoyefudao.activity.CloudClientActivity"

    .line 3590
    .local v29, "packageClass":Ljava/lang/String;
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3591
    const/16 v58, 0x0

    .line 3590
    move-object/from16 v0, v57

    move-object/from16 v1, v25

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3592
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3593
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v25

    move-object/from16 v1, v29

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3595
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3596
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3597
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3598
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3599
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3600
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    goto/16 :goto_1

    .line 3602
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_3
    move-exception v14

    .line 3604
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3605
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3606
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_4
    move-exception v13

    .line 3608
    .local v13, "e":Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 3612
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v25    # "packageBook":Ljava/lang/String;
    .end local v29    # "packageClass":Ljava/lang/String;
    :cond_9
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3617
    :pswitch_3
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->THREE_IMG:Z

    if-eqz v57, :cond_a

    .line 3619
    const-string/jumbo v57, "notice"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v54

    .line 3620
    .local v54, "sp2":Landroid/content/SharedPreferences;
    invoke-interface/range {v54 .. v54}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v57

    const-string/jumbo v58, "lasttime"

    const-wide/16 v60, 0x0

    move-object/from16 v0, v57

    move-object/from16 v1, v58

    move-wide/from16 v2, v60

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v57

    invoke-interface/range {v57 .. v57}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 3621
    const-string/jumbo v28, "com.edutech.mywork"

    .line 3622
    .local v28, "packageBookzy":Ljava/lang/String;
    const-string/jumbo v36, "com.edutech.mywork.MainActivity"

    .line 3624
    .local v36, "packageClasszy":Ljava/lang/String;
    :try_start_4
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3625
    const/16 v58, 0x0

    .line 3624
    move-object/from16 v0, v57

    move-object/from16 v1, v28

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3626
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3627
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v28

    move-object/from16 v1, v36

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3629
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3630
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3631
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3632
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3633
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3634
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_5

    goto/16 :goto_1

    .line 3636
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_5
    move-exception v14

    .line 3638
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3639
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3643
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v28    # "packageBookzy":Ljava/lang/String;
    .end local v36    # "packageClasszy":Ljava/lang/String;
    .end local v54    # "sp2":Landroid/content/SharedPreferences;
    :cond_a
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3648
    :pswitch_4
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v57, :cond_b

    .line 3650
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v48

    .line 3651
    .restart local v48    # "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v57, "com.jinxin.namibox"

    move-object/from16 v0, v48

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v18

    .line 3652
    .restart local v18    # "intent":Landroid/content/Intent;
    const/high16 v57, 0x14000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3653
    if-eqz v18, :cond_3

    .line 3654
    const-string/jumbo v57, "com.jinxin.namibox"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3656
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v48    # "pm":Landroid/content/pm/PackageManager;
    :cond_b
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->FOUR_IMG:Z

    if-eqz v57, :cond_c

    .line 3658
    const-string/jumbo v26, "com.edutech.wrongcollection"

    .line 3659
    .local v26, "packageBookctj":Ljava/lang/String;
    const-string/jumbo v34, "com.edutech.wrongcollection.MainActivity"

    .line 3661
    .local v34, "packageClassctj":Ljava/lang/String;
    :try_start_5
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3662
    const/16 v58, 0x0

    .line 3661
    move-object/from16 v0, v57

    move-object/from16 v1, v26

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3663
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3664
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v26

    move-object/from16 v1, v34

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3666
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3667
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3668
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3669
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3670
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3671
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_6

    goto/16 :goto_1

    .line 3673
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_6
    move-exception v14

    .line 3675
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3676
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3680
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v26    # "packageBookctj":Ljava/lang/String;
    .end local v34    # "packageClassctj":Ljava/lang/String;
    :cond_c
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3685
    :pswitch_5
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v57, :cond_d

    .line 3688
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v48

    .line 3689
    .restart local v48    # "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v57, "com.haojiazhang.activity"

    move-object/from16 v0, v48

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v18

    .line 3690
    .restart local v18    # "intent":Landroid/content/Intent;
    const/high16 v57, 0x14000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3691
    if-eqz v18, :cond_3

    .line 3692
    const-string/jumbo v57, "com.haojiazhang.activity"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3694
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v48    # "pm":Landroid/content/pm/PackageManager;
    :cond_d
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v57, :cond_e

    .line 3696
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3697
    :cond_e
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->FIVE_IMG:Z

    if-eqz v57, :cond_f

    .line 3699
    const-string/jumbo v25, "com.edutech.textbook"

    .line 3700
    .restart local v25    # "packageBook":Ljava/lang/String;
    const-string/jumbo v29, "com.edutech.multimediamaterial.activity.CloudClientActivity"

    .line 3702
    .restart local v29    # "packageClass":Ljava/lang/String;
    :try_start_6
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3703
    const/16 v58, 0x0

    .line 3702
    move-object/from16 v0, v57

    move-object/from16 v1, v25

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3704
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3705
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v25

    move-object/from16 v1, v29

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3707
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3708
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3709
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3710
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3711
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3712
    const-string/jumbo v57, "type"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    move-object/from16 v2, v55

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3713
    const-string/jumbo v57, "ip"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_ip:Ljava/lang/String;

    move-object/from16 v58, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3714
    const-string/jumbo v57, "name"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_name:Ljava/lang/String;

    move-object/from16 v58, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3715
    const-string/jumbo v57, "privatekey"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_privatekey:Ljava/lang/String;

    move-object/from16 v58, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3716
    const-string/jumbo v57, "demo"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_demo:Ljava/lang/String;

    move-object/from16 v58, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3717
    const-string/jumbo v57, "pwd"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_pwd:Ljava/lang/String;

    move-object/from16 v58, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3718
    const-string/jumbo v57, "usercode"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->send_usercode:Ljava/lang/String;

    move-object/from16 v58, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3719
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_6
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6 .. :try_end_6} :catch_7

    goto/16 :goto_1

    .line 3721
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_7
    move-exception v14

    .line 3723
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3724
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3728
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v25    # "packageBook":Ljava/lang/String;
    .end local v29    # "packageClass":Ljava/lang/String;
    :cond_f
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3734
    :pswitch_6
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->SIX_IMG:Z

    if-eqz v57, :cond_10

    .line 3736
    const-string/jumbo v24, "com.edutech.myapps"

    .line 3737
    .local v24, "packageApp":Ljava/lang/String;
    const-string/jumbo v30, "com.edutech.myapps.activity.MainActivity"

    .line 3739
    .local v30, "packageClassApp":Ljava/lang/String;
    :try_start_7
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3740
    const/16 v58, 0x0

    .line 3739
    move-object/from16 v0, v57

    move-object/from16 v1, v24

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3741
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3742
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v24

    move-object/from16 v1, v30

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3744
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3745
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3746
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3747
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3748
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3749
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_8

    goto/16 :goto_1

    .line 3751
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_8
    move-exception v14

    .line 3753
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3754
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3758
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v24    # "packageApp":Ljava/lang/String;
    .end local v30    # "packageClassApp":Ljava/lang/String;
    :cond_10
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3764
    :pswitch_7
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCJLY:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isHT:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSPYZ:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWHZ:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPDSSZ:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCH:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXF:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWJD:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWYT:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDISABLE4:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isLJLD:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isTHZX:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPDS:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXFJD:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isBS:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSMX:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXXJ:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNLEZ:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNL:Z

    if-nez v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->SEVEN_IMG:Z

    if-eqz v57, :cond_11

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v57, :cond_12

    .line 3766
    :cond_11
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3767
    :cond_12
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNJLZ:Z

    if-nez v57, :cond_13

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-eqz v57, :cond_15

    .line 3772
    :cond_13
    :try_start_8
    new-instance v17, Landroid/content/Intent;

    const-string/jumbo v57, "android.media.action.IMAGE_CAPTURE"

    move-object/from16 v0, v17

    move-object/from16 v1, v57

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3773
    .local v17, "infoIntent":Landroid/content/Intent;
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    const/16 v58, 0x0

    move-object/from16 v0, v57

    move-object/from16 v1, v17

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v50

    .line 3774
    .local v50, "res":Landroid/content/pm/ResolveInfo;
    if-eqz v50, :cond_14

    .line 3775
    const-string/jumbo v57, "CloudClientActivity"

    new-instance v58, Ljava/lang/StringBuilder;

    const-string/jumbo v59, "ACTION_IMAGE_CAPTURE--->"

    invoke-direct/range {v58 .. v59}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3776
    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v59, v0

    move-object/from16 v0, v59

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object/from16 v59, v0

    invoke-virtual/range {v58 .. v59}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v58

    .line 3775
    invoke-static/range {v57 .. v58}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3777
    const-string/jumbo v57, "CloudClientActivity"

    new-instance v58, Ljava/lang/StringBuilder;

    const-string/jumbo v59, "activityInfo.name--->"

    invoke-direct/range {v58 .. v59}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v59, v0

    move-object/from16 v0, v59

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    move-object/from16 v59, v0

    invoke-virtual/range {v58 .. v59}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v58

    invoke-static/range {v57 .. v58}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3779
    :cond_14
    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v57, v0

    move-object/from16 v0, v57

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object/from16 v42, v0

    .line 3780
    .local v42, "packageName":Ljava/lang/String;
    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v57, v0

    move-object/from16 v0, v57

    iget-object v5, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 3782
    .local v5, "classname":Ljava/lang/String;
    const-string/jumbo v57, "CloudClientActivity"

    new-instance v58, Ljava/lang/StringBuilder;

    const-string/jumbo v59, "ACTION_IMAGE_CAPTURE--->"

    invoke-direct/range {v58 .. v59}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3783
    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v59, v0

    move-object/from16 v0, v59

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object/from16 v59, v0

    invoke-virtual/range {v58 .. v59}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v58

    .line 3782
    invoke-static/range {v57 .. v58}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3784
    const-string/jumbo v57, "CloudClientActivity"

    new-instance v58, Ljava/lang/StringBuilder;

    const-string/jumbo v59, "activityInfo.name--->"

    invoke-direct/range {v58 .. v59}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v50

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v59, v0

    move-object/from16 v0, v59

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    move-object/from16 v59, v0

    invoke-virtual/range {v58 .. v59}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v58

    invoke-static/range {v57 .. v58}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3785
    new-instance v23, Landroid/content/Intent;

    invoke-direct/range {v23 .. v23}, Landroid/content/Intent;-><init>()V

    .line 3786
    .local v23, "mIntent":Landroid/content/Intent;
    new-instance v10, Landroid/content/ComponentName;

    move-object/from16 v0, v42

    invoke-direct {v10, v0, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3790
    .local v10, "comp":Landroid/content/ComponentName;
    move-object/from16 v0, v23

    invoke-virtual {v0, v10}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3791
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v23

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3792
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_9

    goto/16 :goto_1

    .line 3793
    .end local v5    # "classname":Ljava/lang/String;
    .end local v10    # "comp":Landroid/content/ComponentName;
    .end local v17    # "infoIntent":Landroid/content/Intent;
    .end local v23    # "mIntent":Landroid/content/Intent;
    .end local v42    # "packageName":Ljava/lang/String;
    .end local v50    # "res":Landroid/content/pm/ResolveInfo;
    :catch_9
    move-exception v13

    .line 3795
    .restart local v13    # "e":Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V

    .line 3796
    new-instance v20, Landroid/content/Intent;

    .line 3797
    const-string/jumbo v57, "android.media.action.IMAGE_CAPTURE"

    .line 3796
    move-object/from16 v0, v20

    move-object/from16 v1, v57

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3798
    .local v20, "intentP":Landroid/content/Intent;
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 3826
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v20    # "intentP":Landroid/content/Intent;
    :cond_15
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->openCamera()V

    goto/16 :goto_1

    .line 3833
    :pswitch_8
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXF:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCJLY:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isHT:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPDSSZ:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSPYZ:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDISABLE4:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isBS:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isTHZX:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSMX:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXXJ:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNL:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNLEZ:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYYYB:Z

    if-nez v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->EIGHT_IMG:Z

    if-eqz v57, :cond_16

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v57, :cond_17

    .line 3835
    :cond_16
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3839
    :cond_17
    const-string/jumbo v47, "com.edutech.myfiles"

    .line 3840
    .local v47, "pkg_wodewenjian":Ljava/lang/String;
    const-string/jumbo v8, "src.com.edutech.wodewenjian.activitie.GugleFileActivity"

    .line 3842
    .local v8, "cls_wodewenjian":Ljava/lang/String;
    :try_start_9
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3843
    const/16 v58, 0x0

    .line 3842
    move-object/from16 v0, v57

    move-object/from16 v1, v47

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_9
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_9 .. :try_end_9} :catch_a

    move-result-object v40

    .line 3849
    .local v40, "packageInfo_wodewenjian":Landroid/content/pm/PackageInfo;
    :goto_2
    if-eqz v40, :cond_3

    .line 3850
    new-instance v12, Landroid/content/ComponentName;

    move-object/from16 v0, v47

    invoke-direct {v12, v0, v8}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3852
    .restart local v12    # "componet":Landroid/content/ComponentName;
    new-instance v18, Landroid/content/Intent;

    invoke-direct/range {v18 .. v18}, Landroid/content/Intent;-><init>()V

    .line 3853
    .restart local v18    # "intent":Landroid/content/Intent;
    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3854
    const/high16 v57, 0x10000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3855
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v18

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3856
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v18

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3857
    const-string/jumbo v57, "language"

    move-object/from16 v0, v18

    move-object/from16 v1, v57

    move-object/from16 v2, v55

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3858
    const-string/jumbo v57, "OPEN_FILE"

    sget-object v58, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->HOMEPATH:Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3862
    :try_start_a
    sget-object v57, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    .line 3861
    invoke-static/range {v57 .. v57}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v57

    .line 3862
    invoke-virtual/range {v57 .. v57}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3863
    .local v4, "OPEN_DCIM":Ljava/lang/String;
    const-string/jumbo v57, "CloudClientActivity"

    new-instance v58, Ljava/lang/StringBuilder;

    const-string/jumbo v59, "OPEN_DCIM=="

    invoke-direct/range {v58 .. v59}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v58

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v58

    invoke-static/range {v57 .. v58}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3864
    const-string/jumbo v57, "OPEN_DCIM"

    move-object/from16 v0, v18

    move-object/from16 v1, v57

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_b

    .line 3871
    .end local v4    # "OPEN_DCIM":Ljava/lang/String;
    :goto_3
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v47

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3844
    .end local v12    # "componet":Landroid/content/ComponentName;
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v40    # "packageInfo_wodewenjian":Landroid/content/pm/PackageInfo;
    :catch_a
    move-exception v13

    .line 3845
    .local v13, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/16 v40, 0x0

    .line 3846
    .restart local v40    # "packageInfo_wodewenjian":Landroid/content/pm/PackageInfo;
    invoke-virtual {v13}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3847
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_2

    .line 3865
    .end local v13    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v12    # "componet":Landroid/content/ComponentName;
    .restart local v18    # "intent":Landroid/content/Intent;
    :catch_b
    move-exception v13

    .line 3867
    .local v13, "e":Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 3880
    .end local v8    # "cls_wodewenjian":Ljava/lang/String;
    .end local v12    # "componet":Landroid/content/ComponentName;
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v40    # "packageInfo_wodewenjian":Landroid/content/pm/PackageInfo;
    .end local v47    # "pkg_wodewenjian":Ljava/lang/String;
    :pswitch_9
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v57, :cond_18

    .line 3883
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v48

    .line 3884
    .restart local v48    # "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v57, "com.youdao.dict"

    move-object/from16 v0, v48

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v18

    .line 3885
    .restart local v18    # "intent":Landroid/content/Intent;
    const/high16 v57, 0x14000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3886
    if-eqz v18, :cond_3

    .line 3887
    const-string/jumbo v57, "com.youdao.dict"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3889
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v48    # "pm":Landroid/content/pm/PackageManager;
    :cond_18
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCJLY:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isHT:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWYT:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWJD:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCH:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXH:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXF:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWHZ:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSPYZ:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isLJNLDN:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPDSSZ:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPDS:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDISABLE4:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isLJLD:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSMX:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXXJ:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isZBYZ:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNJLZ:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNLEZ:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNL:Z

    if-nez v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->NINE_IMG:Z

    if-eqz v57, :cond_19

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v57, :cond_1a

    .line 3891
    :cond_19
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3894
    :cond_1a
    const-string/jumbo v41, "com.edutech.jxhd"

    .line 3895
    .local v41, "packageJXHD":Ljava/lang/String;
    const-string/jumbo v32, "com.edutech.jxhd.MainActivity"

    .line 3897
    .local v32, "packageClassJXHD":Ljava/lang/String;
    :try_start_b
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3898
    const/16 v58, 0x0

    .line 3897
    move-object/from16 v0, v57

    move-object/from16 v1, v41

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 3899
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 3900
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v41

    move-object/from16 v1, v32

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3902
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 3903
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3904
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3905
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3906
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 3907
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_b .. :try_end_b} :catch_c
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_d

    goto/16 :goto_1

    .line 3909
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_c
    move-exception v14

    .line 3911
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3912
    const-string/jumbo v57, "\u8bf7\u5b89\u88c5\u6307\u5b9a\u5e94\u7528\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3913
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_d
    move-exception v13

    .line 3915
    .restart local v13    # "e":Ljava/lang/Exception;
    const-string/jumbo v57, "\u8bf7\u5b89\u88c5\u6307\u5b9a\u5e94\u7528\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3922
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v32    # "packageClassJXHD":Ljava/lang/String;
    .end local v41    # "packageJXHD":Ljava/lang/String;
    :pswitch_a
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v57, :cond_1b

    .line 3925
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v48

    .line 3926
    .restart local v48    # "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v57, "org.hisand.zidian.zhs"

    move-object/from16 v0, v48

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v18

    .line 3927
    .restart local v18    # "intent":Landroid/content/Intent;
    const/high16 v57, 0x14000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3928
    if-eqz v18, :cond_3

    .line 3929
    const-string/jumbo v57, "org.hisand.zidian.zhs"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3931
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v48    # "pm":Landroid/content/pm/PackageManager;
    :cond_1b
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCJLY:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isHT:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isPDSSZ:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWYT:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isYWJD:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isCH:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXH:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXF:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSPYZ:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDISABLE4:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSMX:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXXJ:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isZBYZ:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNJLZ:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TEN_IMG:Z

    if-eqz v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-nez v57, :cond_1c

    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v57, :cond_1d

    .line 3933
    :cond_1c
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 3938
    :cond_1d
    const-string/jumbo v46, "com.edutech.hudongtaolun"

    .line 3939
    .local v46, "pkg_taolun":Ljava/lang/String;
    const-string/jumbo v7, "com.edutech.hudongtaolun.MainActivity"

    .line 3941
    .local v7, "cls_taolun":Ljava/lang/String;
    :try_start_c
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 3942
    const/16 v58, 0x0

    .line 3941
    move-object/from16 v0, v57

    move-object/from16 v1, v46

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_c
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_c .. :try_end_c} :catch_e

    move-result-object v39

    .line 3948
    .local v39, "packageInfo_taolun":Landroid/content/pm/PackageInfo;
    :goto_4
    if-eqz v39, :cond_3

    .line 3949
    new-instance v12, Landroid/content/ComponentName;

    move-object/from16 v0, v46

    invoke-direct {v12, v0, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3951
    .restart local v12    # "componet":Landroid/content/ComponentName;
    new-instance v19, Landroid/content/Intent;

    invoke-direct/range {v19 .. v19}, Landroid/content/Intent;-><init>()V

    .line 3952
    .local v19, "intent2":Landroid/content/Intent;
    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3953
    const/high16 v57, 0x10000000

    move-object/from16 v0, v19

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3954
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3955
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 3956
    const-string/jumbo v57, "privatekey"

    .line 3957
    const/16 v58, 0x0

    .line 3956
    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v52

    .line 3958
    .local v52, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v57, "key"

    const-string/jumbo v58, ""

    move-object/from16 v0, v52

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v49

    .line 3959
    .local v49, "privatekey":Ljava/lang/String;
    const-string/jumbo v57, "apihost"

    const-string/jumbo v58, ""

    move-object/from16 v0, v52

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 3960
    .local v22, "ip":Ljava/lang/String;
    const-string/jumbo v57, "name"

    const-string/jumbo v58, ""

    move-object/from16 v0, v52

    move-object/from16 v1, v57

    move-object/from16 v2, v58

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v56

    .line 3961
    .local v56, "username":Ljava/lang/String;
    if-eqz v22, :cond_1e

    const-string/jumbo v57, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v57

    if-nez v57, :cond_1e

    if-eqz v56, :cond_1e

    const-string/jumbo v57, ""

    invoke-virtual/range {v56 .. v57}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v57

    if-nez v57, :cond_1e

    if-eqz v49, :cond_1e

    const-string/jumbo v57, ""

    move-object/from16 v0, v49

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v57

    if-eqz v57, :cond_1f

    .line 3962
    :cond_1e
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v15

    .line 3963
    .local v15, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v15, :cond_1

    .line 3967
    const-string/jumbo v57, "ip"

    move-object/from16 v0, v57

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .end local v22    # "ip":Ljava/lang/String;
    check-cast v22, Ljava/lang/String;

    .line 3968
    .restart local v22    # "ip":Ljava/lang/String;
    const-string/jumbo v57, "usercode"

    move-object/from16 v0, v57

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v56

    .end local v56    # "username":Ljava/lang/String;
    check-cast v56, Ljava/lang/String;

    .line 3970
    .restart local v56    # "username":Ljava/lang/String;
    const-string/jumbo v57, "privatekey"

    move-object/from16 v0, v57

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v49

    .end local v49    # "privatekey":Ljava/lang/String;
    check-cast v49, Ljava/lang/String;

    .line 3973
    .end local v15    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v49    # "privatekey":Ljava/lang/String;
    :cond_1f
    const-string/jumbo v57, "ip"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3974
    const-string/jumbo v57, "privatekey"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    move-object/from16 v2, v49

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3975
    const-string/jumbo v57, "name"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    move-object/from16 v2, v56

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3976
    const-string/jumbo v57, "language"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    move-object/from16 v2, v55

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 3977
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v46

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 3943
    .end local v12    # "componet":Landroid/content/ComponentName;
    .end local v19    # "intent2":Landroid/content/Intent;
    .end local v22    # "ip":Ljava/lang/String;
    .end local v39    # "packageInfo_taolun":Landroid/content/pm/PackageInfo;
    .end local v49    # "privatekey":Ljava/lang/String;
    .end local v52    # "sharePre":Landroid/content/SharedPreferences;
    .end local v56    # "username":Ljava/lang/String;
    :catch_e
    move-exception v13

    .line 3944
    .local v13, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/16 v39, 0x0

    .line 3945
    .restart local v39    # "packageInfo_taolun":Landroid/content/pm/PackageInfo;
    invoke-virtual {v13}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 3946
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_4

    .line 3984
    .end local v7    # "cls_taolun":Ljava/lang/String;
    .end local v13    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v39    # "packageInfo_taolun":Landroid/content/pm/PackageInfo;
    .end local v46    # "pkg_taolun":Ljava/lang/String;
    :pswitch_b
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v57, :cond_20

    .line 3986
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v48

    .line 3987
    .restart local v48    # "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v57, "com.record.ing"

    move-object/from16 v0, v48

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v18

    .line 3988
    .restart local v18    # "intent":Landroid/content/Intent;
    const/high16 v57, 0x14000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 3989
    if-eqz v18, :cond_3

    .line 3990
    const-string/jumbo v57, "com.record.ing"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 4018
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v48    # "pm":Landroid/content/pm/PackageManager;
    :cond_20
    const v57, 0x7f080051

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 4024
    :pswitch_c
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v57, :cond_21

    .line 4027
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v48

    .line 4028
    .restart local v48    # "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v57, "com.xueersi.parentsmeeting"

    move-object/from16 v0, v48

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v18

    .line 4029
    .restart local v18    # "intent":Landroid/content/Intent;
    const/high16 v57, 0x14000000

    move-object/from16 v0, v18

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 4030
    if-eqz v18, :cond_3

    .line 4031
    const-string/jumbo v57, "com.xueersi.parentsmeeting"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 4038
    .end local v18    # "intent":Landroid/content/Intent;
    .end local v48    # "pm":Landroid/content/pm/PackageManager;
    :cond_21
    sget-boolean v57, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->TWELVE_IMG:Z

    if-eqz v57, :cond_22

    .line 4041
    new-instance v19, Landroid/content/Intent;

    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4042
    .restart local v19    # "intent2":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 4044
    const/high16 v57, 0x10000000

    move-object/from16 v0, v19

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 4049
    new-instance v9, Landroid/content/ComponentName;

    const-string/jumbo v57, "com.edutech.android.InterAction"

    .line 4050
    const-string/jumbo v58, "com.edutech.android.InterAction.LoginActivity"

    .line 4049
    move-object/from16 v0, v57

    move-object/from16 v1, v58

    invoke-direct {v9, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4051
    .local v9, "cn":Landroid/content/ComponentName;
    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4052
    const-string/jumbo v57, "language"

    move-object/from16 v0, v19

    move-object/from16 v1, v57

    move-object/from16 v2, v55

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4055
    :try_start_d
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 4056
    const-string/jumbo v58, "com.edutech.android.InterAction"

    const/16 v59, 0x0

    .line 4055
    invoke-virtual/range {v57 .. v59}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_d
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_d .. :try_end_d} :catch_f

    move-result-object v38

    .line 4062
    .local v38, "packageInfo2":Landroid/content/pm/PackageInfo;
    :goto_5
    if-eqz v38, :cond_3

    .line 4063
    const-string/jumbo v57, "com.edutech.android.InterAction"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v57

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 4057
    .end local v38    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :catch_f
    move-exception v13

    .line 4058
    .restart local v13    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/16 v38, 0x0

    .line 4059
    .restart local v38    # "packageInfo2":Landroid/content/pm/PackageInfo;
    invoke-virtual {v13}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 4060
    const-string/jumbo v57, "\u8be5\u5e94\u7528\u672a\u5b89\u88c5\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto :goto_5

    .line 4067
    .end local v9    # "cn":Landroid/content/ComponentName;
    .end local v13    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v19    # "intent2":Landroid/content/Intent;
    .end local v38    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :cond_22
    const-string/jumbo v57, "\u8be5\u529f\u80fd\u6682\u4e0d\u5f00\u653e\uff01"

    const/16 v58, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    move/from16 v2, v58

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v57

    invoke-virtual/range {v57 .. v57}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 4073
    :pswitch_d
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->openSetting()V

    goto/16 :goto_1

    .line 4077
    :pswitch_e
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startWifiActivity()V

    goto/16 :goto_1

    .line 4081
    :pswitch_f
    const-string/jumbo v37, "com.edutech.eword"

    .line 4082
    .local v37, "packageEword":Ljava/lang/String;
    const-string/jumbo v31, "com.edutech.eword.HomePageActivity"

    .line 4084
    .local v31, "packageClassEword":Ljava/lang/String;
    :try_start_e
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v57

    .line 4085
    const/16 v58, 0x0

    .line 4084
    move-object/from16 v0, v57

    move-object/from16 v1, v37

    move/from16 v2, v58

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v44

    .line 4086
    .restart local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v44, :cond_3

    .line 4087
    new-instance v11, Landroid/content/ComponentName;

    move-object/from16 v0, v37

    move-object/from16 v1, v31

    invoke-direct {v11, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4089
    .restart local v11    # "component":Landroid/content/ComponentName;
    new-instance v21, Landroid/content/Intent;

    invoke-direct/range {v21 .. v21}, Landroid/content/Intent;-><init>()V

    .line 4090
    .restart local v21    # "intent_book":Landroid/content/Intent;
    const-string/jumbo v57, "android.intent.category.LAUNCHER"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 4091
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4092
    const-string/jumbo v57, "android.intent.action.MAIN"

    move-object/from16 v0, v21

    move-object/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4093
    const/high16 v57, 0x10000000

    move-object/from16 v0, v21

    move/from16 v1, v57

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 4094
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;Ljava/lang/String;)V
    :try_end_e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_e .. :try_end_e} :catch_10

    goto/16 :goto_1

    .line 4096
    .end local v11    # "component":Landroid/content/ComponentName;
    .end local v21    # "intent_book":Landroid/content/Intent;
    .end local v44    # "pinfo":Landroid/content/pm/PackageInfo;
    :catch_10
    move-exception v14

    .line 4098
    .restart local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v14}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_1

    .line 3581
    .end local v14    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v31    # "packageClassEword":Ljava/lang/String;
    .end local v37    # "packageEword":Ljava/lang/String;
    .restart local v33    # "packageClassSDYB":Ljava/lang/String;
    .restart local v43    # "packageSDYB":Ljava/lang/String;
    :catch_11
    move-exception v57

    goto/16 :goto_1

    .line 3518
    :catch_12
    move-exception v57

    goto/16 :goto_1

    .line 3472
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a015d
        :pswitch_e
        :pswitch_d
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_8
        :pswitch_0
        :pswitch_9
        :pswitch_0
        :pswitch_a
        :pswitch_0
        :pswitch_b
        :pswitch_0
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_c
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_7
        :pswitch_8
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_e
        :pswitch_0
        :pswitch_d
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_f
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 1512
    invoke-super {p0, p1}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1513
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->onconfigureChange:Z

    .line 1515
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 311
    invoke-super {p0, p1}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    .line 312
    const-string/jumbo v1, "myAgreement"

    invoke-virtual {p0, v1, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->agreement_sp:Landroid/content/SharedPreferences;

    .line 314
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->agreement_sp:Landroid/content/SharedPreferences;

    const-string/jumbo v2, "agreement_key"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 315
    .local v0, "hasLicensed":Z
    if-nez v0, :cond_0

    .line 321
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cleanApplicationData(Landroid/content/Context;)V

    .line 322
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getLanguage()V

    .line 324
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setMainView()V

    .line 327
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->openScreenShot()V

    .line 328
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->openLockScreen()V

    .line 329
    const-string/jumbo v1, "CloudClientActivity"

    const-string/jumbo v2, "com.edu.action.LAUNCHER_STRAT"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 331
    :try_start_1
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setDefaultSetting()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_2

    .line 335
    :goto_0
    :try_start_2
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initWidget()V

    .line 336
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 337
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->lockPad()V

    .line 338
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->loadUserInfo()V

    .line 339
    new-instance v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$HostPwd;

    invoke-direct {v1, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$HostPwd;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    invoke-virtual {v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$HostPwd;->start()V

    .line 340
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showPackageMain()V

    .line 342
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->resetAutoSp()V

    .line 343
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initBroadReceiver()V

    .line 346
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->removeIllegalApks()V

    .line 348
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setDesignView()V
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 354
    :goto_1
    return-void

    .line 332
    :catch_0
    move-exception v1

    goto :goto_0

    .line 351
    :catch_1
    move-exception v1

    goto :goto_1

    .line 349
    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 1297
    invoke-super {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->onDestroy()V

    .line 1298
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->wifiReceiver:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$WifiReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1299
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->apkInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1300
    iput-boolean v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showTime:Z

    .line 1301
    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeThread:Ljava/lang/Thread;

    .line 1302
    iput-boolean v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isnotice:Z

    .line 1303
    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeThread:Ljava/lang/Thread;

    .line 1304
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 4281
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 4282
    const/4 v0, 0x1

    .line 4284
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 1270
    invoke-super {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->onPause()V

    .line 1272
    :try_start_0
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->batteryReceiver:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1273
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->InteractionReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1277
    :goto_0
    iput-boolean v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showTime:Z

    .line 1278
    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeThread:Ljava/lang/Thread;

    .line 1279
    iput-boolean v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isnotice:Z

    .line 1280
    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeThread:Ljava/lang/Thread;

    .line 1281
    iput-boolean v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->canRefresh:Z

    .line 1282
    const-string/jumbo v0, "CloudClientActivity"

    const-string/jumbo v1, "on pause:norefresh"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1283
    return-void

    .line 1274
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onResume()V
    .locals 11

    .prologue
    .line 1542
    invoke-super {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->onResume()V

    .line 1544
    const/4 v8, 0x1

    :try_start_0
    iput-boolean v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->canRefresh:Z

    .line 1545
    const-string/jumbo v8, "CloudClientActivity"

    const-string/jumbo v9, "on resume:canrefresh"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1547
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->init_public_infor()V

    .line 1548
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v8, "ENTERPASS"

    invoke-direct {v3, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1549
    .local v3, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1551
    const-string/jumbo v8, "allowcall"

    const/4 v9, 0x4

    invoke-virtual {p0, v8, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1552
    .local v1, "callSp":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string/jumbo v9, "cancall"

    const/4 v10, 0x0

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1553
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->lockPad()V

    .line 1554
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1555
    .local v0, "batteryFilter":Landroid/content/IntentFilter;
    const-string/jumbo v8, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1556
    new-instance v8, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;

    invoke-direct {v8, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    iput-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->batteryReceiver:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;

    .line 1557
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->batteryReceiver:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$BatteryReceiver;

    invoke-virtual {p0, v8, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1558
    const-string/jumbo v8, "activity"

    invoke-virtual {p0, v8}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/ActivityManager;

    iput-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mActivityManager:Landroid/app/ActivityManager;

    .line 1559
    new-instance v4, Landroid/content/IntentFilter;

    invoke-direct {v4}, Landroid/content/IntentFilter;-><init>()V

    .line 1560
    .local v4, "intentFilter":Landroid/content/IntentFilter;
    const-string/jumbo v8, "PASSWDPASS"

    invoke-virtual {v4, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1561
    const-string/jumbo v8, "android.intent.action.mdm"

    invoke-virtual {v4, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1562
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->UPDATEAPK:Ljava/lang/String;

    invoke-virtual {v4, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1563
    new-instance v5, Landroid/content/IntentFilter;

    invoke-direct {v5}, Landroid/content/IntentFilter;-><init>()V

    .line 1564
    .local v5, "intentFilter2":Landroid/content/IntentFilter;
    const-string/jumbo v8, "android.intent.action.STATUSBAR_INVISIBILITY"

    invoke-virtual {v5, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1565
    const-string/jumbo v8, "android.intent.action.STATUSBAR_VISIBILITY"

    invoke-virtual {v5, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1566
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->InteractionReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v8, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 1568
    :try_start_1
    sget-boolean v8, Lcom/mobilestudyclient/application/My_Application;->Allow_Flag:Z

    if-nez v8, :cond_0

    .line 1569
    new-instance v8, Ljava/lang/Thread;

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->checkIdThread:Ljava/lang/Runnable;

    invoke-direct {v8, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v8}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1575
    :cond_0
    :goto_0
    :try_start_2
    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "T355"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P550"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P350"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P583"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-result v8

    if-eqz v8, :cond_3

    .line 1577
    :cond_1
    :try_start_3
    const-string/jumbo v8, "license"

    const/4 v9, 0x0

    invoke-virtual {p0, v8, v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 1578
    .local v7, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v8, "licenseok"

    const/4 v9, 0x0

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    iput-boolean v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->LicenseOK:Z

    .line 1579
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mDPM:Landroid/app/admin/DevicePolicyManager;

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mDeviceAdmin:Landroid/content/ComponentName;

    invoke-virtual {v8, v9}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 1580
    new-instance v6, Landroid/content/Intent;

    const-class v8, Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;

    invoke-direct {v6, p0, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1581
    .local v6, "intent_dpm":Landroid/content/Intent;
    invoke-virtual {p0, v6}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_1

    .line 1586
    .end local v6    # "intent_dpm":Landroid/content/Intent;
    .end local v7    # "sp":Landroid/content/SharedPreferences;
    :cond_2
    :goto_1
    :try_start_4
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->SamSungInCharge()V

    .line 1588
    :cond_3
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showTime:Z

    .line 1589
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeThread:Ljava/lang/Thread;

    .line 1590
    new-instance v8, Ljava/lang/Thread;

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeRunnable:Ljava/lang/Runnable;

    invoke-direct {v8, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeThread:Ljava/lang/Thread;

    .line 1591
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeThread:Ljava/lang/Thread;

    invoke-virtual {v8}, Ljava/lang/Thread;->start()V

    .line 1592
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showFailedApkInfo()V
    :try_end_4
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 1600
    .end local v0    # "batteryFilter":Landroid/content/IntentFilter;
    .end local v1    # "callSp":Landroid/content/SharedPreferences;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "intentFilter":Landroid/content/IntentFilter;
    .end local v5    # "intentFilter2":Landroid/content/IntentFilter;
    :goto_2
    :try_start_5
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->uploadLogs()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 1603
    :goto_3
    :try_start_6
    sget-boolean v8, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSDYB:Z

    if-nez v8, :cond_4

    .line 1604
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeThread:Ljava/lang/Thread;

    .line 1605
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isnotice:Z

    .line 1606
    new-instance v8, Ljava/lang/Thread;

    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeRunnable:Ljava/lang/Runnable;

    invoke-direct {v8, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeThread:Ljava/lang/Thread;

    .line 1607
    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeThread:Ljava/lang/Thread;

    invoke-virtual {v8}, Ljava/lang/Thread;->start()V
    :try_end_6
    .catch Ljava/lang/NullPointerException; {:try_start_6 .. :try_end_6} :catch_8
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_7

    .line 1615
    :cond_4
    :goto_4
    :try_start_7
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->autoUpdateApks()V

    .line 1616
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->autoUpdateDesigns()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    .line 1621
    :goto_5
    :try_start_8
    invoke-static {p0}, Lcom/edutech/mobilestudyclient/util/DensityUtil;->isMyLauncherDefault(Landroid/content/Context;)Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    .line 1625
    :goto_6
    return-void

    .line 1571
    .restart local v0    # "batteryFilter":Landroid/content/IntentFilter;
    .restart local v1    # "callSp":Landroid/content/SharedPreferences;
    .restart local v3    # "intent":Landroid/content/Intent;
    .restart local v4    # "intentFilter":Landroid/content/IntentFilter;
    .restart local v5    # "intentFilter2":Landroid/content/IntentFilter;
    :catch_0
    move-exception v2

    .line 1573
    .local v2, "e":Ljava/lang/Exception;
    :try_start_9
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 1593
    .end local v0    # "batteryFilter":Landroid/content/IntentFilter;
    .end local v1    # "callSp":Landroid/content/SharedPreferences;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "intentFilter":Landroid/content/IntentFilter;
    .end local v5    # "intentFilter2":Landroid/content/IntentFilter;
    :catch_1
    move-exception v8

    goto :goto_2

    .line 1583
    .restart local v0    # "batteryFilter":Landroid/content/IntentFilter;
    .restart local v1    # "callSp":Landroid/content/SharedPreferences;
    .restart local v3    # "intent":Landroid/content/Intent;
    .restart local v4    # "intentFilter":Landroid/content/IntentFilter;
    .restart local v5    # "intentFilter2":Landroid/content/IntentFilter;
    :catch_2
    move-exception v2

    .line 1584
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_9
    .catch Ljava/lang/NullPointerException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    goto :goto_1

    .line 1595
    .end local v0    # "batteryFilter":Landroid/content/IntentFilter;
    .end local v1    # "callSp":Landroid/content/SharedPreferences;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "intentFilter":Landroid/content/IntentFilter;
    .end local v5    # "intentFilter2":Landroid/content/IntentFilter;
    :catch_3
    move-exception v8

    goto :goto_2

    .line 1601
    :catch_4
    move-exception v8

    goto :goto_3

    .line 1622
    :catch_5
    move-exception v8

    goto :goto_6

    .line 1617
    :catch_6
    move-exception v8

    goto :goto_5

    .line 1611
    :catch_7
    move-exception v8

    goto :goto_4

    .line 1609
    :catch_8
    move-exception v8

    goto :goto_4
.end method

.method protected onStop()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 1288
    invoke-super {p0}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->onStop()V

    .line 1289
    iput-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showTime:Z

    .line 1290
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->timeThread:Ljava/lang/Thread;

    .line 1291
    iput-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->isnotice:Z

    .line 1292
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->noticeThread:Ljava/lang/Thread;

    .line 1293
    return-void
.end method

.method public userBeiAnDialog()V
    .locals 5

    .prologue
    .line 4759
    const v3, 0x7f03004c

    const/4 v4, 0x0

    invoke-static {p0, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 4760
    .local v2, "view":Landroid/view/View;
    const v3, 0x7f0a0155

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->btnYes:Landroid/widget/Button;

    .line 4761
    const v3, 0x7f0a0153

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 4762
    .local v1, "tvUserLiceseContent":Landroid/widget/TextView;
    const v3, 0x7f0a0152

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ScrollView;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->scrollView:Landroid/widget/ScrollView;

    .line 4763
    const-string/jumbo v3, "beianlicense.txt"

    invoke-virtual {p0, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getDataFromAssets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4764
    const v3, 0x7f0a0156

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->cb:Landroid/widget/CheckBox;

    .line 4765
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 4766
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4767
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->keylistener:Landroid/content/DialogInterface$OnKeyListener;

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4768
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 4769
    .local v0, "dialog":Landroid/app/AlertDialog;
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->btnYes:Landroid/widget/Button;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 4771
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->btnYes:Landroid/widget/Button;

    new-instance v4, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$27;

    invoke-direct {v4, p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$27;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4783
    return-void
.end method

.method public userLicenseAgreementDialog()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 4733
    const v3, 0x7f03004c

    invoke-static {p0, v3, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 4734
    .local v2, "view":Landroid/view/View;
    const v3, 0x7f0a0155

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->btnYes:Landroid/widget/Button;

    .line 4735
    const v3, 0x7f0a0153

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 4736
    .local v1, "tvUserLiceseContent":Landroid/widget/TextView;
    const v3, 0x7f0a0152

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ScrollView;

    iput-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->scrollView:Landroid/widget/ScrollView;

    .line 4737
    const-string/jumbo v3, "UserLicenseAgreement.txt"

    invoke-virtual {p0, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getDataFromAssets(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4739
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 4740
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4741
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->keylistener:Landroid/content/DialogInterface$OnKeyListener;

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4742
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 4743
    .local v0, "dialog":Landroid/app/AlertDialog;
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->scrollView:Landroid/widget/ScrollView;

    new-instance v4, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;

    invoke-direct {v4, p0, v5}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$TouchListenerImpl;)V

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 4744
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->btnYes:Landroid/widget/Button;

    new-instance v4, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;

    invoke-direct {v4, p0, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4754
    return-void
.end method
