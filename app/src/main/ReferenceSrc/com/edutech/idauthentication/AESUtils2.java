package com.edutech.idauthentication;

import android.os.Build;
import android.text.TextUtils;
import com.edutech.mobilestudyclient.util.AESUtils;
import java.security.Provider;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import org.bson.BSON;

/* loaded from: classes.dex */
public class AESUtils2 {
    private static final String AES = "AES";
    private static final String CBC_PKCS5_PADDING = "AES/CBC/PKCS5Padding";
    private static final String HEX = "0123456789ABCDEF";
    private static final String SHA1PRNG = "SHA1PRNG";

    public static String generateKey() {
        try {
            SecureRandom localSecureRandom = SecureRandom.getInstance("SHA1PRNG");
            byte[] bytes_key = new byte[20];
            localSecureRandom.nextBytes(bytes_key);
            return toHex(bytes_key);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static byte[] getRawKey(byte[] seed) throws Exception {
        SecureRandom sr;
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        int sdk_version = Build.VERSION.SDK_INT;
        if (sdk_version > 23) {
            sr = SecureRandom.getInstance("SHA1PRNG", new CryptoProvider());
        } else if (Build.VERSION.SDK_INT >= 17) {
            sr = SecureRandom.getInstance("SHA1PRNG", AESUtils.CRYPTO);
        } else {
            sr = SecureRandom.getInstance("SHA1PRNG");
        }
        sr.setSeed(seed);
        kgen.init(128, sr);
        SecretKey skey = kgen.generateKey();
        byte[] raw = skey.getEncoded();
        return raw;
    }

    public static String encrypt(String key, String cleartext) {
        if (!TextUtils.isEmpty(cleartext)) {
            try {
                byte[] result = encrypt(key, cleartext.getBytes());
                return new String(result);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return cleartext;
    }

    private static byte[] encrypt(String key, byte[] clear) throws Exception {
        byte[] raw = getRawKey(key.getBytes());
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(1, skeySpec);
        byte[] encrypted = cipher.doFinal(clear);
        return encrypted;
    }

    public static String decrypt(String key, String encrypted) {
        if (!TextUtils.isEmpty(encrypted)) {
            try {
                byte[] result = decrypt(key, toByte(encrypted));
                return new String(result);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return encrypted;
    }

    public static byte[] toByte(String hexString) {
        int len = hexString.length() / 2;
        byte[] result = new byte[len];
        for (int i = 0; i < len; i++) {
            result[i] = Integer.valueOf(hexString.substring(i * 2, (i * 2) + 2), 16).byteValue();
        }
        return result;
    }

    private static byte[] decrypt(String key, byte[] encrypted) throws Exception {
        byte[] raw = getRawKey(key.getBytes());
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(2, skeySpec);
        byte[] decrypted = cipher.doFinal(encrypted);
        return decrypted;
    }

    public static String toHex(byte[] buf) {
        if (buf == null) {
            return "";
        }
        StringBuffer result = new StringBuffer(buf.length * 2);
        for (byte b : buf) {
            appendHex(result, b);
        }
        return result.toString();
    }

    private static void appendHex(StringBuffer sb, byte b) {
        sb.append(HEX.charAt((b >> 4) & 15)).append(HEX.charAt(b & BSON.CODE_W_SCOPE));
    }

    /* loaded from: classes.dex */
    public static class CryptoProvider extends Provider {
        public CryptoProvider() {
            super(AESUtils.CRYPTO, 1.0d, "HARMONY (SHA1 digest; SecureRandom; SHA1withDSA signature)");
            put("SecureRandom.SHA1PRNG", "org.apache.harmony.security.provider.crypto.SHA1PRNG_SecureRandomImpl");
            put("SecureRandom.SHA1PRNG ImplementedIn", "Software");
        }
    }
}
