package org.apache.commons.net.pop3;

import com.mongodb.MongoCredential;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.net.util.Base64;

/* loaded from: classes.jar:org/apache/commons/net/pop3/ExtendedPOP3Client.class */
public class ExtendedPOP3Client extends POP3SClient {

    /* renamed from: org.apache.commons.net.pop3.ExtendedPOP3Client$1 */
    /* loaded from: classes.jar:org/apache/commons/net/pop3/ExtendedPOP3Client$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD = new int[AUTH_METHOD.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:8:0x0024 -> B:11:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[AUTH_METHOD.PLAIN.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[AUTH_METHOD.CRAM_MD5.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    /* loaded from: classes.jar:org/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD.class */
    public enum AUTH_METHOD {
        PLAIN(MongoCredential.PLAIN_MECHANISM),
        CRAM_MD5("CRAM-MD5");
        
        private final String methodName;

        AUTH_METHOD(String str) {
            this.methodName = str;
        }

        public final String getAuthName() {
            return this.methodName;
        }
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
        boolean z = true;
        if (sendCommand(13, auth_method.getAuthName()) == 2) {
            switch (AnonymousClass1.$SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD[auth_method.ordinal()]) {
                case 1:
                    if (sendCommand(new String(Base64.encodeBase64(("��" + str + "��" + str2).getBytes()))) != 0) {
                        z = false;
                        break;
                    }
                    break;
                case 2:
                    byte[] decodeBase64 = Base64.decodeBase64(getReplyString().substring(2).trim());
                    Mac mac = Mac.getInstance("HmacMD5");
                    mac.init(new SecretKeySpec(str2.getBytes(), "HmacMD5"));
                    byte[] bytes = _convertToHexString(mac.doFinal(decodeBase64)).getBytes();
                    byte[] bytes2 = str.getBytes();
                    byte[] bArr = new byte[bytes2.length + 1 + bytes.length];
                    System.arraycopy(bytes2, 0, bArr, 0, bytes2.length);
                    bArr[bytes2.length] = (byte) 32;
                    System.arraycopy(bytes, 0, bArr, bytes2.length + 1, bytes.length);
                    if (sendCommand(new String(Base64.encodeBase64(bArr))) != 0) {
                        z = false;
                        break;
                    } else {
                        z = true;
                        break;
                    }
                default:
                    z = false;
                    break;
            }
        } else {
            z = false;
        }
        return z;
    }
}
