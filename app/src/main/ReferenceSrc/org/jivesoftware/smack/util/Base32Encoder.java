package org.jivesoftware.smack.util;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/jivesoftware/smack/util/Base32Encoder.class */
public class Base32Encoder implements StringEncoder {
    private static final String ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ2345678";
    private static Base32Encoder instance = new Base32Encoder();

    private Base32Encoder() {
    }

    public static Base32Encoder getInstance() {
        return instance;
    }

    private static int lenToPadding(int i) {
        int i2;
        switch (i) {
            case 1:
                i2 = 6;
                break;
            case 2:
                i2 = 4;
                break;
            case 3:
                i2 = 3;
                break;
            case 4:
                i2 = 1;
                break;
            case 5:
                i2 = 0;
                break;
            default:
                i2 = -1;
                break;
        }
        return i2;
    }

    private static int paddingToLen(int i) {
        int i2;
        switch (i) {
            case 0:
                i2 = 5;
                break;
            case 1:
                i2 = 4;
                break;
            case 2:
            case 5:
            default:
                i2 = -1;
                break;
            case 3:
                i2 = 3;
                break;
            case 4:
                i2 = 2;
                break;
            case 6:
                i2 = 1;
                break;
        }
        return i2;
    }

    @Override // org.jivesoftware.smack.util.StringEncoder
    public String decode(String str) {
        String str2;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        for (byte b : str.getBytes()) {
            char c = (char) b;
            if (!Character.isWhitespace(c)) {
                byteArrayOutputStream.write((byte) Character.toUpperCase(c));
            }
        }
        while (byteArrayOutputStream.size() % 8 != 0) {
            byteArrayOutputStream.write(56);
        }
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        byteArrayOutputStream.reset();
        DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStream);
        int i = 0;
        loop2: while (true) {
            if (i >= byteArray.length / 8) {
                str2 = new String(byteArrayOutputStream.toByteArray());
                break;
            }
            short[] sArr = new short[8];
            int i2 = 8;
            for (int i3 = 0; i3 < 8 && ((char) byteArray[(i * 8) + i3]) != '8'; i3++) {
                sArr[i3] = (short) ALPHABET.indexOf(byteArray[(i * 8) + i3]);
                if (sArr[i3] < 0) {
                    str2 = null;
                    break loop2;
                }
                i2--;
            }
            int paddingToLen = paddingToLen(i2);
            if (paddingToLen < 0) {
                str2 = null;
                break;
            }
            short s = sArr[0];
            short s2 = sArr[1];
            short s3 = sArr[1];
            short s4 = sArr[2];
            short s5 = sArr[3];
            short s6 = sArr[3];
            short s7 = sArr[4];
            short s8 = sArr[4];
            short s9 = sArr[5];
            short s10 = sArr[6];
            short s11 = sArr[6];
            short s12 = sArr[7];
            for (int i4 = 0; i4 < paddingToLen; i4++) {
                try {
                    dataOutputStream.writeByte((byte) (new int[]{(s << 3) | (s2 >> 2), ((s3 & 3) << 6) | (s4 << 1) | (s5 >> 4), ((s6 & 15) << 4) | ((s7 >> 1) & 15), (s8 << 7) | (s9 << 2) | (s10 >> 3), ((s11 & 7) << 5) | s12}[i4] & 255));
                } catch (IOException e) {
                }
            }
            i++;
        }
        return str2;
    }

    @Override // org.jivesoftware.smack.util.StringEncoder
    public String encode(String str) {
        byte[] bytes = str.getBytes();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        for (int i = 0; i < (bytes.length + 4) / 5; i++) {
            short[] sArr = new short[5];
            int[] iArr = new int[8];
            int i2 = 5;
            for (int i3 = 0; i3 < 5; i3++) {
                if ((i * 5) + i3 < bytes.length) {
                    sArr[i3] = (short) (bytes[(i * 5) + i3] & 255);
                } else {
                    sArr[i3] = (short) 0;
                    i2--;
                }
            }
            int lenToPadding = lenToPadding(i2);
            iArr[0] = (byte) ((sArr[0] >> 3) & 31);
            iArr[1] = (byte) (((sArr[0] & 7) << 2) | ((sArr[1] >> 6) & 3));
            iArr[2] = (byte) ((sArr[1] >> 1) & 31);
            iArr[3] = (byte) (((sArr[1] & 1) << 4) | ((sArr[2] >> 4) & 15));
            iArr[4] = (byte) (((sArr[2] & 15) << 1) | ((sArr[3] >> 7) & 1));
            iArr[5] = (byte) ((sArr[3] >> 2) & 31);
            iArr[6] = (byte) (((sArr[3] & 3) << 3) | ((sArr[4] >> 5) & 7));
            iArr[7] = (byte) (sArr[4] & 31);
            for (int i4 = 0; i4 < iArr.length - lenToPadding; i4++) {
                byteArrayOutputStream.write(ALPHABET.charAt(iArr[i4]));
            }
        }
        return new String(byteArrayOutputStream.toByteArray());
    }
}
