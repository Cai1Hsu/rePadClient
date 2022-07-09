package com.edutech.daoxueben.until;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.os.StatFs;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/* loaded from: classes.jar:com/edutech/daoxueben/until/FileInOutHelper.class */
public final class FileInOutHelper {
    private static final int INDEX5 = 5;
    private static final int INDEX6 = 6;
    private static final int K = 1024;
    public static final String STR_SLASH_MNT = "/mnt";

    private FileInOutHelper() {
    }

    public static boolean addToFile(String str, String str2, byte[] bArr, int i) {
        String str3 = str;
        if (!str.endsWith("/")) {
            str3 = String.valueOf(str) + "/";
        }
        return addToFile(String.valueOf(str3) + str2, bArr, i);
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x003d, code lost:
        if (readSystemRemain() >= r7) goto L22;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean addToFile(String str, byte[] bArr, int i) {
        File file = new File(str);
        boolean z = false;
        if (file.exists()) {
            if (str.indexOf(Environment.getExternalStorageDirectory().getPath()) == -1) {
                z = false;
            } else if (readSDCardRemain() < i) {
                z = false;
            }
            try {
                DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(str, false));
                if (i == 0) {
                    dataOutputStream.write(bArr);
                } else {
                    dataOutputStream.write(bArr, 0, i);
                }
                dataOutputStream.flush();
                file.setLastModified(System.currentTimeMillis());
                dataOutputStream.close();
                z = true;
            } catch (IOException e) {
                e.printStackTrace();
                z = false;
            }
        }
        return z;
    }

    public static void copy(File file, File file2) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file2);
        BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
        byte[] bArr = new byte[5120];
        while (true) {
            int read = bufferedInputStream.read(bArr);
            if (read == -1) {
                bufferedOutputStream.flush();
                bufferedInputStream.close();
                bufferedOutputStream.close();
                fileOutputStream.close();
                fileInputStream.close();
                return;
            }
            bufferedOutputStream.write(bArr, 0, read);
        }
    }

    public static boolean createNewFile(File file) {
        boolean z;
        File parentFile;
        if (file == null) {
            z = false;
        } else {
            if (!file.exists() && (parentFile = file.getParentFile()) != null) {
                parentFile.mkdirs();
            }
            try {
                z = file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
                z = false;
            }
        }
        return z;
    }

    public static File createWithOverwriteExistFile(String str) throws IOException {
        File file;
        synchronized (FileInOutHelper.class) {
            try {
                file = new File(str);
                if (!file.exists()) {
                    File parentFile = file.getParentFile();
                    if (parentFile != null) {
                        parentFile.mkdirs();
                    }
                } else {
                    file.delete();
                }
                file.createNewFile();
            } catch (Throwable th) {
                throw th;
            }
        }
        return file;
    }

    public static File createWithoutOverwriteExistFile(String str) throws IOException {
        File file;
        synchronized (FileInOutHelper.class) {
            try {
                String substring = str.substring(str.lastIndexOf(File.separatorChar) + 1);
                String substring2 = str.substring(0, str.lastIndexOf(File.separatorChar) + 1);
                String substring3 = substring.substring(substring.lastIndexOf("."));
                String substring4 = substring.substring(0, substring.lastIndexOf("."));
                int i = 1;
                file = new File(str);
                while (file.exists()) {
                    file = new File(String.valueOf(substring2) + (String.valueOf(substring4) + "_" + i) + substring3);
                    i++;
                }
                File parentFile = file.getParentFile();
                if (parentFile != null) {
                    parentFile.mkdirs();
                }
                file.createNewFile();
            } catch (Throwable th) {
                throw th;
            }
        }
        return file;
    }

    public static void deleteDir(File file) throws IOException {
        synchronized (FileInOutHelper.class) {
            if (file != null) {
                try {
                    if (file.isDirectory()) {
                        File[] listFiles = file.listFiles();
                        int length = listFiles.length;
                        for (int i = 0; i < length; i++) {
                            if (listFiles[i].isDirectory()) {
                                deleteDir(listFiles[i]);
                            } else {
                                listFiles[i].delete();
                            }
                        }
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
            file.delete();
        }
    }

    public static int deleteFile(String str) {
        int i;
        File file = new File(str);
        if (file.exists()) {
            file.delete();
            i = 0;
        } else {
            i = -1;
        }
        return i;
    }

    public static int deleteFile(String str, String str2) {
        String str3 = str;
        if (!str.endsWith("/")) {
            str3 = String.valueOf(str) + "/";
        }
        return deleteFile(String.valueOf(str3) + str2);
    }

    public static boolean fileIsExists(String str) {
        return "mounted".equals(Environment.getExternalStorageState()) && new File(str).exists();
    }

    public static boolean fileIsExists(String str, String str2) {
        String str3 = str;
        if (!str.endsWith("/")) {
            str3 = String.valueOf(str) + "/";
        }
        return fileIsExists(String.valueOf(str3) + str2);
    }

    public static void installApk(Context context, String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        context.startActivity(intent);
    }

    public static byte[] loadFdisk(String str) {
        byte[] bArr;
        File file = new File(str);
        if (file.exists() || file.length() > 0 || !file.isDirectory()) {
            bArr = new byte[(int) file.length()];
            try {
                new FileInputStream(file).read(bArr);
            } catch (Exception e) {
            }
        } else {
            bArr = null;
        }
        return bArr;
    }

    public static byte[] loadFdisk(String str, String str2) {
        String str3 = str;
        if (!str.endsWith("/")) {
            str3 = String.valueOf(str) + "/";
        }
        return loadFdisk(str3);
    }

    public static long readSDCardRemain() {
        long j;
        if ("mounted".equals(Environment.getExternalStorageState())) {
            StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
            j = statFs.getAvailableBlocks() * statFs.getBlockSize();
        } else {
            j = -1;
        }
        return j;
    }

    public static long readSystemRemain() {
        StatFs statFs = new StatFs(Environment.getRootDirectory().getPath());
        return statFs.getAvailableBlocks() * statFs.getBlockSize();
    }

    public static boolean renameFile(String str, String str2, String str3) {
        if ("mounted".equals(Environment.getExternalStorageState())) {
            String str4 = str;
            if (!str.endsWith("/")) {
                str4 = String.valueOf(str) + "/";
            }
            File file = new File(String.valueOf(str4) + str2);
            File file2 = new File(String.valueOf(str4) + str3);
            if (!file.exists()) {
                return false;
            }
            file.renameTo(file2);
            return false;
        }
        return false;
    }

    public static File setupOrOpenFile(String str) {
        String substring = str.substring(str.lastIndexOf("/") + 1);
        String substring2 = str.substring(0, str.lastIndexOf("/") + 1);
        Log.i("FileInOutHelper", "name = " + substring + "path = " + substring2);
        return setupOrOpenFile(substring2, substring);
    }

    public static File setupOrOpenFile(String str, String str2) {
        File file = null;
        if ("mounted".equals(Environment.getExternalStorageState())) {
            File file2 = new File(str);
            if (!file2.exists()) {
                file2.mkdirs();
            }
            String str3 = str;
            if (!str.endsWith("/")) {
                str3 = String.valueOf(str) + "/";
            }
            File file3 = new File(String.valueOf(str3) + str2);
            file = file3;
            if (!file3.exists()) {
                try {
                    file3.createNewFile();
                    file = file3;
                } catch (IOException e) {
                    e.printStackTrace();
                    file = file3;
                }
            }
        }
        return file;
    }

    public static String toCaseSensitivePath(String str) {
        String str2;
        if (str == null) {
            str2 = null;
        } else {
            new String();
            File file = new File(str);
            str2 = str;
            if (file.exists()) {
                File parentFile = file.getParentFile();
                str2 = str;
                if (parentFile != null) {
                    String[] list = parentFile.list();
                    str2 = str;
                    if (list != null) {
                        int i = 0;
                        while (true) {
                            str2 = str;
                            if (i >= list.length) {
                                break;
                            } else if ((String.valueOf(file.getParent()) + "/" + list[i]).compareToIgnoreCase(str) == 0) {
                                str2 = String.valueOf(toCaseSensitivePath(file.getParent())) + "/" + list[i];
                                break;
                            } else {
                                i++;
                            }
                        }
                    }
                }
            }
        }
        return str2;
    }

    public static void unZip(InputStream inputStream, String str, boolean z) throws IOException {
        synchronized (FileInOutHelper.class) {
            try {
                ZipInputStream zipInputStream = new ZipInputStream(inputStream);
                new File(str).mkdirs();
                for (ZipEntry nextEntry = zipInputStream.getNextEntry(); nextEntry != null; nextEntry = zipInputStream.getNextEntry()) {
                    if (nextEntry.isDirectory()) {
                        String name = nextEntry.getName();
                        String substring = name.substring(0, name.length() - 1);
                        if (substring != null && "" != substring) {
                            new File(String.valueOf(str) + File.separator + substring).mkdir();
                        }
                    } else {
                        String str2 = String.valueOf(str) + File.separatorChar + nextEntry.getName();
                        File file = new File(str2);
                        if (z) {
                            writeFile(zipInputStream, createWithOverwriteExistFile(str2));
                        } else if (!file.exists()) {
                            file.createNewFile();
                            writeFile(zipInputStream, file);
                        }
                    }
                }
                zipInputStream.close();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static void unZip(String str, String str2, boolean z) throws IOException {
        synchronized (FileInOutHelper.class) {
            try {
                FileInputStream fileInputStream = new FileInputStream(new File(str));
                unZip(fileInputStream, str2, z);
                fileInputStream.close();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static void writeFile(InputStream inputStream, File file) throws IOException {
        synchronized (FileInOutHelper.class) {
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                byte[] bArr = new byte[6144];
                fileOutputStream.write(bArr, 0, inputStream.read(bArr));
                while (true) {
                    int read = inputStream.read(bArr);
                    if (read <= 0) {
                        fileOutputStream.close();
                    } else {
                        fileOutputStream.write(bArr, 0, read);
                        fileOutputStream.flush();
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
