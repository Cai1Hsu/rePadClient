package org.apache.commons.compress.archivers.zip;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/Simple8BitZipEncoding.class */
class Simple8BitZipEncoding implements ZipEncoding {
    private final char[] highChars;
    private final List<Simple8BitChar> reverseMapping;

    /* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/Simple8BitZipEncoding$Simple8BitChar.class */
    private static final class Simple8BitChar implements Comparable<Simple8BitChar> {
        public final byte code;
        public final char unicode;

        Simple8BitChar(byte b, char c) {
            this.code = b;
            this.unicode = c;
        }

        public int compareTo(Simple8BitChar simple8BitChar) {
            return this.unicode - simple8BitChar.unicode;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (obj instanceof Simple8BitChar) {
                Simple8BitChar simple8BitChar = (Simple8BitChar) obj;
                z = false;
                if (this.unicode == simple8BitChar.unicode) {
                    z = false;
                    if (this.code == simple8BitChar.code) {
                        z = true;
                    }
                }
            }
            return z;
        }

        public int hashCode() {
            return this.unicode;
        }

        public String toString() {
            return "0x" + Integer.toHexString(65535 & this.unicode) + "->0x" + Integer.toHexString(this.code & 255);
        }
    }

    public Simple8BitZipEncoding(char[] cArr) {
        this.highChars = (char[]) cArr.clone();
        ArrayList arrayList = new ArrayList(this.highChars.length);
        byte b = Byte.MAX_VALUE;
        int i = 0;
        while (i < this.highChars.length) {
            byte b2 = (byte) (b + 1);
            arrayList.add(new Simple8BitChar(b2, this.highChars[i]));
            i++;
            b = b2;
        }
        Collections.sort(arrayList);
        this.reverseMapping = Collections.unmodifiableList(arrayList);
    }

    private Simple8BitChar encodeHighChar(char c) {
        Simple8BitChar simple8BitChar;
        int i = 0;
        int size = this.reverseMapping.size();
        while (true) {
            if (size > i) {
                int i2 = i + ((size - i) / 2);
                simple8BitChar = this.reverseMapping.get(i2);
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
                simple8BitChar = this.reverseMapping.get(i);
                if (simple8BitChar.unicode != c) {
                    simple8BitChar = null;
                }
            }
        }
        return simple8BitChar;
    }

    @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
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

    @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
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

    @Override // org.apache.commons.compress.archivers.zip.ZipEncoding
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
