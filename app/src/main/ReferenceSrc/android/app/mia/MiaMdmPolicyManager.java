package android.app.mia;

import android.content.Context;
import android.graphics.Bitmap;

/* loaded from: classes.jar:android/app/mia/MiaMdmPolicyManager.class */
public class MiaMdmPolicyManager {
    public MiaMdmPolicyManager(Context context) {
    }

    public boolean clearCustomLauncher() {
        return false;
    }

    public void clearDefaults(String str) {
    }

    public boolean controlBluetooth(boolean z) {
        return false;
    }

    public boolean controlLocation(boolean z) {
        return false;
    }

    public void controlRecentAppList(boolean z) {
    }

    public void controlStatusBar(boolean z) {
    }

    public String getMiaSN() {
        return null;
    }

    public Bitmap getMiaScreen() {
        return null;
    }

    public boolean setCustomLauncher(String str) {
        return false;
    }

    public void setMobliteData(boolean z) {
    }

    public void setNavigaBar(boolean z) {
    }

    public boolean setOnlyCharging(boolean z) {
        return false;
    }

    public void setTFcard(boolean z) {
    }

    public void silentInstall(String str) {
    }

    public void silentUnInstall(String str) {
    }

    public boolean updateSystemTime(String str) {
        return false;
    }
}
