package com.edutech.utils;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import com.edutech.appmanage.utils.ShellUtils;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class InstallApkUtil {
    public static void InstallApk(Context context, String apkPath, String selfpackageName) {
        File apkFile = new File(apkPath);
        boolean isAll = getUninatllApkInfo(context, apkPath);
        if (apkFile.length() > 0 && isAll) {
            try {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setDataAndType(Uri.fromFile(new File(apkPath)), "application/vnd.android.package-archive");
                context.startActivity(intent);
                unInstallApk(context, apkPath, selfpackageName);
            } catch (Exception e) {
            }
        }
    }

    public static boolean getUninatllApkInfo(Context context, String filePath) {
        try {
            PackageManager pm = context.getPackageManager();
            PackageInfo info = pm.getPackageArchiveInfo(filePath, 1);
            if (info == null) {
                return false;
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static void unInstallApk(Context context, String apkPath, String selfpackageName) {
        PackageManager pm = context.getPackageManager();
        PackageInfo packageInfo = pm.getPackageArchiveInfo(apkPath, 1);
        ApplicationInfo applicationInfo = packageInfo.applicationInfo;
        String packageName = packageInfo.packageName;
        if (!packageName.equals(selfpackageName)) {
            ArrayList<HashMap<String, String>> localAppInfoList = new ArrayList<>();
            Iterator<HashMap<String, String>> it = SystemInfoHelper.getSystemInfo(localAppInfoList, context).iterator();
            while (it.hasNext()) {
                HashMap<String, String> templocalAppInfo = it.next();
                if (templocalAppInfo.get("packagename") != null && templocalAppInfo.get("packagename").equals(packageName)) {
                    Uri packageURI = Uri.parse("package:" + packageName);
                    Intent uninstallIntent = new Intent("android.intent.action.DELETE", packageURI);
                    uninstallIntent.addFlags(268435456);
                    context.startActivity(uninstallIntent);
                    return;
                }
            }
        }
    }

    public static boolean SlientInstall(String apkPath) throws IOException {
        Runtime runtime = Runtime.getRuntime();
        Process proc = runtime.exec("pm install -r " + apkPath);
        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String line = bufferedreader.readLine();
            if (line != null) {
                sb.append(line);
            } else {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            }
        }
        if (proc.waitFor() != 0) {
            System.err.println("exit value = " + proc.exitValue());
        }
        String result = sb.toString();
        if (result.equals("Success")) {
            return true;
        }
        return false;
    }

    public static boolean SuSlientInstall(String apkPath) throws IOException {
        Process process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
        OutputStream out = process.getOutputStream();
        out.write(("pm install -r " + apkPath + "\n").getBytes());
        if (out != null) {
            out.flush();
            out.close();
        }
        InputStream in = process.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(in);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String line = bufferedreader.readLine();
            if (line != null) {
                sb.append(line);
            } else {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            }
        }
        if (process.waitFor() != 0) {
            System.err.println("exit value = " + process.exitValue());
        }
        String result = sb.toString();
        if (result.equals("Success")) {
            return true;
        }
        return false;
    }

    public static boolean SlientUninstall(String packageName) throws IOException {
        Runtime runtime = Runtime.getRuntime();
        Process proc = runtime.exec("pm uninstall " + packageName);
        InputStream inputstream = proc.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String line = bufferedreader.readLine();
            if (line != null) {
                sb.append(line);
            } else {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            }
        }
        if (proc.waitFor() != 0) {
            System.err.println("exit value = " + proc.exitValue());
        }
        String result = sb.toString();
        if (result.equals("Success")) {
            return true;
        }
        return false;
    }

    public static boolean SuSlientUninstall(String packageName) throws IOException {
        Process process = Runtime.getRuntime().exec(ShellUtils.COMMAND_SU);
        OutputStream out = process.getOutputStream();
        out.write(("pm uninstall " + packageName + "\n").getBytes());
        if (out != null) {
            out.flush();
            out.close();
        }
        InputStream in = process.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(in);
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        StringBuilder sb = new StringBuilder("");
        while (true) {
            String line = bufferedreader.readLine();
            if (line != null) {
                sb.append(line);
            } else {
                try {
                    break;
                } catch (InterruptedException e) {
                    System.err.println(e);
                }
            }
        }
        if (process.waitFor() != 0) {
            System.err.println("exit value = " + process.exitValue());
        }
        String result = sb.toString();
        if (result.equals("Success")) {
            return true;
        }
        return false;
    }
}
