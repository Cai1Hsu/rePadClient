package org.jivesoftware.smack.util;

import android.support.v4.view.MotionEventCompat;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

/* loaded from: classes.jar:org/jivesoftware/smack/util/Base64.class */
public class Base64 {
    public static final int DECODE = 0;
    public static final int DONT_BREAK_LINES = 8;
    public static final int ENCODE = 1;
    private static final byte EQUALS_SIGN_ENC = -1;
    public static final int GZIP = 2;
    private static final int MAX_LINE_LENGTH = 76;
    private static final byte NEW_LINE = 10;
    public static final int NO_OPTIONS = 0;
    public static final int ORDERED = 32;
    private static final String PREFERRED_ENCODING = "UTF-8";
    public static final int URL_SAFE = 16;
    private static final byte WHITE_SPACE_ENC = -5;
    private static final byte[] _STANDARD_ALPHABET = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
    private static final byte EQUALS_SIGN = 61;
    private static final byte[] _STANDARD_DECODABET = {-9, -9, -9, -9, -9, -9, -9, -9, -9, -5, -5, -9, -9, -5, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -5, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, 62, -9, -9, -9, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, EQUALS_SIGN, -9, -9, -9, -1, -9, -9, -9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -9, -9, -9, -9, -9, -9, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -9, -9, -9, -9};
    private static final byte[] _URL_SAFE_ALPHABET = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 95};
    private static final byte[] _URL_SAFE_DECODABET = {-9, -9, -9, -9, -9, -9, -9, -9, -9, -5, -5, -9, -9, -5, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -5, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, 62, -9, -9, 52, 53, 54, 55, 56, 57, 58, 59, 60, EQUALS_SIGN, -9, -9, -9, -1, -9, -9, -9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -9, -9, -9, -9, 63, -9, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -9, -9, -9, -9};
    private static final byte[] _ORDERED_ALPHABET = {45, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 95, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122};
    private static final byte[] _ORDERED_DECODABET = {-9, -9, -9, -9, -9, -9, -9, -9, -9, -5, -5, -9, -9, -5, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -5, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, 0, -9, -9, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -9, -9, -9, -1, -9, -9, -9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, -9, -9, -9, -9, 37, -9, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, EQUALS_SIGN, 62, 63, -9, -9, -9, -9};

    /* loaded from: classes.jar:org/jivesoftware/smack/util/Base64$InputStream.class */
    public static class InputStream extends FilterInputStream {
        private byte[] alphabet;
        private boolean breakLines;
        private byte[] buffer;
        private int bufferLength;
        private byte[] decodabet;
        private boolean encode;
        private int lineLength;
        private int numSigBytes;
        private int options;
        private int position;

        public InputStream(java.io.InputStream inputStream) {
            this(inputStream, 0);
        }

        public InputStream(java.io.InputStream inputStream, int i) {
            super(inputStream);
            this.breakLines = (i & 8) != 8;
            this.encode = (i & 1) == 1;
            this.bufferLength = this.encode ? 4 : 3;
            this.buffer = new byte[this.bufferLength];
            this.position = -1;
            this.lineLength = 0;
            this.options = i;
            this.alphabet = Base64.getAlphabet(i);
            this.decodabet = Base64.getDecodabet(i);
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
        public int read() throws IOException {
            int i;
            int read;
            int i2;
            int read2;
            if (this.position < 0) {
                if (this.encode) {
                    byte[] bArr = new byte[3];
                    int i3 = 0;
                    int i4 = 0;
                    while (i4 < 3) {
                        try {
                            i2 = i3;
                            if (this.in.read() >= 0) {
                                bArr[i4] = (byte) read2;
                                i2 = i3 + 1;
                            }
                        } catch (IOException e) {
                            i2 = i3;
                            if (i4 == 0) {
                                throw e;
                            }
                        }
                        i4++;
                        i3 = i2;
                    }
                    if (i3 <= 0) {
                        i = -1;
                        return i;
                    }
                    Base64.encode3to4(bArr, 0, i3, this.buffer, 0, this.options);
                    this.position = 0;
                    this.numSigBytes = 4;
                } else {
                    byte[] bArr2 = new byte[4];
                    int i5 = 0;
                    while (i5 < 4) {
                        do {
                            read = this.in.read();
                            if (read < 0) {
                                break;
                            }
                        } while (this.decodabet[read & 127] <= -5);
                        if (read < 0) {
                            break;
                        }
                        bArr2[i5] = (byte) read;
                        i5++;
                    }
                    if (i5 != 4) {
                        if (i5 != 0) {
                            throw new IOException("Improperly padded Base64 input.");
                        }
                        i = -1;
                        return i;
                    }
                    this.numSigBytes = Base64.decode4to3(bArr2, 0, this.buffer, 0, this.options);
                    this.position = 0;
                }
            }
            if (this.position >= 0) {
                if (this.position >= this.numSigBytes) {
                    i = -1;
                } else if (!this.encode || !this.breakLines || this.lineLength < 76) {
                    this.lineLength++;
                    byte[] bArr3 = this.buffer;
                    int i6 = this.position;
                    this.position = i6 + 1;
                    byte b = bArr3[i6];
                    if (this.position >= this.bufferLength) {
                        this.position = -1;
                    }
                    i = b & 255;
                } else {
                    this.lineLength = 0;
                    i = 10;
                }
                return i;
            }
            throw new IOException("Error in Base64 code reading stream.");
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
        public int read(byte[] bArr, int i, int i2) throws IOException {
            int i3;
            int read;
            int i4 = 0;
            while (true) {
                i3 = i4;
                if (i4 >= i2) {
                    break;
                }
                if (read() >= 0) {
                    bArr[i + i4] = (byte) read;
                    i4++;
                } else {
                    i3 = i4;
                    if (i4 == 0) {
                        i3 = -1;
                    }
                }
            }
            return i3;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/util/Base64$OutputStream.class */
    public static class OutputStream extends FilterOutputStream {
        private byte[] alphabet;
        private byte[] b4;
        private boolean breakLines;
        private byte[] buffer;
        private int bufferLength;
        private byte[] decodabet;
        private boolean encode;
        private int lineLength;
        private int options;
        private int position;
        private boolean suspendEncoding;

        public OutputStream(java.io.OutputStream outputStream) {
            this(outputStream, 1);
        }

        public OutputStream(java.io.OutputStream outputStream, int i) {
            super(outputStream);
            this.breakLines = (i & 8) != 8;
            this.encode = (i & 1) == 1;
            this.bufferLength = this.encode ? 3 : 4;
            this.buffer = new byte[this.bufferLength];
            this.position = 0;
            this.lineLength = 0;
            this.suspendEncoding = false;
            this.b4 = new byte[4];
            this.options = i;
            this.alphabet = Base64.getAlphabet(i);
            this.decodabet = Base64.getDecodabet(i);
        }

        @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            flushBase64();
            super.close();
            this.buffer = null;
            this.out = null;
        }

        public void flushBase64() throws IOException {
            if (this.position > 0) {
                if (!this.encode) {
                    throw new IOException("Base64 input not properly padded.");
                }
                this.out.write(Base64.encode3to4(this.b4, this.buffer, this.position, this.options));
                this.position = 0;
            }
        }

        public void resumeEncoding() {
            this.suspendEncoding = false;
        }

        public void suspendEncoding() throws IOException {
            flushBase64();
            this.suspendEncoding = true;
        }

        @Override // java.io.FilterOutputStream, java.io.OutputStream
        public void write(int i) throws IOException {
            if (this.suspendEncoding) {
                ((FilterOutputStream) this).out.write(i);
            } else if (this.encode) {
                byte[] bArr = this.buffer;
                int i2 = this.position;
                this.position = i2 + 1;
                bArr[i2] = (byte) i;
                if (this.position < this.bufferLength) {
                    return;
                }
                this.out.write(Base64.encode3to4(this.b4, this.buffer, this.bufferLength, this.options));
                this.lineLength += 4;
                if (this.breakLines && this.lineLength >= 76) {
                    this.out.write(10);
                    this.lineLength = 0;
                }
                this.position = 0;
            } else if (this.decodabet[i & 127] <= -5) {
                if (this.decodabet[i & 127] == -5) {
                    return;
                }
                throw new IOException("Invalid character in Base64 data.");
            } else {
                byte[] bArr2 = this.buffer;
                int i3 = this.position;
                this.position = i3 + 1;
                bArr2[i3] = (byte) i;
                if (this.position < this.bufferLength) {
                    return;
                }
                this.out.write(this.b4, 0, Base64.decode4to3(this.buffer, 0, this.b4, 0, this.options));
                this.position = 0;
            }
        }

        @Override // java.io.FilterOutputStream, java.io.OutputStream
        public void write(byte[] bArr, int i, int i2) throws IOException {
            if (this.suspendEncoding) {
                ((FilterOutputStream) this).out.write(bArr, i, i2);
                return;
            }
            for (int i3 = 0; i3 < i2; i3++) {
                write(bArr[i + i3]);
            }
        }
    }

    private Base64() {
    }

    public static byte[] decode(String str) {
        return decode(str, 0);
    }

    public static byte[] decode(String str, int i) {
        byte[] bytes;
        Throwable th;
        GZIPInputStream gZIPInputStream;
        ByteArrayInputStream byteArrayInputStream;
        ByteArrayOutputStream byteArrayOutputStream;
        try {
            bytes = str.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            bytes = str.getBytes();
        }
        byte[] decode = decode(bytes, 0, bytes.length, i);
        byte[] bArr = decode;
        if (decode != null) {
            bArr = decode;
            if (decode.length >= 4) {
                bArr = decode;
                if (35615 == ((decode[0] & 255) | ((decode[1] << 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK))) {
                    ByteArrayInputStream byteArrayInputStream2 = null;
                    GZIPInputStream gZIPInputStream2 = null;
                    ByteArrayOutputStream byteArrayOutputStream2 = null;
                    byte[] bArr2 = new byte[2048];
                    try {
                        byteArrayOutputStream = new ByteArrayOutputStream();
                        try {
                            byteArrayInputStream = new ByteArrayInputStream(decode);
                            try {
                                gZIPInputStream = new GZIPInputStream(byteArrayInputStream);
                                while (true) {
                                    try {
                                        int read = gZIPInputStream.read(bArr2);
                                        if (read < 0) {
                                            break;
                                        }
                                        byteArrayOutputStream.write(bArr2, 0, read);
                                    } catch (IOException e2) {
                                        try {
                                            byteArrayOutputStream.close();
                                        } catch (Exception e3) {
                                        }
                                        try {
                                            gZIPInputStream.close();
                                        } catch (Exception e4) {
                                        }
                                        try {
                                            byteArrayInputStream.close();
                                            bArr = decode;
                                        } catch (Exception e5) {
                                            bArr = decode;
                                        }
                                        return bArr;
                                    } catch (Throwable th2) {
                                        gZIPInputStream2 = gZIPInputStream;
                                        byteArrayInputStream2 = byteArrayInputStream;
                                        byteArrayOutputStream2 = byteArrayOutputStream;
                                        th = th2;
                                        try {
                                            byteArrayOutputStream2.close();
                                        } catch (Exception e6) {
                                        }
                                        try {
                                            gZIPInputStream2.close();
                                        } catch (Exception e7) {
                                        }
                                        try {
                                            byteArrayInputStream2.close();
                                        } catch (Exception e8) {
                                        }
                                        throw th;
                                    }
                                }
                                bArr = byteArrayOutputStream.toByteArray();
                                try {
                                    byteArrayOutputStream.close();
                                } catch (Exception e9) {
                                }
                                try {
                                    gZIPInputStream.close();
                                } catch (Exception e10) {
                                }
                                try {
                                    byteArrayInputStream.close();
                                } catch (Exception e11) {
                                }
                            } catch (IOException e12) {
                                gZIPInputStream = null;
                            } catch (Throwable th3) {
                                byteArrayInputStream2 = byteArrayInputStream;
                                byteArrayOutputStream2 = byteArrayOutputStream;
                                th = th3;
                            }
                        } catch (IOException e13) {
                            byteArrayInputStream = null;
                            gZIPInputStream = null;
                        } catch (Throwable th4) {
                            byteArrayOutputStream2 = byteArrayOutputStream;
                            th = th4;
                        }
                    } catch (IOException e14) {
                        byteArrayInputStream = null;
                        byteArrayOutputStream = null;
                        gZIPInputStream = null;
                    } catch (Throwable th5) {
                        th = th5;
                    }
                }
            }
        }
        return bArr;
    }

    public static byte[] decode(byte[] bArr, int i, int i2, int i3) {
        byte[] bArr2;
        int i4;
        byte[] decodabet = getDecodabet(i3);
        byte[] bArr3 = new byte[(i2 * 3) / 4];
        int i5 = 0;
        byte[] bArr4 = new byte[4];
        int i6 = i;
        int i7 = 0;
        while (i6 < i + i2) {
            byte b = (byte) (bArr[i6] & Byte.MAX_VALUE);
            byte b2 = decodabet[b];
            if (b2 < -5) {
                System.err.println("Bad Base64 input character at " + i6 + ": " + ((int) bArr[i6]) + "(decimal)");
                bArr2 = null;
                break;
            }
            if (b2 >= -1) {
                int i8 = i7 + 1;
                bArr4[i7] = b;
                i7 = i8;
                i4 = i5;
                if (i8 > 3) {
                    i5 += decode4to3(bArr4, 0, bArr3, i5, i3);
                    i7 = 0;
                    i4 = i5;
                    if (b == EQUALS_SIGN) {
                        break;
                    }
                } else {
                    continue;
                }
            } else {
                i4 = i5;
            }
            i6++;
            i5 = i4;
        }
        bArr2 = new byte[i5];
        System.arraycopy(bArr3, 0, bArr2, 0, i5);
        return bArr2;
    }

    public static int decode4to3(byte[] bArr, int i, byte[] bArr2, int i2, int i3) {
        int i4;
        byte[] decodabet = getDecodabet(i3);
        if (bArr[i + 2] == EQUALS_SIGN) {
            bArr2[i2] = (byte) ((((decodabet[bArr[i]] & 255) << 18) | ((decodabet[bArr[i + 1]] & 255) << 12)) >>> 16);
            i4 = 1;
        } else if (bArr[i + 3] == EQUALS_SIGN) {
            int i5 = ((decodabet[bArr[i]] & 255) << 18) | ((decodabet[bArr[i + 1]] & 255) << 12) | ((decodabet[bArr[i + 2]] & 255) << 6);
            bArr2[i2] = (byte) (i5 >>> 16);
            bArr2[i2 + 1] = (byte) (i5 >>> 8);
            i4 = 2;
        } else {
            int i6 = ((decodabet[bArr[i]] & 255) << 18) | ((decodabet[bArr[i + 1]] & 255) << 12) | ((decodabet[bArr[i + 2]] & 255) << 6) | (decodabet[bArr[i + 3]] & 255);
            bArr2[i2] = (byte) (i6 >> 16);
            bArr2[i2 + 1] = (byte) (i6 >> 8);
            bArr2[i2 + 2] = (byte) i6;
            i4 = 3;
        }
        return i4;
    }

    public static void decodeFileToFile(String str, String str2) {
        Throwable th;
        IOException e;
        BufferedOutputStream bufferedOutputStream;
        BufferedOutputStream bufferedOutputStream2;
        byte[] decodeFromFile = decodeFromFile(str);
        BufferedOutputStream bufferedOutputStream3 = null;
        try {
            try {
                bufferedOutputStream3 = null;
                bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(str2));
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e2) {
            e = e2;
            bufferedOutputStream = null;
        }
        try {
            bufferedOutputStream2.write(decodeFromFile);
            try {
                bufferedOutputStream2.close();
            } catch (Exception e3) {
            }
        } catch (IOException e4) {
            bufferedOutputStream = bufferedOutputStream2;
            e = e4;
            e.printStackTrace();
            try {
                bufferedOutputStream.close();
            } catch (Exception e5) {
            }
        } catch (Throwable th3) {
            th = th3;
            bufferedOutputStream3 = bufferedOutputStream2;
            try {
                bufferedOutputStream3.close();
            } catch (Exception e6) {
            }
            throw th;
        }
    }

    public static byte[] decodeFromFile(String str) {
        Throwable th;
        byte[] bArr;
        byte[] bArr2;
        File file;
        int i;
        byte[] bArr3;
        InputStream inputStream = null;
        InputStream inputStream2 = null;
        try {
            try {
                file = new File(str);
                i = 0;
            } catch (IOException e) {
                bArr = null;
            }
            if (file.length() <= 2147483647L) {
                byte[] bArr4 = new byte[(int) file.length()];
                InputStream inputStream3 = new InputStream(new BufferedInputStream(new FileInputStream(file)), 0);
                while (true) {
                    bArr3 = null;
                    try {
                        int read = inputStream3.read(bArr4, i, 4096);
                        if (read < 0) {
                            break;
                        }
                        i += read;
                    } catch (IOException e2) {
                        inputStream = inputStream3;
                        bArr = bArr3;
                        InputStream inputStream4 = inputStream;
                        InputStream inputStream5 = inputStream;
                        InputStream inputStream6 = inputStream;
                        System.err.println("Error decoding from file " + str);
                        try {
                            inputStream.close();
                        } catch (Exception e3) {
                        }
                        bArr2 = bArr;
                        return bArr2;
                    } catch (Throwable th2) {
                        th = th2;
                        inputStream2 = inputStream3;
                        try {
                            inputStream2.close();
                        } catch (Exception e4) {
                        }
                        throw th;
                    }
                }
                byte[] bArr5 = new byte[i];
                bArr3 = bArr5;
                System.arraycopy(bArr4, 0, bArr5, 0, i);
                try {
                    inputStream3.close();
                    bArr = bArr5;
                } catch (Exception e5) {
                    bArr = bArr5;
                }
                bArr2 = bArr;
                return bArr2;
            }
            System.err.println("File is too big for this convenience method (" + file.length() + " bytes).");
            bArr2 = null;
            try {
                throw new NullPointerException();
            } catch (Exception e6) {
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public static boolean decodeToFile(String str, String str2) {
        OutputStream outputStream;
        Throwable th;
        OutputStream outputStream2;
        boolean z;
        try {
            outputStream2 = new OutputStream(new FileOutputStream(str2), 0);
        } catch (IOException e) {
            outputStream2 = null;
        } catch (Throwable th2) {
            th = th2;
            outputStream = null;
        }
        try {
            outputStream2.write(str.getBytes("UTF-8"));
            z = true;
            try {
                outputStream2.close();
            } catch (Exception e2) {
            }
        } catch (IOException e3) {
            z = false;
            try {
                outputStream2.close();
            } catch (Exception e4) {
            }
            return z;
        } catch (Throwable th3) {
            th = th3;
            outputStream = outputStream2;
            try {
                outputStream.close();
            } catch (Exception e5) {
            }
            throw th;
        }
        return z;
    }

    public static Object decodeToObject(String str) {
        Throwable th;
        ObjectInputStream objectInputStream;
        ClassNotFoundException e;
        ByteArrayInputStream byteArrayInputStream;
        Object obj;
        IOException e2;
        ObjectInputStream objectInputStream2 = null;
        ByteArrayInputStream byteArrayInputStream2 = null;
        ObjectInputStream objectInputStream3 = null;
        try {
            try {
                byteArrayInputStream = new ByteArrayInputStream(decode(str));
                try {
                    byteArrayInputStream2 = new ObjectInputStream(byteArrayInputStream);
                } catch (IOException e3) {
                    e2 = e3;
                } catch (ClassNotFoundException e4) {
                    e = e4;
                    objectInputStream = null;
                } catch (Throwable th2) {
                    byteArrayInputStream2 = byteArrayInputStream;
                    objectInputStream3 = null;
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e5) {
            e2 = e5;
            byteArrayInputStream = null;
        } catch (ClassNotFoundException e6) {
            e = e6;
            objectInputStream = null;
            byteArrayInputStream = null;
        }
        try {
            objectInputStream3 = byteArrayInputStream2.readObject();
            try {
                byteArrayInputStream.close();
            } catch (Exception e7) {
            }
            try {
                byteArrayInputStream2.close();
                obj = objectInputStream3;
            } catch (Exception e8) {
                obj = objectInputStream3;
            }
        } catch (IOException e9) {
            e2 = e9;
            objectInputStream2 = byteArrayInputStream2;
            objectInputStream3 = objectInputStream2;
            e2.printStackTrace();
            byteArrayInputStream2 = null;
            try {
                byteArrayInputStream.close();
            } catch (Exception e10) {
            }
            try {
                objectInputStream2.close();
                obj = null;
            } catch (Exception e11) {
                obj = null;
            }
            return obj;
        } catch (ClassNotFoundException e12) {
            e = e12;
            objectInputStream = byteArrayInputStream2;
            objectInputStream3 = objectInputStream;
            e.printStackTrace();
            byteArrayInputStream2 = null;
            try {
                byteArrayInputStream.close();
            } catch (Exception e13) {
            }
            try {
                objectInputStream.close();
                obj = null;
            } catch (Exception e14) {
                obj = null;
            }
            return obj;
        } catch (Throwable th4) {
            objectInputStream3 = byteArrayInputStream2;
            byteArrayInputStream2 = byteArrayInputStream;
            th = th4;
            try {
                byteArrayInputStream2.close();
            } catch (Exception e15) {
            }
            try {
                objectInputStream3.close();
            } catch (Exception e16) {
            }
            throw th;
        }
        return obj;
    }

    public static byte[] encode3to4(byte[] bArr, int i, int i2, byte[] bArr2, int i3, int i4) {
        int i5 = 0;
        byte[] alphabet = getAlphabet(i4);
        int i6 = i2 > 0 ? (bArr[i] << 24) >>> 8 : 0;
        int i7 = i2 > 1 ? (bArr[i + 1] << 24) >>> 16 : 0;
        if (i2 > 2) {
            i5 = (bArr[i + 2] << 24) >>> 24;
        }
        int i8 = i7 | i6 | i5;
        switch (i2) {
            case 1:
                bArr2[i3] = alphabet[i8 >>> 18];
                bArr2[i3 + 1] = alphabet[(i8 >>> 12) & 63];
                bArr2[i3 + 2] = (byte) EQUALS_SIGN;
                bArr2[i3 + 3] = (byte) EQUALS_SIGN;
                break;
            case 2:
                bArr2[i3] = alphabet[i8 >>> 18];
                bArr2[i3 + 1] = alphabet[(i8 >>> 12) & 63];
                bArr2[i3 + 2] = alphabet[(i8 >>> 6) & 63];
                bArr2[i3 + 3] = (byte) EQUALS_SIGN;
                break;
            case 3:
                bArr2[i3] = alphabet[i8 >>> 18];
                bArr2[i3 + 1] = alphabet[(i8 >>> 12) & 63];
                bArr2[i3 + 2] = alphabet[(i8 >>> 6) & 63];
                bArr2[i3 + 3] = alphabet[i8 & 63];
                break;
        }
        return bArr2;
    }

    public static byte[] encode3to4(byte[] bArr, byte[] bArr2, int i, int i2) {
        encode3to4(bArr2, 0, i, bArr, 0, i2);
        return bArr;
    }

    public static String encodeBytes(byte[] bArr) {
        return encodeBytes(bArr, 0, bArr.length, 0);
    }

    public static String encodeBytes(byte[] bArr, int i) {
        return encodeBytes(bArr, 0, bArr.length, i);
    }

    public static String encodeBytes(byte[] bArr, int i, int i2) {
        return encodeBytes(bArr, i, i2, 0);
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:100:0x002b */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:78:0x01e1 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:77:0x01dd -> B:117:0x0078). Please submit an issue!!! */
    public static String encodeBytes(byte[] bArr, int i, int i2, int i3) {
        String str;
        OutputStream outputStream;
        ByteArrayOutputStream byteArrayOutputStream;
        Throwable th;
        IOException e;
        OutputStream outputStream2;
        ByteArrayOutputStream byteArrayOutputStream2;
        ByteArrayOutputStream byteArrayOutputStream3;
        GZIPOutputStream gZIPOutputStream;
        if ((i3 & 2) == 2) {
            GZIPOutputStream gZIPOutputStream2 = null;
            Object obj = null;
            ByteArrayOutputStream byteArrayOutputStream4 = null;
            GZIPOutputStream gZIPOutputStream3 = null;
            try {
                try {
                    byteArrayOutputStream4 = null;
                    gZIPOutputStream3 = null;
                    byteArrayOutputStream3 = new ByteArrayOutputStream();
                    try {
                        outputStream2 = new OutputStream(byteArrayOutputStream3, i3 | 1);
                        try {
                            gZIPOutputStream = new GZIPOutputStream(outputStream2);
                        } catch (IOException e2) {
                            byteArrayOutputStream2 = byteArrayOutputStream3;
                            e = e2;
                        } catch (Throwable th2) {
                            th = th2;
                            outputStream = outputStream2;
                            byteArrayOutputStream = byteArrayOutputStream3;
                            gZIPOutputStream3 = null;
                        }
                    } catch (IOException e3) {
                        byteArrayOutputStream2 = byteArrayOutputStream3;
                        e = e3;
                        outputStream2 = null;
                    } catch (Throwable th3) {
                        th = th3;
                        byteArrayOutputStream = byteArrayOutputStream3;
                        outputStream = null;
                        gZIPOutputStream3 = null;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    byteArrayOutputStream = byteArrayOutputStream4;
                    outputStream = obj == 1 ? 1 : 0;
                }
            } catch (IOException e4) {
                e = e4;
                byteArrayOutputStream2 = null;
                outputStream2 = null;
            }
            try {
                gZIPOutputStream.write(bArr, i, i2);
                gZIPOutputStream.close();
                try {
                    gZIPOutputStream.close();
                } catch (Exception e5) {
                }
                try {
                    outputStream2.close();
                } catch (Exception e6) {
                }
                try {
                    byteArrayOutputStream3.close();
                } catch (Exception e7) {
                }
                try {
                    str = new String(byteArrayOutputStream3.toByteArray(), "UTF-8");
                    obj = gZIPOutputStream;
                } catch (UnsupportedEncodingException e8) {
                    str = new String(byteArrayOutputStream3.toByteArray());
                    obj = gZIPOutputStream;
                }
            } catch (IOException e9) {
                e = e9;
                byteArrayOutputStream2 = byteArrayOutputStream3;
                gZIPOutputStream2 = gZIPOutputStream;
                Object e10 = outputStream2;
                byteArrayOutputStream4 = byteArrayOutputStream2;
                gZIPOutputStream3 = gZIPOutputStream2;
                e.printStackTrace();
                try {
                    gZIPOutputStream2.close();
                } catch (Exception e11) {
                    e10 = e11;
                }
                try {
                    outputStream2.close();
                } catch (Exception e12) {
                }
                try {
                    byteArrayOutputStream2.close();
                    str = null;
                    obj = e10;
                } catch (Exception e13) {
                    str = null;
                    obj = e10;
                }
                return str;
            } catch (Throwable th5) {
                th = th5;
                outputStream = outputStream2;
                byteArrayOutputStream = byteArrayOutputStream3;
                gZIPOutputStream3 = gZIPOutputStream;
                try {
                    gZIPOutputStream3.close();
                } catch (Exception e14) {
                }
                try {
                    outputStream.close();
                } catch (Exception e15) {
                }
                try {
                    byteArrayOutputStream.close();
                } catch (Exception e16) {
                }
                throw th;
            }
        } else {
            boolean z = (i3 & 8) == 0;
            int i4 = (i2 * 4) / 3;
            byte[] bArr2 = new byte[(z ? i4 / 76 : 0) + i4 + (i2 % 3 > 0 ? 4 : 0)];
            int i5 = 0;
            int i6 = 0;
            int i7 = 0;
            while (i5 < i2 - 2) {
                encode3to4(bArr, i5 + i, 3, bArr2, i6, i3);
                int i8 = i7 + 4;
                int i9 = i6;
                i7 = i8;
                if (z) {
                    i9 = i6;
                    i7 = i8;
                    if (i8 == 76) {
                        bArr2[i6 + 4] = (byte) 10;
                        i9 = i6 + 1;
                        i7 = 0;
                    }
                }
                i5 += 3;
                i6 = i9 + 4;
            }
            int i10 = i6;
            if (i5 < i2) {
                encode3to4(bArr, i5 + i, i2 - i5, bArr2, i6, i3);
                i10 = i6 + 4;
            }
            try {
                str = new String(bArr2, 0, i10, "UTF-8");
            } catch (UnsupportedEncodingException e17) {
                str = new String(bArr2, 0, i10);
            }
        }
        return str;
    }

    public static void encodeFileToFile(String str, String str2) {
        BufferedOutputStream bufferedOutputStream;
        Throwable th;
        IOException e;
        BufferedOutputStream bufferedOutputStream2;
        String encodeFromFile = encodeFromFile(str);
        BufferedOutputStream bufferedOutputStream3 = null;
        try {
            try {
                bufferedOutputStream3 = null;
                bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(str2));
            } catch (Throwable th2) {
                th = th2;
                bufferedOutputStream = bufferedOutputStream3;
            }
        } catch (IOException e2) {
            e = e2;
            bufferedOutputStream2 = null;
        }
        try {
            bufferedOutputStream.write(encodeFromFile.getBytes("US-ASCII"));
            try {
                bufferedOutputStream.close();
            } catch (Exception e3) {
            }
        } catch (IOException e4) {
            bufferedOutputStream2 = bufferedOutputStream;
            e = e4;
            e.printStackTrace();
            try {
                bufferedOutputStream2.close();
            } catch (Exception e5) {
            }
        } catch (Throwable th3) {
            th = th3;
            try {
                bufferedOutputStream.close();
            } catch (Exception e6) {
            }
            throw th;
        }
    }

    public static String encodeFromFile(String str) {
        Throwable th;
        InputStream inputStream;
        String str2;
        InputStream inputStream2 = null;
        try {
            try {
                File file = new File(str);
                byte[] bArr = new byte[Math.max((int) (file.length() * 1.4d), 40)];
                int i = 0;
                inputStream = new InputStream(new BufferedInputStream(new FileInputStream(file)), 1);
                while (true) {
                    try {
                        int read = inputStream.read(bArr, i, 4096);
                        if (read < 0) {
                            break;
                        }
                        i += read;
                    } catch (IOException e) {
                        InputStream inputStream3 = inputStream;
                        InputStream inputStream4 = inputStream;
                        inputStream2 = inputStream;
                        System.err.println("Error encoding from file " + str);
                        try {
                            inputStream.close();
                            str2 = null;
                        } catch (Exception e2) {
                            str2 = null;
                        }
                        return str2;
                    } catch (Throwable th2) {
                        th = th2;
                        inputStream2 = inputStream;
                        try {
                            inputStream2.close();
                        } catch (Exception e3) {
                        }
                        throw th;
                    }
                }
                String str3 = new String(bArr, 0, i, "UTF-8");
                try {
                    inputStream.close();
                    str2 = str3;
                } catch (Exception e4) {
                    str2 = str3;
                }
            } catch (IOException e5) {
                inputStream = null;
            }
            return str2;
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public static String encodeObject(Serializable serializable) {
        return encodeObject(serializable, 0);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:64:0x017a -> B:111:0x00ca). Please submit an issue!!! */
    public static String encodeObject(Serializable serializable, int i) {
        ByteArrayOutputStream byteArrayOutputStream;
        Throwable th;
        OutputStream outputStream;
        OutputStream outputStream2;
        IOException e;
        ObjectOutputStream objectOutputStream;
        GZIPOutputStream gZIPOutputStream;
        ByteArrayOutputStream byteArrayOutputStream2;
        String str;
        ObjectOutputStream objectOutputStream2;
        GZIPOutputStream gZIPOutputStream2 = null;
        GZIPOutputStream gZIPOutputStream3 = null;
        OutputStream outputStream3 = null;
        ByteArrayOutputStream byteArrayOutputStream3 = null;
        GZIPOutputStream gZIPOutputStream4 = null;
        ObjectOutputStream objectOutputStream3 = null;
        try {
            try {
                ObjectOutputStream objectOutputStream4 = null;
                ObjectOutputStream objectOutputStream5 = null;
                GZIPOutputStream gZIPOutputStream5 = null;
                byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    OutputStream outputStream4 = new OutputStream(byteArrayOutputStream, i | 1);
                    try {
                        if ((i & 2) == 2) {
                            gZIPOutputStream3 = new GZIPOutputStream(outputStream4);
                            try {
                                objectOutputStream2 = new ObjectOutputStream(gZIPOutputStream3);
                            } catch (IOException e2) {
                                byteArrayOutputStream2 = byteArrayOutputStream;
                                outputStream2 = outputStream4;
                                e = e2;
                                gZIPOutputStream = gZIPOutputStream3;
                                objectOutputStream = null;
                                outputStream3 = outputStream2;
                                byteArrayOutputStream3 = byteArrayOutputStream2;
                                gZIPOutputStream4 = gZIPOutputStream;
                                objectOutputStream3 = objectOutputStream;
                                e.printStackTrace();
                                try {
                                    objectOutputStream.close();
                                } catch (Exception e3) {
                                }
                                try {
                                    gZIPOutputStream.close();
                                } catch (Exception e4) {
                                }
                                try {
                                    outputStream2.close();
                                } catch (Exception e5) {
                                }
                                try {
                                    byteArrayOutputStream2.close();
                                    str = null;
                                } catch (Exception e6) {
                                    str = null;
                                }
                                return str;
                            } catch (Throwable th2) {
                                outputStream = outputStream4;
                                objectOutputStream3 = null;
                                th = th2;
                                try {
                                    objectOutputStream3.close();
                                } catch (Exception e7) {
                                }
                                try {
                                    gZIPOutputStream3.close();
                                } catch (Exception e8) {
                                }
                                try {
                                    outputStream.close();
                                } catch (Exception e9) {
                                }
                                try {
                                    byteArrayOutputStream.close();
                                } catch (Exception e10) {
                                }
                                throw th;
                            }
                        } else {
                            objectOutputStream2 = new ObjectOutputStream(outputStream4);
                        }
                        gZIPOutputStream2 = gZIPOutputStream3;
                        objectOutputStream5 = objectOutputStream2;
                        gZIPOutputStream5 = gZIPOutputStream3;
                        objectOutputStream4 = objectOutputStream2;
                        objectOutputStream2.writeObject(serializable);
                        try {
                            objectOutputStream2.close();
                        } catch (Exception e11) {
                        }
                        try {
                            gZIPOutputStream3.close();
                        } catch (Exception e12) {
                        }
                        try {
                            outputStream4.close();
                        } catch (Exception e13) {
                        }
                        try {
                            byteArrayOutputStream.close();
                        } catch (Exception e14) {
                        }
                        try {
                            str = new String(byteArrayOutputStream.toByteArray(), "UTF-8");
                        } catch (UnsupportedEncodingException e15) {
                            str = new String(byteArrayOutputStream.toByteArray());
                        }
                    } catch (IOException e16) {
                        e = e16;
                        byteArrayOutputStream2 = byteArrayOutputStream;
                        outputStream2 = outputStream4;
                        gZIPOutputStream = gZIPOutputStream5;
                        objectOutputStream = objectOutputStream4;
                    } catch (Throwable th3) {
                        outputStream = outputStream4;
                        gZIPOutputStream3 = gZIPOutputStream2;
                        objectOutputStream3 = objectOutputStream5;
                        th = th3;
                    }
                } catch (IOException e17) {
                    e = e17;
                    byteArrayOutputStream2 = byteArrayOutputStream;
                    outputStream2 = null;
                    gZIPOutputStream = null;
                    objectOutputStream = null;
                } catch (Throwable th4) {
                    th = th4;
                    outputStream = null;
                    gZIPOutputStream3 = null;
                    objectOutputStream3 = null;
                }
            } catch (IOException e18) {
                e = e18;
                objectOutputStream = null;
                gZIPOutputStream = null;
                byteArrayOutputStream2 = null;
                outputStream2 = null;
            }
            return str;
        } catch (Throwable th5) {
            th = th5;
            gZIPOutputStream3 = gZIPOutputStream4;
            byteArrayOutputStream = byteArrayOutputStream3;
            outputStream = outputStream3;
        }
    }

    public static boolean encodeToFile(byte[] bArr, String str) {
        OutputStream outputStream;
        Throwable th;
        OutputStream outputStream2;
        boolean z;
        try {
            outputStream2 = new OutputStream(new FileOutputStream(str), 1);
            try {
                outputStream2.write(bArr);
                z = true;
                try {
                    outputStream2.close();
                } catch (Exception e) {
                }
            } catch (IOException e2) {
                z = false;
                try {
                    outputStream2.close();
                } catch (Exception e3) {
                }
                return z;
            } catch (Throwable th2) {
                th = th2;
                outputStream = outputStream2;
                try {
                    outputStream.close();
                } catch (Exception e4) {
                }
                throw th;
            }
        } catch (IOException e5) {
            outputStream2 = null;
        } catch (Throwable th3) {
            th = th3;
            outputStream = null;
        }
        return z;
    }

    public static final byte[] getAlphabet(int i) {
        return (i & 16) == 16 ? _URL_SAFE_ALPHABET : (i & 32) == 32 ? _ORDERED_ALPHABET : _STANDARD_ALPHABET;
    }

    public static final byte[] getDecodabet(int i) {
        return (i & 16) == 16 ? _URL_SAFE_DECODABET : (i & 32) == 32 ? _ORDERED_DECODABET : _STANDARD_DECODABET;
    }

    private static final void usage(String str) {
        System.err.println(str);
        System.err.println("Usage: java Base64 -e|-d inputfile outputfile");
    }
}
