package org.apache.commons.compress.archivers.dump;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import org.apache.commons.compress.archivers.dump.DumpArchiveConstants;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/dump/TapeInputStream.class */
class TapeInputStream extends FilterInputStream {
    private byte[] blockBuffer = new byte[1024];
    private int currBlkIdx = -1;
    private int blockSize = 1024;
    private int recordSize = 1024;
    private int readOffset = 1024;
    private boolean isCompressed = false;
    private long bytesRead = 0;

    /* renamed from: org.apache.commons.compress.archivers.dump.TapeInputStream$1 */
    /* loaded from: classes.jar:org/apache/commons/compress/archivers/dump/TapeInputStream$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$apache$commons$compress$archivers$dump$DumpArchiveConstants$COMPRESSION_TYPE = new int[DumpArchiveConstants.COMPRESSION_TYPE.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:10:0x002f -> B:14:0x001f). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0033 -> B:12:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$apache$commons$compress$archivers$dump$DumpArchiveConstants$COMPRESSION_TYPE[DumpArchiveConstants.COMPRESSION_TYPE.ZLIB.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$apache$commons$compress$archivers$dump$DumpArchiveConstants$COMPRESSION_TYPE[DumpArchiveConstants.COMPRESSION_TYPE.BZLIB.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$apache$commons$compress$archivers$dump$DumpArchiveConstants$COMPRESSION_TYPE[DumpArchiveConstants.COMPRESSION_TYPE.LZO.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    public TapeInputStream(InputStream inputStream) {
        super(inputStream);
    }

    private boolean readBlock(boolean z) throws IOException {
        boolean z2;
        boolean z3 = true;
        boolean z4 = false;
        if (this.in == null) {
            throw new IOException("input buffer is closed");
        }
        if (this.isCompressed && this.currBlkIdx != -1) {
            if (readFully(this.blockBuffer, 0, 4)) {
                this.bytesRead += 4;
                int convert32 = DumpArchiveUtil.convert32(this.blockBuffer, 0);
                if ((convert32 & 1) != 1) {
                    z3 = false;
                }
                if (!z3) {
                    z2 = readFully(this.blockBuffer, 0, this.blockSize);
                    this.bytesRead += this.blockSize;
                } else {
                    int i = (convert32 >> 4) & 268435455;
                    byte[] bArr = new byte[i];
                    boolean readFully = readFully(bArr, 0, i);
                    this.bytesRead += i;
                    if (!z) {
                        Arrays.fill(this.blockBuffer, (byte) 0);
                        z2 = readFully;
                    } else {
                        switch (AnonymousClass1.$SwitchMap$org$apache$commons$compress$archivers$dump$DumpArchiveConstants$COMPRESSION_TYPE[DumpArchiveConstants.COMPRESSION_TYPE.find((convert32 >> 1) & 7 & 3).ordinal()]) {
                            case 1:
                                try {
                                    Inflater inflater = new Inflater();
                                    inflater.setInput(bArr, 0, bArr.length);
                                    if (inflater.inflate(this.blockBuffer) == this.blockSize) {
                                        inflater.end();
                                        z2 = readFully;
                                        break;
                                    } else {
                                        throw new ShortFileException();
                                    }
                                } catch (DataFormatException e) {
                                    throw new DumpArchiveException("bad data", e);
                                }
                            case 2:
                                throw new UnsupportedCompressionAlgorithmException("BZLIB2");
                            case 3:
                                throw new UnsupportedCompressionAlgorithmException("LZO");
                            default:
                                throw new UnsupportedCompressionAlgorithmException();
                        }
                    }
                }
            }
            return z4;
        }
        z2 = readFully(this.blockBuffer, 0, this.blockSize);
        this.bytesRead += this.blockSize;
        this.currBlkIdx++;
        this.readOffset = 0;
        z4 = z2;
        return z4;
    }

    private boolean readFully(byte[] bArr, int i, int i2) throws IOException {
        int i3 = 0;
        while (true) {
            int i4 = i3;
            if (i4 < i2) {
                int read = this.in.read(bArr, i + i4, i2 - i4);
                if (read == -1) {
                    throw new ShortFileException();
                }
                i3 = i4 + read;
            } else {
                return true;
            }
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        return this.readOffset < this.blockSize ? this.blockSize - this.readOffset : this.in.available();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.in == null || this.in == System.in) {
            return;
        }
        this.in.close();
    }

    public long getBytesRead() {
        return this.bytesRead;
    }

    public byte[] peek() throws IOException {
        byte[] bArr;
        if (this.readOffset != this.blockSize || readBlock(true)) {
            bArr = new byte[this.recordSize];
            System.arraycopy(this.blockBuffer, this.readOffset, bArr, 0, bArr.length);
        } else {
            bArr = null;
        }
        return bArr;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        throw new IllegalArgumentException("all reads must be multiple of record size (" + this.recordSize + " bytes.");
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        int i4;
        int i5;
        if (i2 % this.recordSize != 0) {
            throw new IllegalArgumentException("all reads must be multiple of record size (" + this.recordSize + " bytes.");
        }
        int i6 = i;
        int i7 = 0;
        while (true) {
            i3 = i7;
            if (i7 < i2) {
                if (this.readOffset == this.blockSize && !readBlock(true)) {
                    i3 = -1;
                    break;
                }
                if (this.readOffset + (i2 - i7) <= this.blockSize) {
                    i4 = i2;
                    i5 = i7;
                } else {
                    i4 = this.blockSize;
                    i5 = this.readOffset;
                }
                int i8 = i4 - i5;
                System.arraycopy(this.blockBuffer, this.readOffset, bArr, i6, i8);
                this.readOffset += i8;
                i7 += i8;
                i6 += i8;
            } else {
                break;
            }
        }
        return i3;
    }

    public byte[] readRecord() throws IOException {
        byte[] bArr = new byte[this.recordSize];
        if (-1 == read(bArr, 0, bArr.length)) {
            throw new ShortFileException();
        }
        return bArr;
    }

    public void resetBlockSize(int i, boolean z) throws IOException {
        this.isCompressed = z;
        this.blockSize = this.recordSize * i;
        byte[] bArr = this.blockBuffer;
        this.blockBuffer = new byte[this.blockSize];
        System.arraycopy(bArr, 0, this.blockBuffer, 0, this.recordSize);
        readFully(this.blockBuffer, this.recordSize, this.blockSize - this.recordSize);
        this.currBlkIdx = 0;
        this.readOffset = this.recordSize;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long j) throws IOException {
        long j2;
        if (j % this.recordSize != 0) {
            throw new IllegalArgumentException("all reads must be multiple of record size (" + this.recordSize + " bytes.");
        }
        long j3 = 0;
        while (true) {
            long j4 = j3;
            j2 = j4;
            if (j4 >= j) {
                break;
            }
            if (this.readOffset == this.blockSize) {
                if (!readBlock(j - j4 < ((long) this.blockSize))) {
                    j2 = -1;
                    break;
                }
            }
            long j5 = ((long) this.readOffset) + (j - j4) <= ((long) this.blockSize) ? j - j4 : this.blockSize - this.readOffset;
            this.readOffset = (int) (this.readOffset + j5);
            j3 = j4 + j5;
        }
        return j2;
    }
}
