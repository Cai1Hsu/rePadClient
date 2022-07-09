package com.huawei.android.app.admin;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import java.util.List;

/* loaded from: classes.jar:com/huawei/android/app/admin/HwDevicePolicyManager.class */
public class HwDevicePolicyManager {
    private static final String TAG = "HwDevicePolicyManager";
    private final Context mContext;

    public HwDevicePolicyManager(Context context) {
        this.mContext = context;
    }

    public void addDisallowedRunningApp(ComponentName componentName, List<String> list) {
    }

    public void addDisallowedUninstallPackages(ComponentName componentName, List<String> list) {
    }

    public void addInstallPackages(ComponentName componentName, List<String> list) {
    }

    public Bitmap captureScreen(ComponentName componentName, int i, int i2) {
        return null;
    }

    public void clearCustomLauncher(ComponentName componentName) {
    }

    public List<String> getDisallowedRunningApp(ComponentName componentName) {
        return null;
    }

    public List<String> getDisallowedUninstallPackageList(ComponentName componentName) {
        return null;
    }

    public List<String> getInstallPackageWhiteList(ComponentName componentName) {
        return null;
    }

    public void hangupCalling(ComponentName componentName) {
    }

    public void installPackage(ComponentName componentName, String str) {
    }

    public boolean isAdbDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isBluetoothDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isBootLoaderDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isDataConnectivityDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isDisallowedRunningApp(ComponentName componentName, String str) {
        return false;
    }

    public boolean isExternalStorageDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isGpsDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isHomeButtonDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isNFCDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isRecentTaskButtonDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isSMSDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isSafeModeDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isStatusBarExpandPanelDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isTelephonyDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isUSBDataDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isVoiceDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isWifiApDisabled(ComponentName componentName) {
        return false;
    }

    public boolean isWifiDisabled(ComponentName componentName) {
        return false;
    }

    public void rebootDevice(ComponentName componentName) {
    }

    public void removeDisallowedRunningApp(ComponentName componentName, List<String> list) {
    }

    public void removeDisallowedUninstallPackages(ComponentName componentName, List<String> list) {
    }

    public void removeInstallPackages(ComponentName componentName, List<String> list) {
    }

    public void setAdbDisabled(ComponentName componentName, boolean z) {
    }

    public void setBluetoothDisabled(ComponentName componentName, boolean z) {
    }

    public void setBootLoaderDisabled(ComponentName componentName, boolean z) {
    }

    public void setCustomLauncher(ComponentName componentName, String str, String str2) {
    }

    public void setDataConnectivityDisabled(ComponentName componentName, boolean z) {
    }

    public void setDisallowedUninstallPackages(ComponentName componentName, List<String> list) {
    }

    public void setExternalStorageDisabled(ComponentName componentName, boolean z) {
    }

    public void setGpsDisabled(ComponentName componentName, boolean z) {
    }

    public void setHomeButtonDisabled(ComponentName componentName, boolean z) {
    }

    public void setInstallPackages(ComponentName componentName, List<String> list) {
    }

    public void setNFCDisabled(ComponentName componentName, boolean z) {
    }

    public void setRecentTaskButtonDisabled(ComponentName componentName, boolean z) {
    }

    public void setSMSDisabled(ComponentName componentName, boolean z) {
    }

    public void setSafeModeDisabled(ComponentName componentName, boolean z) {
    }

    public void setStatusBarExpandPanelDisabled(ComponentName componentName, boolean z) {
    }

    public void setSysTime(ComponentName componentName, long j) {
    }

    public void setTelephonyDisabled(ComponentName componentName, boolean z) {
    }

    public void setUSBDataDisabled(ComponentName componentName, boolean z) {
    }

    public void setVoiceDisabled(ComponentName componentName, boolean z) {
    }

    public void setWifiApDisabled(ComponentName componentName, boolean z) {
    }

    public void setWifiDisabled(ComponentName componentName, boolean z) {
    }

    public void shutdownDevice(ComponentName componentName) {
    }

    public void uninstallPackage(ComponentName componentName, String str, boolean z) {
    }
}
