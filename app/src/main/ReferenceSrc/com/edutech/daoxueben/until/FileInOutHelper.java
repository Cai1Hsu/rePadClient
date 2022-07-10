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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class FileInOutHelper {
    private static final int INDEX5 = 5;
    private static final int INDEX6 = 6;
    private static final int K = 1024;
    public static final String STR_SLASH_MNT = "/mnt";

    private FileInOutHelper() {
    }

    public static File setupOrOpenFile(String aPath) {
        String name = aPath.substring(aPath.lastIndexOf("/") + 1);
        String path = aPath.substring(0, aPath.lastIndexOf("/") + 1);
        Log.i("FileInOutHelper", "name = " + name + "path = " + path);
        return setupOrOpenFile(path, name);
    }

    public static File setupOrOpenFile(String aPath, String aFileName) {
        File file = null;
        if ("mounted".equals(Environment.getExternalStorageState())) {
            File file2 = new File(aPath);
            if (!file2.exists()) {
                file2.mkdirs();
            }
            if (!aPath.endsWith("/")) {
                aPath = String.valueOf(aPath) + "/";
            }
            file = new File(String.valueOf(aPath) + aFileName);
            if (!file.exists()) {
                try {
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return file;
    }

    public static boolean renameFile(String aPath, String aCurrentName, String aReName) {
        if ("mounted".equals(Environment.getExternalStorageState())) {
            if (!aPath.endsWith("/")) {
                aPath = String.valueOf(aPath) + "/";
            }
            File currentFile = new File(String.valueOf(aPath) + aCurrentName);
            File reFile = new File(String.valueOf(aPath) + aReName);
            if (currentFile.exists()) {
                currentFile.renameTo(reFile);
                return false;
            }
            return false;
        }
        return false;
    }

    public static byte[] loadFdisk(String aPath, String aFileName) {
        if (!aPath.endsWith("/")) {
            aPath = String.valueOf(aPath) + "/";
        }
        return loadFdisk(aPath);
    }

    public static byte[] loadFdisk(String aPath) {
        File file = new File(aPath);
        if (!file.exists() && file.length() <= 0 && file.isDirectory()) {
            return null;
        }
        byte[] temp = new byte[(int) file.length()];
        try {
            FileInputStream fis = new FileInputStream(file);
            fis.read(temp);
            return temp;
        } catch (Exception e) {
            return temp;
        }
    }

    public static boolean fileIsExists(String aPath, String aFileName) {
        if (!aPath.endsWith("/")) {
            aPath = String.valueOf(aPath) + "/";
        }
        return fileIsExists(String.valueOf(aPath) + aFileName);
    }

    public static boolean fileIsExists(String aPath) {
        if ("mounted".equals(Environment.getExternalStorageState())) {
            File file = new File(aPath);
            if (file.exists()) {
                return true;
            }
        }
        return false;
    }

    public static boolean addToFile(String aPath, String aFileName, byte[] aData, int aLength) {
        if (!aPath.endsWith("/")) {
            aPath = String.valueOf(aPath) + "/";
        }
        return addToFile(String.valueOf(aPath) + aFileName, aData, aLength);
    }

    public static boolean addToFile(String aPath, byte[] aData, int aLength) {
        boolean z = false;
        File file = new File(aPath);
        if (file.exists()) {
            if (aPath.indexOf(Environment.getExternalStorageDirectory().getPath()) != -1) {
                if (readSDCardRemain() < aLength) {
                    return false;
                }
            } else if (readSystemRemain() < aLength) {
                return false;
            }
            try {
                DataOutputStream dos = new DataOutputStream(new FileOutputStream(aPath, false));
                if (aLength == 0) {
                    dos.write(aData);
                } else {
                    dos.write(aData, 0, aLength);
                }
                dos.flush();
                file.setLastModified(System.currentTimeMillis());
                dos.close();
                z = true;
                return true;
            } catch (IOException e) {
                e.printStackTrace();
                return z;
            }
        }
        return false;
    }

    public static int deleteFile(String aPath, String aFileName) {
        if (!aPath.endsWith("/")) {
            aPath = String.valueOf(aPath) + "/";
        }
        return deleteFile(String.valueOf(aPath) + aFileName);
    }

    public static int deleteFile(String aPath) {
        File file = new File(aPath);
        if (file.exists()) {
            file.delete();
            return 0;
        }
        return -1;
    }

    public static long readSDCardRemain() {
        if ("mounted".equals(Environment.getExternalStorageState())) {
            File sdcardDir = Environment.getExternalStorageDirectory();
            StatFs sf = new StatFs(sdcardDir.getPath());
            long blockSize = sf.getBlockSize();
            long availCount = sf.getAvailableBlocks();
            return availCount * blockSize;
        }
        return -1L;
    }

    public static long readSystemRemain() {
        File root = Environment.getRootDirectory();
        StatFs sf = new StatFs(root.getPath());
        long blockSize = sf.getBlockSize();
        long availCount = sf.getAvailableBlocks();
        return availCount * blockSize;
    }

    public static void copy(File aDesFile, File aSrcFile) throws IOException {
        FileInputStream input = new FileInputStream(aSrcFile);
        BufferedInputStream inBuff = new BufferedInputStream(input);
        FileOutputStream output = new FileOutputStream(aDesFile);
        BufferedOutputStream outBuff = new BufferedOutputStream(output);
        byte[] b = new byte[5120];
        while (true) {
            int len = inBuff.read(b);
            if (len != -1) {
                outBuff.write(b, 0, len);
            } else {
                outBuff.flush();
                inBuff.close();
                outBuff.close();
                output.close();
                input.close();
                return;
            }
        }
    }

    public static synchronized File createWithoutOverwriteExistFile(String aPath) throws IOException {
        File file;
        synchronized (FileInOutHelper.class) {
            String fileName = aPath.substring(aPath.lastIndexOf(File.separatorChar) + 1);
            String dir = aPath.substring(0, aPath.lastIndexOf(File.separatorChar) + 1);
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            String fileNameWithoutSuffix = fileName.substring(0, fileName.lastIndexOf("."));
            int duplicateCount = 1;
            file = new File(aPath);
            while (file.exists()) {
                String tmpString = String.valueOf(fileNameWithoutSuffix) + "_" + duplicateCount;
                file = new File(String.valueOf(dir) + tmpString + suffix);
                duplicateCount++;
            }
            File parentFile = file.getParentFile();
            if (parentFile != null) {
                parentFile.mkdirs();
            }
            file.createNewFile();
        }
        return file;
    }

    public static synchronized File createWithOverwriteExistFile(String aPath) throws IOException {
        File file;
        synchronized (FileInOutHelper.class) {
            file = new File(aPath);
            if (!file.exists()) {
                File parentFile = file.getParentFile();
                if (parentFile != null) {
                    parentFile.mkdirs();
                }
            } else {
                file.delete();
            }
            file.createNewFile();
        }
        return file;
    }

    public static boolean createNewFile(File aFile) {
        boolean fileCreateSuccessful;
        File parentFile;
        if (aFile == null) {
            return false;
        }
        if (!aFile.exists() && (parentFile = aFile.getParentFile()) != null) {
            parentFile.mkdirs();
        }
        try {
            fileCreateSuccessful = aFile.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
            fileCreateSuccessful = false;
        }
        return fileCreateSuccessful;
    }

    public static synchronized void deleteDir(File aDir) throws IOException {
        synchronized (FileInOutHelper.class) {
            if (aDir != null) {
                if (aDir.isDirectory()) {
                    File[] entries = aDir.listFiles();
                    int sz = entries.length;
                    for (int i = 0; i < sz; i++) {
                        if (entries[i].isDirectory()) {
                            deleteDir(entries[i]);
                        } else {
                            entries[i].delete();
                        }
                    }
                }
            }
            aDir.delete();
        }
    }

    public static synchronized void unZip(InputStream aIs, String aOutPutDir, boolean aOverride) throws IOException {
        String name;
        synchronized (FileInOutHelper.class) {
            ZipInputStream zipInputStream = new ZipInputStream(aIs);
            new File(aOutPutDir).mkdirs();
            for (ZipEntry zipEntry = zipInputStream.getNextEntry(); zipEntry != null; zipEntry = zipInputStream.getNextEntry()) {
                if (zipEntry.isDirectory()) {
                    String name2 = zipEntry.getName().substring(0, name.length() - 1);
                    if (name2 != null && "" != name2) {
                        new File(String.valueOf(aOutPutDir) + File.separator + name2).mkdir();
                    }
                } else {
                    String filePath = String.valueOf(aOutPutDir) + File.separatorChar + zipEntry.getName();
                    File file = new File(filePath);
                    if (aOverride) {
                        writeFile(zipInputStream, createWithOverwriteExistFile(filePath));
                    } else if (!file.exists()) {
                        file.createNewFile();
                        writeFile(zipInputStream, file);
                    }
                }
            }
            zipInputStream.close();
        }
    }

    public static synchronized void writeFile(InputStream aIs, File aDesFile) throws IOException {
        synchronized (FileInOutHelper.class) {
            FileOutputStream out = new FileOutputStream(aDesFile);
            byte[] b = new byte[6144];
            out.write(b, 0, aIs.read(b));
            while (true) {
                int len = aIs.read(b);
                if (len > 0) {
                    out.write(b, 0, len);
                    out.flush();
                } else {
                    out.close();
                }
            }
        }
    }

    public static synchronized void unZip(String aZipFilePath, String aOutPutDir, boolean aOverride) throws IOException {
        synchronized (FileInOutHelper.class) {
            InputStream is = new FileInputStream(new File(aZipFilePath));
            unZip(is, aOutPutDir, aOverride);
            is.close();
        }
    }

    public static void installApk(Context aContext, String aUri) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(aUri)), "application/vnd.android.package-archive");
        aContext.startActivity(intent);
    }

    public static String toCaseSensitivePath(String aInsensitvePath) {
        File parentFile;
        String[] subPaths;
        if (aInsensitvePath == null) {
            return null;
        }
        new String();
        File file = new File(aInsensitvePath);
        if (file.exists() && (parentFile = file.getParentFile()) != null && (subPaths = parentFile.list()) != null) {
            for (int i = 0; i < subPaths.length; i++) {
                String convertedPath = String.valueOf(file.getParent()) + "/" + subPaths[i];
                if (convertedPath.compareToIgnoreCase(aInsensitvePath) == 0) {
                    return String.valueOf(toCaseSensitivePath(file.getParent())) + "/" + subPaths[i];
                }
            }
            return aInsensitvePath;
        }
        return aInsensitvePath;
    }
}
