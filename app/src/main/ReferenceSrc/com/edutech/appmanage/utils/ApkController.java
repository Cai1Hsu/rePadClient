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

/* loaded from: classes.dex */
public class ApkController {
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x00b8 -> B:32:0x0024). Please submit an issue!!! */
    public static boolean install(String apkPath, Context context) {
        boolean z = true;
        boolean boo = false;
        ComponentName cn = new ComponentName("com.launcher.activity", ApkController.class.getSimpleName());
        HwDevicePolicyManager mHwPDM = new HwDevicePolicyManager(context);
        MiaMdmPolicyManager mMiaMdmPolicyManager = new MiaMdmPolicyManager(context);
        try {
            boo = mHwPDM.isRecentTaskButtonDisabled(cn);
        } catch (Exception e) {
            Log.e("exception", e.getMessage());
            e.printStackTrace();
        }
        if (boo) {
            try {
                mHwPDM.installPackage(cn, apkPath);
                return true;
            } catch (Exception e2) {
                return false;
            }
        } else if (Build.DISPLAY.contains("A10-70F") && Build.DISPLAY.contains("YiJiao")) {
            mMiaMdmPolicyManager.silentInstall(apkPath);
            Log.e("apkinstall", "lenovo:" + apkPath);
            return true;
        } else {
            try {
                if (Build.DISPLAY.indexOf("QC80A") < 0 && Build.DISPLAY.indexOf("N5110ZB") < 0 && Build.DISPLAY.indexOf(".T360Z") < 0 && Build.DISPLAY.indexOf("P350") < 0 && Build.DISPLAY.indexOf("P550") < 0 && Build.DISPLAY.indexOf("P583") < 0) {
                    Log.e("apkinstall", "apkinstall");
                    apkinstall(apkPath, context);
                } else {
                    Log.e("apkinstall", "apkinstall_samsung");
                    apkinstall_samsung(apkPath, context);
                }
            } catch (Exception e3) {
                z = false;
            }
            return z;
        }
    }

    private static void apkinstall_samsung(String apkpath, Context context) {
        Intent intent = new Intent();
        intent.setAction("android.intent.action.SILENCE_INSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent.putExtra("uri", apkpath);
        } else {
            intent.setDataAndType(Uri.fromFile(new File(apkpath)), "application/vnd.android.package-archive");
        }
        context.sendBroadcast(intent);
    }

    private static void apkinstall(String apkpath, Context context) {
        try {
            if (!InstallApkUtil.SlientInstall(apkpath)) {
                if (!InstallApkUtil.SuSlientInstall(apkpath)) {
                    apkIntentInstall(apkpath, context);
                } else {
                    Log.d("sysService", String.valueOf(apkpath) + ":SuSlientInstall安装成功！");
                }
            } else {
                Log.d("sysService", String.valueOf(apkpath) + ":SlientInstall安装成功！");
            }
        } catch (Exception e) {
            try {
                if (!InstallApkUtil.SuSlientInstall(apkpath)) {
                    apkIntentInstall(apkpath, context);
                } else {
                    Log.d("sysService", String.valueOf(apkpath) + ":SuSlientInstall安装成功！");
                }
            } catch (Exception e2) {
                apkIntentInstall(apkpath, context);
                Log.d("sysService", String.valueOf(apkpath) + ":InstallApk安装成功！");
            }
        }
    }

    private static void apkIntentInstall(String apkpath, Context context) {
        Intent installIntent = new Intent("android.intent.action.VIEW");
        installIntent.setDataAndType(Uri.fromFile(new File(apkpath)), "application/vnd.android.package-archive");
        installIntent.setFlags(268435456);
        context.startActivity(installIntent);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x00b0 -> B:33:0x0025). Please submit an issue!!! */
    public static boolean uninstall(String packageName, Context context) {
        boolean z = true;
        boolean boo = false;
        ComponentName cn = new ComponentName("com.launcher.activity", ApkController.class.getSimpleName());
        HwDevicePolicyManager mHwPDM = new HwDevicePolicyManager(context);
        MiaMdmPolicyManager mMiaMdmPolicyManager = new MiaMdmPolicyManager(context);
        try {
            boo = mHwPDM.isRecentTaskButtonDisabled(cn);
        } catch (Exception e) {
            Log.e("exception", e.getMessage());
            e.printStackTrace();
        }
        if (boo) {
            try {
                mHwPDM.uninstallPackage(cn, packageName, true);
                return true;
            } catch (Exception e2) {
                return false;
            }
        } else if (Build.DISPLAY.contains("A10-70F") && Build.DISPLAY.contains("YiJiao")) {
            mMiaMdmPolicyManager.silentUnInstall(packageName);
            Log.e("apkinstall", "lenovo:" + packageName);
            return true;
        } else {
            try {
                if (Build.DISPLAY.indexOf("QC80A") < 0 && Build.DISPLAY.indexOf("N5110ZB") < 0 && Build.DISPLAY.indexOf(".T360Z") < 0 && Build.DISPLAY.indexOf("P350") < 0 && Build.DISPLAY.indexOf("P550") < 0 && Build.DISPLAY.indexOf("P583") < 0) {
                    apkUninstall(packageName, context);
                } else {
                    apkuninstall_samsung(packageName, context);
                }
            } catch (Exception e3) {
                z = false;
            }
            return z;
        }
    }

    private static void apkuninstall_samsung(String packageName, Context context) {
        Intent intent1 = new Intent();
        intent1.setAction("android.intent.action.SILENCE_UNINSTALL");
        if (Build.DISPLAY.contains("M1016Pro")) {
            intent1.putExtra("pgk", packageName);
        } else {
            intent1.setData(Uri.parse("package://" + packageName));
        }
        context.sendBroadcast(intent1);
    }

    private static void apkUninstall(String packageName, Context context) {
        try {
            if (!InstallApkUtil.SlientUninstall(packageName)) {
                if (!InstallApkUtil.SuSlientUninstall(packageName)) {
                    apkIntentUninstall(packageName, context);
                } else {
                    Log.d("sysService", String.valueOf(packageName) + ":SuSlientInstall卸载成功！");
                }
            } else {
                Log.d("sysService", String.valueOf(packageName) + ":SlientInstall卸载成功！");
            }
        } catch (Exception e) {
            try {
                if (!InstallApkUtil.SuSlientUninstall(packageName)) {
                    apkIntentUninstall(packageName, context);
                } else {
                    Log.d("sysService", String.valueOf(packageName) + ":SuSlientInstall卸载成功！");
                }
            } catch (Exception e2) {
                apkIntentUninstall(packageName, context);
                Log.d("sysService", String.valueOf(packageName) + ":InstallApk卸载成功！");
            }
        }
    }

    private static void apkIntentUninstall(String packageName, Context context) {
        Uri packageURI = Uri.parse("package:" + packageName);
        Intent uninstallIntent = new Intent("android.intent.action.DELETE", packageURI);
        uninstallIntent.addFlags(268435456);
        context.startActivity(uninstallIntent);
    }

    private static boolean hasRootPerssion() {
        Throwable th;
        Exception e;
        PrintWriter PrintWriter;
        Process process = null;
        try {
            try {
                process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                PrintWriter = new PrintWriter(process.getOutputStream());
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e2) {
            e = e2;
        }
        try {
            PrintWriter.flush();
            PrintWriter.close();
            int value = process.waitFor();
            boolean returnResult = returnResult(value);
            if (process != null) {
                process.destroy();
                return returnResult;
            }
            return returnResult;
        } catch (Exception e3) {
            e = e3;
            e.printStackTrace();
            if (process != null) {
                process.destroy();
            }
            return false;
        } catch (Throwable th3) {
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
    }

    private static boolean clientInstall(String apkPath) {
        Throwable th;
        Exception e;
        PrintWriter PrintWriter;
        Process process = null;
        try {
            try {
                process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                PrintWriter = new PrintWriter(process.getOutputStream());
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Exception e2) {
            e = e2;
        }
        try {
            PrintWriter.println("chmod 777 " + apkPath);
            PrintWriter.println("export LD_LIBRARY_PATH=/vendor/lib:/system/lib");
            PrintWriter.println("pm install -r " + apkPath);
            PrintWriter.flush();
            PrintWriter.close();
            int value = process.waitFor();
            boolean returnResult = returnResult(value);
            if (process != null) {
                process.destroy();
            }
            return returnResult;
        } catch (Exception e3) {
            e = e3;
            e.printStackTrace();
            if (process != null) {
                process.destroy();
            }
            return false;
        } catch (Throwable th3) {
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
    }

    private static boolean clientUninstall(String packageName) {
        Throwable th;
        Exception e;
        PrintWriter PrintWriter;
        Process process = null;
        try {
            try {
                process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
                PrintWriter = new PrintWriter(process.getOutputStream());
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            PrintWriter.println("LD_LIBRARY_PATH=/vendor/lib:/system/lib ");
            PrintWriter.println("pm uninstall " + packageName);
            PrintWriter.flush();
            PrintWriter.close();
            int value = process.waitFor();
            boolean returnResult = returnResult(value);
            if (process != null) {
                process.destroy();
            }
            return returnResult;
        } catch (Exception e3) {
            e = e3;
            e.printStackTrace();
            if (process != null) {
                process.destroy();
            }
            return false;
        } catch (Throwable th3) {
            th = th3;
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
    }

    public static boolean startApp(String packageName, String activityName) {
        boolean isSuccess = false;
        String cmd = "am start -n " + packageName + "/" + activityName + " \n";
        Process process = null;
        try {
            try {
                process = Runtime.getRuntime().exec(cmd);
                int value = process.waitFor();
                isSuccess = returnResult(value);
            } catch (Exception e) {
                e.printStackTrace();
                if (process != null) {
                    process.destroy();
                }
            }
            return isSuccess;
        } finally {
            if (process != null) {
                process.destroy();
            }
        }
    }

    private static boolean returnResult(int value) {
        if (value == 0) {
            return true;
        }
        return value == 1 ? false : false;
    }
}
