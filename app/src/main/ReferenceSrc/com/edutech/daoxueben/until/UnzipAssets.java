package com.edutech.daoxueben.until;

import android.content.Context;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.zip.ZipException;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.bson.BSON;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class UnzipAssets {
    public static void copyBigDataToSD(Context context, String zipName, String outputDirectory) throws IOException {
        File file = new File(outputDirectory);
        if (!file.exists()) {
            file.mkdirs();
        }
        OutputStream myOutput = new FileOutputStream(String.valueOf(outputDirectory) + zipName);
        InputStream myInput = context.getAssets().open(zipName);
        byte[] buffer = new byte[1024];
        for (int length = myInput.read(buffer); length > 0; length = myInput.read(buffer)) {
            myOutput.write(buffer, 0, length);
        }
        myOutput.flush();
        myInput.close();
        myOutput.close();
    }

    public static int upZipFile(String zipFile, String folderPath) throws ZipException, IOException {
        ZipFile zfile = new ZipFile(zipFile, "GBK");
        Enumeration zList = zfile.getEntries();
        byte[] buf = new byte[1024];
        while (zList.hasMoreElements()) {
            ZipEntry ze = (ZipEntry) zList.nextElement();
            StringBuffer xxx = new StringBuffer();
            for (int i = 0; i < ze.getName().getBytes().length; i++) {
                xxx.append(Integer.toHexString(ze.getName().getBytes()[i] & BSON.MINKEY));
                xxx.append(" ");
            }
            if (ze.isDirectory()) {
                String dirstr = String.valueOf(folderPath) + ze.getName().replace("\\", "/");
                File f = new File(new String(dirstr.getBytes("GBK"), "UTF-8"));
                f.mkdir();
            } else {
                String filestr = String.valueOf(folderPath) + ze.getName().replace("\\", "/");
                File tmpname = new File(filestr.substring(0, filestr.lastIndexOf("/")));
                if (!tmpname.exists()) {
                    tmpname.mkdirs();
                }
                OutputStream os = new BufferedOutputStream(new FileOutputStream(filestr));
                InputStream is = new BufferedInputStream(zfile.getInputStream(ze));
                while (true) {
                    int readLen = is.read(buf, 0, 1024);
                    if (readLen == -1) {
                        break;
                    }
                    os.write(buf, 0, readLen);
                }
                is.close();
                os.close();
            }
        }
        zfile.close();
        return 0;
    }
}
