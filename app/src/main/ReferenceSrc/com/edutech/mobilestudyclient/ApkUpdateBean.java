package com.edutech.mobilestudyclient;

/* loaded from: classes.dex */
public class ApkUpdateBean {
    private long apkDownloadSize;
    private String apkLocalPath;
    private long apkSize;
    private String apkUrl;
    private String appName;
    private int installState;
    private String packagename;
    private String versioncode;
    private String versionname;

    public String getVersioncode() {
        return this.versioncode;
    }

    public void setVersioncode(String versioncode) {
        this.versioncode = versioncode;
    }

    public String getVersionname() {
        return this.versionname;
    }

    public void setVersionname(String versionname) {
        this.versionname = versionname;
    }

    public String getAppName() {
        return this.appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public long getApkSize() {
        return this.apkSize;
    }

    public void setApkSize(long apkSize) {
        this.apkSize = apkSize;
    }

    public long getApkDownloadSize() {
        return this.apkDownloadSize;
    }

    public void setApkDownloadSize(long apkDownloadSize) {
        this.apkDownloadSize = apkDownloadSize;
    }

    public int getInstallState() {
        return this.installState;
    }

    public void setInstallState(int installState) {
        this.installState = installState;
    }

    public String getPackagename() {
        return this.packagename;
    }

    public void setPackagename(String packagename) {
        this.packagename = packagename;
    }

    public String getApkUrl() {
        return this.apkUrl;
    }

    public void setApkUrl(String apkUrl) {
        this.apkUrl = apkUrl;
    }

    public String getApkLocalPath() {
        return this.apkLocalPath;
    }

    public void setApkLocalPath(String apkLocalPath) {
        this.apkLocalPath = apkLocalPath;
    }

    public String toString() {
        return "{\"packagename\":\"" + this.packagename + "\",\"appname\":\"" + this.appName + "\",\"versioncode\":\"" + this.versioncode + "\",\"versionname\":\"" + this.versionname + "\"}";
    }
}
