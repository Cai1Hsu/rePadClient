.class public Landroid/app/mia/MiaMdmPolicyManager;
.super Ljava/lang/Object;
.source "MiaMdmPolicyManager.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method


# virtual methods
.method public clearCustomLauncher()Z
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    return v0
.end method

.method public clearDefaults(Ljava/lang/String;)V
    .locals 0
    .param p1, "packagename"    # Ljava/lang/String;

    .prologue
    .line 31
    return-void
.end method

.method public controlBluetooth(Z)Z
    .locals 1
    .param p1, "iscontrol"    # Z

    .prologue
    .line 46
    const/4 v0, 0x0

    return v0
.end method

.method public controlLocation(Z)Z
    .locals 1
    .param p1, "iscontrol"    # Z

    .prologue
    .line 20
    const/4 v0, 0x0

    return v0
.end method

.method public controlRecentAppList(Z)V
    .locals 0
    .param p1, "iscontrol"    # Z

    .prologue
    .line 58
    return-void
.end method

.method public controlStatusBar(Z)V
    .locals 0
    .param p1, "iscontrol"    # Z

    .prologue
    .line 43
    return-void
.end method

.method public getMiaSN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMiaScreen()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 12
    const/4 v0, 0x0

    return-object v0
.end method

.method public setCustomLauncher(Ljava/lang/String;)Z
    .locals 1
    .param p1, "packagename"    # Ljava/lang/String;

    .prologue
    .line 50
    const/4 v0, 0x0

    return v0
.end method

.method public setMobliteData(Z)V
    .locals 0
    .param p1, "isEnabled"    # Z

    .prologue
    .line 66
    return-void
.end method

.method public setNavigaBar(Z)V
    .locals 0
    .param p1, "iscontrol"    # Z

    .prologue
    .line 28
    return-void
.end method

.method public setOnlyCharging(Z)Z
    .locals 1
    .param p1, "iscontrol"    # Z

    .prologue
    .line 24
    const/4 v0, 0x0

    return v0
.end method

.method public setTFcard(Z)V
    .locals 0
    .param p1, "iscontrol"    # Z

    .prologue
    .line 40
    return-void
.end method

.method public silentInstall(Ljava/lang/String;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 37
    return-void
.end method

.method public silentUnInstall(Ljava/lang/String;)V
    .locals 0
    .param p1, "packagename"    # Ljava/lang/String;

    .prologue
    .line 34
    return-void
.end method

.method public updateSystemTime(Ljava/lang/String;)Z
    .locals 1
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    .line 16
    const/4 v0, 0x0

    return v0
.end method
