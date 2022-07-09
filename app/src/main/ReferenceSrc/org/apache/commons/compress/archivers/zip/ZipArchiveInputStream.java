package org.apache.commons.compress.archivers.zip;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.zip.CRC32;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import java.util.zip.ZipException;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.zip.UnsupportedZipFeatureException;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipArchiveInputStream.class */
public class ZipArchiveInputStream extends ArchiveInputStream {
    private static final int LFH_LEN = 30;
    private static final long TWO_EXP_32 = 4294967296L;
    private boolean allowStoredEntriesWithDataDescriptor;
    private final Buffer buf;
    private boolean closed;
    private final CRC32 crc;
    private CurrentEntry current;
    private boolean hitCentralDirectory;
    private final InputStream in;
    private final Inflater inf;
    private ByteArrayInputStream lastStoredEntry;
    private final boolean useUnicodeExtraFields;
    private final ZipEncoding zipEncoding;
    private static final byte[] LFH = ZipLong.LFH_SIG.getBytes();
    private static final byte[] CFH = ZipLong.CFH_SIG.getBytes();
    private static final byte[] DD = ZipLong.DD_SIG.getBytes();

    /* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer.class */
    private static final class Buffer {
        private final byte[] buf;
        private int lengthOfLastRead;
        private int offsetInBuffer;

        private Buffer() {
            this.buf = new byte[512];
            this.offsetInBuffer = 0;
            this.lengthOfLastRead = 0;
        }

        static /* synthetic */ int access$712(Buffer buffer, int i) {
            int i2 = buffer.offsetInBuffer + i;
            buffer.offsetInBuffer = i2;
            return i2;
        }

        public void reset() {
            this.lengthOfLastRead = 0;
            this.offsetInBuffer = 0;
        }
    }

    /* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipArchiveInputStream$CurrentEntry.class */
    private static final class CurrentEntry {
        private long bytesRead;
        private long bytesReadFromStream;
        private final ZipArchiveEntry entry;
        private boolean hasDataDescriptor;
        private boolean usesZip64;

        private CurrentEntry() {
            this.entry = new ZipArchiveEntry();
        }

        static /* synthetic */ long access$614(CurrentEntry currentEntry, long j) {
            long j2 = currentEntry.bytesRead + j;
            currentEntry.bytesRead = j2;
            return j2;
        }

        static /* synthetic */ long access$914(CurrentEntry currentEntry, long j) {
            long j2 = currentEntry.bytesReadFromStream + j;
            currentEntry.bytesReadFromStream = j2;
            return j2;
        }
    }

    public ZipArchiveInputStream(InputStream inputStream) {
        this(inputStream, "UTF8", true);
    }

    public ZipArchiveInputStream(InputStream inputStream, String str, boolean z) {
        this(inputStream, str, z, false);
    }

    public ZipArchiveInputStream(InputStream inputStream, String str, boolean z, boolean z2) {
        this.inf = new Inflater(true);
        this.crc = new CRC32();
        this.buf = new Buffer();
        this.current = null;
        this.closed = false;
        this.hitCentralDirectory = false;
        this.lastStoredEntry = null;
        this.allowStoredEntriesWithDataDescriptor = false;
        this.zipEncoding = ZipEncodingHelper.getZipEncoding(str);
        this.useUnicodeExtraFields = z;
        this.in = new PushbackInputStream(inputStream, this.buf.buf.length);
        this.allowStoredEntriesWithDataDescriptor = z2;
    }

    private boolean bufferContainsSignature(ByteArrayOutputStream byteArrayOutputStream, int i, int i2, int i3) throws IOException {
        boolean z;
        int i4;
        boolean z2 = false;
        int i5 = 0;
        int i6 = 0;
        while (!z2 && i6 < i2 - 4) {
            boolean z3 = z2;
            int i7 = i5;
            if (this.buf.buf[i6] == LFH[0]) {
                z3 = z2;
                i7 = i5;
                if (this.buf.buf[i6 + 1] == LFH[1]) {
                    if ((this.buf.buf[i6 + 2] == LFH[2] && this.buf.buf[i6 + 3] == LFH[3]) || (this.buf.buf[i6] == CFH[2] && this.buf.buf[i6 + 3] == CFH[3])) {
                        i4 = ((i + i2) - i6) - i3;
                        z = true;
                    } else {
                        z = z2;
                        i4 = i5;
                        if (this.buf.buf[i6 + 2] == DD[2]) {
                            z = z2;
                            i4 = i5;
                            if (this.buf.buf[i6 + 3] == DD[3]) {
                                i4 = (i + i2) - i6;
                                z = true;
                            }
                        }
                    }
                    z3 = z;
                    i7 = i4;
                    if (z) {
                        pushback(this.buf.buf, (i + i2) - i4, i4);
                        byteArrayOutputStream.write(this.buf.buf, 0, i6);
                        readDataDescriptor();
                        i7 = i4;
                        z3 = z;
                    }
                }
            }
            i6++;
            z2 = z3;
            i5 = i7;
        }
        return z2;
    }

    private int cacheBytesRead(ByteArrayOutputStream byteArrayOutputStream, int i, int i2, int i3) {
        int i4;
        int i5 = ((i + i2) - i3) - 3;
        if (i5 > 0) {
            byteArrayOutputStream.write(this.buf.buf, 0, i5);
            System.arraycopy(this.buf.buf, i5, this.buf.buf, 0, i3 + 3);
            i4 = i3 + 3;
        } else {
            i4 = i + i2;
        }
        return i4;
    }

    private static boolean checksig(byte[] bArr, byte[] bArr2) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= bArr2.length) {
                z = true;
                break;
            } else if (bArr[i] != bArr2[i]) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private void closeEntry() throws IOException {
        if (this.closed) {
            throw new IOException("The stream is closed");
        }
        if (this.current == null) {
            return;
        }
        if (this.current.bytesReadFromStream > this.current.entry.getCompressedSize() || this.current.hasDataDescriptor) {
            skip(Long.MAX_VALUE);
            int bytesInflated = (int) (this.current.bytesReadFromStream - (this.current.entry.getMethod() == 8 ? getBytesInflated() : this.current.bytesRead));
            if (bytesInflated > 0) {
                pushback(this.buf.buf, this.buf.lengthOfLastRead - bytesInflated, bytesInflated);
            }
        } else {
            drainCurrentEntryData();
        }
        if (this.lastStoredEntry == null && this.current.hasDataDescriptor) {
            readDataDescriptor();
        }
        this.inf.reset();
        this.buf.reset();
        this.crc.reset();
        this.current = null;
        this.lastStoredEntry = null;
    }

    private void drainCurrentEntryData() throws IOException {
        long compressedSize = this.current.entry.getCompressedSize();
        long j = this.current.bytesReadFromStream;
        while (true) {
            long j2 = compressedSize - j;
            if (j2 > 0) {
                long read = this.in.read(this.buf.buf, 0, (int) Math.min(this.buf.buf.length, j2));
                if (read < 0) {
                    throw new EOFException("Truncated ZIP entry: " + this.current.entry.getName());
                }
                count(read);
                compressedSize = j2;
                j = read;
            } else {
                return;
            }
        }
    }

    private void fill() throws IOException {
        if (this.closed) {
            throw new IOException("The stream is closed");
        }
        if (this.buf.lengthOfLastRead = this.in.read(this.buf.buf) <= 0) {
            return;
        }
        count(this.buf.lengthOfLastRead);
        this.inf.setInput(this.buf.buf, 0, this.buf.lengthOfLastRead);
    }

    private long getBytesInflated() {
        long bytesRead = this.inf.getBytesRead();
        long j = bytesRead;
        if (this.current.bytesReadFromStream >= TWO_EXP_32) {
            while (true) {
                j = bytesRead;
                if (bytesRead + TWO_EXP_32 > this.current.bytesReadFromStream) {
                    break;
                }
                bytesRead += TWO_EXP_32;
            }
        }
        return j;
    }

    public static boolean matches(byte[] bArr, int i) {
        boolean z = false;
        if (i >= ZipArchiveOutputStream.LFH_SIG.length && (checksig(bArr, ZipArchiveOutputStream.LFH_SIG) || checksig(bArr, ZipArchiveOutputStream.EOCD_SIG))) {
            z = true;
        }
        return z;
    }

    private void processZip64Extra(ZipLong zipLong, ZipLong zipLong2) {
        Zip64ExtendedInformationExtraField zip64ExtendedInformationExtraField = (Zip64ExtendedInformationExtraField) this.current.entry.getExtraField(Zip64ExtendedInformationExtraField.HEADER_ID);
        this.current.usesZip64 = zip64ExtendedInformationExtraField != null;
        if (!this.current.hasDataDescriptor) {
            if (!this.current.usesZip64 || (!zipLong2.equals(ZipLong.ZIP64_MAGIC) && !zipLong.equals(ZipLong.ZIP64_MAGIC))) {
                this.current.entry.setCompressedSize(zipLong2.getValue());
                this.current.entry.setSize(zipLong.getValue());
                return;
            }
            this.current.entry.setCompressedSize(zip64ExtendedInformationExtraField.getCompressedSize().getLongValue());
            this.current.entry.setSize(zip64ExtendedInformationExtraField.getSize().getLongValue());
        }
    }

    private void pushback(byte[] bArr, int i, int i2) throws IOException {
        ((PushbackInputStream) this.in).unread(bArr, i, i2);
        pushedBackBytes(i2);
    }

    private void readDataDescriptor() throws IOException {
        byte[] bArr = new byte[4];
        readFully(bArr);
        ZipLong zipLong = new ZipLong(bArr);
        ZipLong zipLong2 = zipLong;
        if (ZipLong.DD_SIG.equals(zipLong)) {
            readFully(bArr);
            zipLong2 = new ZipLong(bArr);
        }
        this.current.entry.setCrc(zipLong2.getValue());
        byte[] bArr2 = new byte[16];
        readFully(bArr2);
        ZipLong zipLong3 = new ZipLong(bArr2, 8);
        if (!zipLong3.equals(ZipLong.CFH_SIG) && !zipLong3.equals(ZipLong.LFH_SIG)) {
            this.current.entry.setCompressedSize(ZipEightByteInteger.getLongValue(bArr2));
            this.current.entry.setSize(ZipEightByteInteger.getLongValue(bArr2, 8));
            return;
        }
        pushback(bArr2, 8, 8);
        this.current.entry.setCompressedSize(ZipLong.getValue(bArr2));
        this.current.entry.setSize(ZipLong.getValue(bArr2, 4));
    }

    private int readDeflated(byte[] bArr, int i, int i2) throws IOException {
        if (this.inf.needsInput()) {
            fill();
            if (this.buf.lengthOfLastRead > 0) {
                CurrentEntry.access$914(this.current, this.buf.lengthOfLastRead);
            }
        }
        try {
            int inflate = this.inf.inflate(bArr, i, i2);
            if (inflate == 0) {
                if (this.inf.finished()) {
                    inflate = -1;
                    return inflate;
                } else if (this.buf.lengthOfLastRead == -1) {
                    throw new IOException("Truncated ZIP file");
                }
            }
            this.crc.update(bArr, i, inflate);
            return inflate;
        } catch (DataFormatException e) {
            throw new ZipException(e.getMessage());
        }
    }

    private void readFully(byte[] bArr) throws IOException {
        int i = 0;
        while (i != bArr.length) {
            int read = this.in.read(bArr, i, bArr.length - i);
            i += read;
            if (read == -1) {
                throw new EOFException();
            }
            count(read);
        }
    }

    private int readStored(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        if (this.current.hasDataDescriptor) {
            if (this.lastStoredEntry == null) {
                readStoredEntry();
            }
            i3 = this.lastStoredEntry.read(bArr, i, i2);
        } else {
            long size = this.current.entry.getSize();
            i3 = -1;
            if (this.current.bytesRead < size) {
                if (this.buf.offsetInBuffer >= this.buf.lengthOfLastRead) {
                    this.buf.offsetInBuffer = 0;
                    i3 = -1;
                    if (this.buf.lengthOfLastRead = this.in.read(this.buf.buf) != -1) {
                        count(this.buf.lengthOfLastRead);
                        CurrentEntry.access$914(this.current, this.buf.lengthOfLastRead);
                    }
                }
                if (i2 > this.buf.lengthOfLastRead) {
                    i2 = this.buf.lengthOfLastRead - this.buf.offsetInBuffer;
                }
                i3 = i2;
                if (size - this.current.bytesRead < i2) {
                    i3 = (int) (size - this.current.bytesRead);
                }
                System.arraycopy(this.buf.buf, this.buf.offsetInBuffer, bArr, i, i3);
                Buffer.access$712(this.buf, i3);
                CurrentEntry.access$614(this.current, i3);
                this.crc.update(bArr, i, i3);
            }
        }
        return i3;
    }

    private void readStoredEntry() throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int i = 0;
        boolean z = false;
        int i2 = this.current.usesZip64 ? 20 : 12;
        while (!z) {
            int read = this.in.read(this.buf.buf, i, 512 - i);
            if (read <= 0) {
                throw new IOException("Truncated ZIP file");
            }
            if (read + i < 4) {
                i += read;
            } else {
                boolean bufferContainsSignature = bufferContainsSignature(byteArrayOutputStream, i, read, i2);
                z = bufferContainsSignature;
                if (!bufferContainsSignature) {
                    i = cacheBytesRead(byteArrayOutputStream, i, read, i2);
                    z = bufferContainsSignature;
                }
            }
        }
        this.lastStoredEntry = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
    }

    private boolean supportsDataDescriptorFor(ZipArchiveEntry zipArchiveEntry) {
        return this.allowStoredEntriesWithDataDescriptor || !zipArchiveEntry.getGeneralPurposeBit().usesDataDescriptor() || zipArchiveEntry.getMethod() == 8;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public boolean canReadEntryData(ArchiveEntry archiveEntry) {
        boolean z = false;
        if (archiveEntry instanceof ZipArchiveEntry) {
            ZipArchiveEntry zipArchiveEntry = (ZipArchiveEntry) archiveEntry;
            z = false;
            if (ZipUtil.canHandleEntryData(zipArchiveEntry)) {
                z = false;
                if (supportsDataDescriptorFor(zipArchiveEntry)) {
                    z = true;
                }
            }
        }
        return z;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.closed) {
            this.closed = true;
            this.in.close();
            this.inf.end();
        }
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public ArchiveEntry getNextEntry() throws IOException {
        return getNextZipEntry();
    }

    public ZipArchiveEntry getNextZipEntry() throws IOException {
        ZipArchiveEntry zipArchiveEntry;
        int i;
        if (this.closed || this.hitCentralDirectory) {
            zipArchiveEntry = null;
        } else {
            if (this.current != null) {
                closeEntry();
            }
            byte[] bArr = new byte[30];
            try {
                readFully(bArr);
                ZipLong zipLong = new ZipLong(bArr);
                if (zipLong.equals(ZipLong.CFH_SIG)) {
                    this.hitCentralDirectory = true;
                    zipArchiveEntry = null;
                } else if (!zipLong.equals(ZipLong.LFH_SIG)) {
                    zipArchiveEntry = null;
                } else {
                    this.current = new CurrentEntry();
                    int value = ZipShort.getValue(bArr, 4);
                    int i2 = 4 + 2;
                    this.current.entry.setPlatform((value >> 8) & 15);
                    GeneralPurposeBit parse = GeneralPurposeBit.parse(bArr, i2);
                    boolean usesUTF8ForNames = parse.usesUTF8ForNames();
                    ZipEncoding zipEncoding = usesUTF8ForNames ? ZipEncodingHelper.UTF8_ZIP_ENCODING : this.zipEncoding;
                    this.current.hasDataDescriptor = parse.usesDataDescriptor();
                    this.current.entry.setGeneralPurposeBit(parse);
                    int i3 = i2 + 2;
                    this.current.entry.setMethod(ZipShort.getValue(bArr, i3));
                    int i4 = i3 + 2;
                    this.current.entry.setTime(ZipUtil.dosToJavaTime(ZipLong.getValue(bArr, i4)));
                    int i5 = i4 + 4;
                    ZipLong zipLong2 = null;
                    ZipLong zipLong3 = null;
                    if (!this.current.hasDataDescriptor) {
                        this.current.entry.setCrc(ZipLong.getValue(bArr, i5));
                        int i6 = i5 + 4;
                        zipLong3 = new ZipLong(bArr, i6);
                        int i7 = i6 + 4;
                        zipLong2 = new ZipLong(bArr, i7);
                        i = i7 + 4;
                    } else {
                        i = i5 + 12;
                    }
                    int value2 = ZipShort.getValue(bArr, i);
                    int value3 = ZipShort.getValue(bArr, i + 2);
                    byte[] bArr2 = new byte[value2];
                    readFully(bArr2);
                    this.current.entry.setName(zipEncoding.decode(bArr2), bArr2);
                    byte[] bArr3 = new byte[value3];
                    readFully(bArr3);
                    this.current.entry.setExtra(bArr3);
                    if (!usesUTF8ForNames && this.useUnicodeExtraFields) {
                        ZipUtil.setNameAndCommentFromExtraFields(this.current.entry, bArr2, null);
                    }
                    processZip64Extra(zipLong2, zipLong3);
                    zipArchiveEntry = this.current.entry;
                }
            } catch (EOFException e) {
                zipArchiveEntry = null;
            }
        }
        return zipArchiveEntry;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        if (this.closed) {
            throw new IOException("The stream is closed");
        }
        if (this.inf.finished() || this.current == null) {
            i3 = -1;
        } else if (i > bArr.length || i2 < 0 || i < 0 || bArr.length - i < i2) {
            throw new ArrayIndexOutOfBoundsException();
        } else {
            ZipUtil.checkRequestedFeatures(this.current.entry);
            if (!supportsDataDescriptorFor(this.current.entry)) {
                throw new UnsupportedZipFeatureException(UnsupportedZipFeatureException.Feature.DATA_DESCRIPTOR, this.current.entry);
            }
            i3 = this.current.entry.getMethod() == 0 ? readStored(bArr, i, i2) : readDeflated(bArr, i, i2);
        }
        return i3;
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        if (j >= 0) {
            long j2 = 0;
            byte[] bArr = new byte[1024];
            while (j2 < j) {
                long j3 = j - j2;
                if (bArr.length <= j3) {
                    j3 = bArr.length;
                }
                int read = read(bArr, 0, (int) j3);
                if (read == -1) {
                    break;
                }
                j2 += read;
            }
            return j2;
        }
        throw new IllegalArgumentException();
    }
}
