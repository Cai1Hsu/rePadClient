package com.edutech.mobilestudyclient.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/util/My_md5.class */
public class My_md5 {
    public static String MD5_string(String str) {
        char[] charArray = str.toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            charArray[i] = (char) (charArray[i] ^ 't');
        }
        return new String(charArray);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v35, types: [int] */
    public static String Md5(String str) {
        String str2;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes());
            byte[] digest = messageDigest.digest();
            StringBuffer stringBuffer = new StringBuffer("");
            for (byte b : digest) {
                byte b2 = b;
                if (b < 0) {
                    b2 = b + 256;
                }
                if (b2 < 16) {
                    stringBuffer.append("0");
                }
                stringBuffer.append(Integer.toHexString(b2));
            }
            str2 = stringBuffer.toString();
            stringBuffer.toString().substring(8, 24);
            System.out.println("result: " + stringBuffer.toString());
            System.out.println("result: " + stringBuffer.toString().substring(8, 24));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            str2 = null;
        }
        return str2;
    }
}
