package com.pgyersdk.c;

import android.content.Context;
import android.os.Environment;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/* loaded from: classes.jar:com/pgyersdk/c/e.class */
public class e {
    private static final String f = e.class.getName();
    private static e j = null;
    private String g = null;
    private String h = "pgySdk";
    private String i = "feedback";
    public final String a = ".jpg";
    public final String b = ".log";
    public final String c = ".txt";
    public final String d = ".zip";
    public final String e = "bug.properties";

    public static e a() {
        if (j == null) {
            j = new e();
        }
        return j;
    }

    public static List a(String str, String str2) {
        ArrayList arrayList = new ArrayList();
        File[] listFiles = new File(str).listFiles();
        if (listFiles != null) {
            for (File file : listFiles) {
                if (file.getName().endsWith(str2)) {
                    arrayList.add(file.getAbsolutePath());
                }
            }
        }
        return arrayList;
    }

    private void a(File file) {
        if (file == null || !file.exists()) {
            return;
        }
        if (file.isDirectory()) {
            for (File file2 : file.listFiles()) {
                a(file2);
            }
        }
        file.delete();
    }

    public static void b() {
        j = null;
    }

    private String c(Context context) {
        String str;
        int i = 0;
        if (this.g != null) {
            str = this.g;
        } else {
            this.g = String.valueOf(context.getFilesDir().getPath()) + File.separator + this.h;
            if ("mounted".equals(Environment.getExternalStorageState())) {
                String[] strArr = {Environment.getExternalStorageDirectory().getAbsolutePath(), "/sdcard", "/mnt/sdcard", "/mnt/sdcard2", "/mnt/ext_sdcard", "/storage/sdcard0", "/storage/sdcard1", "/mnt/sdcard/tencent"};
                while (true) {
                    if (i >= strArr.length) {
                        break;
                    }
                    String str2 = String.valueOf(strArr[i]) + File.separator + this.h;
                    File file = new File(str2);
                    file.mkdirs();
                    if (file.exists()) {
                        this.g = str2;
                        break;
                    }
                    i++;
                }
            } else {
                File file2 = new File(this.g);
                if (!file2.exists()) {
                    file2.mkdirs();
                }
            }
            str = this.g;
        }
        return str;
    }

    public final String a(Context context) {
        return String.valueOf(b(context)) + File.separator + (String.valueOf(new SimpleDateFormat("yyyyMMddHHmmss", Locale.US).format(new Date())) + ".jpg");
    }

    public final void a(String str) {
        File file = new File(str);
        if (!file.exists() || !file.isDirectory()) {
            return;
        }
        for (File file2 : file.listFiles()) {
            a(file2);
        }
    }

    public final String b(Context context) {
        String str = String.valueOf(c(context)) + File.separator + this.i;
        File file = new File(str);
        if (!file.exists()) {
            file.mkdirs();
        }
        return str;
    }
}
