package org.apache.commons.compress.archivers.cpio;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.utils.ArchiveUtils;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/cpio/CpioArchiveInputStream.class */
public class CpioArchiveInputStream extends ArchiveInputStream implements CpioConstants {
    private CpioArchiveEntry entry;
    private final InputStream in;
    private boolean closed = false;
    private long entryBytesRead = 0;
    private boolean entryEOF = false;
    private final byte[] tmpbuf = new byte[4096];
    private long crc = 0;

    public CpioArchiveInputStream(InputStream inputStream) {
        this.in = inputStream;
    }

    private void closeEntry() throws IOException {
        ensureOpen();
        do {
        } while (read(this.tmpbuf, 0, this.tmpbuf.length) != -1);
        this.entryEOF = true;
    }

    private void ensureOpen() throws IOException {
        if (this.closed) {
            throw new IOException("Stream closed");
        }
    }

    public static boolean matches(byte[] bArr, int i) {
        boolean z;
        if (i < 6) {
            z = false;
        } else if (bArr[0] == 113 && (bArr[1] & 255) == 199) {
            z = true;
        } else if (bArr[1] == 113 && (bArr[0] & 255) == 199) {
            z = true;
        } else {
            z = false;
            if (bArr[0] == 48) {
                z = false;
                if (bArr[1] == 55) {
                    z = false;
                    if (bArr[2] == 48) {
                        z = false;
                        if (bArr[3] == 55) {
                            z = false;
                            if (bArr[4] == 48) {
                                if (bArr[5] == 49) {
                                    z = true;
                                } else if (bArr[5] == 50) {
                                    z = true;
                                } else {
                                    z = false;
                                    if (bArr[5] == 55) {
                                        z = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    private long readAsciiLong(int i, int i2) throws IOException {
        byte[] bArr = new byte[i];
        readFully(bArr, 0, bArr.length);
        return Long.parseLong(ArchiveUtils.toAsciiString(bArr), i2);
    }

    private long readBinaryLong(int i, boolean z) throws IOException {
        byte[] bArr = new byte[i];
        readFully(bArr, 0, bArr.length);
        return CpioUtil.byteArray2long(bArr, z);
    }

    private String readCString(int i) throws IOException {
        byte[] bArr = new byte[i];
        readFully(bArr, 0, bArr.length);
        return new String(bArr, 0, bArr.length - 1);
    }

    private final int readFully(byte[] bArr, int i, int i2) throws IOException {
        if (i2 < 0) {
            throw new IndexOutOfBoundsException();
        }
        int i3 = 0;
        while (true) {
            int i4 = i3;
            if (i4 >= i2) {
                return i4;
            }
            int read = this.in.read(bArr, i + i4, i2 - i4);
            count(read);
            if (read < 0) {
                throw new EOFException();
            }
            i3 = i4 + read;
        }
    }

    private CpioArchiveEntry readNewEntry(boolean z) throws IOException {
        CpioArchiveEntry cpioArchiveEntry = z ? new CpioArchiveEntry((short) 2) : new CpioArchiveEntry((short) 1);
        cpioArchiveEntry.setInode(readAsciiLong(8, 16));
        long readAsciiLong = readAsciiLong(8, 16);
        if (readAsciiLong != 0) {
            cpioArchiveEntry.setMode(readAsciiLong);
        }
        cpioArchiveEntry.setUID(readAsciiLong(8, 16));
        cpioArchiveEntry.setGID(readAsciiLong(8, 16));
        cpioArchiveEntry.setNumberOfLinks(readAsciiLong(8, 16));
        cpioArchiveEntry.setTime(readAsciiLong(8, 16));
        cpioArchiveEntry.setSize(readAsciiLong(8, 16));
        cpioArchiveEntry.setDeviceMaj(readAsciiLong(8, 16));
        cpioArchiveEntry.setDeviceMin(readAsciiLong(8, 16));
        cpioArchiveEntry.setRemoteDeviceMaj(readAsciiLong(8, 16));
        cpioArchiveEntry.setRemoteDeviceMin(readAsciiLong(8, 16));
        long readAsciiLong2 = readAsciiLong(8, 16);
        cpioArchiveEntry.setChksum(readAsciiLong(8, 16));
        String readCString = readCString((int) readAsciiLong2);
        cpioArchiveEntry.setName(readCString);
        if (readAsciiLong != 0 || readCString.equals(CpioConstants.CPIO_TRAILER)) {
            skip(cpioArchiveEntry.getHeaderPadCount());
            return cpioArchiveEntry;
        }
        throw new IOException("Mode 0 only allowed in the trailer. Found entry name: " + readCString + " Occured at byte: " + getBytesRead());
    }

    private CpioArchiveEntry readOldAsciiEntry() throws IOException {
        CpioArchiveEntry cpioArchiveEntry = new CpioArchiveEntry((short) 4);
        cpioArchiveEntry.setDevice(readAsciiLong(6, 8));
        cpioArchiveEntry.setInode(readAsciiLong(6, 8));
        long readAsciiLong = readAsciiLong(6, 8);
        if (readAsciiLong != 0) {
            cpioArchiveEntry.setMode(readAsciiLong);
        }
        cpioArchiveEntry.setUID(readAsciiLong(6, 8));
        cpioArchiveEntry.setGID(readAsciiLong(6, 8));
        cpioArchiveEntry.setNumberOfLinks(readAsciiLong(6, 8));
        cpioArchiveEntry.setRemoteDevice(readAsciiLong(6, 8));
        cpioArchiveEntry.setTime(readAsciiLong(11, 8));
        long readAsciiLong2 = readAsciiLong(6, 8);
        cpioArchiveEntry.setSize(readAsciiLong(11, 8));
        String readCString = readCString((int) readAsciiLong2);
        cpioArchiveEntry.setName(readCString);
        if (readAsciiLong != 0 || readCString.equals(CpioConstants.CPIO_TRAILER)) {
            return cpioArchiveEntry;
        }
        throw new IOException("Mode 0 only allowed in the trailer. Found entry: " + readCString + " Occured at byte: " + getBytesRead());
    }

    private CpioArchiveEntry readOldBinaryEntry(boolean z) throws IOException {
        CpioArchiveEntry cpioArchiveEntry = new CpioArchiveEntry((short) 8);
        cpioArchiveEntry.setDevice(readBinaryLong(2, z));
        cpioArchiveEntry.setInode(readBinaryLong(2, z));
        long readBinaryLong = readBinaryLong(2, z);
        if (readBinaryLong != 0) {
            cpioArchiveEntry.setMode(readBinaryLong);
        }
        cpioArchiveEntry.setUID(readBinaryLong(2, z));
        cpioArchiveEntry.setGID(readBinaryLong(2, z));
        cpioArchiveEntry.setNumberOfLinks(readBinaryLong(2, z));
        cpioArchiveEntry.setRemoteDevice(readBinaryLong(2, z));
        cpioArchiveEntry.setTime(readBinaryLong(4, z));
        long readBinaryLong2 = readBinaryLong(2, z);
        cpioArchiveEntry.setSize(readBinaryLong(4, z));
        String readCString = readCString((int) readBinaryLong2);
        cpioArchiveEntry.setName(readCString);
        if (readBinaryLong != 0 || readCString.equals(CpioConstants.CPIO_TRAILER)) {
            skip(cpioArchiveEntry.getHeaderPadCount());
            return cpioArchiveEntry;
        }
        throw new IOException("Mode 0 only allowed in the trailer. Found entry: " + readCString + "Occured at byte: " + getBytesRead());
    }

    private void skip(int i) throws IOException {
        byte[] bArr = new byte[4];
        if (i > 0) {
            readFully(bArr, 0, i);
        }
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        ensureOpen();
        return this.entryEOF ? 0 : 1;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.closed) {
            this.in.close();
            this.closed = true;
        }
    }

    public CpioArchiveEntry getNextCPIOEntry() throws IOException {
        CpioArchiveEntry cpioArchiveEntry;
        ensureOpen();
        if (this.entry != null) {
            closeEntry();
        }
        byte[] bArr = new byte[2];
        readFully(bArr, 0, bArr.length);
        if (CpioUtil.byteArray2long(bArr, false) == 29127) {
            this.entry = readOldBinaryEntry(false);
        } else if (CpioUtil.byteArray2long(bArr, true) == 29127) {
            this.entry = readOldBinaryEntry(true);
        } else {
            byte[] bArr2 = new byte[4];
            readFully(bArr2, 0, bArr2.length);
            byte[] bArr3 = new byte[6];
            System.arraycopy(bArr, 0, bArr3, 0, bArr.length);
            System.arraycopy(bArr2, 0, bArr3, bArr.length, bArr2.length);
            String asciiString = ArchiveUtils.toAsciiString(bArr3);
            if (asciiString.equals(CpioConstants.MAGIC_NEW)) {
                this.entry = readNewEntry(false);
            } else if (asciiString.equals(CpioConstants.MAGIC_NEW_CRC)) {
                this.entry = readNewEntry(true);
            } else if (!asciiString.equals(CpioConstants.MAGIC_OLD_ASCII)) {
                throw new IOException("Unknown magic [" + asciiString + "]. Occured at byte: " + getBytesRead());
            } else {
                this.entry = readOldAsciiEntry();
            }
        }
        this.entryBytesRead = 0L;
        this.entryEOF = false;
        this.crc = 0L;
        if (this.entry.getName().equals(CpioConstants.CPIO_TRAILER)) {
            this.entryEOF = true;
            cpioArchiveEntry = null;
        } else {
            cpioArchiveEntry = this.entry;
        }
        return cpioArchiveEntry;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public ArchiveEntry getNextEntry() throws IOException {
        return getNextCPIOEntry();
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        ensureOpen();
        if (i < 0 || i2 < 0 || i > bArr.length - i2) {
            throw new IndexOutOfBoundsException();
        }
        if (i2 == 0) {
            i3 = 0;
        } else {
            i3 = -1;
            if (this.entry != null) {
                i3 = -1;
                if (!this.entryEOF) {
                    if (this.entryBytesRead == this.entry.getSize()) {
                        skip(this.entry.getDataPadCount());
                        this.entryEOF = true;
                        i3 = -1;
                        if (this.entry.getFormat() == 2) {
                            i3 = -1;
                            if (this.crc != this.entry.getChksum()) {
                                throw new IOException("CRC Error. Occured at byte: " + getBytesRead());
                            }
                        }
                    } else {
                        int min = (int) Math.min(i2, this.entry.getSize() - this.entryBytesRead);
                        i3 = -1;
                        if (min >= 0) {
                            i3 = readFully(bArr, i, min);
                            if (this.entry.getFormat() == 2) {
                                for (int i4 = 0; i4 < i3; i4++) {
                                    this.crc += bArr[i4] & 255;
                                }
                            }
                            this.entryBytesRead += i3;
                        }
                    }
                }
            }
        }
        return i3;
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        int i;
        if (j < 0) {
            throw new IllegalArgumentException("negative skip length");
        }
        ensureOpen();
        int min = (int) Math.min(j, 2147483647L);
        int i2 = 0;
        while (true) {
            i = i2;
            if (i >= min) {
                break;
            }
            int i3 = min - i;
            int i4 = i3;
            if (i3 > this.tmpbuf.length) {
                i4 = this.tmpbuf.length;
            }
            int read = read(this.tmpbuf, 0, i4);
            if (read == -1) {
                this.entryEOF = true;
                break;
            }
            i2 = i + read;
        }
        return i;
    }
}
