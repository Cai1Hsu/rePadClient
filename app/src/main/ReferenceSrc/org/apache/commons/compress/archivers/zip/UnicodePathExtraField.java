package org.apache.commons.compress.archivers.zip;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/UnicodePathExtraField.class */
public class UnicodePathExtraField extends AbstractUnicodeExtraField {
    public static final ZipShort UPATH_ID = new ZipShort(28789);

    public UnicodePathExtraField() {
    }

    public UnicodePathExtraField(String str, byte[] bArr) {
        super(str, bArr);
    }

    public UnicodePathExtraField(String str, byte[] bArr, int i, int i2) {
        super(str, bArr, i, i2);
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipExtraField
    public ZipShort getHeaderId() {
        return UPATH_ID;
    }
}
