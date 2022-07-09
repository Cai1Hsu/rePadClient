package android.support.v4.content;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.annotation.RequiresApi;
import java.io.File;

@RequiresApi(24)
@TargetApi(24)
/* loaded from: classes.jar:android/support/v4/content/ContextCompatApi24.class */
class ContextCompatApi24 {
    ContextCompatApi24() {
    }

    public static Context createDeviceProtectedStorageContext(Context context) {
        return context.createDeviceProtectedStorageContext();
    }

    public static File getDataDir(Context context) {
        return context.getDataDir();
    }

    public static boolean isDeviceProtectedStorage(Context context) {
        return context.isDeviceProtectedStorage();
    }
}
