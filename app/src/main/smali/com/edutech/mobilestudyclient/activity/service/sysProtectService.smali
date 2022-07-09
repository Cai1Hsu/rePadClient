.class public Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;
.super Landroid/app/Service;
.source "sysProtectService.java"


# static fields
.field public static final ADDINSTALL:Ljava/lang/String; = "com.launch.addapks"

.field public static final FOREGROUND_ID:I = 0x0

.field public static final INSTALL:Ljava/lang/String; = "com.edutech.install"

.field public static final INSTALLAPK:Ljava/lang/String; = "com.launch.install"

.field public static final Intent_STATUSBAR_INVISIBILITY:Ljava/lang/String; = "android.intent.action.STATUSBAR_INVISIBILITY"

.field public static final Intent_STATUSBAR_VISIBILITY:Ljava/lang/String; = "android.intent.action.STATUSBAR_VISIBILITY"

.field public static final OFF_LIVE_SHOW:Ljava/lang/String; = "com.edutech.liveshow.off"

.field public static final ON_LIVE_SHOW:Ljava/lang/String; = "com.edutech.liveshow.on"

.field public static final RESTART_TIMER:Ljava/lang/String; = "com.edutech.restarttimer"

.field public static final SERVICE_START:Ljava/lang/String; = "com.edutech.startservice"

.field public static final Samsung_MDM:Ljava/lang/String; = "android.intent.action.mdm"

.field public static final TAG:Ljava/lang/String; = "LockTask"

.field public static final UNSTALLAPK:Ljava/lang/String; = "com.launch.uninstall"

.field public static final USEDESIGNDESKTOP:Ljava/lang/String; = "com.edutech.design"

.field private static final YJ_HIDE_FLOATVIEW:Ljava/lang/String; = "android.yj.hide.floatview"

.field private static final YJ_SHOW_FLOATVIEW:Ljava/lang/String; = "android.yj.show.floatview"


# instance fields
.field private final APKInstallReceiver:Landroid/content/BroadcastReceiver;

.field private BlackDialogReceiver:Landroid/content/BroadcastReceiver;

.field private final NetworkReceiver:Landroid/content/BroadcastReceiver;

.field private addedApps:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private blackDialog:Landroid/app/Dialog;

.field private cn:Landroid/content/ComponentName;

.field lockTask:Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;

.field logUploadTask:Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

.field private mDeviceAdmin:Landroid/content/ComponentName;

.field private mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

.field private mTimer:Ljava/util/Timer;

.field private mTimerLogUpload:Ljava/util/Timer;

.field private usbReceiver:Lcom/edutech/mobilestudyclient/UsbReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->addedApps:Ljava/util/List;

    .line 211
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$1;-><init>(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->BlackDialogReceiver:Landroid/content/BroadcastReceiver;

    .line 374
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;-><init>(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->APKInstallReceiver:Landroid/content/BroadcastReceiver;

    .line 511
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$3;-><init>(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->NetworkReceiver:Landroid/content/BroadcastReceiver;

    .line 60
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
    .line 776
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    .line 777
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

    .line 778
    .local v5, "proc":Ljava/lang/Process;
    invoke-virtual {v5}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 779
    .local v2, "inputstream":Ljava/io/InputStream;
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 780
    .local v3, "inputstreamreader":Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 781
    .local v0, "bufferedreader":Ljava/io/BufferedReader;
    const-string/jumbo v4, ""

    .line 782
    .local v4, "line":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 783
    .local v8, "sb":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 787
    :try_start_0
    invoke-virtual {v5}, Ljava/lang/Process;->waitFor()I

    move-result v9

    if-eqz v9, :cond_0

    .line 788
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

    .line 794
    :cond_0
    :goto_1
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 795
    .local v6, "result":Ljava/lang/String;
    const-string/jumbo v9, "Success"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 796
    const-string/jumbo v9, "InstallApkUtil"

    const-string/jumbo v10, "SlientInstall success"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 797
    const/4 v9, 0x1

    .line 800
    :goto_2
    return v9

    .line 784
    .end local v6    # "result":Ljava/lang/String;
    :cond_1
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 790
    :catch_0
    move-exception v1

    .line 791
    .local v1, "e":Ljava/lang/InterruptedException;
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v9, v1}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_1

    .line 799
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .restart local v6    # "result":Ljava/lang/String;
    :cond_2
    const-string/jumbo v9, "InstallApkUtil"

    const-string/jumbo v10, "SlientInstall failed"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 800
    const/4 v9, 0x0

    goto :goto_2
.end method

.method static synthetic access$0(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$1(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    return-void
.end method

.method static synthetic access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->addedApps:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$3(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 83
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->addedApps:Ljava/util/List;

    return-void
.end method

.method static synthetic access$4(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 626
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->installNewApk(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$5(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/Timer;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$6(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/util/Timer;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    return-void
.end method

.method static synthetic access$7(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/Timer;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$8(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Ljava/util/Timer;)V
    .locals 0

    .prologue
    .line 61
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    return-void
.end method

.method static synthetic access$9(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V
    .locals 0

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startTimer()V

    return-void
.end method

.method private apkIntentInstall(Ljava/lang/String;)V
    .locals 4
    .param p1, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 723
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 724
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "com.edutech.install"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 725
    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->sendBroadcast(Landroid/content/Intent;)V

    .line 726
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 727
    .local v0, "installIntent":Landroid/content/Intent;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    .line 728
    const-string/jumbo v3, "application/vnd.android.package-archive"

    .line 727
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 729
    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 730
    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startActivity(Landroid/content/Intent;)V

    .line 731
    return-void
.end method

.method private static apkIntentUninstall(Ljava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 902
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 903
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "com.edutech.install"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 904
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 905
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "package:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 906
    .local v1, "packageURI":Landroid/net/Uri;
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.DELETE"

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 907
    .local v2, "uninstallIntent":Landroid/content/Intent;
    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 908
    invoke-virtual {p1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 909
    return-void
.end method

.method private static apkUninstall(Ljava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 867
    const-string/jumbo v2, "uninstall"

    const-string/jumbo v3, "apkUninstall enter"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 869
    :try_start_0
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SuSlientUninstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 870
    const-string/jumbo v2, "uninstall"

    const-string/jumbo v3, "SuSlientUninstall 1 false"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 871
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SlientUninstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 873
    const-string/jumbo v2, "uninstall"

    const-string/jumbo v3, "SlientUninstall 1 false"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 874
    invoke-static {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkIntentUninstall(Ljava/lang/String;Landroid/content/Context;)V

    .line 899
    :goto_0
    return-void

    .line 877
    :cond_0
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SlientInstall\u5378\u8f7d\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 881
    :catch_0
    move-exception v0

    .line 882
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 884
    :try_start_1
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SuSlientUninstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 886
    invoke-static {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkIntentUninstall(Ljava/lang/String;Landroid/content/Context;)V

    .line 887
    const-string/jumbo v2, "uninstall"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":apkIntentUninstall\u5378\u8f7d\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 891
    :catch_1
    move-exception v1

    .line 893
    .local v1, "e1":Ljava/lang/Exception;
    invoke-static {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkIntentUninstall(Ljava/lang/String;Landroid/content/Context;)V

    .line 894
    const-string/jumbo v2, "uninstall"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":apkIntentUninstall\u5378\u8f7d\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 879
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "e1":Ljava/lang/Exception;
    :cond_1
    :try_start_2
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SuSlientInstall\u5378\u8f7d\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 890
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_3
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SuSlientInstall\u5378\u8f7d\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_0
.end method

.method private apkinstall(Ljava/lang/String;)V
    .locals 5
    .param p1, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 698
    :try_start_0
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 699
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 700
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkIntentInstall(Ljava/lang/String;)V

    .line 719
    :goto_0
    return-void

    .line 702
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

    .line 706
    :catch_0
    move-exception v0

    .line 708
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p1}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 709
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkIntentInstall(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 712
    :catch_1
    move-exception v1

    .line 714
    .local v1, "e1":Ljava/lang/Exception;
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkIntentInstall(Ljava/lang/String;)V

    .line 715
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

    .line 704
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

    .line 711
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
    .line 684
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 685
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.SILENCE_INSTALL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 686
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "M1016Pro"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 687
    const-string/jumbo v1, "uri"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 692
    :goto_0
    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->sendBroadcast(Landroid/content/Intent;)V

    .line 694
    return-void

    .line 689
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 690
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 689
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private static apkuninstall_samsung(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 857
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 858
    .local v0, "intent1":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.SILENCE_UNINSTALL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 859
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "M1016Pro"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 860
    const-string/jumbo v1, "pgk"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 864
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 865
    return-void

    .line 862
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "package://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private static clientInstall(Ljava/lang/String;)Z
    .locals 7
    .param p0, "apkPath"    # Ljava/lang/String;

    .prologue
    .line 734
    const/4 v0, 0x0

    .line 735
    .local v0, "PrintWriter":Ljava/io/PrintWriter;
    const/4 v3, 0x0

    .line 737
    .local v3, "process":Ljava/lang/Process;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    const-string/jumbo v6, "su"

    invoke-virtual {v5, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 738
    new-instance v1, Ljava/io/PrintWriter;

    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 739
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

    .line 741
    const-string/jumbo v5, "export LD_LIBRARY_PATH=/vendor/lib:/system/lib"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 742
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "pm install -r "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 744
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 745
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 746
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v4

    .line 747
    .local v4, "value":I
    invoke-static {v4}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->returnResult(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v5

    .line 751
    if-eqz v3, :cond_0

    .line 752
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    :cond_0
    move-object v0, v1

    .line 755
    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .end local v4    # "value":I
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    :goto_0
    return v5

    .line 748
    :catch_0
    move-exception v2

    .line 749
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 751
    if-eqz v3, :cond_1

    .line 752
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 755
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 750
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 751
    :goto_2
    if-eqz v3, :cond_2

    .line 752
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 754
    :cond_2
    throw v5

    .line 750
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_2

    .line 748
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_1
.end method

.method private installNewApk(Ljava/lang/String;)V
    .locals 6
    .param p1, "apkpath"    # Ljava/lang/String;

    .prologue
    .line 627
    if-nez p1, :cond_1

    .line 681
    :cond_0
    :goto_0
    return-void

    .line 630
    :cond_1
    new-instance v2, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    .line 631
    .local v2, "mMiaMdmPolicyManager":Landroid/app/mia/MiaMdmPolicyManager;
    const/4 v0, 0x0

    .line 633
    .local v0, "boo":Z
    :try_start_0
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    invoke-virtual {v4, v5}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    .line 640
    :goto_1
    move-object v3, p1

    .line 642
    .local v3, "path":Ljava/lang/String;
    const-string/jumbo v4, ".apk"

    invoke-virtual {v3, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 646
    if-eqz v0, :cond_2

    .line 649
    :try_start_1
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    invoke-virtual {v4, v5, p1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->installPackage(Landroid/content/ComponentName;Ljava/lang/String;)V

    .line 650
    const-string/jumbo v4, "aaaa"

    const-string/jumbo v5, "bbbbbb"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 652
    :catch_0
    move-exception v4

    goto :goto_0

    .line 635
    .end local v3    # "path":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 637
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v4, "exception"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 638
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 654
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "path":Ljava/lang/String;
    :cond_2
    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "A10-70LC"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "TB-8703N"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "TB-8604F"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "A10-70F"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "YiJiao"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "YOGATablet2-1050LC"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 655
    :cond_3
    invoke-virtual {v2, p1}, Landroid/app/mia/MiaMdmPolicyManager;->silentInstall(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 660
    :cond_4
    :try_start_2
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 661
    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "M1016Pro"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "P990S.V"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "S1016PRO"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "D13B"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "QC80A"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "N5110ZB"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, ".T360Z"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "P583"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "P350"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "P550"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "M856.V"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "S1016.V1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "S106.V1"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    sget-object v4, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v5, "S1016E"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_5

    .line 662
    const-string/jumbo v4, "apkinstall"

    const-string/jumbo v5, "apkinstall"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 664
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkinstall(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 676
    :catch_2
    move-exception v4

    goto/16 :goto_0

    .line 669
    :cond_5
    const-string/jumbo v4, "apkinstall"

    const-string/jumbo v5, "apkinstall_samsung"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkinstall_samsung(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0
.end method

.method private static returnResult(I)Z
    .locals 2
    .param p0, "value"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 760
    if-nez p0, :cond_0

    .line 765
    :goto_0
    return v0

    .line 762
    :cond_0
    if-ne p0, v0, :cond_1

    move v0, v1

    .line 763
    goto :goto_0

    :cond_1
    move v0, v1

    .line 765
    goto :goto_0
.end method

.method private startTimer()V
    .locals 8

    .prologue
    const-wide/16 v2, 0x32

    const/4 v7, 0x0

    .line 85
    const-string/jumbo v0, "LockTask"

    const-string/jumbo v1, "startTimer"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    .line 89
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->lockTask:Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;

    .line 90
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->lockTask:Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;

    const-wide/16 v4, 0x64

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 92
    :cond_0
    const-string/jumbo v0, "livemode"

    invoke-virtual {p0, v0, v7}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 93
    .local v6, "tempSp":Landroid/content/SharedPreferences;
    const-string/jumbo v0, "islive"

    invoke-interface {v6, v0, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->isLiveShow:Z

    .line 94
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    if-nez v0, :cond_1

    .line 95
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    .line 96
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->logUploadTask:Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

    .line 97
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->logUploadTask:Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

    const-wide/32 v4, 0x493e0

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 99
    :cond_1
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "islive"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 100
    return-void
.end method

.method public static uninstall(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 10
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 804
    if-nez p0, :cond_0

    .line 851
    :goto_0
    return v6

    .line 808
    :cond_0
    const/4 v0, 0x0

    .line 809
    .local v0, "boo":Z
    new-instance v1, Landroid/content/ComponentName;

    const-string/jumbo v8, "com.launcher.activity"

    .line 810
    const-class v9, Lcom/edutech/appmanage/utils/ApkController;

    invoke-virtual {v9}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    .line 809
    invoke-direct {v1, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 813
    .local v1, "cn":Landroid/content/ComponentName;
    new-instance v4, Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    invoke-direct {v4, p1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;-><init>(Landroid/content/Context;)V

    .line 814
    .local v4, "mHwPDM":Lcom/huawei/android/app/admin/HwDevicePolicyManager;
    new-instance v5, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-direct {v5, p1}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    .line 816
    .local v5, "mMiaMdmPolicyManager":Landroid/app/mia/MiaMdmPolicyManager;
    :try_start_0
    invoke-virtual {v4, v1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 823
    :goto_1
    if-eqz v0, :cond_1

    .line 826
    const/4 v8, 0x1

    :try_start_1
    invoke-virtual {v4, v1, p0, v8}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->uninstallPackage(Landroid/content/ComponentName;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move v6, v7

    .line 827
    goto :goto_0

    .line 818
    :catch_0
    move-exception v2

    .line 820
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v8, "exception"

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 821
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 828
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 829
    .restart local v2    # "e":Ljava/lang/Exception;
    goto :goto_0

    .line 831
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "A10-70LC"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "TB-8703N"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "TB-8604F"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "A10-70F"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "YiJiao"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "YOGATablet2-1050LC"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 832
    :cond_2
    invoke-virtual {v5, p0}, Landroid/app/mia/MiaMdmPolicyManager;->silentUnInstall(Ljava/lang/String;)V

    move v6, v7

    .line 834
    goto :goto_0

    .line 838
    :cond_3
    :try_start_2
    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "M1016Pro"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P990S.V"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "S1016PRO"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "D13B"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "QC80A"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "N5110ZB"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, ".T360Z"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P583"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P350"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P550"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "M856.V"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "S1016.V1"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "S106.V1"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "S1016E"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_4

    .line 839
    const-string/jumbo v8, "uninstall"

    const-string/jumbo v9, "apkUninstall"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 840
    invoke-static {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkUninstall(Ljava/lang/String;Landroid/content/Context;)V

    :goto_2
    move v6, v7

    .line 848
    goto/16 :goto_0

    .line 846
    :cond_4
    invoke-static {p0, p1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->apkuninstall_samsung(Ljava/lang/String;Landroid/content/Context;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    .line 849
    :catch_2
    move-exception v3

    .line 851
    .local v3, "e2":Ljava/lang/Exception;
    goto/16 :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 103
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 107
    const-string/jumbo v5, "LockTask"

    const-string/jumbo v6, "onCreate"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 109
    const/4 v5, 0x0

    new-instance v6, Landroid/app/Notification;

    invoke-direct {v6}, Landroid/app/Notification;-><init>()V

    invoke-virtual {p0, v5, v6}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startForeground(ILandroid/app/Notification;)V

    .line 110
    new-instance v5, Landroid/content/ComponentName;

    const-string/jumbo v6, "com.example.demo"

    const-string/jumbo v7, "MainActivity"

    invoke-direct {v5, v6, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    .line 112
    new-instance v5, Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    invoke-direct {v5, p0}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    .line 114
    :try_start_0
    const-string/jumbo v5, "exception"

    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v8, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    invoke-virtual {v7, v8}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    invoke-virtual {v5, v6}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 117
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->setRecentTaskButtonDisabled(Landroid/content/ComponentName;Z)V

    .line 119
    :cond_0
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    invoke-virtual {v5, v6}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isStatusBarExpandPanelDisabled(Landroid/content/ComponentName;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 121
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->setStatusBarExpandPanelDisabled(Landroid/content/ComponentName;Z)V

    .line 123
    :cond_1
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->setSafeModeDisabled(Landroid/content/ComponentName;Z)V

    .line 124
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mHwPDM:Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->cn:Landroid/content/ComponentName;

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->setBluetoothDisabled(Landroid/content/ComponentName;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    :goto_0
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 131
    .local v2, "intentFilter":Landroid/content/IntentFilter;
    const-string/jumbo v5, "PASSWDPASS"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 132
    const-string/jumbo v5, "ENTERPASS"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 133
    const-string/jumbo v5, "android.intent.action.STATUSBAR_INVISIBILITY"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 134
    const-string/jumbo v5, "android.intent.action.STATUSBAR_VISIBILITY"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 135
    const-string/jumbo v5, "android.intent.action.mdm"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 136
    const-string/jumbo v5, "com.edutech.install"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 137
    const-string/jumbo v5, "com.launch.install"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 138
    const-string/jumbo v5, "com.launch.uninstall"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 139
    const-string/jumbo v5, "com.launch.addapks"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 140
    const-string/jumbo v5, "com.edutech.restarttimer"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 141
    const-string/jumbo v5, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 142
    const-string/jumbo v5, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 143
    const-string/jumbo v5, "com.edutech.design"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 144
    const-string/jumbo v5, "com.edutech.liveshow.on"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 145
    const-string/jumbo v5, "com.edutech.liveshow.off"

    invoke-virtual {v2, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 146
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->NetworkReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v5, v2}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 147
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 148
    .local v1, "intentApkFilter":Landroid/content/IntentFilter;
    const-string/jumbo v5, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v1, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 149
    const-string/jumbo v5, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v1, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 150
    const-string/jumbo v5, "package"

    invoke-virtual {v1, v5}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 151
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->APKInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v5, v1}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 152
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .line 153
    .local v3, "intentFilter3":Landroid/content/IntentFilter;
    sget-object v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_LOCKWINDOW:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 154
    sget-object v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_UNLOCKWINDOW:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 155
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->BlackDialogReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v5, v3}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 156
    new-instance v5, Lcom/edutech/mobilestudyclient/UsbReceiver;

    invoke-direct {v5}, Lcom/edutech/mobilestudyclient/UsbReceiver;-><init>()V

    iput-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->usbReceiver:Lcom/edutech/mobilestudyclient/UsbReceiver;

    .line 157
    new-instance v4, Landroid/content/IntentFilter;

    invoke-direct {v4}, Landroid/content/IntentFilter;-><init>()V

    .line 158
    .local v4, "usbFilter":Landroid/content/IntentFilter;
    const-string/jumbo v5, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v4, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 159
    const-string/jumbo v5, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v4, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 160
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->usbReceiver:Lcom/edutech/mobilestudyclient/UsbReceiver;

    invoke-virtual {p0, v5, v4}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 161
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v6, "com.edutech.startservice"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->sendBroadcast(Landroid/content/Intent;)V

    .line 162
    return-void

    .line 125
    .end local v1    # "intentApkFilter":Landroid/content/IntentFilter;
    .end local v2    # "intentFilter":Landroid/content/IntentFilter;
    .end local v3    # "intentFilter3":Landroid/content/IntentFilter;
    .end local v4    # "usbFilter":Landroid/content/IntentFilter;
    :catch_0
    move-exception v0

    .line 127
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v5, "exception"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 187
    const-string/jumbo v0, "LockTask"

    const-string/jumbo v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->stopForeground(Z)V

    .line 189
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->lockTask:Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;

    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;->cancel()Z

    .line 192
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 193
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 194
    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimer:Ljava/util/Timer;

    .line 195
    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->lockTask:Lcom/edutech/mobilestudyclient/activity/service/sysProtectTimer;

    .line 197
    :cond_0
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 199
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->logUploadTask:Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->cancel()Z

    .line 200
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 201
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 202
    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->mTimerLogUpload:Ljava/util/Timer;

    .line 203
    iput-object v2, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->logUploadTask:Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

    .line 205
    :cond_1
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->NetworkReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 206
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->APKInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 207
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->BlackDialogReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 208
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->usbReceiver:Lcom/edutech/mobilestudyclient/UsbReceiver;

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 209
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 210
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 179
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startTimer()V

    .line 180
    const-string/jumbo v0, "LockTask"

    const-string/jumbo v1, "onStartCommand"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .locals 8
    .param p1, "rootIntent"    # Landroid/content/Intent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 167
    const-string/jumbo v3, "LockTask"

    const-string/jumbo v4, "onTaskRemoved"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 170
    .local v1, "restartServiceIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x1

    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v3, v4, v1, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 173
    .local v2, "restartServicePendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "alarm"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 174
    .local v0, "alarmService":Landroid/app/AlarmManager;
    const/4 v3, 0x3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    add-long/2addr v4, v6

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 175
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    .line 176
    return-void
.end method

.method public showDialog(Ljava/lang/String;)V
    .locals 10
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x400

    const/4 v8, 0x0

    .line 237
    const/4 v0, 0x0

    .line 238
    .local v0, "canshow":Z
    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "A10-70LC"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "TB-8703N"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "TB-8604F"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "A10-70F"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "YiJiao"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "YOGATablet2-1050LC"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 240
    :cond_0
    const/4 v0, 0x1

    .line 242
    :cond_1
    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "M1016Pro"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P990S.V"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "S1016PRO"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "D13B"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "QC80A"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P583"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "N5110ZB"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, ".T360Z"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P350"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "P550"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "M856.V"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "S1016.V1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "S106.V1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-gez v5, :cond_2

    sget-object v5, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v6, "S1016E"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-ltz v5, :cond_3

    .line 244
    :cond_2
    const/4 v0, 0x1

    .line 246
    :cond_3
    if-nez v0, :cond_5

    .line 373
    :cond_4
    :goto_0
    return-void

    .line 250
    :cond_5
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    if-nez v5, :cond_4

    .line 253
    new-instance v5, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f09001c

    invoke-direct {v5, v6, v7}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    .line 254
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f03000b

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 255
    .local v3, "view":Landroid/view/View;
    new-instance v2, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v2, v9, v9}, Landroid/view/WindowManager$LayoutParams;-><init>(II)V

    .line 256
    .local v2, "params":Landroid/view/WindowManager$LayoutParams;
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    invoke-virtual {v5, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 257
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    invoke-virtual {v5, v8}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 259
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/16 v6, 0x77

    invoke-virtual {v5, v6}, Landroid/view/Window;->setGravity(I)V

    .line 260
    const v5, 0x7f0a0030

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 261
    .local v4, "wifiTxt":Landroid/widget/TextView;
    const v5, 0x7f0a0031

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 262
    .local v1, "infoTxt":Landroid/widget/TextView;
    const-string/jumbo v5, "1"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 264
    sget-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v5, :cond_6

    .line 266
    const-string/jumbo v5, "\u8fdd\u89c4\u64cd\u4f5c\uff0c\u82e5\u518d\u6b21\u8fdd\u89c4\uff0c\u5e73\u677f\u5c06\u4e0d\u53ef\u7528\u3002\n \u6e29\u99a8\u63d0\u793a\uff1a\u5e73\u677f\u662f\u5de5\u5177\uff0c\u4e0d\u662f\u73a9\u5177\uff0c\u8bf7\u541b\u81ea\u91cd\u3002"

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    :goto_1
    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 284
    :goto_2
    new-instance v5, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;

    invoke-direct {v5, p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;-><init>(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 360
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/16 v6, 0x7d3

    invoke-virtual {v5, v6}, Landroid/view/Window;->setType(I)V

    .line 361
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    new-instance v6, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$5;

    invoke-direct {v6, p0}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$5;-><init>(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 371
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->blackDialog:Landroid/app/Dialog;

    invoke-virtual {v5}, Landroid/app/Dialog;->show()V

    goto/16 :goto_0

    .line 270
    :cond_6
    const-string/jumbo v5, "\u8fdd\u89c4\u64cd\u4f5c\uff0c\u5e73\u677f\u5c06\u9501\u5b9a\u4e94\u5206\u949f\uff0c\u82e5\u518d\u6b21\u8fdd\u89c4\uff0c\u5e73\u677f\u5c06\u88ab\u957f\u671f\u9501\u5b9a\u3002"

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 275
    :cond_7
    sget-boolean v5, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSNZT:Z

    if-eqz v5, :cond_8

    .line 277
    const-string/jumbo v5, "\u8fdd\u89c4\u64cd\u4f5c\uff0c\u5e73\u677f\u5c06\u6c38\u8fdc\u4e0d\u80fd\u4f7f\u7528\uff01\uff01\uff01"

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    :goto_3
    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    .line 280
    :cond_8
    const-string/jumbo v5, "\u975e\u6cd5\u64cd\u4f5c,\u8bf7\u901f\u4e0e\u8001\u5e08\u8054\u7cfb\uff01\uff01\uff01"

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3
.end method
