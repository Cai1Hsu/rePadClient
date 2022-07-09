package org.apache.tools.ant.taskdefs.optional.jlink;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Vector;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jlink/jlink.class */
public class jlink {
    private static final int BUFFER_SIZE = 8192;
    private static final int VECTOR_INIT_SIZE = 10;
    private String outfile = null;
    private Vector mergefiles = new Vector(10);
    private Vector addfiles = new Vector(10);
    private boolean compression = false;
    byte[] buffer = new byte[8192];

    private void addDirContents(ZipOutputStream zipOutputStream, File file, String str, boolean z) throws IOException {
        String[] list;
        for (String str2 : file.list()) {
            File file2 = new File(file, str2);
            if (file2.isDirectory()) {
                addDirContents(zipOutputStream, file2, new StringBuffer().append(str).append(str2).append('/').toString(), z);
            } else {
                addFile(zipOutputStream, file2, str, z);
            }
        }
    }

    private void addFile(ZipOutputStream zipOutputStream, File file, String str, boolean z) throws IOException {
        if (!file.exists()) {
            return;
        }
        ZipEntry zipEntry = new ZipEntry(getEntryName(file, str));
        zipEntry.setTime(file.lastModified());
        zipEntry.setSize(file.length());
        if (!z) {
            zipEntry.setCrc(calcChecksum(file));
        }
        addToOutputStream(zipOutputStream, new FileInputStream(file), zipEntry);
    }

    private void addToOutputStream(ZipOutputStream zipOutputStream, InputStream inputStream, ZipEntry zipEntry) throws IOException {
        try {
            zipOutputStream.putNextEntry(zipEntry);
            while (true) {
                int read = inputStream.read(this.buffer);
                if (read <= 0) {
                    zipOutputStream.closeEntry();
                    inputStream.close();
                    return;
                }
                zipOutputStream.write(this.buffer, 0, read);
            }
        } catch (ZipException e) {
            inputStream.close();
        }
    }

    private long calcChecksum(File file) throws IOException {
        return calcChecksum(new BufferedInputStream(new FileInputStream(file)));
    }

    private long calcChecksum(InputStream inputStream) throws IOException {
        CRC32 crc32 = new CRC32();
        int length = this.buffer.length;
        int i = 0;
        while (true) {
            int read = inputStream.read(this.buffer, 0, length);
            if (read <= 0) {
                inputStream.close();
                return crc32.getValue();
            }
            i += read;
            crc32.update(this.buffer, 0, read);
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x00c6 -> B:28:0x007e). Please submit an issue!!! */
    private String getEntryName(File file, String str) {
        String stringBuffer;
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2;
        Throwable th;
        String className;
        String name = file.getName();
        if (!name.endsWith(".class")) {
            try {
                fileInputStream = new FileInputStream(file);
                try {
                    className = ClassNameReader.getClassName(fileInputStream);
                } catch (IOException e) {
                    if (fileInputStream != null) {
                        fileInputStream.close();
                    }
                    System.out.println(new StringBuffer().append("From ").append(file.getPath()).append(" and prefix ").append(str).append(", creating entry ").append(str).append(name).toString());
                    stringBuffer = new StringBuffer().append(str).append(name).toString();
                    return stringBuffer;
                } catch (Throwable th2) {
                    th = th2;
                    fileInputStream2 = fileInputStream;
                    if (fileInputStream2 != null) {
                        try {
                            fileInputStream2.close();
                        } catch (IOException e2) {
                        }
                    }
                    throw th;
                }
            } catch (IOException e3) {
                fileInputStream = null;
            } catch (Throwable th3) {
                th = th3;
                fileInputStream2 = null;
            }
            if (className != null) {
                String stringBuffer2 = new StringBuffer().append(className.replace('.', '/')).append(".class").toString();
                stringBuffer = stringBuffer2;
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                        stringBuffer = stringBuffer2;
                    } catch (IOException e4) {
                        stringBuffer = stringBuffer2;
                    }
                }
                return stringBuffer;
            } else if (fileInputStream != null) {
                fileInputStream.close();
            }
        }
        System.out.println(new StringBuffer().append("From ").append(file.getPath()).append(" and prefix ").append(str).append(", creating entry ").append(str).append(name).toString());
        stringBuffer = new StringBuffer().append(str).append(name).toString();
        return stringBuffer;
    }

    public static void main(String[] strArr) {
        if (strArr.length < 2) {
            System.out.println("usage: jlink output input1 ... inputN");
            System.exit(1);
        }
        jlink jlinkVar = new jlink();
        jlinkVar.setOutfile(strArr[0]);
        for (int i = 1; i < strArr.length; i++) {
            jlinkVar.addMergeFile(strArr[i]);
        }
        try {
            jlinkVar.link();
        } catch (Exception e) {
            System.err.print(e.getMessage());
        }
    }

    private void mergeZipJarContents(ZipOutputStream zipOutputStream, File file) throws IOException {
        if (!file.exists()) {
            return;
        }
        ZipFile zipFile = new ZipFile(file);
        Enumeration<? extends ZipEntry> entries = zipFile.entries();
        while (entries.hasMoreElements()) {
            ZipEntry nextElement = entries.nextElement();
            if (nextElement.getName().indexOf("META-INF") < 0) {
                try {
                    zipOutputStream.putNextEntry(processEntry(zipFile, nextElement));
                    InputStream inputStream = zipFile.getInputStream(nextElement);
                    int length = this.buffer.length;
                    while (true) {
                        int read = inputStream.read(this.buffer, 0, length);
                        if (read <= 0) {
                            break;
                        }
                        zipOutputStream.write(this.buffer, 0, read);
                    }
                    inputStream.close();
                    zipOutputStream.closeEntry();
                } catch (ZipException e) {
                    if (e.getMessage().indexOf("duplicate") < 0) {
                        throw e;
                    }
                }
            }
        }
        zipFile.close();
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x00ab -> B:10:0x0059). Please submit an issue!!! */
    private ZipEntry processEntry(ZipFile zipFile, ZipEntry zipEntry) {
        String name = zipEntry.getName();
        String str = name;
        if (!zipEntry.isDirectory()) {
            str = name;
            if (!name.endsWith(".class")) {
                try {
                    InputStream inputStream = zipFile.getInputStream(zipFile.getEntry(name));
                    String className = ClassNameReader.getClassName(inputStream);
                    inputStream.close();
                    str = name;
                    if (className != null) {
                        str = new StringBuffer().append(className.replace('.', '/')).append(".class").toString();
                    }
                } catch (IOException e) {
                    str = name;
                }
            }
        }
        ZipEntry zipEntry2 = new ZipEntry(str);
        zipEntry2.setTime(zipEntry.getTime());
        zipEntry2.setExtra(zipEntry.getExtra());
        zipEntry2.setComment(zipEntry.getComment());
        zipEntry2.setTime(zipEntry.getTime());
        if (this.compression) {
            zipEntry2.setMethod(8);
        } else {
            zipEntry2.setMethod(0);
            zipEntry2.setCrc(zipEntry.getCrc());
            zipEntry2.setSize(zipEntry.getSize());
        }
        return zipEntry2;
    }

    public void addAddFile(String str) {
        if (str == null) {
            return;
        }
        this.addfiles.addElement(str);
    }

    public void addAddFiles(String[] strArr) {
        if (strArr == null) {
            return;
        }
        for (String str : strArr) {
            addAddFile(str);
        }
    }

    public void addMergeFile(String str) {
        if (str == null) {
            return;
        }
        this.mergefiles.addElement(str);
    }

    public void addMergeFiles(String[] strArr) {
        if (strArr == null) {
            return;
        }
        for (String str : strArr) {
            addMergeFile(str);
        }
    }

    public void link() throws Exception {
        ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(this.outfile));
        if (this.compression) {
            zipOutputStream.setMethod(8);
            zipOutputStream.setLevel(-1);
        } else {
            zipOutputStream.setMethod(0);
        }
        Enumeration elements = this.mergefiles.elements();
        while (elements.hasMoreElements()) {
            String str = (String) elements.nextElement();
            File file = new File(str);
            if (file.getName().endsWith(".jar") || file.getName().endsWith(".zip")) {
                mergeZipJarContents(zipOutputStream, file);
            } else {
                addAddFile(str);
            }
        }
        Enumeration elements2 = this.addfiles.elements();
        while (elements2.hasMoreElements()) {
            File file2 = new File((String) elements2.nextElement());
            if (file2.isDirectory()) {
                addDirContents(zipOutputStream, file2, new StringBuffer().append(file2.getName()).append('/').toString(), this.compression);
            } else {
                addFile(zipOutputStream, file2, "", this.compression);
            }
        }
        FileUtils.close(zipOutputStream);
    }

    public void setCompression(boolean z) {
        this.compression = z;
    }

    public void setOutfile(String str) {
        if (str == null) {
            return;
        }
        this.outfile = str;
    }
}
