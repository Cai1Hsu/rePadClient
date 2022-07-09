package com.google.zxing.common;

/* loaded from: classes.jar:com/google/zxing/common/BitArray.class */
public final class BitArray {
    private int[] bits;
    private int size;

    public BitArray() {
        this.size = 0;
        this.bits = new int[1];
    }

    public BitArray(int i) {
        this.size = i;
        this.bits = makeArray(i);
    }

    private void ensureCapacity(int i) {
        if (i > (this.bits.length << 5)) {
            int[] makeArray = makeArray(i);
            System.arraycopy(this.bits, 0, makeArray, 0, this.bits.length);
            this.bits = makeArray;
        }
    }

    private static int[] makeArray(int i) {
        return new int[(i + 31) >> 5];
    }

    public void appendBit(boolean z) {
        ensureCapacity(this.size + 1);
        if (z) {
            int[] iArr = this.bits;
            int i = this.size >> 5;
            iArr[i] = iArr[i] | (1 << (this.size & 31));
        }
        this.size++;
    }

    public void appendBitArray(BitArray bitArray) {
        int i = bitArray.size;
        ensureCapacity(this.size + i);
        for (int i2 = 0; i2 < i; i2++) {
            appendBit(bitArray.get(i2));
        }
    }

    public void appendBits(int i, int i2) {
        if (i2 < 0 || i2 > 32) {
            throw new IllegalArgumentException("Num bits must be between 0 and 32");
        }
        ensureCapacity(this.size + i2);
        while (i2 > 0) {
            appendBit(((i >> (i2 - 1)) & 1) == 1);
            i2--;
        }
    }

    public void clear() {
        int length = this.bits.length;
        for (int i = 0; i < length; i++) {
            this.bits[i] = 0;
        }
    }

    public void flip(int i) {
        int[] iArr = this.bits;
        int i2 = i >> 5;
        iArr[i2] = iArr[i2] ^ (1 << (i & 31));
    }

    public boolean get(int i) {
        boolean z = true;
        if ((this.bits[i >> 5] & (1 << (i & 31))) == 0) {
            z = false;
        }
        return z;
    }

    public int[] getBitArray() {
        return this.bits;
    }

    public int getNextSet(int i) {
        int i2;
        if (i >= this.size) {
            i2 = this.size;
        } else {
            int i3 = i >> 5;
            int i4 = this.bits[i3] & (((1 << (i & 31)) - 1) ^ (-1));
            while (true) {
                int i5 = i4;
                if (i5 == 0) {
                    i3++;
                    if (i3 == this.bits.length) {
                        i2 = this.size;
                        break;
                    }
                    i4 = this.bits[i3];
                } else {
                    int numberOfTrailingZeros = (i3 << 5) + Integer.numberOfTrailingZeros(i5);
                    i2 = numberOfTrailingZeros;
                    if (numberOfTrailingZeros > this.size) {
                        i2 = this.size;
                    }
                }
            }
        }
        return i2;
    }

    public int getNextUnset(int i) {
        int i2;
        if (i >= this.size) {
            i2 = this.size;
        } else {
            int i3 = i >> 5;
            int i4 = (this.bits[i3] ^ (-1)) & (((1 << (i & 31)) - 1) ^ (-1));
            int i5 = i3;
            while (true) {
                if (i4 == 0) {
                    i5++;
                    if (i5 == this.bits.length) {
                        i2 = this.size;
                        break;
                    }
                    i4 = this.bits[i5] ^ (-1);
                } else {
                    int numberOfTrailingZeros = (i5 << 5) + Integer.numberOfTrailingZeros(i4);
                    i2 = numberOfTrailingZeros;
                    if (numberOfTrailingZeros > this.size) {
                        i2 = this.size;
                    }
                }
            }
        }
        return i2;
    }

    public int getSize() {
        return this.size;
    }

    public int getSizeInBytes() {
        return (this.size + 7) >> 3;
    }

    public boolean isRange(int i, int i2, boolean z) {
        boolean z2;
        int i3;
        if (i2 < i) {
            throw new IllegalArgumentException();
        }
        if (i2 == i) {
            z2 = true;
        } else {
            int i4 = i2 - 1;
            int i5 = i >> 5;
            int i6 = i4 >> 5;
            int i7 = i5;
            while (true) {
                z2 = true;
                if (i7 > i6) {
                    break;
                }
                int i8 = i7 > i5 ? 0 : i & 31;
                int i9 = i7 < i6 ? 31 : i4 & 31;
                if (i8 != 0 || i9 != 31) {
                    int i10 = 0;
                    int i11 = i8;
                    while (true) {
                        i3 = i10;
                        if (i11 > i9) {
                            break;
                        }
                        i10 |= 1 << i11;
                        i11++;
                    }
                } else {
                    i3 = -1;
                }
                if ((this.bits[i7] & i3) != (z ? i3 : 0)) {
                    z2 = false;
                    break;
                }
                i7++;
            }
        }
        return z2;
    }

    public void reverse() {
        int[] iArr = new int[this.bits.length];
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (get((i - i2) - 1)) {
                int i3 = i2 >> 5;
                iArr[i3] = iArr[i3] | (1 << (i2 & 31));
            }
        }
        this.bits = iArr;
    }

    public void set(int i) {
        int[] iArr = this.bits;
        int i2 = i >> 5;
        iArr[i2] = iArr[i2] | (1 << (i & 31));
    }

    public void setBulk(int i, int i2) {
        this.bits[i >> 5] = i2;
    }

    public void setRange(int i, int i2) {
        int i3;
        if (i2 < i) {
            throw new IllegalArgumentException();
        }
        if (i2 == i) {
            return;
        }
        int i4 = i2 - 1;
        int i5 = i >> 5;
        int i6 = i4 >> 5;
        int i7 = i5;
        while (i7 <= i6) {
            int i8 = i7 > i5 ? 0 : i & 31;
            int i9 = i7 < i6 ? 31 : i4 & 31;
            if (i8 == 0 && i9 == 31) {
                i3 = -1;
            } else {
                int i10 = i8;
                int i11 = 0;
                while (true) {
                    i3 = i11;
                    if (i10 <= i9) {
                        i11 |= 1 << i10;
                        i10++;
                    }
                }
            }
            int[] iArr = this.bits;
            iArr[i7] = iArr[i7] | i3;
            i7++;
        }
    }

    public void toBytes(int i, byte[] bArr, int i2, int i3) {
        int i4 = i;
        for (int i5 = 0; i5 < i3; i5++) {
            int i6 = 0;
            int i7 = 0;
            while (i7 < 8) {
                int i8 = i6;
                if (get(i4)) {
                    i8 = i6 | (1 << (7 - i7));
                }
                i4++;
                i7++;
                i6 = i8;
            }
            bArr[i2 + i5] = (byte) i6;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(this.size);
        for (int i = 0; i < this.size; i++) {
            if ((i & 7) == 0) {
                sb.append(' ');
            }
            sb.append(get(i) ? 'X' : '.');
        }
        return sb.toString();
    }

    public void xor(BitArray bitArray) {
        if (this.bits.length != bitArray.bits.length) {
            throw new IllegalArgumentException("Sizes don't match");
        }
        for (int i = 0; i < this.bits.length; i++) {
            int[] iArr = this.bits;
            iArr[i] = iArr[i] ^ bitArray.bits[i];
        }
    }
}
