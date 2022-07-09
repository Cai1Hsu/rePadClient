package org.apache.tools.zip;

import java.io.UnsupportedEncodingException;
import java.util.zip.CRC32;
import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/tools/zip/AbstractUnicodeExtraField.class */
public abstract class AbstractUnicodeExtraField implements ZipExtraField {
    private byte[] data;
    private long nameCRC32;
    private byte[] unicodeName;

    protected AbstractUnicodeExtraField() {
    }

    protected AbstractUnicodeExtraField(String str, byte[] bArr) {
        this(str, bArr, 0, bArr.length);
    }

    protected AbstractUnicodeExtraField(String str, byte[] bArr, int i, int i2) {
        CRC32 crc32 = new CRC32();
        crc32.update(bArr, i, i2);
        this.nameCRC32 = crc32.getValue();
        try {
            this.unicodeName = str.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("FATAL: UTF-8 encoding not supported.", e);
        }
    }

    private void assembleData() {
        if (this.unicodeName == null) {
            return;
        }
        this.data = new byte[this.unicodeName.length + 5];
        this.data[0] = (byte) 1;
        System.arraycopy(ZipLong.getBytes(this.nameCRC32), 0, this.data, 1, 4);
        System.arraycopy(this.unicodeName, 0, this.data, 5, this.unicodeName.length);
    }

    @Override // org.apache.tools.zip.ZipExtraField
    public byte[] getCentralDirectoryData() {
        if (this.data == null) {
            assembleData();
        }
        return this.data;
    }

    @Override // org.apache.tools.zip.ZipExtraField
    public ZipShort getCentralDirectoryLength() {
        if (this.data == null) {
            assembleData();
        }
        return new ZipShort(this.data.length);
    }

    @Override // org.apache.tools.zip.ZipExtraField
    public byte[] getLocalFileDataData() {
        return getCentralDirectoryData();
    }

    @Override // org.apache.tools.zip.ZipExtraField
    public ZipShort getLocalFileDataLength() {
        return getCentralDirectoryLength();
    }

    public long getNameCRC32() {
        return this.nameCRC32;
    }

    public byte[] getUnicodeName() {
        return this.unicodeName;
    }

    @Override // org.apache.tools.zip.ZipExtraField
    public void parseFromLocalFileData(byte[] bArr, int i, int i2) throws ZipException {
        if (i2 < 5) {
            throw new ZipException("UniCode path extra data must have at least 5 bytes.");
        }
        byte b = bArr[i];
        if (b != 1) {
            throw new ZipException(new StringBuffer().append("Unsupported version [").append((int) b).append("] for UniCode path extra data.").toString());
        }
        this.nameCRC32 = ZipLong.getValue(bArr, i + 1);
        this.unicodeName = new byte[i2 - 5];
        System.arraycopy(bArr, i + 5, this.unicodeName, 0, i2 - 5);
        this.data = null;
    }

    public void setNameCRC32(long j) {
        this.nameCRC32 = j;
        this.data = null;
    }

    public void setUnicodeName(byte[] bArr) {
        this.unicodeName = bArr;
        this.data = null;
    }
}
