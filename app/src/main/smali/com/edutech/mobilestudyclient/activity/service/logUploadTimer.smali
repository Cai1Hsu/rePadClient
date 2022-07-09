.class public Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;
.super Ljava/util/TimerTask;
.source "logUploadTimer.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "logUploadTimer"

.field public static invalidApkInstall:Z

.field private static ip:Ljava/lang/String;

.field static logUploadShared:Landroid/content/SharedPreferences;

.field private static mContext:Landroid/content/Context;

.field private static padstate:I

.field private static password:Ljava/lang/String;

.field private static privatekey:Ljava/lang/String;

.field static sb:Ljava/lang/StringBuilder;

.field private static stuid:Ljava/lang/String;

.field private static username:Ljava/lang/String;


# instance fields
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

.field private illegalPackages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mActivityManager:Landroid/app/ActivityManager;

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


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 72
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    .line 73
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    .line 74
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->password:Ljava/lang/String;

    .line 75
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->privatekey:Ljava/lang/String;

    .line 76
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->stuid:Ljava/lang/String;

    .line 79
    sput-boolean v1, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->invalidApkInstall:Z

    .line 81
    sput v1, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->hashmap:Ljava/util/HashMap;

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->illegalPackages:Ljava/util/List;

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->myappList:Ljava/util/List;

    .line 85
    sput-object p1, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    .line 86
    sget-object v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "LogUpLoad"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->logUploadShared:Landroid/content/SharedPreferences;

    .line 87
    return-void
.end method

.method public static IsLocked()Z
    .locals 5

    .prologue
    .line 662
    sget-object v2, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v3, "lockscreen"

    const/4 v4, 0x4

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 663
    .local v1, "spf":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "locked"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 664
    .local v0, "locked":Z
    return v0
.end method

.method private addLogData()V
    .locals 14

    .prologue
    const-wide/16 v12, 0x0

    .line 478
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v8, "lockscreen"

    const/4 v9, 0x4

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 479
    .local v6, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "installpkg"

    const-string/jumbo v8, ""

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 480
    .local v1, "installPkg":Ljava/lang/String;
    const-string/jumbo v7, "installtime"

    invoke-interface {v6, v7, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 481
    .local v2, "installTime":J
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getOtherApps()Ljava/lang/String;

    move-result-object v0

    .line 482
    .local v0, "addApps":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v2

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    const-wide/16 v10, 0x3c

    div-long v4, v8, v10

    .line 483
    .local v4, "leavetime":J
    sget v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    packed-switch v7, :pswitch_data_0

    .line 513
    :pswitch_0
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    const-string/jumbo v8, ",\"statusnum\":\"5\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, ",\"statusinfo\":\""

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ".\"}"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 516
    :goto_0
    return-void

    .line 486
    :pswitch_1
    cmp-long v7, v2, v12

    if-lez v7, :cond_0

    const-wide/16 v8, 0x5a0

    cmp-long v7, v4, v8

    if-gez v7, :cond_0

    .line 488
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    const-string/jumbo v8, ",\"statusnum\":\"1\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 489
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, ",\"statusinfo\":\""

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ".\"}"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 492
    :cond_0
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    const-string/jumbo v8, ",\"statusnum\":\"0\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 493
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, ",\"statusinfo\":\"No problem found."

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\"}"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 497
    :pswitch_2
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    const-string/jumbo v8, ",\"statusnum\":\"2\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, ",\"statusinfo\":\"\u9ed8\u8ba4\u7535\u5b50\u4e66\u5305\u684c\u9762\u88ab\u4fee\u6539."

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\"}"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 501
    :pswitch_3
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    const-string/jumbo v8, ",\"statusnum\":\"2\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, ",\"statusinfo\":\"\u6ca1\u6709\u5b89\u88c5\u767d\u540d\u5355\u7ba1\u63a7\u5e94\u7528."

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\"}"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 505
    :pswitch_4
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    const-string/jumbo v8, ",\"statusnum\":\"1\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, ",\"statusinfo\":\" "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ".\"}"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 509
    :pswitch_5
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    const-string/jumbo v8, ",\"statusnum\":\"8\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, ",\"statusinfo\":\"\u5e73\u677f\u5df2\u7ecf\u88ab\u9501."

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\"}"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 483
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method public static chechDeviceStatus()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 907
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->IsLocked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 908
    const/16 v0, 0x8

    .line 918
    :cond_0
    :goto_0
    return v0

    .line 909
    :cond_1
    sget-object v1, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/util/DensityUtil;->isMyLauncherDefault(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 910
    const/4 v0, 0x1

    goto :goto_0

    .line 911
    :cond_2
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->isProtectExist()Z

    move-result v1

    if-nez v1, :cond_3

    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->openBMD:Z

    if-eqz v1, :cond_3

    .line 912
    const/4 v0, 0x2

    goto :goto_0

    .line 913
    :cond_3
    sget-boolean v1, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->invalidApkInstall:Z

    if-eqz v1, :cond_0

    .line 915
    sput-boolean v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->invalidApkInstall:Z

    goto :goto_0
.end method

.method static checkTime()Z
    .locals 10

    .prologue
    const-wide/16 v8, 0x3e8

    const-wide/16 v6, 0x0

    .line 944
    sget-object v3, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->logUploadShared:Landroid/content/SharedPreferences;

    const-string/jumbo v4, "lastTime"

    invoke-interface {v3, v4, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 945
    .local v2, "lastTime":Ljava/lang/Long;
    sget-object v3, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->logUploadShared:Landroid/content/SharedPreferences;

    const-string/jumbo v4, "delayTime"

    invoke-interface {v3, v4, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 948
    .local v1, "delayTime":Ljava/lang/Long;
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 949
    .local v0, "currentDate":Ljava/util/Date;
    const-string/jumbo v3, "logUploadTimer"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "currentDate.getTime()/1000 is "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    div-long/2addr v6, v8

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 950
    const-string/jumbo v3, "logUploadTimer"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "delayTime is "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 951
    const-string/jumbo v3, "logUploadTimer"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "lastTime is "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 952
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    div-long/2addr v4, v8

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-lez v3, :cond_0

    .line 953
    const/4 v3, 0x1

    .line 954
    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private delete(Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 147
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 148
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_1

    .line 165
    :cond_0
    return-void

    .line 152
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 153
    .local v1, "files":[Ljava/io/File;
    if-eqz v1, :cond_0

    .line 155
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-ge v2, v4, :cond_0

    .line 157
    aget-object v3, v1, v2

    .line 158
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

    .line 155
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 162
    :cond_2
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->deleteFiles(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private deleteCameraFiles()V
    .locals 8

    .prologue
    .line 98
    const-string/jumbo v6, "delete"

    const-string/jumbo v7, "deleteCameraFiles"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    sget-object v6, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    .line 100
    invoke-static {v6}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .line 101
    invoke-virtual {v6}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, "OPEN_DCIM":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string/jumbo v6, ""

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 132
    :cond_0
    return-void

    .line 106
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

    .line 107
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

    .line 108
    .local v2, "file2":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 110
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 111
    .local v3, "files":[Ljava/io/File;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v6, v3

    if-lt v4, v6, :cond_4

    .line 120
    .end local v3    # "files":[Ljava/io/File;
    .end local v4    # "i":I
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 122
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 123
    .restart local v3    # "files":[Ljava/io/File;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_1
    array-length v6, v3

    if-ge v4, v6, :cond_0

    .line 125
    aget-object v5, v3, v4

    .line 126
    .local v5, "tempFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 128
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 123
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 113
    .end local v5    # "tempFile":Ljava/io/File;
    :cond_4
    aget-object v5, v3, v4

    .line 114
    .restart local v5    # "tempFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 116
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 111
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public static deleteFiles(Ljava/lang/String;)V
    .locals 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 167
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 168
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 169
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 170
    .local v1, "files":[Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-lt v2, v4, :cond_2

    .line 181
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    :cond_0
    :goto_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 182
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 184
    :cond_1
    return-void

    .line 171
    .restart local v1    # "files":[Ljava/io/File;
    .restart local v2    # "i":I
    :cond_2
    aget-object v4, v1, v2

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 173
    .local v3, "newPath":Ljava/lang/String;
    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->deleteFiles(Ljava/lang/String;)V

    .line 170
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 176
    .end local v1    # "files":[Ljava/io/File;
    .end local v2    # "i":I
    .end local v3    # "newPath":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 177
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_1
.end method

.method private deleteOtherFiles()V
    .locals 6

    .prologue
    .line 135
    const-string/jumbo v4, "delete"

    const-string/jumbo v5, "deleteOtherFiles"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
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

    .line 137
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

    .line 138
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

    .line 139
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

    .line 140
    .local v2, "newOffline":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->delete(Ljava/lang/String;)V

    .line 141
    invoke-direct {p0, v3}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->delete(Ljava/lang/String;)V

    .line 142
    invoke-direct {p0, v0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->delete(Ljava/lang/String;)V

    .line 143
    invoke-direct {p0, v2}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->delete(Ljava/lang/String;)V

    .line 144
    return-void
.end method

.method public static getInfoHttp()I
    .locals 20

    .prologue
    .line 689
    const/4 v10, -0x1

    .line 690
    .local v10, "pdstate":I
    new-instance v16, Ljava/lang/StringBuilder;

    const-string/jumbo v17, "http://"

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string/jumbo v17, "/api/monitor/type/padlock/userid/"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->stuid:Ljava/lang/String;

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 691
    .local v15, "url":Ljava/lang/String;
    sget-object v16, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->privatekey:Ljava/lang/String;

    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    invoke-static/range {v15 .. v17}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->httpGetInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v5

    .line 694
    .local v5, "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    :try_start_0
    new-instance v16, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct/range {v16 .. v16}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 695
    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 697
    .local v6, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v16

    const/16 v17, 0xc8

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_1

    .line 700
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v16

    .line 699
    invoke-static/range {v16 .. v16}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v14

    .line 701
    .local v14, "strResult":Ljava/lang/String;
    sget-object v16, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v17, Ljava/lang/StringBuilder;

    const-string/jumbo v18, "lock: "

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 703
    if-eqz v14, :cond_1

    const-string/jumbo v16, ""

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_1

    .line 705
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v14}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 706
    .local v8, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v16, "status"

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v13

    .line 707
    .local v13, "status":Z
    const-string/jumbo v16, "errorInfo"

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 708
    .local v4, "errorinfo":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 710
    sget-object v16, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v17, Ljava/lang/StringBuilder;

    const-string/jumbo v18, "lock: "

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, ","

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 712
    :cond_0
    if-eqz v13, :cond_1

    .line 714
    const-string/jumbo v16, "data"

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 715
    .local v2, "data":Lorg/json/JSONObject;
    if-eqz v2, :cond_1

    const-string/jumbo v16, ""

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_1

    .line 717
    const-string/jumbo v16, "statusnum"

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    .line 718
    .local v12, "state":I
    sput v12, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    .line 719
    move v10, v12

    .line 720
    const-string/jumbo v16, "locktime"

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    .line 721
    .local v9, "locktime":I
    sget-object v16, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v17, "lockscreen"

    const/16 v18, 0x0

    invoke-virtual/range {v16 .. v18}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    .line 722
    .local v11, "spf":Landroid/content/SharedPreferences;
    const/16 v16, 0x9

    move/from16 v0, v16

    if-ne v12, v0, :cond_2

    .line 724
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    const-string/jumbo v17, "lockstartTime"

    const-wide/16 v18, 0x0

    invoke-interface/range {v16 .. v19}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 725
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    const-string/jumbo v17, "lockTime"

    const-wide/16 v18, 0x0

    invoke-interface/range {v16 .. v19}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 726
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    const-string/jumbo v17, "locked"

    const/16 v18, 0x0

    invoke-interface/range {v16 .. v18}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 727
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    const-string/jumbo v17, "tmplocked"

    const/16 v18, 0x0

    invoke-interface/range {v16 .. v18}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 728
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    const-string/jumbo v17, "showstarttime"

    const-wide/16 v18, 0x0

    invoke-interface/range {v16 .. v19}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 729
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    const-string/jumbo v17, "shownumber"

    const/16 v18, 0x1

    invoke-interface/range {v16 .. v18}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 730
    const/16 v16, 0x0

    sput v16, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->showDialogNumber:I

    .line 731
    const-wide/16 v16, 0x0

    sput-wide v16, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->startTime:J

    .line 732
    new-instance v7, Landroid/content/Intent;

    sget-object v16, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->Intent_UNLOCKWINDOW:Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-direct {v7, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 733
    .local v7, "intent":Landroid/content/Intent;
    sget-object v16, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 751
    .end local v2    # "data":Lorg/json/JSONObject;
    .end local v4    # "errorinfo":Ljava/lang/String;
    .end local v6    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v7    # "intent":Landroid/content/Intent;
    .end local v8    # "jobj":Lorg/json/JSONObject;
    .end local v9    # "locktime":I
    .end local v11    # "spf":Landroid/content/SharedPreferences;
    .end local v12    # "state":I
    .end local v13    # "status":Z
    .end local v14    # "strResult":Ljava/lang/String;
    :cond_1
    :goto_0
    return v10

    .line 734
    .restart local v2    # "data":Lorg/json/JSONObject;
    .restart local v4    # "errorinfo":Ljava/lang/String;
    .restart local v6    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v8    # "jobj":Lorg/json/JSONObject;
    .restart local v9    # "locktime":I
    .restart local v11    # "spf":Landroid/content/SharedPreferences;
    .restart local v12    # "state":I
    .restart local v13    # "status":Z
    .restart local v14    # "strResult":Ljava/lang/String;
    :cond_2
    if-lez v9, :cond_1

    .line 736
    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    const-string/jumbo v17, "lockTime"

    mul-int/lit16 v0, v9, 0xe10

    move/from16 v18, v0

    move/from16 v0, v18

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    invoke-interface/range {v16 .. v19}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 743
    .end local v2    # "data":Lorg/json/JSONObject;
    .end local v4    # "errorinfo":Ljava/lang/String;
    .end local v6    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v8    # "jobj":Lorg/json/JSONObject;
    .end local v9    # "locktime":I
    .end local v11    # "spf":Landroid/content/SharedPreferences;
    .end local v12    # "state":I
    .end local v13    # "status":Z
    .end local v14    # "strResult":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 744
    .local v3, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v3}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto :goto_0

    .line 745
    .end local v3    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v3

    .line 746
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 747
    .end local v3    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v3

    .line 748
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getManufacturerSerialNumber()Ljava/lang/String;
    .locals 11

    .prologue
    .line 832
    const/4 v6, 0x0

    .line 833
    .local v6, "serial":Ljava/lang/String;
    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "P990S"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "M1016Pro"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 834
    :cond_0
    sget-object v6, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 835
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 903
    :cond_1
    :goto_0
    return-object v6

    .line 839
    :cond_2
    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "QC80A_WIFI_edutech"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "TB-8604F"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "P990S.V"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x18

    if-lt v7, v8, :cond_4

    .line 843
    :cond_3
    :try_start_0
    const-string/jumbo v7, "android.os.SystemProperties"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 844
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v7, "get"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-virtual {v1, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 845
    .local v3, "get":Ljava/lang/reflect/Method;
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "ro.serialno"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "unknown"

    aput-object v9, v7, v8

    invoke-virtual {v3, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "serial":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 851
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "get":Ljava/lang/reflect/Method;
    .restart local v6    # "serial":Ljava/lang/String;
    :goto_1
    const-string/jumbo v7, "null"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string/jumbo v7, "unknown"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 856
    :cond_4
    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "D13B"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 860
    :try_start_1
    const-string/jumbo v7, "android.os.SystemProperties"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 861
    .restart local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v7, "get"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-virtual {v1, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 862
    .restart local v3    # "get":Ljava/lang/reflect/Method;
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "sys.serialno"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "unknown"

    aput-object v9, v7, v8

    invoke-virtual {v3, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "serial":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .restart local v6    # "serial":Ljava/lang/String;
    goto/16 :goto_0

    .line 846
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "get":Ljava/lang/reflect/Method;
    .end local v6    # "serial":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 848
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 849
    const-string/jumbo v6, "null"

    .restart local v6    # "serial":Ljava/lang/String;
    goto :goto_1

    .line 863
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v6    # "serial":Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 864
    .local v4, "ignored":Ljava/lang/Exception;
    const-string/jumbo v6, "null"

    .restart local v6    # "serial":Ljava/lang/String;
    goto/16 :goto_0

    .line 868
    .end local v4    # "ignored":Ljava/lang/Exception;
    :cond_5
    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "TB-8703N"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 872
    :try_start_2
    new-instance v5, Landroid/app/mia/MiaMdmPolicyManager;

    sget-object v7, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-direct {v5, v7}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    .line 873
    .local v5, "mMiaMdmPolicyManager":Landroid/app/mia/MiaMdmPolicyManager;
    invoke-virtual {v5}, Landroid/app/mia/MiaMdmPolicyManager;->getMiaSN()Ljava/lang/String;

    move-result-object v6

    .line 874
    const-string/jumbo v7, "gaodz"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "SN = "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 875
    .end local v5    # "mMiaMdmPolicyManager":Landroid/app/mia/MiaMdmPolicyManager;
    :catch_2
    move-exception v7

    goto/16 :goto_0

    .line 880
    :cond_6
    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "A10-70LC"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_7

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "YOGATablet2-1050LC"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_7

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "A10-70F"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_7

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "YiJiao"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 882
    :cond_7
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getYogaSerialNumber()Ljava/lang/String;

    move-result-object v6

    .line 883
    goto/16 :goto_0

    .line 886
    :cond_8
    :try_start_3
    const-string/jumbo v7, "android.os.SystemProperties"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 887
    .restart local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v7, "get"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-virtual {v1, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 888
    .restart local v3    # "get":Ljava/lang/reflect/Method;
    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "TB-8703N"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_9

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "TB-8604F"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_9

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "A10-70F"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_9

    sget-object v7, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v8, "YiJiao"

    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 889
    :cond_9
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "gsm.serial"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "unknown"

    aput-object v9, v7, v8

    invoke-virtual {v3, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v6, v0

    .line 890
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    const/16 v8, 0x32

    if-le v7, v8, :cond_1

    .line 891
    const/16 v7, 0x19

    const/16 v8, 0x31

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v6, v0

    .line 893
    goto/16 :goto_0

    .line 894
    :cond_a
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "ril.serialnumber"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string/jumbo v9, "unknown"

    aput-object v9, v7, v8

    invoke-virtual {v3, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v6, v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_0

    .line 900
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "get":Ljava/lang/reflect/Method;
    :catch_3
    move-exception v4

    .line 901
    .restart local v4    # "ignored":Ljava/lang/Exception;
    const-string/jumbo v6, "null"

    goto/16 :goto_0
.end method

.method private getMyApps()V
    .locals 30

    .prologue
    .line 328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->myappList:Ljava/util/List;

    move-object/from16 v25, v0

    if-nez v25, :cond_0

    .line 330
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->myappList:Ljava/util/List;

    .line 332
    :cond_0
    sget-object v25, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    if-eqz v25, :cond_1

    sget-object v25, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    const-string/jumbo v26, ""

    invoke-virtual/range {v25 .. v26}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_2

    .line 416
    :cond_1
    :goto_0
    return-void

    .line 336
    :cond_2
    sget-object v25, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v18

    .line 337
    .local v18, "sppref":Ljava/lang/String;
    sget-object v25, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const/16 v26, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, v18

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 338
    .local v17, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v25, "updatetime"

    const-wide/16 v26, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    move-wide/from16 v2, v26

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    .line 339
    .local v14, "lasttime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    .line 340
    .local v22, "time":J
    const-string/jumbo v25, "data"

    const-string/jumbo v26, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 341
    .local v13, "myapps":Ljava/lang/String;
    const/16 v19, 0x0

    .line 342
    .local v19, "statueOk":Z
    sub-long v26, v22, v14

    const-wide/16 v28, 0x3e8

    div-long v26, v26, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->abs(J)J

    move-result-wide v26

    const-wide/16 v28, 0x2a30

    cmp-long v25, v26, v28

    if-ltz v25, :cond_3

    .line 344
    new-instance v25, Ljava/lang/StringBuilder;

    const-string/jumbo v26, "http://"

    invoke-direct/range {v25 .. v26}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v26, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 345
    const-string/jumbo v26, "/api/app/projectcode/myapp/os/android"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 344
    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 346
    .local v24, "url":Ljava/lang/String;
    sget-object v25, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->privatekey:Ljava/lang/String;

    sget-object v26, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    invoke-static/range {v24 .. v26}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->httpGetInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v7

    .line 349
    .local v7, "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    :try_start_0
    new-instance v25, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct/range {v25 .. v25}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 350
    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v8

    .line 352
    .local v8, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v25

    const/16 v26, 0xc8

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_3

    .line 355
    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v25

    .line 354
    invoke-static/range {v25 .. v25}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v21

    .line 356
    .local v21, "strResult":Ljava/lang/String;
    if-eqz v21, :cond_3

    const-string/jumbo v25, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_3

    .line 358
    new-instance v11, Lorg/json/JSONObject;

    move-object/from16 v0, v21

    invoke-direct {v11, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 359
    .local v11, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v25, "status"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v20

    .line 360
    .local v20, "status":Z
    const-string/jumbo v25, "errorInfo"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 361
    .local v6, "errorinfo":Ljava/lang/String;
    if-eqz v20, :cond_3

    .line 363
    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

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

    .line 364
    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v25

    const-string/jumbo v26, "data"

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 365
    move-object/from16 v13, v21

    .line 366
    const/16 v19, 0x1

    .line 379
    .end local v6    # "errorinfo":Ljava/lang/String;
    .end local v7    # "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    .end local v8    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v11    # "jobj":Lorg/json/JSONObject;
    .end local v20    # "status":Z
    .end local v21    # "strResult":Ljava/lang/String;
    .end local v24    # "url":Ljava/lang/String;
    :cond_3
    :goto_1
    if-eqz v13, :cond_1

    :try_start_1
    const-string/jumbo v25, ""

    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_1

    .line 381
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 382
    .restart local v11    # "jobj":Lorg/json/JSONObject;
    const-string/jumbo v25, "status"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v20

    .line 383
    .restart local v20    # "status":Z
    const-string/jumbo v25, "errorInfo"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 384
    .restart local v6    # "errorinfo":Ljava/lang/String;
    if-eqz v20, :cond_1

    .line 386
    const-string/jumbo v25, "data"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 387
    .local v10, "jdata":Lorg/json/JSONObject;
    const-string/jumbo v25, "app"

    move-object/from16 v0, v25

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v12

    .line 388
    .local v12, "jsonArray":Lorg/json/JSONArray;
    if-eqz v12, :cond_1

    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v25

    if-lez v25, :cond_1

    .line 390
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->myappList:Ljava/util/List;

    move-object/from16 v25, v0

    invoke-interface/range {v25 .. v25}, Ljava/util/List;->clear()V

    .line 391
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_2
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v25

    move/from16 v0, v25

    if-ge v9, v0, :cond_1

    .line 393
    invoke-virtual {v12, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v25

    const-string/jumbo v26, "packagename"

    invoke-virtual/range {v25 .. v26}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 394
    .local v16, "pkg":Ljava/lang/String;
    invoke-virtual {v12, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v25

    const-string/jumbo v26, "apptype"

    invoke-virtual/range {v25 .. v26}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 395
    .local v4, "apptype":Ljava/lang/String;
    const-string/jumbo v25, "1"

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_5

    .line 397
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->myappList:Ljava/util/List;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5

    .line 391
    :cond_4
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 370
    .end local v4    # "apptype":Ljava/lang/String;
    .end local v6    # "errorinfo":Ljava/lang/String;
    .end local v9    # "i":I
    .end local v10    # "jdata":Lorg/json/JSONObject;
    .end local v11    # "jobj":Lorg/json/JSONObject;
    .end local v12    # "jsonArray":Lorg/json/JSONArray;
    .end local v16    # "pkg":Ljava/lang/String;
    .end local v20    # "status":Z
    .restart local v7    # "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    .restart local v24    # "url":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 371
    .local v5, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v5}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto/16 :goto_1

    .line 372
    .end local v5    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v5

    .line 373
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_1

    .line 374
    .end local v5    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v5

    .line 375
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 398
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v7    # "httpRequest":Lorg/apache/http/client/methods/HttpGet;
    .end local v24    # "url":Ljava/lang/String;
    .restart local v4    # "apptype":Ljava/lang/String;
    .restart local v6    # "errorinfo":Ljava/lang/String;
    .restart local v9    # "i":I
    .restart local v10    # "jdata":Lorg/json/JSONObject;
    .restart local v11    # "jobj":Lorg/json/JSONObject;
    .restart local v12    # "jsonArray":Lorg/json/JSONArray;
    .restart local v16    # "pkg":Ljava/lang/String;
    .restart local v20    # "status":Z
    :cond_5
    if-eqz v19, :cond_4

    .line 400
    :try_start_2
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->uninstallPkg(Ljava/lang/String;)V

    .line 401
    const-string/jumbo v25, "loguploadTimer"

    new-instance v26, Ljava/lang/StringBuilder;

    const-string/jumbo v27, "uninstall:"

    invoke-direct/range {v26 .. v27}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v25 .. v26}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    goto :goto_3

    .line 407
    .end local v4    # "apptype":Ljava/lang/String;
    .end local v6    # "errorinfo":Ljava/lang/String;
    .end local v9    # "i":I
    .end local v10    # "jdata":Lorg/json/JSONObject;
    .end local v11    # "jobj":Lorg/json/JSONObject;
    .end local v12    # "jsonArray":Lorg/json/JSONArray;
    .end local v16    # "pkg":Ljava/lang/String;
    .end local v20    # "status":Z
    :catch_3
    move-exception v5

    .line 409
    .local v5, "e":Lorg/json/JSONException;
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 410
    .end local v5    # "e":Lorg/json/JSONException;
    :catch_4
    move-exception v5

    .line 411
    .local v5, "e":Ljava/lang/NullPointerException;
    invoke-virtual {v5}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto/16 :goto_0

    .line 412
    .end local v5    # "e":Ljava/lang/NullPointerException;
    :catch_5
    move-exception v5

    .line 413
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method private getOtherApps()Ljava/lang/String;
    .locals 14
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 523
    const-string/jumbo v0, ""

    .line 524
    .local v0, "addApps":Ljava/lang/String;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 525
    .local v4, "packages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 526
    .local v7, "syspackages":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 527
    .local v6, "selfApps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->illegalPackages:Ljava/util/List;

    .line 528
    const-string/jumbo v10, "com.launcher.activity"

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 529
    const-string/jumbo v10, "dolphin.video.players"

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 530
    const-string/jumbo v10, "com.akson.timeepstudent"

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 531
    const-string/jumbo v10, "com.akson.timeep"

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    const-wide/16 v8, 0x0

    .line 537
    .local v8, "sysLong":J
    :try_start_0
    sget-object v10, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    const-string/jumbo v11, "com.launcher.activity"

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 538
    .local v2, "info":Landroid/content/pm/PackageInfo;
    if-eqz v2, :cond_0

    .line 540
    iget-wide v8, v2, Landroid/content/pm/PackageInfo;->firstInstallTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 546
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    :cond_0
    :goto_0
    :try_start_1
    sget-object v10, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v4

    .line 547
    if-eqz v4, :cond_1

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_1

    .line 549
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v10

    if-lt v1, v10, :cond_2

    .line 632
    .end local v1    # "i":I
    :cond_1
    :goto_2
    return-object v0

    .line 551
    .restart local v1    # "i":I
    :cond_2
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/PackageInfo;

    .line 553
    .restart local v2    # "info":Landroid/content/pm/PackageInfo;
    iget-object v5, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 554
    .local v5, "pkName":Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 549
    :cond_3
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 558
    :cond_4
    const-string/jumbo v10, "com.edutech"

    invoke-virtual {v5, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    const-string/jumbo v10, "cn.wps.moffice_eng"

    invoke-virtual {v5, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 562
    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->myappList:Ljava/util/List;

    if-eqz v10, :cond_5

    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->myappList:Ljava/util/List;

    invoke-interface {v10, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 566
    :cond_5
    iget-object v10, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v10, v10, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v10, v10, 0x1

    if-gtz v10, :cond_3

    .line 571
    const-wide/16 v10, 0x0

    cmp-long v10, v8, v10

    if-lez v10, :cond_3

    iget-wide v10, v2, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    sub-long/2addr v10, v8

    const-wide/32 v12, 0x36ee80

    cmp-long v10, v10, v12

    if-lez v10, :cond_3

    .line 573
    iget-object v10, v2, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    sget-object v11, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 575
    .local v3, "name":Ljava/lang/String;
    if-eqz v0, :cond_6

    const-string/jumbo v10, ""

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 577
    :cond_6
    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "\u5b89\u88c5\u4e86\uff1a"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 582
    :goto_4
    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->illegalPackages:Ljava/util/List;

    if-eqz v10, :cond_7

    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->illegalPackages:Ljava/util/List;

    invoke-interface {v10, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7

    .line 584
    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->illegalPackages:Ljava/util/List;

    invoke-interface {v10, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 586
    :cond_7
    sget v10, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    if-nez v10, :cond_3

    .line 588
    const/4 v10, 0x3

    sput v10, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    goto :goto_3

    .line 626
    .end local v1    # "i":I
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "pkName":Ljava/lang/String;
    :catch_0
    move-exception v10

    goto/16 :goto_2

    .line 580
    .restart local v1    # "i":I
    .restart local v2    # "info":Landroid/content/pm/PackageInfo;
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v5    # "pkName":Ljava/lang/String;
    :cond_8
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_4

    .line 628
    .end local v1    # "i":I
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "pkName":Ljava/lang/String;
    :catch_1
    move-exception v10

    goto/16 :goto_2

    .line 543
    :catch_2
    move-exception v10

    goto/16 :goto_0
.end method

.method private getSDAvailableSize()J
    .locals 12

    .prologue
    const-wide/high16 v10, 0x4090000000000000L    # 1024.0

    .line 90
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    .line 91
    .local v4, "path":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 92
    .local v5, "stat":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v2, v6

    .line 93
    .local v2, "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v6

    int-to-long v0, v6

    .line 94
    .local v0, "availableBlocks":J
    mul-long v6, v2, v0

    long-to-double v6, v6

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v6, v8

    div-double/2addr v6, v10

    div-double/2addr v6, v10

    double-to-long v6, v6

    return-wide v6
.end method

.method public static getYogaSerialNumber()Ljava/lang/String;
    .locals 8

    .prologue
    .line 818
    const/4 v3, 0x0

    .line 820
    .local v3, "serial":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v4, "android.os.SystemProperties"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 821
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v4, "get"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 823
    .local v1, "get":Ljava/lang/reflect/Method;
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v6, "ro.lenovosn2"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "unknown"

    aput-object v6, v4, v5

    invoke-virtual {v1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "serial":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 828
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "get":Ljava/lang/reflect/Method;
    .restart local v3    # "serial":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 825
    .end local v3    # "serial":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 826
    .local v2, "ignored":Ljava/lang/Exception;
    const-string/jumbo v3, "null"

    .restart local v3    # "serial":Ljava/lang/String;
    goto :goto_0
.end method

.method public static httpGetInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;
    .locals 7
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "privatekey"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    .line 678
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 679
    .local v0, "get":Lorg/apache/http/client/methods/HttpGet;
    const-string/jumbo v4, "X-Edutech-Entity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 680
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 679
    invoke-virtual {v0, v4, v5}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 681
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 682
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

    .line 683
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

    .line 684
    return-object v0
.end method

.method public static httpPostInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    .locals 7
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "privatekey"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    .line 668
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 669
    .local v2, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v4, "X-Edutech-Entity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 670
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 669
    invoke-virtual {v2, v4, v5}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 671
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 672
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

    .line 673
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

    .line 674
    return-object v2
.end method

.method private isNormalState()Z
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 315
    sget-object v3, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v4, "lockscreen"

    const/4 v5, 0x4

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 316
    .local v0, "spf":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "logstate"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 317
    .local v1, "state":I
    if-nez v1, :cond_0

    .line 319
    const/4 v2, 0x1

    .line 321
    :cond_0
    return v2
.end method

.method static isProtectExist()Z
    .locals 9

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 925
    sget-object v6, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v7, "lockscreen"

    const/4 v8, 0x4

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 926
    .local v3, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v6, "edufire"

    invoke-interface {v3, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 928
    .local v1, "hasEdufire":Z
    :try_start_0
    sget-object v6, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 929
    const-string/jumbo v7, "com.edutech.firewall"

    const/4 v8, 0x0

    .line 928
    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 930
    .local v2, "packageInfo":Landroid/content/pm/PackageInfo;
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "edufire"

    const/4 v8, 0x1

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 935
    :goto_0
    if-nez v2, :cond_0

    if-nez v1, :cond_1

    :cond_0
    move v4, v5

    .line 938
    :cond_1
    return v4

    .line 931
    .end local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v0

    .line 932
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, 0x0

    .line 933
    .restart local v2    # "packageInfo":Landroid/content/pm/PackageInfo;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method private judgeStorage()V
    .locals 4

    .prologue
    .line 188
    :try_start_0
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getSDAvailableSize()J

    move-result-wide v0

    const-wide/16 v2, 0x800

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 190
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->deleteCameraFiles()V

    .line 191
    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->deleteOtherFiles()V

    .line 193
    :cond_0
    const-string/jumbo v0, "storage"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getSDAvailableSize()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "size"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :goto_0
    return-void

    .line 194
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static padInFoPostHttp()V
    .locals 22

    .prologue
    .line 755
    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v18, "lockscreen"

    const/16 v19, 0x4

    invoke-virtual/range {v17 .. v19}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v14

    .line 756
    .local v14, "spfes":Landroid/content/SharedPreferences;
    invoke-interface {v14}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    const-string/jumbo v18, "logstate"

    sget v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    invoke-interface/range {v17 .. v19}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 758
    new-instance v17, Ljava/lang/StringBuilder;

    const-string/jumbo v18, "http://"

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v18, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "/api/monitor/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 759
    .local v16, "url":Ljava/lang/String;
    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 761
    .local v10, "json":Ljava/lang/String;
    if-eqz v16, :cond_1

    if-eqz v10, :cond_1

    const-string/jumbo v17, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1

    const-string/jumbo v17, ""

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1

    .line 763
    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->privatekey:Ljava/lang/String;

    sget-object v18, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    invoke-static/range {v16 .. v18}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->httpPostInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v7

    .line 765
    .local v7, "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 766
    .local v11, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v17, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v18, "type"

    const-string/jumbo v19, "pad"

    invoke-direct/range {v17 .. v19}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 767
    new-instance v17, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v18, "data"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v10}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 771
    :try_start_0
    new-instance v17, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string/jumbo v18, "UTF-8"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v11, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 773
    new-instance v17, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct/range {v17 .. v17}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v8

    .line 775
    .local v8, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v17

    const/16 v18, 0xc8

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_1

    .line 778
    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v18, "lockscreen"

    const/16 v19, 0x4

    invoke-virtual/range {v17 .. v19}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v13

    .line 780
    .local v13, "spf2":Landroid/content/SharedPreferences;
    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    const-string/jumbo v18, "uploadtime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-wide/from16 v2, v20

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 781
    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    const-string/jumbo v18, "uploadstate"

    sget v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    invoke-interface/range {v17 .. v19}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 782
    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v18

    const-string/jumbo v19, "user"

    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    if-nez v17, :cond_2

    const-string/jumbo v17, ""

    :goto_0
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v17

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 783
    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v15

    .line 784
    .local v15, "strResult":Ljava/lang/String;
    invoke-static {v15}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->parseHttpPostReturnJson(Ljava/lang/String;)I

    move-result v9

    .line 786
    .local v9, "intResult":I
    if-nez v9, :cond_0

    .line 787
    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->logUploadShared:Landroid/content/SharedPreferences;

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    .line 788
    .local v6, "edit":Landroid/content/SharedPreferences$Editor;
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    .line 789
    .local v4, "currentDate":Ljava/util/Date;
    const-string/jumbo v17, "lastTime"

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v18

    const-wide/16 v20, 0x3e8

    div-long v18, v18, v20

    move-object/from16 v0, v17

    move-wide/from16 v1, v18

    invoke-interface {v6, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 791
    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 793
    .end local v4    # "currentDate":Ljava/util/Date;
    .end local v6    # "edit":Landroid/content/SharedPreferences$Editor;
    :cond_0
    sget v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    const/16 v18, 0x8

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_1

    .line 795
    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v18, "lockscreen"

    const/16 v19, 0x0

    invoke-virtual/range {v17 .. v19}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 796
    .local v12, "spf":Landroid/content/SharedPreferences;
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    const-string/jumbo v18, "uploadlockstate"

    const/16 v19, 0x1

    invoke-interface/range {v17 .. v19}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 815
    .end local v7    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .end local v8    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v9    # "intResult":I
    .end local v11    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v12    # "spf":Landroid/content/SharedPreferences;
    .end local v13    # "spf2":Landroid/content/SharedPreferences;
    .end local v15    # "strResult":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 782
    .restart local v7    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .restart local v8    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v11    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v13    # "spf2":Landroid/content/SharedPreferences;
    :cond_2
    sget-object v17, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 802
    .end local v8    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v13    # "spf2":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v5

    .line 804
    .local v5, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v5}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto :goto_1

    .line 806
    .end local v5    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v5

    .line 808
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 810
    .end local v5    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v5

    .line 812
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static parseHttpPostReturnJson(Ljava/lang/String;)I
    .locals 18
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    .line 965
    const-string/jumbo v13, ""

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 967
    const/4 v13, 0x0

    .line 1023
    :goto_0
    return v13

    .line 970
    :cond_0
    :try_start_0
    new-instance v9, Lorg/json/JSONTokener;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 971
    .local v9, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v9}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;

    .line 972
    .local v7, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v13, "status"

    invoke-static {v7, v13}, Lcom/edutech/idauthentication/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v11

    .line 973
    .local v11, "status":Z
    const-string/jumbo v13, "errorNum"

    invoke-static {v7, v13}, Lcom/edutech/idauthentication/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v6

    .line 974
    .local v6, "errorNum":I
    const-string/jumbo v13, "errorInfo"

    invoke-static {v7, v13}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 976
    .local v5, "errorInfo":Ljava/lang/String;
    const-string/jumbo v13, "data"

    invoke-static {v7, v13}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 983
    .local v2, "data":Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_1

    .line 985
    new-instance v10, Lorg/json/JSONTokener;

    invoke-direct {v10, v2}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 986
    .local v10, "jsonTokener1":Lorg/json/JSONTokener;
    invoke-virtual {v10}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    .line 987
    .local v8, "jsonObject1":Lorg/json/JSONObject;
    const-string/jumbo v13, "timeNext"

    invoke-static {v8, v13}, Lcom/edutech/idauthentication/JsonHelper;->getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v12

    .line 988
    .local v12, "timeNext":Ljava/lang/Long;
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v13, v14, v16

    if-lez v13, :cond_1

    .line 990
    sget-object v13, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->logUploadShared:Landroid/content/SharedPreferences;

    invoke-interface {v13}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 991
    .local v4, "edit":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v13, "delayTime"

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    invoke-interface {v4, v13, v14, v15}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 992
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 996
    .end local v4    # "edit":Landroid/content/SharedPreferences$Editor;
    .end local v8    # "jsonObject1":Lorg/json/JSONObject;
    .end local v10    # "jsonTokener1":Lorg/json/JSONTokener;
    .end local v12    # "timeNext":Ljava/lang/Long;
    :cond_1
    if-eqz v11, :cond_2

    if-nez v6, :cond_2

    .line 998
    const/4 v13, 0x0

    goto :goto_0

    .line 1000
    :cond_2
    if-nez v11, :cond_3

    const/4 v13, 0x1

    if-ne v6, v13, :cond_3

    .line 1002
    const/4 v13, 0x1

    goto :goto_0

    .line 1003
    :cond_3
    if-nez v11, :cond_4

    const/4 v13, 0x2

    if-ne v6, v13, :cond_4

    .line 1005
    const/4 v13, 0x2

    goto :goto_0

    .line 1006
    :cond_4
    if-nez v11, :cond_5

    const/4 v13, 0x3

    if-ne v6, v13, :cond_5

    .line 1008
    const/4 v13, 0x3

    goto :goto_0

    .line 1009
    :cond_5
    if-nez v11, :cond_6

    const/4 v13, 0x4

    if-ne v6, v13, :cond_6

    .line 1011
    const/4 v13, 0x4

    goto/16 :goto_0

    .line 1014
    :cond_6
    const/4 v13, -0x1

    goto/16 :goto_0

    .line 1016
    .end local v2    # "data":Ljava/lang/String;
    .end local v5    # "errorInfo":Ljava/lang/String;
    .end local v6    # "errorNum":I
    .end local v7    # "jsonObject":Lorg/json/JSONObject;
    .end local v9    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v11    # "status":Z
    :catch_0
    move-exception v3

    .line 1018
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    .line 1019
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 1020
    .end local v3    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v3

    .line 1022
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 1023
    const/4 v13, 0x0

    goto/16 :goto_0
.end method

.method private uninstallBMD()V
    .locals 6

    .prologue
    .line 422
    sget-boolean v4, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->openBMD:Z

    if-nez v4, :cond_0

    sget-object v4, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    if-eqz v4, :cond_0

    .line 424
    const-string/jumbo v2, "com.edutech.firewall"

    .line 426
    .local v2, "packagebmd":Ljava/lang/String;
    :try_start_0
    sget-object v4, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 427
    const/4 v5, 0x0

    .line 426
    invoke-virtual {v4, v2, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 428
    .local v3, "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v3, :cond_0

    .line 430
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v4, "com.launch.uninstall"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 431
    .local v1, "installIntent":Landroid/content/Intent;
    const-string/jumbo v4, "packagename"

    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 432
    sget-object v4, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 441
    .end local v1    # "installIntent":Landroid/content/Intent;
    .end local v2    # "packagebmd":Ljava/lang/String;
    .end local v3    # "pinfo":Landroid/content/pm/PackageInfo;
    :cond_0
    :goto_0
    return-void

    .line 434
    .restart local v2    # "packagebmd":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 436
    .local v0, "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 437
    .end local v0    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v4

    goto :goto_0
.end method

.method private uninstallIlleagalAPP()V
    .locals 5

    .prologue
    .line 447
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->illegalPackages:Ljava/util/List;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->illegalPackages:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    .line 448
    .local v2, "length":I
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-lt v0, v2, :cond_1

    .line 462
    return-void

    .line 447
    .end local v0    # "i":I
    .end local v2    # "length":I
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 450
    .restart local v0    # "i":I
    .restart local v2    # "length":I
    :cond_1
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->illegalPackages:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 451
    .local v3, "pkname":Ljava/lang/String;
    if-eqz v3, :cond_2

    sget-object v4, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    if-eqz v4, :cond_2

    .line 454
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v4, "com.launch.uninstall"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 455
    .local v1, "installIntent":Landroid/content/Intent;
    const-string/jumbo v4, "packagename"

    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 456
    sget-object v4, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 448
    .end local v1    # "installIntent":Landroid/content/Intent;
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 457
    :catch_0
    move-exception v4

    goto :goto_2
.end method

.method private uninstallPkg(Ljava/lang/String;)V
    .locals 2
    .param p1, "pkgname"    # Ljava/lang/String;

    .prologue
    .line 466
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.launch.uninstall"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 467
    .local v0, "installIntent":Landroid/content/Intent;
    const-string/jumbo v1, "packagename"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 468
    sget-object v1, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 472
    .end local v0    # "installIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 469
    :catch_0
    move-exception v1

    goto :goto_0
.end method


# virtual methods
.method public getMacAddr()Ljava/lang/String;
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 636
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    .line 637
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_1

    .line 658
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :goto_0
    const-string/jumbo v5, ""

    :goto_1
    return-object v5

    .line 637
    .restart local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :cond_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/NetworkInterface;

    .line 638
    .local v3, "nif":Ljava/net/NetworkInterface;
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "wlan0"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 640
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getHardwareAddress()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 641
    .local v2, "macBytes":[B
    if-nez v2, :cond_2

    .line 642
    const-string/jumbo v5, ""

    goto :goto_1

    .line 645
    :cond_2
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 646
    .local v4, "res1":Ljava/lang/StringBuilder;
    array-length v6, v2

    const/4 v5, 0x0

    :goto_2
    if-lt v5, v6, :cond_4

    .line 650
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 651
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 653
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 646
    :cond_4
    aget-byte v1, v2, v5

    .line 647
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

    .line 646
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 655
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    .end local v1    # "b":B
    .end local v2    # "macBytes":[B
    .end local v3    # "nif":Ljava/net/NetworkInterface;
    .end local v4    # "res1":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public run()V
    .locals 24

    .prologue
    .line 200
    sget-boolean v19, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->openBMD:Z

    if-nez v19, :cond_0

    .line 202
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->uninstallBMD()V

    .line 204
    :cond_0
    sget-boolean v19, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isSMX:Z

    if-eqz v19, :cond_1

    .line 206
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->judgeStorage()V

    .line 210
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 211
    .local v4, "currentTime":J
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v20, "lockscreen"

    const/16 v21, 0x4

    invoke-virtual/range {v19 .. v21}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 212
    .local v10, "spf":Landroid/content/SharedPreferences;
    const-string/jumbo v19, "uploadlockstate"

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-interface {v10, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    .line 213
    .local v14, "uploadlockstate":Z
    const-string/jumbo v19, "user"

    const-string/jumbo v20, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v10, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 214
    .local v15, "user":Ljava/lang/String;
    const-string/jumbo v19, "uploadtime"

    const-wide/16 v20, 0x0

    move-object/from16 v0, v19

    move-wide/from16 v1, v20

    invoke-interface {v10, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v16

    .line 215
    .local v16, "uploadtime":J
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->isNormalState()Z

    move-result v19

    if-eqz v19, :cond_3

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    invoke-static/range {v19 .. v19}, Lcom/edutech/mobilestudyclient/util/DensityUtil;->isMyLauncherDefault(Landroid/content/Context;)Z

    move-result v19

    if-eqz v19, :cond_3

    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->isProtectExist()Z

    move-result v19

    if-eqz v19, :cond_3

    sget-boolean v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->invalidApkInstall:Z

    if-nez v19, :cond_3

    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->IsLocked()Z

    move-result v19

    if-nez v19, :cond_3

    sub-long v20, v4, v16

    const-wide/16 v22, 0x3e8

    div-long v20, v20, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->abs(J)J

    move-result-wide v20

    const-wide/32 v22, 0xa8c0

    cmp-long v19, v20, v22

    if-gez v19, :cond_3

    .line 306
    :cond_2
    :goto_0
    return-void

    .line 217
    :cond_3
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v20, "privatekey"

    .line 218
    const/16 v21, 0x4

    .line 217
    invoke-virtual/range {v19 .. v21}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    .line 219
    .local v9, "share":Landroid/content/SharedPreferences;
    const-string/jumbo v19, "key"

    const-string/jumbo v20, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->privatekey:Ljava/lang/String;

    .line 220
    const-string/jumbo v19, "name"

    const-string/jumbo v20, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    .line 221
    const-string/jumbo v19, "apihost"

    const-string/jumbo v20, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    .line 222
    const-string/jumbo v19, "pwd"

    const-string/jumbo v20, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->password:Ljava/lang/String;

    .line 223
    const-string/jumbo v19, "userid"

    const-string/jumbo v20, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->stuid:Ljava/lang/String;

    .line 225
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->privatekey:Ljava/lang/String;

    if-eqz v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    if-eqz v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    if-eqz v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->password:Ljava/lang/String;

    if-eqz v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->stuid:Ljava/lang/String;

    if-eqz v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->privatekey:Ljava/lang/String;

    const-string/jumbo v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    const-string/jumbo v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    const-string/jumbo v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->password:Ljava/lang/String;

    const-string/jumbo v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_4

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->stuid:Ljava/lang/String;

    const-string/jumbo v20, ""

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 228
    :cond_4
    :try_start_0
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->hashmap:Ljava/util/HashMap;

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->hashmap:Ljava/util/HashMap;

    move-object/from16 v19, v0

    if-eqz v19, :cond_5

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->hashmap:Ljava/util/HashMap;

    move-object/from16 v19, v0

    const-string/jumbo v20, "ip"

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->ip:Ljava/lang/String;

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->hashmap:Ljava/util/HashMap;

    move-object/from16 v19, v0

    const-string/jumbo v20, "username"

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->hashmap:Ljava/util/HashMap;

    move-object/from16 v19, v0

    const-string/jumbo v20, "privatekey"

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->privatekey:Ljava/lang/String;

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->hashmap:Ljava/util/HashMap;

    move-object/from16 v19, v0

    const-string/jumbo v20, "pwd"

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->password:Ljava/lang/String;

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->hashmap:Ljava/util/HashMap;

    move-object/from16 v19, v0

    const-string/jumbo v20, "stuid"

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->stuid:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 241
    :cond_5
    :goto_1
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    .line 242
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, "{\"usernumber\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v21, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, ",\"model\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v21, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, ",\"version\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v21, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    const-string/jumbo v7, ""

    .line 249
    .local v7, "m_szWLANMAC":Ljava/lang/String;
    :try_start_1
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->mContext:Landroid/content/Context;

    const-string/jumbo v20, "wifi"

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/net/wifi/WifiManager;

    .line 250
    .local v18, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual/range {v18 .. v18}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    .line 257
    .end local v18    # "wm":Landroid/net/wifi/WifiManager;
    :goto_2
    if-eqz v7, :cond_6

    const-string/jumbo v19, "02:00:00:00:00:00"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 259
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getMacAddr()Ljava/lang/String;

    move-result-object v7

    .line 261
    :cond_6
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, ",\"macaddress\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, ",\"serialnumber\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getManufacturerSerialNumber()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->chechDeviceStatus()I

    move-result v19

    sput v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    .line 265
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    if-eqz v19, :cond_7

    if-eqz v15, :cond_7

    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_8

    .line 267
    :cond_7
    const-wide/16 v16, 0x0

    .line 269
    :cond_8
    const-string/jumbo v19, "uploadstate"

    const/16 v20, -0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-interface {v10, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11

    .line 271
    .local v11, "state":I
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getMyApps()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 275
    :goto_3
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->addLogData()V

    .line 276
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->IsLocked()Z

    move-result v19

    if-eqz v19, :cond_a

    .line 278
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getInfoHttp()I

    move-result v8

    .line 279
    .local v8, "pdstate":I
    const/16 v19, 0x9

    move/from16 v0, v19

    if-eq v8, v0, :cond_9

    .line 281
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padInFoPostHttp()V

    goto/16 :goto_0

    .line 251
    .end local v8    # "pdstate":I
    .end local v11    # "state":I
    :catch_0
    move-exception v6

    .line 253
    .local v6, "e":Ljava/lang/NullPointerException;
    const-string/jumbo v7, ""

    goto/16 :goto_2

    .line 254
    .end local v6    # "e":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v6

    .line 255
    .local v6, "e":Ljava/lang/Exception;
    const-string/jumbo v7, ""

    goto/16 :goto_2

    .line 284
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v8    # "pdstate":I
    .restart local v11    # "state":I
    :cond_9
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    .line 285
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, "{\"usernumber\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v21, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->username:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, ",\"model\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v21, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, ",\"version\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v21, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, ",\"macaddress\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    sget-object v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->sb:Ljava/lang/StringBuilder;

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, ",\"serialnumber\":\""

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->getManufacturerSerialNumber()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "\""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->chechDeviceStatus()I

    move-result v19

    sput v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    .line 291
    invoke-direct/range {p0 .. p0}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->addLogData()V

    .line 292
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padInFoPostHttp()V

    goto/16 :goto_0

    .line 296
    .end local v8    # "pdstate":I
    :cond_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 297
    .local v12, "time":J
    const-wide/16 v20, 0x0

    cmp-long v19, v16, v20

    if-lez v19, :cond_b

    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v11, v0, :cond_b

    sget v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    if-eqz v19, :cond_c

    .line 299
    :cond_b
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padInFoPostHttp()V

    goto/16 :goto_0

    .line 300
    :cond_c
    sget v19, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padstate:I

    move/from16 v0, v19

    if-ne v11, v0, :cond_d

    sub-long v20, v12, v16

    const-wide/16 v22, 0x3e8

    div-long v20, v20, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->abs(J)J

    move-result-wide v20

    const-wide/32 v22, 0xa8c0

    cmp-long v19, v20, v22

    if-ltz v19, :cond_2

    .line 302
    :cond_d
    invoke-static {}, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->padInFoPostHttp()V

    goto/16 :goto_0

    .line 272
    .end local v12    # "time":J
    :catch_2
    move-exception v19

    goto/16 :goto_3

    .line 237
    .end local v7    # "m_szWLANMAC":Ljava/lang/String;
    .end local v11    # "state":I
    :catch_3
    move-exception v19

    goto/16 :goto_1
.end method
