package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;

/* loaded from: classes.jar:org/apache/commons/io/input/ReaderInputStream.class */
public class ReaderInputStream extends InputStream {
    private static final int DEFAULT_BUFFER_SIZE = 1024;
    private final CharsetEncoder encoder;
    private final CharBuffer encoderIn;
    private final ByteBuffer encoderOut;
    private boolean endOfInput;
    private CoderResult lastCoderResult;
    private final Reader reader;

    public ReaderInputStream(Reader reader) {
        this(reader, Charset.defaultCharset());
    }

    public ReaderInputStream(Reader reader, String str) {
        this(reader, str, 1024);
    }

    public ReaderInputStream(Reader reader, String str, int i) {
        this(reader, Charset.forName(str), i);
    }

    public ReaderInputStream(Reader reader, Charset charset) {
        this(reader, charset, 1024);
    }

    public ReaderInputStream(Reader reader, Charset charset, int i) {
        this(reader, charset.newEncoder().onMalformedInput(CodingErrorAction.REPLACE).onUnmappableCharacter(CodingErrorAction.REPLACE), i);
    }

    public ReaderInputStream(Reader reader, CharsetEncoder charsetEncoder) {
        this(reader, charsetEncoder, 1024);
    }

    public ReaderInputStream(Reader reader, CharsetEncoder charsetEncoder, int i) {
        this.reader = reader;
        this.encoder = charsetEncoder;
        this.encoderIn = CharBuffer.allocate(i);
        this.encoderIn.flip();
        this.encoderOut = ByteBuffer.allocate(128);
        this.encoderOut.flip();
    }

    private void fillBuffer() throws IOException {
        if (!this.endOfInput && (this.lastCoderResult == null || this.lastCoderResult.isUnderflow())) {
            this.encoderIn.compact();
            int position = this.encoderIn.position();
            int read = this.reader.read(this.encoderIn.array(), position, this.encoderIn.remaining());
            if (read == -1) {
                this.endOfInput = true;
            } else {
                this.encoderIn.position(position + read);
            }
            this.encoderIn.flip();
        }
        this.encoderOut.compact();
        this.lastCoderResult = this.encoder.encode(this.encoderIn, this.encoderOut, this.endOfInput);
        this.encoderOut.flip();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.reader.close();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int i;
        while (true) {
            if (!this.encoderOut.hasRemaining()) {
                fillBuffer();
                if (this.endOfInput && !this.encoderOut.hasRemaining()) {
                    i = -1;
                    break;
                }
            } else {
                i = this.encoderOut.get() & 255;
                break;
            }
        }
        return i;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        if (bArr == null) {
            throw new NullPointerException("Byte array must not be null");
        }
        if (i2 < 0 || i < 0 || i + i2 > bArr.length) {
            throw new IndexOutOfBoundsException("Array Size=" + bArr.length + ", offset=" + i + ", length=" + i2);
        }
        int i4 = 0;
        int i5 = i;
        int i6 = i2;
        if (i2 == 0) {
            i3 = 0;
        } else {
            while (i6 > 0) {
                if (!this.encoderOut.hasRemaining()) {
                    fillBuffer();
                    if (this.endOfInput && !this.encoderOut.hasRemaining()) {
                        break;
                    }
                } else {
                    int min = Math.min(this.encoderOut.remaining(), i6);
                    this.encoderOut.get(bArr, i5, min);
                    i5 += min;
                    i6 -= min;
                    i4 += min;
                }
            }
            i3 = (i4 != 0 || !this.endOfInput) ? i4 : -1;
        }
        return i3;
    }
}
