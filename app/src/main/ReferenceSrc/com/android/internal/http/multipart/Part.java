package com.android.internal.http.multipart;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:com/android/internal/http/multipart/Part.class */
public abstract class Part {
    @Deprecated
    protected static final String BOUNDARY = "----------------314159265358979323846";
    protected static final String CHARSET = "; charset=";
    protected static final String CONTENT_DISPOSITION = "Content-Disposition: form-data; name=";
    protected static final String CONTENT_TRANSFER_ENCODING = "Content-Transfer-Encoding: ";
    protected static final String CONTENT_TYPE = "Content-Type: ";
    protected static final String CRLF = "\r\n";
    protected static final String EXTRA = "--";
    protected static final String QUOTE = "\"";
    @Deprecated
    protected static final byte[] BOUNDARY_BYTES = null;
    protected static final byte[] CHARSET_BYTES = null;
    protected static final byte[] CONTENT_DISPOSITION_BYTES = null;
    protected static final byte[] CONTENT_TRANSFER_ENCODING_BYTES = null;
    protected static final byte[] CONTENT_TYPE_BYTES = null;
    protected static final byte[] CRLF_BYTES = null;
    protected static final byte[] EXTRA_BYTES = null;
    protected static final byte[] QUOTE_BYTES = null;

    public Part() {
        throw new RuntimeException("Stub!");
    }

    @Deprecated
    public static String getBoundary() {
        throw new RuntimeException("Stub!");
    }

    public static long getLengthOfParts(Part[] partArr) throws IOException {
        throw new RuntimeException("Stub!");
    }

    public static long getLengthOfParts(Part[] partArr, byte[] bArr) throws IOException {
        throw new RuntimeException("Stub!");
    }

    public static void sendParts(OutputStream outputStream, Part[] partArr) throws IOException {
        throw new RuntimeException("Stub!");
    }

    public static void sendParts(OutputStream outputStream, Part[] partArr, byte[] bArr) throws IOException {
        throw new RuntimeException("Stub!");
    }

    public abstract String getCharSet();

    public abstract String getContentType();

    public abstract String getName();

    protected byte[] getPartBoundary() {
        throw new RuntimeException("Stub!");
    }

    public abstract String getTransferEncoding();

    public boolean isRepeatable() {
        throw new RuntimeException("Stub!");
    }

    public long length() throws IOException {
        throw new RuntimeException("Stub!");
    }

    protected abstract long lengthOfData() throws IOException;

    public void send(OutputStream outputStream) throws IOException {
        throw new RuntimeException("Stub!");
    }

    protected void sendContentTypeHeader(OutputStream outputStream) throws IOException {
        throw new RuntimeException("Stub!");
    }

    protected abstract void sendData(OutputStream outputStream) throws IOException;

    protected void sendDispositionHeader(OutputStream outputStream) throws IOException {
        throw new RuntimeException("Stub!");
    }

    protected void sendEnd(OutputStream outputStream) throws IOException {
        throw new RuntimeException("Stub!");
    }

    protected void sendEndOfHeader(OutputStream outputStream) throws IOException {
        throw new RuntimeException("Stub!");
    }

    protected void sendStart(OutputStream outputStream) throws IOException {
        throw new RuntimeException("Stub!");
    }

    protected void sendTransferEncodingHeader(OutputStream outputStream) throws IOException {
        throw new RuntimeException("Stub!");
    }

    public String toString() {
        throw new RuntimeException("Stub!");
    }
}
