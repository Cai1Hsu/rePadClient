package android.support.v4.os;

import android.os.Build;
import android.os.Environment;
import android.util.Log;
import java.io.File;
import java.io.IOException;

/* loaded from: classes.jar:android/support/v4/os/EnvironmentCompat.class */
public final class EnvironmentCompat {
    public static final String MEDIA_UNKNOWN = "unknown";
    private static final String TAG = "EnvironmentCompat";

    private EnvironmentCompat() {
    }

    public static String getStorageState(File file) {
        String str;
        if (Build.VERSION.SDK_INT >= 19) {
            str = EnvironmentCompatKitKat.getStorageState(file);
        } else {
            try {
                if (file.getCanonicalPath().startsWith(Environment.getExternalStorageDirectory().getCanonicalPath())) {
                    str = Environment.getExternalStorageState();
                }
            } catch (IOException e) {
                Log.w(TAG, "Failed to resolve canonical path: " + e);
            }
            str = MEDIA_UNKNOWN;
        }
        return str;
    }
}
