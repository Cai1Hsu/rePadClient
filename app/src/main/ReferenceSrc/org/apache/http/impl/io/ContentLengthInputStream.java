package org.apache.http.impl.io;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.io.SessionInputBuffer;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/io/ContentLengthInputStream.class */
public class ContentLengthInputStream extends InputStream {
    public ContentLengthInputStream(SessionInputBuffer sessionInputBuffer, long j) {
        throw new RuntimeException("Stub!");
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        throw new RuntimeException("Stub!");
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        throw new RuntimeException("Stub!");
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        throw new RuntimeException("Stub!");
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        throw new RuntimeException("Stub!");
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        throw new RuntimeException("Stub!");
    }
}
