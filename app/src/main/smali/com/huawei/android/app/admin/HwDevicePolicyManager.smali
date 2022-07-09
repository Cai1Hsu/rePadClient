.class public Lcom/huawei/android/app/admin/HwDevicePolicyManager;
.super Ljava/lang/Object;
.source "HwDevicePolicyManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "HwDevicePolicyManager"


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->mContext:Landroid/content/Context;

    .line 33
    return-void
.end method


# virtual methods
.method public addDisallowedRunningApp(Landroid/content/ComponentName;Ljava/util/List;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 247
    .local p2, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public addDisallowedUninstallPackages(Landroid/content/ComponentName;Ljava/util/List;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 188
    .local p2, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public addInstallPackages(Landroid/content/ComponentName;Ljava/util/List;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 175
    .local p2, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public captureScreen(Landroid/content/ComponentName;II)Landroid/graphics/Bitmap;
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 237
    const/4 v0, 0x0

    return-object v0
.end method

.method public clearCustomLauncher(Landroid/content/ComponentName;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 244
    return-void
.end method

.method public getDisallowedRunningApp(Landroid/content/ComponentName;)Ljava/util/List;
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 257
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDisallowedUninstallPackageList(Landroid/content/ComponentName;)Ljava/util/List;
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 194
    const/4 v0, 0x0

    return-object v0
.end method

.method public getInstallPackageWhiteList(Landroid/content/ComponentName;)Ljava/util/List;
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 181
    const/4 v0, 0x0

    return-object v0
.end method

.method public hangupCalling(Landroid/content/ComponentName;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 162
    return-void
.end method

.method public installPackage(Landroid/content/ComponentName;Ljava/lang/String;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "packagePath"    # Ljava/lang/String;

    .prologue
    .line 168
    return-void
.end method

.method public isAdbDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 132
    const/4 v0, 0x0

    return v0
.end method

.method public isBluetoothDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "who"    # Landroid/content/ComponentName;

    .prologue
    .line 149
    const/4 v0, 0x0

    return v0
.end method

.method public isBootLoaderDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public isDataConnectivityDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 104
    const/4 v0, 0x0

    return v0
.end method

.method public isDisallowedRunningApp(Landroid/content/ComponentName;Ljava/lang/String;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    .line 253
    const/4 v0, 0x0

    return v0
.end method

.method public isExternalStorageDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method public isGpsDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "who"    # Landroid/content/ComponentName;

    .prologue
    .line 155
    const/4 v0, 0x0

    return v0
.end method

.method public isHomeButtonDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "who"    # Landroid/content/ComponentName;

    .prologue
    .line 221
    const/4 v0, 0x0

    return v0
.end method

.method public isNFCDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 94
    const/4 v0, 0x0

    return v0
.end method

.method public isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "who"    # Landroid/content/ComponentName;

    .prologue
    .line 227
    const/4 v0, 0x0

    return v0
.end method

.method public isSMSDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 122
    const/4 v0, 0x0

    return v0
.end method

.method public isSafeModeDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "who"    # Landroid/content/ComponentName;

    .prologue
    .line 233
    const/4 v0, 0x0

    return v0
.end method

.method public isStatusBarExpandPanelDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "who"    # Landroid/content/ComponentName;

    .prologue
    .line 215
    const/4 v0, 0x0

    return v0
.end method

.method public isTelephonyDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 143
    const/4 v0, 0x0

    return v0
.end method

.method public isUSBDataDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public isVoiceDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 113
    const/4 v0, 0x0

    return v0
.end method

.method public isWifiApDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 54
    const/4 v0, 0x0

    return v0
.end method

.method public isWifiDisabled(Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "who"    # Landroid/content/ComponentName;

    .prologue
    .line 43
    const/4 v0, 0x0

    return v0
.end method

.method public rebootDevice(Landroid/content/ComponentName;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 206
    return-void
.end method

.method public removeDisallowedRunningApp(Landroid/content/ComponentName;Ljava/util/List;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 250
    .local p2, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public removeDisallowedUninstallPackages(Landroid/content/ComponentName;Ljava/util/List;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p2, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public removeInstallPackages(Landroid/content/ComponentName;Ljava/util/List;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 178
    .local p2, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public setAdbDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 129
    return-void
.end method

.method public setBluetoothDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "who"    # Landroid/content/ComponentName;
    .param p2, "disable"    # Z

    .prologue
    .line 147
    return-void
.end method

.method public setBootLoaderDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 61
    return-void
.end method

.method public setCustomLauncher(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "className"    # Ljava/lang/String;

    .prologue
    .line 241
    return-void
.end method

.method public setDataConnectivityDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 102
    return-void
.end method

.method public setDisallowedUninstallPackages(Landroid/content/ComponentName;Ljava/util/List;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 198
    .local p2, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public setExternalStorageDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 81
    return-void
.end method

.method public setGpsDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "who"    # Landroid/content/ComponentName;
    .param p2, "disable"    # Z

    .prologue
    .line 153
    return-void
.end method

.method public setHomeButtonDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "who"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 219
    return-void
.end method

.method public setInstallPackages(Landroid/content/ComponentName;Ljava/util/List;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p2, "packageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public setNFCDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 91
    return-void
.end method

.method public setRecentTaskButtonDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "who"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 225
    return-void
.end method

.method public setSMSDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 120
    return-void
.end method

.method public setSafeModeDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "who"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 231
    return-void
.end method

.method public setStatusBarExpandPanelDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "who"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 212
    return-void
.end method

.method public setSysTime(Landroid/content/ComponentName;J)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "mills"    # J

    .prologue
    .line 209
    return-void
.end method

.method public setTelephonyDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 140
    return-void
.end method

.method public setUSBDataDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 70
    return-void
.end method

.method public setVoiceDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 111
    return-void
.end method

.method public setWifiApDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 50
    return-void
.end method

.method public setWifiDisabled(Landroid/content/ComponentName;Z)V
    .locals 0
    .param p1, "who"    # Landroid/content/ComponentName;
    .param p2, "disabled"    # Z

    .prologue
    .line 40
    return-void
.end method

.method public shutdownDevice(Landroid/content/ComponentName;)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;

    .prologue
    .line 203
    return-void
.end method

.method public uninstallPackage(Landroid/content/ComponentName;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "admin"    # Landroid/content/ComponentName;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "keepData"    # Z

    .prologue
    .line 171
    return-void
.end method
