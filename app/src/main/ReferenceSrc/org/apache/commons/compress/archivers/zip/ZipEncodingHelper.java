package org.apache.commons.compress.archivers.zip;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipEncodingHelper.class */
public abstract class ZipEncodingHelper {
    private static final String UTF_DASH_8 = "UTF-8";
    private static final Map<String, SimpleEncodingHolder> simpleEncodings = new HashMap();
    private static final byte[] HEX_DIGITS = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70};
    static final String UTF8 = "UTF8";
    static final ZipEncoding UTF8_ZIP_ENCODING = new FallbackZipEncoding(UTF8);

    /* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipEncodingHelper$SimpleEncodingHolder.class */
    private static class SimpleEncodingHolder {
        private Simple8BitZipEncoding encoding;
        private final char[] highChars;

        SimpleEncodingHolder(char[] cArr) {
            this.highChars = cArr;
        }

        public Simple8BitZipEncoding getEncoding() {
            Simple8BitZipEncoding simple8BitZipEncoding;
            synchronized (this) {
                if (this.encoding == null) {
                    this.encoding = new Simple8BitZipEncoding(this.highChars);
                }
                simple8BitZipEncoding = this.encoding;
            }
            return simple8BitZipEncoding;
        }
    }

    static {
        SimpleEncodingHolder simpleEncodingHolder = new SimpleEncodingHolder(new char[]{199, 252, 233, 226, 228, 224, 229, 231, 234, 235, 232, 239, 238, 236, 196, 197, 201, 230, 198, 244, 246, 242, 251, 249, 255, 214, 220, 162, 163, 165, 8359, 402, 225, 237, 243, 250, 241, 209, 170, 186, 191, 8976, 172, 189, 188, 161, 171, 187, 9617, 9618, 9619, 9474, 9508, 9569, 9570, 9558, 9557, 9571, 9553, 9559, 9565, 9564, 9563, 9488, 9492, 9524, 9516, 9500, 9472, 9532, 9566, 9567, 9562, 9556, 9577, 9574, 9568, 9552, 9580, 9575, 9576, 9572, 9573, 9561, 9560, 9554, 9555, 9579, 9578, 9496, 9484, 9608, 9604, 9612, 9616, 9600, 945, 223, 915, 960, 931, 963, 181, 964, 934, 920, 937, 948, 8734, 966, 949, 8745, 8801, 177, 8805, 8804, 8992, 8993, 247, 8776, 176, 8729, 183, 8730, 8319, 178, 9632, 160});
        simpleEncodings.put("CP437", simpleEncodingHolder);
        simpleEncodings.put("Cp437", simpleEncodingHolder);
        simpleEncodings.put("cp437", simpleEncodingHolder);
        simpleEncodings.put("IBM437", simpleEncodingHolder);
        simpleEncodings.put("ibm437", simpleEncodingHolder);
        SimpleEncodingHolder simpleEncodingHolder2 = new SimpleEncodingHolder(new char[]{199, 252, 233, 226, 228, 224, 229, 231, 234, 235, 232, 239, 238, 236, 196, 197, 201, 230, 198, 244, 246, 242, 251, 249, 255, 214, 220, 248, 163, 216, 215, 402, 225, 237, 243, 250, 241, 209, 170, 186, 191, 174, 172, 189, 188, 161, 171, 187, 9617, 9618, 9619, 9474, 9508, 193, 194, 192, 169, 9571, 9553, 9559, 9565, 162, 165, 9488, 9492, 9524, 9516, 9500, 9472, 9532, 227, 195, 9562, 9556, 9577, 9574, 9568, 9552, 9580, 164, 240, 208, 202, 203, 200, 305, 205, 206, 207, 9496, 9484, 9608, 9604, 166, 204, 9600, 211, 223, 212, 210, 245, 213, 181, 254, 222, 218, 219, 217, 253, 221, 175, 180, 173, 177, 8215, 190, 182, 167, 247, 184, 176, 168, 183, 185, 179, 178, 9632, 160});
        simpleEncodings.put("CP850", simpleEncodingHolder2);
        simpleEncodings.put("Cp850", simpleEncodingHolder2);
        simpleEncodings.put("cp850", simpleEncodingHolder2);
        simpleEncodings.put("IBM850", simpleEncodingHolder2);
        simpleEncodings.put("ibm850", simpleEncodingHolder2);
    }

    static void appendSurrogate(ByteBuffer byteBuffer, char c) {
        byteBuffer.put((byte) 37);
        byteBuffer.put((byte) 85);
        byteBuffer.put(HEX_DIGITS[(c >> '\f') & 15]);
        byteBuffer.put(HEX_DIGITS[(c >> '\b') & 15]);
        byteBuffer.put(HEX_DIGITS[(c >> 4) & 15]);
        byteBuffer.put(HEX_DIGITS[c & 15]);
    }

    public static ZipEncoding getZipEncoding(String str) {
        ZipEncoding fallbackZipEncoding;
        if (isUTF8(str)) {
            fallbackZipEncoding = UTF8_ZIP_ENCODING;
        } else if (str == null) {
            fallbackZipEncoding = new FallbackZipEncoding();
        } else {
            SimpleEncodingHolder simpleEncodingHolder = simpleEncodings.get(str);
            if (simpleEncodingHolder != null) {
                fallbackZipEncoding = simpleEncodingHolder.getEncoding();
            } else {
                try {
                    fallbackZipEncoding = new NioZipEncoding(Charset.forName(str));
                } catch (UnsupportedCharsetException e) {
                    fallbackZipEncoding = new FallbackZipEncoding(str);
                }
            }
        }
        return fallbackZipEncoding;
    }

    static ByteBuffer growBuffer(ByteBuffer byteBuffer, int i) {
        byteBuffer.limit(byteBuffer.position());
        byteBuffer.rewind();
        int capacity = byteBuffer.capacity() * 2;
        if (capacity >= i) {
            i = capacity;
        }
        ByteBuffer allocate = ByteBuffer.allocate(i);
        allocate.put(byteBuffer);
        return allocate;
    }

    static boolean isUTF8(String str) {
        String str2 = str;
        if (str == null) {
            str2 = System.getProperty("file.encoding");
        }
        return UTF8.equalsIgnoreCase(str2) || "UTF-8".equalsIgnoreCase(str2);
    }
}
