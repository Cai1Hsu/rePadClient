package com.edutech.json;

import com.edutech.idauthentication.FileInOutHelper;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: classes.jar:com/edutech/json/FileHelper.class */
public class FileHelper {
    public static void copyAllDirectoryFile(String str, String str2) {
        File[] listFiles = new File(str).listFiles();
        for (int i = 0; i < listFiles.length; i++) {
            copyFile(String.valueOf(str) + listFiles[i].getName(), String.valueOf(str2) + listFiles[i].getName());
        }
    }

    public static void copyFile(String str, String str2) {
        try {
            if (!new File(str).exists()) {
                return;
            }
            FileInputStream fileInputStream = new FileInputStream(str);
            FileOutputStream fileOutputStream = new FileOutputStream(str2);
            byte[] bArr = new byte[1444];
            while (true) {
                int read = fileInputStream.read(bArr);
                if (read == -1) {
                    break;
                }
                fileOutputStream.write(bArr, 0, read);
            }
            if (fileInputStream != null) {
                fileInputStream.close();
            }
            if (fileOutputStream == null) {
                return;
            }
            fileOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteBook() {
    }

    public static void deleteDir(String str) {
        File file = new File(str);
        if (file.exists()) {
            try {
                FileInOutHelper.deleteDir(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void deleteFile(String str) {
        if (new File(str).exists()) {
            FileInOutHelper.deleteFile(str);
        }
    }
}
