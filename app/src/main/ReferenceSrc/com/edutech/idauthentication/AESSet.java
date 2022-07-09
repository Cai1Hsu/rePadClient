package com.edutech.idauthentication;

import com.edutech.mobilestudyclient.util.AESUtils;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes.jar:com/edutech/idauthentication/AESSet.class */
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

    public static String bytesToHex(byte[] bArr) {
        char[] cArr = new char[bArr.length * 2];
        for (int i = 0; i < bArr.length; i++) {
            cArr[i * 2] = HEX_CHARS[(bArr[i] & 240) >>> 4];
            cArr[(i * 2) + 1] = HEX_CHARS[bArr[i] & 15];
        }
        return new String(cArr);
    }

    public static byte[] hexToBytes(String str) {
        byte[] bArr = null;
        if (str != null && str.length() >= 2) {
            int length = str.length() / 2;
            byte[] bArr2 = new byte[length];
            int i = 0;
            while (true) {
                bArr = bArr2;
                if (i >= length) {
                    break;
                }
                bArr2[i] = (byte) Integer.parseInt(str.substring(i * 2, (i * 2) + 2), 16);
                i++;
            }
        }
        return bArr;
    }

    private static String padString(String str) {
        int length = str.length();
        for (int i = 0; i < 16 - (length % 16); i++) {
            str = String.valueOf(str) + (char) 0;
        }
        return str;
    }

    public byte[] decrypt(String str) throws Exception {
        if (str == null || str.length() == 0) {
            throw new Exception("Empty string");
        }
        try {
            this.cipher.init(2, this.keyspec, this.ivspec);
            byte[] doFinal = this.cipher.doFinal(hexToBytes(str));
            byte[] bArr = doFinal;
            if (doFinal.length > 0) {
                int i = 0;
                for (int length = doFinal.length - 1; length >= 0; length--) {
                    if (doFinal[length] == 0) {
                        i++;
                    }
                }
                bArr = doFinal;
                if (i > 0) {
                    bArr = new byte[doFinal.length - i];
                    System.arraycopy(doFinal, 0, bArr, 0, doFinal.length - i);
                }
            }
            return bArr;
        } catch (Exception e) {
            throw new Exception("[decrypt] " + e.getMessage());
        }
    }

    public byte[] encrypt(String str) throws Exception {
        if (str == null || str.length() == 0) {
            throw new Exception("Empty string");
        }
        try {
            this.cipher.init(1, this.keyspec, this.ivspec);
            return this.cipher.doFinal(padString(str).getBytes());
        } catch (Exception e) {
            throw new Exception("[encrypt] " + e.getMessage());
        }
    }
}
