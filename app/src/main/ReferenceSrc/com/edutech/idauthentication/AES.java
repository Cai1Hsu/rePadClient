package com.edutech.idauthentication;

import com.edutech.mobilestudyclient.util.AESUtils;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes.jar:com/edutech/idauthentication/AES.class */
public class AES {
    private static final String HEX = "0123456789ABCDEF";
    private static final String iv = "0123456789ABCDEF";

    private static void appendHex(StringBuffer stringBuffer, byte b) {
        stringBuffer.append("0123456789ABCDEF".charAt((b >> 4) & 15)).append("0123456789ABCDEF".charAt(b & 15));
    }

    public static String decrypt(String str, String str2) throws Exception {
        return new String(decrypt(getRawKey(str.getBytes()), toByte(str2)));
    }

    private static byte[] decrypt(byte[] bArr, byte[] bArr2) throws Exception {
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, AESUtils.AES);
        Cipher cipher = Cipher.getInstance(AESUtils.AES);
        cipher.init(2, secretKeySpec);
        return cipher.doFinal(bArr2);
    }

    public static String encrypt(String str, String str2) throws Exception {
        return toHex(encrypt(getRawKey(str.getBytes()), str2.getBytes()));
    }

    private static byte[] encrypt(byte[] bArr, byte[] bArr2) throws Exception {
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, AESUtils.AES);
        Cipher cipher = Cipher.getInstance(AESUtils.AES);
        cipher.init(1, secretKeySpec);
        return cipher.doFinal(bArr2);
    }

    private static byte[] encryptCheckSum(byte[] bArr, byte[] bArr2) throws Exception {
        SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, AESUtils.AES);
        IvParameterSpec ivParameterSpec = new IvParameterSpec("0123456789ABCDEF".getBytes());
        Cipher cipher = Cipher.getInstance(AESUtils.AES);
        cipher.init(1, secretKeySpec, ivParameterSpec);
        return cipher.doFinal(bArr2);
    }

    public static String encryptChecksum(String str, String str2) throws Exception {
        return toHex(encryptCheckSum(getRawKey(str.getBytes()), str2.getBytes()));
    }

    public static String fromHex(String str) {
        return new String(toByte(str));
    }

    private static byte[] getRawKey(byte[] bArr) throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance(AESUtils.AES);
        SecureRandom secureRandom = SecureRandom.getInstance(AESUtils.SHA1, AESUtils.CRYPTO);
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

    public static String toHex(String str) {
        return toHex(str.getBytes());
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
