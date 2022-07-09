package com.edutech.idauthentication;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

/* loaded from: classes.jar:com/edutech/idauthentication/FileUtils.class */
public class FileUtils {
    private static final int INDEX5 = 5;
    private static final int INDEX6 = 6;
    private static final int K = 1024;
    public static final String STR_SLASH_MNT = "/mnt";
    private static String filepathMobileStudyClient = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau.xml";
    private static String filepathMobileStudyClient_NEW = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau_new.xml";
    private static File idfileMobileStudyClient = new File(filepathMobileStudyClient);
    public static String seed = "Edutech@2013";

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
        synchronized (FileUtils.class) {
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
        synchronized (FileUtils.class) {
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

    public static void delete(String str) {
        File[] listFiles;
        File file = new File(str);
        if (file.isDirectory() && (listFiles = file.listFiles()) != null) {
            for (File file2 : listFiles) {
                if (!file2.isDirectory() || !file2.getName().equals("HTML")) {
                    deleteFiles(file2.getAbsolutePath());
                }
            }
        }
    }

    public static void deleteCameraFiles() {
        File[] listFiles;
        File[] listFiles2;
        Log.e(HotDeploymentTool.ACTION_DELETE, "deleteCameraFiles");
        String file = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).toString();
        if (file == null || file.equals("")) {
            return;
        }
        File file2 = new File(String.valueOf(file) + "/Camera/");
        File file3 = new File(String.valueOf(file) + "/Screenshots/");
        if (file2.exists() && file2.isDirectory()) {
            for (File file4 : file2.listFiles()) {
                if (file4.exists()) {
                    file4.delete();
                }
            }
        }
        if (!file3.exists() || !file3.isDirectory()) {
            return;
        }
        for (File file5 : file3.listFiles()) {
            if (file5.exists()) {
                file5.delete();
            }
        }
    }

    public static void deleteDir(File file) throws IOException {
        synchronized (FileUtils.class) {
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

    public static void deleteFiles(String str) {
        File file = new File(str);
        if (file.isDirectory()) {
            for (File file2 : file.listFiles()) {
                String absolutePath = file2.getAbsolutePath();
                Log.e("---------->dd", absolutePath);
                deleteFiles(absolutePath);
            }
        } else if (file.exists()) {
            file.delete();
            Log.e("-------->delete", str);
        }
        if (file.exists()) {
            file.delete();
        }
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

    public static long getSDAvailableSize() {
        StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
        return (long) ((((statFs.getBlockSize() * statFs.getAvailableBlocks()) * 1.0d) / 1024.0d) / 1024.0d);
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

    public static final List<String> readIDFile() {
        ArrayList arrayList = new ArrayList();
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        int i = Build.VERSION.SDK_INT;
        boolean z = false;
        File file = new File(filepathMobileStudyClient_NEW);
        if (file.exists()) {
            z = true;
        }
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = z ? new FileInputStream(file) : new FileInputStream(idfileMobileStudyClient);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        if (fileInputStream != null) {
            String str7 = null;
            String str8 = null;
            String str9 = null;
            String str10 = null;
            String str11 = null;
            String str12 = null;
            String str13 = null;
            String str14 = null;
            String str15 = null;
            String str16 = null;
            String str17 = null;
            String str18 = null;
            try {
                XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
                newPullParser.setInput(fileInputStream, "UTF-8");
                int eventType = newPullParser.getEventType();
                while (eventType != 1) {
                    str7 = str5;
                    str8 = str;
                    str9 = str2;
                    str10 = str3;
                    str11 = str4;
                    str12 = str6;
                    str13 = str5;
                    str14 = str;
                    str15 = str2;
                    str16 = str3;
                    str17 = str4;
                    str18 = str6;
                    String name = newPullParser.getName();
                    String str19 = str5;
                    String str20 = str;
                    String str21 = str2;
                    String str22 = str3;
                    String str23 = str4;
                    String str24 = str6;
                    switch (eventType) {
                        case 0:
                        case 1:
                        case 3:
                            break;
                        case 2:
                            String str25 = str;
                            if ("a1".equals(name)) {
                                String str26 = str5;
                                str25 = newPullParser.nextText();
                            }
                            String str27 = str2;
                            if ("b2".equals(name)) {
                                String str28 = str5;
                                str27 = newPullParser.nextText();
                            }
                            String str29 = str3;
                            if ("c3".equals(name)) {
                                String str30 = str5;
                                str29 = newPullParser.nextText();
                            }
                            String str31 = str4;
                            if ("d4".equals(name)) {
                                String str32 = str5;
                                str31 = newPullParser.nextText();
                            }
                            String str33 = str5;
                            if ("e5".equals(name)) {
                                String str34 = str5;
                                str33 = newPullParser.nextText();
                            }
                            str19 = str33;
                            str20 = str25;
                            str21 = str27;
                            str22 = str29;
                            str23 = str31;
                            str24 = str6;
                            if ("f6".equals(name)) {
                                String str35 = str33;
                                str24 = newPullParser.nextText();
                                str19 = str33;
                                str20 = str25;
                                str21 = str27;
                                str22 = str29;
                                str23 = str31;
                                break;
                            }
                            break;
                        default:
                            str24 = str6;
                            str23 = str4;
                            str22 = str3;
                            str21 = str2;
                            str20 = str;
                            str19 = str5;
                            break;
                    }
                    eventType = newPullParser.next();
                    str5 = str19;
                    str = str20;
                    str2 = str21;
                    str3 = str22;
                    str4 = str23;
                    str6 = str24;
                }
            } catch (IOException e2) {
                e2.printStackTrace();
                str5 = str13;
                str = str14;
                str2 = str15;
                str3 = str16;
                str4 = str17;
                str6 = str18;
            } catch (XmlPullParserException e3) {
                e3.printStackTrace();
                str5 = str7;
                str = str8;
                str2 = str9;
                str3 = str10;
                str4 = str11;
                str6 = str12;
            }
            try {
                fileInputStream.close();
            } catch (IOException e4) {
                e4.printStackTrace();
            }
            arrayList.add("");
            arrayList.add("");
            arrayList.add("");
            arrayList.add("");
            arrayList.add("");
            arrayList.add("");
            try {
                if (str != null) {
                    if (z) {
                        arrayList.set(0, BZip2Utils.Base64DecodeToString(str));
                    } else {
                        arrayList.set(0, AESUtils2.decrypt(seed, str));
                    }
                }
                if (str2 != null) {
                    if (z) {
                        arrayList.set(1, BZip2Utils.Base64DecodeToString(str2));
                    } else {
                        arrayList.set(1, AESUtils2.decrypt(seed, str2));
                    }
                }
                if (str3 != null) {
                    if (z) {
                        arrayList.set(2, BZip2Utils.Base64DecodeToString(str3));
                    } else {
                        arrayList.set(2, AESUtils2.decrypt(seed, str3));
                    }
                }
                if (str4 != null) {
                    if (z) {
                        arrayList.set(3, BZip2Utils.Base64DecodeToString(str4));
                    } else {
                        arrayList.set(3, AESUtils2.decrypt(seed, str4));
                    }
                }
                if (str5 != null) {
                    if (z) {
                        arrayList.set(4, BZip2Utils.Base64DecodeToString(str5));
                    } else {
                        arrayList.set(4, AESUtils2.decrypt(seed, str5));
                    }
                }
                if (str6 != null) {
                    if (z) {
                        arrayList.set(5, BZip2Utils.Base64DecodeToString(str6));
                    } else {
                        arrayList.set(5, AESUtils2.decrypt(seed, str6));
                    }
                }
            } catch (Exception e5) {
                e5.printStackTrace();
            }
        }
        return arrayList;
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
        return setupOrOpenFile(str.substring(0, str.lastIndexOf("/") + 1), str.substring(str.lastIndexOf("/") + 1));
    }

    public static File setupOrOpenFile(String str, String str2) {
        File file = null;
        String str3 = "";
        try {
            str3 = Environment.getExternalStorageState();
        } catch (NullPointerException e) {
        } catch (Exception e2) {
        }
        if ("mounted".equals(str3)) {
            File file2 = new File(str);
            if (!file2.exists()) {
                file2.mkdirs();
            }
            String str4 = str;
            if (!str.endsWith("/")) {
                str4 = String.valueOf(str) + "/";
            }
            File file3 = new File(String.valueOf(str4) + str2);
            file = file3;
            if (!file3.exists()) {
                try {
                    file3.createNewFile();
                    file = file3;
                } catch (IOException e3) {
                    e3.printStackTrace();
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
        synchronized (FileUtils.class) {
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
        synchronized (FileUtils.class) {
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
        synchronized (FileUtils.class) {
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
