package com.edutech.daoxueben.until;

import com.edutech.daoxueben.sysconfig.AppEnvironment;
import java.io.File;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class DelFileOrFolder {
    public static boolean DeleteFolder(String sPath) {
        if (sPath.equals(AppEnvironment.FOLDER_MAIN)) {
            return true;
        }
        File file = new File(sPath);
        if (!file.exists()) {
            return false;
        }
        if (file.isFile()) {
            boolean flag = deleteFile(sPath);
            return flag;
        }
        boolean flag2 = deleteDirectory(sPath);
        return flag2;
    }

    public static boolean deleteFile(String sPath) {
        File file = new File(sPath);
        if (!file.isFile() || !file.exists()) {
            return false;
        }
        boolean flag = file.delete();
        return flag;
    }

    public static boolean deleteDirectory(String sPath) {
        if (!sPath.endsWith(File.separator)) {
            sPath = String.valueOf(sPath) + File.separator;
        }
        File dirFile = new File(sPath);
        if (!dirFile.exists() || !dirFile.isDirectory()) {
            return false;
        }
        boolean flag = true;
        File[] files = dirFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            if (files[i].isFile()) {
                flag = deleteFile(files[i].getAbsolutePath());
                if (!flag) {
                    break;
                }
            } else {
                flag = deleteDirectory(files[i].getAbsolutePath());
                if (!flag) {
                    break;
                }
            }
        }
        return flag && dirFile.delete();
    }
}
