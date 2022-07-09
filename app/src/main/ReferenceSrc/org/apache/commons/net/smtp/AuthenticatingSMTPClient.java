package org.apache.commons.net.smtp;

import com.mongodb.MongoCredential;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.net.util.Base64;

/* loaded from: classes.jar:org/apache/commons/net/smtp/AuthenticatingSMTPClient.class */
public class AuthenticatingSMTPClient extends SMTPSClient {

    /* loaded from: classes.jar:org/apache/commons/net/smtp/AuthenticatingSMTPClient$AUTH_METHOD.class */
    public enum AUTH_METHOD {
        PLAIN,
        CRAM_MD5,
        LOGIN;

        public static final String getAuthName(AUTH_METHOD auth_method) {
            return auth_method.equals(PLAIN) ? MongoCredential.PLAIN_MECHANISM : auth_method.equals(CRAM_MD5) ? "CRAM-MD5" : auth_method.equals(LOGIN) ? "LOGIN" : null;
        }
    }

    public AuthenticatingSMTPClient() throws NoSuchAlgorithmException {
    }

    public AuthenticatingSMTPClient(String str) throws NoSuchAlgorithmException {
        super(str);
    }

    private String _convertToHexString(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (int i = 0; i < bArr.length; i++) {
            if ((bArr[i] & 255) <= 15) {
                sb.append("0");
            }
            sb.append(Integer.toHexString(bArr[i] & 255));
        }
        return sb.toString();
    }

    public boolean auth(AUTH_METHOD auth_method, String str, String str2) throws IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidKeySpecException {
        boolean z;
        if (!SMTPReply.isPositiveIntermediate(sendCommand(14, AUTH_METHOD.getAuthName(auth_method)))) {
            z = false;
        } else if (auth_method.equals(AUTH_METHOD.PLAIN)) {
            z = SMTPReply.isPositiveCompletion(sendCommand(new String(Base64.encodeBase64(("��" + str + "��" + str2).getBytes()))));
        } else if (auth_method.equals(AUTH_METHOD.CRAM_MD5)) {
            byte[] decodeBase64 = Base64.decodeBase64(getReplyString().substring(4).trim());
            Mac mac = Mac.getInstance("HmacMD5");
            mac.init(new SecretKeySpec(str2.getBytes(), "HmacMD5"));
            byte[] bytes = _convertToHexString(mac.doFinal(decodeBase64)).getBytes();
            byte[] bytes2 = str.getBytes();
            byte[] bArr = new byte[bytes2.length + 1 + bytes.length];
            System.arraycopy(bytes2, 0, bArr, 0, bytes2.length);
            bArr[bytes2.length] = (byte) 32;
            System.arraycopy(bytes, 0, bArr, bytes2.length + 1, bytes.length);
            z = SMTPReply.isPositiveCompletion(sendCommand(new String(Base64.encodeBase64(bArr))));
        } else {
            z = false;
            if (auth_method.equals(AUTH_METHOD.LOGIN)) {
                z = false;
                if (SMTPReply.isPositiveIntermediate(sendCommand(new String(Base64.encodeBase64(str.getBytes()))))) {
                    z = SMTPReply.isPositiveCompletion(sendCommand(new String(Base64.encodeBase64(str2.getBytes()))));
                }
            }
        }
        return z;
    }

    public int ehlo(String str) throws IOException {
        return sendCommand(15, str);
    }

    public boolean elogin() throws IOException {
        String hostName = getLocalAddress().getHostName();
        return hostName == null ? false : SMTPReply.isPositiveCompletion(ehlo(hostName));
    }

    public boolean elogin(String str) throws IOException {
        return SMTPReply.isPositiveCompletion(ehlo(str));
    }

    public int[] getEnhancedReplyCode() {
        String substring = getReplyString().substring(4);
        String[] split = substring.substring(0, substring.indexOf(32)).split("\\.");
        int[] iArr = new int[split.length];
        for (int i = 0; i < split.length; i++) {
            iArr[i] = Integer.parseInt(split[i]);
        }
        return iArr;
    }
}
