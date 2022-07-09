package com.edutech.mobilestudyclient.util;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.compress.compressors.bzip2.BZip2CompressorInputStream;
import org.apache.commons.compress.compressors.bzip2.BZip2CompressorOutputStream;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/util/BZip2Utils.class */
public abstract class BZip2Utils {
    public static final int BUFFER = 1024;
    public static final CharSequence EXT = ".bz2";

    public static Bitmap Base64DecodeToBitmap(String str) throws Exception {
        byte[] hexStringToBytes = hexStringToBytes(new String(decompress(Base64.decode(str, 0))));
        return BitmapFactory.decodeByteArray(hexStringToBytes, 0, hexStringToBytes.length);
    }

    public static String Base64DecodeToString(String str) throws Exception {
        return new String(decompress(Base64.decode(str, 0)), "GBK");
    }

    public static String BitmapEncodeToBase64(Bitmap bitmap) throws Exception {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
        String encodeToString = Base64.encodeToString(byteArrayOutputStream.toByteArray(), 0);
        Log.i("main", encodeToString);
        return encodeToString.replaceAll("\r\n", "").replaceAll("\r", "").replaceAll("\n", "");
    }

    public static String StringEncodeToBase64(String str) throws Exception {
        String encodeToString = Base64.encodeToString(compress(str.getBytes("GBK")), 0);
        Log.i("StringEncodeToBase64", "encodeStr =" + encodeToString);
        return encodeToString;
    }

    private static byte charToByte(char c) {
        return (byte) "0123456789ABCDEF".indexOf(c);
    }

    public static void compress(File file) throws Exception {
        compress(file, true);
    }

    public static void compress(File file, boolean z) throws Exception {
        FileInputStream fileInputStream = new FileInputStream(file);
        FileOutputStream fileOutputStream = new FileOutputStream(String.valueOf(file.getPath()) + ((Object) EXT));
        compress(fileInputStream, fileOutputStream);
        fileInputStream.close();
        fileOutputStream.flush();
        fileOutputStream.close();
        if (z) {
            file.delete();
        }
    }

    public static void compress(InputStream inputStream, OutputStream outputStream) throws Exception {
        BZip2CompressorOutputStream bZip2CompressorOutputStream = new BZip2CompressorOutputStream(outputStream);
        byte[] bArr = new byte[1024];
        while (true) {
            int read = inputStream.read(bArr, 0, 1024);
            if (read == -1) {
                bZip2CompressorOutputStream.finish();
                bZip2CompressorOutputStream.flush();
                bZip2CompressorOutputStream.close();
                return;
            }
            bZip2CompressorOutputStream.write(bArr, 0, read);
        }
    }

    public static void compress(String str) throws Exception {
        compress(str, true);
    }

    public static void compress(String str, boolean z) throws Exception {
        compress(new File(str), z);
    }

    public static byte[] compress(byte[] bArr) throws Exception {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        compress(byteArrayInputStream, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        byteArrayOutputStream.flush();
        byteArrayOutputStream.close();
        byteArrayInputStream.close();
        return byteArray;
    }

    public static void decompress(File file) throws Exception {
        decompress(file, true);
    }

    public static void decompress(File file, boolean z) throws Exception {
        FileInputStream fileInputStream = new FileInputStream(file);
        FileOutputStream fileOutputStream = new FileOutputStream(file.getPath().replace(EXT, ""));
        decompress(fileInputStream, fileOutputStream);
        fileInputStream.close();
        fileOutputStream.flush();
        fileOutputStream.close();
        if (z) {
            file.delete();
        }
    }

    public static void decompress(InputStream inputStream, OutputStream outputStream) throws Exception {
        BZip2CompressorInputStream bZip2CompressorInputStream = new BZip2CompressorInputStream(inputStream);
        byte[] bArr = new byte[1024];
        while (true) {
            int read = bZip2CompressorInputStream.read(bArr, 0, 1024);
            if (read == -1) {
                bZip2CompressorInputStream.close();
                return;
            }
            outputStream.write(bArr, 0, read);
        }
    }

    public static void decompress(String str) throws Exception {
        decompress(str, true);
    }

    public static void decompress(String str, boolean z) throws Exception {
        decompress(new File(str), z);
    }

    public static byte[] decompress(byte[] bArr) throws Exception {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        decompress(byteArrayInputStream, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        byteArrayOutputStream.flush();
        byteArrayOutputStream.close();
        byteArrayInputStream.close();
        return byteArray;
    }

    public static byte[] hexStringToBytes(String str) {
        byte[] bArr;
        if (str != null && !str.equals("")) {
            String upperCase = str.toUpperCase();
            int length = upperCase.length() / 2;
            char[] charArray = upperCase.toCharArray();
            byte[] bArr2 = new byte[length];
            int i = 0;
            while (true) {
                bArr = bArr2;
                if (i >= length) {
                    break;
                }
                int i2 = i * 2;
                bArr2[i] = (byte) ((charToByte(charArray[i2]) << 4) | charToByte(charArray[i2 + 1]));
                i++;
            }
        } else {
            bArr = null;
        }
        return bArr;
    }

    public static void main(String[] strArr) throws Exception {
        String encodeToString = Base64.encodeToString(compress("中国".getBytes("GBK")), 0);
        Log.i("main", encodeToString);
        Log.i("main", new String(decompress(Base64.decode(encodeToString, 0)), "GBK"));
    }

    public static String printHexString(byte[] bArr) {
        String str = "";
        for (byte b : bArr) {
            String hexString = Integer.toHexString(b & 255);
            String str2 = hexString;
            if (hexString.length() == 1) {
                str2 = String.valueOf('0') + hexString;
            }
            str = String.valueOf(str) + str2.toUpperCase();
        }
        return str;
    }
}
