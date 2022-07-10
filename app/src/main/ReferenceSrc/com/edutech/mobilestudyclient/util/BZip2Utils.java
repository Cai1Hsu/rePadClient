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
import org.bson.BSON;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class BZip2Utils {
    public static final int BUFFER = 1024;
    public static final CharSequence EXT = ".bz2";

    public static void main(String[] args) throws Exception {
        byte[] b = "中国".getBytes("GBK");
        byte[] a = compress(b);
        String encodeStr = Base64.encodeToString(a, 0);
        Log.i("main", encodeStr);
        byte[] bb = Base64.decode(encodeStr, 0);
        byte[] aa = decompress(bb);
        String decodeStr = new String(aa, "GBK");
        Log.i("main", decodeStr);
    }

    public static String StringEncodeToBase64(String str) throws Exception {
        byte[] b = str.getBytes("GBK");
        byte[] a = compress(b);
        String encodeStr = Base64.encodeToString(a, 0);
        Log.i("StringEncodeToBase64", "encodeStr =" + encodeStr);
        return encodeStr;
    }

    public static String Base64DecodeToString(String base64) throws Exception {
        byte[] bb = Base64.decode(base64, 0);
        byte[] aa = decompress(bb);
        String decodeStr = new String(aa, "GBK");
        return decodeStr;
    }

    public static String BitmapEncodeToBase64(Bitmap bitmap) throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, baos);
        byte[] b = baos.toByteArray();
        String encodeStr = Base64.encodeToString(b, 0);
        Log.i("main", encodeStr);
        return encodeStr.replaceAll("\r\n", "").replaceAll("\r", "").replaceAll("\n", "");
    }

    public static Bitmap Base64DecodeToBitmap(String base64) throws Exception {
        byte[] bb = Base64.decode(base64, 0);
        byte[] aa = decompress(bb);
        String decodeStr = new String(aa);
        byte[] cc = hexStringToBytes(decodeStr);
        Bitmap bitmap = BitmapFactory.decodeByteArray(cc, 0, cc.length);
        return bitmap;
    }

    public static String printHexString(byte[] b) {
        String result = "";
        for (byte b2 : b) {
            String hex = Integer.toHexString(b2 & BSON.MINKEY);
            if (hex.length() == 1) {
                hex = String.valueOf('0') + hex;
            }
            result = String.valueOf(result) + hex.toUpperCase();
        }
        return result;
    }

    public static byte[] hexStringToBytes(String hexString) {
        if (hexString == null || hexString.equals("")) {
            return null;
        }
        String hexString2 = hexString.toUpperCase();
        int length = hexString2.length() / 2;
        char[] hexChars = hexString2.toCharArray();
        byte[] d = new byte[length];
        for (int i = 0; i < length; i++) {
            int pos = i * 2;
            d[i] = (byte) ((charToByte(hexChars[pos]) << 4) | charToByte(hexChars[pos + 1]));
        }
        return d;
    }

    private static byte charToByte(char c) {
        return (byte) "0123456789ABCDEF".indexOf(c);
    }

    public static byte[] compress(byte[] data) throws Exception {
        ByteArrayInputStream bais = new ByteArrayInputStream(data);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        compress(bais, baos);
        byte[] output = baos.toByteArray();
        baos.flush();
        baos.close();
        bais.close();
        return output;
    }

    public static void compress(File file) throws Exception {
        compress(file, true);
    }

    public static void compress(File file, boolean delete) throws Exception {
        FileInputStream fis = new FileInputStream(file);
        FileOutputStream fos = new FileOutputStream(String.valueOf(file.getPath()) + ((Object) EXT));
        compress(fis, fos);
        fis.close();
        fos.flush();
        fos.close();
        if (delete) {
            file.delete();
        }
    }

    public static void compress(InputStream is, OutputStream os) throws Exception {
        BZip2CompressorOutputStream gos = new BZip2CompressorOutputStream(os);
        byte[] data = new byte[1024];
        while (true) {
            int count = is.read(data, 0, 1024);
            if (count != -1) {
                gos.write(data, 0, count);
            } else {
                gos.finish();
                gos.flush();
                gos.close();
                return;
            }
        }
    }

    public static void compress(String path) throws Exception {
        compress(path, true);
    }

    public static void compress(String path, boolean delete) throws Exception {
        File file = new File(path);
        compress(file, delete);
    }

    public static byte[] decompress(byte[] data) throws Exception {
        ByteArrayInputStream bais = new ByteArrayInputStream(data);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        decompress(bais, baos);
        byte[] data2 = baos.toByteArray();
        baos.flush();
        baos.close();
        bais.close();
        return data2;
    }

    public static void decompress(File file) throws Exception {
        decompress(file, true);
    }

    public static void decompress(File file, boolean delete) throws Exception {
        FileInputStream fis = new FileInputStream(file);
        FileOutputStream fos = new FileOutputStream(file.getPath().replace(EXT, ""));
        decompress(fis, fos);
        fis.close();
        fos.flush();
        fos.close();
        if (delete) {
            file.delete();
        }
    }

    public static void decompress(InputStream is, OutputStream os) throws Exception {
        BZip2CompressorInputStream gis = new BZip2CompressorInputStream(is);
        byte[] data = new byte[1024];
        while (true) {
            int count = gis.read(data, 0, 1024);
            if (count != -1) {
                os.write(data, 0, count);
            } else {
                gis.close();
                return;
            }
        }
    }

    public static void decompress(String path) throws Exception {
        decompress(path, true);
    }

    public static void decompress(String path, boolean delete) throws Exception {
        File file = new File(path);
        decompress(file, delete);
    }
}
