package com.mongodb;

import com.mongodb.util.Util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import org.jivesoftware.smackx.workgroup.packet.UserID;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class NativeAuthenticationHelper {
    public static DBObject getAuthCommand(String userName, char[] password, String nonce) {
        return getAuthCommand(userName, createHash(userName, password), nonce);
    }

    static DBObject getAuthCommand(String userName, byte[] authHash, String nonce) {
        String key = nonce + userName + new String(authHash);
        BasicDBObject cmd = new BasicDBObject();
        cmd.put("authenticate", (Object) 1);
        cmd.put(UserID.ELEMENT_NAME, (Object) userName);
        cmd.put("nonce", (Object) nonce);
        cmd.put("key", (Object) Util.hexMD5(key.getBytes()));
        return cmd;
    }

    public static BasicDBObject getNonceCommand() {
        return new BasicDBObject("getnonce", 1);
    }

    static byte[] createHash(String userName, char[] password) {
        ByteArrayOutputStream bout = new ByteArrayOutputStream(userName.length() + 20 + password.length);
        try {
            bout.write(userName.getBytes());
            bout.write(":mongo:".getBytes());
            for (char ch : password) {
                if (ch >= 128) {
                    throw new IllegalArgumentException("can't handle non-ascii passwords yet");
                }
                bout.write((byte) ch);
            }
            return Util.hexMD5(bout.toByteArray()).getBytes();
        } catch (IOException ioe) {
            throw new RuntimeException("impossible", ioe);
        }
    }

    private NativeAuthenticationHelper() {
    }
}
