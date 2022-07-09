package org.apache.tools.tar;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/tar/TarInputStream.class */
public class TarInputStream extends FilterInputStream {
    private static final int BUFFER_SIZE = 8192;
    private static final int BYTE_MASK = 255;
    private static final int LARGE_BUFFER_SIZE = 32768;
    private static final int SMALL_BUFFER_SIZE = 256;
    protected TarBuffer buffer;
    protected TarEntry currEntry;
    protected boolean debug;
    protected long entryOffset;
    protected long entrySize;
    protected boolean hasHitEOF;
    protected byte[] oneBuf;
    protected byte[] readBuf;

    public TarInputStream(InputStream inputStream) {
        this(inputStream, 10240, 512);
    }

    public TarInputStream(InputStream inputStream, int i) {
        this(inputStream, i, 512);
    }

    public TarInputStream(InputStream inputStream, int i, int i2) {
        super(inputStream);
        this.buffer = new TarBuffer(inputStream, i, i2);
        this.readBuf = null;
        this.oneBuf = new byte[1];
        this.debug = false;
        this.hasHitEOF = false;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        return this.entrySize - this.entryOffset > 2147483647L ? Integer.MAX_VALUE : (int) (this.entrySize - this.entryOffset);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.buffer.close();
    }

    public void copyEntryContents(OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[32768];
        while (true) {
            int read = read(bArr, 0, bArr.length);
            if (read == -1) {
                return;
            }
            outputStream.write(bArr, 0, read);
        }
    }

    public TarEntry getNextEntry() throws IOException {
        TarEntry tarEntry;
        if (this.hasHitEOF) {
            tarEntry = null;
        } else {
            if (this.currEntry != null) {
                long j = this.entrySize - this.entryOffset;
                long j2 = j;
                if (this.debug) {
                    System.err.println(new StringBuffer().append("TarInputStream: SKIP currENTRY '").append(this.currEntry.getName()).append("' SZ ").append(this.entrySize).append(" OFF ").append(this.entryOffset).append("  skipping ").append(j).append(" bytes").toString());
                    j2 = j;
                }
                while (j2 > 0) {
                    long skip = skip(j2);
                    if (skip <= 0) {
                        throw new RuntimeException("failed to skip current tar entry");
                    }
                    j2 -= skip;
                }
                this.readBuf = null;
            }
            byte[] readRecord = this.buffer.readRecord();
            if (readRecord == null) {
                if (this.debug) {
                    System.err.println("READ NULL RECORD");
                }
                this.hasHitEOF = true;
            } else if (this.buffer.isEOFRecord(readRecord)) {
                if (this.debug) {
                    System.err.println("READ EOF RECORD");
                }
                this.hasHitEOF = true;
            }
            if (this.hasHitEOF) {
                this.currEntry = null;
            } else {
                this.currEntry = new TarEntry(readRecord);
                if (this.debug) {
                    System.err.println(new StringBuffer().append("TarInputStream: SET CURRENTRY '").append(this.currEntry.getName()).append("' size = ").append(this.currEntry.getSize()).toString());
                }
                this.entryOffset = 0L;
                this.entrySize = this.currEntry.getSize();
            }
            if (this.currEntry != null && this.currEntry.isGNULongNameEntry()) {
                StringBuffer stringBuffer = new StringBuffer();
                byte[] bArr = new byte[256];
                while (true) {
                    int read = read(bArr);
                    if (read < 0) {
                        break;
                    }
                    stringBuffer.append(new String(bArr, 0, read));
                }
                getNextEntry();
                if (this.currEntry == null) {
                    tarEntry = null;
                } else {
                    if (stringBuffer.length() > 0 && stringBuffer.charAt(stringBuffer.length() - 1) == 0) {
                        stringBuffer.deleteCharAt(stringBuffer.length() - 1);
                    }
                    this.currEntry.setName(stringBuffer.toString());
                }
            }
            tarEntry = this.currEntry;
        }
        return tarEntry;
    }

    public int getRecordSize() {
        return this.buffer.getRecordSize();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void mark(int i) {
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int i = -1;
        if (read(this.oneBuf, 0, 1) != -1) {
            i = this.oneBuf[0] & 255;
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        int i4 = 0;
        if (this.entryOffset >= this.entrySize) {
            i3 = -1;
        } else {
            int i5 = i2;
            if (i2 + this.entryOffset > this.entrySize) {
                i5 = (int) (this.entrySize - this.entryOffset);
            }
            int i6 = i;
            int i7 = i5;
            if (this.readBuf != null) {
                int length = i5 > this.readBuf.length ? this.readBuf.length : i5;
                System.arraycopy(this.readBuf, 0, bArr, i, length);
                if (length >= this.readBuf.length) {
                    this.readBuf = null;
                } else {
                    int length2 = this.readBuf.length - length;
                    byte[] bArr2 = new byte[length2];
                    System.arraycopy(this.readBuf, length, bArr2, 0, length2);
                    this.readBuf = bArr2;
                }
                i4 = 0 + length;
                i6 = i + length;
                i7 = i5 - length;
            }
            while (i7 > 0) {
                byte[] readRecord = this.buffer.readRecord();
                if (readRecord == null) {
                    throw new IOException(new StringBuffer().append("unexpected EOF with ").append(i7).append(" bytes unread").toString());
                }
                int i8 = i7;
                int length3 = readRecord.length;
                if (length3 > i8) {
                    System.arraycopy(readRecord, 0, bArr, i6, i8);
                    this.readBuf = new byte[length3 - i8];
                    System.arraycopy(readRecord, i8, this.readBuf, 0, length3 - i8);
                } else {
                    i8 = length3;
                    System.arraycopy(readRecord, 0, bArr, i6, length3);
                }
                i4 += i8;
                i7 -= i8;
                i6 += i8;
            }
            this.entryOffset += i4;
            i3 = i4;
        }
        return i3;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void reset() {
    }

    public void setDebug(boolean z) {
        this.debug = z;
        this.buffer.setDebug(z);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long j) throws IOException {
        long j2;
        byte[] bArr = new byte[8192];
        long j3 = j;
        while (true) {
            j2 = j3;
            if (j2 <= 0) {
                break;
            }
            int read = read(bArr, 0, (int) (j2 > ((long) bArr.length) ? bArr.length : j2));
            if (read == -1) {
                break;
            }
            j3 = j2 - read;
        }
        return j - j2;
    }
}
