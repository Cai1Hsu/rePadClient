.class public Lcom/edutech/mobilestudyclient/ApkUpdateBean;
.super Ljava/lang/Object;
.source "ApkUpdateBean.java"


# instance fields
.field private apkDownloadSize:J

.field private apkLocalPath:Ljava/lang/String;

.field private apkSize:J

.field private apkUrl:Ljava/lang/String;

.field private appName:Ljava/lang/String;

.field private installState:I

.field private packagename:Ljava/lang/String;

.field private versioncode:Ljava/lang/String;

.field private versionname:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getApkDownloadSize()J
    .locals 2

    .prologue
    .line 40
    iget-wide v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->apkDownloadSize:J

    return-wide v0
.end method

.method public getApkLocalPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->apkLocalPath:Ljava/lang/String;

    return-object v0
.end method

.method public getApkSize()J
    .locals 2

    .prologue
    .line 34
    iget-wide v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->apkSize:J

    return-wide v0
.end method

.method public getApkUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->apkUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getAppName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->appName:Ljava/lang/String;

    return-object v0
.end method

.method public getInstallState()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->installState:I

    return v0
.end method

.method public getPackagename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->packagename:Ljava/lang/String;

    return-object v0
.end method

.method public getVersioncode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->versioncode:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->versionname:Ljava/lang/String;

    return-object v0
.end method

.method public setApkDownloadSize(J)V
    .locals 1
    .param p1, "apkDownloadSize"    # J

    .prologue
    .line 43
    iput-wide p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->apkDownloadSize:J

    .line 44
    return-void
.end method

.method public setApkLocalPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "apkLocalPath"    # Ljava/lang/String;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->apkLocalPath:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public setApkSize(J)V
    .locals 1
    .param p1, "apkSize"    # J

    .prologue
    .line 37
    iput-wide p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->apkSize:J

    .line 38
    return-void
.end method

.method public setApkUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "apkUrl"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->apkUrl:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setAppName(Ljava/lang/String;)V
    .locals 0
    .param p1, "appName"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->appName:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setInstallState(I)V
    .locals 0
    .param p1, "installState"    # I

    .prologue
    .line 49
    iput p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->installState:I

    .line 50
    return-void
.end method

.method public setPackagename(Ljava/lang/String;)V
    .locals 0
    .param p1, "packagename"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->packagename:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public setVersioncode(Ljava/lang/String;)V
    .locals 0
    .param p1, "versioncode"    # Ljava/lang/String;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->versioncode:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public setVersionname(Ljava/lang/String;)V
    .locals 0
    .param p1, "versionname"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->versionname:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "{\"packagename\":\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->packagename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\"appname\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->appName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\"versioncode\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->versioncode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\"versionname\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->versionname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
