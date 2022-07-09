.class public Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.super Landroid/app/Activity;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;
.implements Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;,
        Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;,
        Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier;,
        Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyTrustManager;,
        Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$ResetThread;,
        Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;,
        Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;
    }
.end annotation


# static fields
.field private static final START_PROGRESS:I = 0x1013

.field private static final TAG:Ljava/lang/String; = "CloudClientSetActivity"

.field private static final UPDATE_INSTALLSINGLE:I = 0x1014

.field private static final UPDATE_INSTALLSTATE:I = 0x1012

.field private static final UPDATE_PROGRESS:I = 0x1011

.field private static final ZXING_SCAN:I = 0x3

.field private static idfilepath:Ljava/lang/String;

.field public static isupdating:Z

.field private static tmpfile:Ljava/io/File;


# instance fields
.field private ButtonFlag:Ljava/lang/Boolean;

.field private JXHD_Ip:Ljava/lang/String;

.field private LANGUAGEPATH:Ljava/lang/String;

.field private Name:Ljava/lang/String;

.field private Pwd:Ljava/lang/String;

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

.field private allChangeSettings:Z

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

.field public apkUpdateThread:Ljava/lang/Thread;

.field private back_btn:Landroid/widget/Button;

.field private btnAppControl:Landroid/widget/Button;

.field private btnReset:Landroid/widget/Button;

.field private btnServiceControl:Landroid/widget/Button;

.field private btnTitleBack:Landroid/widget/Button;

.field private btnUpdate:Landroid/widget/Button;

.field private btnbluetoothControl:Landroid/widget/Button;

.field private cancel_btn:Landroid/widget/Button;

.field private cn:Landroid/content/ComponentName;

.field public confirmpwd:Landroid/widget/EditText;

.field private currentCacheLength:J

.field private currentCachePosition:J

.field public downloadRun:Ljava/lang/Runnable;

.field filein:Ljava/io/FileInputStream;

.field fileos:Ljava/io/FileOutputStream;

.field private history_array:Lorg/json/JSONArray;

.field private history_nameList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public id:Landroid/widget/EditText;

.field private idAuth_btn:Landroid/widget/Button;

.field idauth:Lcom/edutech/idauthentication/MainActivity;

.field public idauth_edit:Landroid/widget/EditText;

.field private installHandler:Landroid/os/Handler;

.field private installReceiver:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;

.field private ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

.field ipListener:Landroid/view/View$OnTouchListener;

.field private ipOrigal:Ljava/lang/String;

.field ipWatcher:Landroid/text/TextWatcher;

.field private ip_edit:Landroid/widget/EditText;

.field private ips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private isResetPwd:Z

.field private isUpdate:Z

.field private isover:Z

.field keylistenerDialog:Landroid/content/DialogInterface$OnKeyListener;

.field private languageSw:Landroid/widget/LinearLayout;

.field private language_t:Landroid/widget/TextView;

.field private launcherPath:Ljava/lang/String;

.field private listpop:Landroid/widget/ListPopupWindow;

.field private mBluetooth:Landroid/bluetooth/BluetoothAdapter;

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

.field mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

.field private mToast:Landroid/widget/Toast;

.field private modifiedIP:Ljava/lang/String;

.field private modifiedName:Ljava/lang/String;

.field private myCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

.field nameListener:Landroid/view/View$OnTouchListener;

.field private nameListpop:Landroid/widget/ListPopupWindow;

.field private nameOrigal:Ljava/lang/String;

.field nameWatcher:Landroid/text/TextWatcher;

.field public newpwd:Landroid/widget/EditText;

.field private ok_btn:Landroid/widget/Button;

.field public oldpwd:Landroid/widget/EditText;

.field private password_edit:Landroid/widget/EditText;

.field private password_reset:Landroid/widget/Button;

.field private password_update:Landroid/widget/Button;

.field private progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

.field private ptfw_edit:Landroid/widget/EditText;

.field private pwdConfirmDialog:Landroid/app/AlertDialog;

.field private pwdOrigal:Ljava/lang/String;

.field pwdWatcher:Landroid/text/TextWatcher;

.field private registerDialog:Landroid/app/AlertDialog;

.field private reseting:Z

.field private resultHandler:Landroid/os/Handler;

.field runnable_GetConfig_Infor:Ljava/lang/Runnable;

.field private saveErrorInfo:Ljava/lang/String;

.field private setDemoShow:Ljava/lang/String;

.field private settingHistory:Ljava/lang/String;

.field private stu_name:Ljava/lang/String;

.field private superPwd1:Ljava/lang/String;

.field private superPwd2:Ljava/lang/String;

.field private tempfile:Ljava/io/File;

.field private threadPwd:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

.field private timeStamp:Ljava/lang/String;

.field private tvCurrVersion:Landroid/widget/TextView;

.field private tvUpdateNow:Landroid/widget/TextView;

.field private tvUpdatePass:Landroid/widget/TextView;

.field private updatePassword:Ljava/lang/String;

.field private updateThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;

.field private updateTime:I

.field private updateprogressThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;

.field public updatepwdRun:Ljava/lang/Runnable;

.field private urlfilepath:Ljava/lang/String;

.field private username_edit:Landroid/widget/EditText;

.field private versionCode:I

.field private versionCodeService:I

.field private versionName:Ljava/lang/String;

.field private versionNameService:Ljava/lang/String;

.field private webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

.field private wifi_btn:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 255
    new-instance v0, Ljava/lang/StringBuilder;

    .line 256
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 257
    const-string/jumbo v1, "/CloudClient/.System/idau.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 255
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idfilepath:Ljava/lang/String;

    .line 258
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idfilepath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tmpfile:Ljava/io/File;

    .line 282
    const/4 v0, 0x0

    sput-boolean v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    .line 306
    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 203
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 205
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Name:Ljava/lang/String;

    .line 206
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Pwd:Ljava/lang/String;

    .line 208
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    .line 209
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ptfw_edit:Landroid/widget/EditText;

    .line 210
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    .line 211
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_edit:Landroid/widget/EditText;

    .line 212
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ok_btn:Landroid/widget/Button;

    .line 213
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->cancel_btn:Landroid/widget/Button;

    .line 214
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->wifi_btn:Landroid/widget/Button;

    .line 215
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idAuth_btn:Landroid/widget/Button;

    .line 216
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_update:Landroid/widget/Button;

    .line 217
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_reset:Landroid/widget/Button;

    .line 218
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnTitleBack:Landroid/widget/Button;

    .line 219
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnReset:Landroid/widget/Button;

    .line 220
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnAppControl:Landroid/widget/Button;

    .line 223
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->myCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 224
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    .line 225
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    .line 226
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    .line 229
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->back_btn:Landroid/widget/Button;

    .line 230
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatePassword:Ljava/lang/String;

    .line 234
    iput-boolean v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->reseting:Z

    .line 239
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->filein:Ljava/io/FileInputStream;

    .line 240
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;

    .line 241
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->launcherPath:Ljava/lang/String;

    .line 242
    const-string/jumbo v0, "0"

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->setDemoShow:Ljava/lang/String;

    .line 243
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ButtonFlag:Ljava/lang/Boolean;

    .line 249
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 250
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/MobileStudyClient/.System/setting.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->urlfilepath:Ljava/lang/String;

    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 252
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/MobileStudyClient/.System/settinghistory.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->settingHistory:Ljava/lang/String;

    .line 253
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->urlfilepath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tempfile:Ljava/io/File;

    .line 259
    new-instance v0, Lcom/edutech/idauthentication/MainActivity;

    invoke-direct {v0, p0}, Lcom/edutech/idauthentication/MainActivity;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth:Lcom/edutech/idauthentication/MainActivity;

    .line 265
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->versionName:Ljava/lang/String;

    .line 266
    iput v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->versionCode:I

    .line 267
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateThread:Ljava/lang/Thread;

    .line 273
    new-instance v0, Ljava/lang/StringBuilder;

    .line 274
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 275
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 276
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 277
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 278
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

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->LANGUAGEPATH:Ljava/lang/String;

    .line 283
    iput-boolean v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isover:Z

    .line 285
    iput v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateTime:I

    .line 286
    iput-wide v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCacheLength:J

    .line 287
    iput-wide v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCachePosition:J

    .line 289
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipOrigal:Ljava/lang/String;

    .line 290
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameOrigal:Ljava/lang/String;

    .line 291
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdOrigal:Ljava/lang/String;

    .line 292
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->threadPwd:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    .line 293
    const-string/jumbo v0, "ayjedutechyx@123456z"

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->superPwd1:Ljava/lang/String;

    .line 294
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->superPwd2:Ljava/lang/String;

    .line 295
    iput-boolean v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->allChangeSettings:Z

    .line 296
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdConfirmDialog:Landroid/app/AlertDialog;

    .line 300
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->saveErrorInfo:Ljava/lang/String;

    .line 301
    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->registerDialog:Landroid/app/AlertDialog;

    .line 302
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->addApksList:Ljava/util/ArrayList;

    .line 307
    iput-boolean v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isResetPwd:Z

    .line 308
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->modifiedIP:Ljava/lang/String;

    .line 309
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->modifiedName:Ljava/lang/String;

    .line 316
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->timeStamp:Ljava/lang/String;

    .line 318
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$1;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mHandler:Landroid/os/Handler;

    .line 351
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installHandler:Landroid/os/Handler;

    .line 466
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$3;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->resultHandler:Landroid/os/Handler;

    .line 1514
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$4;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$4;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListener:Landroid/view/View$OnTouchListener;

    .line 1563
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$5;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$5;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipListener:Landroid/view/View$OnTouchListener;

    .line 1620
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$6;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$6;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipWatcher:Landroid/text/TextWatcher;

    .line 1656
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$7;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$7;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameWatcher:Landroid/text/TextWatcher;

    .line 1693
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$8;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdWatcher:Landroid/text/TextWatcher;

    .line 1914
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$9;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$9;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->keylistenerDialog:Landroid/content/DialogInterface$OnKeyListener;

    .line 2702
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$10;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->downloadRun:Ljava/lang/Runnable;

    .line 2944
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatepwdRun:Ljava/lang/Runnable;

    .line 3259
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->runnable_GetConfig_Infor:Ljava/lang/Runnable;

    .line 203
    return-void
.end method

.method private Get_Config_Json(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 3422
    const-string/jumbo v7, ""

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    if-eqz p1, :cond_0

    const-string/jumbo v7, ""

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 3423
    if-nez p2, :cond_1

    .line 3424
    :cond_0
    const-string/jumbo v7, "CloudClientSetActivity"

    const-string/jumbo v8, "Get_Config_Json \u5165\u53c2\u6709\u95ee\u9898\u3002\u3002\u3002"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v6

    .line 3455
    :goto_0
    return-object v4

    .line 3427
    :cond_1
    const-string/jumbo v7, "CloudClientSetActivity"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "Get_Config_Json \u5165\u53c2\u6709\u95ee\u9898\u3002\u3002\u3002"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3429
    const/4 v7, 0x1

    :try_start_0
    invoke-direct {p0, p1, p2, v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Get_http_addheader(Ljava/lang/String;Ljava/lang/String;Z)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 3431
    .local v3, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_3

    .line 3433
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3434
    .local v1, "builder":Ljava/lang/StringBuilder;
    new-instance v0, Ljava/io/BufferedReader;

    .line 3435
    new-instance v7, Ljava/io/InputStreamReader;

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 3436
    invoke-interface {v8}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v8

    const-string/jumbo v9, "UTF-8"

    .line 3435
    invoke-direct {v7, v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 3434
    invoke-direct {v0, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 3437
    .local v0, "bufferedReader2":Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "s":Ljava/lang/String;
    :goto_1
    if-nez v5, :cond_2

    .line 3441
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3442
    .local v4, "resultString":Ljava/lang/String;
    const-string/jumbo v7, "CloudClientSetActivity"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "\u5b66\u6821\u548c\u7528\u6237\u4e2a\u4eba\u4fe1\u606f\u83b7\u53d6\u5b8c\u6210\u3002\u3002\u3002"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 3448
    .end local v0    # "bufferedReader2":Ljava/io/BufferedReader;
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v4    # "resultString":Ljava/lang/String;
    .end local v5    # "s":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 3450
    .local v2, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v2}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .end local v2    # "e":Lorg/apache/http/client/ClientProtocolException;
    :goto_2
    move-object v4, v6

    .line 3455
    goto :goto_0

    .line 3439
    .restart local v0    # "bufferedReader2":Ljava/io/BufferedReader;
    .restart local v1    # "builder":Ljava/lang/StringBuilder;
    .restart local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v5    # "s":Ljava/lang/String;
    :cond_2
    :try_start_1
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3438
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .line 3437
    goto :goto_1

    .line 3445
    .end local v0    # "bufferedReader2":Ljava/io/BufferedReader;
    .end local v1    # "builder":Ljava/lang/StringBuilder;
    .end local v5    # "s":Ljava/lang/String;
    :cond_3
    const-string/jumbo v7, "CloudClientSetActivity"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "\u5b66\u6821\u548c\u7528\u6237\u4e2a\u4eba\u4fe1\u606f\u83b7\u53d6\u5b8c\u6210\u3002\u3002\u3002"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v4, v6

    .line 3446
    goto/16 :goto_0

    .line 3451
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_1
    move-exception v2

    .line 3453
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method private Get_http_addheader(Ljava/lang/String;Ljava/lang/String;Z)Lorg/apache/http/HttpResponse;
    .locals 10
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "user_Name"    # Ljava/lang/String;
    .param p3, "isconfig"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 4267
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v3, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 4268
    .local v3, "request":Lorg/apache/http/client/methods/HttpGet;
    const-string/jumbo v7, "X-Edutech-Entity"

    invoke-virtual {v3, v7, p2}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 4269
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 4270
    .local v4, "imestamp":J
    if-eqz p3, :cond_0

    .line 4272
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->timeStamp:Ljava/lang/String;

    .line 4274
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 4275
    .local v6, "sign":Ljava/lang/String;
    const-string/jumbo v7, "X-Edutech-Sign"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v9, "+"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 4276
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 4277
    .local v1, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    const/4 v2, 0x0

    .line 4280
    .local v2, "httpResponse":Lorg/apache/http/HttpResponse;
    :try_start_0
    invoke-virtual {v1, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 4286
    :goto_0
    return-object v2

    .line 4282
    :catch_0
    move-exception v0

    .line 4284
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
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
    .line 1315
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    .line 1316
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

    .line 1320
    .local v5, "proc":Ljava/lang/Process;
    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 1321
    .local v2, "inputstream":Ljava/io/InputStream;
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 1322
    .local v3, "inputstreamreader":Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 1323
    .local v0, "bufferedreader":Ljava/io/BufferedReader;
    const-string/jumbo v4, ""

    .line 1324
    .local v4, "line":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1325
    .local v8, "sb":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 1332
    :try_start_0
    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I

    move-result v9

    if-eqz v9, :cond_0

    .line 1333
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

    .line 1339
    :cond_0
    :goto_1
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1340
    .local v6, "result":Ljava/lang/String;
    const-string/jumbo v9, "Success"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1342
    const/4 v9, 0x1

    .line 1345
    :goto_2
    return v9

    .line 1326
    .end local v6    # "result":Ljava/lang/String;
    :cond_1
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1335
    :catch_0
    move-exception v1

    .line 1336
    .local v1, "e":Ljava/lang/InterruptedException;
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v9, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_1

    .line 1345
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .restart local v6    # "result":Ljava/lang/String;
    :cond_2
    const/4 v9, 0x0

    goto :goto_2
.end method

.method static synthetic access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$10(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Z
    .locals 1

    .prologue
    .line 283
    iget-boolean v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isover:Z

    return v0
.end method

.method static synthetic access$11(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)J
    .locals 2

    .prologue
    .line 286
    iget-wide v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCacheLength:J

    return-wide v0
.end method

.method static synthetic access$12(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)J
    .locals 2

    .prologue
    .line 287
    iget-wide v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCachePosition:J

    return-wide v0
.end method

.method static synthetic access$13(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    return-object v0
.end method

.method static synthetic access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$15(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1127
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installSingleApk(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$16(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnTitleBack:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$17(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/Button;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ok_btn:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$18(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatePassword:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$19(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_edit:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$2(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 2317
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->writeXmlLanguage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$20(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V
    .locals 0

    .prologue
    .line 307
    iput-boolean p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isResetPwd:Z

    return-void
.end method

.method static synthetic access$21(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 268
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$22(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 300
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->saveErrorInfo:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$23(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 289
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipOrigal:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$24(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$25(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 290
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameOrigal:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$26(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 291
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdOrigal:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$27(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipOrigal:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$28(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 308
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->modifiedIP:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$29(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 290
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameOrigal:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1173
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installNewApk()V

    return-void
.end method

.method static synthetic access$30(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 309
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->modifiedName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 466
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->resultHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$32(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V
    .locals 0

    .prologue
    .line 295
    iput-boolean p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->allChangeSettings:Z

    return-void
.end method

.method static synthetic access$33(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;)V
    .locals 0

    .prologue
    .line 292
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->threadPwd:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    return-void
.end method

.method static synthetic access$34(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 675
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startFireWall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$35(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/ListPopupWindow;
    .locals 1

    .prologue
    .line 297
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    return-object v0
.end method

.method static synthetic access$36(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/cloudclientsetting/activity/IPListAdapter;
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    return-object v0
.end method

.method static synthetic access$37(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$38(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 313
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->stu_name:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$39(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lorg/json/JSONArray;
    .locals 1

    .prologue
    .line 315
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    return-object v0
.end method

.method static synthetic access$4(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$40(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 1

    .prologue
    .line 4669
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameHistoryAdd(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$41(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 315
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    return-void
.end method

.method static synthetic access$42(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Z
    .locals 1

    .prologue
    .line 1493
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getInternetState()Z

    move-result v0

    return v0
.end method

.method static synthetic access$43(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 4513
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatePassword()V

    return-void
.end method

.method static synthetic access$44(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1533
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showPopNameList()V

    return-void
.end method

.method static synthetic access$45(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1578
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showPopList()V

    return-void
.end method

.method static synthetic access$46(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->threadPwd:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    return-object v0
.end method

.method static synthetic access$47(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Z
    .locals 1

    .prologue
    .line 295
    iget-boolean v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->allChangeSettings:Z

    return v0
.end method

.method static synthetic access$48(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 4377
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showConfirmPwdDialog()V

    return-void
.end method

.method static synthetic access$49(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 291
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdOrigal:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1831
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->closeProgressDialog()V

    return-void
.end method

.method static synthetic access$50(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 2821
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sslConnect()V

    return-void
.end method

.method static synthetic access$51(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lorg/apache/http/client/HttpClient;)Lorg/apache/http/client/HttpClient;
    .locals 1

    .prologue
    .line 3220
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sslClient(Lorg/apache/http/client/HttpClient;)Lorg/apache/http/client/HttpClient;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$52(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ptfw_edit:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$53(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 230
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatePassword:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$54(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 300
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->saveErrorInfo:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$55(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 318
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$56(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 205
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Name:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$57(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 206
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Pwd:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$58(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Name:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$59(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 3421
    invoke-direct {p0, p1, p2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Get_Config_Json(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$6(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1859
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->resetUpdateInfo()V

    return-void
.end method

.method static synthetic access$60(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 3464
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->jsonToConfig(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$61(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)I
    .locals 1

    .prologue
    .line 285
    iget v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateTime:I

    return v0
.end method

.method static synthetic access$62(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$63(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 302
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->addApksList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$64(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 302
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->addApksList:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$65(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 241
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->launcherPath:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$66(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;J)V
    .locals 1

    .prologue
    .line 286
    iput-wide p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCacheLength:J

    return-void
.end method

.method static synthetic access$67(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;J)V
    .locals 1

    .prologue
    .line 287
    iput-wide p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCachePosition:J

    return-void
.end method

.method static synthetic access$68(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 3077
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$69(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 226
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$7(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 445
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startAssistanApk()V

    return-void
.end method

.method static synthetic access$70(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lorg/json/JSONArray;Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/List;
    .locals 1

    .prologue
    .line 1035
    invoke-direct {p0, p1, p2, p3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->parseDownload_Old(Lorg/json/JSONArray;Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$71(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 1

    .prologue
    .line 937
    invoke-direct {p0, p1, p2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->parseDownload_new(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$72(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->launcherPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$73(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;ILjava/lang/Object;I)V
    .locals 0

    .prologue
    .line 1022
    invoke-direct {p0, p1, p2, p3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    return-void
.end method

.method static synthetic access$74(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 270
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$75(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Z)V
    .locals 0

    .prologue
    .line 234
    iput-boolean p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->reseting:Z

    return-void
.end method

.method static synthetic access$76(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1943
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->deleteAPks()V

    return-void
.end method

.method static synthetic access$77(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1964
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->deleteOtherFiles()V

    return-void
.end method

.method static synthetic access$78(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 4303
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getManagerPwd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$79(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 293
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->superPwd1:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$8(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1805
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showProgressDialog()V

    return-void
.end method

.method static synthetic access$80(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 4344
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getUserPwd()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$81(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 294
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->superPwd2:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$82(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 228
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$83(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1729
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showLanguageChooseDialog()V

    return-void
.end method

.method static synthetic access$84(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Z
    .locals 1

    .prologue
    .line 234
    iget-boolean v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->reseting:Z

    return v0
.end method

.method static synthetic access$85(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/app/AlertDialog;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->registerDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$86(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Landroid/app/AlertDialog;)V
    .locals 0

    .prologue
    .line 301
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->registerDialog:Landroid/app/AlertDialog;

    return-void
.end method

.method static synthetic access$87(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/app/AlertDialog;
    .locals 1

    .prologue
    .line 296
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdConfirmDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$88(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->superPwd1:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$89(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->superPwd2:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$9(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/lee/demo/view/CustomProgressDialog;
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    return-object v0
.end method

.method private apkIntentInstall(Ljava/lang/String;)V
    .locals 3
    .param p1, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 1265
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1266
    .local v0, "installIntent":Landroid/content/Intent;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 1267
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 1266
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 1268
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1269
    invoke-virtual {p0, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startActivity(Landroid/content/Intent;)V

    .line 1270
    return-void
.end method

.method private apkinstall(Ljava/lang/String;)V
    .locals 5
    .param p1, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 1241
    :try_start_0
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1242
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1243
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkIntentInstall(Ljava/lang/String;)V

    .line 1262
    :goto_0
    return-void

    .line 1245
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

    .line 1249
    :catch_0
    move-exception v0

    .line 1251
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1252
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkIntentInstall(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 1255
    :catch_1
    move-exception v1

    .line 1257
    .local v1, "e1":Ljava/lang/Exception;
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkIntentInstall(Ljava/lang/String;)V

    .line 1258
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

    .line 1247
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

    .line 1254
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
    .line 1228
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1229
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.SILENCE_INSTALL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1230
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "M1016Pro"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1231
    const-string/jumbo v1, "uri"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1236
    :goto_0
    invoke-virtual {p0, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1237
    return-void

    .line 1233
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 1234
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 1233
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private appendUserInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    .line 3868
    :try_start_0
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string/jumbo v4, "rw"

    invoke-direct {v1, p1, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3870
    .local v1, "randomFile":Ljava/io/RandomAccessFile;
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    .line 3872
    .local v2, "fileLength":J
    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 3873
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/RandomAccessFile;->writeBytes(Ljava/lang/String;)V

    .line 3874
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 3880
    .end local v1    # "randomFile":Ljava/io/RandomAccessFile;
    .end local v2    # "fileLength":J
    :goto_0
    return-void

    .line 3875
    :catch_0
    move-exception v0

    .line 3876
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 3877
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v4

    goto :goto_0
.end method

.method private checkConfig(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 12
    .param p1, "jsonStr"    # Ljava/lang/String;
    .param p2, "timeStamp"    # Ljava/lang/String;

    .prologue
    .line 3379
    const/4 v6, 0x0

    .line 3381
    .local v6, "isOk":Z
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 3382
    .local v7, "json":Lorg/json/JSONObject;
    const-string/jumbo v10, "checksum"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 3384
    const-string/jumbo v1, ""

    .line 3385
    .local v1, "apihost":Ljava/lang/String;
    const-string/jumbo v10, "data"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 3386
    .local v4, "data":Lorg/json/JSONObject;
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3387
    .local v2, "checkString1":Ljava/lang/String;
    const-string/jumbo v10, "checksum"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 3388
    .local v3, "checksum":Ljava/lang/String;
    const-string/jumbo v10, "privatekey"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 3389
    .local v9, "seed":Ljava/lang/String;
    const-string/jumbo v10, "apihost"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3391
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/edutech/mobilestudyclient/util/AESUtils;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3392
    .local v0, "aesString":Ljava/lang/String;
    invoke-static {v0}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 3398
    .local v8, "md5String":Ljava/lang/String;
    if-eqz v8, :cond_0

    if-eqz v3, :cond_0

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v10

    if-eqz v10, :cond_0

    .line 3400
    const/4 v6, 0x1

    .line 3412
    .end local v0    # "aesString":Ljava/lang/String;
    .end local v1    # "apihost":Ljava/lang/String;
    .end local v2    # "checkString1":Ljava/lang/String;
    .end local v3    # "checksum":Ljava/lang/String;
    .end local v4    # "data":Lorg/json/JSONObject;
    .end local v7    # "json":Lorg/json/JSONObject;
    .end local v8    # "md5String":Ljava/lang/String;
    .end local v9    # "seed":Ljava/lang/String;
    :cond_0
    :goto_0
    return v6

    .line 3403
    .restart local v7    # "json":Lorg/json/JSONObject;
    :cond_1
    const/4 v6, 0x1

    goto :goto_0

    .line 3405
    .end local v7    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v5

    .line 3407
    .local v5, "e":Lorg/json/JSONException;
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 3408
    .end local v5    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v5

    .line 3410
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static clientInstall(Ljava/lang/String;)Z
    .locals 7
    .param p0, "apkPath"    # Ljava/lang/String;

    .prologue
    .line 1273
    const/4 v0, 0x0

    .line 1274
    .local v0, "PrintWriter":Ljava/io/PrintWriter;
    const/4 v3, 0x0

    .line 1276
    .local v3, "process":Ljava/lang/Process;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    const-string/jumbo v6, "su"

    invoke-virtual {v5, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 1277
    new-instance v1, Ljava/io/PrintWriter;

    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1278
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .local v1, "PrintWriter":Ljava/io/PrintWriter;
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "chmod 777 "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1280
    const-string/jumbo v5, "export LD_LIBRARY_PATH=/vendor/lib:/system/lib"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1281
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "pm install -r "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1283
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 1284
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 1285
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v4

    .line 1286
    .local v4, "value":I
    invoke-static {v4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->returnResult(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v5

    .line 1290
    if-eqz v3, :cond_0

    .line 1291
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    :cond_0
    move-object v0, v1

    .line 1294
    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .end local v4    # "value":I
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    :goto_0
    return v5

    .line 1287
    :catch_0
    move-exception v2

    .line 1288
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1290
    if-eqz v3, :cond_1

    .line 1291
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 1294
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 1289
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 1290
    :goto_2
    if-eqz v3, :cond_2

    .line 1291
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 1293
    :cond_2
    throw v5

    .line 1289
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_2

    .line 1287
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_1
.end method

.method private closeProgressDialog()V
    .locals 3

    .prologue
    .line 1833
    :try_start_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 1834
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1835
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0801d2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1836
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNewUpdate:Z

    if-eqz v0, :cond_2

    .line 1838
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isover:Z

    if-nez v0, :cond_0

    .line 1839
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->resetData()V

    .line 1840
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->dismiss()V

    .line 1841
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    .line 1843
    :cond_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1844
    const/4 v0, 0x0

    sput-boolean v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    .line 1855
    :cond_1
    :goto_0
    return-void

    .line 1847
    :cond_2
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isover:Z

    if-nez v0, :cond_1

    .line 1848
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    invoke-virtual {v0}, Lcom/lee/demo/view/CustomProgressDialog;->dismiss()V

    .line 1849
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1852
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private delete(Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1977
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1978
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1995
    :cond_0
    return-void

    .line 1982
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 1983
    .local v1, "files":[Ljava/io/File;
    if-eqz v1, :cond_0

    .line 1985
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-ge v2, v4, :cond_0

    .line 1987
    aget-object v3, v1, v2

    .line 1988
    .local v3, "tempFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "HTML"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1985
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1992
    :cond_2
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->deleteFiles(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private deleteAPks()V
    .locals 8

    .prologue
    .line 1945
    new-instance v0, Ljava/io/File;

    sget-object v4, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1946
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1948
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 1949
    .local v1, "files":[Ljava/io/File;
    if-eqz v1, :cond_0

    .line 1951
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-lt v2, v4, :cond_1

    .line 1962
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    :cond_0
    return-void

    .line 1953
    .restart local v1    # "files":[Ljava/io/File;
    .restart local v2    # "i":I
    :cond_1
    aget-object v3, v1, v2

    .line 1954
    .local v3, "tempFile":Ljava/io/File;
    const-string/jumbo v4, "apk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, ".apk"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1955
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ".apk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1957
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 1951
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static deleteFiles(Ljava/lang/String;)V
    .locals 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 1997
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1998
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1999
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 2000
    .local v1, "files":[Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-lt v2, v4, :cond_2

    .line 2011
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    :cond_0
    :goto_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2012
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2014
    :cond_1
    return-void

    .line 2001
    .restart local v1    # "files":[Ljava/io/File;
    .restart local v2    # "i":I
    :cond_2
    aget-object v4, v1, v2

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 2003
    .local v3, "newPath":Ljava/lang/String;
    invoke-static {v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->deleteFiles(Ljava/lang/String;)V

    .line 2000
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2006
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    .end local v3    # "newPath":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2007
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_1
.end method

.method private deleteOtherFiles()V
    .locals 6

    .prologue
    .line 1966
    new-instance v4, Ljava/lang/StringBuilder;

    sget-object v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "DaoXueBen/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1967
    .local v0, "daoxueben":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    sget-object v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "ZuoYeFuDao/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1968
    .local v3, "zuoyefudao":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    sget-object v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "HomeWork/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1969
    .local v1, "homework":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "/EBag/.System/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "offline/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1970
    .local v2, "newOffline":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->delete(Ljava/lang/String;)V

    .line 1971
    invoke-direct {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->delete(Ljava/lang/String;)V

    .line 1972
    invoke-direct {p0, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->delete(Ljava/lang/String;)V

    .line 1973
    invoke-direct {p0, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->delete(Ljava/lang/String;)V

    .line 1974
    return-void
.end method

.method private downLoadImage(Ljava/util/ArrayList;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 3814
    .local p1, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v3, v6, :cond_0

    .line 3831
    return-void

    .line 3817
    :cond_0
    :try_start_0
    new-instance v5, Ljava/net/URL;

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 3818
    .local v5, "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 3819
    .local v1, "conn":Ljava/net/HttpURLConnection;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 3820
    .local v0, "code":I
    const/16 v6, 0xc8

    if-ne v0, v6, :cond_1

    .line 3821
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 3822
    .local v4, "in":Ljava/io/InputStream;
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {p0, v4, v6}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->savePic(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3814
    .end local v0    # "code":I
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .end local v4    # "in":Ljava/io/InputStream;
    .end local v5    # "url":Ljava/net/URL;
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 3825
    :catch_0
    move-exception v2

    .line 3827
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 3828
    const-string/jumbo v6, "liu"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "downLoadImage:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private exit()V
    .locals 2

    .prologue
    .line 2312
    new-instance v0, Landroid/content/Intent;

    .line 2313
    const-class v1, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 2312
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2314
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startActivity(Landroid/content/Intent;)V

    .line 2315
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->finish()V

    .line 2316
    return-void
.end method

.method private getCurrApkInfo()V
    .locals 6

    .prologue
    .line 1767
    :try_start_0
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1768
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    .line 1767
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 1769
    .local v1, "info":Landroid/content/pm/PackageInfo;
    const-string/jumbo v2, "packageName"

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1771
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->versionName:Ljava/lang/String;

    .line 1772
    iget v2, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    iput v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1776
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    :goto_0
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvCurrVersion:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 1777
    const v5, 0x7f0801c0

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->versionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1776
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1778
    return-void

    .line 1773
    :catch_0
    move-exception v0

    .line 1774
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method private getInternetState()Z
    .locals 5

    .prologue
    .line 1495
    const/4 v2, 0x0

    .line 1496
    .local v2, "isconnect":Z
    const-string/jumbo v3, "connectivity"

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 1497
    .local v0, "connect":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_0

    .line 1499
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 1500
    .local v1, "info":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1502
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v3

    sget-object v4, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v3, v4, :cond_0

    .line 1505
    const/4 v2, 0x1

    .line 1509
    .end local v1    # "info":Landroid/net/NetworkInfo;
    .end local v2    # "isconnect":Z
    :cond_0
    return v2
.end method

.method private getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 14
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 3078
    const/4 v6, 0x0

    .line 3081
    .local v6, "jsonString":Ljava/lang/String;
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v11

    const/16 v12, 0xc8

    if-ne v11, v12, :cond_2

    .line 3083
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 3084
    .local v5, "is":Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 3085
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const/4 v11, 0x2

    invoke-virtual {v0, v11}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 3087
    const/4 v11, 0x2

    new-array v3, v11, [B

    .line 3088
    .local v3, "header":[B
    invoke-virtual {v0, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v9

    .line 3090
    .local v9, "result":I
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->reset()V

    .line 3092
    invoke-direct {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getShort([B)I

    move-result v4

    .line 3094
    .local v4, "headerData":I
    const/4 v11, -0x1

    if-eq v9, v11, :cond_0

    const/16 v11, 0x1f8b

    if-ne v4, v11, :cond_0

    .line 3095
    const-string/jumbo v11, "CloudClientSetActivity"

    const-string/jumbo v12, " use GZIPInputStream  "

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3096
    new-instance v5, Ljava/util/zip/GZIPInputStream;

    .end local v5    # "is":Ljava/io/InputStream;
    invoke-direct {v5, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 3101
    .restart local v5    # "is":Ljava/io/InputStream;
    :goto_0
    new-instance v8, Ljava/io/InputStreamReader;

    const-string/jumbo v11, "utf-8"

    invoke-direct {v8, v5, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 3102
    .local v8, "reader":Ljava/io/InputStreamReader;
    const/16 v11, 0x64

    new-array v1, v11, [C

    .line 3104
    .local v1, "data":[C
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    .line 3105
    .local v10, "sb":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v8, v1}, Ljava/io/InputStreamReader;->read([C)I

    move-result v7

    .local v7, "readSize":I
    if-gtz v7, :cond_1

    .line 3108
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 3109
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 3110
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V

    .line 3121
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

    .line 3098
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "header":[B
    .restart local v4    # "headerData":I
    .restart local v5    # "is":Ljava/io/InputStream;
    .restart local v9    # "result":I
    :cond_0
    const-string/jumbo v11, "CloudClientSetActivity"

    const-string/jumbo v12, " not use GZIPInputStream"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3099
    move-object v5, v0

    goto :goto_0

    .line 3106
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

    .line 3117
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

    .line 3118
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v11, "CloudClientSetActivity"

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3119
    const-string/jumbo v6, ""

    goto :goto_2

    .line 3113
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_1
    const-string/jumbo v11, "CloudClientSetActivity"

    const-string/jumbo v12, "\u4e0e\u670d\u52a1\u7aef\u8fde\u63a5\u5931\u8d25\u3002\u3002\u3002"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3114
    const-string/jumbo v11, "CloudClientSetActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "ddddd="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3115
    const-string/jumbo v6, ""
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method private getManagerPwd()Ljava/lang/String;
    .locals 27

    .prologue
    .line 4305
    const-string/jumbo v16, "ayjedutechyx@123456z"

    .line 4306
    .local v16, "pwd":Ljava/lang/String;
    const-string/jumbo v19, ""

    .line 4307
    .local v19, "result":Ljava/lang/String;
    const-string/jumbo v24, "privatekey"

    .line 4308
    const/16 v25, 0x0

    .line 4307
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v20

    .line 4309
    .local v20, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v24, "key"

    const-string/jumbo v25, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 4310
    .local v15, "privatekey":Ljava/lang/String;
    const-string/jumbo v24, "apihost"

    const-string/jumbo v25, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 4311
    .local v12, "ip":Ljava/lang/String;
    const-string/jumbo v24, "name"

    const-string/jumbo v25, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 4312
    .local v23, "username":Ljava/lang/String;
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v9

    .line 4313
    .local v9, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v9, :cond_1

    if-eqz v12, :cond_0

    const-string/jumbo v24, ""

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_0

    const-string/jumbo v24, ""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_1

    .line 4314
    :cond_0
    const-string/jumbo v24, "ip"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "ip":Ljava/lang/String;
    check-cast v12, Ljava/lang/String;

    .line 4315
    .restart local v12    # "ip":Ljava/lang/String;
    const-string/jumbo v24, "usercode"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    .end local v23    # "username":Ljava/lang/String;
    check-cast v23, Ljava/lang/String;

    .line 4316
    .restart local v23    # "username":Ljava/lang/String;
    const-string/jumbo v24, "privatekey"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "privatekey":Ljava/lang/String;
    check-cast v15, Ljava/lang/String;

    .line 4318
    .restart local v15    # "privatekey":Ljava/lang/String;
    :cond_1
    const-string/jumbo v24, "pwd"

    const-string/jumbo v25, "start get pwd"

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4319
    new-instance v24, Ljava/lang/StringBuilder;

    const-string/jumbo v25, "http://"

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 4320
    const-string/jumbo v25, "/api/padpwd"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    .line 4319
    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 4321
    .local v22, "url":Ljava/lang/String;
    new-instance v14, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v22

    invoke-direct {v14, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 4322
    .local v14, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v24, "X-Edutech-Entity"

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v14, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 4323
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 4324
    .local v10, "imestamp":J
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 4325
    .local v21, "sign":Ljava/lang/String;
    const-string/jumbo v24, "X-Edutech-Sign"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v26, "+"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v14, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 4326
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 4328
    .local v6, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_0
    invoke-virtual {v6, v14}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v18

    .line 4329
    .local v18, "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v19

    .line 4331
    new-instance v13, Lorg/json/JSONObject;

    move-object/from16 v0, v19

    invoke-direct {v13, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4332
    .local v13, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v24, "data"

    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 4333
    .local v7, "data":Ljava/lang/String;
    new-instance v4, Lcom/edutech/idauthentication/AESSet;

    invoke-direct {v4}, Lcom/edutech/idauthentication/AESSet;-><init>()V

    .line 4334
    .local v4, "aesset":Lcom/edutech/idauthentication/AESSet;
    invoke-virtual {v4, v7}, Lcom/edutech/idauthentication/AESSet;->decrypt(Ljava/lang/String;)[B

    move-result-object v5

    .line 4335
    .local v5, "byaes":[B
    new-instance v17, Ljava/lang/String;

    const/16 v24, 0x0

    array-length v0, v5

    move/from16 v25, v0

    move-object/from16 v0, v17

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v5, v1, v2}, Ljava/lang/String;-><init>([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v16    # "pwd":Ljava/lang/String;
    .local v17, "pwd":Ljava/lang/String;
    move-object/from16 v16, v17

    .line 4342
    .end local v4    # "aesset":Lcom/edutech/idauthentication/AESSet;
    .end local v5    # "byaes":[B
    .end local v7    # "data":Ljava/lang/String;
    .end local v13    # "jobj":Lorg/json/JSONObject;
    .end local v17    # "pwd":Ljava/lang/String;
    .end local v18    # "response":Lorg/apache/http/HttpResponse;
    .restart local v16    # "pwd":Ljava/lang/String;
    :goto_0
    return-object v16

    .line 4337
    :catch_0
    move-exception v8

    .line 4339
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getShort([B)I
    .locals 2
    .param p1, "data"    # [B

    .prologue
    .line 3125
    const/4 v0, 0x0

    aget-byte v0, p1, v0

    shl-int/lit8 v0, v0, 0x8

    const/4 v1, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private getUserPwd()Ljava/lang/String;
    .locals 10

    .prologue
    .line 4346
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdOrigal:Ljava/lang/String;

    .line 4347
    .local v4, "pwd":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "http://"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipOrigal:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "/api/config"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 4348
    .local v6, "url":Ljava/lang/String;
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameOrigal:Ljava/lang/String;

    invoke-direct {p0, v6, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Get_Config_Json(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 4350
    .local v5, "result":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4351
    .local v2, "jobj":Lorg/json/JSONObject;
    const/4 v0, 0x0

    .line 4352
    .local v0, "data":Lorg/json/JSONObject;
    const/4 v7, 0x0

    .line 4353
    .local v7, "user":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    .line 4355
    const-string/jumbo v8, "data"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 4357
    :cond_0
    if-eqz v0, :cond_1

    .line 4359
    const-string/jumbo v8, "user"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 4361
    :cond_1
    if-eqz v7, :cond_2

    .line 4363
    const-string/jumbo v8, "pubkey"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 4365
    .local v3, "pubkey":Ljava/lang/String;
    :try_start_1
    invoke-static {v3}, Lcom/cloudclientsetting/until/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 4375
    .end local v0    # "data":Lorg/json/JSONObject;
    .end local v2    # "jobj":Lorg/json/JSONObject;
    .end local v3    # "pubkey":Ljava/lang/String;
    .end local v7    # "user":Lorg/json/JSONObject;
    :cond_2
    :goto_0
    return-object v4

    .line 4366
    .restart local v0    # "data":Lorg/json/JSONObject;
    .restart local v2    # "jobj":Lorg/json/JSONObject;
    .restart local v3    # "pubkey":Ljava/lang/String;
    .restart local v7    # "user":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 4368
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 4371
    .end local v0    # "data":Lorg/json/JSONObject;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "jobj":Lorg/json/JSONObject;
    .end local v3    # "pubkey":Ljava/lang/String;
    .end local v7    # "user":Lorg/json/JSONObject;
    :catch_1
    move-exception v1

    .line 4373
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private installNewApk()V
    .locals 8

    .prologue
    .line 1174
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-gtz v5, :cond_1

    .line 1225
    :cond_0
    :goto_0
    return-void

    .line 1177
    :cond_1
    const/4 v0, 0x0

    .line 1178
    .local v0, "boo":Z
    new-instance v5, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-direct {v5, p0}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

    .line 1180
    :try_start_0
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->cn:Landroid/content/ComponentName;

    invoke-virtual {v5, v6}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1185
    :goto_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt v2, v5, :cond_2

    .line 1224
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->finish()V

    goto :goto_0

    .line 1181
    .end local v2    # "i":I
    :catch_0
    move-exception v1

    .line 1183
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 1186
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "i":I
    :cond_2
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1187
    .local v4, "path":Ljava/lang/String;
    const-string/jumbo v5, ".apk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_4

    .line 1185
    :cond_3
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1191
    :cond_4
    if-eqz v0, :cond_5

    .line 1194
    :try_start_1
    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->cn:Landroid/content/ComponentName;

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v7, v5}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->installPackage(Landroid/content/ComponentName;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 1195
    :catch_1
    move-exception v5

    goto :goto_3

    .line 1197
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

    .line 1198
    :cond_6
    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Landroid/app/mia/MiaMdmPolicyManager;->silentInstall(Ljava/lang/String;)V

    goto :goto_3

    .line 1202
    :cond_7
    :try_start_2
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mContext:Landroid/content/Context;

    if-eqz v5, :cond_3

    .line 1203
    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "M1016Pro"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P990S.V"

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

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P583"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_8

    .line 1204
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 1205
    .local v3, "intent":Landroid/content/Intent;
    const-string/jumbo v5, "com.edutech.install"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1206
    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1207
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkinstall(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1219
    .end local v3    # "intent":Landroid/content/Intent;
    :catch_2
    move-exception v5

    goto/16 :goto_3

    .line 1214
    :cond_8
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkinstall_samsung(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_3
.end method

.method private installSingleApk(Ljava/lang/String;)V
    .locals 5
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1129
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, ".apk"

    invoke-virtual {p1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 1169
    :cond_0
    :goto_0
    return-void

    .line 1132
    :cond_1
    const/4 v0, 0x0

    .line 1133
    .local v0, "boo":Z
    new-instance v3, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-direct {v3, p0}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

    .line 1135
    :try_start_0
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->cn:Landroid/content/ComponentName;

    invoke-virtual {v3, v4}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    .line 1140
    :goto_1
    if-eqz v0, :cond_2

    .line 1143
    :try_start_1
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->cn:Landroid/content/ComponentName;

    invoke-virtual {v3, v4, p1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->installPackage(Landroid/content/ComponentName;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1144
    :catch_0
    move-exception v3

    goto :goto_0

    .line 1136
    :catch_1
    move-exception v1

    .line 1138
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 1145
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

    .line 1146
    :cond_3
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mMiaMdmPolicyManager:Landroid/app/mia/MiaMdmPolicyManager;

    invoke-virtual {v3, p1}, Landroid/app/mia/MiaMdmPolicyManager;->silentInstall(Ljava/lang/String;)V

    goto :goto_0

    .line 1150
    :cond_4
    :try_start_2
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mContext:Landroid/content/Context;

    if-eqz v3, :cond_0

    .line 1151
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

    .line 1152
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 1153
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "com.edutech.install"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1154
    invoke-virtual {p0, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1155
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkinstall(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1165
    .end local v2    # "intent":Landroid/content/Intent;
    :catch_2
    move-exception v3

    goto/16 :goto_0

    .line 1162
    :cond_5
    invoke-direct {p0, p1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkinstall_samsung(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0
.end method

.method private jsonToConfig(Ljava/lang/String;)I
    .locals 72
    .param p1, "json_str"    # Ljava/lang/String;

    .prologue
    .line 3465
    if-eqz p1, :cond_0

    const-string/jumbo v3, ""

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 3466
    :cond_0
    const/4 v3, -0x1

    .line 3809
    :goto_0
    return v3

    .line 3468
    :cond_1
    const/16 v64, 0x0

    .line 3469
    .local v64, "status":Ljava/lang/String;
    const/16 v49, 0x0

    .line 3470
    .local v49, "errorNum":Ljava/lang/String;
    const/16 v48, 0x0

    .line 3471
    .local v48, "errorInfo":Ljava/lang/String;
    const/16 v40, 0x0

    .line 3472
    .local v40, "data":Lorg/json/JSONObject;
    const-string/jumbo v28, "0"

    .line 3473
    .local v28, "guidancestate":Ljava/lang/String;
    const-string/jumbo v34, "0"

    .line 3474
    .local v34, "guidenotes":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->timeStamp:Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->checkConfig(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 3476
    const/16 v3, -0x64

    goto :goto_0

    .line 3479
    :cond_2
    :try_start_0
    new-instance v51, Lorg/json/JSONObject;

    move-object/from16 v0, v51

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 3480
    .local v51, "info":Lorg/json/JSONObject;
    const-string/jumbo v3, "status"

    move-object/from16 v0, v51

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v64

    .line 3481
    const-string/jumbo v3, "errorInfo"

    move-object/from16 v0, v51

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v48

    .line 3482
    move-object/from16 v0, v48

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->saveErrorInfo:Ljava/lang/String;

    .line 3483
    const-string/jumbo v3, "errorNum"

    move-object/from16 v0, v51

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v49

    .line 3484
    const-string/jumbo v3, "-2"

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 3486
    const/4 v3, -0x2

    goto :goto_0

    .line 3488
    :cond_3
    const-string/jumbo v3, "0"

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 3490
    const-string/jumbo v3, "data"

    move-object/from16 v0, v51

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v40

    .line 3491
    const/4 v12, 0x0

    .line 3492
    .local v12, "privatekey":Ljava/lang/String;
    const/4 v13, 0x0

    .line 3493
    .local v13, "encrypt":Ljava/lang/String;
    const/4 v14, 0x0

    .line 3494
    .local v14, "apihost":Ljava/lang/String;
    const-string/jumbo v3, "privatekey"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 3495
    const-string/jumbo v3, "encrypt"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 3496
    const-string/jumbo v3, "apihost"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v14

    .line 3498
    :try_start_1
    const-string/jumbo v3, "guidelearncomment"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1c
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v28

    .line 3503
    :goto_1
    :try_start_2
    const-string/jumbo v3, "guidenotes"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1b
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v34

    .line 3508
    :goto_2
    :try_start_3
    const-string/jumbo v3, "user"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v68

    .line 3509
    .local v68, "user":Lorg/json/JSONObject;
    const/16 v58, 0x0

    .line 3510
    .local v58, "pubkey":Ljava/lang/String;
    const-string/jumbo v3, "pubkey"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v58

    .line 3511
    const-string/jumbo v3, "type"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v66

    .line 3513
    .local v66, "type_user":Ljava/lang/String;
    const-string/jumbo v3, "03"

    move-object/from16 v0, v66

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string/jumbo v3, "3"

    move-object/from16 v0, v66

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 3514
    const/4 v3, 0x2

    goto/16 :goto_0

    .line 3516
    :cond_4
    const-string/jumbo v27, "-1"
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 3518
    .local v27, "userid":Ljava/lang/String;
    :try_start_4
    const-string/jumbo v3, "id"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    move-result-object v27

    .line 3523
    :goto_3
    :try_start_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Pwd:Ljava/lang/String;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v58

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 3524
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 3519
    :catch_0
    move-exception v43

    .line 3521
    .local v43, "e":Ljava/lang/Exception;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_3

    .line 3806
    .end local v12    # "privatekey":Ljava/lang/String;
    .end local v13    # "encrypt":Ljava/lang/String;
    .end local v14    # "apihost":Ljava/lang/String;
    .end local v27    # "userid":Ljava/lang/String;
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v51    # "info":Lorg/json/JSONObject;
    .end local v58    # "pubkey":Ljava/lang/String;
    .end local v66    # "type_user":Ljava/lang/String;
    .end local v68    # "user":Lorg/json/JSONObject;
    :catch_1
    move-exception v43

    .line 3808
    .local v43, "e":Lorg/json/JSONException;
    invoke-virtual/range {v43 .. v43}, Lorg/json/JSONException;->printStackTrace()V

    .line 3809
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 3526
    .end local v43    # "e":Lorg/json/JSONException;
    .restart local v12    # "privatekey":Ljava/lang/String;
    .restart local v13    # "encrypt":Ljava/lang/String;
    .restart local v14    # "apihost":Ljava/lang/String;
    .restart local v27    # "userid":Ljava/lang/String;
    .restart local v51    # "info":Lorg/json/JSONObject;
    .restart local v58    # "pubkey":Ljava/lang/String;
    .restart local v66    # "type_user":Ljava/lang/String;
    .restart local v68    # "user":Lorg/json/JSONObject;
    :cond_5
    :try_start_6
    const-string/jumbo v3, "privatekey"

    .line 3527
    const/4 v11, 0x0

    .line 3526
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v11}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v61

    .line 3528
    .local v61, "sharePre":Landroid/content/SharedPreferences;
    invoke-interface/range {v61 .. v61}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v46

    .line 3529
    .local v46, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v3, "key"

    move-object/from16 v0, v46

    invoke-interface {v0, v3, v12}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 3530
    const-string/jumbo v3, "name"

    const-string/jumbo v11, "usercode"

    move-object/from16 v0, v68

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, v46

    invoke-interface {v0, v3, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 3531
    const-string/jumbo v3, "apihost"

    move-object/from16 v0, v46

    invoke-interface {v0, v3, v14}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1

    .line 3533
    const/16 v45, 0x0

    .line 3535
    .local v45, "ebag":Lorg/json/JSONObject;
    :try_start_7
    const-string/jumbo v3, "ebag"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v45

    .line 3537
    if-eqz v45, :cond_6

    const-string/jumbo v3, "updatetime"

    const-string/jumbo v11, ""

    move-object/from16 v0, v61

    invoke-interface {v0, v3, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v11, "updatetime"

    move-object/from16 v0, v45

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 3538
    const-string/jumbo v3, "liu"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string/jumbo v70, "save time:"

    move-object/from16 v0, v70

    invoke-direct {v11, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v70, "updatetime"

    const-string/jumbo v71, ""

    move-object/from16 v0, v61

    move-object/from16 v1, v70

    move-object/from16 v2, v71

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v70

    move-object/from16 v0, v70

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v3, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3539
    const-string/jumbo v3, "liu"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string/jumbo v70, "request time:"

    move-object/from16 v0, v70

    invoke-direct {v11, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v70, "updatetime"

    move-object/from16 v0, v45

    move-object/from16 v1, v70

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v70

    move-object/from16 v0, v70

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v3, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3540
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isUpdate:Z

    .line 3541
    const-string/jumbo v3, "updatetime"

    const-string/jumbo v11, "updatetime"

    move-object/from16 v0, v45

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, v46

    invoke-interface {v0, v3, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_1

    .line 3547
    :cond_6
    :goto_4
    :try_start_8
    const-string/jumbo v3, "userid"

    move-object/from16 v0, v46

    move-object/from16 v1, v27

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 3548
    invoke-interface/range {v46 .. v46}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 3550
    const-string/jumbo v15, ""

    .line 3551
    .local v15, "domain":Ljava/lang/String;
    const-string/jumbo v16, ""

    .line 3552
    .local v16, "port":Ljava/lang/String;
    const-string/jumbo v17, ""
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_1

    .line 3554
    .local v17, "tigase_ip":Ljava/lang/String;
    :try_start_9
    const-string/jumbo v3, "tigase"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v65

    .line 3555
    .local v65, "tigase":Lorg/json/JSONObject;
    const-string/jumbo v15, ""

    .line 3556
    const-string/jumbo v16, ""
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_1

    .line 3558
    :try_start_a
    const-string/jumbo v3, "domain"

    move-object/from16 v0, v65

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_1

    move-result-object v15

    .line 3564
    :goto_5
    :try_start_b
    const-string/jumbo v3, "port"

    move-object/from16 v0, v65

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_1

    move-result-object v16

    .line 3570
    :goto_6
    :try_start_c
    const-string/jumbo v3, "ip"

    move-object/from16 v0, v65

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_6
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_1

    move-result-object v17

    .line 3579
    .end local v65    # "tigase":Lorg/json/JSONObject;
    :goto_7
    :try_start_d
    const-string/jumbo v18, ""

    .line 3580
    .local v18, "mongo_domain":Ljava/lang/String;
    const-string/jumbo v19, ""

    .line 3581
    .local v19, "mongo_port":Ljava/lang/String;
    const-string/jumbo v20, ""

    .line 3582
    .local v20, "mongo_user":Ljava/lang/String;
    const-string/jumbo v21, ""
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_1

    .line 3584
    .local v21, "mongo_pwd":Ljava/lang/String;
    :try_start_e
    const-string/jumbo v3, "mongo"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v53

    .line 3585
    .local v53, "mongo":Lorg/json/JSONObject;
    const-string/jumbo v18, ""

    .line 3586
    const-string/jumbo v19, ""

    .line 3587
    const-string/jumbo v20, ""

    .line 3588
    const-string/jumbo v21, ""
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_8
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_1

    .line 3590
    :try_start_f
    const-string/jumbo v3, "domain"

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_7
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_1

    move-result-object v18

    .line 3596
    :goto_8
    :try_start_10
    const-string/jumbo v3, "port"

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_9
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_1

    move-result-object v19

    .line 3602
    :goto_9
    :try_start_11
    const-string/jumbo v3, "user"

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_a
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_1

    move-result-object v20

    .line 3608
    :goto_a
    :try_start_12
    const-string/jumbo v3, "pwd"

    move-object/from16 v0, v53

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_b
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_12} :catch_1

    move-result-object v21

    .line 3617
    .end local v53    # "mongo":Lorg/json/JSONObject;
    :goto_b
    :try_start_13
    const-string/jumbo v22, ""

    .line 3618
    .local v22, "type":Ljava/lang/String;
    const-string/jumbo v23, ""

    .line 3619
    .local v23, "schoolid":Ljava/lang/String;
    const-string/jumbo v24, ""

    .line 3620
    .local v24, "schoolname":Ljava/lang/String;
    const-string/jumbo v26, ""

    .line 3621
    .local v26, "usercode":Ljava/lang/String;
    const-string/jumbo v29, ""
    :try_end_13
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_13} :catch_1

    .line 3623
    .local v29, "username":Ljava/lang/String;
    :try_start_14
    const-string/jumbo v3, "user"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_e
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_1

    move-result-object v69

    .line 3625
    .local v69, "user_json":Lorg/json/JSONObject;
    :try_start_15
    const-string/jumbo v3, "type"

    move-object/from16 v0, v69

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_d
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_15} :catch_1

    move-result-object v35

    .line 3627
    .local v35, "Type":Ljava/lang/String;
    :try_start_16
    const-string/jumbo v3, "02"

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 3628
    const-string/jumbo v22, "0"
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_c
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_16} :catch_1

    .line 3653
    .end local v35    # "Type":Ljava/lang/String;
    :goto_c
    :try_start_17
    const-string/jumbo v3, "school"

    move-object/from16 v0, v69

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_11
    .catch Lorg/json/JSONException; {:try_start_17 .. :try_end_17} :catch_1

    move-result-object v60

    .line 3657
    .local v60, "school_json":Lorg/json/JSONArray;
    const/4 v3, 0x0

    :try_start_18
    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_10
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_18} :catch_1

    move-result-object v59

    .line 3659
    .local v59, "school_item":Lorg/json/JSONObject;
    :try_start_19
    const-string/jumbo v3, "id"

    move-object/from16 v0, v59

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 3660
    const-string/jumbo v3, "privatekey"

    .line 3661
    const/4 v11, 0x0

    .line 3660
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v11}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v62

    .line 3662
    .local v62, "sharePre2":Landroid/content/SharedPreferences;
    invoke-interface/range {v62 .. v62}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v47

    .line 3663
    .local v47, "editor2":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v3, "schoolid"

    move-object/from16 v0, v47

    move-object/from16 v1, v23

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 3664
    invoke-interface/range {v47 .. v47}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_f
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_19} :catch_1

    .line 3670
    .end local v47    # "editor2":Landroid/content/SharedPreferences$Editor;
    .end local v62    # "sharePre2":Landroid/content/SharedPreferences;
    :goto_d
    :try_start_1a
    const-string/jumbo v3, "name"

    move-object/from16 v0, v59

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_12
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_1a} :catch_1

    move-result-object v24

    .line 3685
    .end local v59    # "school_item":Lorg/json/JSONObject;
    .end local v60    # "school_json":Lorg/json/JSONArray;
    :goto_e
    :try_start_1b
    const-string/jumbo v3, "usercode"

    move-object/from16 v0, v69

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_13
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_1b} :catch_1

    move-result-object v26

    .line 3691
    :goto_f
    :try_start_1c
    const-string/jumbo v3, "name"

    move-object/from16 v0, v69

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 3692
    move-object/from16 v0, v29

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->stu_name:Ljava/lang/String;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_14
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_1c} :catch_1

    .line 3702
    .end local v69    # "user_json":Lorg/json/JSONObject;
    :goto_10
    :try_start_1d
    const-string/jumbo v57, ""

    .line 3703
    .local v57, "owncloud_scheme":Ljava/lang/String;
    const-string/jumbo v55, ""

    .line 3704
    .local v55, "owncloud_domain":Ljava/lang/String;
    const-string/jumbo v56, ""
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_1d} :catch_1

    .line 3706
    .local v56, "owncloud_port":Ljava/lang/String;
    :try_start_1e
    const-string/jumbo v3, "cloud"

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v38

    .line 3708
    .local v38, "cloud":Lorg/json/JSONObject;
    const-string/jumbo v57, ""

    .line 3709
    const-string/jumbo v55, ""

    .line 3710
    const-string/jumbo v56, ""
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_16
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_1e} :catch_1

    .line 3712
    :try_start_1f
    const-string/jumbo v3, "scheme"

    move-object/from16 v0, v38

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_15
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_1f} :catch_1

    move-result-object v57

    .line 3718
    :goto_11
    :try_start_20
    const-string/jumbo v3, "domain"

    move-object/from16 v0, v38

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_17
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_20} :catch_1

    move-result-object v55

    .line 3724
    :goto_12
    :try_start_21
    const-string/jumbo v3, "port"

    move-object/from16 v0, v38

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_18
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_21} :catch_1

    move-result-object v56

    .line 3734
    .end local v38    # "cloud":Lorg/json/JSONObject;
    :goto_13
    const/16 v30, 0x0

    .line 3735
    .local v30, "guidelearndownload":Ljava/lang/String;
    const/16 v31, 0x0

    .line 3736
    .local v31, "wifi":Ljava/lang/String;
    const/16 v32, 0x0

    .line 3737
    .local v32, "setting":Ljava/lang/String;
    const/16 v52, 0x0

    .line 3738
    .local v52, "large":Ljava/lang/String;
    const/16 v54, 0x0

    .line 3739
    .local v54, "normal":Ljava/lang/String;
    const/16 v63, 0x0

    .line 3740
    .local v63, "small":Ljava/lang/String;
    :try_start_22
    new-instance v33, Ljava/util/ArrayList;

    invoke-direct/range {v33 .. v33}, Ljava/util/ArrayList;-><init>()V
    :try_end_22
    .catch Lorg/json/JSONException; {:try_start_22 .. :try_end_22} :catch_1

    .line 3742
    .local v33, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    :try_start_23
    const-string/jumbo v3, "desktopicon"

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v41

    .line 3743
    .local v41, "desktopicon":Lorg/json/JSONObject;
    const-string/jumbo v3, "wifi"

    move-object/from16 v0, v41

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 3744
    const-string/jumbo v3, "setting"

    move-object/from16 v0, v41

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 3745
    const-string/jumbo v3, "background"

    move-object/from16 v0, v41

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v37

    .line 3746
    .local v37, "background":Lorg/json/JSONObject;
    const-string/jumbo v3, "large"

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v52

    .line 3747
    const-string/jumbo v3, "normal"

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    .line 3748
    const-string/jumbo v3, "small"

    move-object/from16 v0, v37

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v63

    .line 3750
    const-string/jumbo v3, "app"

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v36

    .line 3751
    .local v36, "app":Lorg/json/JSONArray;
    const/16 v50, 0x0

    .local v50, "i":I
    :goto_14
    invoke-virtual/range {v36 .. v36}, Lorg/json/JSONArray;->length()I
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_1a
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_23} :catch_1

    move-result v3

    move/from16 v0, v50

    if-lt v0, v3, :cond_a

    .line 3779
    .end local v36    # "app":Lorg/json/JSONArray;
    .end local v37    # "background":Lorg/json/JSONObject;
    .end local v41    # "desktopicon":Lorg/json/JSONObject;
    .end local v50    # "i":I
    :goto_15
    if-eqz v56, :cond_b

    .line 3780
    :try_start_24
    const-string/jumbo v3, ""

    move-object/from16 v0, v56

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    .line 3781
    const-string/jumbo v3, "80"

    move-object/from16 v0, v56

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    move-object/from16 v25, v55

    .local v25, "owncloudip":Ljava/lang/String;
    :goto_16
    move-object/from16 v11, p0

    .line 3785
    invoke-direct/range {v11 .. v34}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->writeXml_config(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 3791
    new-instance v67, Ljava/util/ArrayList;

    invoke-direct/range {v67 .. v67}, Ljava/util/ArrayList;-><init>()V

    .line 3792
    .local v67, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, v67

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3793
    move-object/from16 v0, v67

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3794
    move-object/from16 v0, v67

    move-object/from16 v1, v52

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3795
    move-object/from16 v0, v67

    move-object/from16 v1, v54

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3796
    move-object/from16 v0, v67

    move-object/from16 v1, v63

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3797
    const/16 v50, 0x0

    .restart local v50    # "i":I
    :goto_17
    invoke-virtual/range {v33 .. v33}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v50

    if-lt v0, v3, :cond_c

    .line 3800
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 3543
    .end local v15    # "domain":Ljava/lang/String;
    .end local v16    # "port":Ljava/lang/String;
    .end local v17    # "tigase_ip":Ljava/lang/String;
    .end local v18    # "mongo_domain":Ljava/lang/String;
    .end local v19    # "mongo_port":Ljava/lang/String;
    .end local v20    # "mongo_user":Ljava/lang/String;
    .end local v21    # "mongo_pwd":Ljava/lang/String;
    .end local v22    # "type":Ljava/lang/String;
    .end local v23    # "schoolid":Ljava/lang/String;
    .end local v24    # "schoolname":Ljava/lang/String;
    .end local v25    # "owncloudip":Ljava/lang/String;
    .end local v26    # "usercode":Ljava/lang/String;
    .end local v29    # "username":Ljava/lang/String;
    .end local v30    # "guidelearndownload":Ljava/lang/String;
    .end local v31    # "wifi":Ljava/lang/String;
    .end local v32    # "setting":Ljava/lang/String;
    .end local v33    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    .end local v50    # "i":I
    .end local v52    # "large":Ljava/lang/String;
    .end local v54    # "normal":Ljava/lang/String;
    .end local v55    # "owncloud_domain":Ljava/lang/String;
    .end local v56    # "owncloud_port":Ljava/lang/String;
    .end local v57    # "owncloud_scheme":Ljava/lang/String;
    .end local v63    # "small":Ljava/lang/String;
    .end local v67    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_2
    move-exception v44

    .line 3545
    .local v44, "e1":Ljava/lang/Exception;
    invoke-virtual/range {v44 .. v44}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_24
    .catch Lorg/json/JSONException; {:try_start_24 .. :try_end_24} :catch_1

    goto/16 :goto_4

    .line 3559
    .end local v44    # "e1":Ljava/lang/Exception;
    .restart local v15    # "domain":Ljava/lang/String;
    .restart local v16    # "port":Ljava/lang/String;
    .restart local v17    # "tigase_ip":Ljava/lang/String;
    .restart local v65    # "tigase":Lorg/json/JSONObject;
    :catch_3
    move-exception v43

    .line 3561
    .local v43, "e":Ljava/lang/Exception;
    :try_start_25
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_4
    .catch Lorg/json/JSONException; {:try_start_25 .. :try_end_25} :catch_1

    goto/16 :goto_5

    .line 3575
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v65    # "tigase":Lorg/json/JSONObject;
    :catch_4
    move-exception v43

    .line 3577
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_26
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_26
    .catch Lorg/json/JSONException; {:try_start_26 .. :try_end_26} :catch_1

    goto/16 :goto_7

    .line 3565
    .end local v43    # "e":Ljava/lang/Exception;
    .restart local v65    # "tigase":Lorg/json/JSONObject;
    :catch_5
    move-exception v43

    .line 3567
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_27
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_6

    .line 3571
    .end local v43    # "e":Ljava/lang/Exception;
    :catch_6
    move-exception v43

    .line 3573
    .restart local v43    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_4
    .catch Lorg/json/JSONException; {:try_start_27 .. :try_end_27} :catch_1

    goto/16 :goto_7

    .line 3591
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v65    # "tigase":Lorg/json/JSONObject;
    .restart local v18    # "mongo_domain":Ljava/lang/String;
    .restart local v19    # "mongo_port":Ljava/lang/String;
    .restart local v20    # "mongo_user":Ljava/lang/String;
    .restart local v21    # "mongo_pwd":Ljava/lang/String;
    .restart local v53    # "mongo":Lorg/json/JSONObject;
    :catch_7
    move-exception v43

    .line 3593
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_28
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_8
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_28} :catch_1

    goto/16 :goto_8

    .line 3613
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v53    # "mongo":Lorg/json/JSONObject;
    :catch_8
    move-exception v43

    .line 3615
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_29
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_29
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_29} :catch_1

    goto/16 :goto_b

    .line 3597
    .end local v43    # "e":Ljava/lang/Exception;
    .restart local v53    # "mongo":Lorg/json/JSONObject;
    :catch_9
    move-exception v43

    .line 3599
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_2a
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_9

    .line 3603
    .end local v43    # "e":Ljava/lang/Exception;
    :catch_a
    move-exception v43

    .line 3605
    .restart local v43    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_a

    .line 3609
    .end local v43    # "e":Ljava/lang/Exception;
    :catch_b
    move-exception v43

    .line 3611
    .restart local v43    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_8
    .catch Lorg/json/JSONException; {:try_start_2a .. :try_end_2a} :catch_1

    goto/16 :goto_b

    .line 3629
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v53    # "mongo":Lorg/json/JSONObject;
    .restart local v22    # "type":Ljava/lang/String;
    .restart local v23    # "schoolid":Ljava/lang/String;
    .restart local v24    # "schoolname":Ljava/lang/String;
    .restart local v26    # "usercode":Ljava/lang/String;
    .restart local v29    # "username":Ljava/lang/String;
    .restart local v35    # "Type":Ljava/lang/String;
    .restart local v69    # "user_json":Lorg/json/JSONObject;
    :cond_7
    :try_start_2b
    const-string/jumbo v3, "03"

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 3630
    const-string/jumbo v22, "2"

    .line 3631
    goto/16 :goto_c

    :cond_8
    const-string/jumbo v3, "05"

    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 3632
    const-string/jumbo v22, "1"

    .line 3633
    goto/16 :goto_c

    .line 3634
    :cond_9
    const-string/jumbo v22, "7"
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2b} :catch_c
    .catch Lorg/json/JSONException; {:try_start_2b .. :try_end_2b} :catch_1

    goto/16 :goto_c

    .line 3636
    :catch_c
    move-exception v43

    .line 3638
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_2c
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V

    .line 3639
    const-string/jumbo v22, "2"
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_d
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_2c} :catch_1

    goto/16 :goto_c

    .line 3641
    .end local v35    # "Type":Ljava/lang/String;
    .end local v43    # "e":Ljava/lang/Exception;
    :catch_d
    move-exception v43

    .line 3643
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_2d
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V

    .line 3644
    const-string/jumbo v22, "7"

    .line 3646
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    .line 3647
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    .line 3648
    const v70, 0x7f0801e1

    .line 3647
    move/from16 v0, v70

    invoke-virtual {v11, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 3649
    const/16 v70, 0x0

    .line 3645
    move/from16 v0, v70

    invoke-static {v3, v11, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    .line 3649
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_2d} :catch_e
    .catch Lorg/json/JSONException; {:try_start_2d .. :try_end_2d} :catch_1

    goto/16 :goto_c

    .line 3697
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v69    # "user_json":Lorg/json/JSONObject;
    :catch_e
    move-exception v43

    .line 3699
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_2e
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2e
    .catch Lorg/json/JSONException; {:try_start_2e .. :try_end_2e} :catch_1

    goto/16 :goto_10

    .line 3665
    .end local v43    # "e":Ljava/lang/Exception;
    .restart local v59    # "school_item":Lorg/json/JSONObject;
    .restart local v60    # "school_json":Lorg/json/JSONArray;
    .restart local v69    # "user_json":Lorg/json/JSONObject;
    :catch_f
    move-exception v43

    .line 3667
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_2f
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_2f} :catch_10
    .catch Lorg/json/JSONException; {:try_start_2f .. :try_end_2f} :catch_1

    goto/16 :goto_d

    .line 3675
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v59    # "school_item":Lorg/json/JSONObject;
    :catch_10
    move-exception v43

    .line 3677
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_30
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_30} :catch_11
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_30} :catch_1

    goto/16 :goto_e

    .line 3679
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v60    # "school_json":Lorg/json/JSONArray;
    :catch_11
    move-exception v43

    .line 3681
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_31
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_31} :catch_e
    .catch Lorg/json/JSONException; {:try_start_31 .. :try_end_31} :catch_1

    goto/16 :goto_e

    .line 3671
    .end local v43    # "e":Ljava/lang/Exception;
    .restart local v59    # "school_item":Lorg/json/JSONObject;
    .restart local v60    # "school_json":Lorg/json/JSONArray;
    :catch_12
    move-exception v43

    .line 3673
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_32
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_32} :catch_10
    .catch Lorg/json/JSONException; {:try_start_32 .. :try_end_32} :catch_1

    goto/16 :goto_e

    .line 3686
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v59    # "school_item":Lorg/json/JSONObject;
    .end local v60    # "school_json":Lorg/json/JSONArray;
    :catch_13
    move-exception v43

    .line 3688
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_33
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_f

    .line 3693
    .end local v43    # "e":Ljava/lang/Exception;
    :catch_14
    move-exception v43

    .line 3695
    .restart local v43    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_33} :catch_e
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_33} :catch_1

    goto/16 :goto_10

    .line 3713
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v69    # "user_json":Lorg/json/JSONObject;
    .restart local v38    # "cloud":Lorg/json/JSONObject;
    .restart local v55    # "owncloud_domain":Ljava/lang/String;
    .restart local v56    # "owncloud_port":Ljava/lang/String;
    .restart local v57    # "owncloud_scheme":Ljava/lang/String;
    :catch_15
    move-exception v43

    .line 3715
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_34
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_34} :catch_16
    .catch Lorg/json/JSONException; {:try_start_34 .. :try_end_34} :catch_1

    goto/16 :goto_11

    .line 3729
    .end local v38    # "cloud":Lorg/json/JSONObject;
    .end local v43    # "e":Ljava/lang/Exception;
    :catch_16
    move-exception v43

    .line 3731
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_35
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_35
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_35} :catch_1

    goto/16 :goto_13

    .line 3719
    .end local v43    # "e":Ljava/lang/Exception;
    .restart local v38    # "cloud":Lorg/json/JSONObject;
    :catch_17
    move-exception v43

    .line 3721
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_36
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_12

    .line 3725
    .end local v43    # "e":Ljava/lang/Exception;
    :catch_18
    move-exception v43

    .line 3727
    .restart local v43    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_36} :catch_16
    .catch Lorg/json/JSONException; {:try_start_36 .. :try_end_36} :catch_1

    goto/16 :goto_13

    .line 3752
    .end local v38    # "cloud":Lorg/json/JSONObject;
    .end local v43    # "e":Ljava/lang/Exception;
    .restart local v30    # "guidelearndownload":Ljava/lang/String;
    .restart local v31    # "wifi":Ljava/lang/String;
    .restart local v32    # "setting":Ljava/lang/String;
    .restart local v33    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    .restart local v36    # "app":Lorg/json/JSONArray;
    .restart local v37    # "background":Lorg/json/JSONObject;
    .restart local v41    # "desktopicon":Lorg/json/JSONObject;
    .restart local v50    # "i":I
    .restart local v52    # "large":Ljava/lang/String;
    .restart local v54    # "normal":Ljava/lang/String;
    .restart local v63    # "small":Ljava/lang/String;
    :cond_a
    :try_start_37
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 3753
    .local v9, "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, v36

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v11, "code"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 3754
    .local v4, "code":Ljava/lang/String;
    move-object/from16 v0, v36

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v11, "name"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 3755
    .local v5, "name":Ljava/lang/String;
    move-object/from16 v0, v36

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v11, "color"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3756
    .local v6, "color":Ljava/lang/String;
    move-object/from16 v0, v36

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v11, "icon"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 3757
    .local v7, "icon":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v11, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, "/"

    invoke-virtual {v7, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v7, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 3758
    .local v10, "iconLocal":Ljava/lang/String;
    move-object/from16 v0, v36

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v11, "enable"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_37} :catch_1a
    .catch Lorg/json/JSONException; {:try_start_37 .. :try_end_37} :catch_1

    move-result v8

    .line 3760
    .local v8, "enable":I
    :try_start_38
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v0, v36

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    const-string/jumbo v70, "config"

    move-object/from16 v0, v70

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string/jumbo v70, "comment"

    move-object/from16 v0, v70

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v39

    .line 3761
    .local v39, "comment":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v0, v36

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    const-string/jumbo v70, "config"

    move-object/from16 v0, v70

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string/jumbo v70, "download"

    move-object/from16 v0, v70

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    .line 3762
    .local v42, "download":Ljava/lang/String;
    const-string/jumbo v3, "comment"

    move-object/from16 v0, v39

    invoke-virtual {v9, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3763
    const-string/jumbo v3, "download"

    move-object/from16 v0, v42

    invoke-virtual {v9, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_38} :catch_19
    .catch Lorg/json/JSONException; {:try_start_38 .. :try_end_38} :catch_1

    .line 3770
    .end local v39    # "comment":Ljava/lang/String;
    .end local v42    # "download":Ljava/lang/String;
    :goto_18
    :try_start_39
    new-instance v3, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-direct/range {v3 .. v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    move-object/from16 v0, v33

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3751
    add-int/lit8 v50, v50, 0x1

    goto/16 :goto_14

    .line 3764
    :catch_19
    move-exception v43

    .line 3766
    .restart local v43    # "e":Ljava/lang/Exception;
    const-string/jumbo v3, "comment"

    const-string/jumbo v11, "-1"

    invoke-virtual {v9, v3, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3767
    const-string/jumbo v3, "download"

    const-string/jumbo v11, "-1"

    invoke-virtual {v9, v3, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3768
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_39} :catch_1a
    .catch Lorg/json/JSONException; {:try_start_39 .. :try_end_39} :catch_1

    goto :goto_18

    .line 3772
    .end local v4    # "code":Ljava/lang/String;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "color":Ljava/lang/String;
    .end local v7    # "icon":Ljava/lang/String;
    .end local v8    # "enable":I
    .end local v9    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "iconLocal":Ljava/lang/String;
    .end local v36    # "app":Lorg/json/JSONArray;
    .end local v37    # "background":Lorg/json/JSONObject;
    .end local v41    # "desktopicon":Lorg/json/JSONObject;
    .end local v43    # "e":Ljava/lang/Exception;
    .end local v50    # "i":I
    :catch_1a
    move-exception v43

    .line 3774
    .restart local v43    # "e":Ljava/lang/Exception;
    :try_start_3a
    invoke-virtual/range {v43 .. v43}, Ljava/lang/Exception;->printStackTrace()V

    .line 3775
    const-string/jumbo v3, "liu"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string/jumbo v70, "Exception :"

    move-object/from16 v0, v70

    invoke-direct {v11, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v43

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v3, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_15

    .line 3781
    .end local v43    # "e":Ljava/lang/Exception;
    :cond_b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {v55 .. v55}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3782
    const-string/jumbo v11, ":"

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v56

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    goto/16 :goto_16

    .line 3798
    .restart local v25    # "owncloudip":Ljava/lang/String;
    .restart local v50    # "i":I
    .restart local v67    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_c
    move-object/from16 v0, v33

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIcon()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3a
    .catch Lorg/json/JSONException; {:try_start_3a .. :try_end_3a} :catch_1

    .line 3797
    add-int/lit8 v50, v50, 0x1

    goto/16 :goto_17

    .line 3803
    .end local v12    # "privatekey":Ljava/lang/String;
    .end local v13    # "encrypt":Ljava/lang/String;
    .end local v14    # "apihost":Ljava/lang/String;
    .end local v15    # "domain":Ljava/lang/String;
    .end local v16    # "port":Ljava/lang/String;
    .end local v17    # "tigase_ip":Ljava/lang/String;
    .end local v18    # "mongo_domain":Ljava/lang/String;
    .end local v19    # "mongo_port":Ljava/lang/String;
    .end local v20    # "mongo_user":Ljava/lang/String;
    .end local v21    # "mongo_pwd":Ljava/lang/String;
    .end local v22    # "type":Ljava/lang/String;
    .end local v23    # "schoolid":Ljava/lang/String;
    .end local v24    # "schoolname":Ljava/lang/String;
    .end local v25    # "owncloudip":Ljava/lang/String;
    .end local v26    # "usercode":Ljava/lang/String;
    .end local v27    # "userid":Ljava/lang/String;
    .end local v29    # "username":Ljava/lang/String;
    .end local v30    # "guidelearndownload":Ljava/lang/String;
    .end local v31    # "wifi":Ljava/lang/String;
    .end local v32    # "setting":Ljava/lang/String;
    .end local v33    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    .end local v45    # "ebag":Lorg/json/JSONObject;
    .end local v46    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v50    # "i":I
    .end local v52    # "large":Ljava/lang/String;
    .end local v54    # "normal":Ljava/lang/String;
    .end local v55    # "owncloud_domain":Ljava/lang/String;
    .end local v56    # "owncloud_port":Ljava/lang/String;
    .end local v57    # "owncloud_scheme":Ljava/lang/String;
    .end local v58    # "pubkey":Ljava/lang/String;
    .end local v61    # "sharePre":Landroid/content/SharedPreferences;
    .end local v63    # "small":Ljava/lang/String;
    .end local v66    # "type_user":Ljava/lang/String;
    .end local v67    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v68    # "user":Lorg/json/JSONObject;
    :cond_d
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 3504
    .restart local v12    # "privatekey":Ljava/lang/String;
    .restart local v13    # "encrypt":Ljava/lang/String;
    .restart local v14    # "apihost":Ljava/lang/String;
    :catch_1b
    move-exception v3

    goto/16 :goto_2

    .line 3499
    :catch_1c
    move-exception v3

    goto/16 :goto_1
.end method

.method private nameHistoryAdd(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 17
    .param p1, "addName"    # Ljava/lang/String;
    .param p2, "ipHistory"    # Ljava/lang/String;
    .param p3, "addCode"    # Ljava/lang/String;
    .param p4, "preArray"    # Lorg/json/JSONArray;

    .prologue
    .line 4671
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 4672
    .local v3, "afterAddArray":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .line 4673
    .local v1, "addObject":Lorg/json/JSONObject;
    if-eqz p3, :cond_0

    if-nez p2, :cond_2

    :cond_0
    move-object/from16 v3, p4

    .line 4749
    .end local v3    # "afterAddArray":Lorg/json/JSONArray;
    :cond_1
    :goto_0
    return-object v3

    .line 4677
    .restart local v3    # "afterAddArray":Lorg/json/JSONArray;
    :cond_2
    const/4 v5, 0x0

    .line 4678
    .local v5, "has":Z
    if-eqz p4, :cond_3

    invoke-virtual/range {p4 .. p4}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ltz v14, :cond_3

    .line 4680
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual/range {p4 .. p4}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lt v6, v14, :cond_5

    .end local v6    # "i":I
    :cond_3
    move-object v2, v1

    .line 4723
    .end local v1    # "addObject":Lorg/json/JSONObject;
    .local v2, "addObject":Lorg/json/JSONObject;
    if-nez v2, :cond_b

    if-nez v5, :cond_b

    .line 4725
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 4726
    .local v9, "nameArrays":Lorg/json/JSONArray;
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 4728
    .local v13, "temp":Lorg/json/JSONObject;
    :try_start_0
    const-string/jumbo v14, "code"

    move-object/from16 v0, p3

    invoke-virtual {v13, v14, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4729
    const-string/jumbo v14, "name"

    move-object/from16 v0, p1

    invoke-virtual {v13, v14, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4730
    invoke-virtual {v9, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 4731
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 4732
    .end local v2    # "addObject":Lorg/json/JSONObject;
    .restart local v1    # "addObject":Lorg/json/JSONObject;
    :try_start_1
    const-string/jumbo v14, "ip"

    move-object/from16 v0, p2

    invoke-virtual {v1, v14, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4733
    const-string/jumbo v14, "students"

    invoke-virtual {v1, v14, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 4739
    .end local v9    # "nameArrays":Lorg/json/JSONArray;
    .end local v13    # "temp":Lorg/json/JSONObject;
    :goto_2
    if-eqz v1, :cond_4

    .line 4741
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 4743
    :cond_4
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lez v14, :cond_1

    .line 4745
    const-string/jumbo v14, "loginhistory"

    const/4 v15, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 4746
    .local v10, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v14

    const-string/jumbo v15, "namehistorystring"

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-interface/range {v14 .. v16}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v14

    invoke-interface {v14}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    .line 4683
    .end local v10    # "sp":Landroid/content/SharedPreferences;
    .restart local v6    # "i":I
    :cond_5
    :try_start_2
    move-object/from16 v0, p4

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 4684
    .local v8, "jObject":Lorg/json/JSONObject;
    const/4 v9, 0x0

    .line 4685
    .restart local v9    # "nameArrays":Lorg/json/JSONArray;
    const/4 v11, 0x0

    .line 4686
    .local v11, "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v14, "ip"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_7

    .line 4688
    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 4680
    .end local v8    # "jObject":Lorg/json/JSONObject;
    .end local v9    # "nameArrays":Lorg/json/JSONArray;
    .end local v11    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_6
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 4691
    .restart local v8    # "jObject":Lorg/json/JSONObject;
    .restart local v9    # "nameArrays":Lorg/json/JSONArray;
    .restart local v11    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_7
    const-string/jumbo v14, "ip"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_8

    const-string/jumbo v14, "ip"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    const-string/jumbo v14, "students"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 4693
    const-string/jumbo v14, "students"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 4695
    :cond_8
    if-eqz v9, :cond_6

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lez v14, :cond_6

    .line 4697
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_4
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lt v7, v14, :cond_9

    .line 4706
    :goto_5
    if-nez v5, :cond_6

    .line 4708
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 4709
    .restart local v13    # "temp":Lorg/json/JSONObject;
    const-string/jumbo v14, "code"

    move-object/from16 v0, p3

    invoke-virtual {v13, v14, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4710
    const-string/jumbo v14, "name"

    move-object/from16 v0, p1

    invoke-virtual {v13, v14, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4711
    invoke-virtual {v9, v13}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 4712
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 4713
    .end local v1    # "addObject":Lorg/json/JSONObject;
    .restart local v2    # "addObject":Lorg/json/JSONObject;
    :try_start_3
    const-string/jumbo v14, "ip"

    move-object/from16 v0, p2

    invoke-virtual {v2, v14, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4714
    const-string/jumbo v14, "students"

    invoke-virtual {v2, v14, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    move-object v1, v2

    .line 4717
    .end local v2    # "addObject":Lorg/json/JSONObject;
    .restart local v1    # "addObject":Lorg/json/JSONObject;
    goto :goto_3

    .line 4699
    .end local v13    # "temp":Lorg/json/JSONObject;
    :cond_9
    :try_start_4
    invoke-virtual {v9, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    .line 4700
    .local v12, "stuObject":Lorg/json/JSONObject;
    if-eqz v12, :cond_a

    const-string/jumbo v14, "code"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_a

    const-string/jumbo v14, "code"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p3

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    move-result v14

    if-eqz v14, :cond_a

    .line 4702
    const/4 v5, 0x1

    .line 4703
    goto :goto_5

    .line 4697
    :cond_a
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 4717
    .end local v7    # "j":I
    .end local v8    # "jObject":Lorg/json/JSONObject;
    .end local v9    # "nameArrays":Lorg/json/JSONArray;
    .end local v11    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v12    # "stuObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v4

    .line 4719
    .local v4, "e":Lorg/json/JSONException;
    :goto_6
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_3

    .line 4734
    .end local v1    # "addObject":Lorg/json/JSONObject;
    .end local v4    # "e":Lorg/json/JSONException;
    .end local v6    # "i":I
    .restart local v2    # "addObject":Lorg/json/JSONObject;
    .restart local v9    # "nameArrays":Lorg/json/JSONArray;
    .restart local v13    # "temp":Lorg/json/JSONObject;
    :catch_1
    move-exception v4

    move-object v1, v2

    .line 4736
    .end local v2    # "addObject":Lorg/json/JSONObject;
    .restart local v1    # "addObject":Lorg/json/JSONObject;
    .restart local v4    # "e":Lorg/json/JSONException;
    :goto_7
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_2

    .line 4734
    .end local v4    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v4

    goto :goto_7

    .line 4717
    .end local v1    # "addObject":Lorg/json/JSONObject;
    .restart local v2    # "addObject":Lorg/json/JSONObject;
    .restart local v6    # "i":I
    .restart local v7    # "j":I
    .restart local v8    # "jObject":Lorg/json/JSONObject;
    .restart local v11    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_3
    move-exception v4

    move-object v1, v2

    .end local v2    # "addObject":Lorg/json/JSONObject;
    .restart local v1    # "addObject":Lorg/json/JSONObject;
    goto :goto_6

    .end local v1    # "addObject":Lorg/json/JSONObject;
    .end local v6    # "i":I
    .end local v7    # "j":I
    .end local v8    # "jObject":Lorg/json/JSONObject;
    .end local v9    # "nameArrays":Lorg/json/JSONArray;
    .end local v11    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v13    # "temp":Lorg/json/JSONObject;
    .restart local v2    # "addObject":Lorg/json/JSONObject;
    :cond_b
    move-object v1, v2

    .end local v2    # "addObject":Lorg/json/JSONObject;
    .restart local v1    # "addObject":Lorg/json/JSONObject;
    goto/16 :goto_2
.end method

.method private nameHistoryDelete(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 16
    .param p1, "ipHistory"    # Ljava/lang/String;
    .param p2, "deleteCode"    # Ljava/lang/String;
    .param p3, "preArray"    # Lorg/json/JSONArray;

    .prologue
    .line 4762
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 4763
    .local v1, "afterAddArray":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .line 4764
    .local v6, "modifiedObject":Lorg/json/JSONObject;
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-gtz v13, :cond_2

    :cond_0
    move-object/from16 v1, p3

    .line 4816
    .end local v1    # "afterAddArray":Lorg/json/JSONArray;
    :cond_1
    :goto_0
    return-object v1

    .line 4768
    .restart local v1    # "afterAddArray":Lorg/json/JSONArray;
    :cond_2
    if-eqz p3, :cond_3

    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ltz v13, :cond_3

    .line 4770
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-lt v3, v13, :cond_4

    .line 4810
    .end local v3    # "i":I
    :cond_3
    if-eqz v1, :cond_1

    .line 4812
    const-string/jumbo v13, "loginhistory"

    const/4 v14, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    .line 4813
    .local v9, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v9}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    const-string/jumbo v14, "namehistorystring"

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    .line 4773
    .end local v9    # "sp":Landroid/content/SharedPreferences;
    .restart local v3    # "i":I
    :cond_4
    :try_start_0
    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 4774
    .local v5, "jObject":Lorg/json/JSONObject;
    const/4 v8, 0x0

    .line 4775
    .local v8, "nameArrays":Lorg/json/JSONArray;
    const/4 v10, 0x0

    .line 4776
    .local v10, "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v13, "ip"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_6

    .line 4778
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 4770
    .end local v5    # "jObject":Lorg/json/JSONObject;
    .end local v8    # "nameArrays":Lorg/json/JSONArray;
    .end local v10    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 4781
    .restart local v5    # "jObject":Lorg/json/JSONObject;
    .restart local v8    # "nameArrays":Lorg/json/JSONArray;
    .restart local v10    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_6
    const-string/jumbo v13, "ip"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_7

    const-string/jumbo v13, "ip"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7

    const-string/jumbo v13, "students"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 4783
    const-string/jumbo v13, "students"

    invoke-virtual {v5, v13}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 4785
    :cond_7
    if-eqz v8, :cond_5

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-lez v13, :cond_5

    .line 4787
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 4788
    .local v12, "tempArray":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_3
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-lt v4, v13, :cond_8

    .line 4799
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4800
    .end local v6    # "modifiedObject":Lorg/json/JSONObject;
    .local v7, "modifiedObject":Lorg/json/JSONObject;
    :try_start_1
    const-string/jumbo v13, "ip"

    move-object/from16 v0, p1

    invoke-virtual {v7, v13, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4801
    const-string/jumbo v13, "students"

    invoke-virtual {v7, v13, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4802
    invoke-virtual {v1, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v6, v7

    .line 4804
    .end local v7    # "modifiedObject":Lorg/json/JSONObject;
    .restart local v6    # "modifiedObject":Lorg/json/JSONObject;
    goto :goto_2

    .line 4790
    :cond_8
    :try_start_2
    invoke-virtual {v8, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    .line 4791
    .local v11, "stuObject":Lorg/json/JSONObject;
    if-eqz v11, :cond_9

    const-string/jumbo v13, "code"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 4793
    const-string/jumbo v13, "code"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_9

    .line 4795
    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 4788
    :cond_9
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 4804
    .end local v4    # "j":I
    .end local v5    # "jObject":Lorg/json/JSONObject;
    .end local v8    # "nameArrays":Lorg/json/JSONArray;
    .end local v10    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "stuObject":Lorg/json/JSONObject;
    .end local v12    # "tempArray":Lorg/json/JSONArray;
    :catch_0
    move-exception v2

    .line 4806
    .local v2, "e":Lorg/json/JSONException;
    :goto_4
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 4804
    .end local v2    # "e":Lorg/json/JSONException;
    .end local v6    # "modifiedObject":Lorg/json/JSONObject;
    .restart local v4    # "j":I
    .restart local v5    # "jObject":Lorg/json/JSONObject;
    .restart local v7    # "modifiedObject":Lorg/json/JSONObject;
    .restart local v8    # "nameArrays":Lorg/json/JSONArray;
    .restart local v10    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v12    # "tempArray":Lorg/json/JSONArray;
    :catch_1
    move-exception v2

    move-object v6, v7

    .end local v7    # "modifiedObject":Lorg/json/JSONObject;
    .restart local v6    # "modifiedObject":Lorg/json/JSONObject;
    goto :goto_4
.end method

.method private nameHistoryDeleteByIP(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 8
    .param p1, "ipHistory"    # Ljava/lang/String;
    .param p2, "preArray"    # Lorg/json/JSONArray;

    .prologue
    .line 4828
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4829
    .local v0, "afterAddArray":Lorg/json/JSONArray;
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-gtz v5, :cond_2

    :cond_0
    move-object v0, p2

    .line 4856
    .end local v0    # "afterAddArray":Lorg/json/JSONArray;
    :cond_1
    :goto_0
    return-object v0

    .line 4833
    .restart local v0    # "afterAddArray":Lorg/json/JSONArray;
    :cond_2
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ltz v5, :cond_3

    .line 4835
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lt v2, v5, :cond_4

    .line 4850
    .end local v2    # "i":I
    :cond_3
    if-eqz v0, :cond_1

    .line 4852
    const-string/jumbo v5, "loginhistory"

    const/4 v6, 0x4

    invoke-virtual {p0, v5, v6}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 4853
    .local v4, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string/jumbo v6, "namehistorystring"

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0

    .line 4838
    .end local v4    # "sp":Landroid/content/SharedPreferences;
    .restart local v2    # "i":I
    :cond_4
    :try_start_0
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 4839
    .local v3, "jObject":Lorg/json/JSONObject;
    const-string/jumbo v5, "ip"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 4841
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4835
    .end local v3    # "jObject":Lorg/json/JSONObject;
    :cond_5
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4844
    :catch_0
    move-exception v1

    .line 4846
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method

.method private nameHistoryParser()Lorg/json/JSONArray;
    .locals 7

    .prologue
    const/4 v4, 0x0

    .line 4591
    const-string/jumbo v5, "loginhistory"

    const/4 v6, 0x4

    invoke-virtual {p0, v5, v6}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 4592
    .local v3, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v5, "namehistorystring"

    invoke-interface {v3, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    move-object v1, v4

    .line 4609
    :goto_0
    return-object v1

    .line 4596
    :cond_0
    const-string/jumbo v5, "namehistorystring"

    const-string/jumbo v6, ""

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 4598
    .local v2, "namesString":Ljava/lang/String;
    if-eqz v2, :cond_1

    const-string/jumbo v5, ""

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_1
    move-object v1, v4

    .line 4600
    goto :goto_0

    .line 4603
    :cond_2
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4604
    .local v1, "jarray":Lorg/json/JSONArray;
    goto :goto_0

    .line 4605
    .end local v1    # "jarray":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 4607
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    move-object v1, v4

    .line 4609
    goto :goto_0
.end method

.method private nameHistoryQuery(Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 11
    .param p1, "ipHistory"    # Ljava/lang/String;
    .param p2, "arrays"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 4620
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 4621
    .local v7, "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-gtz v10, :cond_1

    .line 4657
    :cond_0
    return-object v7

    .line 4625
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v2, v10, :cond_0

    .line 4628
    :try_start_0
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 4629
    .local v4, "jObject":Lorg/json/JSONObject;
    const/4 v6, 0x0

    .line 4630
    .local v6, "nameArrays":Lorg/json/JSONArray;
    const/4 v8, 0x0

    .line 4631
    .local v8, "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v10, "ip"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string/jumbo v10, "ip"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string/jumbo v10, "students"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 4633
    const-string/jumbo v10, "students"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 4635
    :cond_2
    if-eqz v6, :cond_3

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lez v10, :cond_3

    .line 4637
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v3, v10, :cond_4

    .line 4625
    .end local v3    # "j":I
    .end local v4    # "jObject":Lorg/json/JSONObject;
    .end local v6    # "nameArrays":Lorg/json/JSONArray;
    .end local v8    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 4639
    .restart local v3    # "j":I
    .restart local v4    # "jObject":Lorg/json/JSONObject;
    .restart local v6    # "nameArrays":Lorg/json/JSONArray;
    .restart local v8    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    invoke-virtual {v6, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 4640
    .local v9, "stuObject":Lorg/json/JSONObject;
    if-eqz v9, :cond_5

    const-string/jumbo v10, "code"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    const-string/jumbo v10, "name"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 4642
    new-instance v8, Ljava/util/HashMap;

    .end local v8    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 4643
    .restart local v8    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v10, "code"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 4644
    .local v0, "code":Ljava/lang/String;
    const-string/jumbo v10, "name"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 4645
    .local v5, "name":Ljava/lang/String;
    const-string/jumbo v10, "code"

    invoke-virtual {v8, v10, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4646
    const-string/jumbo v10, "name"

    invoke-virtual {v8, v10, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4647
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4637
    .end local v0    # "code":Ljava/lang/String;
    .end local v5    # "name":Ljava/lang/String;
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 4651
    .end local v3    # "j":I
    .end local v4    # "jObject":Lorg/json/JSONObject;
    .end local v6    # "nameArrays":Lorg/json/JSONArray;
    .end local v8    # "stuInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "stuObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 4653
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method

.method private needPwdDialog()Z
    .locals 3

    .prologue
    .line 2248
    const/4 v0, 0x0

    .line 2249
    .local v0, "need":Z
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isXF:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 2251
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "10.70.12.27"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "202.107.231.160:8081"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2253
    :cond_0
    const/4 v0, 0x0

    .line 2309
    :goto_0
    return v0

    .line 2256
    :cond_1
    const/4 v0, 0x1

    .line 2258
    goto :goto_0

    :cond_2
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNLEZ:Z

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 2260
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "10.164.150.53"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "10.164.150.54"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "10.164.150.52"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "111.12.58.6:8000"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 2262
    :cond_3
    const/4 v0, 0x0

    .line 2263
    goto :goto_0

    .line 2265
    :cond_4
    const/4 v0, 0x1

    .line 2267
    goto :goto_0

    :cond_5
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNL:Z

    if-eqz v1, :cond_8

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 2269
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "192.168.3.253:81"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "111.59.6.120:81"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 2272
    :cond_6
    const/4 v0, 0x0

    .line 2273
    goto :goto_0

    .line 2275
    :cond_7
    const/4 v0, 0x1

    .line 2277
    goto :goto_0

    :cond_8
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isHT:Z

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 2279
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "222.134.89.202:89"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "yj.htsz.net:89"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_9

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "192.168.0.5"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 2281
    :cond_9
    const/4 v0, 0x0

    .line 2282
    goto/16 :goto_0

    .line 2284
    :cond_a
    const/4 v0, 0x1

    .line 2286
    goto/16 :goto_0

    :cond_b
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isGQ:Z

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 2288
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    const-string/jumbo v2, "117.132.10.37:81"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 2290
    const/4 v0, 0x0

    .line 2291
    goto/16 :goto_0

    .line 2293
    :cond_c
    const/4 v0, 0x1

    .line 2305
    goto/16 :goto_0

    .line 2307
    :cond_d
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method private parseDownload_Old(Lorg/json/JSONArray;Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/List;
    .locals 32
    .param p1, "data"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1038
    .local p2, "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p3, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v28

    move/from16 v0, v28

    if-ge v9, v0, :cond_0

    sget-boolean v28, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    if-nez v28, :cond_1

    .line 1121
    :cond_0
    :goto_1
    return-object p3

    .line 1039
    :cond_1
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    .line 1040
    .local v12, "json":Lorg/json/JSONObject;
    const-string/jumbo v28, "appwebpath"

    move-object/from16 v0, v28

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1041
    .local v4, "apkUrl":Ljava/lang/String;
    const-string/jumbo v28, "appsize"

    move-object/from16 v0, v28

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v18

    .line 1042
    .local v18, "size":J
    const-string/jumbo v28, "apkname"

    move-object/from16 v0, v28

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1043
    .local v15, "name":Ljava/lang/String;
    const-string/jumbo v28, "versionname"

    move-object/from16 v0, v28

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 1044
    .local v26, "version":Ljava/lang/String;
    const-string/jumbo v28, "packagename"

    move-object/from16 v0, v28

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1045
    .local v17, "packagename":Ljava/lang/String;
    const-string/jumbo v28, "versioncode"

    move-object/from16 v0, v28

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v27

    .line 1046
    .local v27, "versionCode":Ljava/lang/String;
    const-wide/16 v24, 0x1

    .line 1048
    .local v24, "vercodeLong":J
    :try_start_1
    invoke-static/range {v27 .. v27}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-result-wide v24

    .line 1054
    :goto_2
    const/4 v11, 0x0

    .line 1055
    .local v11, "isInstall":Z
    :try_start_2
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v28

    :goto_3
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-nez v29, :cond_5

    .line 1080
    :goto_4
    if-nez v11, :cond_4

    .line 1081
    new-instance v22, Ljava/net/URL;

    move-object/from16 v0, v22

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1083
    .local v22, "url2":Ljava/net/URL;
    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v23

    .line 1082
    check-cast v23, Ljava/net/HttpURLConnection;

    .line 1084
    .local v23, "urlConnection":Ljava/net/HttpURLConnection;
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->connect()V

    .line 1085
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    .line 1086
    .local v10, "in":Ljava/io/InputStream;
    new-instance v6, Ljava/io/File;

    sget-object v28, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    move-object/from16 v0, v28

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1087
    .local v6, "dir":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v28

    if-eqz v28, :cond_4

    .line 1088
    new-instance v7, Ljava/io/File;

    new-instance v28, Ljava/lang/StringBuilder;

    sget-object v29, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v29 .. v29}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1089
    .local v7, "file":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_2

    .line 1090
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 1092
    :cond_2
    new-instance v16, Ljava/io/FileOutputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1094
    .local v16, "out":Ljava/io/FileOutputStream;
    const/16 v28, 0x2800

    move/from16 v0, v28

    new-array v5, v0, [B

    .line 1095
    .local v5, "bys":[B
    const/4 v8, 0x0

    .line 1096
    .local v8, "getsize":I
    :goto_5
    int-to-long v0, v8

    move-wide/from16 v28, v0

    cmp-long v28, v28, v18

    if-gez v28, :cond_3

    sget-boolean v28, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    if-nez v28, :cond_8

    .line 1105
    :cond_3
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->close()V

    .line 1106
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 1107
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1108
    int-to-long v0, v8

    move-wide/from16 v28, v0

    cmp-long v28, v28, v18

    if-nez v28, :cond_4

    .line 1109
    const-string/jumbo v28, "com.launcher.activity"

    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-nez v28, :cond_9

    .line 1110
    new-instance v28, Ljava/lang/StringBuilder;

    sget-object v29, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v29 .. v29}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, p3

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1111
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->addApksList:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1038
    .end local v5    # "bys":[B
    .end local v6    # "dir":Ljava/io/File;
    .end local v7    # "file":Ljava/io/File;
    .end local v8    # "getsize":I
    .end local v10    # "in":Ljava/io/InputStream;
    .end local v16    # "out":Ljava/io/FileOutputStream;
    .end local v22    # "url2":Ljava/net/URL;
    .end local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_4
    :goto_6
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0

    .line 1055
    :cond_5
    invoke-interface/range {v28 .. v28}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/HashMap;

    .line 1056
    .local v14, "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v29, "packagename"

    move-object/from16 v0, v29

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    if-eqz v29, :cond_7

    .line 1057
    const-string/jumbo v29, "packagename"

    move-object/from16 v0, v29

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    move-object/from16 v0, v17

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v29

    if-eqz v29, :cond_7

    .line 1059
    const/4 v11, 0x1

    .line 1060
    const-wide/16 v20, 0x1

    .line 1062
    .local v20, "tempcode":J
    :try_start_3
    const-string/jumbo v28, "versioncode"

    move-object/from16 v0, v28

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/String;

    invoke-static/range {v28 .. v28}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    move-result-wide v20

    .line 1068
    :goto_7
    :try_start_4
    const-string/jumbo v28, "versioncode"

    move-object/from16 v0, v28

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    if-eqz v28, :cond_6

    .line 1069
    const-string/jumbo v28, "versionname"

    move-object/from16 v0, v28

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    if-eqz v28, :cond_6

    .line 1070
    cmp-long v28, v24, v20

    if-lez v28, :cond_6

    .line 1071
    const/4 v11, 0x0

    .line 1072
    goto/16 :goto_4

    .line 1073
    :cond_6
    const/4 v11, 0x1

    .line 1075
    goto/16 :goto_4

    .line 1077
    .end local v20    # "tempcode":J
    :cond_7
    const/4 v11, 0x0

    goto/16 :goto_3

    .line 1097
    .end local v14    # "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5    # "bys":[B
    .restart local v6    # "dir":Ljava/io/File;
    .restart local v7    # "file":Ljava/io/File;
    .restart local v8    # "getsize":I
    .restart local v10    # "in":Ljava/io/InputStream;
    .restart local v16    # "out":Ljava/io/FileOutputStream;
    .restart local v22    # "url2":Ljava/net/URL;
    .restart local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_8
    invoke-virtual {v10, v5}, Ljava/io/InputStream;->read([B)I

    move-result v13

    .line 1098
    .local v13, "length":I
    const/16 v28, -0x1

    move/from16 v0, v28

    if-eq v13, v0, :cond_3

    .line 1101
    add-int/2addr v8, v13

    .line 1102
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCachePosition:J

    move-wide/from16 v28, v0

    int-to-long v0, v13

    move-wide/from16 v30, v0

    add-long v28, v28, v30

    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCachePosition:J

    .line 1103
    const/16 v28, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v28

    invoke-virtual {v0, v5, v1, v13}, Ljava/io/FileOutputStream;->write([BII)V

    goto/16 :goto_5

    .line 1118
    .end local v4    # "apkUrl":Ljava/lang/String;
    .end local v5    # "bys":[B
    .end local v6    # "dir":Ljava/io/File;
    .end local v7    # "file":Ljava/io/File;
    .end local v8    # "getsize":I
    .end local v10    # "in":Ljava/io/InputStream;
    .end local v11    # "isInstall":Z
    .end local v12    # "json":Lorg/json/JSONObject;
    .end local v13    # "length":I
    .end local v15    # "name":Ljava/lang/String;
    .end local v16    # "out":Ljava/io/FileOutputStream;
    .end local v17    # "packagename":Ljava/lang/String;
    .end local v18    # "size":J
    .end local v22    # "url2":Ljava/net/URL;
    .end local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    .end local v24    # "vercodeLong":J
    .end local v26    # "version":Ljava/lang/String;
    .end local v27    # "versionCode":Ljava/lang/String;
    :catch_0
    move-exception v28

    goto/16 :goto_1

    .line 1113
    .restart local v4    # "apkUrl":Ljava/lang/String;
    .restart local v5    # "bys":[B
    .restart local v6    # "dir":Ljava/io/File;
    .restart local v7    # "file":Ljava/io/File;
    .restart local v8    # "getsize":I
    .restart local v10    # "in":Ljava/io/InputStream;
    .restart local v11    # "isInstall":Z
    .restart local v12    # "json":Lorg/json/JSONObject;
    .restart local v15    # "name":Ljava/lang/String;
    .restart local v16    # "out":Ljava/io/FileOutputStream;
    .restart local v17    # "packagename":Ljava/lang/String;
    .restart local v18    # "size":J
    .restart local v22    # "url2":Ljava/net/URL;
    .restart local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    .restart local v24    # "vercodeLong":J
    .restart local v26    # "version":Ljava/lang/String;
    .restart local v27    # "versionCode":Ljava/lang/String;
    :cond_9
    new-instance v28, Ljava/lang/StringBuilder;

    sget-object v29, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    invoke-static/range {v29 .. v29}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v28

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->launcherPath:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_6

    .line 1049
    .end local v5    # "bys":[B
    .end local v6    # "dir":Ljava/io/File;
    .end local v7    # "file":Ljava/io/File;
    .end local v8    # "getsize":I
    .end local v10    # "in":Ljava/io/InputStream;
    .end local v11    # "isInstall":Z
    .end local v16    # "out":Ljava/io/FileOutputStream;
    .end local v22    # "url2":Ljava/net/URL;
    .end local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    :catch_1
    move-exception v28

    goto/16 :goto_2

    .line 1051
    :catch_2
    move-exception v28

    goto/16 :goto_2

    .line 1065
    .restart local v11    # "isInstall":Z
    .restart local v14    # "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v20    # "tempcode":J
    :catch_3
    move-exception v28

    goto :goto_7

    .line 1063
    :catch_4
    move-exception v28

    goto :goto_7
.end method

.method private parseDownload_new(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
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
    .line 939
    .local p1, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p2, "apks":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    const/4 v6, 0x0

    .line 940
    .local v6, "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v24

    move/from16 v0, v24

    if-lt v11, v0, :cond_0

    .line 1020
    return-object p1

    .line 942
    :cond_0
    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    check-cast v6, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .line 943
    .restart local v6    # "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getPackagename()Ljava/lang/String;

    move-result-object v19

    .line 944
    .local v19, "packagename":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkUrl()Ljava/lang/String;

    move-result-object v5

    .line 945
    .local v5, "apkUrl":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getAppName()Ljava/lang/String;

    move-result-object v16

    .line 946
    .local v16, "name":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkSize()J

    move-result-wide v20

    .line 947
    .local v20, "size":J
    new-instance v8, Ljava/io/File;

    sget-object v24, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->ASSETS_DIR:Ljava/lang/String;

    move-object/from16 v0, v24

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 948
    .local v8, "dir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v24

    if-eqz v24, :cond_5

    .line 949
    new-instance v10, Ljava/io/File;

    .line 950
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

    .line 949
    move-object/from16 v0, v24

    invoke-direct {v10, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 951
    .local v10, "file":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v24

    if-eqz v24, :cond_1

    .line 952
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 955
    :cond_1
    const/16 v24, 0x2800

    move/from16 v0, v24

    new-array v7, v0, [B

    .line 956
    .local v7, "bys":[B
    const-wide/16 v12, 0x0

    .line 957
    .local v12, "getsize":J
    const/16 v23, 0x0

    .line 959
    .local v23, "urlConnection":Ljava/net/HttpURLConnection;
    :try_start_0
    new-instance v22, Ljava/net/URL;

    move-object/from16 v0, v22

    invoke-direct {v0, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 961
    .local v22, "url2":Ljava/net/URL;
    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v24

    .line 960
    move-object/from16 v0, v24

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object/from16 v23, v0

    .line 962
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->connect()V

    .line 963
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v14

    .line 964
    .local v14, "in":Ljava/io/InputStream;
    new-instance v18, Ljava/io/FileOutputStream;

    move-object/from16 v0, v18

    invoke-direct {v0, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 966
    .local v18, "out":Ljava/io/FileOutputStream;
    const/16 v17, 0x0

    .line 967
    .local v17, "num":I
    :cond_2
    :goto_1
    cmp-long v24, v12, v20

    if-gez v24, :cond_3

    sget-boolean v24, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    if-nez v24, :cond_6

    .line 980
    :cond_3
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    const/16 v25, 0x1011

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 981
    invoke-virtual/range {v18 .. v18}, Ljava/io/FileOutputStream;->close()V

    .line 982
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 992
    .end local v14    # "in":Ljava/io/InputStream;
    .end local v17    # "num":I
    .end local v18    # "out":Ljava/io/FileOutputStream;
    .end local v22    # "url2":Ljava/net/URL;
    :goto_2
    if-eqz v23, :cond_4

    .line 993
    invoke-virtual/range {v23 .. v23}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 995
    :cond_4
    cmp-long v24, v12, v20

    if-nez v24, :cond_9

    .line 996
    const-string/jumbo v24, "com.launcher.activity"

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_7

    .line 997
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

    .line 998
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

    invoke-direct {v0, v1, v2, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 999
    const/16 v24, 0x0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    const/16 v25, 0x1012

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 1000
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->addApksList:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 940
    .end local v7    # "bys":[B
    .end local v10    # "file":Ljava/io/File;
    .end local v12    # "getsize":J
    .end local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_5
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_0

    .line 968
    .restart local v7    # "bys":[B
    .restart local v10    # "file":Ljava/io/File;
    .restart local v12    # "getsize":J
    .restart local v14    # "in":Ljava/io/InputStream;
    .restart local v17    # "num":I
    .restart local v18    # "out":Ljava/io/FileOutputStream;
    .restart local v22    # "url2":Ljava/net/URL;
    .restart local v23    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_6
    :try_start_1
    invoke-virtual {v14, v7}, Ljava/io/InputStream;->read([B)I

    move-result v15

    .line 969
    .local v15, "length":I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-eq v15, v0, :cond_3

    .line 972
    int-to-long v0, v15

    move-wide/from16 v24, v0

    add-long v12, v12, v24

    .line 973
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCachePosition:J

    move-wide/from16 v24, v0

    int-to-long v0, v15

    move-wide/from16 v26, v0

    add-long v24, v24, v26

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->currentCachePosition:J

    .line 974
    const/16 v24, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v24

    invoke-virtual {v0, v7, v1, v15}, Ljava/io/FileOutputStream;->write([BII)V

    .line 975
    add-int/lit8 v17, v17, 0x1

    .line 976
    rem-int/lit8 v24, v17, 0xa

    if-nez v24, :cond_2

    .line 977
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    const/16 v25, 0x1011

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendInstallMessage(ILjava/lang/Object;I)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    goto/16 :goto_1

    .line 983
    .end local v14    # "in":Ljava/io/InputStream;
    .end local v15    # "length":I
    .end local v17    # "num":I
    .end local v18    # "out":Ljava/io/FileOutputStream;
    .end local v22    # "url2":Ljava/net/URL;
    :catch_0
    move-exception v9

    .line 985
    .local v9, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v9}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_2

    .line 986
    .end local v9    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v9

    .line 988
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 1003
    .end local v9    # "e":Ljava/io/IOException;
    :cond_7
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .line 1004
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

    .line 1005
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-interface {v0, v11, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 1009
    .end local v4    # "apkBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    :goto_4
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_8

    .line 1010
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

    invoke-direct {v0, v1, v2, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 1011
    const/16 v24, 0x0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    const/16 v25, 0x1012

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    .line 1013
    :cond_8
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

    iput-object v0, v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->launcherPath:Ljava/lang/String;

    goto/16 :goto_3

    .line 1016
    :cond_9
    const/16 v24, -0x2

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    const/16 v25, 0x1012

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v0, v11, v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendInstallMessage(ILjava/lang/Object;I)V

    goto/16 :goto_3

    .line 1006
    :catch_2
    move-exception v24

    goto :goto_4

    .line 989
    :catch_3
    move-exception v24

    goto/16 :goto_2
.end method

.method private resetUpdateInfo()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1860
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 1861
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1863
    :cond_0
    const/4 v0, 0x0

    sput-boolean v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    .line 1864
    const/16 v0, 0x12c

    iput v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateTime:I

    .line 1865
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;

    if-eqz v0, :cond_1

    .line 1867
    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;

    .line 1869
    :cond_1
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateprogressThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;

    if-eqz v0, :cond_2

    .line 1871
    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateprogressThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;

    .line 1873
    :cond_2
    return-void
.end method

.method private static returnResult(I)Z
    .locals 2
    .param p0, "value"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1299
    if-nez p0, :cond_0

    .line 1304
    :goto_0
    return v0

    .line 1301
    :cond_0
    if-ne p0, v0, :cond_1

    move v0, v1

    .line 1302
    goto :goto_0

    :cond_1
    move v0, v1

    .line 1304
    goto :goto_0
.end method

.method private savePic(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 12
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 3834
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v9

    .line 3835
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v9, "/MobileStudyClient/.System/icon"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 3834
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 3836
    .local v7, "picPath":Ljava/lang/String;
    const-string/jumbo v8, "/"

    invoke-virtual {p2, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {p2, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 3838
    .local v4, "name":Ljava/lang/String;
    invoke-static {v7, v4}, Lcom/cloudclientsetting/until/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 3839
    .local v2, "file":Ljava/io/File;
    const/4 v5, 0x0

    .line 3841
    .local v5, "out":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3842
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .local v6, "out":Ljava/io/FileOutputStream;
    const/16 v8, 0x400

    :try_start_1
    new-array v0, v8, [B

    .line 3844
    .local v0, "b":[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v3

    .local v3, "length":I
    const/4 v8, -0x1

    if-ne v3, v8, :cond_0

    .line 3853
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 3854
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-object v5, v6

    .line 3864
    .end local v0    # "b":[B
    .end local v3    # "length":I
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    :goto_1
    return-void

    .line 3845
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "b":[B
    .restart local v3    # "length":I
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :cond_0
    const/4 v8, 0x0

    :try_start_3
    invoke-virtual {v6, v0, v8, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    .line 3847
    .end local v0    # "b":[B
    .end local v3    # "length":I
    :catch_0
    move-exception v1

    move-object v5, v6

    .line 3849
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    :goto_2
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 3850
    const-string/jumbo v8, "liu"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "savePic:"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 3853
    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 3854
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 3855
    :catch_1
    move-exception v1

    .line 3857
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 3858
    const-string/jumbo v8, "liu"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "close stream:"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 3851
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    .line 3853
    :goto_3
    :try_start_6
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 3854
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 3861
    :goto_4
    throw v8

    .line 3855
    :catch_2
    move-exception v1

    .line 3857
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 3858
    const-string/jumbo v9, "liu"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "close stream:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 3855
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "b":[B
    .restart local v3    # "length":I
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v1

    .line 3857
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 3858
    const-string/jumbo v8, "liu"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "close stream:"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v6

    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto/16 :goto_1

    .line 3851
    .end local v0    # "b":[B
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "length":I
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v8

    move-object v5, v6

    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 3847
    :catch_4
    move-exception v1

    goto :goto_2
.end method

.method private sendInstallMessage(ILjava/lang/Object;I)V
    .locals 2
    .param p1, "arg1"    # I
    .param p2, "obj"    # Ljava/lang/Object;
    .param p3, "what"    # I

    .prologue
    .line 1024
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 1025
    .local v0, "msgInstall":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 1026
    iput p3, v0, Landroid/os/Message;->what:I

    .line 1027
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1028
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1029
    return-void
.end method

.method private showClearDialog()V
    .locals 5

    .prologue
    .line 2032
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2033
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08023a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 2034
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08023c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 2035
    const v2, 0x7f08030c

    new-instance v3, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$16;

    invoke-direct {v3, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$16;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 2044
    const v3, 0x7f080180

    new-instance v4, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$17;

    invoke-direct {v4, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$17;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 2058
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 2059
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 2060
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 2061
    return-void
.end method

.method private showConfirmPwdDialog()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 4379
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 4380
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v3, 0x7f080221

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 4381
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f03000c

    invoke-virtual {v3, v4, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 4382
    .local v2, "view":Landroid/view/View;
    const v3, 0x7f0a0032

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 4383
    .local v1, "edtpwd":Landroid/widget/EditText;
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 4384
    const v3, 0x7f08030c

    new-instance v4, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$24;

    invoke-direct {v4, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$24;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4398
    const v4, 0x7f0801a8

    new-instance v5, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;

    invoke-direct {v5, p0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$25;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Landroid/widget/EditText;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 4437
    iput-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdConfirmDialog:Landroid/app/AlertDialog;

    .line 4440
    :try_start_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdConfirmDialog:Landroid/app/AlertDialog;

    .line 4441
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdConfirmDialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4445
    :goto_0
    return-void

    .line 4442
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private showLanguageChooseDialog()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 1731
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1732
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1733
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080201

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1734
    const/4 v2, 0x2

    new-array v1, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0801fe

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0801ff

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    .line 1735
    .local v1, "items":[Ljava/lang/String;
    new-instance v2, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;

    invoke-direct {v2, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1759
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 1760
    return-void
.end method

.method private showPopList()V
    .locals 8

    .prologue
    const/4 v7, -0x2

    .line 1580
    const-string/jumbo v5, "loginhistory"

    const/4 v6, 0x4

    invoke-virtual {p0, v5, v6}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 1581
    .local v3, "loginSp":Landroid/content/SharedPreferences;
    const-string/jumbo v5, "iphistoryString"

    const-string/jumbo v6, ""

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1582
    .local v2, "ipHistorys":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string/jumbo v5, ""

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    if-nez v5, :cond_1

    .line 1619
    :cond_0
    :goto_0
    return-void

    .line 1586
    :cond_1
    const-string/jumbo v5, ",:,"

    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 1587
    .local v4, "strs":[Ljava/lang/String;
    if-eqz v4, :cond_0

    array-length v5, v4

    if-lez v5, :cond_0

    .line 1591
    const-string/jumbo v5, "ip"

    invoke-static {v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1592
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    .line 1593
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v5, v4

    if-lt v0, v5, :cond_3

    .line 1599
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 1603
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    if-nez v5, :cond_5

    .line 1605
    new-instance v5, Landroid/widget/ListPopupWindow;

    invoke-direct {v5, p0}, Landroid/widget/ListPopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    .line 1606
    new-instance v5, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    invoke-direct {v5, v6, p0, p0}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;-><init>(Ljava/util/List;Landroid/content/Context;Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;)V

    iput-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    .line 1607
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    invoke-virtual {v5, v6}, Landroid/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1608
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    invoke-virtual {v5, v7}, Landroid/widget/ListPopupWindow;->setWidth(I)V

    .line 1609
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    invoke-virtual {v5, v7}, Landroid/widget/ListPopupWindow;->setHeight(I)V

    .line 1610
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/widget/ListPopupWindow;->setInputMethodMode(I)V

    .line 1611
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/widget/ListPopupWindow;->setModal(Z)V

    .line 1617
    :cond_2
    :goto_2
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    invoke-virtual {v5, v6}, Landroid/widget/ListPopupWindow;->setAnchorView(Landroid/view/View;)V

    .line 1618
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    invoke-virtual {v5}, Landroid/widget/ListPopupWindow;->show()V

    goto :goto_0

    .line 1595
    :cond_3
    aget-object v1, v4, v0

    .line 1596
    .local v1, "ip":Ljava/lang/String;
    if-eqz v1, :cond_4

    const-string/jumbo v5, ""

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 1597
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1593
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1612
    .end local v1    # "ip":Ljava/lang/String;
    :cond_5
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    if-eqz v5, :cond_2

    .line 1614
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    iget-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    invoke-virtual {v5, v6}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->setIps(Ljava/util/List;)V

    .line 1615
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    invoke-virtual {v5}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->notifyDataSetChanged()V

    goto :goto_2
.end method

.method private showPopNameList()V
    .locals 4

    .prologue
    const/4 v3, -0x2

    .line 1535
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    .line 1536
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1537
    .local v0, "ip":Ljava/lang/String;
    :goto_0
    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-gtz v1, :cond_2

    .line 1562
    :cond_0
    :goto_1
    return-void

    .line 1536
    .end local v0    # "ip":Ljava/lang/String;
    :cond_1
    const-string/jumbo v0, ""

    goto :goto_0

    .line 1541
    .restart local v0    # "ip":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    invoke-direct {p0, v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameHistoryQuery(Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    .line 1542
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 1546
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    if-nez v1, :cond_4

    .line 1548
    new-instance v1, Landroid/widget/ListPopupWindow;

    invoke-direct {v1, p0}, Landroid/widget/ListPopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    .line 1549
    new-instance v1, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    invoke-direct {v1, v2, p0, p0}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;-><init>(Ljava/util/List;Landroid/content/Context;Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;)V

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    .line 1550
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1551
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    invoke-virtual {v1, v3}, Landroid/widget/ListPopupWindow;->setWidth(I)V

    .line 1552
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    invoke-virtual {v1, v3}, Landroid/widget/ListPopupWindow;->setHeight(I)V

    .line 1553
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/widget/ListPopupWindow;->setInputMethodMode(I)V

    .line 1554
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListPopupWindow;->setModal(Z)V

    .line 1560
    :cond_3
    :goto_2
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    invoke-virtual {v1, v2}, Landroid/widget/ListPopupWindow;->setAnchorView(Landroid/view/View;)V

    .line 1561
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    invoke-virtual {v1}, Landroid/widget/ListPopupWindow;->show()V

    goto :goto_1

    .line 1555
    :cond_4
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    if-eqz v1, :cond_3

    .line 1557
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->setIps(Ljava/util/List;)V

    .line 1558
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->notifyDataSetChanged()V

    goto :goto_2
.end method

.method private showProgressDialog()V
    .locals 3

    .prologue
    .line 1806
    sget-boolean v0, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNewUpdate:Z

    if-eqz v0, :cond_1

    .line 1808
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isover:Z

    if-nez v0, :cond_0

    .line 1809
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    .line 1810
    new-instance v0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    .line 1811
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 1810
    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    .line 1812
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->keylistenerDialog:Landroid/content/DialogInterface$OnKeyListener;

    invoke-virtual {v0, v1}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 1813
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->show()V

    .line 1829
    :cond_0
    :goto_0
    return-void

    .line 1817
    :cond_1
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isover:Z

    if-nez v0, :cond_0

    .line 1819
    invoke-static {p0}, Lcom/lee/demo/view/CustomProgressDialog;->createDialog(Landroid/content/Context;)Lcom/lee/demo/view/CustomProgressDialog;

    move-result-object v0

    .line 1818
    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    .line 1820
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1821
    const v2, 0x7f0801d4

    .line 1820
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lee/demo/view/CustomProgressDialog;->setMessage(Ljava/lang/String;)Lcom/lee/demo/view/CustomProgressDialog;

    .line 1824
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->keylistenerDialog:Landroid/content/DialogInterface$OnKeyListener;

    invoke-virtual {v0, v1}, Lcom/lee/demo/view/CustomProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 1825
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->webprogressdialog:Lcom/lee/demo/view/CustomProgressDialog;

    invoke-virtual {v0}, Lcom/lee/demo/view/CustomProgressDialog;->show()V

    goto :goto_0
.end method

.method private showServiceDialog()V
    .locals 4

    .prologue
    .line 2063
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2064
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08023a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 2065
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08023b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 2066
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080370

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$18;

    invoke-direct {v3, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$18;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 2076
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 2077
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 2078
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 2079
    return-void
.end method

.method private sslClient(Lorg/apache/http/client/HttpClient;)Lorg/apache/http/client/HttpClient;
    .locals 10
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;

    .prologue
    const/4 v7, 0x0

    .line 3222
    :try_start_0
    new-instance v5, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$23;

    invoke-direct {v5, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$23;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 3235
    .local v5, "tm":Ljavax/net/ssl/X509TrustManager;
    const-string/jumbo v6, "TLS"

    invoke-static {v6}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 3236
    .local v1, "ctx":Ljavax/net/ssl/SSLContext;
    const/4 v6, 0x0

    const/4 v8, 0x1

    new-array v8, v8, [Ljavax/net/ssl/TrustManager;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    const/4 v9, 0x0

    invoke-virtual {v1, v6, v8, v9}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 3237
    new-instance v4, Lcom/edutech/idauthentication/MySSLSocketFactory;

    invoke-direct {v4, v1}, Lcom/edutech/idauthentication/MySSLSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;)V

    .line 3238
    .local v4, "ssf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    sget-object v6, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v4, v6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 3239
    invoke-interface {p1}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    .line 3240
    .local v0, "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v3

    .line 3241
    .local v3, "sr":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v6, Lorg/apache/http/conn/scheme/Scheme;

    const-string/jumbo v8, "https"

    const/16 v9, 0x1bb

    invoke-direct {v6, v8, v4, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v6}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 3242
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-interface {p1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v8

    invoke-direct {v6, v0, v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3244
    .end local v0    # "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v1    # "ctx":Ljavax/net/ssl/SSLContext;
    .end local v3    # "sr":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v4    # "ssf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    .end local v5    # "tm":Ljavax/net/ssl/X509TrustManager;
    :goto_0
    return-object v6

    .line 3243
    :catch_0
    move-exception v2

    .local v2, "ex":Ljava/lang/Exception;
    move-object v6, v7

    .line 3244
    goto :goto_0
.end method

.method private sslConnect()V
    .locals 32

    .prologue
    .line 2823
    const/16 v27, 0x0

    .line 2826
    .local v27, "urls":Ljava/net/URL;
    :try_start_0
    new-instance v28, Ljava/net/URL;

    const-string/jumbo v4, "https://www.icontrol365.com/regmac.aspx"

    move-object/from16 v0, v28

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 2827
    .end local v27    # "urls":Ljava/net/URL;
    .local v28, "urls":Ljava/net/URL;
    const/16 v26, 0x0

    .line 2830
    .local v26, "urlconnection":Ljavax/net/ssl/HttpsURLConnection;
    const/4 v4, 0x1

    :try_start_1
    new-array v0, v4, [Ljavax/net/ssl/TrustManager;

    move-object/from16 v25, v0

    const/4 v4, 0x0

    new-instance v5, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$22;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$22;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    aput-object v5, v25, v4

    .line 2844
    .local v25, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    new-instance v4, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$MyHostnameVerifier;)V

    invoke-static {v4}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 2845
    const-string/jumbo v4, "TLS"

    invoke-static {v4}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v11

    .line 2846
    .local v11, "context":Ljavax/net/ssl/SSLContext;
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v11, v4, v0, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 2848
    new-instance v19, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;

    invoke-direct/range {v19 .. v19}, Lcom/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended;-><init>()V

    .line 2849
    .local v19, "preferredCipherSuiteSSLSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    invoke-virtual/range {v28 .. v28}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v26

    .end local v26    # "urlconnection":Ljavax/net/ssl/HttpsURLConnection;
    check-cast v26, Ljavax/net/ssl/HttpsURLConnection;

    .line 2850
    .restart local v26    # "urlconnection":Ljavax/net/ssl/HttpsURLConnection;
    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 2852
    const/4 v4, 0x1

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Ljavax/net/ssl/HttpsURLConnection;->setDoInput(Z)V

    .line 2853
    const/4 v4, 0x1

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    .line 2854
    const-string/jumbo v4, "POST"

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 2855
    const-string/jumbo v4, "Content-Type"

    const-string/jumbo v5, "application/xml;charset=UTF-8"

    move-object/from16 v0, v26

    invoke-virtual {v0, v4, v5}, Ljavax/net/ssl/HttpsURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 2856
    invoke-virtual/range {v26 .. v26}, Ljavax/net/ssl/HttpsURLConnection;->connect()V

    .line 2858
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    .line 2859
    .local v29, "xml":Ljava/lang/StringBuilder;
    const-string/jumbo v4, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2860
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "<ApplyAuth><strAuthID>"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2861
    const-string/jumbo v5, "</strAuthID>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2860
    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2862
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "<strMacAddr>"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->GetMachineID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</strMacAddr>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2863
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "<strSystemInfo>"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2864
    const-string/jumbo v5, "</strSystemInfo></ApplyAuth>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2863
    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2867
    new-instance v13, Ljava/io/DataOutputStream;

    invoke-virtual/range {v26 .. v26}, Ljavax/net/ssl/HttpsURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v13, v4}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 2868
    .local v13, "dos":Ljava/io/DataOutputStream;
    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 2869
    invoke-virtual {v13}, Ljava/io/DataOutputStream;->flush()V

    .line 2870
    invoke-virtual {v13}, Ljava/io/DataOutputStream;->close()V

    .line 2872
    const/16 v4, 0xc8

    invoke-virtual/range {v26 .. v26}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v5

    if-ne v4, v5, :cond_4

    .line 2873
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    .line 2874
    .local v22, "sb":Ljava/lang/StringBuffer;
    new-instance v20, Ljava/lang/String;

    invoke-direct/range {v20 .. v20}, Ljava/lang/String;-><init>()V

    .line 2875
    .local v20, "readLine":Ljava/lang/String;
    invoke-virtual/range {v26 .. v26}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v17

    .line 2877
    .local v17, "in":Ljava/io/InputStream;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v15

    .line 2878
    .local v15, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v15}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v10

    .line 2879
    .local v10, "builder":Ljavax/xml/parsers/DocumentBuilder;
    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v12

    .line 2880
    .local v12, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v12}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v21

    .line 2882
    .local v21, "root":Lorg/w3c/dom/Element;
    const-string/jumbo v4, "AuthResult"

    move-object/from16 v0, v21

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2883
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    .line 2881
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 2886
    .local v6, "result":I
    const/4 v4, 0x4

    if-eq v6, v4, :cond_0

    const/4 v4, 0x5

    if-ne v6, v4, :cond_1

    .line 2888
    :cond_0
    const/16 v24, 0x0

    .line 2889
    .local v24, "tmpnode":Lorg/w3c/dom/NodeList;
    const/4 v7, 0x0

    .line 2890
    .local v7, "times":Ljava/lang/String;
    const-string/jumbo v4, "AuthTimes"

    move-object/from16 v0, v21

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    .line 2892
    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-lez v4, :cond_2

    .line 2893
    const/4 v4, 0x0

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2894
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 2895
    const/4 v4, 0x0

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2896
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    .line 2900
    :goto_0
    const/4 v8, 0x0

    .line 2901
    .local v8, "date":Ljava/lang/String;
    const-string/jumbo v4, "AuthValidDate"

    move-object/from16 v0, v21

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v24

    .line 2902
    invoke-interface/range {v24 .. v24}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-lez v4, :cond_3

    .line 2903
    const/4 v4, 0x0

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2904
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_3

    .line 2905
    const/4 v4, 0x0

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    .line 2906
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    .line 2910
    :goto_1
    const/16 v16, 0x0

    .line 2911
    .local v16, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget v23, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2916
    .local v23, "sdk_version":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth:Lcom/edutech/idauthentication/MainActivity;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2917
    const-string/jumbo v9, "0"

    .line 2916
    invoke-virtual/range {v4 .. v9}, Lcom/edutech/idauthentication/MainActivity;->writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 2919
    :try_start_2
    new-instance v4, Lcom/edutech/idauthentication/Aduth;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/edutech/idauthentication/Aduth;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2920
    const-string/jumbo v9, "0"

    .line 2919
    invoke-virtual/range {v4 .. v9}, Lcom/edutech/idauthentication/Aduth;->writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_3

    .line 2928
    .end local v7    # "times":Ljava/lang/String;
    .end local v8    # "date":Ljava/lang/String;
    .end local v16    # "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v23    # "sdk_version":I
    .end local v24    # "tmpnode":Lorg/w3c/dom/NodeList;
    :cond_1
    :goto_2
    :try_start_3
    const-string/jumbo v4, "HHH"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "result:"

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2929
    new-instance v18, Landroid/os/Message;

    invoke-direct/range {v18 .. v18}, Landroid/os/Message;-><init>()V

    .line 2930
    .local v18, "msg":Landroid/os/Message;
    move-object/from16 v0, v18

    iput v6, v0, Landroid/os/Message;->what:I

    .line 2931
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->resultHandler:Landroid/os/Handler;

    const-wide/16 v30, 0x3e8

    move-object/from16 v0, v18

    move-wide/from16 v1, v30

    invoke-virtual {v4, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-object/from16 v27, v28

    .line 2940
    .end local v6    # "result":I
    .end local v10    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v11    # "context":Ljavax/net/ssl/SSLContext;
    .end local v12    # "doc":Lorg/w3c/dom/Document;
    .end local v13    # "dos":Ljava/io/DataOutputStream;
    .end local v15    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v17    # "in":Ljava/io/InputStream;
    .end local v18    # "msg":Landroid/os/Message;
    .end local v19    # "preferredCipherSuiteSSLSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    .end local v20    # "readLine":Ljava/lang/String;
    .end local v21    # "root":Lorg/w3c/dom/Element;
    .end local v22    # "sb":Ljava/lang/StringBuffer;
    .end local v25    # "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    .end local v26    # "urlconnection":Ljavax/net/ssl/HttpsURLConnection;
    .end local v28    # "urls":Ljava/net/URL;
    .end local v29    # "xml":Ljava/lang/StringBuilder;
    .restart local v27    # "urls":Ljava/net/URL;
    :goto_3
    return-void

    .line 2898
    .end local v27    # "urls":Ljava/net/URL;
    .restart local v6    # "result":I
    .restart local v7    # "times":Ljava/lang/String;
    .restart local v10    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v11    # "context":Ljavax/net/ssl/SSLContext;
    .restart local v12    # "doc":Lorg/w3c/dom/Document;
    .restart local v13    # "dos":Ljava/io/DataOutputStream;
    .restart local v15    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v17    # "in":Ljava/io/InputStream;
    .restart local v19    # "preferredCipherSuiteSSLSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    .restart local v20    # "readLine":Ljava/lang/String;
    .restart local v21    # "root":Lorg/w3c/dom/Element;
    .restart local v22    # "sb":Ljava/lang/StringBuffer;
    .restart local v24    # "tmpnode":Lorg/w3c/dom/NodeList;
    .restart local v25    # "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    .restart local v26    # "urlconnection":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v28    # "urls":Ljava/net/URL;
    .restart local v29    # "xml":Ljava/lang/StringBuilder;
    :cond_2
    const-string/jumbo v7, "0"

    goto/16 :goto_0

    .line 2908
    .restart local v8    # "date":Ljava/lang/String;
    :cond_3
    const-string/jumbo v8, "0"
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 2934
    .end local v6    # "result":I
    .end local v7    # "times":Ljava/lang/String;
    .end local v8    # "date":Ljava/lang/String;
    .end local v10    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v11    # "context":Ljavax/net/ssl/SSLContext;
    .end local v12    # "doc":Lorg/w3c/dom/Document;
    .end local v13    # "dos":Ljava/io/DataOutputStream;
    .end local v15    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v17    # "in":Ljava/io/InputStream;
    .end local v19    # "preferredCipherSuiteSSLSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    .end local v20    # "readLine":Ljava/lang/String;
    .end local v21    # "root":Lorg/w3c/dom/Element;
    .end local v22    # "sb":Ljava/lang/StringBuffer;
    .end local v24    # "tmpnode":Lorg/w3c/dom/NodeList;
    .end local v25    # "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    .end local v26    # "urlconnection":Ljavax/net/ssl/HttpsURLConnection;
    .end local v28    # "urls":Ljava/net/URL;
    .end local v29    # "xml":Ljava/lang/StringBuilder;
    .restart local v27    # "urls":Ljava/net/URL;
    :catch_0
    move-exception v14

    .line 2936
    .local v14, "e6":Ljava/net/MalformedURLException;
    :goto_4
    invoke-virtual {v14}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_3

    .line 2937
    .end local v14    # "e6":Ljava/net/MalformedURLException;
    :catch_1
    move-exception v4

    goto :goto_3

    .end local v27    # "urls":Ljava/net/URL;
    .restart local v28    # "urls":Ljava/net/URL;
    :catch_2
    move-exception v4

    move-object/from16 v27, v28

    .end local v28    # "urls":Ljava/net/URL;
    .restart local v27    # "urls":Ljava/net/URL;
    goto :goto_3

    .line 2934
    .end local v27    # "urls":Ljava/net/URL;
    .restart local v28    # "urls":Ljava/net/URL;
    :catch_3
    move-exception v14

    move-object/from16 v27, v28

    .end local v28    # "urls":Ljava/net/URL;
    .restart local v27    # "urls":Ljava/net/URL;
    goto :goto_4

    .line 2921
    .end local v27    # "urls":Ljava/net/URL;
    .restart local v6    # "result":I
    .restart local v7    # "times":Ljava/lang/String;
    .restart local v8    # "date":Ljava/lang/String;
    .restart local v10    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v11    # "context":Ljavax/net/ssl/SSLContext;
    .restart local v12    # "doc":Lorg/w3c/dom/Document;
    .restart local v13    # "dos":Ljava/io/DataOutputStream;
    .restart local v15    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .restart local v16    # "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v17    # "in":Ljava/io/InputStream;
    .restart local v19    # "preferredCipherSuiteSSLSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    .restart local v20    # "readLine":Ljava/lang/String;
    .restart local v21    # "root":Lorg/w3c/dom/Element;
    .restart local v22    # "sb":Ljava/lang/StringBuffer;
    .restart local v23    # "sdk_version":I
    .restart local v24    # "tmpnode":Lorg/w3c/dom/NodeList;
    .restart local v25    # "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    .restart local v26    # "urlconnection":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v28    # "urls":Ljava/net/URL;
    .restart local v29    # "xml":Ljava/lang/StringBuilder;
    :catch_4
    move-exception v4

    goto :goto_2

    .end local v6    # "result":I
    .end local v7    # "times":Ljava/lang/String;
    .end local v8    # "date":Ljava/lang/String;
    .end local v10    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v12    # "doc":Lorg/w3c/dom/Document;
    .end local v15    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v16    # "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v17    # "in":Ljava/io/InputStream;
    .end local v20    # "readLine":Ljava/lang/String;
    .end local v21    # "root":Lorg/w3c/dom/Element;
    .end local v22    # "sb":Ljava/lang/StringBuffer;
    .end local v23    # "sdk_version":I
    .end local v24    # "tmpnode":Lorg/w3c/dom/NodeList;
    :cond_4
    move-object/from16 v27, v28

    .end local v28    # "urls":Ljava/net/URL;
    .restart local v27    # "urls":Ljava/net/URL;
    goto :goto_3
.end method

.method private startAssistanApk()V
    .locals 7

    .prologue
    .line 447
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.MAIN"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 448
    .local v2, "intent2":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 450
    new-instance v0, Landroid/content/ComponentName;

    const-string/jumbo v4, "com.edutech.assistantdemo"

    .line 451
    const-string/jumbo v5, "com.edutech.assistantdemo.MainActivity"

    .line 450
    invoke-direct {v0, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    .local v0, "cn":Landroid/content/ComponentName;
    invoke-virtual {v2, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 455
    :try_start_0
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 456
    const-string/jumbo v5, "com.edutech.assistantdemo"

    const/4 v6, 0x0

    .line 455
    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 461
    .local v3, "packageInfo2":Landroid/content/pm/PackageInfo;
    :goto_0
    if-eqz v3, :cond_0

    .line 462
    invoke-virtual {p0, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startActivity(Landroid/content/Intent;)V

    .line 464
    :cond_0
    return-void

    .line 457
    .end local v3    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v1

    .line 458
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v3, 0x0

    .line 459
    .restart local v3    # "packageInfo2":Landroid/content/pm/PackageInfo;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method private startFireWall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "privatekey"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "schoolid"    # Ljava/lang/String;

    .prologue
    .line 676
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 677
    .local v0, "in":Landroid/content/Intent;
    const-string/jumbo v1, "com.edutech.intent.TrafficStatsService"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 678
    const-string/jumbo v1, "com.edutech.firewall"

    const-string/jumbo v2, "eu.faircode.netguard.TrafficStatsService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 679
    const-string/jumbo v1, "ip"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 680
    const-string/jumbo v1, "privatekey"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 681
    const-string/jumbo v1, "name"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 682
    const-string/jumbo v1, "schoolid"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 683
    invoke-virtual {p0, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 684
    return-void
.end method

.method public static toHexString([BLjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "bytes"    # [B
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 3214
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 3215
    .local v1, "hexString":Ljava/lang/StringBuilder;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_0

    .line 3218
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 3215
    :cond_0
    aget-byte v0, p0, v2

    .line 3216
    .local v0, "b":B
    and-int/lit16 v4, v0, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3215
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static toMd5([B)[B
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 3203
    :try_start_0
    const-string/jumbo v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 3204
    .local v0, "algorithm":Ljava/security/MessageDigest;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 3205
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 3206
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 3210
    .end local v0    # "algorithm":Ljava/security/MessageDigest;
    :goto_0
    return-object v1

    .line 3207
    :catch_0
    move-exception v1

    .line 3210
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private updatePassword()V
    .locals 6

    .prologue
    .line 4515
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 4517
    .local v1, "pwdinflater":Landroid/view/LayoutInflater;
    const v4, 0x7f030081

    .line 4518
    const v3, 0x7f0a0204

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 4516
    invoke-virtual {v1, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 4520
    .local v2, "pwdlayout":Landroid/view/View;
    const v3, 0x7f0a0205

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 4519
    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->oldpwd:Landroid/widget/EditText;

    .line 4522
    const v3, 0x7f0a0206

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 4521
    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->newpwd:Landroid/widget/EditText;

    .line 4524
    const v3, 0x7f0a0207

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 4523
    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->confirmpwd:Landroid/widget/EditText;

    .line 4526
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 4527
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0801d5

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4528
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4529
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4531
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0801d6

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 4532
    new-instance v5, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;

    invoke-direct {v5, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$26;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 4530
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 4568
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0801dc

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 4569
    new-instance v5, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$27;

    invoke-direct {v5, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$27;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 4567
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 4581
    .local v0, "pwdalertDialog":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 4582
    return-void
.end method

.method private writeXml()V
    .locals 15

    .prologue
    const/4 v13, 0x0

    const/4 v14, 0x7

    .line 2359
    const-string/jumbo v11, "CloudClientSetActivity"

    const-string/jumbo v12, "writeXml"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2360
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tempfile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 2361
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tempfile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .line 2362
    :cond_0
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    invoke-virtual {v11}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v11

    .line 2363
    invoke-interface {v11}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2362
    sput-object v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->MOBILESTUDYSERVERIP:Ljava/lang/String;

    .line 2364
    .local v2, "ip":Ljava/lang/String;
    const-string/jumbo v11, " "

    const-string/jumbo v12, ""

    invoke-virtual {v2, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2365
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v11

    if-le v11, v14, :cond_1

    .line 2366
    invoke-virtual {v2, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 2367
    .local v8, "subhttp":Ljava/lang/String;
    const-string/jumbo v11, "CloudClientSetActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "subhttp"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2368
    const-string/jumbo v11, "http://"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 2370
    invoke-virtual {v2, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 2371
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ptfw_edit:Landroid/widget/EditText;

    invoke-virtual {v11, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2372
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    invoke-virtual {v11, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2373
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    .line 2374
    const v12, 0x7f0801dd

    .line 2373
    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    .line 2378
    .end local v8    # "subhttp":Ljava/lang/String;
    :cond_1
    if-eqz v2, :cond_2

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v11

    if-gtz v11, :cond_3

    .line 2379
    :cond_2
    const-string/jumbo v2, "192.168.0.88"

    .line 2380
    :cond_3
    const-string/jumbo v9, ""

    .line 2381
    .local v9, "username":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 2386
    .local v3, "password":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v11, "privatekey"

    const/4 v12, 0x0

    .line 2385
    invoke-virtual {p0, v11, v12}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 2387
    .local v5, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v11, "name"

    const-string/jumbo v12, ""

    invoke-interface {v5, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2388
    .local v7, "struserName":Ljava/lang/String;
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_edit:Landroid/widget/EditText;

    invoke-virtual {v11}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v11

    invoke-interface {v11}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2389
    .local v6, "strpassWord":Ljava/lang/String;
    if-eqz v7, :cond_4

    if-eqz v6, :cond_4

    .line 2390
    const-string/jumbo v11, " "

    const-string/jumbo v12, ""

    invoke-virtual {v7, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2391
    const-string/jumbo v11, " "

    const-string/jumbo v12, ""

    invoke-virtual {v6, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2393
    :cond_4
    iput-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Name:Ljava/lang/String;

    .line 2394
    iput-object v6, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Pwd:Ljava/lang/String;

    .line 2396
    invoke-static {v7}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2397
    invoke-static {v6}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2398
    if-eqz v7, :cond_5

    .line 2399
    if-eqz v7, :cond_6

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    if-gtz v11, :cond_6

    .line 2400
    :cond_5
    const-string/jumbo v11, "02"

    invoke-static {v11}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2401
    :cond_6
    if-eqz v6, :cond_7

    .line 2402
    if-eqz v6, :cond_8

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    if-gtz v11, :cond_8

    .line 2403
    :cond_7
    const-string/jumbo v11, "1"

    invoke-static {v11}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 2408
    .end local v5    # "sharePre":Landroid/content/SharedPreferences;
    .end local v6    # "strpassWord":Ljava/lang/String;
    .end local v7    # "struserName":Ljava/lang/String;
    :cond_8
    :goto_0
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->urlfilepath:Ljava/lang/String;

    invoke-static {v11}, Lcom/cloudclientsetting/until/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 2411
    .local v10, "xmlFile":Ljava/io/File;
    :try_start_1
    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2416
    :goto_1
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v4

    .line 2418
    .local v4, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_2
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;

    const-string/jumbo v12, "UTF-8"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 2419
    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 2421
    const-string/jumbo v11, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 2422
    const/4 v12, 0x1

    .line 2420
    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 2423
    const/4 v11, 0x0

    const-string/jumbo v12, "urlpath"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2425
    const/4 v11, 0x0

    const-string/jumbo v12, "ip"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2426
    invoke-interface {v4, v2}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2427
    const/4 v11, 0x0

    const-string/jumbo v12, "ip"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2430
    const/4 v11, 0x0

    const-string/jumbo v12, "showDemo"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2431
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->setDemoShow:Ljava/lang/String;

    invoke-interface {v4, v11}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2432
    const/4 v11, 0x0

    const-string/jumbo v12, "showDemo"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2433
    const/4 v11, 0x0

    const-string/jumbo v12, "urlpath"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2434
    const/4 v11, 0x0

    const-string/jumbo v12, "student"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2435
    const/4 v11, 0x0

    const-string/jumbo v12, "username"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2436
    invoke-interface {v4, v9}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2437
    const/4 v11, 0x0

    const-string/jumbo v12, "username"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2438
    const/4 v11, 0x0

    const-string/jumbo v12, "password"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2439
    invoke-interface {v4, v3}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2440
    const/4 v11, 0x0

    const-string/jumbo v12, "password"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2441
    const/4 v11, 0x0

    const-string/jumbo v12, "student"

    invoke-interface {v4, v11, v12}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2442
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 2443
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 2444
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;

    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 2449
    :goto_2
    return-void

    .line 2404
    .end local v4    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    .end local v10    # "xmlFile":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 2406
    .local v1, "e1":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 2412
    .end local v1    # "e1":Ljava/lang/Exception;
    .restart local v10    # "xmlFile":Ljava/io/File;
    :catch_1
    move-exception v0

    .line 2413
    .local v0, "e":Ljava/io/FileNotFoundException;
    const-string/jumbo v11, "FileNotFoundException"

    const-string/jumbo v12, "can\'t create FileOutputStream"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 2446
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .restart local v4    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_2
    move-exception v0

    .line 2447
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v11, "CloudClientSetActivity"

    const-string/jumbo v12, "error occurred while creating xml file"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method private writeXmlLanguage(Ljava/lang/String;)V
    .locals 6
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 2318
    const-string/jumbo v4, "CloudClientSetActivity"

    const-string/jumbo v5, "writeXml"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2319
    new-instance v1, Ljava/io/File;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->LANGUAGEPATH:Ljava/lang/String;

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2320
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2322
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 2325
    :cond_0
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2330
    :goto_0
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->LANGUAGEPATH:Ljava/lang/String;

    invoke-static {v4}, Lcom/cloudclientsetting/until/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 2333
    .local v3, "xmlFile":Ljava/io/File;
    :try_start_1
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2338
    :goto_1
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v2

    .line 2340
    .local v2, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_2
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;

    const-string/jumbo v5, "UTF-8"

    invoke-interface {v2, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 2341
    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 2343
    const-string/jumbo v4, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 2344
    const/4 v5, 0x1

    .line 2342
    invoke-interface {v2, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 2345
    const/4 v4, 0x0

    const-string/jumbo v5, "urlpath"

    invoke-interface {v2, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2347
    const/4 v4, 0x0

    const-string/jumbo v5, "language"

    invoke-interface {v2, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2348
    invoke-interface {v2, p1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2349
    const/4 v4, 0x0

    const-string/jumbo v5, "language"

    invoke-interface {v2, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 2350
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 2351
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 2352
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;

    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 2357
    :goto_2
    return-void

    .line 2326
    .end local v2    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    .end local v3    # "xmlFile":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 2328
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 2334
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v3    # "xmlFile":Ljava/io/File;
    :catch_1
    move-exception v0

    .line 2335
    .local v0, "e":Ljava/io/FileNotFoundException;
    const-string/jumbo v4, "FileNotFoundException"

    const-string/jumbo v5, "can\'t create FileOutputStream"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 2354
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .restart local v2    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_2
    move-exception v0

    .line 2355
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v4, "CloudClientSetActivity"

    const-string/jumbo v5, "error occurred while creating xml file"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method private writeXml_config(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 23
    .param p1, "privatekey"    # Ljava/lang/String;
    .param p2, "encrypt"    # Ljava/lang/String;
    .param p3, "apihost"    # Ljava/lang/String;
    .param p4, "domain"    # Ljava/lang/String;
    .param p5, "port"    # Ljava/lang/String;
    .param p6, "tigase_ip"    # Ljava/lang/String;
    .param p7, "mongo_domain"    # Ljava/lang/String;
    .param p8, "mongo_port"    # Ljava/lang/String;
    .param p9, "mongo_user"    # Ljava/lang/String;
    .param p10, "mongo_pwd"    # Ljava/lang/String;
    .param p11, "type"    # Ljava/lang/String;
    .param p12, "schoolid"    # Ljava/lang/String;
    .param p13, "schoolname"    # Ljava/lang/String;
    .param p14, "owncloudip"    # Ljava/lang/String;
    .param p15, "usercode"    # Ljava/lang/String;
    .param p16, "userid"    # Ljava/lang/String;
    .param p17, "guidancestate"    # Ljava/lang/String;
    .param p18, "truename"    # Ljava/lang/String;
    .param p19, "guidelearndownload"    # Ljava/lang/String;
    .param p20, "wifi"    # Ljava/lang/String;
    .param p21, "setting"    # Ljava/lang/String;
    .param p23, "guidenotes"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/mobilestudyclient/activity/AppBean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 3906
    .local p22, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    const-string/jumbo v20, "CloudClientSetActivity"

    const-string/jumbo v21, "writeXml"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3907
    if-eqz p1, :cond_0

    const-string/jumbo v20, ""

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_1

    .line 4252
    :cond_0
    :goto_0
    return-void

    .line 3911
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v20

    .line 3912
    invoke-interface/range {v20 .. v20}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v9

    .line 3911
    sput-object v9, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->MOBILESTUDYSERVERIP:Ljava/lang/String;

    .line 3914
    .local v9, "ip":Ljava/lang/String;
    const-string/jumbo v20, " "

    const-string/jumbo v21, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v9, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 3915
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v20

    const/16 v21, 0x7

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_2

    .line 3916
    const/16 v20, 0x0

    const/16 v21, 0x7

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v9, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    .line 3917
    .local v17, "subhttp":Ljava/lang/String;
    const-string/jumbo v20, "http://"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 3919
    const/16 v20, 0x7

    move/from16 v0, v20

    invoke-virtual {v9, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 3920
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ptfw_edit:Landroid/widget/EditText;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v9}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 3921
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v9}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 3922
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    .line 3923
    const v21, 0x7f0801dd

    .line 3922
    invoke-virtual/range {v20 .. v21}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    .line 3924
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const v21, 0x7f0801c1

    invoke-virtual/range {v20 .. v21}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 3928
    .end local v17    # "subhttp":Ljava/lang/String;
    :cond_2
    if-eqz v9, :cond_3

    if-eqz v9, :cond_3

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 3931
    :cond_3
    const-string/jumbo v20, " "

    const-string/jumbo v21, ""

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 3932
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v20

    const/16 v21, 0x7

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_4

    .line 3933
    const/16 v20, 0x0

    const/16 v21, 0x7

    move-object/from16 v0, p3

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    .line 3935
    .restart local v17    # "subhttp":Ljava/lang/String;
    const-string/jumbo v20, "http://"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_4

    .line 3936
    const/16 v20, 0x7

    move-object/from16 v0, p3

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    .line 3937
    const-string/jumbo v20, "Test2"

    .line 3938
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    .line 3939
    const v22, 0x7f0801dd

    .line 3938
    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 3937
    invoke-static/range {v20 .. v21}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3943
    .end local v17    # "subhttp":Ljava/lang/String;
    :cond_4
    const-string/jumbo v18, ""

    .line 3944
    .local v18, "username":Ljava/lang/String;
    const-string/jumbo v10, ""

    .line 3945
    .local v10, "password":Ljava/lang/String;
    const-string/jumbo v11, ""

    .line 3946
    .local v11, "pwd":Ljava/lang/String;
    const-string/jumbo v15, ""

    .line 3947
    .local v15, "stuid":Ljava/lang/String;
    const-string/jumbo v6, ""

    .line 3948
    .local v6, "gdstate":Ljava/lang/String;
    const-string/jumbo v16, ""

    .line 3949
    .local v16, "stuname":Ljava/lang/String;
    const-string/jumbo v7, ""

    .line 3950
    .local v7, "guidenote":Ljava/lang/String;
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v21, ":"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p15

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3953
    .local v3, "appendData":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Name:Ljava/lang/String;

    .line 3954
    .local v14, "struserName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->Pwd:Ljava/lang/String;

    .line 3955
    .local v13, "strpassWord":Ljava/lang/String;
    invoke-static {v14}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 3956
    invoke-static {v13}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 3957
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    const-string/jumbo v21, "md5"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_5

    .line 3958
    invoke-static {v13}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 3963
    :goto_1
    invoke-static/range {p1 .. p1}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3964
    invoke-static/range {p3 .. p3}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 3965
    invoke-static/range {p5 .. p5}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    .line 3966
    invoke-static/range {p4 .. p4}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 3967
    invoke-static/range {p6 .. p6}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p6

    .line 3968
    invoke-static/range {p7 .. p7}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p7

    .line 3969
    invoke-static/range {p8 .. p8}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p8

    .line 3970
    invoke-static/range {p9 .. p9}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p9

    .line 3971
    invoke-static/range {p10 .. p10}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p10

    .line 3972
    invoke-static/range {p11 .. p11}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p11

    .line 3973
    invoke-static/range {p12 .. p12}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p12

    .line 3974
    invoke-static/range {p13 .. p13}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p13

    .line 3975
    invoke-static/range {p14 .. p14}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p14

    .line 3976
    invoke-static/range {p15 .. p15}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p15

    .line 3977
    invoke-static/range {p16 .. p16}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 3978
    invoke-static/range {p17 .. p17}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3979
    invoke-static/range {p18 .. p18}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 3981
    invoke-static/range {p19 .. p19}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p19

    .line 3982
    invoke-static/range {p20 .. p20}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p20

    .line 3983
    invoke-static/range {p21 .. p21}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p21

    .line 3984
    invoke-static/range {p23 .. p23}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v7

    .line 3990
    .end local v13    # "strpassWord":Ljava/lang/String;
    .end local v14    # "struserName":Ljava/lang/String;
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->urlfilepath:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/cloudclientsetting/until/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v19

    .line 3993
    .local v19, "xmlFile":Ljava/io/File;
    :try_start_1
    new-instance v20, Ljava/io/FileOutputStream;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    .line 3998
    :goto_3
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v12

    .line 4000
    .local v12, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;

    move-object/from16 v20, v0

    const-string/jumbo v21, "UTF-8"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 4001
    const/16 v20, 0x0

    const/16 v21, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 4003
    const-string/jumbo v20, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 4004
    const/16 v21, 0x1

    .line 4002
    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 4006
    const/16 v20, 0x0

    :try_start_3
    const-string/jumbo v21, "urlpath"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 4009
    const/16 v20, 0x0

    :try_start_4
    const-string/jumbo v21, "ip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4010
    invoke-interface {v12, v9}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4011
    const/16 v20, 0x0

    const-string/jumbo v21, "ip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 4019
    :goto_4
    const/16 v20, 0x0

    :try_start_5
    const-string/jumbo v21, "showDemo"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4020
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->setDemoShow:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4021
    const/16 v20, 0x0

    const-string/jumbo v21, "showDemo"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 4027
    :goto_5
    const/16 v20, 0x0

    :try_start_6
    const-string/jumbo v21, "urlpath"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    .line 4034
    :goto_6
    const/16 v20, 0x0

    :try_start_7
    const-string/jumbo v21, "student"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 4036
    const/16 v20, 0x0

    :try_start_8
    const-string/jumbo v21, "stuid"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4037
    invoke-interface {v12, v15}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4038
    const/16 v20, 0x0

    const-string/jumbo v21, "stuid"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4040
    const/16 v20, 0x0

    const-string/jumbo v21, "usercode"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4041
    move-object/from16 v0, p15

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4042
    const/16 v20, 0x0

    const-string/jumbo v21, "usercode"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4044
    const/16 v20, 0x0

    const-string/jumbo v21, "username"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4045
    move-object/from16 v0, v18

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4046
    const/16 v20, 0x0

    const-string/jumbo v21, "username"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4048
    const/16 v20, 0x0

    const-string/jumbo v21, "password"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4049
    invoke-interface {v12, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4050
    const/16 v20, 0x0

    const-string/jumbo v21, "password"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4053
    const/16 v20, 0x0

    const-string/jumbo v21, "pwd"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4054
    invoke-interface {v12, v11}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4055
    const/16 v20, 0x0

    const-string/jumbo v21, "pwd"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4058
    const/16 v20, 0x0

    const-string/jumbo v21, "stuname"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4059
    move-object/from16 v0, v16

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4060
    const/16 v20, 0x0

    const-string/jumbo v21, "stuname"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    .line 4069
    :goto_7
    const/16 v20, 0x0

    :try_start_9
    const-string/jumbo v21, "privatekey"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4070
    move-object/from16 v0, p1

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4071
    const/16 v20, 0x0

    const-string/jumbo v21, "privatekey"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4074
    const/16 v20, 0x0

    const-string/jumbo v21, "encrypt"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4075
    move-object/from16 v0, p2

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4076
    const/16 v20, 0x0

    const-string/jumbo v21, "encrypt"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4079
    const/16 v20, 0x0

    const-string/jumbo v21, "apihost"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4080
    move-object/from16 v0, p3

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4081
    const/16 v20, 0x0

    const-string/jumbo v21, "apihost"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4084
    const/16 v20, 0x0

    const-string/jumbo v21, "domain"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4085
    move-object/from16 v0, p4

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4086
    const/16 v20, 0x0

    const-string/jumbo v21, "domain"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4088
    const/16 v20, 0x0

    const-string/jumbo v21, "port"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4089
    move-object/from16 v0, p5

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4090
    const/16 v20, 0x0

    const-string/jumbo v21, "port"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4092
    const/16 v20, 0x0

    const-string/jumbo v21, "tigase_ip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4093
    move-object/from16 v0, p6

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4094
    const/16 v20, 0x0

    const-string/jumbo v21, "tigase_ip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    .line 4102
    :goto_8
    const/16 v20, 0x0

    :try_start_a
    const-string/jumbo v21, "mongo_domain"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4103
    move-object/from16 v0, p7

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4104
    const/16 v20, 0x0

    const-string/jumbo v21, "mongo_domain"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4106
    const/16 v20, 0x0

    const-string/jumbo v21, "mongo_port"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4107
    move-object/from16 v0, p8

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4108
    const/16 v20, 0x0

    const-string/jumbo v21, "mongo_port"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4110
    const/16 v20, 0x0

    const-string/jumbo v21, "mongo_user"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4111
    move-object/from16 v0, p9

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4112
    const/16 v20, 0x0

    const-string/jumbo v21, "mongo_user"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4114
    const/16 v20, 0x0

    const-string/jumbo v21, "mongo_pwd"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4115
    move-object/from16 v0, p10

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4116
    const/16 v20, 0x0

    const-string/jumbo v21, "mongo_pwd"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9

    .line 4124
    :goto_9
    const/16 v20, 0x0

    :try_start_b
    const-string/jumbo v21, "user_type"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4125
    move-object/from16 v0, p11

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4126
    const/16 v20, 0x0

    const-string/jumbo v21, "user_type"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4128
    const/16 v20, 0x0

    const-string/jumbo v21, "schoolid"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4129
    move-object/from16 v0, p12

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4130
    const/16 v20, 0x0

    const-string/jumbo v21, "schoolid"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4132
    const/16 v20, 0x0

    const-string/jumbo v21, "schoolname"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4133
    move-object/from16 v0, p13

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4134
    const/16 v20, 0x0

    const-string/jumbo v21, "schoolname"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_a

    .line 4142
    :goto_a
    const/16 v20, 0x0

    :try_start_c
    const-string/jumbo v21, "owncloudip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4143
    move-object/from16 v0, p14

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4144
    const/16 v20, 0x0

    const-string/jumbo v21, "owncloudip"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_b

    .line 4151
    :goto_b
    const/16 v20, 0x0

    :try_start_d
    const-string/jumbo v21, "gdstate"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4152
    invoke-interface {v12, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4153
    const/16 v20, 0x0

    const-string/jumbo v21, "gdstate"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_c

    .line 4160
    :goto_c
    const/16 v20, 0x0

    :try_start_e
    const-string/jumbo v21, "guidenotes"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4161
    invoke-interface {v12, v7}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4162
    const/16 v20, 0x0

    const-string/jumbo v21, "guidenotes"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_d

    .line 4170
    :goto_d
    const/16 v20, 0x0

    :try_start_f
    const-string/jumbo v21, "guidelearndownload"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4171
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static/range {p19 .. p19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4172
    const/16 v20, 0x0

    const-string/jumbo v21, "guidelearndownload"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_11

    .line 4178
    :goto_e
    const/16 v20, 0x0

    :try_start_10
    const-string/jumbo v21, "wifi"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4179
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static/range {p20 .. p20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4180
    const/16 v20, 0x0

    const-string/jumbo v21, "wifi"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_10

    .line 4185
    :goto_f
    const/16 v20, 0x0

    :try_start_11
    const-string/jumbo v21, "setting"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4186
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-static/range {p21 .. p21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4187
    const/16 v20, 0x0

    const-string/jumbo v21, "setting"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_f

    .line 4191
    :goto_10
    const/16 v20, 0x0

    :try_start_12
    const-string/jumbo v21, "student"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_7

    .line 4197
    :goto_11
    const/16 v20, 0x0

    :try_start_13
    const-string/jumbo v21, "apps"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4198
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_12
    invoke-virtual/range {p22 .. p22}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    if-lt v8, v0, :cond_6

    .line 4239
    const/16 v20, 0x0

    const-string/jumbo v21, "apps"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_e

    .line 4245
    .end local v8    # "i":I
    :goto_13
    :try_start_14
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 4246
    invoke-interface {v12}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 4247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->fileos:Ljava/io/FileOutputStream;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/FileOutputStream;->close()V

    .line 4248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->settingHistory:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->appendUserInfo(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_0

    goto/16 :goto_0

    .line 4249
    :catch_0
    move-exception v4

    .line 4250
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 3960
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v12    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    .end local v19    # "xmlFile":Ljava/io/File;
    .restart local v13    # "strpassWord":Ljava/lang/String;
    .restart local v14    # "struserName":Ljava/lang/String;
    :cond_5
    :try_start_15
    invoke-static {v13}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_1

    move-result-object v10

    goto/16 :goto_1

    .line 3985
    .end local v13    # "strpassWord":Ljava/lang/String;
    .end local v14    # "struserName":Ljava/lang/String;
    :catch_1
    move-exception v5

    .line 3987
    .local v5, "e1":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2

    .line 3994
    .end local v5    # "e1":Ljava/lang/Exception;
    .restart local v19    # "xmlFile":Ljava/io/File;
    :catch_2
    move-exception v4

    .line 3995
    .local v4, "e":Ljava/io/FileNotFoundException;
    const-string/jumbo v20, "FileNotFoundException"

    const-string/jumbo v21, "can\'t create FileOutputStream"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 4012
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    .restart local v12    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_3
    move-exception v4

    .line 4014
    .local v4, "e":Ljava/lang/Exception;
    :try_start_16
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_4

    goto/16 :goto_4

    .line 4028
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_4
    move-exception v4

    .line 4030
    .restart local v4    # "e":Ljava/lang/Exception;
    :try_start_17
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_0

    goto/16 :goto_6

    .line 4022
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_5
    move-exception v4

    .line 4024
    .restart local v4    # "e":Ljava/lang/Exception;
    :try_start_18
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_4

    goto/16 :goto_5

    .line 4061
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_6
    move-exception v4

    .line 4063
    .restart local v4    # "e":Ljava/lang/Exception;
    :try_start_19
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_7

    goto/16 :goto_7

    .line 4192
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_7
    move-exception v4

    .line 4194
    .restart local v4    # "e":Ljava/lang/Exception;
    :try_start_1a
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_0

    goto :goto_11

    .line 4095
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_8
    move-exception v4

    .line 4097
    .restart local v4    # "e":Ljava/lang/Exception;
    :try_start_1b
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_8

    .line 4117
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_9
    move-exception v4

    .line 4119
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_9

    .line 4135
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_a
    move-exception v4

    .line 4137
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_a

    .line 4145
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_b
    move-exception v4

    .line 4147
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_b

    .line 4154
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_c
    move-exception v4

    .line 4156
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_c

    .line 4163
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_d
    move-exception v4

    .line 4165
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_7

    goto/16 :goto_d

    .line 4199
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v8    # "i":I
    :cond_6
    const/16 v20, 0x0

    :try_start_1c
    const-string/jumbo v21, "app"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4201
    const/16 v20, 0x0

    const-string/jumbo v21, "code"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4202
    move-object/from16 v0, p22

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual/range {v20 .. v20}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getCode()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4203
    const/16 v20, 0x0

    const-string/jumbo v21, "code"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4205
    const/16 v20, 0x0

    const-string/jumbo v21, "name"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4206
    move-object/from16 v0, p22

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual/range {v20 .. v20}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4207
    const/16 v20, 0x0

    const-string/jumbo v21, "name"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4209
    const/16 v20, 0x0

    const-string/jumbo v21, "color"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4210
    move-object/from16 v0, p22

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual/range {v20 .. v20}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4211
    const/16 v20, 0x0

    const-string/jumbo v21, "color"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4213
    const/16 v20, 0x0

    const-string/jumbo v21, "icon"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4214
    move-object/from16 v0, p22

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual/range {v20 .. v20}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIcon()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4215
    const/16 v20, 0x0

    const-string/jumbo v21, "icon"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4217
    const/16 v20, 0x0

    const-string/jumbo v21, "iconLocal"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4218
    move-object/from16 v0, p22

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual/range {v20 .. v20}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4219
    const/16 v20, 0x0

    const-string/jumbo v21, "iconLocal"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4221
    const/16 v20, 0x0

    const-string/jumbo v21, "enable"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4222
    new-instance v21, Ljava/lang/StringBuilder;

    move-object/from16 v0, p22

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual/range {v20 .. v20}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getEnable()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4223
    const/16 v20, 0x0

    const-string/jumbo v21, "enable"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4225
    const/16 v20, 0x0

    const-string/jumbo v21, "config"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4227
    const/16 v20, 0x0

    const-string/jumbo v21, "download"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4228
    move-object/from16 v0, p22

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual/range {v20 .. v20}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getConfig()Ljava/util/HashMap;

    move-result-object v20

    const-string/jumbo v21, "download"

    invoke-virtual/range {v20 .. v21}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4229
    const/16 v20, 0x0

    const-string/jumbo v21, "download"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4231
    const/16 v20, 0x0

    const-string/jumbo v21, "comment"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4232
    move-object/from16 v0, p22

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual/range {v20 .. v20}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getConfig()Ljava/util/HashMap;

    move-result-object v20

    const-string/jumbo v21, "comment"

    invoke-virtual/range {v20 .. v21}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-interface {v12, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4233
    const/16 v20, 0x0

    const-string/jumbo v21, "comment"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4235
    const/16 v20, 0x0

    const-string/jumbo v21, "config"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 4237
    const/16 v20, 0x0

    const-string/jumbo v21, "app"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v12, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_e

    .line 4198
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_12

    .line 4240
    .end local v8    # "i":I
    :catch_e
    move-exception v4

    .line 4241
    .restart local v4    # "e":Ljava/lang/Exception;
    :try_start_1d
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 4242
    const-string/jumbo v20, "CloudClientSetActivity"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "write to  xml file"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_0

    goto/16 :goto_13

    .line 4188
    .end local v4    # "e":Ljava/lang/Exception;
    :catch_f
    move-exception v20

    goto/16 :goto_10

    .line 4181
    :catch_10
    move-exception v20

    goto/16 :goto_f

    .line 4173
    :catch_11
    move-exception v20

    goto/16 :goto_e
.end method


# virtual methods
.method public final GetMachineID()Ljava/lang/String;
    .locals 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 3130
    const-string/jumbo v7, "phone"

    invoke-virtual {p0, v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/TelephonyManager;

    .line 3131
    .local v5, "tm":Landroid/telephony/TelephonyManager;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 3133
    .local v4, "sb":Ljava/lang/StringBuilder;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nModel = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3134
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nSerialNumber = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3135
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nDeviceId(IMEI) = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3137
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 3138
    const-string/jumbo v8, "android_id"

    .line 3137
    invoke-static {v7, v8}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 3139
    .local v0, "android_id":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nAndroidID = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3141
    const-string/jumbo v7, "wifi"

    invoke-virtual {p0, v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 3142
    .local v6, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v3

    .line 3143
    .local v3, "m_szWLANMAC":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 3145
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v7, 0x5

    if-le v2, v7, :cond_3

    .line 3161
    .end local v2    # "i":I
    :cond_0
    if-eqz v3, :cond_1

    const-string/jumbo v7, "02:00:00:00:00:00"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 3163
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getMacAddr()Ljava/lang/String;

    move-result-object v3

    .line 3165
    :cond_1
    if-nez v3, :cond_2

    .line 3167
    const-string/jumbo v3, ""

    .line 3169
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nMACAddress = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3170
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->toMd5([B)[B

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-static {v8, v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->toHexString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 3171
    const-string/jumbo v8, ":"

    const-string/jumbo v9, ""

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 3170
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 3148
    .restart local v2    # "i":I
    :cond_3
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v3

    .line 3149
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-gtz v7, :cond_0

    .line 3154
    :cond_4
    const-wide/16 v8, 0x7d0

    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3145
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 3155
    :catch_0
    move-exception v1

    .line 3157
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method public ModifyPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 18
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "oldpw"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;

    .prologue
    .line 3036
    const-string/jumbo v11, ""

    .line 3037
    .local v11, "result":Ljava/lang/String;
    const-string/jumbo v15, "privatekey"

    .line 3038
    const/16 v16, 0x0

    .line 3037
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 3039
    .local v12, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v15, "key"

    const-string/jumbo v16, ""

    move-object/from16 v0, v16

    invoke-interface {v12, v15, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 3040
    .local v9, "privatekey":Ljava/lang/String;
    const-string/jumbo v15, "apihost"

    const-string/jumbo v16, ""

    move-object/from16 v0, v16

    invoke-interface {v12, v15, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 3041
    .local v5, "ip":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->modifiedName:Ljava/lang/String;

    move-object/from16 p1, v0

    .line 3042
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->modifiedIP:Ljava/lang/String;

    .line 3043
    invoke-static {v5}, Lcom/cloudclientsetting/until/JsonHelper;->Update_Pwd_HTTPPOST_URL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 3045
    .local v14, "url":Ljava/lang/String;
    :try_start_0
    new-instance v8, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v8, v14}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 3046
    .local v8, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v15, "X-Edutech-Entity"

    move-object/from16 v0, p1

    invoke-virtual {v8, v15, v0}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 3047
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 3048
    .local v6, "imestamp":J
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 3052
    .local v13, "sign":Ljava/lang/String;
    const-string/jumbo v15, "X-Edutech-Sign"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v17, "+"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 3053
    const-string/jumbo v15, "Accept-Encoding"

    const-string/jumbo v16, "gzip,deflate"

    move-object/from16 v0, v16

    invoke-virtual {v8, v15, v0}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 3054
    new-instance v4, Lorg/apache/http/entity/mime/MultipartEntity;

    invoke-direct {v4}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>()V

    .line 3055
    .local v4, "entity":Lorg/apache/http/entity/mime/MultipartEntity;
    const-string/jumbo v15, "newPassWord"

    new-instance v16, Lorg/apache/http/entity/mime/content/StringBody;

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 3056
    const-string/jumbo v15, "oldPassWord"

    new-instance v16, Lorg/apache/http/entity/mime/content/StringBody;

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 3057
    invoke-virtual {v8, v4}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 3058
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 3059
    .local v2, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v2, v8}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    .line 3060
    .local v10, "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v11

    .line 3068
    .end local v2    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v4    # "entity":Lorg/apache/http/entity/mime/MultipartEntity;
    .end local v6    # "imestamp":J
    .end local v8    # "post":Lorg/apache/http/client/methods/HttpPost;
    .end local v10    # "response":Lorg/apache/http/HttpResponse;
    .end local v13    # "sign":Ljava/lang/String;
    :goto_0
    return-object v11

    .line 3061
    :catch_0
    move-exception v3

    .line 3063
    .local v3, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v3}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto :goto_0

    .line 3064
    .end local v3    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v3

    .line 3066
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public apkUpdate()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 691
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 726
    :cond_0
    :goto_0
    return-void

    .line 695
    :cond_1
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 696
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    .line 697
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0801d1

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 698
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0007

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 699
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    .line 700
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;

    if-nez v1, :cond_3

    .line 701
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 702
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    .line 703
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 704
    new-instance v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;

    invoke-direct {v1, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;

    .line 705
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->start()V

    .line 706
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateprogressThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;

    if-nez v1, :cond_2

    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNewUpdate:Z

    if-eqz v1, :cond_2

    .line 708
    new-instance v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;

    invoke-direct {v1, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateprogressThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;

    .line 709
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateprogressThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;->start()V

    .line 711
    :cond_2
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    if-eqz v1, :cond_0

    .line 715
    const/4 v1, 0x1

    sput-boolean v1, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    .line 716
    iput v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateTime:I

    .line 717
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    goto :goto_0

    .line 720
    .end local v0    # "msg":Landroid/os/Message;
    :cond_3
    iput-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateprogressThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateProgressThread;

    .line 721
    iput-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateThread:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;

    .line 722
    sput-boolean v4, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    .line 723
    const/16 v1, 0x12c

    iput v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updateTime:I

    goto :goto_0
.end method

.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 4
    .param p1, "newBase"    # Landroid/content/Context;

    .prologue
    .line 1788
    const-string/jumbo v2, "language"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1789
    .local v0, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "language"

    const-string/jumbo v3, "chinese"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1790
    .local v1, "type":Ljava/lang/String;
    invoke-static {p1, v1}, Lcom/edutech/mobilestudyclient/LanguageUtils;->attachBaseContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v2

    invoke-super {p0, v2}, Landroid/app/Activity;->attachBaseContext(Landroid/content/Context;)V

    .line 1791
    return-void
.end method

.method public deleteIp(Ljava/lang/String;)V
    .locals 4
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 4461
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    if-nez v2, :cond_0

    .line 4482
    :goto_0
    return-void

    .line 4465
    :cond_0
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    if-eqz v2, :cond_2

    .line 4467
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 4469
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4470
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ips:Ljava/util/List;

    invoke-virtual {v2, v3}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->setIps(Ljava/util/List;)V

    .line 4471
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipAdpter:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    invoke-virtual {v2}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->notifyDataSetChanged()V

    .line 4474
    :cond_1
    const-string/jumbo v2, "loginhistory"

    const/4 v3, 0x4

    invoke-virtual {p0, v2, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 4475
    .local v0, "loginSp":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "iphistoryString"

    const-string/jumbo v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 4477
    .local v1, "tempips":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, ",:,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 4478
    const-string/jumbo v2, ""

    invoke-virtual {v1, p1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 4479
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "iphistoryString"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 4481
    .end local v0    # "loginSp":Landroid/content/SharedPreferences;
    .end local v1    # "tempips":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    invoke-direct {p0, p1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameHistoryDeleteByIP(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v2

    iput-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    goto :goto_0
.end method

.method public deleteName(Ljava/lang/String;)V
    .locals 3
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 4861
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 4862
    .local v0, "ip":Ljava/lang/String;
    :goto_0
    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    if-nez v1, :cond_2

    .line 4873
    :cond_0
    :goto_1
    return-void

    .line 4861
    .end local v0    # "ip":Ljava/lang/String;
    :cond_1
    const-string/jumbo v0, ""

    goto :goto_0

    .line 4866
    .restart local v0    # "ip":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    invoke-direct {p0, v0, p1, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameHistoryDelete(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    .line 4867
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    invoke-direct {p0, v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameHistoryQuery(Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    .line 4868
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 4870
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_nameList:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->setIps(Ljava/util/List;)V

    .line 4871
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListAdapter:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    invoke-virtual {v1}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->notifyDataSetChanged()V

    goto :goto_1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1877
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v3

    .line 1878
    .local v3, "v":Landroid/view/View;
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 1880
    .local v1, "ret":Z
    instance-of v7, v3, Landroid/widget/EditText;

    if-eqz v7, :cond_1

    .line 1881
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v4

    .line 1882
    .local v4, "w":Landroid/view/View;
    const/4 v7, 0x2

    new-array v2, v7, [I

    .line 1883
    .local v2, "scrcoords":[I
    invoke-virtual {v4, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 1884
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v7

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v7, v8

    aget v8, v2, v9

    int-to-float v8, v8

    sub-float v5, v7, v8

    .line 1885
    .local v5, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v7, v8

    aget v8, v2, v10

    int-to-float v8, v8

    sub-float v6, v7, v8

    .line 1886
    .local v6, "y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    if-ne v7, v10, :cond_1

    .line 1887
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v7

    int-to-float v7, v7

    cmpg-float v7, v5, v7

    if-ltz v7, :cond_0

    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v7

    int-to-float v7, v7

    cmpl-float v7, v5, v7

    if-gez v7, :cond_0

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v7

    int-to-float v7, v7

    cmpg-float v7, v6, v7

    if-ltz v7, :cond_0

    .line 1888
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v7

    int-to-float v7, v7

    cmpl-float v7, v6, v7

    if-lez v7, :cond_1

    .line 1890
    :cond_0
    const-string/jumbo v7, "input_method"

    invoke-virtual {p0, v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 1891
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Window;->getCurrentFocus()Landroid/view/View;

    move-result-object v7

    .line 1892
    invoke-virtual {v7}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v7

    .line 1891
    invoke-virtual {v0, v7, v9}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1895
    .end local v0    # "imm":Landroid/view/inputmethod/InputMethodManager;
    .end local v2    # "scrcoords":[I
    .end local v4    # "w":Landroid/view/View;
    .end local v5    # "x":F
    .end local v6    # "y":F
    :cond_1
    return v1
.end method

.method public finish()V
    .locals 0

    .prologue
    .line 1940
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 1942
    return-void
.end method

.method public getMacAddr()Ljava/lang/String;
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 3177
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    .line 3178
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_1

    .line 3199
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :goto_0
    const-string/jumbo v5, ""

    :goto_1
    return-object v5

    .line 3178
    .restart local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :cond_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/NetworkInterface;

    .line 3179
    .local v3, "nif":Ljava/net/NetworkInterface;
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "wlan0"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 3181
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getHardwareAddress()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 3182
    .local v2, "macBytes":[B
    if-nez v2, :cond_2

    .line 3183
    const-string/jumbo v5, ""

    goto :goto_1

    .line 3186
    :cond_2
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 3187
    .local v4, "res1":Ljava/lang/StringBuilder;
    array-length v6, v2

    const/4 v5, 0x0

    :goto_2
    if-lt v5, v6, :cond_4

    .line 3191
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 3192
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 3194
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 3187
    :cond_4
    aget-byte v1, v2, v5

    .line 3188
    .local v1, "b":B
    new-instance v7, Ljava/lang/StringBuilder;

    and-int/lit16 v8, v1, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 3187
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 3196
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    .end local v1    # "b":B
    .end local v2    # "macBytes":[B
    .end local v3    # "nif":Ljava/net/NetworkInterface;
    .end local v4    # "res1":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public loadXml()V
    .locals 9

    .prologue
    .line 2452
    const-string/jumbo v7, "CloudClientSetActivity"

    const-string/jumbo v8, "loadXml"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2453
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->urlfilepath:Ljava/lang/String;

    invoke-static {v7}, Lcom/cloudclientsetting/until/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 2455
    .local v5, "xmlFile":Ljava/io/File;
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    iput-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->filein:Ljava/io/FileInputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2463
    :goto_0
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v4

    .line 2464
    .local v4, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v4}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v6

    .line 2465
    .local v6, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->filein:Ljava/io/FileInputStream;

    const-string/jumbo v8, "UTF-8"

    invoke-interface {v6, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 2466
    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6

    move-result v2

    .line 2467
    .local v2, "eventType":I
    :goto_1
    const/4 v7, 0x1

    if-ne v2, v7, :cond_1

    .line 2524
    .end local v2    # "eventType":I
    .end local v4    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :goto_2
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->filein:Ljava/io/FileInputStream;

    if-eqz v7, :cond_0

    .line 2527
    :try_start_2
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->filein:Ljava/io/FileInputStream;

    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    .line 2533
    :cond_0
    :goto_3
    return-void

    .line 2456
    :catch_0
    move-exception v1

    .line 2458
    .local v1, "e1":Ljava/io/FileNotFoundException;
    const-string/jumbo v7, "CloudClientSetActivity"

    const-string/jumbo v8, "FileNotFoundException"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2459
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 2468
    .end local v1    # "e1":Ljava/io/FileNotFoundException;
    .restart local v2    # "eventType":I
    .restart local v4    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_1
    :try_start_3
    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 2470
    .local v3, "nodeName":Ljava/lang/String;
    packed-switch v2, :pswitch_data_0

    .line 2511
    :cond_2
    :goto_4
    :pswitch_0
    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_1

    .line 2474
    :pswitch_1
    const-string/jumbo v7, "ip"

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 2476
    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipOrigal:Ljava/lang/String;

    .line 2477
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipOrigal:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2478
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipOrigal:Ljava/lang/String;

    iput-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->modifiedIP:Ljava/lang/String;

    .line 2480
    :cond_3
    const-string/jumbo v7, "username"

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6

    move-result v7

    if-eqz v7, :cond_4

    .line 2484
    :try_start_4
    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    .line 2483
    invoke-static {v7}, Lcom/cloudclientsetting/until/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2482
    iput-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameOrigal:Ljava/lang/String;

    .line 2485
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameOrigal:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2486
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameOrigal:Ljava/lang/String;

    iput-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->modifiedName:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_7

    .line 2492
    :cond_4
    :goto_5
    :try_start_5
    const-string/jumbo v7, "pwd"

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    move-result v7

    if-eqz v7, :cond_2

    .line 2496
    :try_start_6
    invoke-interface {v6}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    .line 2495
    invoke-static {v7}, Lcom/cloudclientsetting/until/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2494
    iput-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdOrigal:Ljava/lang/String;

    .line 2497
    iget-object v7, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_edit:Landroid/widget/EditText;

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdOrigal:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_7

    goto :goto_4

    .line 2499
    :catch_1
    move-exception v0

    .line 2501
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_7
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    goto :goto_4

    .line 2513
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v3    # "nodeName":Ljava/lang/String;
    .end local v4    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_2
    move-exception v0

    .line 2515
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_2

    .line 2487
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v2    # "eventType":I
    .restart local v3    # "nodeName":Ljava/lang/String;
    .restart local v4    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_3
    move-exception v0

    .line 2489
    .local v0, "e":Ljava/lang/Exception;
    :try_start_8
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_8} :catch_7
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_5

    .line 2516
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v3    # "nodeName":Ljava/lang/String;
    .end local v4    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_4
    move-exception v0

    .line 2518
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 2528
    .end local v0    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v0

    .line 2530
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_3

    .line 2521
    .end local v0    # "e":Ljava/io/IOException;
    :catch_6
    move-exception v7

    goto/16 :goto_2

    .line 2519
    :catch_7
    move-exception v7

    goto/16 :goto_2

    .line 2470
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public loadidXml()V
    .locals 1

    .prologue
    .line 2536
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2540
    .local v0, "sdk_version":I
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->loadidXml1()V

    .line 2542
    return-void
.end method

.method public loadidXml1()V
    .locals 18

    .prologue
    .line 2544
    const-string/jumbo v14, "CloudClientSetActivity"

    const-string/jumbo v15, "loadidXml"

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2545
    sget-object v14, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idfilepath:Ljava/lang/String;

    invoke-static {v14}, Lcom/cloudclientsetting/until/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v13

    .line 2546
    .local v13, "xmlFile":Ljava/io/File;
    const/4 v4, 0x0

    .local v4, "idString":Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "machineID":Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "resultString":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "times":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "date":Ljava/lang/String;
    const/4 v12, 0x0

    .line 2547
    .local v12, "usedTimes":Ljava/lang/String;
    const/4 v8, 0x0

    .line 2548
    .local v8, "result":I
    const/4 v3, 0x0

    .line 2549
    .local v3, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v13}, Ljava/io/File;->length()J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v14, v14, v16

    if-gtz v14, :cond_1

    .line 2609
    :cond_0
    :goto_0
    return-void

    .line 2551
    :cond_1
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/ActivityBase;->readIDFile()Ljava/util/List;

    move-result-object v3

    .line 2553
    if-eqz v3, :cond_0

    .line 2554
    const/4 v14, 0x0

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "idString":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 2555
    .restart local v4    # "idString":Ljava/lang/String;
    const/4 v14, 0x1

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "machineID":Ljava/lang/String;
    check-cast v7, Ljava/lang/String;

    .line 2556
    .restart local v7    # "machineID":Ljava/lang/String;
    const/4 v14, 0x2

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "resultString":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 2557
    .restart local v9    # "resultString":Ljava/lang/String;
    const/4 v14, 0x3

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "times":Ljava/lang/String;
    check-cast v11, Ljava/lang/String;

    .line 2558
    .restart local v11    # "times":Ljava/lang/String;
    const/4 v14, 0x4

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "date":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 2559
    .restart local v2    # "date":Ljava/lang/String;
    const/4 v14, 0x5

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "usedTimes":Ljava/lang/String;
    check-cast v12, Ljava/lang/String;

    .line 2560
    .restart local v12    # "usedTimes":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 2562
    const-string/jumbo v14, "idauthstring"

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 2563
    .local v10, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v14

    const-string/jumbo v15, "key"

    invoke-interface {v14, v15, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v14

    invoke-interface {v14}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2564
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idAuth_btn:Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0802fd

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 2566
    .end local v10    # "sp":Landroid/content/SharedPreferences;
    :cond_2
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_0

    .line 2567
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_0

    .line 2569
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 2571
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 2573
    .local v5, "idauth_value":Ljava/lang/StringBuilder;
    const/4 v14, 0x4

    if-ne v8, v14, :cond_7

    .line 2574
    const-string/jumbo v14, "\u6b63\u5f0f\u7248:"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2579
    :goto_1
    const/4 v14, 0x4

    if-eq v8, v14, :cond_3

    const/4 v14, 0x5

    if-ne v8, v14, :cond_4

    .line 2580
    :cond_3
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2582
    :cond_4
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v14

    const/4 v15, 0x2

    if-le v14, v15, :cond_9

    .line 2583
    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "\n\u6709\u6548\u671f\u9650\uff1a"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2586
    :cond_5
    :goto_2
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_6

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    if-lez v14, :cond_6

    .line 2590
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_a

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    if-ltz v14, :cond_a

    .line 2591
    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "\n\u4f7f\u7528/\u6388\u6743\u6b21\u6570\uff1a"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2595
    :cond_6
    :goto_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/16 v15, 0x32

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setHeight(I)V

    .line 2597
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "\n"

    invoke-virtual {v14, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 2599
    .local v6, "items":[Ljava/lang/String;
    if-nez v6, :cond_b

    .line 2600
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/high16 v15, 0x41900000    # 18.0f

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setTextSize(F)V

    .line 2606
    :goto_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    invoke-virtual {v14, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2575
    .end local v6    # "items":[Ljava/lang/String;
    :cond_7
    const/4 v14, 0x5

    if-ne v8, v14, :cond_8

    .line 2576
    const-string/jumbo v14, "\u6d4b\u8bd5\u7248:"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 2578
    :cond_8
    const-string/jumbo v14, "\u672a\u6ce8\u518c"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 2584
    :cond_9
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_5

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_5

    .line 2585
    const-string/jumbo v14, "\n\u6709\u6548\u671f\u9650\uff1a\u65e0\u9650\u5236"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 2593
    :cond_a
    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "\n\u6388\u6743\u6b21\u6570\uff1a"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 2601
    .restart local v6    # "items":[Ljava/lang/String;
    :cond_b
    array-length v14, v6

    const/4 v15, 0x1

    if-ne v14, v15, :cond_c

    .line 2602
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/high16 v15, 0x41700000    # 15.0f

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setTextSize(F)V

    goto :goto_4

    .line 2604
    :cond_c
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/high16 v15, 0x41400000    # 12.0f

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setTextSize(F)V

    goto :goto_4
.end method

.method public loadidXml2()V
    .locals 18

    .prologue
    .line 2614
    new-instance v13, Ljava/io/File;

    sget-object v14, Lcom/edutech/idauthentication/Aduth;->filepathMobileStudyClient_NEW:Ljava/lang/String;

    invoke-direct {v13, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2615
    .local v13, "xmlFile":Ljava/io/File;
    const/4 v4, 0x0

    .local v4, "idString":Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "machineID":Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "resultString":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "times":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "date":Ljava/lang/String;
    const/4 v12, 0x0

    .line 2616
    .local v12, "usedTimes":Ljava/lang/String;
    const/4 v8, 0x0

    .line 2617
    .local v8, "result":I
    const/4 v3, 0x0

    .line 2618
    .local v3, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string/jumbo v14, "setting"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string/jumbo v16, "auth:"

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2619
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_1

    invoke-virtual {v13}, Ljava/io/File;->length()J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v14, v14, v16

    if-gtz v14, :cond_1

    .line 2678
    :cond_0
    :goto_0
    return-void

    .line 2622
    :cond_1
    invoke-static {}, Lcom/edutech/idauthentication/FileUtils;->readIDFile()Ljava/util/List;

    move-result-object v3

    .line 2623
    const-string/jumbo v14, "setting"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string/jumbo v16, "auth:"

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2624
    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v14

    if-lez v14, :cond_0

    .line 2625
    const/4 v14, 0x0

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "idString":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 2626
    .restart local v4    # "idString":Ljava/lang/String;
    const/4 v14, 0x1

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "machineID":Ljava/lang/String;
    check-cast v7, Ljava/lang/String;

    .line 2627
    .restart local v7    # "machineID":Ljava/lang/String;
    const/4 v14, 0x2

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "resultString":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 2628
    .restart local v9    # "resultString":Ljava/lang/String;
    const/4 v14, 0x3

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "times":Ljava/lang/String;
    check-cast v11, Ljava/lang/String;

    .line 2629
    .restart local v11    # "times":Ljava/lang/String;
    const/4 v14, 0x4

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "date":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 2630
    .restart local v2    # "date":Ljava/lang/String;
    const/4 v14, 0x5

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "usedTimes":Ljava/lang/String;
    check-cast v12, Ljava/lang/String;

    .line 2631
    .restart local v12    # "usedTimes":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 2632
    const-string/jumbo v14, "idauthstring"

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 2633
    .local v10, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v14

    const-string/jumbo v15, "key"

    invoke-interface {v14, v15, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v14

    invoke-interface {v14}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2634
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idAuth_btn:Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    .line 2635
    const v16, 0x7f0802fd

    .line 2634
    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 2637
    .end local v10    # "sp":Landroid/content/SharedPreferences;
    :cond_2
    if-eqz v9, :cond_0

    if-eqz v4, :cond_0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_0

    .line 2638
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_0

    .line 2640
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 2642
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 2644
    .local v5, "idauth_value":Ljava/lang/StringBuilder;
    const/4 v14, 0x4

    if-ne v8, v14, :cond_7

    .line 2645
    const-string/jumbo v14, "\u6b63\u5f0f\u7248:"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2650
    :goto_1
    const/4 v14, 0x4

    if-eq v8, v14, :cond_3

    const/4 v14, 0x5

    if-ne v8, v14, :cond_4

    .line 2651
    :cond_3
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2653
    :cond_4
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v14

    const/4 v15, 0x2

    if-le v14, v15, :cond_9

    .line 2654
    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "\n\u6709\u6548\u671f\u9650\uff1a"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2657
    :cond_5
    :goto_2
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_6

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    if-lez v14, :cond_6

    .line 2659
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_a

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    if-ltz v14, :cond_a

    .line 2660
    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "\n\u4f7f\u7528/\u6388\u6743\u6b21\u6570\uff1a"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2664
    :cond_6
    :goto_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/16 v15, 0x32

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setHeight(I)V

    .line 2666
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "\n"

    invoke-virtual {v14, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 2668
    .local v6, "items":[Ljava/lang/String;
    if-nez v6, :cond_b

    .line 2669
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/high16 v15, 0x41600000    # 14.0f

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setTextSize(F)V

    .line 2674
    :goto_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 2675
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 2646
    .end local v6    # "items":[Ljava/lang/String;
    :cond_7
    const/4 v14, 0x5

    if-ne v8, v14, :cond_8

    .line 2647
    const-string/jumbo v14, "\u6d4b\u8bd5\u7248:"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 2649
    :cond_8
    const-string/jumbo v14, "\u672a\u6ce8\u518c"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 2655
    :cond_9
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_5

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    if-nez v14, :cond_5

    .line 2656
    const-string/jumbo v14, "\n\u6709\u6548\u671f\u9650\uff1a\u65e0\u9650\u5236"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 2662
    :cond_a
    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "\n\u6388\u6743\u6b21\u6570\uff1a"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 2670
    .restart local v6    # "items":[Ljava/lang/String;
    :cond_b
    array-length v14, v6

    const/4 v15, 0x1

    if-ne v14, v15, :cond_c

    .line 2671
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/high16 v15, 0x41400000    # 12.0f

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setTextSize(F)V

    goto :goto_4

    .line 2673
    :cond_c
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/high16 v15, 0x41200000    # 10.0f

    invoke-virtual {v14, v15}, Landroid/widget/EditText;->setTextSize(F)V

    goto :goto_4
.end method

.method public okIp(Ljava/lang/String;)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 4449
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    if-eqz v0, :cond_0

    .line 4451
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->listpop:Landroid/widget/ListPopupWindow;

    invoke-virtual {v0}, Landroid/widget/ListPopupWindow;->dismiss()V

    .line 4453
    :cond_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    .line 4455
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 4457
    :cond_1
    return-void
.end method

.method public okName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 4878
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    if-eqz v0, :cond_0

    .line 4880
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListpop:Landroid/widget/ListPopupWindow;

    invoke-virtual {v0}, Landroid/widget/ListPopupWindow;->dismiss()V

    .line 4882
    :cond_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    .line 4884
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 4886
    :cond_1
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 2681
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 2683
    const/4 v3, 0x3

    if-ne p1, v3, :cond_4

    .line 2684
    const/4 v3, -0x1

    if-ne p2, v3, :cond_3

    .line 2685
    const-string/jumbo v3, "SCAN_RESULT"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2686
    .local v0, "contents":Ljava/lang/String;
    const-string/jumbo v3, "SCAN_RESULT_FORMAT"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2687
    .local v1, "format":Ljava/lang/String;
    const-string/jumbo v3, "id"

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    if-nez v5, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, ","

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v0, :cond_2

    const-string/jumbo v2, "null"

    :goto_0
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2688
    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    if-eqz v2, :cond_1

    .line 2689
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2697
    .end local v0    # "contents":Ljava/lang/String;
    .end local v1    # "format":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .restart local v0    # "contents":Ljava/lang/String;
    .restart local v1    # "format":Ljava/lang/String;
    :cond_2
    move-object v2, v0

    .line 2687
    goto :goto_0

    .line 2691
    .end local v0    # "contents":Ljava/lang/String;
    .end local v1    # "format":Ljava/lang/String;
    :cond_3
    const-string/jumbo v3, "RESULT_NOT_OK"

    invoke-static {p0, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 2692
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 2695
    :cond_4
    const-string/jumbo v3, "ZXING_SCAN<>3"

    invoke-static {p0, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 1782
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 1783
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 17
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 2083
    const-string/jumbo v14, "CloudClientSetActivity"

    const-string/jumbo v15, "onClick"

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2084
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v14

    sparse-switch v14, :sswitch_data_0

    .line 2245
    :cond_0
    :goto_0
    :sswitch_0
    return-void

    .line 2086
    :sswitch_1
    invoke-direct/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showServiceDialog()V

    goto :goto_0

    .line 2089
    :sswitch_2
    invoke-direct/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showClearDialog()V

    goto :goto_0

    .line 2092
    :sswitch_3
    new-instance v2, Landroid/content/Intent;

    const-class v14, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v14}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2093
    .local v2, "appControlIntent":Landroid/content/Intent;
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 2096
    .end local v2    # "appControlIntent":Landroid/content/Intent;
    :sswitch_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnTitleBack:Landroid/widget/Button;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setEnabled(Z)V

    .line 2097
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ok_btn:Landroid/widget/Button;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setEnabled(Z)V

    .line 2098
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ok_btn:Landroid/widget/Button;

    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0801bf

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 2100
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    invoke-virtual {v14}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v14

    invoke-interface {v14}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->JXHD_Ip:Ljava/lang/String;

    .line 2101
    invoke-direct/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->needPwdDialog()Z

    move-result v14

    if-eqz v14, :cond_2

    .line 2103
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->threadPwd:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    if-nez v14, :cond_1

    .line 2105
    new-instance v14, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->threadPwd:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    .line 2106
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->threadPwd:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;

    invoke-virtual {v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$HostPwd;->start()V

    .line 2108
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showConfirmPwdDialog()V

    goto :goto_0

    .line 2111
    :cond_2
    new-instance v14, Ljava/lang/Thread;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->runnable_GetConfig_Infor:Ljava/lang/Runnable;

    invoke-direct {v14, v15}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v14}, Ljava/lang/Thread;->start()V

    goto :goto_0

    .line 2116
    :sswitch_5
    invoke-direct/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatePassword()V

    goto :goto_0

    .line 2120
    :sswitch_6
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdate()V

    goto/16 :goto_0

    .line 2123
    :sswitch_7
    invoke-direct/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->exit()V

    goto/16 :goto_0

    .line 2126
    :sswitch_8
    invoke-direct/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->exit()V

    goto/16 :goto_0

    .line 2131
    :sswitch_9
    const-string/jumbo v12, "zte.com.wilink"

    .line 2132
    .local v12, "pkg":Ljava/lang/String;
    const-string/jumbo v3, "zte.com.wilink.wifi.WifiSettingActivity"

    .line 2134
    .local v3, "cls":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v14, v12, v15}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    .line 2139
    .local v11, "packageInfo":Landroid/content/pm/PackageInfo;
    :goto_1
    if-eqz v11, :cond_0

    .line 2140
    new-instance v4, Landroid/content/ComponentName;

    invoke-direct {v4, v12, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2141
    .local v4, "componet":Landroid/content/ComponentName;
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8}, Landroid/content/Intent;-><init>()V

    .line 2142
    .local v8, "intent":Landroid/content/Intent;
    invoke-virtual {v8, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 2143
    const/high16 v14, 0x10000000

    invoke-virtual {v8, v14}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2144
    const-string/jumbo v14, "android.intent.action.MAIN"

    invoke-virtual {v8, v14}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2145
    const-string/jumbo v14, "android.intent.category.LAUNCHER"

    invoke-virtual {v8, v14}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 2146
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 2135
    .end local v4    # "componet":Landroid/content/ComponentName;
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v11    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v6

    .line 2136
    .local v6, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v11, 0x0

    .line 2137
    .restart local v11    # "packageInfo":Landroid/content/pm/PackageInfo;
    invoke-virtual {v6}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 2152
    .end local v3    # "cls":Ljava/lang/String;
    .end local v6    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v11    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v12    # "pkg":Ljava/lang/String;
    :sswitch_a
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->registerDialog:Landroid/app/AlertDialog;

    if-nez v14, :cond_4

    .line 2155
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v7

    .line 2156
    .local v7, "inflater":Landroid/view/LayoutInflater;
    const v15, 0x7f030024

    .line 2157
    const v14, 0x7f0a0092

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/view/ViewGroup;

    .line 2156
    invoke-virtual {v7, v15, v14}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    .line 2158
    .local v10, "layout":Landroid/view/View;
    const v14, 0x7f0a0093

    invoke-virtual {v10, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    .line 2161
    const-string/jumbo v14, "idauthstring"

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v13

    .line 2162
    .local v13, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v14, "key"

    invoke-interface {v13, v14}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 2164
    const-string/jumbo v14, "key"

    const-string/jumbo v15, ""

    invoke-interface {v13, v14, v15}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2165
    .local v9, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->id:Landroid/widget/EditText;

    invoke-virtual {v14, v9}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2167
    .end local v9    # "key":Ljava/lang/String;
    :cond_3
    new-instance v14, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2168
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0801db

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v14

    .line 2169
    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v14

    .line 2170
    invoke-virtual {v14, v10}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v14

    .line 2172
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0801db

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 2173
    new-instance v16, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;

    invoke-direct/range {v16 .. v17}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$19;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 2171
    invoke-virtual/range {v14 .. v16}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v14

    .line 2193
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, 0x7f0801dc

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 2194
    new-instance v16, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$20;

    invoke-direct/range {v16 .. v17}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$20;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 2192
    invoke-virtual/range {v14 .. v16}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2208
    .local v1, "alertDialog":Landroid/app/AlertDialog$Builder;
    const v14, 0x7f0a0094

    invoke-virtual {v10, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    .line 2210
    .local v5, "dialogButton":Landroid/widget/Button;
    new-instance v14, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$21;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$21;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v5, v14}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2226
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->registerDialog:Landroid/app/AlertDialog;

    .line 2228
    .end local v1    # "alertDialog":Landroid/app/AlertDialog$Builder;
    .end local v5    # "dialogButton":Landroid/widget/Button;
    .end local v7    # "inflater":Landroid/view/LayoutInflater;
    .end local v10    # "layout":Landroid/view/View;
    .end local v13    # "sp":Landroid/content/SharedPreferences;
    :cond_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->registerDialog:Landroid/app/AlertDialog;

    if-eqz v14, :cond_0

    .line 2230
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->registerDialog:Landroid/app/AlertDialog;

    invoke-virtual {v14}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 2238
    :sswitch_b
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->back_btn:Landroid/widget/Button;

    const/16 v15, 0x8

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_0

    .line 2084
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0a015d -> :sswitch_9
        0x7f0a0208 -> :sswitch_8
        0x7f0a0209 -> :sswitch_1
        0x7f0a020a -> :sswitch_3
        0x7f0a020b -> :sswitch_2
        0x7f0a020d -> :sswitch_b
        0x7f0a0210 -> :sswitch_0
        0x7f0a0214 -> :sswitch_0
        0x7f0a0215 -> :sswitch_0
        0x7f0a0217 -> :sswitch_a
        0x7f0a021a -> :sswitch_4
        0x7f0a021b -> :sswitch_5
        0x7f0a021e -> :sswitch_6
        0x7f0a0220 -> :sswitch_7
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v4, 0x400

    const/4 v6, 0x0

    .line 1350
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 1352
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v4, v4}, Landroid/view/Window;->setFlags(II)V

    .line 1355
    const-string/jumbo v3, "language"

    invoke-virtual {p0, v3, v6}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1356
    .local v1, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "language"

    const-string/jumbo v4, "chinese"

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1357
    .local v2, "type":Ljava/lang/String;
    const-string/jumbo v3, "en"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1358
    const-string/jumbo v3, "chinese"

    invoke-static {p0, v3}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    .line 1362
    :goto_0
    const v3, 0x7f030082

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->setContentView(I)V

    .line 1363
    const-string/jumbo v3, "CloudClientSetActivity"

    const-string/jumbo v4, "onCreate"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1364
    iput-object p0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mContext:Landroid/content/Context;

    .line 1365
    const v3, 0x7f0a0211

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    .line 1366
    const v3, 0x7f0a020f

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ptfw_edit:Landroid/widget/EditText;

    .line 1367
    const v3, 0x7f0a0212

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    .line 1368
    const v3, 0x7f0a0213

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_edit:Landroid/widget/EditText;

    .line 1369
    new-instance v3, Landroid/content/ComponentName;

    const-string/jumbo v4, "com.example.demo"

    const-string/jumbo v5, "MainActivity"

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->cn:Landroid/content/ComponentName;

    .line 1370
    new-instance v3, Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    invoke-direct {v3, p0}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    .line 1371
    const v3, 0x7f0a021a

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ok_btn:Landroid/widget/Button;

    .line 1372
    const v3, 0x7f0a0220

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->cancel_btn:Landroid/widget/Button;

    .line 1373
    const v3, 0x7f0a015d

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->wifi_btn:Landroid/widget/Button;

    .line 1374
    const v3, 0x7f0a0217

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idAuth_btn:Landroid/widget/Button;

    .line 1375
    const v3, 0x7f0a0214

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_update:Landroid/widget/Button;

    .line 1376
    const v3, 0x7f0a0215

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_reset:Landroid/widget/Button;

    .line 1377
    const v3, 0x7f0a020d

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->back_btn:Landroid/widget/Button;

    .line 1378
    const v3, 0x7f0a0208

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnTitleBack:Landroid/widget/Button;

    .line 1379
    const v3, 0x7f0a020a

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnAppControl:Landroid/widget/Button;

    .line 1381
    const v3, 0x7f0a021d

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvCurrVersion:Landroid/widget/TextView;

    .line 1382
    const v3, 0x7f0a0210

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnUpdate:Landroid/widget/Button;

    .line 1383
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnUpdate:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1384
    const v3, 0x7f0a020b

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnReset:Landroid/widget/Button;

    .line 1385
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnReset:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1387
    const v3, 0x7f0a0209

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnServiceControl:Landroid/widget/Button;

    .line 1388
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnServiceControl:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1393
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mBluetooth:Landroid/bluetooth/BluetoothAdapter;

    .line 1394
    const v3, 0x7f0a020c

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnbluetoothControl:Landroid/widget/Button;

    .line 1395
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mBluetooth:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mBluetooth:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1396
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnbluetoothControl:Landroid/widget/Button;

    const-string/jumbo v4, "\u5173\u95ed\u84dd\u7259"

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1400
    :goto_1
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnbluetoothControl:Landroid/widget/Button;

    new-instance v4, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$13;

    invoke-direct {v4, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$13;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1423
    const v3, 0x7f0a021b

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdatePass:Landroid/widget/TextView;

    .line 1424
    const v3, 0x7f0a021e

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    .line 1425
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdatePass:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1426
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdateNow:Landroid/widget/TextView;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1427
    sget-boolean v3, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNLEZ:Z

    if-eqz v3, :cond_0

    .line 1429
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->tvUpdatePass:Landroid/widget/TextView;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1431
    :cond_0
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ok_btn:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1432
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->cancel_btn:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1433
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->wifi_btn:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1434
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idAuth_btn:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1435
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_update:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1436
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_reset:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1437
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->back_btn:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1438
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnTitleBack:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1439
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnAppControl:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1440
    const v3, 0x7f0a0216

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    .line 1441
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 1443
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->idauth_edit:Landroid/widget/EditText;

    const/high16 v4, -0x10000

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setTextColor(I)V

    .line 1444
    const v3, 0x7f0a0218

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->languageSw:Landroid/widget/LinearLayout;

    .line 1445
    const v3, 0x7f0a0219

    invoke-virtual {p0, v3}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->language_t:Landroid/widget/TextView;

    .line 1447
    const-string/jumbo v3, "en"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1449
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->language_t:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0801ff

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1454
    :goto_2
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->languageSw:Landroid/widget/LinearLayout;

    new-instance v4, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$14;

    invoke-direct {v4, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$14;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1462
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    .line 1463
    const/4 v4, 0x3

    .line 1462
    invoke-virtual {v3, v4}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 1466
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ptfw_edit:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ptfw_edit:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setSelection(I)V

    .line 1467
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getCurrApkInfo()V

    .line 1468
    sget-boolean v3, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isZBYZ:Z

    if-eqz v3, :cond_1

    .line 1470
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1471
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1472
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->password_edit:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->pwdWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1474
    :cond_1
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ip_edit:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ipListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1477
    :try_start_0
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->stu_name:Ljava/lang/String;

    .line 1478
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameHistoryParser()Lorg/json/JSONArray;

    move-result-object v3

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1482
    :goto_3
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    if-nez v3, :cond_2

    .line 1484
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->history_array:Lorg/json/JSONArray;

    .line 1486
    :cond_2
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->username_edit:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->nameListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1487
    new-instance v3, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;

    invoke-direct {v3, p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    iput-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installReceiver:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;

    .line 1488
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1489
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v3, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1490
    const-string/jumbo v3, "package"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 1491
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installReceiver:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;

    invoke-virtual {p0, v3, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1492
    return-void

    .line 1360
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_3
    const-string/jumbo v3, "en"

    invoke-static {p0, v3}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1398
    :cond_4
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->btnbluetoothControl:Landroid/widget/Button;

    const-string/jumbo v4, "\u5f00\u542f\u84dd\u7259"

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 1452
    :cond_5
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->language_t:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0801fe

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 1479
    :catch_0
    move-exception v3

    goto :goto_3
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 1928
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1929
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->closeProgressDialog()V

    .line 1930
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->resetUpdateInfo()V

    .line 1931
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installReceiver:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;

    if-eqz v0, :cond_0

    .line 1933
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->installReceiver:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$InstallReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1935
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1796
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 1798
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->closeProgressDialog()V

    .line 1799
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->resetUpdateInfo()V

    .line 1802
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 1901
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 1902
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->loadXml()V

    .line 1903
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->loadidXml()V

    .line 1904
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isover:Z

    .line 1905
    const-string/jumbo v0, "onresume"

    const-string/jumbo v1, "onresume"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1906
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1908
    :try_start_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->progressDialog:Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->apkUpdateList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->setData(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1913
    :cond_0
    :goto_0
    return-void

    .line 1909
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public showToast(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 3249
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mToast:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 3250
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 3252
    :cond_0
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mToast:Landroid/widget/Toast;

    .line 3253
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 3254
    return-void
.end method
