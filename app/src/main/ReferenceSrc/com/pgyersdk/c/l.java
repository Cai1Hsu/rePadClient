package com.pgyersdk.c;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Random;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.message.BasicHeader;

/* loaded from: classes.dex */
public final class l implements HttpEntity {
    private static final char[] a = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    private String e;
    private boolean c = false;
    private boolean b = false;
    private ByteArrayOutputStream d = new ByteArrayOutputStream();

    public l() {
        StringBuffer stringBuffer = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < 30; i++) {
            stringBuffer.append(a[random.nextInt(a.length)]);
        }
        this.e = stringBuffer.toString();
    }

    public final String a() {
        return this.e;
    }

    public final void a(String str, String str2) {
        b();
        this.d.write(("Content-Disposition: form-data; name=\"" + str + "\"\r\n").getBytes());
        this.d.write("Content-Type: text/plain; charset=UTF-8\r\n".getBytes());
        this.d.write("Content-Transfer-Encoding: 8bit\r\n\r\n".getBytes());
        this.d.write(str2.getBytes());
        this.d.write(("\r\n--" + this.e + "\r\n").getBytes());
    }

    public final void a(String str, String str2, InputStream inputStream, boolean z) {
        b();
        try {
            this.d.write(("Content-Disposition: form-data; name=\"" + str + "\"; filename=\"" + str2 + "\"\r\n").getBytes());
            this.d.write(("Content-Type: application/octet-stream\r\n").getBytes());
            this.d.write("Content-Transfer-Encoding: binary\r\n\r\n".getBytes());
            byte[] bArr = new byte[4096];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    break;
                }
                this.d.write(bArr, 0, read);
            }
            this.d.flush();
            if (z) {
                c();
            } else {
                this.d.write(("\r\n--" + this.e + "\r\n").getBytes());
            }
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public final void b() {
        if (!this.c) {
            this.d.write(("--" + this.e + "\r\n").getBytes());
        }
        this.c = true;
    }

    public final void c() {
        if (this.b) {
            return;
        }
        try {
            this.d.write(("\r\n--" + this.e + "--\r\n").getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.b = true;
    }

    @Override // org.apache.http.HttpEntity
    public final void consumeContent() {
        if (isStreaming()) {
            throw new UnsupportedOperationException("Streaming entity does not implement #consumeContent()");
        }
    }

    @Override // org.apache.http.HttpEntity
    public final InputStream getContent() {
        return new ByteArrayInputStream(this.d.toByteArray());
    }

    @Override // org.apache.http.HttpEntity
    public final Header getContentEncoding() {
        return null;
    }

    @Override // org.apache.http.HttpEntity
    public final long getContentLength() {
        c();
        return this.d.toByteArray().length;
    }

    @Override // org.apache.http.HttpEntity
    public final Header getContentType() {
        return new BasicHeader("Content-Type", "multipart/form-data; boundary=" + this.e);
    }

    @Override // org.apache.http.HttpEntity
    public final boolean isChunked() {
        return false;
    }

    @Override // org.apache.http.HttpEntity
    public final boolean isRepeatable() {
        return false;
    }

    @Override // org.apache.http.HttpEntity
    public final boolean isStreaming() {
        return false;
    }

    @Override // org.apache.http.HttpEntity
    public final void writeTo(OutputStream outstream) {
        outstream.write(this.d.toByteArray());
    }
}
