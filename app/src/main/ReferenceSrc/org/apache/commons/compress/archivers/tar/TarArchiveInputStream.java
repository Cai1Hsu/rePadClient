package org.apache.commons.compress.archivers.tar;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.zip.ZipEncoding;
import org.apache.commons.compress.archivers.zip.ZipEncodingHelper;
import org.apache.commons.compress.utils.ArchiveUtils;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/tar/TarArchiveInputStream.class */
public class TarArchiveInputStream extends ArchiveInputStream {
    private static final int BUFFER_SIZE = 8192;
    private static final int SMALL_BUFFER_SIZE = 256;
    protected final TarBuffer buffer;
    private TarArchiveEntry currEntry;
    private final ZipEncoding encoding;
    private long entryOffset;
    private long entrySize;
    private boolean hasHitEOF;
    private byte[] readBuf;

    public TarArchiveInputStream(InputStream inputStream) {
        this(inputStream, 10240, 512);
    }

    public TarArchiveInputStream(InputStream inputStream, int i) {
        this(inputStream, i, 512);
    }

    public TarArchiveInputStream(InputStream inputStream, int i, int i2) {
        this(inputStream, i, i2, null);
    }

    public TarArchiveInputStream(InputStream inputStream, int i, int i2, String str) {
        this.buffer = new TarBuffer(inputStream, i, i2);
        this.readBuf = null;
        this.hasHitEOF = false;
        this.encoding = ZipEncodingHelper.getZipEncoding(str);
    }

    public TarArchiveInputStream(InputStream inputStream, int i, String str) {
        this(inputStream, i, 512, str);
    }

    public TarArchiveInputStream(InputStream inputStream, String str) {
        this(inputStream, 10240, 512, str);
    }

    private void applyPaxHeadersToCurrentEntry(Map<String, String> map) {
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            if ("path".equals(key)) {
                this.currEntry.setName(value);
            } else if ("linkpath".equals(key)) {
                this.currEntry.setLinkName(value);
            } else if ("gid".equals(key)) {
                this.currEntry.setGroupId(Integer.parseInt(value));
            } else if ("gname".equals(key)) {
                this.currEntry.setGroupName(value);
            } else if ("uid".equals(key)) {
                this.currEntry.setUserId(Integer.parseInt(value));
            } else if ("uname".equals(key)) {
                this.currEntry.setUserName(value);
            } else if ("size".equals(key)) {
                this.currEntry.setSize(Long.parseLong(value));
            } else if ("mtime".equals(key)) {
                this.currEntry.setModTime((long) (Double.parseDouble(value) * 1000.0d));
            } else if ("SCHILY.devminor".equals(key)) {
                this.currEntry.setDevMinor(Integer.parseInt(value));
            } else if ("SCHILY.devmajor".equals(key)) {
                this.currEntry.setDevMajor(Integer.parseInt(value));
            }
        }
    }

    private byte[] getRecord() throws IOException {
        byte[] bArr = null;
        if (!this.hasHitEOF) {
            bArr = this.buffer.readRecord();
            if (bArr == null) {
                this.hasHitEOF = true;
            } else if (this.buffer.isEOFRecord(bArr)) {
                this.hasHitEOF = true;
            }
            if (this.hasHitEOF) {
                bArr = null;
            }
        }
        return bArr;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0027, code lost:
        if (org.apache.commons.compress.utils.ArchiveUtils.matchAsciiBuffer(org.apache.commons.compress.archivers.tar.TarConstants.VERSION_POSIX, r5, org.apache.commons.compress.archivers.tar.TarConstants.VERSION_OFFSET, 2) == false) goto L11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0053, code lost:
        if (org.apache.commons.compress.utils.ArchiveUtils.matchAsciiBuffer(org.apache.commons.compress.archivers.tar.TarConstants.VERSION_GNU_ZERO, r5, org.apache.commons.compress.archivers.tar.TarConstants.VERSION_OFFSET, 2) == false) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0070, code lost:
        if (org.apache.commons.compress.utils.ArchiveUtils.matchAsciiBuffer(org.apache.commons.compress.archivers.tar.TarConstants.VERSION_ANT, r5, org.apache.commons.compress.archivers.tar.TarConstants.VERSION_OFFSET, 2) == false) goto L21;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean matches(byte[] bArr, int i) {
        boolean z;
        if (i < 265) {
            z = false;
        } else {
            if (ArchiveUtils.matchAsciiBuffer("ustar��", bArr, 257, 6)) {
                z = true;
            }
            if (ArchiveUtils.matchAsciiBuffer(TarConstants.MAGIC_GNU, bArr, 257, 6)) {
                z = true;
                if (!ArchiveUtils.matchAsciiBuffer(TarConstants.VERSION_GNU_SPACE, bArr, TarConstants.VERSION_OFFSET, 2)) {
                    z = true;
                }
            }
            if (ArchiveUtils.matchAsciiBuffer("ustar��", bArr, 257, 6)) {
                z = true;
            }
            z = false;
        }
        return z;
    }

    private void paxHeaders() throws IOException {
        Map<String, String> parsePaxHeaders = parsePaxHeaders(this);
        getNextEntry();
        applyPaxHeadersToCurrentEntry(parsePaxHeaders);
    }

    private void readGNUSparse() throws IOException {
        byte[] record;
        if (this.currEntry.isExtended()) {
            do {
                record = getRecord();
                if (this.hasHitEOF) {
                    this.currEntry = null;
                    return;
                }
            } while (new TarArchiveSparseEntry(record).isExtended());
        }
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.entrySize - this.entryOffset > 2147483647L ? Integer.MAX_VALUE : (int) (this.entrySize - this.entryOffset);
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public boolean canReadEntryData(ArchiveEntry archiveEntry) {
        boolean z = false;
        if (archiveEntry instanceof TarArchiveEntry) {
            z = false;
            if (!((TarArchiveEntry) archiveEntry).isGNUSparse()) {
                z = true;
            }
        }
        return z;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.buffer.close();
    }

    protected final TarArchiveEntry getCurrentEntry() {
        return this.currEntry;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public ArchiveEntry getNextEntry() throws IOException {
        return getNextTarEntry();
    }

    public TarArchiveEntry getNextTarEntry() throws IOException {
        TarArchiveEntry tarArchiveEntry;
        if (this.hasHitEOF) {
            tarArchiveEntry = null;
        } else {
            if (this.currEntry != null) {
                long j = this.entrySize;
                long j2 = this.entryOffset;
                while (true) {
                    long j3 = j - j2;
                    if (j3 <= 0) {
                        this.readBuf = null;
                        break;
                    }
                    long skip = skip(j3);
                    if (skip <= 0) {
                        throw new RuntimeException("failed to skip current tar entry");
                    }
                    j = j3;
                    j2 = skip;
                }
            }
            byte[] record = getRecord();
            if (this.hasHitEOF) {
                this.currEntry = null;
                tarArchiveEntry = null;
            } else {
                try {
                    this.currEntry = new TarArchiveEntry(record, this.encoding);
                    this.entryOffset = 0L;
                    this.entrySize = this.currEntry.getSize();
                    if (this.currEntry.isGNULongNameEntry()) {
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
                            tarArchiveEntry = null;
                        } else {
                            if (stringBuffer.length() > 0 && stringBuffer.charAt(stringBuffer.length() - 1) == 0) {
                                stringBuffer.deleteCharAt(stringBuffer.length() - 1);
                            }
                            this.currEntry.setName(stringBuffer.toString());
                        }
                    }
                    if (this.currEntry.isPaxHeader()) {
                        paxHeaders();
                    }
                    if (this.currEntry.isGNUSparse()) {
                        readGNUSparse();
                    }
                    this.entrySize = this.currEntry.getSize();
                    tarArchiveEntry = this.currEntry;
                } catch (IllegalArgumentException e) {
                    IOException iOException = new IOException("Error detected parsing the header");
                    iOException.initCause(e);
                    throw iOException;
                }
            }
        }
        return tarArchiveEntry;
    }

    public int getRecordSize() {
        return this.buffer.getRecordSize();
    }

    protected final boolean isAtEOF() {
        return this.hasHitEOF;
    }

    Map<String, String> parsePaxHeaders(InputStream inputStream) throws IOException {
        int i;
        HashMap hashMap = new HashMap();
        do {
            int i2 = 0;
            int i3 = 0;
            while (true) {
                int read = inputStream.read();
                i = read;
                if (read == -1) {
                    break;
                }
                i3++;
                if (read == 32) {
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    while (true) {
                        int read2 = inputStream.read();
                        i = read2;
                        if (read2 == -1) {
                            break;
                        }
                        i3++;
                        if (read2 == 61) {
                            String byteArrayOutputStream2 = byteArrayOutputStream.toString("UTF-8");
                            byte[] bArr = new byte[i2 - i3];
                            int read3 = inputStream.read(bArr);
                            if (read3 != i2 - i3) {
                                throw new IOException("Failed to read Paxheader. Expected " + (i2 - i3) + " bytes, read " + read3);
                            }
                            hashMap.put(byteArrayOutputStream2, new String(bArr, 0, (i2 - i3) - 1, "UTF-8"));
                            i = read2;
                        } else {
                            byteArrayOutputStream.write((byte) read2);
                        }
                    }
                } else {
                    i2 = (i2 * 10) + (read - 48);
                }
            }
        } while (i != -1);
        return hashMap;
    }

    @Override // java.io.InputStream
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
                    throw new IOException("unexpected EOF with " + i7 + " bytes unread. Occured at byte: " + getBytesRead());
                }
                count(readRecord.length);
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

    @Override // java.io.InputStream
    public void reset() {
        synchronized (this) {
        }
    }

    protected final void setAtEOF(boolean z) {
        this.hasHitEOF = z;
    }

    protected final void setCurrentEntry(TarArchiveEntry tarArchiveEntry) {
        this.currEntry = tarArchiveEntry;
    }

    @Override // java.io.InputStream
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
