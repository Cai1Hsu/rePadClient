package android.support.v4.app;

import android.app.ActivityManager;
import android.os.Build;
import android.support.annotation.NonNull;

/* loaded from: classes.jar:android/support/v4/app/ActivityManagerCompat.class */
public final class ActivityManagerCompat {
    private ActivityManagerCompat() {
    }

    public static boolean isLowRamDevice(@NonNull ActivityManager activityManager) {
        return Build.VERSION.SDK_INT >= 19 ? ActivityManagerCompatKitKat.isLowRamDevice(activityManager) : false;
    }
}
