package com.edutech.idauthentication;

import com.edutech.mobilestudyclient.util.AESUtils;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.bson.BSON;

/* loaded from: classes.dex */
public class AESSet {
    static char[] HEX_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    private Cipher cipher;
    private String iv = "fedcba9876543210";
    private String SecretKey = "Edutech@20131220";
    private IvParameterSpec ivspec = new IvParameterSpec(this.iv.getBytes());
    private SecretKeySpec keyspec = new SecretKeySpec(this.SecretKey.getBytes(), AESUtils.AES);

    public AESSet() {
        try {
            this.cipher = Cipher.getInstance("AES/CBC/NoPadding");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e2) {
            e2.printStackTrace();
        }
    }

    public byte[] encrypt(String text) throws Exception {
        if (text == null || text.length() == 0) {
            throw new Exception("Empty string");
        }
        try {
            this.cipher.init(1, this.keyspec, this.ivspec);
            byte[] encrypted = this.cipher.doFinal(padString(text).getBytes());
            return encrypted;
        } catch (Exception e) {
            throw new Exception("[encrypt] " + e.getMessage());
        }
    }

    public byte[] decrypt(String code) throws Exception {
        if (code == null || code.length() == 0) {
            throw new Exception("Empty string");
        }
        try {
            this.cipher.init(2, this.keyspec, this.ivspec);
            byte[] decrypted = this.cipher.doFinal(hexToBytes(code));
            if (decrypted.length > 0) {
                int trim = 0;
                for (int i = decrypted.length - 1; i >= 0; i--) {
                    if (decrypted[i] == 0) {
                        trim++;
                    }
                }
                if (trim > 0) {
                    byte[] newArray = new byte[decrypted.length - trim];
                    System.arraycopy(decrypted, 0, newArray, 0, decrypted.length - trim);
                    return newArray;
                }
                return decrypted;
            }
            return decrypted;
        } catch (Exception e) {
            throw new Exception("[decrypt] " + e.getMessage());
        }
    }

    public static String bytesToHex(byte[] buf) {
        char[] chars = new char[buf.length * 2];
        for (int i = 0; i < buf.length; i++) {
            chars[i * 2] = HEX_CHARS[(buf[i] & 240) >>> 4];
            chars[(i * 2) + 1] = HEX_CHARS[buf[i] & BSON.CODE_W_SCOPE];
        }
        return new String(chars);
    }

    public static byte[] hexToBytes(String str) {
        byte[] buffer = null;
        if (str != null && str.length() >= 2) {
            int len = str.length() / 2;
            buffer = new byte[len];
            for (int i = 0; i < len; i++) {
                buffer[i] = (byte) Integer.parseInt(str.substring(i * 2, (i * 2) + 2), 16);
            }
        }
        return buffer;
    }

    private static String padString(String source) {
        int x = source.length() % 16;
        int padLength = 16 - x;
        for (int i = 0; i < padLength; i++) {
            source = String.valueOf(source) + (char) 0;
        }
        return source;
    }
}
