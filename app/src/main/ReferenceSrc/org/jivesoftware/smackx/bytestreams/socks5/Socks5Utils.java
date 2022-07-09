package org.jivesoftware.smackx.bytestreams.socks5;

import java.io.DataInputStream;
import java.io.IOException;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/Socks5Utils.class */
class Socks5Utils {
    Socks5Utils() {
    }

    public static String createDigest(String str, String str2, String str3) {
        StringBuilder sb = new StringBuilder();
        sb.append(str).append(str2).append(str3);
        return StringUtils.hash(sb.toString());
    }

    public static byte[] receiveSocks5Message(DataInputStream dataInputStream) throws IOException, XMPPException {
        byte[] bArr = new byte[5];
        dataInputStream.readFully(bArr, 0, 5);
        if (bArr[3] != 3) {
            throw new XMPPException("Unsupported SOCKS5 address type");
        }
        byte b = bArr[4];
        byte[] bArr2 = new byte[b + 7];
        System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
        dataInputStream.readFully(bArr2, bArr.length, b + 2);
        return bArr2;
    }
}
