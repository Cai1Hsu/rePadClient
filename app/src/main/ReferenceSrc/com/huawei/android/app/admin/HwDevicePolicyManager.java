package com.huawei.android.app.admin;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class HwDevicePolicyManager {
    private static final String TAG = "HwDevicePolicyManager";
    private final Context mContext;

    public HwDevicePolicyManager(Context context) {
        this.mContext = context;
    }

    public void setWifiDisabled(ComponentName who, boolean disabled) {
    }

    public boolean isWifiDisabled(ComponentName who) {
        return false;
    }

    public void setWifiApDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isWifiApDisabled(ComponentName admin) {
        return false;
    }

    public void setBootLoaderDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isBootLoaderDisabled(ComponentName admin) {
        return false;
    }

    public void setUSBDataDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isUSBDataDisabled(ComponentName admin) {
        return false;
    }

    public void setExternalStorageDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isExternalStorageDisabled(ComponentName admin) {
        return false;
    }

    public void setNFCDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isNFCDisabled(ComponentName admin) {
        return false;
    }

    public void setDataConnectivityDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isDataConnectivityDisabled(ComponentName admin) {
        return false;
    }

    public void setVoiceDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isVoiceDisabled(ComponentName admin) {
        return false;
    }

    public void setSMSDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isSMSDisabled(ComponentName admin) {
        return false;
    }

    public void setAdbDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isAdbDisabled(ComponentName admin) {
        return false;
    }

    public void setTelephonyDisabled(ComponentName admin, boolean disabled) {
    }

    public boolean isTelephonyDisabled(ComponentName admin) {
        return false;
    }

    public void setBluetoothDisabled(ComponentName who, boolean disable) {
    }

    public boolean isBluetoothDisabled(ComponentName who) {
        return false;
    }

    public void setGpsDisabled(ComponentName who, boolean disable) {
    }

    public boolean isGpsDisabled(ComponentName who) {
        return false;
    }

    public void hangupCalling(ComponentName admin) {
    }

    public void installPackage(ComponentName admin, String packagePath) {
    }

    public void uninstallPackage(ComponentName admin, String packageName, boolean keepData) {
    }

    public void addInstallPackages(ComponentName admin, List<String> packageNames) {
    }

    public void removeInstallPackages(ComponentName admin, List<String> packageNames) {
    }

    public List<String> getInstallPackageWhiteList(ComponentName admin) {
        return null;
    }

    public void setInstallPackages(ComponentName admin, List<String> packageNames) {
    }

    public void addDisallowedUninstallPackages(ComponentName admin, List<String> packageNames) {
    }

    public void removeDisallowedUninstallPackages(ComponentName admin, List<String> packageNames) {
    }

    public List<String> getDisallowedUninstallPackageList(ComponentName admin) {
        return null;
    }

    public void setDisallowedUninstallPackages(ComponentName admin, List<String> packageNames) {
    }

    public void shutdownDevice(ComponentName admin) {
    }

    public void rebootDevice(ComponentName admin) {
    }

    public void setSysTime(ComponentName admin, long mills) {
    }

    public void setStatusBarExpandPanelDisabled(ComponentName who, boolean disabled) {
    }

    public boolean isStatusBarExpandPanelDisabled(ComponentName who) {
        return false;
    }

    public void setHomeButtonDisabled(ComponentName who, boolean disabled) {
    }

    public boolean isHomeButtonDisabled(ComponentName who) {
        return false;
    }

    public void setRecentTaskButtonDisabled(ComponentName who, boolean disabled) {
    }

    public boolean isRecentTaskButtonDisabled(ComponentName who) {
        return false;
    }

    public void setSafeModeDisabled(ComponentName who, boolean disabled) {
    }

    public boolean isSafeModeDisabled(ComponentName who) {
        return false;
    }

    public Bitmap captureScreen(ComponentName admin, int width, int height) {
        return null;
    }

    public void setCustomLauncher(ComponentName admin, String packageName, String className) {
    }

    public void clearCustomLauncher(ComponentName admin) {
    }

    public void addDisallowedRunningApp(ComponentName admin, List<String> packageNames) {
    }

    public void removeDisallowedRunningApp(ComponentName admin, List<String> packageNames) {
    }

    public boolean isDisallowedRunningApp(ComponentName admin, String packageName) {
        return false;
    }

    public List<String> getDisallowedRunningApp(ComponentName admin) {
        return null;
    }
}
