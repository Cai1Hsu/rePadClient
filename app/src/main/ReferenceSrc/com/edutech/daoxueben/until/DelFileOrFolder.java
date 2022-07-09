package com.edutech.daoxueben.until;

import com.edutech.daoxueben.sysconfig.AppEnvironment;
import java.io.File;

/* loaded from: classes.jar:com/edutech/daoxueben/until/DelFileOrFolder.class */
public class DelFileOrFolder {
    public static boolean DeleteFolder(String str) {
        boolean z;
        if (str.equals(AppEnvironment.FOLDER_MAIN)) {
            z = true;
        } else {
            z = false;
            File file = new File(str);
            if (file.exists()) {
                z = file.isFile() ? deleteFile(str) : deleteDirectory(str);
            }
        }
        return z;
    }

    public static boolean deleteDirectory(String str) {
        String str2 = str;
        if (!str.endsWith(File.separator)) {
            str2 = String.valueOf(str) + File.separator;
        }
        File file = new File(str2);
        boolean z = false;
        if (file.exists()) {
            if (!file.isDirectory()) {
                z = false;
            } else {
                boolean z2 = true;
                File[] listFiles = file.listFiles();
                int i = 0;
                while (true) {
                    if (i >= listFiles.length) {
                        break;
                    } else if (listFiles[i].isFile()) {
                        boolean deleteFile = deleteFile(listFiles[i].getAbsolutePath());
                        z2 = deleteFile;
                        if (!deleteFile) {
                            break;
                        }
                        z2 = deleteFile;
                        i++;
                    } else {
                        boolean deleteDirectory = deleteDirectory(listFiles[i].getAbsolutePath());
                        z2 = deleteDirectory;
                        if (!deleteDirectory) {
                            z2 = deleteDirectory;
                            break;
                        }
                        i++;
                    }
                }
                z = false;
                if (z2) {
                    z = false;
                    if (file.delete()) {
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    public static boolean deleteFile(String str) {
        File file = new File(str);
        boolean z = false;
        if (file.isFile()) {
            z = false;
            if (file.exists()) {
                z = file.delete();
            }
        }
        return z;
    }
}
