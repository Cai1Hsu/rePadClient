package org.apache.commons.io.input;

import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import org.apache.commons.compress.utils.CharsetNames;
import org.apache.commons.io.Charsets;

/* loaded from: classes.jar:org/apache/commons/io/input/ReversedLinesFileReader.class */
public class ReversedLinesFileReader implements Closeable {
    private final int avoidNewlineSplitBufferSize;
    private final int blockSize;
    private final int byteDecrement;
    private FilePart currentFilePart;
    private final Charset encoding;
    private final byte[][] newLineSequences;
    private final RandomAccessFile randomAccessFile;
    private final long totalBlockCount;
    private final long totalByteLength;
    private boolean trailingNewlineOfFileSkipped;

    /* loaded from: classes.jar:org/apache/commons/io/input/ReversedLinesFileReader$FilePart.class */
    private class FilePart {
        private int currentLastBytePos;
        private final byte[] data;
        private byte[] leftOver;
        private final long no;

        private FilePart(long j, int i, byte[] bArr) throws IOException {
            ReversedLinesFileReader.this = r7;
            this.no = j;
            this.data = new byte[i + (bArr != null ? bArr.length : 0)];
            long j2 = r7.blockSize;
            if (j > 0) {
                r7.randomAccessFile.seek((j - 1) * j2);
                if (r7.randomAccessFile.read(this.data, 0, i) != i) {
                    throw new IllegalStateException("Count of requested bytes and actually read bytes don't match");
                }
            }
            if (bArr != null) {
                System.arraycopy(bArr, 0, this.data, i, bArr.length);
            }
            this.currentLastBytePos = this.data.length - 1;
            this.leftOver = null;
        }

        private void createLeftOver() {
            int i = this.currentLastBytePos + 1;
            if (i > 0) {
                this.leftOver = new byte[i];
                System.arraycopy(this.data, 0, this.leftOver, 0, i);
            } else {
                this.leftOver = null;
            }
            this.currentLastBytePos = -1;
        }

        private int getNewLineMatchByteCount(byte[] bArr, int i) {
            int i2;
            byte[][] bArr2 = ReversedLinesFileReader.this.newLineSequences;
            int length = bArr2.length;
            int i3 = 0;
            while (true) {
                i2 = 0;
                if (i3 >= length) {
                    break;
                }
                byte[] bArr3 = bArr2[i3];
                boolean z = true;
                for (int length2 = bArr3.length - 1; length2 >= 0; length2--) {
                    int length3 = (i + length2) - (bArr3.length - 1);
                    z &= length3 >= 0 && bArr[length3] == bArr3[length2];
                }
                if (z) {
                    i2 = bArr3.length;
                    break;
                }
                i3++;
            }
            return i2;
        }

        public String readLine() throws IOException {
            String str;
            boolean z = this.no == 1;
            int i = this.currentLastBytePos;
            while (true) {
                str = null;
                if (i > -1) {
                    if (!z && i < ReversedLinesFileReader.this.avoidNewlineSplitBufferSize) {
                        createLeftOver();
                        str = null;
                        break;
                    }
                    int newLineMatchByteCount = getNewLineMatchByteCount(this.data, i);
                    if (newLineMatchByteCount <= 0) {
                        int i2 = i - ReversedLinesFileReader.this.byteDecrement;
                        i = i2;
                        if (i2 < 0) {
                            createLeftOver();
                            str = null;
                            break;
                        }
                    } else {
                        int i3 = i + 1;
                        int i4 = (this.currentLastBytePos - i3) + 1;
                        if (i4 < 0) {
                            throw new IllegalStateException("Unexpected negative line length=" + i4);
                        }
                        byte[] bArr = new byte[i4];
                        System.arraycopy(this.data, i3, bArr, 0, i4);
                        str = new String(bArr, ReversedLinesFileReader.this.encoding);
                        this.currentLastBytePos = i - newLineMatchByteCount;
                    }
                } else {
                    break;
                }
            }
            String str2 = str;
            if (z) {
                str2 = str;
                if (this.leftOver != null) {
                    str2 = new String(this.leftOver, ReversedLinesFileReader.this.encoding);
                    this.leftOver = null;
                }
            }
            return str2;
        }

        public FilePart rollOver() throws IOException {
            FilePart filePart;
            if (this.currentLastBytePos > -1) {
                throw new IllegalStateException("Current currentLastCharPos unexpectedly positive... last readLine() should have returned something! currentLastCharPos=" + this.currentLastBytePos);
            }
            if (this.no > 1) {
                filePart = new FilePart(this.no - 1, ReversedLinesFileReader.this.blockSize, this.leftOver);
            } else if (this.leftOver != null) {
                throw new IllegalStateException("Unexpected leftover of the last block: leftOverOfThisFilePart=" + new String(this.leftOver, ReversedLinesFileReader.this.encoding));
            } else {
                filePart = null;
            }
            return filePart;
        }
    }

    public ReversedLinesFileReader(File file) throws IOException {
        this(file, 4096, Charset.defaultCharset().toString());
    }

    public ReversedLinesFileReader(File file, int i, String str) throws IOException {
        this(file, i, Charsets.toCharset(str));
    }

    /* JADX WARN: Type inference failed for: r1v31, types: [byte[], byte[][]] */
    public ReversedLinesFileReader(File file, int i, Charset charset) throws IOException {
        this.trailingNewlineOfFileSkipped = false;
        this.blockSize = i;
        this.encoding = charset;
        this.randomAccessFile = new RandomAccessFile(file, "r");
        this.totalByteLength = this.randomAccessFile.length();
        int i2 = (int) (this.totalByteLength % i);
        if (i2 > 0) {
            this.totalBlockCount = (this.totalByteLength / i) + 1;
        } else {
            this.totalBlockCount = this.totalByteLength / i;
            if (this.totalByteLength > 0) {
                i2 = i;
            }
        }
        this.currentFilePart = new FilePart(this.totalBlockCount, i2, null);
        Charset charset2 = Charsets.toCharset(charset);
        if (charset2.newEncoder().maxBytesPerChar() == 1.0f) {
            this.byteDecrement = 1;
        } else if (charset2 == Charset.forName("UTF-8")) {
            this.byteDecrement = 1;
        } else if (charset2 == Charset.forName("Shift_JIS")) {
            this.byteDecrement = 1;
        } else if (charset2 != Charset.forName(CharsetNames.UTF_16BE) && charset2 != Charset.forName(CharsetNames.UTF_16LE)) {
            if (charset2 != Charset.forName("UTF-16")) {
                throw new UnsupportedEncodingException("Encoding " + charset + " is not supported yet (feel free to submit a patch)");
            }
            throw new UnsupportedEncodingException("For UTF-16, you need to specify the byte order (use UTF-16BE or UTF-16LE)");
        } else {
            this.byteDecrement = 2;
        }
        this.newLineSequences = new byte[]{"\r\n".getBytes(charset), "\n".getBytes(charset), "\r".getBytes(charset)};
        this.avoidNewlineSplitBufferSize = this.newLineSequences[0].length;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.randomAccessFile.close();
    }

    public String readLine() throws IOException {
        String str;
        String readLine = this.currentFilePart.readLine();
        while (true) {
            str = readLine;
            if (str != null) {
                break;
            }
            this.currentFilePart = this.currentFilePart.rollOver();
            if (this.currentFilePart == null) {
                break;
            }
            readLine = this.currentFilePart.readLine();
        }
        String str2 = str;
        if ("".equals(str)) {
            str2 = str;
            if (!this.trailingNewlineOfFileSkipped) {
                this.trailingNewlineOfFileSkipped = true;
                str2 = readLine();
            }
        }
        return str2;
    }
}
