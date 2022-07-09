package org.apache.commons.compress.archivers.tar;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.ArchiveOutputStream;
import org.apache.commons.compress.archivers.zip.ZipEncoding;
import org.apache.commons.compress.archivers.zip.ZipEncodingHelper;
import org.apache.commons.compress.utils.CountingOutputStream;
import org.apache.http.protocol.HTTP;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/tar/TarArchiveOutputStream.class */
public class TarArchiveOutputStream extends ArchiveOutputStream {
    private static final ZipEncoding ASCII = ZipEncodingHelper.getZipEncoding(HTTP.ASCII);
    public static final int BIGNUMBER_ERROR = 0;
    public static final int BIGNUMBER_POSIX = 2;
    public static final int BIGNUMBER_STAR = 1;
    public static final int LONGFILE_ERROR = 0;
    public static final int LONGFILE_GNU = 2;
    public static final int LONGFILE_POSIX = 3;
    public static final int LONGFILE_TRUNCATE = 1;
    private boolean addPaxHeadersForNonAsciiNames;
    private final byte[] assemBuf;
    private int assemLen;
    private int bigNumberMode;
    protected final TarBuffer buffer;
    private boolean closed;
    private long currBytes;
    private String currName;
    private long currSize;
    private final ZipEncoding encoding;
    private boolean finished;
    private boolean haveUnclosedEntry;
    private int longFileMode;
    private final OutputStream out;
    private final byte[] recordBuf;

    public TarArchiveOutputStream(OutputStream outputStream) {
        this(outputStream, 10240, 512);
    }

    public TarArchiveOutputStream(OutputStream outputStream, int i) {
        this(outputStream, i, 512);
    }

    public TarArchiveOutputStream(OutputStream outputStream, int i, int i2) {
        this(outputStream, i, i2, null);
    }

    public TarArchiveOutputStream(OutputStream outputStream, int i, int i2, String str) {
        this.longFileMode = 0;
        this.bigNumberMode = 0;
        this.closed = false;
        this.haveUnclosedEntry = false;
        this.finished = false;
        this.addPaxHeadersForNonAsciiNames = false;
        this.out = new CountingOutputStream(outputStream);
        this.encoding = ZipEncodingHelper.getZipEncoding(str);
        this.buffer = new TarBuffer(this.out, i, i2);
        this.assemLen = 0;
        this.assemBuf = new byte[i2];
        this.recordBuf = new byte[i2];
    }

    public TarArchiveOutputStream(OutputStream outputStream, int i, String str) {
        this(outputStream, i, 512, str);
    }

    public TarArchiveOutputStream(OutputStream outputStream, String str) {
        this(outputStream, 10240, 512, str);
    }

    private void addPaxHeaderForBigNumber(Map<String, String> map, String str, long j, long j2) {
        if (j < 0 || j > j2) {
            map.put(str, String.valueOf(j));
        }
    }

    private void addPaxHeadersForBigNumbers(Map<String, String> map, TarArchiveEntry tarArchiveEntry) {
        addPaxHeaderForBigNumber(map, "size", tarArchiveEntry.getSize(), 8589934591L);
        addPaxHeaderForBigNumber(map, "gid", tarArchiveEntry.getGroupId(), TarConstants.MAXID);
        addPaxHeaderForBigNumber(map, "mtime", tarArchiveEntry.getModTime().getTime() / 1000, 8589934591L);
        addPaxHeaderForBigNumber(map, "uid", tarArchiveEntry.getUserId(), TarConstants.MAXID);
        addPaxHeaderForBigNumber(map, "SCHILY.devmajor", tarArchiveEntry.getDevMajor(), TarConstants.MAXID);
        addPaxHeaderForBigNumber(map, "SCHILY.devminor", tarArchiveEntry.getDevMinor(), TarConstants.MAXID);
        failForBigNumber("mode", tarArchiveEntry.getMode(), TarConstants.MAXID);
    }

    private void failForBigNumber(String str, long j, long j2) {
        if (j < 0 || j > j2) {
            throw new RuntimeException(str + " '" + j + "' is too big ( > " + j2 + " )");
        }
    }

    private void failForBigNumbers(TarArchiveEntry tarArchiveEntry) {
        failForBigNumber("entry size", tarArchiveEntry.getSize(), 8589934591L);
        failForBigNumber("group id", tarArchiveEntry.getGroupId(), TarConstants.MAXID);
        failForBigNumber("last modification time", tarArchiveEntry.getModTime().getTime() / 1000, 8589934591L);
        failForBigNumber("user id", tarArchiveEntry.getUserId(), TarConstants.MAXID);
        failForBigNumber("mode", tarArchiveEntry.getMode(), TarConstants.MAXID);
        failForBigNumber("major device number", tarArchiveEntry.getDevMajor(), TarConstants.MAXID);
        failForBigNumber("minor device number", tarArchiveEntry.getDevMinor(), TarConstants.MAXID);
    }

    private String stripTo7Bits(String str) {
        int length = str.length();
        StringBuffer stringBuffer = new StringBuffer(length);
        for (int i = 0; i < length; i++) {
            char charAt = (char) (str.charAt(i) & 127);
            if (charAt != 0) {
                stringBuffer.append(charAt);
            }
        }
        return stringBuffer.toString();
    }

    private void writeEOFRecord() throws IOException {
        for (int i = 0; i < this.recordBuf.length; i++) {
            this.recordBuf[i] = (byte) 0;
        }
        this.buffer.writeRecord(this.recordBuf);
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.finished) {
            finish();
        }
        if (!this.closed) {
            this.buffer.close();
            this.out.close();
            this.closed = true;
        }
    }

    @Override // org.apache.commons.compress.archivers.ArchiveOutputStream
    public void closeArchiveEntry() throws IOException {
        if (this.finished) {
            throw new IOException("Stream has already been finished");
        }
        if (!this.haveUnclosedEntry) {
            throw new IOException("No current entry to close");
        }
        if (this.assemLen > 0) {
            for (int i = this.assemLen; i < this.assemBuf.length; i++) {
                this.assemBuf[i] = (byte) 0;
            }
            this.buffer.writeRecord(this.assemBuf);
            this.currBytes += this.assemLen;
            this.assemLen = 0;
        }
        if (this.currBytes < this.currSize) {
            throw new IOException("entry '" + this.currName + "' closed at '" + this.currBytes + "' before the '" + this.currSize + "' bytes specified in the header were written");
        }
        this.haveUnclosedEntry = false;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveOutputStream
    public ArchiveEntry createArchiveEntry(File file, String str) throws IOException {
        if (this.finished) {
            throw new IOException("Stream has already been finished");
        }
        return new TarArchiveEntry(file, str);
    }

    @Override // org.apache.commons.compress.archivers.ArchiveOutputStream
    public void finish() throws IOException {
        if (this.finished) {
            throw new IOException("This archive has already been finished");
        }
        if (this.haveUnclosedEntry) {
            throw new IOException("This archives contains unclosed entries.");
        }
        writeEOFRecord();
        writeEOFRecord();
        this.buffer.flushBlock();
        this.finished = true;
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
    }

    @Override // org.apache.commons.compress.archivers.ArchiveOutputStream
    public long getBytesWritten() {
        return ((CountingOutputStream) this.out).getBytesWritten();
    }

    @Override // org.apache.commons.compress.archivers.ArchiveOutputStream
    @Deprecated
    public int getCount() {
        return (int) getBytesWritten();
    }

    public int getRecordSize() {
        return this.buffer.getRecordSize();
    }

    @Override // org.apache.commons.compress.archivers.ArchiveOutputStream
    public void putArchiveEntry(ArchiveEntry archiveEntry) throws IOException {
        boolean z = false;
        if (this.finished) {
            throw new IOException("Stream has already been finished");
        }
        TarArchiveEntry tarArchiveEntry = (TarArchiveEntry) archiveEntry;
        Map<String, String> hashMap = new HashMap<>();
        String name = tarArchiveEntry.getName();
        byte[] array = this.encoding.encode(name).array();
        boolean z2 = false;
        if (array.length >= 100) {
            if (this.longFileMode == 3) {
                hashMap.put("path", name);
                z2 = true;
            } else if (this.longFileMode == 2) {
                TarArchiveEntry tarArchiveEntry2 = new TarArchiveEntry("././@LongLink", (byte) 76);
                tarArchiveEntry2.setSize(array.length + 1);
                putArchiveEntry(tarArchiveEntry2);
                write(array);
                write(0);
                closeArchiveEntry();
                z2 = false;
            } else {
                z2 = false;
                if (this.longFileMode != 1) {
                    throw new RuntimeException("file name '" + name + "' is too long ( > 100 bytes)");
                }
            }
        }
        if (this.bigNumberMode == 2) {
            addPaxHeadersForBigNumbers(hashMap, tarArchiveEntry);
        } else if (this.bigNumberMode != 1) {
            failForBigNumbers(tarArchiveEntry);
        }
        if (this.addPaxHeadersForNonAsciiNames && !z2 && !ASCII.canEncode(name)) {
            hashMap.put("path", name);
        }
        if (this.addPaxHeadersForNonAsciiNames && ((tarArchiveEntry.isLink() || tarArchiveEntry.isSymbolicLink()) && !ASCII.canEncode(tarArchiveEntry.getLinkName()))) {
            hashMap.put("linkpath", tarArchiveEntry.getLinkName());
        }
        if (hashMap.size() > 0) {
            writePaxHeaders(name, hashMap);
        }
        byte[] bArr = this.recordBuf;
        ZipEncoding zipEncoding = this.encoding;
        if (this.bigNumberMode == 1) {
            z = true;
        }
        tarArchiveEntry.writeEntryHeader(bArr, zipEncoding, z);
        this.buffer.writeRecord(this.recordBuf);
        this.currBytes = 0L;
        if (tarArchiveEntry.isDirectory()) {
            this.currSize = 0L;
        } else {
            this.currSize = tarArchiveEntry.getSize();
        }
        this.currName = name;
        this.haveUnclosedEntry = true;
    }

    public void setAddPaxHeadersForNonAsciiNames(boolean z) {
        this.addPaxHeadersForNonAsciiNames = z;
    }

    public void setBigNumberMode(int i) {
        this.bigNumberMode = i;
    }

    public void setLongFileMode(int i) {
        this.longFileMode = i;
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        if (this.currBytes + i2 > this.currSize) {
            throw new IOException("request to write '" + i2 + "' bytes exceeds size in header of '" + this.currSize + "' bytes for entry '" + this.currName + "'");
        }
        int i3 = i;
        int i4 = i2;
        if (this.assemLen > 0) {
            if (this.assemLen + i2 >= this.recordBuf.length) {
                int length = this.recordBuf.length - this.assemLen;
                System.arraycopy(this.assemBuf, 0, this.recordBuf, 0, this.assemLen);
                System.arraycopy(bArr, i, this.recordBuf, this.assemLen, length);
                this.buffer.writeRecord(this.recordBuf);
                this.currBytes += this.recordBuf.length;
                i3 = i + length;
                i4 = i2 - length;
                this.assemLen = 0;
            } else {
                System.arraycopy(bArr, i, this.assemBuf, this.assemLen, i2);
                i3 = i + i2;
                this.assemLen += i2;
                i4 = 0;
            }
        }
        while (i4 > 0) {
            if (i4 < this.recordBuf.length) {
                System.arraycopy(bArr, i3, this.assemBuf, this.assemLen, i4);
                this.assemLen += i4;
                return;
            }
            this.buffer.writeRecord(bArr, i3);
            int length2 = this.recordBuf.length;
            this.currBytes += length2;
            i4 -= length2;
            i3 += length2;
        }
    }

    void writePaxHeaders(String str, Map<String, String> map) throws IOException {
        String str2 = "./PaxHeaders.X/" + stripTo7Bits(str);
        String str3 = str2;
        if (str2.length() >= 100) {
            str3 = str2.substring(0, 99);
        }
        TarArchiveEntry tarArchiveEntry = new TarArchiveEntry(str3, (byte) 120);
        StringWriter stringWriter = new StringWriter();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            int length = key.length() + value.length() + 3 + 2;
            String str4 = length + " " + key + "=" + value + "\n";
            int length2 = str4.getBytes("UTF-8").length;
            while (true) {
                int i = length2;
                if (length != i) {
                    length = i;
                    str4 = length + " " + key + "=" + value + "\n";
                    length2 = str4.getBytes("UTF-8").length;
                }
            }
            stringWriter.write(str4);
        }
        byte[] bytes = stringWriter.toString().getBytes("UTF-8");
        tarArchiveEntry.setSize(bytes.length);
        putArchiveEntry(tarArchiveEntry);
        write(bytes);
        closeArchiveEntry();
    }
}
