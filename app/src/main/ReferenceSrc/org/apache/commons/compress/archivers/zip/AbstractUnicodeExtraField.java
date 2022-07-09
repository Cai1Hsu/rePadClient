package org.apache.commons.compress.archivers.zip;

import java.io.UnsupportedEncodingException;
import java.util.zip.CRC32;
import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField.class */
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

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public byte[] getCentralDirectoryData() {
        if (this.data == null) {
            assembleData();
        }
        byte[] bArr = null;
        if (this.data != null) {
            bArr = new byte[this.data.length];
            System.arraycopy(this.data, 0, bArr, 0, bArr.length);
        }
        return bArr;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getCentralDirectoryLength() {
        if (this.data == null) {
            assembleData();
        }
        return new ZipShort(this.data.length);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public byte[] getLocalFileDataData() {
        return getCentralDirectoryData();
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getLocalFileDataLength() {
        return getCentralDirectoryLength();
    }

    public long getNameCRC32() {
        return this.nameCRC32;
    }

    public byte[] getUnicodeName() {
        byte[] bArr = null;
        if (this.unicodeName != null) {
            bArr = new byte[this.unicodeName.length];
            System.arraycopy(this.unicodeName, 0, bArr, 0, bArr.length);
        }
        return bArr;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public void parseFromCentralDirectoryData(byte[] bArr, int i, int i2) throws ZipException {
        parseFromLocalFileData(bArr, i, i2);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public void parseFromLocalFileData(byte[] bArr, int i, int i2) throws ZipException {
        if (i2 < 5) {
            throw new ZipException("UniCode path extra data must have at least 5 bytes.");
        }
        byte b = bArr[i];
        if (b != 1) {
            throw new ZipException("Unsupported version [" + ((int) b) + "] for UniCode path extra data.");
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
        if (bArr != null) {
            this.unicodeName = new byte[bArr.length];
            System.arraycopy(bArr, 0, this.unicodeName, 0, bArr.length);
        } else {
            this.unicodeName = null;
        }
        this.data = null;
    }
}
