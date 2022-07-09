package com.edutech.appmanage.utils;

import android.app.mia.MiaMdmPolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import com.edutech.utils.InstallApkUtil;
import com.huawei.android.app.admin.HwDevicePolicyManager;
import java.io.File;
import java.io.PrintWriter;

/* loaded from: classes.jar:com/edutech/appmanage/utils/ApkController.class */
public class ApkController {
    private static void apkIntentInstall(String str, Context context) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        intent.setFlags(268435456);
        context.startActivity(intent);
    }

    private static void apkIntentUninstall(String str, Context context) {
        Intent intent = new Intent("android.intent.action.DELETE", Uri.parse("package:" + str));
        intent.addFlags(268435456);
        context.startActivity(intent);
    }

    private static void apkUninstall(String str, Context context) {
        try {
            if (InstallApkUtil.SlientUninstall(str)) {
                Log.d("sysService", String.valueOf(str) + ":SlientInstall卸载成功！");
            } else if (!InstallApkUtil.SuSlientUninstall(str)) {
                apkIntentUninstall(str, context);
            } else {
                Log.d("sysService", String.valueOf(str) + ":SuSlientInstall卸载成功！");
            }
        } catch (Exception e) {
            try {
                if (!InstallApkUtil.SuSlientUninstall(str)) {
                    apkIntentUninstall(str, context);
                } else {
                    Log.d("sysService", String.valueOf(str) + ":SuSlientInstall卸载成功！");
                }
            } catch (Exception e2) {
                apkIntentUninstall(str, context);
                Log.d("sysService", String.valueOf(str) + ":InstallApk卸载成功！");
            }
        }
    }

    private static void apkinstall(String str, Context context) {
        try {
            if (InstallApkUtil.SlientInstall(str)) {
                Log.d("sysService", String.valueOf(str) + ":SlientInstall安装成功！");
            } else if (!InstallApkUtil.SuSlientInstall(str)) {
                apkIntentInstall(str, context);
            } else {
                Log.d("sysService", String.valueOf(str) + ":SuSlientInstall安装成功！");
            }
        } catch (Exception e) {
            try {
                if (!InstallApkUtil.SuSlientInstall(str)) {
                    apkIntentInstall(str, context);
                } else {
                    Log.d("sysService", String.valueOf(str) + ":SuSlientInstall安装成功！");
                }
            } catch (Exception e2) {
                apkIntentInstall(str, context);
                Log.d("sysService", String.valueOf(str) + ":InstallApk安装成功！");
            }
        }
    }

    private static void apkinstall_samsung(String str, Context context) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_INSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent.putExtra("uri", str);
        } else {
            intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        }
        context.sendBroadcast(intent);
    }

    private static void apkuninstall_samsung(String str, Context context) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_UNINSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent.putExtra("pgk", str);
        } else {
            intent.setData(Uri.parse("package://" + str));
        }
        context.sendBroadcast(intent);
    }

    private static boolean clientInstall(String str) {
        Process process;
        Throwable th;
        Exception e;
        boolean z;
        PrintWriter printWriter;
        Process process2 = null;
        Process process3 = null;
        try {
            try {
                process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                process3 = process;
                printWriter = new PrintWriter(process.getOutputStream());
            } catch (Exception e2) {
                e = e2;
                process = process3;
            }
        } catch (Throwable th2) {
            th = th2;
            process = process2;
        }
        try {
            printWriter.println("chmod 777 " + str);
            printWriter.println("export LD_LIBRARY_PATH=/vendor/lib:/system/lib");
            printWriter.println("pm install -r " + str);
            printWriter.flush();
            printWriter.close();
            z = returnResult(process.waitFor());
            if (process != null) {
                process.destroy();
            }
        } catch (Exception e3) {
            e = e3;
            process2 = process;
            e.printStackTrace();
            if (process != null) {
                process.destroy();
            }
            z = false;
            return z;
        } catch (Throwable th3) {
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
        return z;
    }

    private static boolean clientUninstall(String str) {
        Process process;
        Throwable th;
        Exception e;
        boolean z;
        PrintWriter printWriter;
        Process process2 = null;
        Process process3 = null;
        try {
            try {
                process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                process3 = process;
                printWriter = new PrintWriter(process.getOutputStream());
            } catch (Exception e2) {
                e = e2;
                process = process3;
            }
        } catch (Throwable th2) {
            th = th2;
            process = process2;
        }
        try {
            printWriter.println("LD_LIBRARY_PATH=/vendor/lib:/system/lib ");
            printWriter.println("pm uninstall " + str);
            printWriter.flush();
            printWriter.close();
            z = returnResult(process.waitFor());
            if (process != null) {
                process.destroy();
            }
        } catch (Exception e3) {
            e = e3;
            process2 = process;
            e.printStackTrace();
            if (process != null) {
                process.destroy();
            }
            z = false;
            return z;
        } catch (Throwable th3) {
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
        return z;
    }

    private static boolean hasRootPerssion() {
        Throwable th;
        Process process;
        Process process2;
        Exception e;
        boolean z;
        PrintWriter printWriter;
        Process process3 = null;
        Process process4 = null;
        try {
            try {
                process2 = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                process4 = process2;
                printWriter = new PrintWriter(process2.getOutputStream());
            } catch (Exception e2) {
                process2 = process4;
                e = e2;
            }
        } catch (Throwable th2) {
            th = th2;
            process = process3;
        }
        try {
            printWriter.flush();
            printWriter.close();
            boolean returnResult = returnResult(process2.waitFor());
            z = returnResult;
            if (process2 != null) {
                process2.destroy();
                z = returnResult;
            }
        } catch (Exception e3) {
            e = e3;
            process3 = process2;
            e.printStackTrace();
            if (process2 != null) {
                process2.destroy();
            }
            z = false;
            return z;
        } catch (Throwable th3) {
            process = process2;
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
        return z;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x00f7 -> B:40:0x0042). Please submit an issue!!! */
    public static boolean install(String str, Context context) {
        boolean z;
        boolean z2 = false;
        ComponentName componentName = new ComponentName("com.launcher.activity", ApkController.class.getSimpleName());
        HwDevicePolicyManager hwDevicePolicyManager = new HwDevicePolicyManager(context);
        MiaMdmPolicyManager miaMdmPolicyManager = new MiaMdmPolicyManager(context);
        try {
            z2 = hwDevicePolicyManager.isRecentTaskButtonDisabled(componentName);
        } catch (Exception e) {
            Log.e("exception", e.getMessage());
            e.printStackTrace();
        }
        if (z2) {
            try {
                hwDevicePolicyManager.installPackage(componentName, str);
                z = true;
            } catch (Exception e2) {
                z = false;
            }
        } else if (!Build.DISPLAY.contains("A10-70F") || !Build.DISPLAY.contains("YiJiao")) {
            try {
                if (Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("P583") >= 0) {
                    Log.e("apkinstall", "apkinstall_samsung");
                    apkinstall_samsung(str, context);
                    z = true;
                } else {
                    Log.e("apkinstall", "apkinstall");
                    apkinstall(str, context);
                    z = true;
                }
            } catch (Exception e3) {
                z = false;
            }
        } else {
            miaMdmPolicyManager.silentInstall(str);
            Log.e("apkinstall", "lenovo:" + str);
            z = true;
        }
        return z;
    }

    private static boolean returnResult(int i) {
        boolean z = true;
        if (i != 0) {
            z = i == 1 ? false : false;
        }
        return z;
    }

    public static boolean startApp(String str, String str2) {
        boolean z;
        String str3 = "am start -n " + str + "/" + str2 + " \n";
        boolean z2 = null;
        Process process = null;
        try {
            try {
                Process exec = Runtime.getRuntime().exec(str3);
                process = exec;
                z2 = exec;
                boolean returnResult = returnResult(exec.waitFor());
                z = returnResult;
                if (exec != null) {
                    exec.destroy();
                    z = returnResult;
                }
            } catch (Exception e) {
                z2 = process;
                e.printStackTrace();
                z = false;
                if (process != null) {
                    process.destroy();
                    z = false;
                }
            }
            return z2;
        } finally {
            if (z2 != null) {
                z2.destroy();
            }
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x00ee -> B:38:0x0043). Please submit an issue!!! */
    public static boolean uninstall(String str, Context context) {
        boolean z;
        boolean z2 = false;
        ComponentName componentName = new ComponentName("com.launcher.activity", ApkController.class.getSimpleName());
        HwDevicePolicyManager hwDevicePolicyManager = new HwDevicePolicyManager(context);
        MiaMdmPolicyManager miaMdmPolicyManager = new MiaMdmPolicyManager(context);
        try {
            z2 = hwDevicePolicyManager.isRecentTaskButtonDisabled(componentName);
        } catch (Exception e) {
            Log.e("exception", e.getMessage());
            e.printStackTrace();
        }
        if (z2) {
            try {
                hwDevicePolicyManager.uninstallPackage(componentName, str, true);
                z = true;
            } catch (Exception e2) {
                z = false;
            }
        } else if (!Build.DISPLAY.contains("A10-70F") || !Build.DISPLAY.contains("YiJiao")) {
            try {
                if (Build.DISPLAY.indexOf("QC80A") >= 0 || Build.DISPLAY.indexOf("N5110ZB") >= 0 || Build.DISPLAY.indexOf(".T360Z") >= 0 || Build.DISPLAY.indexOf("P350") >= 0 || Build.DISPLAY.indexOf("P550") >= 0 || Build.DISPLAY.indexOf("P583") >= 0) {
                    apkuninstall_samsung(str, context);
                    z = true;
                } else {
                    apkUninstall(str, context);
                    z = true;
                }
            } catch (Exception e3) {
                z = false;
            }
        } else {
            miaMdmPolicyManager.silentUnInstall(str);
            Log.e("apkinstall", "lenovo:" + str);
            z = true;
        }
        return z;
    }
}
