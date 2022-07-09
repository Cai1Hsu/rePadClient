package org.apache.commons.compress.archivers.zip;

import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;
import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipFile.class */
public class ZipFile {
    static final int BYTE_SHIFT = 8;
    private static final int CFD_LOCATOR_OFFSET = 16;
    private static final int CFH_LEN = 42;
    private static final long CFH_SIG = ZipLong.getValue(ZipArchiveOutputStream.CFH_SIG);
    private static final int HASH_SIZE = 509;
    private static final long LFH_OFFSET_FOR_FILENAME_LENGTH = 26;
    private static final int MAX_EOCD_SIZE = 65557;
    private static final int MIN_EOCD_SIZE = 22;
    static final int NIBLET_MASK = 15;
    private static final int POS_0 = 0;
    private static final int POS_1 = 1;
    private static final int POS_2 = 2;
    private static final int POS_3 = 3;
    private static final int ZIP64_EOCDL_LENGTH = 20;
    private static final int ZIP64_EOCDL_LOCATOR_OFFSET = 8;
    private static final int ZIP64_EOCD_CFD_LOCATOR_OFFSET = 48;
    private final Comparator<ZipArchiveEntry> OFFSET_COMPARATOR;
    private final RandomAccessFile archive;
    private final String archiveName;
    private boolean closed;
    private final String encoding;
    private final Map<ZipArchiveEntry, OffsetEntry> entries;
    private final Map<String, ZipArchiveEntry> nameMap;
    private final boolean useUnicodeExtraFields;
    private final ZipEncoding zipEncoding;

    /* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipFile$BoundedInputStream.class */
    private class BoundedInputStream extends InputStream {
        private boolean addDummyByte = false;
        private long loc;
        private long remaining;

        BoundedInputStream(long j, long j2) {
            ZipFile.this = r5;
            this.remaining = j2;
            this.loc = j;
        }

        void addDummy() {
            this.addDummyByte = true;
        }

        @Override // java.io.InputStream
        public int read() throws IOException {
            int i = 0;
            long j = this.remaining;
            this.remaining = j - 1;
            if (j > 0) {
                synchronized (ZipFile.this.archive) {
                    RandomAccessFile randomAccessFile = ZipFile.this.archive;
                    long j2 = this.loc;
                    this.loc = j2 + 1;
                    randomAccessFile.seek(j2);
                    i = ZipFile.this.archive.read();
                }
            } else if (this.addDummyByte) {
                this.addDummyByte = false;
            } else {
                i = -1;
            }
            return i;
        }

        @Override // java.io.InputStream
        public int read(byte[] bArr, int i, int i2) throws IOException {
            int read;
            int i3 = 0;
            if (this.remaining <= 0) {
                if (this.addDummyByte) {
                    this.addDummyByte = false;
                    bArr[i] = (byte) 0;
                    i3 = 1;
                } else {
                    i3 = -1;
                }
            } else if (i2 > 0) {
                int i4 = i2;
                if (i2 > this.remaining) {
                    i4 = (int) this.remaining;
                }
                synchronized (ZipFile.this.archive) {
                    ZipFile.this.archive.seek(this.loc);
                    read = ZipFile.this.archive.read(bArr, i, i4);
                }
                i3 = read;
                if (read > 0) {
                    this.loc += read;
                    this.remaining -= read;
                    i3 = read;
                }
            }
            return i3;
        }
    }

    /* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipFile$NameAndComment.class */
    private static final class NameAndComment {
        private final byte[] comment;
        private final byte[] name;

        private NameAndComment(byte[] bArr, byte[] bArr2) {
            this.name = bArr;
            this.comment = bArr2;
        }
    }

    /* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry.class */
    private static final class OffsetEntry {
        private long dataOffset;
        private long headerOffset;

        private OffsetEntry() {
            this.headerOffset = -1L;
            this.dataOffset = -1L;
        }
    }

    public ZipFile(File file) throws IOException {
        this(file, "UTF8");
    }

    public ZipFile(File file, String str) throws IOException {
        this(file, str, true);
    }

    public ZipFile(File file, String str, boolean z) throws IOException {
        this.entries = new LinkedHashMap((int) HASH_SIZE);
        this.nameMap = new HashMap((int) HASH_SIZE);
        this.OFFSET_COMPARATOR = new Comparator<ZipArchiveEntry>() { // from class: org.apache.commons.compress.archivers.zip.ZipFile.2
            public int compare(ZipArchiveEntry zipArchiveEntry, ZipArchiveEntry zipArchiveEntry2) {
                int i;
                if (zipArchiveEntry == zipArchiveEntry2) {
                    i = 0;
                } else {
                    OffsetEntry offsetEntry = (OffsetEntry) ZipFile.this.entries.get(zipArchiveEntry);
                    OffsetEntry offsetEntry2 = (OffsetEntry) ZipFile.this.entries.get(zipArchiveEntry2);
                    if (offsetEntry == null) {
                        i = 1;
                    } else if (offsetEntry2 == null) {
                        i = -1;
                    } else {
                        long j = offsetEntry.headerOffset - offsetEntry2.headerOffset;
                        i = j == 0 ? 0 : j < 0 ? -1 : 1;
                    }
                }
                return i;
            }
        };
        this.archiveName = file.getAbsolutePath();
        this.encoding = str;
        this.zipEncoding = ZipEncodingHelper.getZipEncoding(str);
        this.useUnicodeExtraFields = z;
        this.archive = new RandomAccessFile(file, "r");
        try {
            resolveLocalFileHeaderData(populateFromCentralDirectory());
            if (1 != 0) {
                return;
            }
            try {
                this.closed = true;
                this.archive.close();
            } catch (IOException e) {
            }
        } catch (Throwable th) {
            if (0 == 0) {
                try {
                    this.closed = true;
                    this.archive.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    public ZipFile(String str) throws IOException {
        this(new File(str), "UTF8");
    }

    public ZipFile(String str, String str2) throws IOException {
        this(new File(str), str2, true);
    }

    public static void closeQuietly(ZipFile zipFile) {
        if (zipFile != null) {
            try {
                zipFile.close();
            } catch (IOException e) {
            }
        }
    }

    private Map<ZipArchiveEntry, NameAndComment> populateFromCentralDirectory() throws IOException {
        HashMap hashMap = new HashMap();
        positionAtCentralDirectory();
        byte[] bArr = new byte[4];
        this.archive.readFully(bArr);
        long value = ZipLong.getValue(bArr);
        long j = value;
        if (value != CFH_SIG) {
            j = value;
            if (startsWithLocalFileHeader()) {
                throw new IOException("central directory is empty, can't expand corrupt archive.");
            }
        }
        while (j == CFH_SIG) {
            readCentralDirectoryEntry(hashMap);
            this.archive.readFully(bArr);
            j = ZipLong.getValue(bArr);
        }
        return hashMap;
    }

    private void positionAtCentralDirectory() throws IOException {
        if (!tryToLocateSignature(42L, 65577L, ZipArchiveOutputStream.ZIP64_EOCD_LOC_SIG)) {
            positionAtCentralDirectory32();
        } else {
            positionAtCentralDirectory64();
        }
    }

    private void positionAtCentralDirectory32() throws IOException {
        if (!tryToLocateSignature(22L, 65557L, ZipArchiveOutputStream.EOCD_SIG)) {
            throw new ZipException("archive is not a ZIP archive");
        }
        skipBytes(16);
        byte[] bArr = new byte[4];
        this.archive.readFully(bArr);
        this.archive.seek(ZipLong.getValue(bArr));
    }

    private void positionAtCentralDirectory64() throws IOException {
        skipBytes(8);
        byte[] bArr = new byte[8];
        this.archive.readFully(bArr);
        this.archive.seek(ZipEightByteInteger.getLongValue(bArr));
        byte[] bArr2 = new byte[4];
        this.archive.readFully(bArr2);
        if (bArr2[0] == ZipArchiveOutputStream.ZIP64_EOCD_SIG[0] && bArr2[1] == ZipArchiveOutputStream.ZIP64_EOCD_SIG[1] && bArr2[2] == ZipArchiveOutputStream.ZIP64_EOCD_SIG[2] && bArr2[3] == ZipArchiveOutputStream.ZIP64_EOCD_SIG[3]) {
            skipBytes(44);
            byte[] bArr3 = new byte[8];
            this.archive.readFully(bArr3);
            this.archive.seek(ZipEightByteInteger.getLongValue(bArr3));
            return;
        }
        throw new ZipException("archive's ZIP64 end of central directory locator is corrupt.");
    }

    private void readCentralDirectoryEntry(Map<ZipArchiveEntry, NameAndComment> map) throws IOException {
        byte[] bArr = new byte[42];
        this.archive.readFully(bArr);
        ZipArchiveEntry zipArchiveEntry = new ZipArchiveEntry();
        zipArchiveEntry.setPlatform((ZipShort.getValue(bArr, 0) >> 8) & 15);
        int i = 0 + 2 + 2;
        GeneralPurposeBit parse = GeneralPurposeBit.parse(bArr, i);
        boolean usesUTF8ForNames = parse.usesUTF8ForNames();
        ZipEncoding zipEncoding = usesUTF8ForNames ? ZipEncodingHelper.UTF8_ZIP_ENCODING : this.zipEncoding;
        zipArchiveEntry.setGeneralPurposeBit(parse);
        int i2 = i + 2;
        zipArchiveEntry.setMethod(ZipShort.getValue(bArr, i2));
        int i3 = i2 + 2;
        zipArchiveEntry.setTime(ZipUtil.dosToJavaTime(ZipLong.getValue(bArr, i3)));
        int i4 = i3 + 4;
        zipArchiveEntry.setCrc(ZipLong.getValue(bArr, i4));
        int i5 = i4 + 4;
        zipArchiveEntry.setCompressedSize(ZipLong.getValue(bArr, i5));
        int i6 = i5 + 4;
        zipArchiveEntry.setSize(ZipLong.getValue(bArr, i6));
        int i7 = i6 + 4;
        int value = ZipShort.getValue(bArr, i7);
        int i8 = i7 + 2;
        int value2 = ZipShort.getValue(bArr, i8);
        int i9 = i8 + 2;
        int value3 = ZipShort.getValue(bArr, i9);
        int i10 = i9 + 2;
        int value4 = ZipShort.getValue(bArr, i10);
        int i11 = i10 + 2;
        zipArchiveEntry.setInternalAttributes(ZipShort.getValue(bArr, i11));
        int i12 = i11 + 2;
        zipArchiveEntry.setExternalAttributes(ZipLong.getValue(bArr, i12));
        byte[] bArr2 = new byte[value];
        this.archive.readFully(bArr2);
        zipArchiveEntry.setName(zipEncoding.decode(bArr2), bArr2);
        OffsetEntry offsetEntry = new OffsetEntry();
        offsetEntry.headerOffset = ZipLong.getValue(bArr, i12 + 4);
        this.entries.put(zipArchiveEntry, offsetEntry);
        this.nameMap.put(zipArchiveEntry.getName(), zipArchiveEntry);
        byte[] bArr3 = new byte[value2];
        this.archive.readFully(bArr3);
        zipArchiveEntry.setCentralDirectoryExtra(bArr3);
        setSizesAndOffsetFromZip64Extra(zipArchiveEntry, offsetEntry, value4);
        byte[] bArr4 = new byte[value3];
        this.archive.readFully(bArr4);
        zipArchiveEntry.setComment(zipEncoding.decode(bArr4));
        if (usesUTF8ForNames || !this.useUnicodeExtraFields) {
            return;
        }
        map.put(zipArchiveEntry, new NameAndComment(bArr2, bArr4));
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x00af, code lost:
        r0 = new byte[r0];
        r6.archive.readFully(r0);
        r0.setExtra(r0);
        r0.dataOffset = ((((org.apache.commons.compress.archivers.zip.ZipFile.LFH_OFFSET_FOR_FILENAME_LENGTH + r0) + 2) + 2) + r0) + r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x00e8, code lost:
        if (r7.containsKey(r0) == false) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x00eb, code lost:
        r0 = r0.getName();
        r0 = r7.get(r0);
        org.apache.commons.compress.archivers.zip.ZipUtil.setNameAndCommentFromExtraFields(r0, r0.name, r0.comment);
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0118, code lost:
        if (r0.equals(r0.getName()) != false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x011b, code lost:
        r6.nameMap.remove(r0);
        r6.nameMap.put(r0.getName(), r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0138, code lost:
        r6.entries.put(r0, r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void resolveLocalFileHeaderData(Map<ZipArchiveEntry, NameAndComment> map) throws IOException {
        LinkedHashMap linkedHashMap = new LinkedHashMap(this.entries);
        this.entries.clear();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            ZipArchiveEntry zipArchiveEntry = (ZipArchiveEntry) entry.getKey();
            OffsetEntry offsetEntry = (OffsetEntry) entry.getValue();
            long j = offsetEntry.headerOffset;
            this.archive.seek(LFH_OFFSET_FOR_FILENAME_LENGTH + j);
            byte[] bArr = new byte[2];
            this.archive.readFully(bArr);
            int value = ZipShort.getValue(bArr);
            this.archive.readFully(bArr);
            int value2 = ZipShort.getValue(bArr);
            int i = value;
            while (true) {
                int i2 = i;
                if (i2 <= 0) {
                    break;
                }
                int skipBytes = this.archive.skipBytes(i2);
                if (skipBytes <= 0) {
                    throw new IOException("failed to skip file name in local file header");
                }
                i = i2 - skipBytes;
            }
        }
    }

    private void setSizesAndOffsetFromZip64Extra(ZipArchiveEntry zipArchiveEntry, OffsetEntry offsetEntry, int i) throws IOException {
        boolean z = true;
        Zip64ExtendedInformationExtraField zip64ExtendedInformationExtraField = (Zip64ExtendedInformationExtraField) zipArchiveEntry.getExtraField(Zip64ExtendedInformationExtraField.HEADER_ID);
        if (zip64ExtendedInformationExtraField != null) {
            boolean z2 = zipArchiveEntry.getSize() == 4294967295L;
            boolean z3 = zipArchiveEntry.getCompressedSize() == 4294967295L;
            boolean z4 = offsetEntry.headerOffset == 4294967295L;
            if (i != 65535) {
                z = false;
            }
            zip64ExtendedInformationExtraField.reparseCentralDirectoryData(z2, z3, z4, z);
            if (z2) {
                zipArchiveEntry.setSize(zip64ExtendedInformationExtraField.getSize().getLongValue());
            } else if (z3) {
                zip64ExtendedInformationExtraField.setSize(new ZipEightByteInteger(zipArchiveEntry.getSize()));
            }
            if (z3) {
                zipArchiveEntry.setCompressedSize(zip64ExtendedInformationExtraField.getCompressedSize().getLongValue());
            } else if (z2) {
                zip64ExtendedInformationExtraField.setCompressedSize(new ZipEightByteInteger(zipArchiveEntry.getCompressedSize()));
            }
            if (!z4) {
                return;
            }
            offsetEntry.headerOffset = zip64ExtendedInformationExtraField.getRelativeHeaderOffset().getLongValue();
        }
    }

    private void skipBytes(int i) throws IOException {
        int i2 = 0;
        while (true) {
            int i3 = i2;
            if (i3 < i) {
                int skipBytes = this.archive.skipBytes(i - i3);
                if (skipBytes <= 0) {
                    throw new EOFException();
                }
                i2 = i3 + skipBytes;
            } else {
                return;
            }
        }
    }

    private boolean startsWithLocalFileHeader() throws IOException {
        boolean z;
        this.archive.seek(0L);
        byte[] bArr = new byte[4];
        this.archive.readFully(bArr);
        int i = 0;
        while (true) {
            if (i >= bArr.length) {
                z = true;
                break;
            } else if (bArr[i] != ZipArchiveOutputStream.LFH_SIG[i]) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private boolean tryToLocateSignature(long j, long j2, byte[] bArr) throws IOException {
        long length = this.archive.length() - j;
        long max = Math.max(0L, this.archive.length() - j2);
        boolean z = false;
        long j3 = length;
        if (length >= 0) {
            while (true) {
                z = false;
                j3 = length;
                if (length < max) {
                    break;
                }
                this.archive.seek(length);
                int read = this.archive.read();
                if (read != -1) {
                    if (read == bArr[0] && this.archive.read() == bArr[1] && this.archive.read() == bArr[2] && this.archive.read() == bArr[3]) {
                        z = true;
                        j3 = length;
                        break;
                    }
                    length--;
                } else {
                    j3 = length;
                    z = false;
                    break;
                }
            }
        }
        if (z) {
            this.archive.seek(j3);
        }
        return z;
    }

    public boolean canReadEntryData(ZipArchiveEntry zipArchiveEntry) {
        return ZipUtil.canHandleEntryData(zipArchiveEntry);
    }

    public void close() throws IOException {
        this.closed = true;
        this.archive.close();
    }

    protected void finalize() throws Throwable {
        try {
            if (!this.closed) {
                System.err.println("Cleaning up unclosed ZipFile for archive " + this.archiveName);
                close();
            }
        } finally {
            super.finalize();
        }
    }

    public String getEncoding() {
        return this.encoding;
    }

    public Enumeration<ZipArchiveEntry> getEntries() {
        return Collections.enumeration(this.entries.keySet());
    }

    public Enumeration<ZipArchiveEntry> getEntriesInPhysicalOrder() {
        ZipArchiveEntry[] zipArchiveEntryArr = (ZipArchiveEntry[]) this.entries.keySet().toArray(new ZipArchiveEntry[0]);
        Arrays.sort(zipArchiveEntryArr, this.OFFSET_COMPARATOR);
        return Collections.enumeration(Arrays.asList(zipArchiveEntryArr));
    }

    public ZipArchiveEntry getEntry(String str) {
        return this.nameMap.get(str);
    }

    public InputStream getInputStream(ZipArchiveEntry zipArchiveEntry) throws IOException, ZipException {
        InputStream inputStream;
        OffsetEntry offsetEntry = this.entries.get(zipArchiveEntry);
        if (offsetEntry != null) {
            ZipUtil.checkRequestedFeatures(zipArchiveEntry);
            BoundedInputStream boundedInputStream = new BoundedInputStream(offsetEntry.dataOffset, zipArchiveEntry.getCompressedSize());
            inputStream = boundedInputStream;
            switch (zipArchiveEntry.getMethod()) {
                case 0:
                    break;
                default:
                    throw new ZipException("Found unsupported compression method " + zipArchiveEntry.getMethod());
                case 8:
                    boundedInputStream.addDummy();
                    final Inflater inflater = new Inflater(true);
                    inputStream = new InflaterInputStream(boundedInputStream, inflater) { // from class: org.apache.commons.compress.archivers.zip.ZipFile.1
                        @Override // java.util.zip.InflaterInputStream, java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
                        public void close() throws IOException {
                            super.close();
                            inflater.end();
                        }
                    };
                    break;
            }
        } else {
            inputStream = null;
        }
        return inputStream;
    }
}
