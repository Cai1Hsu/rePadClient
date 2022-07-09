package org.apache.tools.zip;

import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: classes.jar:org/apache/tools/zip/ZipEncoding.class */
interface ZipEncoding {
    boolean canEncode(String str);

    String decode(byte[] bArr) throws IOException;

    ByteBuffer encode(String str) throws IOException;
}
