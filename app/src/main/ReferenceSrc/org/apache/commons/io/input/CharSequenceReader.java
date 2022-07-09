package org.apache.commons.io.input;

import java.io.Reader;
import java.io.Serializable;

/* loaded from: classes.jar:org/apache/commons/io/input/CharSequenceReader.class */
public class CharSequenceReader extends Reader implements Serializable {
    private final CharSequence charSequence;
    private int idx;
    private int mark;

    public CharSequenceReader(String str) {
        this.charSequence = str == null ? "" : str;
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.idx = 0;
        this.mark = 0;
    }

    @Override // java.io.Reader
    public void mark(int i) {
        this.mark = this.idx;
    }

    @Override // java.io.Reader
    public boolean markSupported() {
        return true;
    }

    @Override // java.io.Reader
    public int read() {
        char charAt;
        if (this.idx >= this.charSequence.length()) {
            charAt = 65535;
        } else {
            CharSequence charSequence = this.charSequence;
            int i = this.idx;
            this.idx = i + 1;
            charAt = charSequence.charAt(i);
        }
        return charAt;
    }

    @Override // java.io.Reader
    public int read(char[] cArr, int i, int i2) {
        int i3;
        int read;
        if (this.idx < this.charSequence.length()) {
            if (cArr != null) {
                if (i2 >= 0 && i >= 0 && i + i2 <= cArr.length) {
                    int i4 = 0;
                    int i5 = 0;
                    while (true) {
                        i3 = i4;
                        if (i5 >= i2) {
                            break;
                        }
                        i3 = i4;
                        if (read() == -1) {
                            break;
                        }
                        cArr[i + i5] = (char) read;
                        i4++;
                        i5++;
                    }
                } else {
                    throw new IndexOutOfBoundsException("Array Size=" + cArr.length + ", offset=" + i + ", length=" + i2);
                }
            } else {
                throw new NullPointerException("Character array is missing");
            }
        } else {
            i3 = -1;
        }
        return i3;
    }

    @Override // java.io.Reader
    public void reset() {
        this.idx = this.mark;
    }

    @Override // java.io.Reader
    public long skip(long j) {
        long j2;
        if (j < 0) {
            throw new IllegalArgumentException("Number of characters to skip is less than zero: " + j);
        }
        if (this.idx >= this.charSequence.length()) {
            j2 = -1;
        } else {
            int min = (int) Math.min(this.charSequence.length(), this.idx + j);
            int i = this.idx;
            this.idx = min;
            j2 = min - i;
        }
        return j2;
    }

    public String toString() {
        return this.charSequence.toString();
    }
}
