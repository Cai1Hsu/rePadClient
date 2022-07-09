package com.google.zxing.common;

/* loaded from: classes.jar:com/google/zxing/common/BitSource.class */
public final class BitSource {
    private int bitOffset;
    private int byteOffset;
    private final byte[] bytes;

    public BitSource(byte[] bArr) {
        this.bytes = bArr;
    }

    public int available() {
        return ((this.bytes.length - this.byteOffset) * 8) - this.bitOffset;
    }

    public int getByteOffset() {
        return this.byteOffset;
    }

    public int readBits(int i) {
        if (i < 1 || i > 32) {
            throw new IllegalArgumentException();
        }
        int i2 = 0;
        int i3 = i;
        if (this.bitOffset > 0) {
            int i4 = 8 - this.bitOffset;
            int i5 = i < i4 ? i : i4;
            int i6 = i4 - i5;
            int i7 = (this.bytes[this.byteOffset] & ((255 >> (8 - i5)) << i6)) >> i6;
            int i8 = i - i5;
            this.bitOffset += i5;
            i2 = i7;
            i3 = i8;
            if (this.bitOffset == 8) {
                this.bitOffset = 0;
                this.byteOffset++;
                i3 = i8;
                i2 = i7;
            }
        }
        int i9 = i2;
        if (i3 > 0) {
            while (i3 >= 8) {
                i2 = (i2 << 8) | (this.bytes[this.byteOffset] & 255);
                this.byteOffset++;
                i3 -= 8;
            }
            i9 = i2;
            if (i3 > 0) {
                int i10 = 8 - i3;
                i9 = (i2 << i3) | ((this.bytes[this.byteOffset] & ((255 >> i10) << i10)) >> i10);
                this.bitOffset += i3;
            }
        }
        return i9;
    }
}
