package com.edutech.daoxueben.until;

import android.content.Context;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipException;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

/* loaded from: classes.jar:com/edutech/daoxueben/until/UnzipAssets.class */
public class UnzipAssets {
    public static void copyBigDataToSD(Context context, String str, String str2) throws IOException {
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        }
        FileOutputStream fileOutputStream = new FileOutputStream(String.valueOf(str2) + str);
        InputStream open = context.getAssets().open(str);
        byte[] bArr = new byte[1024];
        int read = open.read(bArr);
        while (true) {
            int i = read;
            if (i <= 0) {
                fileOutputStream.flush();
                open.close();
                fileOutputStream.close();
                return;
            }
            fileOutputStream.write(bArr, 0, i);
            read = open.read(bArr);
        }
    }

    public static int upZipFile(String str, String str2) throws ZipException, IOException {
        ZipFile zipFile = new ZipFile(str, "GBK");
        Enumeration entries = zipFile.getEntries();
        byte[] bArr = new byte[1024];
        while (entries.hasMoreElements()) {
            ZipEntry zipEntry = (ZipEntry) entries.nextElement();
            StringBuffer stringBuffer = new StringBuffer();
            for (int i = 0; i < zipEntry.getName().getBytes().length; i++) {
                stringBuffer.append(Integer.toHexString(zipEntry.getName().getBytes()[i] & 255));
                stringBuffer.append(" ");
            }
            if (zipEntry.isDirectory()) {
                new File(new String((String.valueOf(str2) + zipEntry.getName().replace("\\", "/")).getBytes("GBK"), "UTF-8")).mkdir();
            } else {
                String str3 = String.valueOf(str2) + zipEntry.getName().replace("\\", "/");
                File file = new File(str3.substring(0, str3.lastIndexOf("/")));
                if (!file.exists()) {
                    file.mkdirs();
                }
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(str3));
                BufferedInputStream bufferedInputStream = new BufferedInputStream(zipFile.getInputStream(zipEntry));
                while (true) {
                    int read = bufferedInputStream.read(bArr, 0, 1024);
                    if (read == -1) {
                        break;
                    }
                    bufferedOutputStream.write(bArr, 0, read);
                }
                bufferedInputStream.close();
                bufferedOutputStream.close();
            }
        }
        zipFile.close();
        return 0;
    }
}
