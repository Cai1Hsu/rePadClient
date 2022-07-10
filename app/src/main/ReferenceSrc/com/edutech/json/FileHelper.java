package com.edutech.json;

import com.edutech.idauthentication.FileInOutHelper;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class FileHelper {
    public static void deleteDir(String deleteDir) {
        File bookdirFile = new File(deleteDir);
        if (bookdirFile.exists()) {
            try {
                FileInOutHelper.deleteDir(bookdirFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void deleteFile(String path) {
        File delFile = new File(path);
        if (delFile.exists()) {
            FileInOutHelper.deleteFile(path);
        }
    }

    public static void deleteBook() {
    }

    public static void copyAllDirectoryFile(String srcPath, String desPath) {
        File srcFile = new File(srcPath);
        File[] files = srcFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            String path = String.valueOf(srcPath) + files[i].getName();
            String newpathString = String.valueOf(desPath) + files[i].getName();
            copyFile(path, newpathString);
        }
    }

    public static void copyFile(String oldPath, String newPath) {
        try {
            File oldfile = new File(oldPath);
            if (oldfile.exists()) {
                InputStream inStream = new FileInputStream(oldPath);
                FileOutputStream fs = new FileOutputStream(newPath);
                byte[] buffer = new byte[1444];
                while (true) {
                    int byteread = inStream.read(buffer);
                    if (byteread == -1) {
                        break;
                    }
                    fs.write(buffer, 0, byteread);
                }
                if (inStream != null) {
                    inStream.close();
                }
                if (fs != null) {
                    fs.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
