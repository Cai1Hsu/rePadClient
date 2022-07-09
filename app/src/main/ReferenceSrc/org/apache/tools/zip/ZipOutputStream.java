package org.apache.tools.zip;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.zip.CRC32;
import java.util.zip.Deflater;
import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/tools/zip/ZipOutputStream.class */
public class ZipOutputStream extends FilterOutputStream {
    private static final int BUFFER_SIZE = 512;
    private static final int BYTE_MASK = 255;
    public static final int DEFAULT_COMPRESSION = -1;
    public static final int DEFLATED = 8;
    private static final int DEFLATER_BLOCK_SIZE = 8192;
    public static final int EFS_FLAG = 2048;
    private static final int SHORT = 2;
    public static final int STORED = 0;
    public static final int UFT8_NAMES_FLAG = 2048;
    private static final int WORD = 4;
    protected byte[] buf;
    private long cdLength;
    private long cdOffset;
    private String comment;
    private final CRC32 crc;
    private UnicodeExtraFieldPolicy createUnicodeExtraFields;
    private long dataStart;
    protected Deflater def;
    private String encoding;
    private final List entries;
    private ZipEntry entry;
    private boolean fallbackToUTF8;
    private boolean hasCompressionLevelChanged;
    private int level;
    private long localDataStart;
    private int method;
    private final Map offsets;
    private RandomAccessFile raf;
    private boolean useUTF8Flag;
    private long written;
    private ZipEncoding zipEncoding;
    static final String DEFAULT_ENCODING = null;
    private static final byte[] ZERO = {0, 0};
    private static final byte[] LZERO = {0, 0, 0, 0};
    protected static final byte[] LFH_SIG = ZipLong.getBytes(67324752);
    protected static final byte[] DD_SIG = ZipLong.getBytes(134695760);
    protected static final byte[] CFH_SIG = ZipLong.getBytes(33639248);
    protected static final byte[] EOCD_SIG = ZipLong.getBytes(101010256);
    private static final byte[] DOS_TIME_MIN = ZipLong.getBytes(8448);

    /* loaded from: classes.jar:org/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy.class */
    public static final class UnicodeExtraFieldPolicy {
        public static final UnicodeExtraFieldPolicy ALWAYS = new UnicodeExtraFieldPolicy("always");
        public static final UnicodeExtraFieldPolicy NEVER = new UnicodeExtraFieldPolicy("never");
        public static final UnicodeExtraFieldPolicy NOT_ENCODEABLE = new UnicodeExtraFieldPolicy("not encodeable");
        private final String name;

        private UnicodeExtraFieldPolicy(String str) {
            this.name = str;
        }

        public String toString() {
            return this.name;
        }
    }

    public ZipOutputStream(File file) throws IOException {
        super(null);
        this.comment = "";
        this.level = -1;
        this.hasCompressionLevelChanged = false;
        this.method = 8;
        this.entries = new LinkedList();
        this.crc = new CRC32();
        this.written = 0L;
        this.dataStart = 0L;
        this.localDataStart = 0L;
        this.cdOffset = 0L;
        this.cdLength = 0L;
        this.offsets = new HashMap();
        this.encoding = null;
        this.zipEncoding = ZipEncodingHelper.getZipEncoding(DEFAULT_ENCODING);
        this.def = new Deflater(this.level, true);
        this.buf = new byte[512];
        this.raf = null;
        this.useUTF8Flag = true;
        this.fallbackToUTF8 = false;
        this.createUnicodeExtraFields = UnicodeExtraFieldPolicy.NEVER;
        try {
            this.raf = new RandomAccessFile(file, "rw");
            this.raf.setLength(0L);
        } catch (IOException e) {
            if (this.raf != null) {
                try {
                    this.raf.close();
                } catch (IOException e2) {
                }
                this.raf = null;
            }
            this.out = new FileOutputStream(file);
        }
    }

    public ZipOutputStream(OutputStream outputStream) {
        super(outputStream);
        this.comment = "";
        this.level = -1;
        this.hasCompressionLevelChanged = false;
        this.method = 8;
        this.entries = new LinkedList();
        this.crc = new CRC32();
        this.written = 0L;
        this.dataStart = 0L;
        this.localDataStart = 0L;
        this.cdOffset = 0L;
        this.cdLength = 0L;
        this.offsets = new HashMap();
        this.encoding = null;
        this.zipEncoding = ZipEncodingHelper.getZipEncoding(DEFAULT_ENCODING);
        this.def = new Deflater(this.level, true);
        this.buf = new byte[512];
        this.raf = null;
        this.useUTF8Flag = true;
        this.fallbackToUTF8 = false;
        this.createUnicodeExtraFields = UnicodeExtraFieldPolicy.NEVER;
    }

    protected static long adjustToLong(int i) {
        return i < 0 ? 4294967296L + i : i;
    }

    private void deflateUntilInputIsNeeded() throws IOException {
        while (!this.def.needsInput()) {
            deflate();
        }
    }

    protected static ZipLong toDosTime(Date date) {
        return new ZipLong(toDosTime(date.getTime()));
    }

    protected static byte[] toDosTime(long j) {
        Date date = new Date(j);
        int year = date.getYear() + 1900;
        return year < 1980 ? DOS_TIME_MIN : ZipLong.getBytes(((year - 1980) << 25) | ((date.getMonth() + 1) << 21) | (date.getDate() << 16) | (date.getHours() << 11) | (date.getMinutes() << 5) | (date.getSeconds() >> 1));
    }

    private void writeVersionNeededToExtractAndGeneralPurposeBits(int i, boolean z) throws IOException {
        int i2 = (this.useUTF8Flag || z) ? 2048 : 0;
        int i3 = i2;
        int i4 = 10;
        if (i == 8) {
            i3 = i2;
            i4 = 10;
            if (this.raf == null) {
                i4 = 20;
                i3 = i2 | 8;
            }
        }
        writeOut(ZipShort.getBytes(i4));
        writeOut(ZipShort.getBytes(i3));
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        finish();
        if (this.raf != null) {
            this.raf.close();
        }
        if (this.out != null) {
            this.out.close();
        }
    }

    public void closeEntry() throws IOException {
        if (this.entry == null) {
            return;
        }
        long value = this.crc.getValue();
        this.crc.reset();
        if (this.entry.getMethod() == 8) {
            this.def.finish();
            while (!this.def.finished()) {
                deflate();
            }
            this.entry.setSize(adjustToLong(this.def.getTotalIn()));
            this.entry.setCompressedSize(adjustToLong(this.def.getTotalOut()));
            this.entry.setCrc(value);
            this.def.reset();
            this.written += this.entry.getCompressedSize();
        } else if (this.raf != null) {
            long j = this.written - this.dataStart;
            this.entry.setSize(j);
            this.entry.setCompressedSize(j);
            this.entry.setCrc(value);
        } else if (this.entry.getCrc() != value) {
            throw new ZipException(new StringBuffer().append("bad CRC checksum for entry ").append(this.entry.getName()).append(": ").append(Long.toHexString(this.entry.getCrc())).append(" instead of ").append(Long.toHexString(value)).toString());
        } else {
            if (this.entry.getSize() != this.written - this.dataStart) {
                throw new ZipException(new StringBuffer().append("bad size for entry ").append(this.entry.getName()).append(": ").append(this.entry.getSize()).append(" instead of ").append(this.written - this.dataStart).toString());
            }
        }
        if (this.raf != null) {
            long filePointer = this.raf.getFilePointer();
            this.raf.seek(this.localDataStart);
            writeOut(ZipLong.getBytes(this.entry.getCrc()));
            writeOut(ZipLong.getBytes(this.entry.getCompressedSize()));
            writeOut(ZipLong.getBytes(this.entry.getSize()));
            this.raf.seek(filePointer);
        }
        writeDataDescriptor(this.entry);
        this.entry = null;
    }

    protected final void deflate() throws IOException {
        int deflate = this.def.deflate(this.buf, 0, this.buf.length);
        if (deflate > 0) {
            writeOut(this.buf, 0, deflate);
        }
    }

    public void finish() throws IOException {
        closeEntry();
        this.cdOffset = this.written;
        for (ZipEntry zipEntry : this.entries) {
            writeCentralFileHeader(zipEntry);
        }
        this.cdLength = this.written - this.cdOffset;
        writeCentralDirectoryEnd();
        this.offsets.clear();
        this.entries.clear();
        this.def.end();
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        if (this.out != null) {
            this.out.flush();
        }
    }

    protected byte[] getBytes(String str) throws ZipException {
        try {
            ByteBuffer encode = ZipEncodingHelper.getZipEncoding(this.encoding).encode(str);
            byte[] bArr = new byte[encode.limit()];
            System.arraycopy(encode.array(), encode.arrayOffset(), bArr, 0, bArr.length);
            return bArr;
        } catch (IOException e) {
            throw new ZipException(new StringBuffer().append("Failed to encode name: ").append(e.getMessage()).toString());
        }
    }

    public String getEncoding() {
        return this.encoding;
    }

    public boolean isSeekable() {
        return this.raf != null;
    }

    public void putNextEntry(ZipEntry zipEntry) throws IOException {
        closeEntry();
        this.entry = zipEntry;
        this.entries.add(this.entry);
        if (this.entry.getMethod() == -1) {
            this.entry.setMethod(this.method);
        }
        if (this.entry.getTime() == -1) {
            this.entry.setTime(System.currentTimeMillis());
        }
        if (this.entry.getMethod() == 0 && this.raf == null) {
            if (this.entry.getSize() == -1) {
                throw new ZipException("uncompressed size is required for STORED method when not writing to a file");
            }
            if (this.entry.getCrc() == -1) {
                throw new ZipException("crc checksum is required for STORED method when not writing to a file");
            }
            this.entry.setCompressedSize(this.entry.getSize());
        }
        if (this.entry.getMethod() == 8 && this.hasCompressionLevelChanged) {
            this.def.setLevel(this.level);
            this.hasCompressionLevelChanged = false;
        }
        writeLocalFileHeader(this.entry);
    }

    public void setComment(String str) {
        this.comment = str;
    }

    public void setCreateUnicodeExtraFields(UnicodeExtraFieldPolicy unicodeExtraFieldPolicy) {
        this.createUnicodeExtraFields = unicodeExtraFieldPolicy;
    }

    public void setEncoding(String str) {
        this.encoding = str;
        this.zipEncoding = ZipEncodingHelper.getZipEncoding(str);
        this.useUTF8Flag &= ZipEncodingHelper.isUTF8(str);
    }

    public void setFallbackToUTF8(boolean z) {
        this.fallbackToUTF8 = z;
    }

    public void setLevel(int i) {
        if (i < -1 || i > 9) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid compression level: ").append(i).toString());
        }
        this.hasCompressionLevelChanged = this.level != i;
        this.level = i;
    }

    public void setMethod(int i) {
        this.method = i;
    }

    public void setUseLanguageEncodingFlag(boolean z) {
        this.useUTF8Flag = z && ZipEncodingHelper.isUTF8(this.encoding);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(int i) throws IOException {
        write(new byte[]{(byte) (i & 255)}, 0, 1);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        if (this.entry.getMethod() != 8) {
            writeOut(bArr, i, i2);
            this.written += i2;
        } else if (i2 > 0 && !this.def.finished()) {
            if (i2 <= 8192) {
                this.def.setInput(bArr, i, i2);
                deflateUntilInputIsNeeded();
            } else {
                int i3 = i2 / 8192;
                for (int i4 = 0; i4 < i3; i4++) {
                    this.def.setInput(bArr, (i4 * 8192) + i, 8192);
                    deflateUntilInputIsNeeded();
                }
                int i5 = i3 * 8192;
                if (i5 < i2) {
                    this.def.setInput(bArr, i + i5, i2 - i5);
                    deflateUntilInputIsNeeded();
                }
            }
        }
        this.crc.update(bArr, i, i2);
    }

    protected void writeCentralDirectoryEnd() throws IOException {
        writeOut(EOCD_SIG);
        writeOut(ZERO);
        writeOut(ZERO);
        byte[] bytes = ZipShort.getBytes(this.entries.size());
        writeOut(bytes);
        writeOut(bytes);
        writeOut(ZipLong.getBytes(this.cdLength));
        writeOut(ZipLong.getBytes(this.cdOffset));
        ByteBuffer encode = this.zipEncoding.encode(this.comment);
        writeOut(ZipShort.getBytes(encode.limit()));
        writeOut(encode.array(), encode.arrayOffset(), encode.limit());
    }

    protected void writeCentralFileHeader(ZipEntry zipEntry) throws IOException {
        writeOut(CFH_SIG);
        this.written += 4;
        writeOut(ZipShort.getBytes((zipEntry.getPlatform() << 8) | 20));
        this.written += 2;
        int method = zipEntry.getMethod();
        boolean canEncode = this.zipEncoding.canEncode(zipEntry.getName());
        writeVersionNeededToExtractAndGeneralPurposeBits(method, !canEncode && this.fallbackToUTF8);
        this.written += 4;
        writeOut(ZipShort.getBytes(method));
        this.written += 2;
        writeOut(toDosTime(zipEntry.getTime()));
        this.written += 4;
        writeOut(ZipLong.getBytes(zipEntry.getCrc()));
        writeOut(ZipLong.getBytes(zipEntry.getCompressedSize()));
        writeOut(ZipLong.getBytes(zipEntry.getSize()));
        this.written += 12;
        ZipEncoding zipEncoding = (canEncode || !this.fallbackToUTF8) ? this.zipEncoding : ZipEncodingHelper.UTF8_ZIP_ENCODING;
        ByteBuffer encode = zipEncoding.encode(zipEntry.getName());
        writeOut(ZipShort.getBytes(encode.limit()));
        this.written += 2;
        byte[] centralDirectoryExtra = zipEntry.getCentralDirectoryExtra();
        writeOut(ZipShort.getBytes(centralDirectoryExtra.length));
        this.written += 2;
        String comment = zipEntry.getComment();
        String str = comment;
        if (comment == null) {
            str = "";
        }
        ByteBuffer encode2 = zipEncoding.encode(str);
        writeOut(ZipShort.getBytes(encode2.limit()));
        this.written += 2;
        writeOut(ZERO);
        this.written += 2;
        writeOut(ZipShort.getBytes(zipEntry.getInternalAttributes()));
        this.written += 2;
        writeOut(ZipLong.getBytes(zipEntry.getExternalAttributes()));
        this.written += 4;
        writeOut((byte[]) this.offsets.get(zipEntry));
        this.written += 4;
        writeOut(encode.array(), encode.arrayOffset(), encode.limit());
        this.written += encode.limit();
        writeOut(centralDirectoryExtra);
        this.written += centralDirectoryExtra.length;
        writeOut(encode2.array(), encode2.arrayOffset(), encode2.limit());
        this.written += encode2.limit();
    }

    protected void writeDataDescriptor(ZipEntry zipEntry) throws IOException {
        if (zipEntry.getMethod() == 8 && this.raf == null) {
            writeOut(DD_SIG);
            writeOut(ZipLong.getBytes(this.entry.getCrc()));
            writeOut(ZipLong.getBytes(this.entry.getCompressedSize()));
            writeOut(ZipLong.getBytes(this.entry.getSize()));
            this.written += 16;
        }
    }

    protected void writeLocalFileHeader(ZipEntry zipEntry) throws IOException {
        boolean canEncode = this.zipEncoding.canEncode(zipEntry.getName());
        ZipEncoding zipEncoding = (canEncode || !this.fallbackToUTF8) ? this.zipEncoding : ZipEncodingHelper.UTF8_ZIP_ENCODING;
        ByteBuffer encode = zipEncoding.encode(zipEntry.getName());
        if (this.createUnicodeExtraFields != UnicodeExtraFieldPolicy.NEVER) {
            if (this.createUnicodeExtraFields == UnicodeExtraFieldPolicy.ALWAYS || !canEncode) {
                zipEntry.addExtraField(new UnicodePathExtraField(zipEntry.getName(), encode.array(), encode.arrayOffset(), encode.limit()));
            }
            String comment = zipEntry.getComment();
            if (comment != null && !"".equals(comment)) {
                boolean canEncode2 = this.zipEncoding.canEncode(comment);
                if (this.createUnicodeExtraFields == UnicodeExtraFieldPolicy.ALWAYS || !canEncode2) {
                    ByteBuffer encode2 = zipEncoding.encode(comment);
                    zipEntry.addExtraField(new UnicodeCommentExtraField(comment, encode2.array(), encode2.arrayOffset(), encode2.limit()));
                }
            }
        }
        this.offsets.put(zipEntry, ZipLong.getBytes(this.written));
        writeOut(LFH_SIG);
        this.written += 4;
        int method = zipEntry.getMethod();
        writeVersionNeededToExtractAndGeneralPurposeBits(method, !canEncode && this.fallbackToUTF8);
        this.written += 4;
        writeOut(ZipShort.getBytes(method));
        this.written += 2;
        writeOut(toDosTime(zipEntry.getTime()));
        this.written += 4;
        this.localDataStart = this.written;
        if (method == 8 || this.raf != null) {
            writeOut(LZERO);
            writeOut(LZERO);
            writeOut(LZERO);
        } else {
            writeOut(ZipLong.getBytes(zipEntry.getCrc()));
            writeOut(ZipLong.getBytes(zipEntry.getSize()));
            writeOut(ZipLong.getBytes(zipEntry.getSize()));
        }
        this.written += 12;
        writeOut(ZipShort.getBytes(encode.limit()));
        this.written += 2;
        byte[] localFileDataExtra = zipEntry.getLocalFileDataExtra();
        writeOut(ZipShort.getBytes(localFileDataExtra.length));
        this.written += 2;
        writeOut(encode.array(), encode.arrayOffset(), encode.limit());
        this.written += encode.limit();
        writeOut(localFileDataExtra);
        this.written += localFileDataExtra.length;
        this.dataStart = this.written;
    }

    protected final void writeOut(byte[] bArr) throws IOException {
        writeOut(bArr, 0, bArr.length);
    }

    protected final void writeOut(byte[] bArr, int i, int i2) throws IOException {
        if (this.raf != null) {
            this.raf.write(bArr, i, i2);
        } else {
            this.out.write(bArr, i, i2);
        }
    }
}
