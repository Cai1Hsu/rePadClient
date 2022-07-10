package com.google.zxing.common.reedsolomon;

import org.apache.http.HttpStatus;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    public GenericGF(int primitive, int size) {
        this.primitive = primitive;
        this.size = size;
        if (size <= 0) {
            initialize();
        }
    }

    private void initialize() {
        this.expTable = new int[this.size];
        this.logTable = new int[this.size];
        int x = 1;
        for (int i = 0; i < this.size; i++) {
            this.expTable[i] = x;
            x <<= 1;
            if (x >= this.size) {
                x = (x ^ this.primitive) & (this.size - 1);
            }
        }
        for (int i2 = 0; i2 < this.size - 1; i2++) {
            this.logTable[this.expTable[i2]] = i2;
        }
        this.zero = new GenericGFPoly(this, new int[]{0});
        this.one = new GenericGFPoly(this, new int[]{1});
        this.initialized = true;
    }

    private void checkInit() {
        if (!this.initialized) {
            initialize();
        }
    }

    public GenericGFPoly getZero() {
        checkInit();
        return this.zero;
    }

    public GenericGFPoly getOne() {
        checkInit();
        return this.one;
    }

    public GenericGFPoly buildMonomial(int degree, int coefficient) {
        checkInit();
        if (degree < 0) {
            throw new IllegalArgumentException();
        }
        if (coefficient == 0) {
            return this.zero;
        }
        int[] coefficients = new int[degree + 1];
        coefficients[0] = coefficient;
        return new GenericGFPoly(this, coefficients);
    }

    public static int addOrSubtract(int a, int b) {
        return a ^ b;
    }

    public int exp(int a) {
        checkInit();
        return this.expTable[a];
    }

    public int log(int a) {
        checkInit();
        if (a == 0) {
            throw new IllegalArgumentException();
        }
        return this.logTable[a];
    }

    public int inverse(int a) {
        checkInit();
        if (a == 0) {
            throw new ArithmeticException();
        }
        return this.expTable[(this.size - this.logTable[a]) - 1];
    }

    public int multiply(int a, int b) {
        checkInit();
        if (a == 0 || b == 0) {
            return 0;
        }
        if (a < 0 || b < 0 || a >= this.size || b >= this.size) {
            a++;
        }
        int logSum = this.logTable[a] + this.logTable[b];
        return this.expTable[(logSum % this.size) + (logSum / this.size)];
    }

    public int getSize() {
        return this.size;
    }
}
