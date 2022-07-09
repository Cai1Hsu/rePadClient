package org.apache.tools.tar;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/tar/TarOutputStream.class */
public class TarOutputStream extends FilterOutputStream {
    public static final int LONGFILE_ERROR = 0;
    public static final int LONGFILE_GNU = 2;
    public static final int LONGFILE_TRUNCATE = 1;
    protected byte[] assemBuf;
    protected int assemLen;
    protected TarBuffer buffer;
    private boolean closed;
    protected long currBytes;
    protected String currName;
    protected long currSize;
    protected boolean debug;
    protected int longFileMode;
    protected byte[] oneBuf;
    protected byte[] recordBuf;

    public TarOutputStream(OutputStream outputStream) {
        this(outputStream, 10240, 512);
    }

    public TarOutputStream(OutputStream outputStream, int i) {
        this(outputStream, i, 512);
    }

    public TarOutputStream(OutputStream outputStream, int i, int i2) {
        super(outputStream);
        this.longFileMode = 0;
        this.closed = false;
        this.buffer = new TarBuffer(outputStream, i, i2);
        this.debug = false;
        this.assemLen = 0;
        this.assemBuf = new byte[i2];
        this.recordBuf = new byte[i2];
        this.oneBuf = new byte[1];
    }

    private void writeEOFRecord() throws IOException {
        for (int i = 0; i < this.recordBuf.length; i++) {
            this.recordBuf[i] = (byte) 0;
        }
        this.buffer.writeRecord(this.recordBuf);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.closed) {
            finish();
            this.buffer.close();
            this.out.close();
            this.closed = true;
        }
    }

    public void closeEntry() throws IOException {
        if (this.assemLen > 0) {
            for (int i = this.assemLen; i < this.assemBuf.length; i++) {
                this.assemBuf[i] = (byte) 0;
            }
            this.buffer.writeRecord(this.assemBuf);
            this.currBytes += this.assemLen;
            this.assemLen = 0;
        }
        if (this.currBytes < this.currSize) {
            throw new IOException(new StringBuffer().append("entry '").append(this.currName).append("' closed at '").append(this.currBytes).append("' before the '").append(this.currSize).append("' bytes specified in the header were written").toString());
        }
    }

    public void finish() throws IOException {
        writeEOFRecord();
        writeEOFRecord();
        this.buffer.flushBlock();
    }

    public int getRecordSize() {
        return this.buffer.getRecordSize();
    }

    public void putNextEntry(TarEntry tarEntry) throws IOException {
        if (tarEntry.getName().length() >= 100) {
            if (this.longFileMode == 2) {
                TarEntry tarEntry2 = new TarEntry("././@LongLink", (byte) 76);
                tarEntry2.setSize(tarEntry.getName().length() + 1);
                putNextEntry(tarEntry2);
                write(tarEntry.getName().getBytes());
                write(0);
                closeEntry();
            } else if (this.longFileMode != 1) {
                throw new RuntimeException(new StringBuffer().append("file name '").append(tarEntry.getName()).append("' is too long ( > ").append(100).append(" bytes)").toString());
            }
        }
        tarEntry.writeEntryHeader(this.recordBuf);
        this.buffer.writeRecord(this.recordBuf);
        this.currBytes = 0L;
        if (tarEntry.isDirectory()) {
            this.currSize = 0L;
        } else {
            this.currSize = tarEntry.getSize();
        }
        this.currName = tarEntry.getName();
    }

    public void setBufferDebug(boolean z) {
        this.buffer.setDebug(z);
    }

    public void setDebug(boolean z) {
        this.debug = z;
    }

    public void setLongFileMode(int i) {
        this.longFileMode = i;
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(int i) throws IOException {
        this.oneBuf[0] = (byte) i;
        write(this.oneBuf, 0, 1);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bArr) throws IOException {
        write(bArr, 0, bArr.length);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        if (this.currBytes + i2 > this.currSize) {
            throw new IOException(new StringBuffer().append("request to write '").append(i2).append("' bytes exceeds size in header of '").append(this.currSize).append("' bytes for entry '").append(this.currName).append("'").toString());
        }
        int i3 = i;
        int i4 = i2;
        if (this.assemLen > 0) {
            if (this.assemLen + i2 >= this.recordBuf.length) {
                int length = this.recordBuf.length - this.assemLen;
                System.arraycopy(this.assemBuf, 0, this.recordBuf, 0, this.assemLen);
                System.arraycopy(bArr, i, this.recordBuf, this.assemLen, length);
                this.buffer.writeRecord(this.recordBuf);
                this.currBytes += this.recordBuf.length;
                i3 = i + length;
                i4 = i2 - length;
                this.assemLen = 0;
            } else {
                System.arraycopy(bArr, i, this.assemBuf, this.assemLen, i2);
                i3 = i + i2;
                this.assemLen += i2;
                i4 = 0;
            }
        }
        while (i4 > 0) {
            if (i4 < this.recordBuf.length) {
                System.arraycopy(bArr, i3, this.assemBuf, this.assemLen, i4);
                this.assemLen += i4;
                return;
            }
            this.buffer.writeRecord(bArr, i3);
            int length2 = this.recordBuf.length;
            this.currBytes += length2;
            i4 -= length2;
            i3 += length2;
        }
    }
}
