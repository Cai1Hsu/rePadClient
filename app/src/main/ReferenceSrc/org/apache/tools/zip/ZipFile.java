package org.apache.tools.zip;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.zip.CRC32;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;
import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/tools/zip/ZipFile.class */
public class ZipFile {
    private static final int BYTE_SHIFT = 8;
    private static final int CFD_LOCATOR_OFFSET = 16;
    private static final int CFH_LEN = 42;
    private static final int HASH_SIZE = 509;
    private static final long LFH_OFFSET_FOR_FILENAME_LENGTH = 26;
    private static final int MAX_EOCD_SIZE = 65557;
    private static final int MIN_EOCD_SIZE = 22;
    private static final int NIBLET_MASK = 15;
    private static final int POS_0 = 0;
    private static final int POS_1 = 1;
    private static final int POS_2 = 2;
    private static final int POS_3 = 3;
    private static final int SHORT = 2;
    private static final int WORD = 4;
    private RandomAccessFile archive;
    private String encoding;
    private final Map entries;
    private final Map nameMap;
    private final boolean useUnicodeExtraFields;
    private final ZipEncoding zipEncoding;

    /* loaded from: classes.jar:org/apache/tools/zip/ZipFile$BoundedInputStream.class */
    private class BoundedInputStream extends InputStream {
        private boolean addDummyByte = false;
        private long loc;
        private long remaining;
        private final ZipFile this$0;

        BoundedInputStream(ZipFile zipFile, long j, long j2) {
            this.this$0 = zipFile;
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
                synchronized (this.this$0.archive) {
                    RandomAccessFile randomAccessFile = this.this$0.archive;
                    long j2 = this.loc;
                    this.loc = j2 + 1;
                    randomAccessFile.seek(j2);
                    i = this.this$0.archive.read();
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
                synchronized (this.this$0.archive) {
                    this.this$0.archive.seek(this.loc);
                    read = this.this$0.archive.read(bArr, i, i4);
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

    /* loaded from: classes.jar:org/apache/tools/zip/ZipFile$NameAndComment.class */
    private static final class NameAndComment {
        private final byte[] comment;
        private final byte[] name;

        private NameAndComment(byte[] bArr, byte[] bArr2) {
            this.name = bArr;
            this.comment = bArr2;
        }

        NameAndComment(byte[] bArr, byte[] bArr2, AnonymousClass1 anonymousClass1) {
            this(bArr, bArr2);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/zip/ZipFile$OffsetEntry.class */
    private static final class OffsetEntry {
        private long dataOffset;
        private long headerOffset;

        private OffsetEntry() {
            this.headerOffset = -1L;
            this.dataOffset = -1L;
        }

        OffsetEntry(AnonymousClass1 anonymousClass1) {
            this();
        }
    }

    public ZipFile(File file) throws IOException {
        this(file, (String) null);
    }

    public ZipFile(File file, String str) throws IOException {
        this(file, str, true);
    }

    public ZipFile(File file, String str, boolean z) throws IOException {
        this.entries = new HashMap((int) HASH_SIZE);
        this.nameMap = new HashMap((int) HASH_SIZE);
        this.encoding = null;
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
                this.archive.close();
            } catch (IOException e) {
            }
        } catch (Throwable th) {
            if (0 == 0) {
                try {
                    this.archive.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    public ZipFile(String str) throws IOException {
        this(new File(str), (String) null);
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

    private static long dosToJavaTime(long j) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(1, ((int) ((j >> 25) & 127)) + 1980);
        calendar.set(2, ((int) ((j >> 21) & 15)) - 1);
        calendar.set(5, ((int) (j >> 16)) & 31);
        calendar.set(11, ((int) (j >> 11)) & 31);
        calendar.set(12, ((int) (j >> 5)) & 63);
        calendar.set(13, ((int) (j << 1)) & 62);
        return calendar.getTime().getTime();
    }

    protected static Date fromDosTime(ZipLong zipLong) {
        return new Date(dosToJavaTime(zipLong.getValue()));
    }

    private String getUnicodeStringIfOriginalMatches(AbstractUnicodeExtraField abstractUnicodeExtraField, byte[] bArr) {
        String str = null;
        if (abstractUnicodeExtraField != null) {
            CRC32 crc32 = new CRC32();
            crc32.update(bArr);
            str = null;
            if (crc32.getValue() == abstractUnicodeExtraField.getNameCRC32()) {
                try {
                    str = ZipEncodingHelper.UTF8_ZIP_ENCODING.decode(abstractUnicodeExtraField.getUnicodeName());
                } catch (IOException e) {
                    str = null;
                }
            }
        }
        return str;
    }

    private Map populateFromCentralDirectory() throws IOException {
        HashMap hashMap = new HashMap();
        positionAtCentralDirectory();
        byte[] bArr = new byte[42];
        byte[] bArr2 = new byte[4];
        this.archive.readFully(bArr2);
        long value = ZipLong.getValue(bArr2);
        long value2 = ZipLong.getValue(ZipOutputStream.CFH_SIG);
        long j = value;
        if (value != value2) {
            j = value;
            if (startsWithLocalFileHeader()) {
                throw new IOException("central directory is empty, can't expand corrupt archive.");
            }
        }
        while (j == value2) {
            this.archive.readFully(bArr);
            ZipEntry zipEntry = new ZipEntry();
            zipEntry.setPlatform((ZipShort.getValue(bArr, 0) >> 8) & 15);
            int i = 0 + 2 + 2;
            boolean z = (ZipShort.getValue(bArr, i) & 2048) != 0;
            ZipEncoding zipEncoding = z ? ZipEncodingHelper.UTF8_ZIP_ENCODING : this.zipEncoding;
            int i2 = i + 2;
            zipEntry.setMethod(ZipShort.getValue(bArr, i2));
            int i3 = i2 + 2;
            zipEntry.setTime(dosToJavaTime(ZipLong.getValue(bArr, i3)));
            int i4 = i3 + 4;
            zipEntry.setCrc(ZipLong.getValue(bArr, i4));
            int i5 = i4 + 4;
            zipEntry.setCompressedSize(ZipLong.getValue(bArr, i5));
            int i6 = i5 + 4;
            zipEntry.setSize(ZipLong.getValue(bArr, i6));
            int i7 = i6 + 4;
            int value3 = ZipShort.getValue(bArr, i7);
            int i8 = i7 + 2;
            int value4 = ZipShort.getValue(bArr, i8);
            int i9 = i8 + 2;
            int value5 = ZipShort.getValue(bArr, i9);
            int i10 = i9 + 2 + 2;
            zipEntry.setInternalAttributes(ZipShort.getValue(bArr, i10));
            int i11 = i10 + 2;
            zipEntry.setExternalAttributes(ZipLong.getValue(bArr, i11));
            byte[] bArr3 = new byte[value3];
            this.archive.readFully(bArr3);
            zipEntry.setName(zipEncoding.decode(bArr3));
            OffsetEntry offsetEntry = new OffsetEntry(null);
            offsetEntry.headerOffset = ZipLong.getValue(bArr, i11 + 4);
            this.entries.put(zipEntry, offsetEntry);
            this.nameMap.put(zipEntry.getName(), zipEntry);
            byte[] bArr4 = new byte[value4];
            this.archive.readFully(bArr4);
            zipEntry.setCentralDirectoryExtra(bArr4);
            byte[] bArr5 = new byte[value5];
            this.archive.readFully(bArr5);
            zipEntry.setComment(zipEncoding.decode(bArr5));
            this.archive.readFully(bArr2);
            long value6 = ZipLong.getValue(bArr2);
            j = value6;
            if (!z) {
                j = value6;
                if (this.useUnicodeExtraFields) {
                    hashMap.put(zipEntry, new NameAndComment(bArr3, bArr5, null));
                    j = value6;
                }
            }
        }
        return hashMap;
    }

    private void positionAtCentralDirectory() throws IOException {
        long length = this.archive.length() - 22;
        long max = Math.max(0L, this.archive.length() - 65557);
        boolean z = false;
        long j = length;
        if (length >= 0) {
            byte[] bArr = ZipOutputStream.EOCD_SIG;
            while (true) {
                z = false;
                j = length;
                if (length < max) {
                    break;
                }
                this.archive.seek(length);
                int read = this.archive.read();
                if (read != -1) {
                    if (read == bArr[0] && this.archive.read() == bArr[1] && this.archive.read() == bArr[2] && this.archive.read() == bArr[3]) {
                        z = true;
                        j = length;
                        break;
                    }
                    length--;
                } else {
                    j = length;
                    z = false;
                    break;
                }
            }
        }
        if (!z) {
            throw new ZipException("archive is not a ZIP archive");
        }
        this.archive.seek(16 + j);
        byte[] bArr2 = new byte[4];
        this.archive.readFully(bArr2);
        this.archive.seek(ZipLong.getValue(bArr2));
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x009d, code lost:
        r0 = new byte[r0];
        r6.archive.readFully(r0);
        r0.setExtra(r0);
        r0.dataOffset = ((((org.apache.tools.zip.ZipFile.LFH_OFFSET_FOR_FILENAME_LENGTH + r0) + 2) + 2) + r0) + r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x00d5, code lost:
        if (r7.containsKey(r0) == false) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x00d8, code lost:
        r6.entries.remove(r0);
        setNameAndCommentFromExtraFields(r0, (org.apache.tools.zip.ZipFile.NameAndComment) r7.get(r0));
        r6.entries.put(r0, r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void resolveLocalFileHeaderData(Map map) throws IOException {
        Enumeration enumeration = Collections.enumeration(new HashSet(this.entries.keySet()));
        while (enumeration.hasMoreElements()) {
            ZipEntry zipEntry = (ZipEntry) enumeration.nextElement();
            OffsetEntry offsetEntry = (OffsetEntry) this.entries.get(zipEntry);
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
                    throw new RuntimeException("failed to skip file name in local file header");
                }
                i = i2 - skipBytes;
            }
        }
    }

    private void setNameAndCommentFromExtraFields(ZipEntry zipEntry, NameAndComment nameAndComment) {
        String unicodeStringIfOriginalMatches;
        UnicodePathExtraField unicodePathExtraField = (UnicodePathExtraField) zipEntry.getExtraField(UnicodePathExtraField.UPATH_ID);
        String name = zipEntry.getName();
        String unicodeStringIfOriginalMatches2 = getUnicodeStringIfOriginalMatches(unicodePathExtraField, nameAndComment.name);
        if (unicodeStringIfOriginalMatches2 != null && !name.equals(unicodeStringIfOriginalMatches2)) {
            zipEntry.setName(unicodeStringIfOriginalMatches2);
            this.nameMap.remove(name);
            this.nameMap.put(unicodeStringIfOriginalMatches2, zipEntry);
        }
        if (nameAndComment.comment == null || nameAndComment.comment.length <= 0 || (unicodeStringIfOriginalMatches = getUnicodeStringIfOriginalMatches((UnicodeCommentExtraField) zipEntry.getExtraField(UnicodeCommentExtraField.UCOM_ID), nameAndComment.comment)) == null) {
            return;
        }
        zipEntry.setComment(unicodeStringIfOriginalMatches);
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
            } else if (bArr[i] != ZipOutputStream.LFH_SIG[i]) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public void close() throws IOException {
        this.archive.close();
    }

    public String getEncoding() {
        return this.encoding;
    }

    public Enumeration getEntries() {
        return Collections.enumeration(this.entries.keySet());
    }

    public ZipEntry getEntry(String str) {
        return (ZipEntry) this.nameMap.get(str);
    }

    public InputStream getInputStream(ZipEntry zipEntry) throws IOException, ZipException {
        InputStream inputStream;
        OffsetEntry offsetEntry = (OffsetEntry) this.entries.get(zipEntry);
        if (offsetEntry != null) {
            BoundedInputStream boundedInputStream = new BoundedInputStream(this, offsetEntry.dataOffset, zipEntry.getCompressedSize());
            inputStream = boundedInputStream;
            switch (zipEntry.getMethod()) {
                case 0:
                    break;
                default:
                    throw new ZipException(new StringBuffer().append("Found unsupported compression method ").append(zipEntry.getMethod()).toString());
                case 8:
                    boundedInputStream.addDummy();
                    Inflater inflater = new Inflater(true);
                    inputStream = new InflaterInputStream(this, boundedInputStream, inflater, inflater) { // from class: org.apache.tools.zip.ZipFile.1
                        private final ZipFile this$0;
                        private final Inflater val$inflater;

                        {
                            this.this$0 = this;
                            this.val$inflater = inflater;
                        }

                        @Override // java.util.zip.InflaterInputStream, java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
                        public void close() throws IOException {
                            super.close();
                            this.val$inflater.end();
                        }
                    };
                    break;
            }
        } else {
            inputStream = null;
        }
        return inputStream;
    }

    protected String getString(byte[] bArr) throws ZipException {
        try {
            return ZipEncodingHelper.getZipEncoding(this.encoding).decode(bArr);
        } catch (IOException e) {
            throw new ZipException(new StringBuffer().append("Failed to decode name: ").append(e.getMessage()).toString());
        }
    }
}
