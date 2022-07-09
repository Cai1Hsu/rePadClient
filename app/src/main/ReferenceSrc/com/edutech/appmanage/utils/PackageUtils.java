package com.edutech.appmanage.utils;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import com.edutech.appmanage.utils.ShellUtils;
import java.io.File;
import java.util.List;
import org.apache.tools.ant.taskdefs.XSLTLiaison;

/* loaded from: classes.jar:com/edutech/appmanage/utils/PackageUtils.class */
public class PackageUtils {
    public static final int APP_INSTALL_AUTO = 0;
    public static final int APP_INSTALL_EXTERNAL = 2;
    public static final int APP_INSTALL_INTERNAL = 1;
    public static final int DELETE_FAILED_DEVICE_POLICY_MANAGER = -2;
    public static final int DELETE_FAILED_INTERNAL_ERROR = -1;
    public static final int DELETE_FAILED_INVALID_PACKAGE = -3;
    public static final int DELETE_FAILED_PERMISSION_DENIED = -4;
    public static final int DELETE_SUCCEEDED = 1;
    public static final int INSTALL_FAILED_ALREADY_EXISTS = -1;
    public static final int INSTALL_FAILED_CONFLICTING_PROVIDER = -13;
    public static final int INSTALL_FAILED_CONTAINER_ERROR = -18;
    public static final int INSTALL_FAILED_CPU_ABI_INCOMPATIBLE = -16;
    public static final int INSTALL_FAILED_DEXOPT = -11;
    public static final int INSTALL_FAILED_DUPLICATE_PACKAGE = -5;
    public static final int INSTALL_FAILED_INSUFFICIENT_STORAGE = -4;
    public static final int INSTALL_FAILED_INTERNAL_ERROR = -110;
    public static final int INSTALL_FAILED_INVALID_APK = -2;
    public static final int INSTALL_FAILED_INVALID_INSTALL_LOCATION = -19;
    public static final int INSTALL_FAILED_INVALID_URI = -3;
    public static final int INSTALL_FAILED_MEDIA_UNAVAILABLE = -20;
    public static final int INSTALL_FAILED_MISSING_FEATURE = -17;
    public static final int INSTALL_FAILED_MISSING_SHARED_LIBRARY = -9;
    public static final int INSTALL_FAILED_NEWER_SDK = -14;
    public static final int INSTALL_FAILED_NO_SHARED_USER = -6;
    public static final int INSTALL_FAILED_OLDER_SDK = -12;
    public static final int INSTALL_FAILED_OTHER = -1000000;
    public static final int INSTALL_FAILED_PACKAGE_CHANGED = -23;
    public static final int INSTALL_FAILED_REPLACE_COULDNT_DELETE = -10;
    public static final int INSTALL_FAILED_SHARED_USER_INCOMPATIBLE = -8;
    public static final int INSTALL_FAILED_TEST_ONLY = -15;
    public static final int INSTALL_FAILED_UID_CHANGED = -24;
    public static final int INSTALL_FAILED_UPDATE_INCOMPATIBLE = -7;
    public static final int INSTALL_FAILED_VERIFICATION_FAILURE = -22;
    public static final int INSTALL_FAILED_VERIFICATION_TIMEOUT = -21;
    public static final int INSTALL_PARSE_FAILED_BAD_MANIFEST = -101;
    public static final int INSTALL_PARSE_FAILED_BAD_PACKAGE_NAME = -106;
    public static final int INSTALL_PARSE_FAILED_BAD_SHARED_USER_ID = -107;
    public static final int INSTALL_PARSE_FAILED_CERTIFICATE_ENCODING = -105;
    public static final int INSTALL_PARSE_FAILED_INCONSISTENT_CERTIFICATES = -104;
    public static final int INSTALL_PARSE_FAILED_MANIFEST_EMPTY = -109;
    public static final int INSTALL_PARSE_FAILED_MANIFEST_MALFORMED = -108;
    public static final int INSTALL_PARSE_FAILED_NOT_APK = -100;
    public static final int INSTALL_PARSE_FAILED_NO_CERTIFICATES = -103;
    public static final int INSTALL_PARSE_FAILED_UNEXPECTED_EXCEPTION = -102;
    public static final int INSTALL_SUCCEEDED = 1;
    public static final String TAG = "PackageUtils";

    private PackageUtils() {
        throw new AssertionError();
    }

    public static int getAppVersionCode(Context context) {
        int i;
        PackageManager packageManager;
        PackageInfo packageInfo;
        if (context != null && (packageManager = context.getPackageManager()) != null) {
            try {
                packageInfo = packageManager.getPackageInfo(context.getPackageName(), 0);
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }
            if (packageInfo != null) {
                i = packageInfo.versionCode;
                return i;
            }
        }
        i = -1;
        return i;
    }

    public static int getInstallLocation() {
        int i = 1;
        ShellUtils.CommandResult execCommand = ShellUtils.execCommand("LD_LIBRARY_PATH=/vendor/lib:/system/lib pm get-install-location", false, true);
        if (execCommand.result == 0 && execCommand.successMsg != null && execCommand.successMsg.length() > 0) {
            try {
                switch (Integer.parseInt(execCommand.successMsg.substring(0, 1))) {
                    case 2:
                        i = 2;
                        break;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                Log.e(TAG, "pm get-install-location error");
            }
            return i;
        }
        i = 0;
        return i;
    }

    private static String getInstallLocationParams() {
        String str;
        switch (getInstallLocation()) {
            case 1:
                str = "-f";
                break;
            case 2:
                str = "-s";
                break;
            default:
                str = "";
                break;
        }
        return str;
    }

    public static final int install(Context context, String str) {
        int i = 1;
        if (isSystemApplication(context) || ShellUtils.checkRootPermission()) {
            int installSilent = installSilent(context, str);
            if (1 == installSilent) {
                i = installSilent;
            } else if (!installNormal(context, str)) {
                i = -3;
            }
        } else if (!installNormal(context, str)) {
            i = -3;
        }
        return i;
    }

    public static boolean installNormal(Context context, String str) {
        boolean z;
        Intent intent = new Intent("android.intent.action.VIEW");
        File file = new File(str);
        if (file == null || !file.exists() || !file.isFile() || file.length() <= 0) {
            z = false;
        } else {
            intent.setDataAndType(Uri.parse(XSLTLiaison.FILE_PROTOCOL_PREFIX + str), "application/vnd.android.package-archive");
            intent.addFlags(268435456);
            context.startActivity(intent);
            z = true;
        }
        return z;
    }

    public static int installSilent(Context context, String str) {
        return installSilent(context, str, " -r " + getInstallLocationParams());
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x00b2, code lost:
        if (r0.successMsg.contains("success") == false) goto L30;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int installSilent(Context context, String str, String str2) {
        int i;
        if (str == null || str.length() == 0) {
            i = -3;
        } else {
            File file = new File(str);
            if (file == null || file.length() <= 0 || !file.exists() || !file.isFile()) {
                i = -3;
            } else {
                StringBuilder append = new StringBuilder().append("LD_LIBRARY_PATH=/vendor/lib:/system/lib pm install ");
                String str3 = str2;
                if (str2 == null) {
                    str3 = "";
                }
                ShellUtils.CommandResult execCommand = ShellUtils.execCommand(append.append(str3).append(" ").append(str.replace(" ", "\\ ")).toString(), !isSystemApplication(context), true);
                if (execCommand.successMsg != null) {
                    i = 1;
                    if (!execCommand.successMsg.contains("Success")) {
                        i = 1;
                    }
                }
                Log.e(TAG, "installSilent successMsg:" + execCommand.successMsg + ", ErrorMsg:" + execCommand.errorMsg);
                i = execCommand.errorMsg == null ? -1000000 : execCommand.errorMsg.contains("INSTALL_FAILED_ALREADY_EXISTS") ? -1 : execCommand.errorMsg.contains("INSTALL_FAILED_INVALID_APK") ? -2 : execCommand.errorMsg.contains("INSTALL_FAILED_INVALID_URI") ? -3 : execCommand.errorMsg.contains("INSTALL_FAILED_INSUFFICIENT_STORAGE") ? -4 : execCommand.errorMsg.contains("INSTALL_FAILED_DUPLICATE_PACKAGE") ? -5 : execCommand.errorMsg.contains("INSTALL_FAILED_NO_SHARED_USER") ? -6 : execCommand.errorMsg.contains("INSTALL_FAILED_UPDATE_INCOMPATIBLE") ? -7 : execCommand.errorMsg.contains("INSTALL_FAILED_SHARED_USER_INCOMPATIBLE") ? -8 : execCommand.errorMsg.contains("INSTALL_FAILED_MISSING_SHARED_LIBRARY") ? -9 : execCommand.errorMsg.contains("INSTALL_FAILED_REPLACE_COULDNT_DELETE") ? -10 : execCommand.errorMsg.contains("INSTALL_FAILED_DEXOPT") ? -11 : execCommand.errorMsg.contains("INSTALL_FAILED_OLDER_SDK") ? -12 : execCommand.errorMsg.contains("INSTALL_FAILED_CONFLICTING_PROVIDER") ? -13 : execCommand.errorMsg.contains("INSTALL_FAILED_NEWER_SDK") ? -14 : execCommand.errorMsg.contains("INSTALL_FAILED_TEST_ONLY") ? -15 : execCommand.errorMsg.contains("INSTALL_FAILED_CPU_ABI_INCOMPATIBLE") ? -16 : execCommand.errorMsg.contains("INSTALL_FAILED_MISSING_FEATURE") ? -17 : execCommand.errorMsg.contains("INSTALL_FAILED_CONTAINER_ERROR") ? -18 : execCommand.errorMsg.contains("INSTALL_FAILED_INVALID_INSTALL_LOCATION") ? -19 : execCommand.errorMsg.contains("INSTALL_FAILED_MEDIA_UNAVAILABLE") ? -20 : execCommand.errorMsg.contains("INSTALL_FAILED_VERIFICATION_TIMEOUT") ? -21 : execCommand.errorMsg.contains("INSTALL_FAILED_VERIFICATION_FAILURE") ? -22 : execCommand.errorMsg.contains("INSTALL_FAILED_PACKAGE_CHANGED") ? -23 : execCommand.errorMsg.contains("INSTALL_FAILED_UID_CHANGED") ? -24 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_NOT_APK") ? -100 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_BAD_MANIFEST") ? -101 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_UNEXPECTED_EXCEPTION") ? -102 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_NO_CERTIFICATES") ? -103 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_INCONSISTENT_CERTIFICATES") ? -104 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_CERTIFICATE_ENCODING") ? -105 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_BAD_PACKAGE_NAME") ? -106 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_BAD_SHARED_USER_ID") ? -107 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_MANIFEST_MALFORMED") ? -108 : execCommand.errorMsg.contains("INSTALL_PARSE_FAILED_MANIFEST_EMPTY") ? -109 : execCommand.errorMsg.contains("INSTALL_FAILED_INTERNAL_ERROR") ? -110 : -1000000;
            }
        }
        return i;
    }

    public static boolean isEmpty(CharSequence charSequence) {
        return charSequence == null || charSequence.length() == 0;
    }

    public static <V> boolean isEmpty(List<V> list) {
        return list == null || list.size() == 0;
    }

    public static boolean isSystemApplication(Context context) {
        return context == null ? false : isSystemApplication(context, context.getPackageName());
    }

    public static boolean isSystemApplication(Context context, String str) {
        return context == null ? false : isSystemApplication(context.getPackageManager(), str);
    }

    public static boolean isSystemApplication(PackageManager packageManager, String str) {
        boolean z = false;
        if (packageManager != null) {
            z = false;
            if (str != null) {
                if (str.length() == 0) {
                    z = false;
                } else {
                    try {
                        ApplicationInfo applicationInfo = packageManager.getApplicationInfo(str, 0);
                        z = false;
                        if (applicationInfo != null) {
                            z = false;
                            if ((applicationInfo.flags & 1) > 0) {
                                z = true;
                            }
                        }
                    } catch (PackageManager.NameNotFoundException e) {
                        e.printStackTrace();
                        z = false;
                    }
                }
            }
        }
        return z;
    }

    public static Boolean isTopActivity(Context context, String str) {
        Boolean bool = null;
        if (context != null) {
            if (isEmpty(str)) {
                bool = null;
            } else {
                List<ActivityManager.RunningTaskInfo> runningTasks = ((ActivityManager) context.getSystemService("activity")).getRunningTasks(1);
                bool = null;
                if (!isEmpty(runningTasks)) {
                    try {
                        bool = Boolean.valueOf(str.equals(runningTasks.get(0).topActivity.getPackageName()));
                    } catch (Exception e) {
                        e.printStackTrace();
                        bool = false;
                    }
                }
            }
        }
        return bool;
    }

    public static void startInstalledAppDetails(Context context, String str) {
        Intent intent = new Intent();
        int i = Build.VERSION.SDK_INT;
        if (Build.VERSION.SDK_INT >= 9) {
            intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
            intent.setData(Uri.fromParts("package", str, null));
        } else {
            intent.setAction("android.intent.action.VIEW");
            intent.setClassName("com.android.settings", "com.android.settings.InstalledAppDetails");
            intent.putExtra(i == 8 ? "pkg" : "com.android.settings.ApplicationPkgName", str);
        }
        intent.addFlags(268435456);
        context.startActivity(intent);
    }

    public static final int uninstall(Context context, String str) {
        return (isSystemApplication(context) || ShellUtils.checkRootPermission()) ? uninstallSilent(context, str) : uninstallNormal(context, str) ? 1 : -3;
    }

    public static boolean uninstallNormal(Context context, String str) {
        boolean z;
        if (str == null || str.length() == 0) {
            z = false;
        } else {
            Intent intent = new Intent("android.intent.action.DELETE", Uri.parse(new StringBuilder(32).append("package:").append(str).toString()));
            intent.addFlags(268435456);
            context.startActivity(intent);
            z = true;
        }
        return z;
    }

    public static int uninstallSilent(Context context, String str) {
        return uninstallSilent(context, str, true);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0078, code lost:
        if (r0.successMsg.contains("success") == false) goto L21;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int uninstallSilent(Context context, String str, boolean z) {
        int i;
        if (str == null || str.length() == 0) {
            i = -3;
        } else {
            ShellUtils.CommandResult execCommand = ShellUtils.execCommand("LD_LIBRARY_PATH=/vendor/lib:/system/lib pm uninstall" + (z ? " -k " : " ") + str.replace(" ", "\\ "), !isSystemApplication(context), true);
            if (execCommand.successMsg != null) {
                i = 1;
                if (!execCommand.successMsg.contains("Success")) {
                    i = 1;
                }
            }
            Log.e(TAG, "uninstallSilent successMsg:" + execCommand.successMsg + ", ErrorMsg:" + execCommand.errorMsg);
            i = execCommand.errorMsg == null ? -1 : execCommand.errorMsg.contains("Permission denied") ? -4 : -1;
        }
        return i;
    }
}
