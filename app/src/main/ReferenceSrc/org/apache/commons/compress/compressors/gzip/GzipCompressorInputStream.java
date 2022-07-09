package org.apache.commons.compress.compressors.gzip;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.CRC32;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import org.apache.commons.compress.compressors.CompressorInputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/gzip/GzipCompressorInputStream.class */
public class GzipCompressorInputStream extends CompressorInputStream {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final int FCOMMENT = 16;
    private static final int FEXTRA = 4;
    private static final int FHCRC = 2;
    private static final int FNAME = 8;
    private static final int FRESERVED = 224;
    private final byte[] buf;
    private int bufUsed;
    private CRC32 crc;
    private final boolean decompressConcatenated;
    private boolean endReached;
    private final InputStream in;
    private Inflater inf;
    private int memberSize;

    static {
        $assertionsDisabled = !GzipCompressorInputStream.class.desiredAssertionStatus();
    }

    public GzipCompressorInputStream(InputStream inputStream) throws IOException {
        this(inputStream, false);
    }

    public GzipCompressorInputStream(InputStream inputStream, boolean z) throws IOException {
        this.buf = new byte[8192];
        this.bufUsed = 0;
        this.inf = new Inflater(true);
        this.crc = new CRC32();
        this.endReached = false;
        if (inputStream.markSupported()) {
            this.in = inputStream;
        } else {
            this.in = new BufferedInputStream(inputStream);
        }
        this.decompressConcatenated = z;
        init(true);
    }

    private boolean init(boolean z) throws IOException {
        boolean z2;
        if ($assertionsDisabled || z || this.decompressConcatenated) {
            int read = this.in.read();
            int read2 = this.in.read();
            if (read == -1 && !z) {
                z2 = false;
            } else if (read != 31 || read2 != 139) {
                throw new IOException(z ? "Input is not in the .gz format" : "Garbage after a valid .gz stream");
            } else {
                DataInputStream dataInputStream = new DataInputStream(this.in);
                int readUnsignedByte = dataInputStream.readUnsignedByte();
                if (readUnsignedByte != 8) {
                    throw new IOException("Unsupported compression method " + readUnsignedByte + " in the .gz header");
                }
                int readUnsignedByte2 = dataInputStream.readUnsignedByte();
                if ((readUnsignedByte2 & FRESERVED) != 0) {
                    throw new IOException("Reserved flags are set in the .gz header");
                }
                dataInputStream.readInt();
                dataInputStream.readUnsignedByte();
                dataInputStream.readUnsignedByte();
                if ((readUnsignedByte2 & 4) != 0) {
                    for (int readUnsignedByte3 = dataInputStream.readUnsignedByte() | (dataInputStream.readUnsignedByte() << 8); readUnsignedByte3 > 0; readUnsignedByte3--) {
                        dataInputStream.readUnsignedByte();
                    }
                }
                if ((readUnsignedByte2 & 8) != 0) {
                    readToNull(dataInputStream);
                }
                if ((readUnsignedByte2 & 16) != 0) {
                    readToNull(dataInputStream);
                }
                if ((readUnsignedByte2 & 2) != 0) {
                    dataInputStream.readShort();
                }
                this.inf.reset();
                this.crc.reset();
                this.memberSize = 0;
                z2 = true;
            }
            return z2;
        }
        throw new AssertionError();
    }

    public static boolean matches(byte[] bArr, int i) {
        boolean z;
        if (i < 2) {
            z = false;
        } else {
            z = false;
            if (bArr[0] == 31) {
                z = false;
                if (bArr[1] == -117) {
                    z = true;
                }
            }
        }
        return z;
    }

    private void readToNull(DataInputStream dataInputStream) throws IOException {
        do {
        } while (dataInputStream.readUnsignedByte() != 0);
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.inf != null) {
            this.inf.end();
            this.inf = null;
        }
        if (this.in != System.in) {
            this.in.close();
        }
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int i = -1;
        byte[] bArr = new byte[1];
        if (read(bArr, 0, 1) != -1) {
            i = bArr[0] & 255;
        }
        return i;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        int i4;
        if (this.endReached) {
            i3 = -1;
        } else {
            int i5 = i2;
            int i6 = i;
            int i7 = 0;
            while (true) {
                i3 = i7;
                if (i5 <= 0) {
                    break;
                }
                if (this.inf.needsInput()) {
                    this.in.mark(this.buf.length);
                    this.bufUsed = this.in.read(this.buf);
                    if (this.bufUsed == -1) {
                        throw new EOFException();
                    }
                    this.inf.setInput(this.buf, 0, this.bufUsed);
                }
                try {
                    int inflate = this.inf.inflate(bArr, i6, i5);
                    this.crc.update(bArr, i6, inflate);
                    this.memberSize += inflate;
                    int i8 = i6 + inflate;
                    int i9 = i5 - inflate;
                    i4 = i7 + inflate;
                    count(inflate);
                    i7 = i4;
                    i6 = i8;
                    i5 = i9;
                    if (this.inf.finished()) {
                        this.in.reset();
                        int remaining = this.bufUsed - this.inf.getRemaining();
                        if (this.in.skip(remaining) != remaining) {
                            throw new IOException();
                        }
                        this.bufUsed = 0;
                        DataInputStream dataInputStream = new DataInputStream(this.in);
                        long j = 0;
                        for (int i10 = 0; i10 < 4; i10++) {
                            j |= dataInputStream.readUnsignedByte() << (i10 * 8);
                        }
                        if (j != this.crc.getValue()) {
                            throw new IOException("Gzip-compressed data is corrupt (CRC32 error)");
                        }
                        int i11 = 0;
                        for (int i12 = 0; i12 < 4; i12++) {
                            i11 |= dataInputStream.readUnsignedByte() << (i12 * 8);
                        }
                        if (i11 != this.memberSize) {
                            throw new IOException("Gzip-compressed data is corrupt(uncompressed size mismatch)");
                        }
                        if (!this.decompressConcatenated) {
                            break;
                        }
                        i7 = i4;
                        i6 = i8;
                        i5 = i9;
                        if (!init(false)) {
                            break;
                        }
                    }
                } catch (DataFormatException e) {
                    throw new IOException("Gzip-compressed data is corrupt");
                }
            }
            this.inf.end();
            this.inf = null;
            this.endReached = true;
            i3 = i4;
            if (i4 == 0) {
                i3 = -1;
            }
        }
        return i3;
    }
}
