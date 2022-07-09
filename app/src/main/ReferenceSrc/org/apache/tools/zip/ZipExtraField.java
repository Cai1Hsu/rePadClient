package org.apache.tools.zip;

import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/tools/zip/ZipExtraField.class */
public interface ZipExtraField {
    byte[] getCentralDirectoryData();

    ZipShort getCentralDirectoryLength();

    ZipShort getHeaderId();

    byte[] getLocalFileDataData();

    ZipShort getLocalFileDataLength();

    void parseFromLocalFileData(byte[] bArr, int i, int i2) throws ZipException;
}
