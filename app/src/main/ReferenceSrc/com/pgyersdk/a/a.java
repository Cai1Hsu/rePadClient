package com.pgyersdk.a;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.StatFs;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.util.Log;
import com.edutech.appmanage.utils.ShellUtils;
import java.io.File;
import java.security.MessageDigest;
import java.util.UUID;

/* loaded from: classes.jar:com/pgyersdk/a/a.class */
public final class a {
    public static String a = null;
    public static String b = null;
    public static String c = null;
    public static String d = null;
    public static String e = null;
    public static String f = null;
    public static String g = null;
    public static String h = null;
    public static String i = null;
    public static String j = null;
    public static String k = "";
    private static int l = -1;

    private static int a(Context context, PackageManager packageManager) {
        int i2;
        try {
            Bundle bundle = packageManager.getApplicationInfo(context.getPackageName(), 128).metaData;
            i2 = 0;
            if (bundle != null) {
                i2 = bundle.getInt("buildNumber", 0);
            }
        } catch (Exception e2) {
            Log.e("PgyerSDK", "Exception thrown when accessing the application info:");
            e2.printStackTrace();
            i2 = 0;
        }
        return i2;
    }

    private static String a(byte[] bArr) {
        char[] charArray = "0123456789ABCDEF".toCharArray();
        char[] cArr = new char[bArr.length * 2];
        for (int i2 = 0; i2 < bArr.length; i2++) {
            int i3 = bArr[i2] & 255;
            cArr[i2 * 2] = charArray[i3 >>> 4];
            cArr[(i2 * 2) + 1] = charArray[i3 & 15];
        }
        return new String(cArr).replaceAll("(\\w{8})(\\w{4})(\\w{4})(\\w{4})(\\w{12})", "$1-$2-$3-$4-$5");
    }

    /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(r0v30 int)] */
    /* JADX DEBUG: TODO: convert one arg to string using `String.valueOf()`, args: [(wrap: int : 0x004a: IGET  (r1v5 int A[REMOVE]) = (r0v19 android.content.pm.PackageInfo) android.content.pm.PackageInfo.versionCode int)] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:32:0x01b9 -> B:46:0x015a). Please submit an issue!!! */
    public static void a(Context context) {
        DisplayMetrics displayMetrics;
        e = Build.VERSION.RELEASE;
        f = Build.MODEL;
        g = Build.MANUFACTURER;
        if (context != null) {
            try {
                File filesDir = context.getFilesDir();
                if (filesDir != null) {
                    a = filesDir.getAbsolutePath();
                }
            } catch (Exception e2) {
                Log.e("PgyerSDK", "Exception thrown when accessing the files dir:");
                e2.printStackTrace();
            }
        }
        if (context != null) {
            try {
                PackageManager packageManager = context.getPackageManager();
                PackageInfo packageInfo = packageManager.getPackageInfo(context.getPackageName(), 0);
                c = packageInfo.packageName;
                b = new StringBuilder().append(packageInfo.versionCode).toString();
                d = packageInfo.versionName;
                int a2 = a(context, packageManager);
                if (a2 != 0 && a2 > packageInfo.versionCode) {
                    b = new StringBuilder().append(a2).toString();
                }
            } catch (Exception e3) {
                Log.e("PgyerSDK", "Exception thrown when accessing the package info:");
                e3.printStackTrace();
            }
        }
        String string = Settings.Secure.getString(context.getContentResolver(), "android_id");
        if (c != null && string != null) {
            String str = String.valueOf(c) + ":" + string + ":" + c();
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
                byte[] bytes = str.getBytes("UTF-8");
                messageDigest.update(bytes, 0, bytes.length);
                h = a(messageDigest.digest());
            } catch (Throwable th) {
            }
        }
        if (context != null) {
            try {
                try {
                    TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService("phone");
                    String str2 = telephonyManager.getDeviceId();
                    i = new UUID((Settings.Secure.getString(context.getContentResolver(), "android_id")).hashCode(), (telephonyManager.getSimSerialNumber()).hashCode() | (str2.hashCode() << 32)).toString();
                } catch (Exception e4) {
                    i = "getting faild";
                }
                try {
                    ((Activity) context).getWindowManager().getDefaultDisplay().getMetrics(new DisplayMetrics());
                    j = String.valueOf(displayMetrics.widthPixels) + " * " + displayMetrics.heightPixels;
                } catch (Exception e5) {
                    j = "resolution getting faild";
                }
            } catch (Exception e6) {
                Log.e("PgyerSDK", "Exception thrown then accessing the device info:");
                e6.printStackTrace();
            }
        }
    }

    public static boolean a() {
        boolean z = true;
        if (l != 1) {
            if (l == 0) {
                z = false;
            } else {
                String[] strArr = {"/system/bin/", "/system/xbin/", "/system/sbin/", "/sbin/", "/vendor/bin/"};
                for (int i2 = 0; i2 < strArr.length; i2++) {
                    try {
                        if (new File(String.valueOf(strArr[i2]) + ShellUtils.COMMAND_SU).exists()) {
                            l = 1;
                            break;
                        }
                    } catch (Exception e2) {
                    }
                }
                l = 0;
                z = false;
            }
        }
        return z;
    }

    public static int b() {
        int i2;
        if (Environment.getExternalStorageState().equals("mounted")) {
            StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
            i2 = (int) (((statFs.getAvailableBlocks() * statFs.getBlockSize()) / 1024) / 1024);
        } else {
            i2 = 1;
        }
        return i2;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:9:0x0074 -> B:5:0x005b). Please submit an issue!!! */
    private static String c() {
        String str = "HA" + (Build.BOARD.length() % 10) + (Build.BRAND.length() % 10) + (Build.CPU_ABI.length() % 10) + (Build.PRODUCT.length() % 10);
        String str2 = "";
        if (Build.VERSION.SDK_INT >= 9) {
            try {
                str2 = Build.class.getField("SERIAL").get(null).toString();
            } catch (Throwable th) {
                str2 = "";
            }
        }
        return String.valueOf(str) + ":" + str2;
    }
}
