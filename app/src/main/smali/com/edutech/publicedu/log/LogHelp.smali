.class public Lcom/edutech/publicedu/log/LogHelp;
.super Ljava/lang/Object;
.source "LogHelp.java"


# static fields
.field public static final TYPE_GUIDANCE:Ljava/lang/String; = "1"

.field public static final TYPE_HWHELP:Ljava/lang/String; = "3"

.field public static final TYPE_MYWORK:Ljava/lang/String; = "2"

.field private static logHelp:Lcom/edutech/publicedu/log/LogHelp;

.field private static logPath:Ljava/lang/String;


# instance fields
.field private BookID:Ljava/lang/String;

.field private BookName:Ljava/lang/String;

.field private SubjectID:Ljava/lang/String;

.field private continueTime:J

.field private dateFormat:Ljava/text/SimpleDateFormat;

.field private gson:Lcom/google/gson/Gson;

.field private isResee:Z

.field private logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

.field private logFile:Ljava/io/File;

.field private logInfo:Lcom/edutech/publicedu/log/LogInfo;

.field private pauseTime:J

.field private starting:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 43
    new-instance v0, Lcom/edutech/publicedu/log/LogHelp;

    invoke-direct {v0}, Lcom/edutech/publicedu/log/LogHelp;-><init>()V

    sput-object v0, Lcom/edutech/publicedu/log/LogHelp;->logHelp:Lcom/edutech/publicedu/log/LogHelp;

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 62
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 63
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 64
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 65
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 66
    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "log.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/publicedu/log/LogHelp;->logPath:Ljava/lang/String;

    .line 344
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iput-object v0, p0, Lcom/edutech/publicedu/log/LogHelp;->gson:Lcom/google/gson/Gson;

    .line 70
    return-void
.end method

.method private getCurrentFormatTime()Ljava/lang/String;
    .locals 4

    .prologue
    .line 339
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogHelp;->dateFormat:Ljava/text/SimpleDateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/edutech/publicedu/log/LogHelp;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/edutech/publicedu/log/LogHelp;->logHelp:Lcom/edutech/publicedu/log/LogHelp;

    return-object v0
.end method

.method public static toHexString([BLjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "bytes"    # [B
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 331
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 332
    .local v1, "hexString":Ljava/lang/StringBuilder;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_0

    .line 335
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 332
    :cond_0
    aget-byte v0, p0, v2

    .line 333
    .local v0, "b":B
    and-int/lit16 v4, v0, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static toMd5([B)[B
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 320
    :try_start_0
    const-string/jumbo v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 321
    .local v0, "algorithm":Ljava/security/MessageDigest;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 322
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 323
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 327
    .end local v0    # "algorithm":Ljava/security/MessageDigest;
    :goto_0
    return-object v1

    .line 324
    :catch_0
    move-exception v1

    .line 327
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public continueLog()V
    .locals 2

    .prologue
    .line 141
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "continueLog"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-boolean v0, p0, Lcom/edutech/publicedu/log/LogHelp;->starting:Z

    if-eqz v0, :cond_0

    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/edutech/publicedu/log/LogHelp;->continueTime:J

    .line 145
    :cond_0
    return-void
.end method

.method public getMacAddr()Ljava/lang/String;
    .locals 9

    .prologue
    .line 294
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v0

    .line 295
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_1

    .line 316
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :goto_0
    const-string/jumbo v5, ""

    :goto_1
    return-object v5

    .line 295
    .restart local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :cond_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/NetworkInterface;

    .line 296
    .local v3, "nif":Ljava/net/NetworkInterface;
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "wlan0"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 298
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getHardwareAddress()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 299
    .local v2, "macBytes":[B
    if-nez v2, :cond_2

    .line 300
    const-string/jumbo v5, ""

    goto :goto_1

    .line 303
    :cond_2
    :try_start_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 304
    .local v4, "res1":Ljava/lang/StringBuilder;
    array-length v6, v2

    const/4 v5, 0x0

    :goto_2
    if-lt v5, v6, :cond_4

    .line 308
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 309
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 311
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 304
    :cond_4
    aget-byte v1, v2, v5

    .line 305
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

    .line 304
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 313
    .end local v0    # "all":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    .end local v1    # "b":B
    .end local v2    # "macBytes":[B
    .end local v3    # "nif":Ljava/net/NetworkInterface;
    .end local v4    # "res1":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public final getMachineID(Landroid/content/Context;)Ljava/lang/String;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 265
    .line 266
    const-string/jumbo v5, "phone"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 265
    check-cast v3, Landroid/telephony/TelephonyManager;

    .line 267
    .local v3, "tm":Landroid/telephony/TelephonyManager;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 269
    .local v2, "sb":Ljava/lang/StringBuilder;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nModel = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nSerialNumber = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nDeviceId(IMEI) = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    .line 274
    const-string/jumbo v6, "android_id"

    .line 273
    invoke-static {v5, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 275
    .local v0, "android_id":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nAndroidID = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    const-string/jumbo v5, "wifi"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 277
    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 279
    .local v4, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v1

    .line 280
    .local v1, "m_szWLANMAC":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string/jumbo v5, "02:00:00:00:00:00"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 282
    invoke-virtual {p0}, Lcom/edutech/publicedu/log/LogHelp;->getMacAddr()Ljava/lang/String;

    move-result-object v1

    .line 284
    :cond_0
    if-nez v1, :cond_1

    .line 285
    const-string/jumbo v1, ""

    .line 287
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "\nMACAddress = "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/publicedu/log/LogHelp;->toMd5([B)[B

    move-result-object v6

    const-string/jumbo v7, ""

    invoke-static {v6, v7}, Lcom/edutech/publicedu/log/LogHelp;->toHexString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 289
    const-string/jumbo v6, ":"

    const-string/jumbo v7, ""

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 288
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public initLog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "SubjectID"    # Ljava/lang/String;
    .param p3, "BookID"    # Ljava/lang/String;
    .param p4, "BookName"    # Ljava/lang/String;
    .param p5, "id"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p2, p0, Lcom/edutech/publicedu/log/LogHelp;->SubjectID:Ljava/lang/String;

    .line 79
    iput-object p3, p0, Lcom/edutech/publicedu/log/LogHelp;->BookID:Ljava/lang/String;

    .line 80
    iput-object p4, p0, Lcom/edutech/publicedu/log/LogHelp;->BookName:Ljava/lang/String;

    .line 82
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->dateFormat:Ljava/text/SimpleDateFormat;

    .line 84
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/edutech/publicedu/log/LogHelp;->logPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logFile:Ljava/io/File;

    .line 86
    :try_start_0
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logFile:Ljava/io/File;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 87
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->gson:Lcom/google/gson/Gson;

    .line 88
    iget-object v2, p0, Lcom/edutech/publicedu/log/LogHelp;->logFile:Ljava/io/File;

    const-string/jumbo v3, "UTF-8"

    invoke-static {v2, v3}, Lorg/apache/commons/io/FileUtils;->readFileToString(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 89
    const-class v3, Lcom/edutech/publicedu/log/LogInfo;

    .line 87
    invoke-virtual {v1, v2, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/publicedu/log/LogInfo;

    iput-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    .line 101
    :goto_0
    return-void

    .line 91
    :cond_0
    new-instance v1, Lcom/edutech/publicedu/log/LogInfo;

    invoke-direct {v1}, Lcom/edutech/publicedu/log/LogInfo;-><init>()V

    iput-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    .line 92
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    invoke-virtual {v1, p5}, Lcom/edutech/publicedu/log/LogInfo;->setUserID(Ljava/lang/String;)V

    .line 93
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    invoke-virtual {p0, p1}, Lcom/edutech/publicedu/log/LogHelp;->getMachineID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogInfo;->setMachineID(Ljava/lang/String;)V

    .line 94
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogInfo;->setData(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public pauseLog()V
    .locals 10

    .prologue
    .line 148
    const-string/jumbo v1, "qwe"

    const-string/jumbo v2, "pauseLog"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    iget-boolean v1, p0, Lcom/edutech/publicedu/log/LogHelp;->starting:Z

    if-eqz v1, :cond_0

    .line 151
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/edutech/publicedu/log/LogHelp;->pauseTime:J

    .line 153
    :try_start_0
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    .line 154
    invoke-virtual {v3}, Lcom/edutech/publicedu/log/LogDataItem;->getTotalTime()Ljava/lang/String;

    move-result-object v3

    .line 153
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v4, v3

    .line 155
    iget-wide v6, p0, Lcom/edutech/publicedu/log/LogHelp;->pauseTime:J

    iget-wide v8, p0, Lcom/edutech/publicedu/log/LogHelp;->continueTime:J

    sub-long/2addr v6, v8

    .line 156
    const-wide/16 v8, 0x3e8

    .line 155
    div-long/2addr v6, v8

    add-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 153
    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogDataItem;->setTotalTime(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    :cond_0
    :goto_0
    return-void

    .line 158
    :catch_0
    move-exception v0

    .line 159
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0
.end method

.method public sendLog()V
    .locals 16

    .prologue
    .line 190
    sget-object v12, Lcom/edutech/daoxueben/until/UpOrDownFile;->apihost:Ljava/lang/String;

    invoke-static {v12}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->LOGJSON_HTTPPOST_URL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 191
    .local v11, "url":Ljava/lang/String;
    sget-object v12, Lcom/edutech/publicedu/log/LogHelp;->logPath:Ljava/lang/String;

    invoke-static {v12}, Lcom/edutech/daoxueben/until/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 192
    .local v7, "json":Ljava/lang/String;
    const-string/jumbo v12, "LogReturn"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    if-eqz v11, :cond_0

    if-eqz v7, :cond_0

    const-string/jumbo v12, ""

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 194
    const-string/jumbo v12, ""

    invoke-virtual {v12, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 196
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2, v11}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 197
    .local v2, "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v12, "X-Edutech-Entity"

    new-instance v13, Ljava/lang/StringBuilder;

    sget-object v14, Lcom/edutech/daoxueben/until/UpOrDownFile;->username:Ljava/lang/String;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 198
    const-string/jumbo v14, "+"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    sget-object v14, Lcom/edutech/daoxueben/until/UpOrDownFile;->privatekey:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 197
    invoke-virtual {v2, v12, v13}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 201
    .local v4, "imestamp":J
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v13, Lcom/edutech/daoxueben/until/UpOrDownFile;->username:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 202
    sget-object v13, Lcom/edutech/daoxueben/until/UpOrDownFile;->privatekey:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 201
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 203
    .local v9, "sign":Ljava/lang/String;
    const-string/jumbo v12, "Test2"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string/jumbo v14, "timestamp="

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "   sign="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    const-string/jumbo v12, "X-Edutech-Sign"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v14, "+"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v12, v13}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 207
    .local v8, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v12, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v13, "data"

    invoke-direct {v12, v13, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    :try_start_0
    new-instance v12, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .line 211
    const-string/jumbo v13, "UTF-8"

    invoke-direct {v12, v8, v13}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 210
    invoke-virtual {v2, v12}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 213
    new-instance v12, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v12}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 214
    invoke-virtual {v12, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 215
    .local v3, "httpResponse":Lorg/apache/http/HttpResponse;
    if-nez v3, :cond_1

    .line 261
    .end local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v4    # "imestamp":J
    .end local v8    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v9    # "sign":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 219
    .restart local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .restart local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v4    # "imestamp":J
    .restart local v8    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v9    # "sign":Ljava/lang/String;
    :cond_1
    const-string/jumbo v12, "qwe"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v12

    invoke-interface {v12}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v12

    const/16 v13, 0xc8

    if-ne v12, v13, :cond_0

    .line 224
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    .line 223
    invoke-static {v12}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v10

    .line 226
    .local v10, "strResult":Ljava/lang/String;
    invoke-static {v10}, Lcom/edutech/daoxueben/until/JsonHelper;->parseHttpPostReturnJson(Ljava/lang/String;)I

    move-result v6

    .line 227
    .local v6, "intResult":I
    const-string/jumbo v12, "LogReturnlog"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    const-string/jumbo v12, "LogReturnlog"

    .line 229
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 230
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 231
    const-string/jumbo v15, "errorInfo"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 230
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 229
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 228
    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    const/4 v12, 0x1

    if-ne v6, v12, :cond_0

    .line 235
    new-instance v0, Ljava/io/File;

    sget-object v12, Lcom/edutech/publicedu/log/LogHelp;->logPath:Ljava/lang/String;

    invoke-direct {v0, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 236
    .local v0, "Logfile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 238
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 248
    .end local v0    # "Logfile":Ljava/io/File;
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v6    # "intResult":I
    .end local v10    # "strResult":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 250
    .local v1, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto :goto_0

    .line 251
    .end local v1    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_1
    move-exception v1

    .line 254
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 255
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 257
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public startLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "Type"    # Ljava/lang/String;
    .param p2, "SectionsID"    # Ljava/lang/String;
    .param p3, "AssetsID"    # Ljava/lang/String;
    .param p4, "AssetsName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 106
    iput-boolean v3, p0, Lcom/edutech/publicedu/log/LogHelp;->starting:Z

    .line 108
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    invoke-virtual {v1}, Lcom/edutech/publicedu/log/LogInfo;->getData()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_0

    .line 109
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogInfo;->setData(Ljava/util/List;)V

    .line 111
    :cond_0
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    invoke-virtual {v1}, Lcom/edutech/publicedu/log/LogInfo;->getData()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    .line 123
    :goto_0
    iget-boolean v1, p0, Lcom/edutech/publicedu/log/LogHelp;->isResee:Z

    if-nez v1, :cond_2

    .line 124
    new-instance v1, Lcom/edutech/publicedu/log/LogDataItem;

    invoke-direct {v1}, Lcom/edutech/publicedu/log/LogDataItem;-><init>()V

    iput-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    .line 125
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    invoke-virtual {v1, p1}, Lcom/edutech/publicedu/log/LogDataItem;->setType(Ljava/lang/String;)V

    .line 126
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    iget-object v2, p0, Lcom/edutech/publicedu/log/LogHelp;->SubjectID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogDataItem;->setSubjectID(Ljava/lang/String;)V

    .line 127
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    iget-object v2, p0, Lcom/edutech/publicedu/log/LogHelp;->BookID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogDataItem;->setBookID(Ljava/lang/String;)V

    .line 128
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    iget-object v2, p0, Lcom/edutech/publicedu/log/LogHelp;->BookName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogDataItem;->setBookName(Ljava/lang/String;)V

    .line 129
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    invoke-virtual {v1, p2}, Lcom/edutech/publicedu/log/LogDataItem;->setSectionsID(Ljava/lang/String;)V

    .line 130
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    invoke-virtual {v1, p3}, Lcom/edutech/publicedu/log/LogDataItem;->setAssetsID(Ljava/lang/String;)V

    .line 131
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    invoke-virtual {v1, p4}, Lcom/edutech/publicedu/log/LogDataItem;->setAssetsName(Ljava/lang/String;)V

    .line 132
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    invoke-direct {p0}, Lcom/edutech/publicedu/log/LogHelp;->getCurrentFormatTime()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogDataItem;->setFirstTime(Ljava/lang/String;)V

    .line 133
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    const-string/jumbo v2, "0"

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogDataItem;->setTotalTime(Ljava/lang/String;)V

    .line 134
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    const-string/jumbo v2, "1"

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogDataItem;->setVisitCount(Ljava/lang/String;)V

    .line 135
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    const-string/jumbo v2, "0"

    invoke-virtual {v1, v2}, Lcom/edutech/publicedu/log/LogDataItem;->setLastTime(Ljava/lang/String;)V

    .line 136
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    invoke-virtual {v1}, Lcom/edutech/publicedu/log/LogInfo;->getData()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    :cond_2
    return-void

    .line 111
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/publicedu/log/LogDataItem;

    .line 112
    .local v0, "logDataItem":Lcom/edutech/publicedu/log/LogDataItem;
    invoke-virtual {v0}, Lcom/edutech/publicedu/log/LogDataItem;->getAssetsID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 113
    iput-object v0, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    .line 114
    new-instance v1, Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {v0}, Lcom/edutech/publicedu/log/LogDataItem;->getVisitCount()Ljava/lang/String;

    move-result-object v2

    .line 114
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 115
    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 114
    invoke-virtual {v0, v1}, Lcom/edutech/publicedu/log/LogDataItem;->setVisitCount(Ljava/lang/String;)V

    .line 117
    iput-boolean v3, p0, Lcom/edutech/publicedu/log/LogHelp;->isResee:Z

    goto/16 :goto_0
.end method

.method public stopLog()V
    .locals 2

    .prologue
    .line 165
    const-string/jumbo v0, "qwe"

    const-string/jumbo v1, "stopLog"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    iget-boolean v0, p0, Lcom/edutech/publicedu/log/LogHelp;->starting:Z

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/edutech/publicedu/log/LogHelp;->logDataItem:Lcom/edutech/publicedu/log/LogDataItem;

    invoke-direct {p0}, Lcom/edutech/publicedu/log/LogHelp;->getCurrentFormatTime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/edutech/publicedu/log/LogDataItem;->setLastTime(Ljava/lang/String;)V

    .line 172
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/edutech/publicedu/log/LogHelp;->starting:Z

    .line 173
    return-void
.end method

.method public writeLog()V
    .locals 4

    .prologue
    .line 176
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    invoke-virtual {v1}, Lcom/edutech/publicedu/log/LogInfo;->getData()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 178
    :try_start_0
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logFile:Ljava/io/File;

    iget-object v2, p0, Lcom/edutech/publicedu/log/LogHelp;->gson:Lcom/google/gson/Gson;

    iget-object v3, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    invoke-virtual {v2, v3}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 179
    const-string/jumbo v3, "UTF-8"

    .line 178
    invoke-static {v1, v2, v3}, Lorg/apache/commons/io/FileUtils;->writeStringToFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    iget-object v1, p0, Lcom/edutech/publicedu/log/LogHelp;->logInfo:Lcom/edutech/publicedu/log/LogInfo;

    invoke-virtual {v1}, Lcom/edutech/publicedu/log/LogInfo;->getData()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :cond_0
    :goto_0
    return-void

    .line 182
    :catch_0
    move-exception v0

    .line 183
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
