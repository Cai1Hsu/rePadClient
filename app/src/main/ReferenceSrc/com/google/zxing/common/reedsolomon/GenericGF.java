package com.google.zxing.common.reedsolomon;

import org.apache.http.HttpStatus;

/* loaded from: classes.jar:com/google/zxing/common/reedsolomon/GenericGF.class */
public final class GenericGF {
    private static final int INITIALIZATION_THRESHOLD = 0;
    private int[] expTable;
    private boolean initialized = false;
    private int[] logTable;
    private GenericGFPoly one;
    private final int primitive;
    private final int size;
    private GenericGFPoly zero;
    public static final GenericGF AZTEC_DATA_12 = new GenericGF(4201, 4096);
    public static final GenericGF AZTEC_DATA_10 = new GenericGF(1033, 1024);
    public static final GenericGF AZTEC_DATA_6 = new GenericGF(67, 64);
    public static final GenericGF AZTEC_PARAM = new GenericGF(19, 16);
    public static final GenericGF QR_CODE_FIELD_256 = new GenericGF(285, 256);
    public static final GenericGF DATA_MATRIX_FIELD_256 = new GenericGF(HttpStatus.SC_MOVED_PERMANENTLY, 256);
    public static final GenericGF AZTEC_DATA_8 = DATA_MATRIX_FIELD_256;
    public static final GenericGF MAXICODE_FIELD_64 = AZTEC_DATA_6;

    public GenericGF(int i, int i2) {
        this.primitive = i;
        this.size = i2;
        if (i2 <= 0) {
            initialize();
        }
    }

    static int addOrSubtract(int i, int i2) {
        return i ^ i2;
    }

    private void checkInit() {
        if (!this.initialized) {
            initialize();
        }
    }

    private void initialize() {
        this.expTable = new int[this.size];
        this.logTable = new int[this.size];
        int i = 1;
        for (int i2 = 0; i2 < this.size; i2++) {
            this.expTable[i2] = i;
            int i3 = i << 1;
            i = i3;
            if (i3 >= this.size) {
                i = (i3 ^ this.primitive) & (this.size - 1);
            }
        }
        for (int i4 = 0; i4 < this.size - 1; i4++) {
            this.logTable[this.expTable[i4]] = i4;
        }
        this.zero = new GenericGFPoly(this, new int[]{0});
        this.one = new GenericGFPoly(this, new int[]{1});
        this.initialized = true;
    }

    GenericGFPoly buildMonomial(int i, int i2) {
        GenericGFPoly genericGFPoly;
        checkInit();
        if (i < 0) {
            throw new IllegalArgumentException();
        }
        if (i2 == 0) {
            genericGFPoly = this.zero;
        } else {
            int[] iArr = new int[i + 1];
            iArr[0] = i2;
            genericGFPoly = new GenericGFPoly(this, iArr);
        }
        return genericGFPoly;
    }

    int exp(int i) {
        checkInit();
        return this.expTable[i];
    }

    GenericGFPoly getOne() {
        checkInit();
        return this.one;
    }

    public int getSize() {
        return this.size;
    }

    GenericGFPoly getZero() {
        checkInit();
        return this.zero;
    }

    int inverse(int i) {
        checkInit();
        if (i == 0) {
            throw new ArithmeticException();
        }
        return this.expTable[(this.size - this.logTable[i]) - 1];
    }

    int log(int i) {
        checkInit();
        if (i == 0) {
            throw new IllegalArgumentException();
        }
        return this.logTable[i];
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0027, code lost:
        if (r7 >= r5.size) goto L17;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    int multiply(int i, int i2) {
        int i3;
        int i4;
        checkInit();
        if (i == 0 || i2 == 0) {
            i3 = 0;
        } else {
            if (i >= 0 && i2 >= 0 && i < this.size) {
                i4 = i;
            }
            i4 = i + 1;
            int i5 = this.logTable[i4] + this.logTable[i2];
            i3 = this.expTable[(i5 % this.size) + (i5 / this.size)];
        }
        return i3;
    }
}
