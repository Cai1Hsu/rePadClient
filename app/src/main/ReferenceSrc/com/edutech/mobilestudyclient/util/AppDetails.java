package com.edutech.mobilestudyclient.util;

import android.graphics.drawable.Drawable;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/util/AppDetails.class */
public class AppDetails {
    Drawable appIcon;
    String appName;
    String appPackageName;
    String appVersion;
    String appVersionCode;

    public Drawable getAppIcon() {
        return this.appIcon;
    }

    public String getAppName() {
        return this.appName;
    }

    public String getAppPackageName() {
        return this.appPackageName;
    }

    public String getAppVersion() {
        return this.appVersion;
    }

    public String getAppVersionCode() {
        return this.appVersionCode;
    }

    public void setAppIcon(Drawable drawable) {
        this.appIcon = drawable;
    }

    public void setAppName(String str) {
        this.appName = str;
    }

    public void setAppPackageName(String str) {
        this.appPackageName = str;
    }

    public void setAppVersion(String str) {
        this.appVersion = str;
    }

    public void setAppVersionCode(String str) {
        this.appVersionCode = str;
    }
}
