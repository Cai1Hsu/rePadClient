package org.apache.tools.zip;

/* loaded from: classes.jar:org/apache/tools/zip/UnicodeCommentExtraField.class */
public class UnicodeCommentExtraField extends AbstractUnicodeExtraField {
    public static final ZipShort UCOM_ID = new ZipShort(25461);

    public UnicodeCommentExtraField() {
    }

    public UnicodeCommentExtraField(String str, byte[] bArr) {
        super(str, bArr);
    }

    public UnicodeCommentExtraField(String str, byte[] bArr, int i, int i2) {
        super(str, bArr, i, i2);
    }

    @Override // org.apache.tools.zip.ZipExtraField
    public ZipShort getHeaderId() {
        return UCOM_ID;
    }
}
