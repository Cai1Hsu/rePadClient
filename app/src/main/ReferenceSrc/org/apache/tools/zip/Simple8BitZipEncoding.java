package org.apache.tools.zip;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.jar:org/apache/tools/zip/Simple8BitZipEncoding.class */
class Simple8BitZipEncoding implements ZipEncoding {
    private final char[] highChars;
    private final List reverseMapping;

    /* loaded from: classes.jar:org/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar.class */
    private static final class Simple8BitChar implements Comparable {
        public final byte code;
        public final char unicode;

        Simple8BitChar(byte b, char c) {
            this.code = b;
            this.unicode = c;
        }

        @Override // java.lang.Comparable
        public int compareTo(Object obj) {
            return this.unicode - ((Simple8BitChar) obj).unicode;
        }

        public String toString() {
            return new StringBuffer().append("0x").append(Integer.toHexString(65535 & this.unicode)).append("->0x").append(Integer.toHexString(this.code & 255)).toString();
        }
    }

    public Simple8BitZipEncoding(char[] cArr) {
        this.highChars = cArr;
        this.reverseMapping = new ArrayList(this.highChars.length);
        byte b = Byte.MAX_VALUE;
        int i = 0;
        while (i < this.highChars.length) {
            byte b2 = (byte) (b + 1);
            this.reverseMapping.add(new Simple8BitChar(b2, this.highChars[i]));
            i++;
            b = b2;
        }
        Collections.sort(this.reverseMapping);
    }

    private Simple8BitChar encodeHighChar(char c) {
        Simple8BitChar simple8BitChar;
        int i = 0;
        int size = this.reverseMapping.size();
        while (true) {
            if (size > i) {
                int i2 = i + ((size - i) / 2);
                simple8BitChar = (Simple8BitChar) this.reverseMapping.get(i2);
                if (simple8BitChar.unicode == c) {
                    break;
                } else if (simple8BitChar.unicode < c) {
                    i = i2 + 1;
                } else {
                    size = i2;
                }
            } else if (i >= this.reverseMapping.size()) {
                simple8BitChar = null;
            } else {
                simple8BitChar = (Simple8BitChar) this.reverseMapping.get(i);
                if (simple8BitChar.unicode != c) {
                    simple8BitChar = null;
                }
            }
        }
        return simple8BitChar;
    }

    @Override // org.apache.tools.zip.ZipEncoding
    public boolean canEncode(String str) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= str.length()) {
                z = true;
                break;
            } else if (!canEncodeChar(str.charAt(i))) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public boolean canEncodeChar(char c) {
        boolean z = true;
        if ((c < 0 || c >= 128) && encodeHighChar(c) == null) {
            z = false;
        }
        return z;
    }

    @Override // org.apache.tools.zip.ZipEncoding
    public String decode(byte[] bArr) throws IOException {
        char[] cArr = new char[bArr.length];
        for (int i = 0; i < bArr.length; i++) {
            cArr[i] = decodeByte(bArr[i]);
        }
        return new String(cArr);
    }

    public char decodeByte(byte b) {
        return b >= 0 ? (char) b : this.highChars[b + 128];
    }

    @Override // org.apache.tools.zip.ZipEncoding
    public ByteBuffer encode(String str) {
        ByteBuffer allocate = ByteBuffer.allocate(str.length() + 6 + ((str.length() + 1) / 2));
        int i = 0;
        while (i < str.length()) {
            char charAt = str.charAt(i);
            ByteBuffer byteBuffer = allocate;
            if (allocate.remaining() < 6) {
                byteBuffer = ZipEncodingHelper.growBuffer(allocate, allocate.position() + 6);
            }
            if (!pushEncodedChar(byteBuffer, charAt)) {
                ZipEncodingHelper.appendSurrogate(byteBuffer, charAt);
            }
            i++;
            allocate = byteBuffer;
        }
        allocate.limit(allocate.position());
        allocate.rewind();
        return allocate;
    }

    public boolean pushEncodedChar(ByteBuffer byteBuffer, char c) {
        boolean z = true;
        if (c < 0 || c >= 128) {
            Simple8BitChar encodeHighChar = encodeHighChar(c);
            if (encodeHighChar == null) {
                z = false;
            } else {
                byteBuffer.put(encodeHighChar.code);
            }
        } else {
            byteBuffer.put((byte) c);
        }
        return z;
    }
}
