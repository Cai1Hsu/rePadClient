package android.support.v4.app;

import android.content.Context;
import android.os.Build;
import android.support.annotation.NonNull;

/* loaded from: classes.jar:android/support/v4/app/AppOpsManagerCompat.class */
public final class AppOpsManagerCompat {
    private static final AppOpsManagerImpl IMPL;
    public static final int MODE_ALLOWED = 0;
    public static final int MODE_DEFAULT = 3;
    public static final int MODE_IGNORED = 1;

    /* loaded from: classes.jar:android/support/v4/app/AppOpsManagerCompat$AppOpsManager23.class */
    private static class AppOpsManager23 extends AppOpsManagerImpl {
        AppOpsManager23() {
        }

        @Override // android.support.v4.app.AppOpsManagerCompat.AppOpsManagerImpl
        public int noteOp(Context context, String str, int i, String str2) {
            return AppOpsManagerCompat23.noteOp(context, str, i, str2);
        }

        @Override // android.support.v4.app.AppOpsManagerCompat.AppOpsManagerImpl
        public int noteProxyOp(Context context, String str, String str2) {
            return AppOpsManagerCompat23.noteProxyOp(context, str, str2);
        }

        @Override // android.support.v4.app.AppOpsManagerCompat.AppOpsManagerImpl
        public String permissionToOp(String str) {
            return AppOpsManagerCompat23.permissionToOp(str);
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/AppOpsManagerCompat$AppOpsManagerImpl.class */
    private static class AppOpsManagerImpl {
        AppOpsManagerImpl() {
        }

        public int noteOp(Context context, String str, int i, String str2) {
            return 1;
        }

        public int noteProxyOp(Context context, String str, String str2) {
            return 1;
        }

        public String permissionToOp(String str) {
            return null;
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 23) {
            IMPL = new AppOpsManager23();
        } else {
            IMPL = new AppOpsManagerImpl();
        }
    }

    private AppOpsManagerCompat() {
    }

    public static int noteOp(@NonNull Context context, @NonNull String str, int i, @NonNull String str2) {
        return IMPL.noteOp(context, str, i, str2);
    }

    public static int noteProxyOp(@NonNull Context context, @NonNull String str, @NonNull String str2) {
        return IMPL.noteProxyOp(context, str, str2);
    }

    public static String permissionToOp(@NonNull String str) {
        return IMPL.permissionToOp(str);
    }
}
