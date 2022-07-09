package com.edutech.mobilestudyclient.util;

import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/util/AESUtils.class */
public class AESUtils {
    public static final String AES = "AES";
    public static final String CIPHER = "AES/CBC/PKCS5Padding";
    public static final String CRYPTO = "Crypto";
    public static final String SHA1 = "SHA1PRNG";

    public static String decrypt(String str, String str2) {
        String str3;
        try {
            KeyGenerator keyGenerator = KeyGenerator.getInstance(AES);
            SecureRandom secureRandom = new SecureRandom();
            secureRandom.setSeed(str2.getBytes());
            keyGenerator.init(256, secureRandom);
            SecretKeySpec secretKeySpec = new SecretKeySpec(keyGenerator.generateKey().getEncoded(), AES);
            Cipher cipher = Cipher.getInstance(AES);
            cipher.init(2, secretKeySpec);
            str3 = new String(cipher.doFinal(parseHexStr2Byte(str)));
        } catch (Exception e) {
            e.printStackTrace();
            str3 = null;
        }
        return str3;
    }

    public static String encrypt(String str, String str2) {
        String str3;
        try {
            KeyGenerator keyGenerator = KeyGenerator.getInstance(AES);
            SecureRandom secureRandom = new SecureRandom();
            secureRandom.setSeed(str.getBytes());
            keyGenerator.init(128, secureRandom);
            keyGenerator.generateKey().getEncoded();
            IvParameterSpec ivParameterSpec = new IvParameterSpec("fedcba9876543210".getBytes());
            SecretKeySpec secretKeySpec = new SecretKeySpec("0123456789abcdef".getBytes(), AES);
            Cipher cipher = Cipher.getInstance(CIPHER);
            byte[] bytes = str2.getBytes();
            cipher.init(1, secretKeySpec, ivParameterSpec);
            str3 = parseByte2HexStr(cipher.doFinal(bytes));
        } catch (Exception e) {
            e.printStackTrace();
            str3 = null;
        }
        return str3;
    }

    private static byte[] getRawKey(byte[] bArr) throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance(AES);
        SecureRandom secureRandom = SecureRandom.getInstance(SHA1, CRYPTO);
        secureRandom.setSeed(bArr);
        keyGenerator.init(128, secureRandom);
        return keyGenerator.generateKey().getEncoded();
    }

    public static String parseByte2HexStr(byte[] bArr) {
        StringBuffer stringBuffer = new StringBuffer();
        for (byte b : bArr) {
            String hexString = Integer.toHexString(b & 255);
            String str = hexString;
            if (hexString.length() == 1) {
                str = String.valueOf('0') + hexString;
            }
            stringBuffer.append(str.toLowerCase());
        }
        return stringBuffer.toString();
    }

    public static byte[] parseHexStr2Byte(String str) {
        byte[] bArr;
        if (str.length() >= 1) {
            byte[] bArr2 = new byte[str.length() / 2];
            int i = 0;
            while (true) {
                bArr = bArr2;
                if (i >= str.length() / 2) {
                    break;
                }
                bArr2[i] = (byte) ((Integer.parseInt(str.substring(i * 2, (i * 2) + 1), 16) * 16) + Integer.parseInt(str.substring((i * 2) + 1, (i * 2) + 2), 16));
                i++;
            }
        } else {
            bArr = null;
        }
        return bArr;
    }
}
