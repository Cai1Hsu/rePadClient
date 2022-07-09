package org.jivesoftware.smack.util;

/* loaded from: classes.jar:org/jivesoftware/smack/util/Base64FileUrlEncoder.class */
public class Base64FileUrlEncoder implements StringEncoder {
    private static Base64FileUrlEncoder instance = new Base64FileUrlEncoder();

    private Base64FileUrlEncoder() {
    }

    public static Base64FileUrlEncoder getInstance() {
        return instance;
    }

    @Override // org.jivesoftware.smack.util.StringEncoder
    public String decode(String str) {
        return new String(Base64.decode(str, 16));
    }

    @Override // org.jivesoftware.smack.util.StringEncoder
    public String encode(String str) {
        return Base64.encodeBytes(str.getBytes(), 16);
    }
}
