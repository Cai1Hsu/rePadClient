package org.apache.commons.io.output;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.SequenceInputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.io.input.ClosedInputStream;

/* loaded from: classes.jar:org/apache/commons/io/output/ByteArrayOutputStream.class */
public class ByteArrayOutputStream extends OutputStream {
    private static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
    private final List<byte[]> buffers;
    private int count;
    private byte[] currentBuffer;
    private int currentBufferIndex;
    private int filledBufferSum;

    public ByteArrayOutputStream() {
        this(1024);
    }

    public ByteArrayOutputStream(int i) {
        this.buffers = new ArrayList();
        if (i < 0) {
            throw new IllegalArgumentException("Negative initial size: " + i);
        }
        synchronized (this) {
            needNewBuffer(i);
        }
    }

    private void needNewBuffer(int i) {
        if (this.currentBufferIndex < this.buffers.size() - 1) {
            this.filledBufferSum += this.currentBuffer.length;
            this.currentBufferIndex++;
            this.currentBuffer = this.buffers.get(this.currentBufferIndex);
            return;
        }
        if (this.currentBuffer == null) {
            this.filledBufferSum = 0;
        } else {
            i = Math.max(this.currentBuffer.length << 1, i - this.filledBufferSum);
            this.filledBufferSum += this.currentBuffer.length;
        }
        this.currentBufferIndex++;
        this.currentBuffer = new byte[i];
        this.buffers.add(this.currentBuffer);
    }

    private InputStream toBufferedInputStream() {
        InputStream sequenceInputStream;
        int i = this.count;
        if (i == 0) {
            sequenceInputStream = new ClosedInputStream();
        } else {
            ArrayList arrayList = new ArrayList(this.buffers.size());
            for (byte[] bArr : this.buffers) {
                int min = Math.min(bArr.length, i);
                arrayList.add(new ByteArrayInputStream(bArr, 0, min));
                int i2 = i - min;
                i = i2;
                if (i2 == 0) {
                    break;
                }
            }
            sequenceInputStream = new SequenceInputStream(Collections.enumeration(arrayList));
        }
        return sequenceInputStream;
    }

    public static InputStream toBufferedInputStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byteArrayOutputStream.write(inputStream);
        return byteArrayOutputStream.toBufferedInputStream();
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }

    public void reset() {
        synchronized (this) {
            this.count = 0;
            this.filledBufferSum = 0;
            this.currentBufferIndex = 0;
            this.currentBuffer = this.buffers.get(this.currentBufferIndex);
        }
    }

    public int size() {
        int i;
        synchronized (this) {
            i = this.count;
        }
        return i;
    }

    public byte[] toByteArray() {
        byte[] bArr;
        synchronized (this) {
            int i = this.count;
            if (i != 0) {
                byte[] bArr2 = new byte[i];
                int i2 = 0;
                Iterator<byte[]> it = this.buffers.iterator();
                while (true) {
                    bArr = bArr2;
                    if (!it.hasNext()) {
                        break;
                    }
                    byte[] next = it.next();
                    int min = Math.min(next.length, i);
                    System.arraycopy(next, 0, bArr2, i2, min);
                    i2 += min;
                    int i3 = i - min;
                    i = i3;
                    if (i3 == 0) {
                        bArr = bArr2;
                        break;
                    }
                }
            } else {
                bArr = EMPTY_BYTE_ARRAY;
            }
        }
        return bArr;
    }

    public String toString() {
        return new String(toByteArray());
    }

    public String toString(String str) throws UnsupportedEncodingException {
        return new String(toByteArray(), str);
    }

    public int write(InputStream inputStream) throws IOException {
        int i;
        synchronized (this) {
            i = 0;
            int i2 = this.count - this.filledBufferSum;
            int read = inputStream.read(this.currentBuffer, i2, this.currentBuffer.length - i2);
            while (read != -1) {
                int i3 = i + read;
                int i4 = i2 + read;
                this.count += read;
                int i5 = i4;
                if (i4 == this.currentBuffer.length) {
                    needNewBuffer(this.currentBuffer.length);
                    i5 = 0;
                }
                i2 = i5;
                read = inputStream.read(this.currentBuffer, i5, this.currentBuffer.length - i5);
                i = i3;
            }
        }
        return i;
    }

    @Override // java.io.OutputStream
    public void write(int i) {
        synchronized (this) {
            int i2 = this.count - this.filledBufferSum;
            int i3 = i2;
            if (i2 == this.currentBuffer.length) {
                needNewBuffer(this.count + 1);
                i3 = 0;
            }
            this.currentBuffer[i3] = (byte) i;
            this.count++;
        }
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) {
        if (i < 0 || i > bArr.length || i2 < 0 || i + i2 > bArr.length || i + i2 < 0) {
            throw new IndexOutOfBoundsException();
        }
        if (i2 == 0) {
            return;
        }
        synchronized (this) {
            int i3 = this.count + i2;
            int i4 = i2;
            int i5 = this.count - this.filledBufferSum;
            while (i4 > 0) {
                int min = Math.min(i4, this.currentBuffer.length - i5);
                System.arraycopy(bArr, (i + i2) - i4, this.currentBuffer, i5, min);
                int i6 = i4 - min;
                i4 = i6;
                if (i6 > 0) {
                    needNewBuffer(i3);
                    i5 = 0;
                    i4 = i6;
                }
            }
            this.count = i3;
        }
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        int i;
        synchronized (this) {
            int i2 = this.count;
            Iterator<byte[]> it = this.buffers.iterator();
            do {
                if (!it.hasNext()) {
                    break;
                }
                byte[] next = it.next();
                int min = Math.min(next.length, i2);
                outputStream.write(next, 0, min);
                i = i2 - min;
                i2 = i;
            } while (i != 0);
        }
    }
}
