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

/* loaded from: classes.dex */
public class FileUtils {
    private static final int INDEX5 = 5;
    private static final int INDEX6 = 6;
    private static final int K = 1024;
    public static final String STR_SLASH_MNT = "/mnt";
    private static String filepathMobileStudyClient = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau.xml";
    private static String filepathMobileStudyClient_NEW = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/idau_new.xml";
    private static File idfileMobileStudyClient = new File(filepathMobileStudyClient);
    public static String seed = "Edutech@2013";

    public static final List<String> readIDFile() {
        List<String> idInfo = new ArrayList<>();
        String idString = null;
        String machineID = null;
        String resultString = null;
        String times = null;
        String date = null;
        String usedTimes = null;
        int i = Build.VERSION.SDK_INT;
        boolean userNewAuth = false;
        File file = new File(filepathMobileStudyClient_NEW);
        if (file.exists()) {
            userNewAuth = true;
        }
        FileInputStream filein = null;
        try {
            if (userNewAuth) {
                FileInputStream filein2 = new FileInputStream(file);
                filein = filein2;
            } else {
                FileInputStream filein3 = new FileInputStream(idfileMobileStudyClient);
                filein = filein3;
            }
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }
        if (filein != null) {
            try {
                XmlPullParserFactory pullParserFactory = XmlPullParserFactory.newInstance();
                XmlPullParser xmlPullParser = pullParserFactory.newPullParser();
                xmlPullParser.setInput(filein, "UTF-8");
                for (int eventType = xmlPullParser.getEventType(); eventType != 1; eventType = xmlPullParser.next()) {
                    String nodeName = xmlPullParser.getName();
                    switch (eventType) {
                        case 2:
                            if ("a1".equals(nodeName)) {
                                idString = xmlPullParser.nextText();
                            }
                            if ("b2".equals(nodeName)) {
                                machineID = xmlPullParser.nextText();
                            }
                            if ("c3".equals(nodeName)) {
                                resultString = xmlPullParser.nextText();
                            }
                            if ("d4".equals(nodeName)) {
                                times = xmlPullParser.nextText();
                            }
                            if ("e5".equals(nodeName)) {
                                date = xmlPullParser.nextText();
                            }
                            if ("f6".equals(nodeName)) {
                                usedTimes = xmlPullParser.nextText();
                                continue;
                            } else {
                                continue;
                            }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            } catch (XmlPullParserException e2) {
                e2.printStackTrace();
            }
            try {
                filein.close();
            } catch (IOException e12) {
                e12.printStackTrace();
            }
            idInfo.add("");
            idInfo.add("");
            idInfo.add("");
            idInfo.add("");
            idInfo.add("");
            idInfo.add("");
            try {
                if (idString != null) {
                    if (userNewAuth) {
                        idInfo.set(0, BZip2Utils.Base64DecodeToString(idString));
                    } else {
                        idInfo.set(0, AESUtils2.decrypt(seed, idString));
                    }
                }
                if (machineID != null) {
                    if (userNewAuth) {
                        idInfo.set(1, BZip2Utils.Base64DecodeToString(machineID));
                    } else {
                        idInfo.set(1, AESUtils2.decrypt(seed, machineID));
                    }
                }
                if (resultString != null) {
                    if (userNewAuth) {
                        idInfo.set(2, BZip2Utils.Base64DecodeToString(resultString));
                    } else {
                        idInfo.set(2, AESUtils2.decrypt(seed, resultString));
                    }
                }
                if (times != null) {
                    if (userNewAuth) {
                        idInfo.set(3, BZip2Utils.Base64DecodeToString(times));
                    } else {
                        idInfo.set(3, AESUtils2.decrypt(seed, times));
                    }
                }
                if (date != null) {
                    if (userNewAuth) {
                        idInfo.set(4, BZip2Utils.Base64DecodeToString(date));
                    } else {
                        idInfo.set(4, AESUtils2.decrypt(seed, date));
                    }
                }
                if (usedTimes != null) {
                    if (userNewAuth) {
                        idInfo.set(5, BZip2Utils.Base64DecodeToString(usedTimes));
                    } else {
                        idInfo.set(5, AESUtils2.decrypt(seed, usedTimes));
                    }
                }
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        }
        return idInfo;
    }

    public static void delete(String path) {
        File[] files;
        File dir = new File(path);
        if (dir.isDirectory() && (files = dir.listFiles()) != null) {
            for (File tempFile : files) {
                if (!tempFile.isDirectory() || !tempFile.getName().equals("HTML")) {
                    deleteFiles(tempFile.getAbsolutePath());
                }
            }
        }
    }

    public static void deleteFiles(String path) {
        File file = new File(path);
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (File file2 : files) {
                String newPath = file2.getAbsolutePath();
                Log.e("---------->dd", newPath);
                deleteFiles(newPath);
            }
        } else if (file.exists()) {
            file.delete();
            Log.e("-------->delete", path);
        }
        if (file.exists()) {
            file.delete();
        }
    }

    public static long getSDAvailableSize() {
        File path = Environment.getExternalStorageDirectory();
        StatFs stat = new StatFs(path.getPath());
        long blockSize = stat.getBlockSize();
        long availableBlocks = stat.getAvailableBlocks();
        return (long) ((((blockSize * availableBlocks) * 1.0d) / 1024.0d) / 1024.0d);
    }

    public static void deleteCameraFiles() {
        Log.e(HotDeploymentTool.ACTION_DELETE, "deleteCameraFiles");
        String OPEN_DCIM = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM).toString();
        if (OPEN_DCIM != null && !OPEN_DCIM.equals("")) {
            File file = new File(String.valueOf(OPEN_DCIM) + "/Camera/");
            File file2 = new File(String.valueOf(OPEN_DCIM) + "/Screenshots/");
            if (file.exists() && file.isDirectory()) {
                File[] files = file.listFiles();
                for (File tempFile : files) {
                    if (tempFile.exists()) {
                        tempFile.delete();
                    }
                }
            }
            if (file2.exists() && file2.isDirectory()) {
                File[] files2 = file2.listFiles();
                for (File tempFile2 : files2) {
                    if (tempFile2.exists()) {
                        tempFile2.delete();
                    }
                }
            }
        }
    }

    public static File setupOrOpenFile(String aPath) {
        String name = aPath.substring(aPath.lastIndexOf("/") + 1);
        String path = aPath.substring(0, aPath.lastIndexOf("/") + 1);
        return setupOrOpenFile(path, name);
    }

    public static File setupOrOpenFile(String aPath, String aFileName) {
        File file = null;
        String state = "";
        try {
            state = Environment.getExternalStorageState();
        } catch (NullPointerException e) {
        } catch (Exception e2) {
        }
        if ("mounted".equals(state)) {
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
                } catch (IOException e3) {
                    e3.printStackTrace();
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
        synchronized (FileUtils.class) {
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
        synchronized (FileUtils.class) {
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
        synchronized (FileUtils.class) {
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
        synchronized (FileUtils.class) {
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
        synchronized (FileUtils.class) {
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
        synchronized (FileUtils.class) {
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
