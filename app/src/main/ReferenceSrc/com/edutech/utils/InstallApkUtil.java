package com.edutech.utils;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.net.Uri;
import com.edutech.appmanage.utils.ShellUtils;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes.jar:com/edutech/utils/InstallApkUtil.class */
public class InstallApkUtil {
    public static void InstallApk(Context context, String str, String str2) {
        File file = new File(str);
        boolean uninatllApkInfo = getUninatllApkInfo(context, str);
        if (file.length() <= 0 || !uninatllApkInfo) {
            return;
        }
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
            context.startActivity(intent);
            unInstallApk(context, str, str2);
        } catch (Exception e) {
        }
    }

    public static boolean SlientInstall(String str) throws IOException {
        Process exec = Runtime.getRuntime().exec("pm install -r " + str);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            } else {
                sb.append(readLine);
            }
        }
        if (exec.waitFor() != 0) {
            System.err.println("exit value = " + exec.exitValue());
        }
        return sb.toString().equals("Success");
    }

    public static boolean SlientUninstall(String str) throws IOException {
        Process exec = Runtime.getRuntime().exec("pm uninstall " + str);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            } else {
                sb.append(readLine);
            }
        }
        if (exec.waitFor() != 0) {
            System.err.println("exit value = " + exec.exitValue());
        }
        return sb.toString().equals("Success");
    }

    public static boolean SuSlientInstall(String str) throws IOException {
        Process exec = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
        OutputStream outputStream = exec.getOutputStream();
        outputStream.write(("pm install -r " + str + "\n").getBytes());
        if (outputStream != null) {
            outputStream.flush();
            outputStream.close();
        }
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            } else {
                sb.append(readLine);
            }
        }
        if (exec.waitFor() != 0) {
            System.err.println("exit value = " + exec.exitValue());
        }
        return sb.toString().equals("Success");
    }

    public static boolean SuSlientUninstall(String str) throws IOException {
        Process exec = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
        OutputStream outputStream = exec.getOutputStream();
        outputStream.write(("pm uninstall " + str + "\n").getBytes());
        if (outputStream != null) {
            outputStream.flush();
            outputStream.close();
        }
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            } else {
                sb.append(readLine);
            }
        }
        if (exec.waitFor() != 0) {
            System.err.println("exit value = " + exec.exitValue());
        }
        return sb.toString().equals("Success");
    }

    public static boolean getUninatllApkInfo(Context context, String str) {
        boolean z = false;
        try {
            if (context.getPackageManager().getPackageArchiveInfo(str, 1) != null) {
                z = true;
            }
        } catch (Exception e) {
            z = false;
        }
        return z;
    }

    public static void unInstallApk(Context context, String str, String str2) {
        PackageInfo packageArchiveInfo = context.getPackageManager().getPackageArchiveInfo(str, 1);
        ApplicationInfo applicationInfo = packageArchiveInfo.applicationInfo;
        String str3 = packageArchiveInfo.packageName;
        if (!str3.equals(str2)) {
            Iterator<HashMap<String, String>> it = SystemInfoHelper.getSystemInfo(new ArrayList(), context).iterator();
            while (it.hasNext()) {
                HashMap<String, String> next = it.next();
                if (next.get("packagename") != null && next.get("packagename").equals(str3)) {
                    Intent intent = new Intent("android.intent.action.DELETE", Uri.parse("package:" + str3));
                    intent.addFlags(268435456);
                    context.startActivity(intent);
                    return;
                }
            }
        }
    }
}
