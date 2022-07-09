package org.apache.commons.compress.archivers;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.compress.archivers.ar.ArArchiveInputStream;
import org.apache.commons.compress.archivers.ar.ArArchiveOutputStream;
import org.apache.commons.compress.archivers.cpio.CpioArchiveInputStream;
import org.apache.commons.compress.archivers.cpio.CpioArchiveOutputStream;
import org.apache.commons.compress.archivers.dump.DumpArchiveInputStream;
import org.apache.commons.compress.archivers.jar.JarArchiveInputStream;
import org.apache.commons.compress.archivers.jar.JarArchiveOutputStream;
import org.apache.commons.compress.archivers.tar.TarArchiveInputStream;
import org.apache.commons.compress.archivers.tar.TarArchiveOutputStream;
import org.apache.commons.compress.archivers.zip.ZipArchiveInputStream;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/ArchiveStreamFactory.class */
public class ArchiveStreamFactory {
    public static final String AR = "ar";
    public static final String CPIO = "cpio";
    public static final String DUMP = "dump";
    public static final String JAR = "jar";
    public static final String TAR = "tar";
    public static final String ZIP = "zip";

    public ArchiveInputStream createArchiveInputStream(InputStream inputStream) throws ArchiveException {
        ArchiveInputStream tarArchiveInputStream;
        if (inputStream == null) {
            throw new IllegalArgumentException("Stream must not be null.");
        }
        if (!inputStream.markSupported()) {
            throw new IllegalArgumentException("Mark is not supported.");
        }
        byte[] bArr = new byte[12];
        inputStream.mark(bArr.length);
        try {
            int read = inputStream.read(bArr);
            inputStream.reset();
            if (ZipArchiveInputStream.matches(bArr, read)) {
                tarArchiveInputStream = new ZipArchiveInputStream(inputStream);
            } else if (JarArchiveInputStream.matches(bArr, read)) {
                tarArchiveInputStream = new JarArchiveInputStream(inputStream);
            } else if (ArArchiveInputStream.matches(bArr, read)) {
                tarArchiveInputStream = new ArArchiveInputStream(inputStream);
            } else if (CpioArchiveInputStream.matches(bArr, read)) {
                tarArchiveInputStream = new CpioArchiveInputStream(inputStream);
            } else {
                byte[] bArr2 = new byte[32];
                inputStream.mark(bArr2.length);
                int read2 = inputStream.read(bArr2);
                inputStream.reset();
                if (DumpArchiveInputStream.matches(bArr2, read2)) {
                    tarArchiveInputStream = new DumpArchiveInputStream(inputStream);
                } else {
                    byte[] bArr3 = new byte[512];
                    inputStream.mark(bArr3.length);
                    int read3 = inputStream.read(bArr3);
                    inputStream.reset();
                    if (!TarArchiveInputStream.matches(bArr3, read3)) {
                        if (read3 >= 512) {
                            try {
                                new TarArchiveInputStream(new ByteArrayInputStream(bArr3)).getNextEntry();
                                tarArchiveInputStream = new TarArchiveInputStream(inputStream);
                            } catch (Exception e) {
                            }
                        }
                        throw new ArchiveException("No Archiver found for the stream signature");
                    }
                    tarArchiveInputStream = new TarArchiveInputStream(inputStream);
                }
            }
            return tarArchiveInputStream;
        } catch (IOException e2) {
            throw new ArchiveException("Could not use reset and mark operations.", e2);
        }
    }

    public ArchiveInputStream createArchiveInputStream(String str, InputStream inputStream) throws ArchiveException {
        ArchiveInputStream dumpArchiveInputStream;
        if (str == null) {
            throw new IllegalArgumentException("Archivername must not be null.");
        }
        if (inputStream == null) {
            throw new IllegalArgumentException("InputStream must not be null.");
        }
        if (AR.equalsIgnoreCase(str)) {
            dumpArchiveInputStream = new ArArchiveInputStream(inputStream);
        } else if (ZIP.equalsIgnoreCase(str)) {
            dumpArchiveInputStream = new ZipArchiveInputStream(inputStream);
        } else if (TAR.equalsIgnoreCase(str)) {
            dumpArchiveInputStream = new TarArchiveInputStream(inputStream);
        } else if (JAR.equalsIgnoreCase(str)) {
            dumpArchiveInputStream = new JarArchiveInputStream(inputStream);
        } else if (CPIO.equalsIgnoreCase(str)) {
            dumpArchiveInputStream = new CpioArchiveInputStream(inputStream);
        } else if (!DUMP.equalsIgnoreCase(str)) {
            throw new ArchiveException("Archiver: " + str + " not found.");
        } else {
            dumpArchiveInputStream = new DumpArchiveInputStream(inputStream);
        }
        return dumpArchiveInputStream;
    }

    public ArchiveOutputStream createArchiveOutputStream(String str, OutputStream outputStream) throws ArchiveException {
        ArchiveOutputStream cpioArchiveOutputStream;
        if (str == null) {
            throw new IllegalArgumentException("Archivername must not be null.");
        }
        if (outputStream == null) {
            throw new IllegalArgumentException("OutputStream must not be null.");
        }
        if (AR.equalsIgnoreCase(str)) {
            cpioArchiveOutputStream = new ArArchiveOutputStream(outputStream);
        } else if (ZIP.equalsIgnoreCase(str)) {
            cpioArchiveOutputStream = new ZipArchiveOutputStream(outputStream);
        } else if (TAR.equalsIgnoreCase(str)) {
            cpioArchiveOutputStream = new TarArchiveOutputStream(outputStream);
        } else if (JAR.equalsIgnoreCase(str)) {
            cpioArchiveOutputStream = new JarArchiveOutputStream(outputStream);
        } else if (!CPIO.equalsIgnoreCase(str)) {
            throw new ArchiveException("Archiver: " + str + " not found.");
        } else {
            cpioArchiveOutputStream = new CpioArchiveOutputStream(outputStream);
        }
        return cpioArchiveOutputStream;
    }
}
