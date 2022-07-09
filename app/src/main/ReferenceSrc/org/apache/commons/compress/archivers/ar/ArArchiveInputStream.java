package org.apache.commons.compress.archivers.ar;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.utils.ArchiveUtils;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/ar/ArArchiveInputStream.class */
public class ArArchiveInputStream extends ArchiveInputStream {
    private static final String BSD_LONGNAME_PATTERN = "^#1/\\d+";
    static final String BSD_LONGNAME_PREFIX = "#1/";
    private static final int BSD_LONGNAME_PREFIX_LEN = BSD_LONGNAME_PREFIX.length();
    private static final String GNU_LONGNAME_PATTERN = "^/\\d+";
    private static final String GNU_STRING_TABLE_NAME = "//";
    private final InputStream input;
    private long offset = 0;
    private ArArchiveEntry currentEntry = null;
    private byte[] namebuffer = null;
    private long entryOffset = -1;
    private boolean closed = false;

    public ArArchiveInputStream(InputStream inputStream) {
        this.input = inputStream;
    }

    private int asInt(byte[] bArr) {
        return asInt(bArr, 10, false);
    }

    private int asInt(byte[] bArr, int i) {
        return asInt(bArr, i, false);
    }

    private int asInt(byte[] bArr, int i, boolean z) {
        String trim = ArchiveUtils.toAsciiString(bArr).trim();
        return (trim.length() != 0 || !z) ? Integer.parseInt(trim, i) : 0;
    }

    private int asInt(byte[] bArr, boolean z) {
        return asInt(bArr, 10, z);
    }

    private long asLong(byte[] bArr) {
        return Long.parseLong(ArchiveUtils.toAsciiString(bArr).trim());
    }

    private String getBSDLongName(String str) throws IOException {
        int i;
        int parseInt = Integer.parseInt(str.substring(BSD_LONGNAME_PREFIX_LEN));
        byte[] bArr = new byte[parseInt];
        int i2 = 0;
        do {
            int read = this.input.read(bArr, i2, parseInt - i2);
            i = i2;
            if (read < 0) {
                break;
            }
            i = i2 + read;
            count(read);
            i2 = i;
        } while (i != parseInt);
        if (i != parseInt) {
            throw new EOFException();
        }
        return ArchiveUtils.toAsciiString(bArr);
    }

    private String getExtendedName(int i) throws IOException {
        if (this.namebuffer == null) {
            throw new IOException("Cannot process GNU long filename as no // record was found");
        }
        for (int i2 = i; i2 < this.namebuffer.length; i2++) {
            if (this.namebuffer[i2] == 10) {
                int i3 = i2;
                if (this.namebuffer[i2 - 1] == 47) {
                    i3 = i2 - 1;
                }
                return ArchiveUtils.toAsciiString(this.namebuffer, i, i3 - i);
            }
        }
        throw new IOException("Failed to read entry: " + i);
    }

    private static boolean isBSDLongName(String str) {
        return str != null && str.matches(BSD_LONGNAME_PATTERN);
    }

    private boolean isGNULongName(String str) {
        return str != null && str.matches(GNU_LONGNAME_PATTERN);
    }

    private static boolean isGNUStringTable(String str) {
        return GNU_STRING_TABLE_NAME.equals(str);
    }

    public static boolean matches(byte[] bArr, int i) {
        boolean z;
        if (i < 8) {
            z = false;
        } else {
            z = false;
            if (bArr[0] == 33) {
                z = false;
                if (bArr[1] == 60) {
                    z = false;
                    if (bArr[2] == 97) {
                        z = false;
                        if (bArr[3] == 114) {
                            z = false;
                            if (bArr[4] == 99) {
                                z = false;
                                if (bArr[5] == 104) {
                                    z = false;
                                    if (bArr[6] == 62) {
                                        z = false;
                                        if (bArr[7] == 10) {
                                            z = true;
                                        }
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

    private ArArchiveEntry readGNUStringTable(byte[] bArr) throws IOException {
        int asInt = asInt(bArr);
        this.namebuffer = new byte[asInt];
        int read = read(this.namebuffer, 0, asInt);
        if (read != asInt) {
            throw new IOException("Failed to read complete // record: expected=" + asInt + " read=" + read);
        }
        return new ArArchiveEntry(GNU_STRING_TABLE_NAME, asInt);
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.closed) {
            this.closed = true;
            this.input.close();
        }
        this.currentEntry = null;
    }

    public ArArchiveEntry getNextArEntry() throws IOException {
        String str;
        long j;
        ArArchiveEntry arArchiveEntry;
        if (this.currentEntry != null) {
            long j2 = this.entryOffset;
            long length = this.currentEntry.getLength();
            while (this.offset < j2 + length) {
                if (read() == -1) {
                    arArchiveEntry = null;
                    break;
                }
            }
            this.currentEntry = null;
        }
        if (this.offset == 0) {
            byte[] asciiBytes = ArchiveUtils.toAsciiBytes(ArArchiveEntry.HEADER);
            byte[] bArr = new byte[asciiBytes.length];
            if (read(bArr) != asciiBytes.length) {
                throw new IOException("failed to read header. Occured at byte: " + getBytesRead());
            }
            for (int i = 0; i < asciiBytes.length; i++) {
                if (asciiBytes[i] != bArr[i]) {
                    throw new IOException("invalid header " + ArchiveUtils.toAsciiString(bArr));
                }
            }
        }
        if (this.offset % 2 != 0 && read() < 0) {
            arArchiveEntry = null;
        } else if (this.input.available() == 0) {
            arArchiveEntry = null;
        } else {
            byte[] bArr2 = new byte[16];
            byte[] bArr3 = new byte[12];
            byte[] bArr4 = new byte[6];
            byte[] bArr5 = new byte[6];
            byte[] bArr6 = new byte[8];
            byte[] bArr7 = new byte[10];
            read(bArr2);
            read(bArr3);
            read(bArr4);
            read(bArr5);
            read(bArr6);
            read(bArr7);
            byte[] asciiBytes2 = ArchiveUtils.toAsciiBytes(ArArchiveEntry.TRAILER);
            byte[] bArr8 = new byte[asciiBytes2.length];
            if (read(bArr8) != asciiBytes2.length) {
                throw new IOException("failed to read entry trailer. Occured at byte: " + getBytesRead());
            }
            for (int i2 = 0; i2 < asciiBytes2.length; i2++) {
                if (asciiBytes2[i2] != bArr8[i2]) {
                    throw new IOException("invalid entry trailer. not read the content? Occured at byte: " + getBytesRead());
                }
            }
            this.entryOffset = this.offset;
            String trim = ArchiveUtils.toAsciiString(bArr2).trim();
            long asLong = asLong(bArr7);
            if (isGNUStringTable(trim)) {
                this.currentEntry = readGNUStringTable(bArr7);
                arArchiveEntry = getNextArEntry();
            } else {
                if (trim.endsWith("/")) {
                    str = trim.substring(0, trim.length() - 1);
                    j = asLong;
                } else if (isGNULongName(trim)) {
                    str = getExtendedName(Integer.parseInt(trim.substring(1)));
                    j = asLong;
                } else {
                    str = trim;
                    j = asLong;
                    if (isBSDLongName(trim)) {
                        str = getBSDLongName(trim);
                        int length2 = str.length();
                        j = asLong - length2;
                        this.entryOffset += length2;
                    }
                }
                this.currentEntry = new ArArchiveEntry(str, j, asInt(bArr4, true), asInt(bArr5, true), asInt(bArr6, 8), asLong(bArr3));
                arArchiveEntry = this.currentEntry;
            }
        }
        return arArchiveEntry;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public ArchiveEntry getNextEntry() throws IOException {
        return getNextArEntry();
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        int i4 = i2;
        if (this.currentEntry != null) {
            long length = this.entryOffset + this.currentEntry.getLength();
            if (i2 <= 0 || length <= this.offset) {
                i3 = -1;
                return i3;
            }
            i4 = (int) Math.min(i2, length - this.offset);
        }
        i3 = this.input.read(bArr, i, i4);
        count(i3);
        this.offset = (i3 > 0 ? i3 : 0) + this.offset;
        return i3;
    }
}
