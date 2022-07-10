package com.edutech.mobilestudyclient.util;

import android.graphics.drawable.Drawable;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class AppDetails {
    Drawable appIcon;
    String appName;
    String appPackageName;
    String appVersion;
    String appVersionCode;

    public String getAppName() {
        return this.appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAppVersion() {
        return this.appVersion;
    }

    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }

    public String getAppVersionCode() {
        return this.appVersionCode;
    }

    public void setAppVersionCode(String appVersionCode) {
        this.appVersionCode = appVersionCode;
    }

    public String getAppPackageName() {
        return this.appPackageName;
    }

    public void setAppPackageName(String appPackageName) {
        this.appPackageName = appPackageName;
    }

    public Drawable getAppIcon() {
        return this.appIcon;
    }

    public void setAppIcon(Drawable appIcon) {
        this.appIcon = appIcon;
    }
}
