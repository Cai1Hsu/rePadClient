package org.apache.commons.compress.archivers.zip;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/UnparseableExtraFieldData.class */
public final class UnparseableExtraFieldData implements ZipExtraField {
    private static final ZipShort HEADER_ID = new ZipShort(44225);
    private byte[] centralDirectoryData;
    private byte[] localFileData;

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public byte[] getCentralDirectoryData() {
        return this.centralDirectoryData == null ? getLocalFileDataData() : ZipUtil.copy(this.centralDirectoryData);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getCentralDirectoryLength() {
        return this.centralDirectoryData == null ? getLocalFileDataLength() : new ZipShort(this.centralDirectoryData.length);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getHeaderId() {
        return HEADER_ID;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public byte[] getLocalFileDataData() {
        return ZipUtil.copy(this.localFileData);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getLocalFileDataLength() {
        return new ZipShort(this.localFileData == null ? 0 : this.localFileData.length);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public void parseFromCentralDirectoryData(byte[] bArr, int i, int i2) {
        this.centralDirectoryData = new byte[i2];
        System.arraycopy(bArr, i, this.centralDirectoryData, 0, i2);
        if (this.localFileData == null) {
            parseFromLocalFileData(bArr, i, i2);
        }
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public void parseFromLocalFileData(byte[] bArr, int i, int i2) {
        this.localFileData = new byte[i2];
        System.arraycopy(bArr, i, this.localFileData, 0, i2);
    }
}
