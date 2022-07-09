package com.edutech.idauthentication;

import android.os.Build;
import android.text.TextUtils;
import com.edutech.mobilestudyclient.util.AESUtils;
import java.security.Provider;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes.jar:com/edutech/idauthentication/AESUtils2.class */
public class AESUtils2 {
    private static final String AES = "AES";
    private static final String CBC_PKCS5_PADDING = "AES/CBC/PKCS5Padding";
    private static final String HEX = "0123456789ABCDEF";
    private static final String SHA1PRNG = "SHA1PRNG";

    /* loaded from: classes.jar:com/edutech/idauthentication/AESUtils2$CryptoProvider.class */
    public static class CryptoProvider extends Provider {
        public CryptoProvider() {
            super(AESUtils.CRYPTO, 1.0d, "HARMONY (SHA1 digest; SecureRandom; SHA1withDSA signature)");
            put("SecureRandom.SHA1PRNG", "org.apache.harmony.security.provider.crypto.SHA1PRNG_SecureRandomImpl");
            put("SecureRandom.SHA1PRNG ImplementedIn", "Software");
        }
    }

    private static void appendHex(StringBuffer stringBuffer, byte b) {
        stringBuffer.append(HEX.charAt((b >> 4) & 15)).append(HEX.charAt(b & 15));
    }

    public static String decrypt(String str, String str2) {
        if (!TextUtils.isEmpty(str2)) {
            try {
                str2 = new String(decrypt(str, toByte(str2)));
            } catch (Exception e) {
                e.printStackTrace();
                str2 = null;
            }
        }
        return str2;
    }

    private static byte[] decrypt(String str, byte[] bArr) throws Exception {
        SecretKeySpec secretKeySpec = new SecretKeySpec(getRawKey(str.getBytes()), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(2, secretKeySpec);
        return cipher.doFinal(bArr);
    }

    public static String encrypt(String str, String str2) {
        if (!TextUtils.isEmpty(str2)) {
            try {
                str2 = new String(encrypt(str, str2.getBytes()));
            } catch (Exception e) {
                e.printStackTrace();
                str2 = null;
            }
        }
        return str2;
    }

    private static byte[] encrypt(String str, byte[] bArr) throws Exception {
        SecretKeySpec secretKeySpec = new SecretKeySpec(getRawKey(str.getBytes()), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(1, secretKeySpec);
        return cipher.doFinal(bArr);
    }

    public static String generateKey() {
        String str;
        try {
            byte[] bArr = new byte[20];
            SecureRandom.getInstance("SHA1PRNG").nextBytes(bArr);
            str = toHex(bArr);
        } catch (Exception e) {
            e.printStackTrace();
            str = null;
        }
        return str;
    }

    private static byte[] getRawKey(byte[] bArr) throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
        SecureRandom secureRandom = Build.VERSION.SDK_INT > 23 ? SecureRandom.getInstance("SHA1PRNG", new CryptoProvider()) : Build.VERSION.SDK_INT >= 17 ? SecureRandom.getInstance("SHA1PRNG", AESUtils.CRYPTO) : SecureRandom.getInstance("SHA1PRNG");
        secureRandom.setSeed(bArr);
        keyGenerator.init(128, secureRandom);
        return keyGenerator.generateKey().getEncoded();
    }

    public static byte[] toByte(String str) {
        int length = str.length() / 2;
        byte[] bArr = new byte[length];
        for (int i = 0; i < length; i++) {
            bArr[i] = Integer.valueOf(str.substring(i * 2, (i * 2) + 2), 16).byteValue();
        }
        return bArr;
    }

    public static String toHex(byte[] bArr) {
        String stringBuffer;
        if (bArr == null) {
            stringBuffer = "";
        } else {
            StringBuffer stringBuffer2 = new StringBuffer(bArr.length * 2);
            for (byte b : bArr) {
                appendHex(stringBuffer2, b);
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }
}
