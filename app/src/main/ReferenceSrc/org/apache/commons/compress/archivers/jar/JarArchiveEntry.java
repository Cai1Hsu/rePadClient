package org.apache.commons.compress.archivers.jar;

import java.security.cert.Certificate;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/jar/JarArchiveEntry.class */
public class JarArchiveEntry extends ZipArchiveEntry {
    private Attributes manifestAttributes = null;
    private Certificate[] certificates = null;

    public JarArchiveEntry(String str) {
        super(str);
    }

    public JarArchiveEntry(JarEntry jarEntry) throws ZipException {
        super(jarEntry);
    }

    public JarArchiveEntry(ZipEntry zipEntry) throws ZipException {
        super(zipEntry);
    }

    public JarArchiveEntry(ZipArchiveEntry zipArchiveEntry) throws ZipException {
        super(zipArchiveEntry);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipArchiveEntry
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    public Certificate[] getCertificates() {
        Certificate[] certificateArr;
        if (this.certificates != null) {
            certificateArr = new Certificate[this.certificates.length];
            System.arraycopy(this.certificates, 0, certificateArr, 0, certificateArr.length);
        } else {
            certificateArr = null;
        }
        return certificateArr;
    }

    public Attributes getManifestAttributes() {
        return this.manifestAttributes;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipArchiveEntry, java.util.zip.ZipEntry
    public int hashCode() {
        return super.hashCode();
    }
}
