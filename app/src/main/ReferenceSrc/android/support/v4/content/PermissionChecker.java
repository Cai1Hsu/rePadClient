package android.support.v4.content;

import android.content.Context;
import android.os.Binder;
import android.os.Process;
import android.support.annotation.NonNull;
import android.support.v4.app.AppOpsManagerCompat;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* loaded from: classes.jar:android/support/v4/content/PermissionChecker.class */
public final class PermissionChecker {
    public static final int PERMISSION_DENIED = -1;
    public static final int PERMISSION_DENIED_APP_OP = -2;
    public static final int PERMISSION_GRANTED = 0;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.jar:android/support/v4/content/PermissionChecker$PermissionResult.class */
    public @interface PermissionResult {
    }

    private PermissionChecker() {
    }

    public static int checkCallingOrSelfPermission(@NonNull Context context, @NonNull String str) {
        return checkPermission(context, str, Binder.getCallingPid(), Binder.getCallingUid(), Binder.getCallingPid() == Process.myPid() ? context.getPackageName() : null);
    }

    public static int checkCallingPermission(@NonNull Context context, @NonNull String str, String str2) {
        return Binder.getCallingPid() == Process.myPid() ? -1 : checkPermission(context, str, Binder.getCallingPid(), Binder.getCallingUid(), str2);
    }

    public static int checkPermission(@NonNull Context context, @NonNull String str, int i, int i2, String str2) {
        int i3;
        if (context.checkPermission(str, i, i2) == -1) {
            i3 = -1;
        } else {
            String permissionToOp = AppOpsManagerCompat.permissionToOp(str);
            if (permissionToOp == null) {
                i3 = 0;
            } else {
                String str3 = str2;
                if (str2 == null) {
                    String[] packagesForUid = context.getPackageManager().getPackagesForUid(i2);
                    i3 = -1;
                    if (packagesForUid != null) {
                        i3 = -1;
                        if (packagesForUid.length > 0) {
                            str3 = packagesForUid[0];
                        }
                    }
                }
                i3 = AppOpsManagerCompat.noteProxyOp(context, permissionToOp, str3) != 0 ? -2 : 0;
            }
        }
        return i3;
    }

    public static int checkSelfPermission(@NonNull Context context, @NonNull String str) {
        return checkPermission(context, str, Process.myPid(), Process.myUid(), context.getPackageName());
    }
}
