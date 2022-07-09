package org.apache.commons.compress.utils;

import java.nio.charset.Charset;

/* loaded from: classes.jar:org/apache/commons/compress/utils/Charsets.class */
public class Charsets {
    public static final Charset ISO_8859_1 = Charset.forName("ISO-8859-1");
    public static final Charset US_ASCII = Charset.forName("US-ASCII");
    public static final Charset UTF_16 = Charset.forName("UTF-16");
    public static final Charset UTF_16BE = Charset.forName(CharsetNames.UTF_16BE);
    public static final Charset UTF_16LE = Charset.forName(CharsetNames.UTF_16LE);
    public static final Charset UTF_8 = Charset.forName("UTF-8");

    public static Charset toCharset(String str) {
        return str == null ? Charset.defaultCharset() : Charset.forName(str);
    }

    public static Charset toCharset(Charset charset) {
        Charset charset2 = charset;
        if (charset == null) {
            charset2 = Charset.defaultCharset();
        }
        return charset2;
    }
}
