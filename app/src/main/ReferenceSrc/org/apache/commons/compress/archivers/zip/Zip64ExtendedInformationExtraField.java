package org.apache.commons.compress.archivers.zip;

import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField.class */
public class Zip64ExtendedInformationExtraField implements ZipExtraField {
    static final ZipShort HEADER_ID = new ZipShort(1);
    private static final String LFH_MUST_HAVE_BOTH_SIZES_MSG = "Zip64 extended information must contain both size values in the local file header.";
    private ZipEightByteInteger compressedSize;
    private ZipLong diskStart;
    private byte[] rawCentralDirectoryData;
    private ZipEightByteInteger relativeHeaderOffset;
    private ZipEightByteInteger size;

    public Zip64ExtendedInformationExtraField() {
    }

    public Zip64ExtendedInformationExtraField(ZipEightByteInteger zipEightByteInteger, ZipEightByteInteger zipEightByteInteger2) {
        this(zipEightByteInteger, zipEightByteInteger2, null, null);
    }

    public Zip64ExtendedInformationExtraField(ZipEightByteInteger zipEightByteInteger, ZipEightByteInteger zipEightByteInteger2, ZipEightByteInteger zipEightByteInteger3, ZipLong zipLong) {
        this.size = zipEightByteInteger;
        this.compressedSize = zipEightByteInteger2;
        this.relativeHeaderOffset = zipEightByteInteger3;
        this.diskStart = zipLong;
    }

    private int addSizes(byte[] bArr) {
        int i = 0;
        if (this.size != null) {
            System.arraycopy(this.size.getBytes(), 0, bArr, 0, 8);
            i = 0 + 8;
        }
        int i2 = i;
        if (this.compressedSize != null) {
            System.arraycopy(this.compressedSize.getBytes(), 0, bArr, i, 8);
            i2 = i + 8;
        }
        return i2;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public byte[] getCentralDirectoryData() {
        byte[] bArr = new byte[getCentralDirectoryLength().getValue()];
        int addSizes = addSizes(bArr);
        int i = addSizes;
        if (this.relativeHeaderOffset != null) {
            System.arraycopy(this.relativeHeaderOffset.getBytes(), 0, bArr, addSizes, 8);
            i = addSizes + 8;
        }
        if (this.diskStart != null) {
            System.arraycopy(this.diskStart.getBytes(), 0, bArr, i, 4);
        }
        return bArr;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getCentralDirectoryLength() {
        int i = 8;
        int i2 = 0;
        int i3 = this.size != null ? 8 : 0;
        int i4 = this.compressedSize != null ? 8 : 0;
        if (this.relativeHeaderOffset == null) {
            i = 0;
        }
        if (this.diskStart != null) {
            i2 = 4;
        }
        return new ZipShort(i3 + i4 + i + i2);
    }

    public ZipEightByteInteger getCompressedSize() {
        return this.compressedSize;
    }

    public ZipLong getDiskStartNumber() {
        return this.diskStart;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getHeaderId() {
        return HEADER_ID;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public byte[] getLocalFileDataData() {
        byte[] bArr;
        if (this.size == null && this.compressedSize == null) {
            bArr = new byte[0];
        } else if (this.size == null || this.compressedSize == null) {
            throw new IllegalArgumentException(LFH_MUST_HAVE_BOTH_SIZES_MSG);
        } else {
            bArr = new byte[16];
            addSizes(bArr);
        }
        return bArr;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getLocalFileDataLength() {
        return new ZipShort(this.size != null ? 16 : 0);
    }

    public ZipEightByteInteger getRelativeHeaderOffset() {
        return this.relativeHeaderOffset;
    }

    public ZipEightByteInteger getSize() {
        return this.size;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public void parseFromCentralDirectoryData(byte[] bArr, int i, int i2) throws ZipException {
        this.rawCentralDirectoryData = new byte[i2];
        System.arraycopy(bArr, i, this.rawCentralDirectoryData, 0, i2);
        if (i2 >= 28) {
            parseFromLocalFileData(bArr, i, i2);
        } else if (i2 != 24) {
            if (i2 % 8 != 4) {
                return;
            }
            this.diskStart = new ZipLong(bArr, (i + i2) - 4);
        } else {
            this.size = new ZipEightByteInteger(bArr, i);
            int i3 = i + 8;
            this.compressedSize = new ZipEightByteInteger(bArr, i3);
            this.relativeHeaderOffset = new ZipEightByteInteger(bArr, i3 + 8);
        }
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public void parseFromLocalFileData(byte[] bArr, int i, int i2) throws ZipException {
        if (i2 == 0) {
            return;
        }
        if (i2 < 16) {
            throw new ZipException(LFH_MUST_HAVE_BOTH_SIZES_MSG);
        }
        this.size = new ZipEightByteInteger(bArr, i);
        int i3 = i + 8;
        this.compressedSize = new ZipEightByteInteger(bArr, i3);
        int i4 = i3 + 8;
        int i5 = i2 - 16;
        int i6 = i5;
        int i7 = i4;
        if (i5 >= 8) {
            this.relativeHeaderOffset = new ZipEightByteInteger(bArr, i4);
            i7 = i4 + 8;
            i6 = i5 - 8;
        }
        if (i6 < 4) {
            return;
        }
        this.diskStart = new ZipLong(bArr, i7);
    }

    public void reparseCentralDirectoryData(boolean z, boolean z2, boolean z3, boolean z4) throws ZipException {
        int i = 8;
        int i2 = 0;
        if (this.rawCentralDirectoryData != null) {
            int i3 = z ? 8 : 0;
            int i4 = z2 ? 8 : 0;
            if (!z3) {
                i = 0;
            }
            if (z4) {
                i2 = 4;
            }
            int i5 = i + i4 + i3 + i2;
            if (this.rawCentralDirectoryData.length != i5) {
                throw new ZipException("central directory zip64 extended information extra field's length doesn't match central directory data.  Expected length " + i5 + " but is " + this.rawCentralDirectoryData.length);
            }
            int i6 = 0;
            if (z) {
                this.size = new ZipEightByteInteger(this.rawCentralDirectoryData, 0);
                i6 = 0 + 8;
            }
            int i7 = i6;
            if (z2) {
                this.compressedSize = new ZipEightByteInteger(this.rawCentralDirectoryData, i6);
                i7 = i6 + 8;
            }
            int i8 = i7;
            if (z3) {
                this.relativeHeaderOffset = new ZipEightByteInteger(this.rawCentralDirectoryData, i7);
                i8 = i7 + 8;
            }
            if (!z4) {
                return;
            }
            this.diskStart = new ZipLong(this.rawCentralDirectoryData, i8);
        }
    }

    public void setCompressedSize(ZipEightByteInteger zipEightByteInteger) {
        this.compressedSize = zipEightByteInteger;
    }

    public void setDiskStartNumber(ZipLong zipLong) {
        this.diskStart = zipLong;
    }

    public void setRelativeHeaderOffset(ZipEightByteInteger zipEightByteInteger) {
        this.relativeHeaderOffset = zipEightByteInteger;
    }

    public void setSize(ZipEightByteInteger zipEightByteInteger) {
        this.size = zipEightByteInteger;
    }
}
