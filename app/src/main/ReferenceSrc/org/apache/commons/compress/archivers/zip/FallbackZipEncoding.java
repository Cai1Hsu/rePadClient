package org.apache.commons.compress.archivers.zip;

import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/FallbackZipEncoding.class */
class FallbackZipEncoding implements ZipEncoding {
    private final String charset;

    public FallbackZipEncoding() {
        this.charset = null;
    }

    public FallbackZipEncoding(String str) {
        this.charset = str;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
    public boolean canEncode(String str) {
        return true;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
    public String decode(byte[] bArr) throws IOException {
        return this.charset == null ? new String(bArr) : new String(bArr, this.charset);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
    public ByteBuffer encode(String str) throws IOException {
        return this.charset == null ? ByteBuffer.wrap(str.getBytes()) : ByteBuffer.wrap(str.getBytes(this.charset));
    }
}
