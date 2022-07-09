package com.edutech.mobilestudyclient;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/ApkUpdateBean.class */
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

    public long getApkDownloadSize() {
        return this.apkDownloadSize;
    }

    public String getApkLocalPath() {
        return this.apkLocalPath;
    }

    public long getApkSize() {
        return this.apkSize;
    }

    public String getApkUrl() {
        return this.apkUrl;
    }

    public String getAppName() {
        return this.appName;
    }

    public int getInstallState() {
        return this.installState;
    }

    public String getPackagename() {
        return this.packagename;
    }

    public String getVersioncode() {
        return this.versioncode;
    }

    public String getVersionname() {
        return this.versionname;
    }

    public void setApkDownloadSize(long j) {
        this.apkDownloadSize = j;
    }

    public void setApkLocalPath(String str) {
        this.apkLocalPath = str;
    }

    public void setApkSize(long j) {
        this.apkSize = j;
    }

    public void setApkUrl(String str) {
        this.apkUrl = str;
    }

    public void setAppName(String str) {
        this.appName = str;
    }

    public void setInstallState(int i) {
        this.installState = i;
    }

    public void setPackagename(String str) {
        this.packagename = str;
    }

    public void setVersioncode(String str) {
        this.versioncode = str;
    }

    public void setVersionname(String str) {
        this.versionname = str;
    }

    public String toString() {
        return "{\"packagename\":\"" + this.packagename + "\",\"appname\":\"" + this.appName + "\",\"versioncode\":\"" + this.versioncode + "\",\"versionname\":\"" + this.versionname + "\"}";
    }
}
