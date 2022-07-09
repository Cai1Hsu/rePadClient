package org.apache.commons.compress.archivers.zip;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/GeneralPurposeBit.class */
public final class GeneralPurposeBit {
    private static final int DATA_DESCRIPTOR_FLAG = 8;
    private static final int ENCRYPTION_FLAG = 1;
    private static final int STRONG_ENCRYPTION_FLAG = 64;
    public static final int UFT8_NAMES_FLAG = 2048;
    private boolean languageEncodingFlag = false;
    private boolean dataDescriptorFlag = false;
    private boolean encryptionFlag = false;
    private boolean strongEncryptionFlag = false;

    public static GeneralPurposeBit parse(byte[] bArr, int i) {
        int value = ZipShort.getValue(bArr, i);
        GeneralPurposeBit generalPurposeBit = new GeneralPurposeBit();
        generalPurposeBit.useDataDescriptor((value & 8) != 0);
        generalPurposeBit.useUTF8ForNames((value & 2048) != 0);
        generalPurposeBit.useStrongEncryption((value & 64) != 0);
        generalPurposeBit.useEncryption((value & 1) != 0);
        return generalPurposeBit;
    }

    public byte[] encode() {
        int i = 0;
        int i2 = this.dataDescriptorFlag ? 8 : 0;
        int i3 = this.languageEncodingFlag ? 2048 : 0;
        int i4 = this.encryptionFlag ? 1 : 0;
        if (this.strongEncryptionFlag) {
            i = 64;
        }
        return ZipShort.getBytes(i4 | i3 | i2 | i);
    }

    public boolean equals(Object obj) {
        boolean z;
        if (!(obj instanceof GeneralPurposeBit)) {
            z = false;
        } else {
            GeneralPurposeBit generalPurposeBit = (GeneralPurposeBit) obj;
            z = false;
            if (generalPurposeBit.encryptionFlag == this.encryptionFlag) {
                z = false;
                if (generalPurposeBit.strongEncryptionFlag == this.strongEncryptionFlag) {
                    z = false;
                    if (generalPurposeBit.languageEncodingFlag == this.languageEncodingFlag) {
                        z = false;
                        if (generalPurposeBit.dataDescriptorFlag == this.dataDescriptorFlag) {
                            z = true;
                        }
                    }
                }
            }
        }
        return z;
    }

    public int hashCode() {
        int i = 1;
        int i2 = this.encryptionFlag ? 1 : 0;
        int i3 = this.strongEncryptionFlag ? 1 : 0;
        int i4 = this.languageEncodingFlag ? 1 : 0;
        if (!this.dataDescriptorFlag) {
            i = 0;
        }
        return (((i4 + ((i3 + (i2 * 17)) * 13)) * 7) + i) * 3;
    }

    public void useDataDescriptor(boolean z) {
        this.dataDescriptorFlag = z;
    }

    public void useEncryption(boolean z) {
        this.encryptionFlag = z;
    }

    public void useStrongEncryption(boolean z) {
        this.strongEncryptionFlag = z;
        if (z) {
            useEncryption(true);
        }
    }

    public void useUTF8ForNames(boolean z) {
        this.languageEncodingFlag = z;
    }

    public boolean usesDataDescriptor() {
        return this.dataDescriptorFlag;
    }

    public boolean usesEncryption() {
        return this.encryptionFlag;
    }

    public boolean usesStrongEncryption() {
        return this.encryptionFlag && this.strongEncryptionFlag;
    }

    public boolean usesUTF8ForNames() {
        return this.languageEncodingFlag;
    }
}
