.class public Lcom/edutech/mobilestudyclient/util/AppDetails;
.super Ljava/lang/Object;
.source "AppDetails.java"


# instance fields
.field appIcon:Landroid/graphics/drawable/Drawable;

.field appName:Ljava/lang/String;

.field appPackageName:Ljava/lang/String;

.field appVersion:Ljava/lang/String;

.field appVersionCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAppIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getAppName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appName:Ljava/lang/String;

    return-object v0
.end method

.method public getAppPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getAppVersionCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appVersionCode:Ljava/lang/String;

    return-object v0
.end method

.method public setAppIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "appIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appIcon:Landroid/graphics/drawable/Drawable;

    .line 40
    return-void
.end method

.method public setAppName(Ljava/lang/String;)V
    .locals 0
    .param p1, "appName"    # Ljava/lang/String;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appName:Ljava/lang/String;

    .line 16
    return-void
.end method

.method public setAppPackageName(Ljava/lang/String;)V
    .locals 0
    .param p1, "appPackageName"    # Ljava/lang/String;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appPackageName:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setAppVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "appVersion"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appVersion:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setAppVersionCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "appVersionCode"    # Ljava/lang/String;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/AppDetails;->appVersionCode:Ljava/lang/String;

    .line 28
    return-void
.end method
