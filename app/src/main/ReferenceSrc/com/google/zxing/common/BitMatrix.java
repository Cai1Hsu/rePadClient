package com.google.zxing.common;

/* loaded from: classes.jar:com/google/zxing/common/BitMatrix.class */
public final class BitMatrix {
    private final int[] bits;
    private final int height;
    private final int rowSize;
    private final int width;

    public BitMatrix(int i) {
        this(i, i);
    }

    public BitMatrix(int i, int i2) {
        if (i < 1 || i2 < 1) {
            throw new IllegalArgumentException("Both dimensions must be greater than 0");
        }
        this.width = i;
        this.height = i2;
        this.rowSize = (i + 31) >> 5;
        this.bits = new int[this.rowSize * i2];
    }

    public void clear() {
        int length = this.bits.length;
        for (int i = 0; i < length; i++) {
            this.bits[i] = 0;
        }
    }

    public boolean equals(Object obj) {
        boolean z;
        if (!(obj instanceof BitMatrix)) {
            z = false;
        } else {
            BitMatrix bitMatrix = (BitMatrix) obj;
            z = false;
            if (this.width == bitMatrix.width) {
                z = false;
                if (this.height == bitMatrix.height) {
                    z = false;
                    if (this.rowSize == bitMatrix.rowSize) {
                        z = false;
                        if (this.bits.length == bitMatrix.bits.length) {
                            int i = 0;
                            while (true) {
                                if (i >= this.bits.length) {
                                    z = true;
                                    break;
                                }
                                z = false;
                                if (this.bits[i] != bitMatrix.bits[i]) {
                                    break;
                                }
                                i++;
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    public void flip(int i, int i2) {
        int i3 = (this.rowSize * i2) + (i >> 5);
        int[] iArr = this.bits;
        iArr[i3] = iArr[i3] ^ (1 << (i & 31));
    }

    public boolean get(int i, int i2) {
        return ((this.bits[(this.rowSize * i2) + (i >> 5)] >>> (i & 31)) & 1) != 0;
    }

    public int[] getBottomRightOnBit() {
        int[] iArr;
        int length = this.bits.length - 1;
        while (length >= 0 && this.bits[length] == 0) {
            length--;
        }
        if (length < 0) {
            iArr = null;
        } else {
            int i = length / this.rowSize;
            int i2 = this.rowSize;
            int i3 = 31;
            while ((this.bits[length] >>> i3) == 0) {
                i3--;
            }
            iArr = new int[]{((length % i2) << 5) + i3, i};
        }
        return iArr;
    }

    public int[] getEnclosingRectangle() {
        int i = this.width;
        int i2 = this.height;
        int i3 = -1;
        int i4 = -1;
        for (int i5 = 0; i5 < this.height; i5++) {
            int i6 = 0;
            while (i6 < this.rowSize) {
                int i7 = this.bits[(this.rowSize * i5) + i6];
                int i8 = i4;
                int i9 = i;
                int i10 = i3;
                int i11 = i2;
                if (i7 != 0) {
                    int i12 = i2;
                    if (i5 < i2) {
                        i12 = i5;
                    }
                    int i13 = i4;
                    if (i5 > i4) {
                        i13 = i5;
                    }
                    int i14 = i;
                    if (i6 * 32 < i) {
                        int i15 = 0;
                        while ((i7 << (31 - i15)) == 0) {
                            i15++;
                        }
                        i14 = i;
                        if ((i6 * 32) + i15 < i) {
                            i14 = (i6 * 32) + i15;
                        }
                    }
                    i8 = i13;
                    i9 = i14;
                    i10 = i3;
                    i11 = i12;
                    if ((i6 * 32) + 31 > i3) {
                        int i16 = 31;
                        while ((i7 >>> i16) == 0) {
                            i16--;
                        }
                        i8 = i13;
                        i9 = i14;
                        i10 = i3;
                        i11 = i12;
                        if ((i6 * 32) + i16 > i3) {
                            i10 = (i6 * 32) + i16;
                            i11 = i12;
                            i9 = i14;
                            i8 = i13;
                        }
                    }
                }
                i6++;
                i4 = i8;
                i = i9;
                i3 = i10;
                i2 = i11;
            }
        }
        int i17 = i3 - i;
        int i18 = i4 - i2;
        return (i17 < 0 || i18 < 0) ? null : new int[]{i, i2, i17, i18};
    }

    public int getHeight() {
        return this.height;
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x000e, code lost:
        if (r8.getSize() < r6.width) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public BitArray getRow(int i, BitArray bitArray) {
        BitArray bitArray2;
        if (bitArray != null) {
            bitArray2 = bitArray;
        }
        bitArray2 = new BitArray(this.width);
        int i2 = this.rowSize;
        for (int i3 = 0; i3 < this.rowSize; i3++) {
            bitArray2.setBulk(i3 << 5, this.bits[(i * i2) + i3]);
        }
        return bitArray2;
    }

    public int[] getTopLeftOnBit() {
        int[] iArr;
        int i = 0;
        while (i < this.bits.length && this.bits[i] == 0) {
            i++;
        }
        if (i == this.bits.length) {
            iArr = null;
        } else {
            int i2 = i / this.rowSize;
            int i3 = this.rowSize;
            int i4 = 0;
            while ((this.bits[i] << (31 - i4)) == 0) {
                i4++;
            }
            iArr = new int[]{((i % i3) << 5) + i4, i2};
        }
        return iArr;
    }

    public int getWidth() {
        return this.width;
    }

    public int hashCode() {
        int i = (((((this.width * 31) + this.width) * 31) + this.height) * 31) + this.rowSize;
        for (int i2 : this.bits) {
            i = (i * 31) + i2;
        }
        return i;
    }

    public void set(int i, int i2) {
        int i3 = (this.rowSize * i2) + (i >> 5);
        int[] iArr = this.bits;
        iArr[i3] = iArr[i3] | (1 << (i & 31));
    }

    public void setRegion(int i, int i2, int i3, int i4) {
        if (i2 < 0 || i < 0) {
            throw new IllegalArgumentException("Left and top must be nonnegative");
        }
        if (i4 < 1 || i3 < 1) {
            throw new IllegalArgumentException("Height and width must be at least 1");
        }
        int i5 = i + i3;
        int i6 = i2 + i4;
        if (i6 > this.height || i5 > this.width) {
            throw new IllegalArgumentException("The region must fit inside the matrix");
        }
        while (i2 < i6) {
            int i7 = this.rowSize;
            for (int i8 = i; i8 < i5; i8++) {
                int[] iArr = this.bits;
                int i9 = (i8 >> 5) + (i2 * i7);
                iArr[i9] = iArr[i9] | (1 << (i8 & 31));
            }
            i2++;
        }
    }

    public void setRow(int i, BitArray bitArray) {
        System.arraycopy(bitArray.getBitArray(), 0, this.bits, this.rowSize * i, this.rowSize);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(this.height * (this.width + 1));
        for (int i = 0; i < this.height; i++) {
            for (int i2 = 0; i2 < this.width; i2++) {
                sb.append(get(i2, i) ? "X " : "  ");
            }
            sb.append('\n');
        }
        return sb.toString();
    }
}
