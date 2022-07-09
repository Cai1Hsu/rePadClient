package org.jivesoftware.smack.util;

/* loaded from: classes.jar:org/jivesoftware/smack/util/Base64Encoder.class */
public class Base64Encoder implements StringEncoder {
    private static Base64Encoder instance = new Base64Encoder();

    private Base64Encoder() {
    }

    public static Base64Encoder getInstance() {
        return instance;
    }

    @Override // org.jivesoftware.smack.util.StringEncoder
    public String decode(String str) {
        return new String(Base64.decode(str));
    }

    @Override // org.jivesoftware.smack.util.StringEncoder
    public String encode(String str) {
        return Base64.encodeBytes(str.getBytes());
    }
}
