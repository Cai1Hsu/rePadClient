package org.apache.commons.net.imap;

import com.mongodb.MongoCredential;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.SSLContext;
import org.apache.commons.net.imap.IMAP;
import org.apache.commons.net.util.Base64;

/* loaded from: classes.jar:org/apache/commons/net/imap/AuthenticatingIMAPClient.class */
public class AuthenticatingIMAPClient extends IMAPSClient {

    /* renamed from: org.apache.commons.net.imap.AuthenticatingIMAPClient$1 */
    /* loaded from: classes.jar:org/apache/commons/net/imap/AuthenticatingIMAPClient$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD = new int[AUTH_METHOD.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:10:0x002f -> B:14:0x001f). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0033 -> B:12:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[AUTH_METHOD.PLAIN.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[AUTH_METHOD.CRAM_MD5.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[AUTH_METHOD.LOGIN.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    /* loaded from: classes.jar:org/apache/commons/net/imap/AuthenticatingIMAPClient$AUTH_METHOD.class */
    public enum AUTH_METHOD {
        PLAIN(MongoCredential.PLAIN_MECHANISM),
        CRAM_MD5("CRAM-MD5"),
        LOGIN("LOGIN");
        
        private final String authName;

        AUTH_METHOD(String str) {
            this.authName = str;
        }

        public final String getAuthName() {
            return this.authName;
        }
    }

    public AuthenticatingIMAPClient() {
        this(IMAPSClient.DEFAULT_PROTOCOL, false);
    }

    public AuthenticatingIMAPClient(String str) {
        this(str, false);
    }

    public AuthenticatingIMAPClient(String str, boolean z) {
        this(str, z, null);
    }

    public AuthenticatingIMAPClient(String str, boolean z, SSLContext sSLContext) {
        super(str, z, sSLContext);
    }

    public AuthenticatingIMAPClient(SSLContext sSLContext) {
        this(false, sSLContext);
    }

    public AuthenticatingIMAPClient(boolean z) {
        this(IMAPSClient.DEFAULT_PROTOCOL, z);
    }

    public AuthenticatingIMAPClient(boolean z, SSLContext sSLContext) {
        this(IMAPSClient.DEFAULT_PROTOCOL, z, sSLContext);
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
        if (IMAPReply.isContinuation(sendCommand(IMAPCommand.AUTHENTICATE, auth_method.getAuthName()))) {
            switch (AnonymousClass1.$SwitchMap$org$apache$commons$net$imap$AuthenticatingIMAPClient$AUTH_METHOD[auth_method.ordinal()]) {
                case 1:
                    int sendData = sendData(new String(Base64.encodeBase64(("��" + str + "��" + str2).getBytes())));
                    if (sendData == 0) {
                        setState(IMAP.IMAPState.AUTH_STATE);
                    }
                    if (sendData != 0) {
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
                    int sendData2 = sendData(new String(Base64.encodeBase64(bArr)));
                    if (sendData2 == 0) {
                        setState(IMAP.IMAPState.AUTH_STATE);
                    }
                    if (sendData2 != 0) {
                        z = false;
                        break;
                    } else {
                        z = true;
                        break;
                    }
                case 3:
                    z = false;
                    if (sendData(new String(Base64.encodeBase64(str.getBytes()))) == 3) {
                        int sendData3 = sendData(new String(Base64.encodeBase64(str2.getBytes())));
                        if (sendData3 == 0) {
                            setState(IMAP.IMAPState.AUTH_STATE);
                        }
                        if (sendData3 != 0) {
                            z = false;
                            break;
                        } else {
                            z = true;
                            break;
                        }
                    }
                    break;
                default:
                    z = false;
                    break;
            }
        } else {
            z = false;
        }
        return z;
    }

    public boolean authenticate(AUTH_METHOD auth_method, String str, String str2) throws IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidKeySpecException {
        return auth(auth_method, str, str2);
    }
}
