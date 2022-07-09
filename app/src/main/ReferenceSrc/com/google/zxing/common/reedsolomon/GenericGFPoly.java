package com.google.zxing.common.reedsolomon;

/* loaded from: classes.jar:com/google/zxing/common/reedsolomon/GenericGFPoly.class */
final class GenericGFPoly {
    private final int[] coefficients;
    private final GenericGF field;

    GenericGFPoly(GenericGF genericGF, int[] iArr) {
        if (iArr.length == 0) {
            throw new IllegalArgumentException();
        }
        this.field = genericGF;
        int length = iArr.length;
        if (length <= 1 || iArr[0] != 0) {
            this.coefficients = iArr;
            return;
        }
        int i = 1;
        while (i < length && iArr[i] == 0) {
            i++;
        }
        if (i == length) {
            this.coefficients = genericGF.getZero().coefficients;
            return;
        }
        this.coefficients = new int[length - i];
        System.arraycopy(iArr, i, this.coefficients, 0, this.coefficients.length);
    }

    GenericGFPoly addOrSubtract(GenericGFPoly genericGFPoly) {
        if (!this.field.equals(genericGFPoly.field)) {
            throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
        }
        if (!isZero()) {
            if (genericGFPoly.isZero()) {
                genericGFPoly = this;
            } else {
                int[] iArr = this.coefficients;
                int[] iArr2 = genericGFPoly.coefficients;
                int[] iArr3 = iArr2;
                int[] iArr4 = iArr;
                if (iArr.length > iArr2.length) {
                    iArr4 = iArr2;
                    iArr3 = iArr;
                }
                int[] iArr5 = new int[iArr3.length];
                int length = iArr3.length - iArr4.length;
                System.arraycopy(iArr3, 0, iArr5, 0, length);
                for (int i = length; i < iArr3.length; i++) {
                    iArr5[i] = GenericGF.addOrSubtract(iArr4[i - length], iArr3[i]);
                }
                genericGFPoly = new GenericGFPoly(this.field, iArr5);
            }
        }
        return genericGFPoly;
    }

    GenericGFPoly[] divide(GenericGFPoly genericGFPoly) {
        if (!this.field.equals(genericGFPoly.field)) {
            throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
        }
        if (genericGFPoly.isZero()) {
            throw new IllegalArgumentException("Divide by 0");
        }
        GenericGFPoly zero = this.field.getZero();
        GenericGFPoly genericGFPoly2 = this;
        int inverse = this.field.inverse(genericGFPoly.getCoefficient(genericGFPoly.getDegree()));
        while (genericGFPoly2.getDegree() >= genericGFPoly.getDegree() && !genericGFPoly2.isZero()) {
            int degree = genericGFPoly2.getDegree() - genericGFPoly.getDegree();
            int multiply = this.field.multiply(genericGFPoly2.getCoefficient(genericGFPoly2.getDegree()), inverse);
            GenericGFPoly multiplyByMonomial = genericGFPoly.multiplyByMonomial(degree, multiply);
            zero = zero.addOrSubtract(this.field.buildMonomial(degree, multiply));
            genericGFPoly2 = genericGFPoly2.addOrSubtract(multiplyByMonomial);
        }
        return new GenericGFPoly[]{zero, genericGFPoly2};
    }

    int evaluateAt(int i) {
        int i2;
        if (i != 0) {
            int length = this.coefficients.length;
            if (i != 1) {
                int i3 = this.coefficients[0];
                int i4 = 1;
                while (true) {
                    i2 = i3;
                    if (i4 >= length) {
                        break;
                    }
                    i3 = GenericGF.addOrSubtract(this.field.multiply(i, i3), this.coefficients[i4]);
                    i4++;
                }
            } else {
                int i5 = 0;
                int i6 = 0;
                while (true) {
                    i2 = i5;
                    if (i6 >= length) {
                        break;
                    }
                    i5 = GenericGF.addOrSubtract(i5, this.coefficients[i6]);
                    i6++;
                }
            }
        } else {
            i2 = getCoefficient(0);
        }
        return i2;
    }

    int getCoefficient(int i) {
        return this.coefficients[(this.coefficients.length - 1) - i];
    }

    int[] getCoefficients() {
        return this.coefficients;
    }

    int getDegree() {
        return this.coefficients.length - 1;
    }

    boolean isZero() {
        boolean z = false;
        if (this.coefficients[0] == 0) {
            z = true;
        }
        return z;
    }

    GenericGFPoly multiply(int i) {
        GenericGFPoly genericGFPoly;
        if (i == 0) {
            genericGFPoly = this.field.getZero();
        } else {
            genericGFPoly = this;
            if (i != 1) {
                int length = this.coefficients.length;
                int[] iArr = new int[length];
                for (int i2 = 0; i2 < length; i2++) {
                    iArr[i2] = this.field.multiply(this.coefficients[i2], i);
                }
                genericGFPoly = new GenericGFPoly(this.field, iArr);
            }
        }
        return genericGFPoly;
    }

    GenericGFPoly multiply(GenericGFPoly genericGFPoly) {
        GenericGFPoly genericGFPoly2;
        if (!this.field.equals(genericGFPoly.field)) {
            throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
        }
        if (isZero() || genericGFPoly.isZero()) {
            genericGFPoly2 = this.field.getZero();
        } else {
            int[] iArr = this.coefficients;
            int length = iArr.length;
            int[] iArr2 = genericGFPoly.coefficients;
            int length2 = iArr2.length;
            int[] iArr3 = new int[(length + length2) - 1];
            for (int i = 0; i < length; i++) {
                int i2 = iArr[i];
                for (int i3 = 0; i3 < length2; i3++) {
                    iArr3[i + i3] = GenericGF.addOrSubtract(iArr3[i + i3], this.field.multiply(i2, iArr2[i3]));
                }
            }
            genericGFPoly2 = new GenericGFPoly(this.field, iArr3);
        }
        return genericGFPoly2;
    }

    GenericGFPoly multiplyByMonomial(int i, int i2) {
        GenericGFPoly genericGFPoly;
        if (i < 0) {
            throw new IllegalArgumentException();
        }
        if (i2 == 0) {
            genericGFPoly = this.field.getZero();
        } else {
            int length = this.coefficients.length;
            int[] iArr = new int[length + i];
            for (int i3 = 0; i3 < length; i3++) {
                iArr[i3] = this.field.multiply(this.coefficients[i3], i2);
            }
            genericGFPoly = new GenericGFPoly(this.field, iArr);
        }
        return genericGFPoly;
    }

    public String toString() {
        int i;
        StringBuilder sb = new StringBuilder(getDegree() * 8);
        for (int degree = getDegree(); degree >= 0; degree--) {
            int coefficient = getCoefficient(degree);
            if (coefficient != 0) {
                if (coefficient < 0) {
                    sb.append(" - ");
                    i = -coefficient;
                } else {
                    i = coefficient;
                    if (sb.length() > 0) {
                        sb.append(" + ");
                        i = coefficient;
                    }
                }
                if (degree == 0 || i != 1) {
                    int log = this.field.log(i);
                    if (log == 0) {
                        sb.append('1');
                    } else if (log == 1) {
                        sb.append('a');
                    } else {
                        sb.append("a^");
                        sb.append(log);
                    }
                }
                if (degree != 0) {
                    if (degree == 1) {
                        sb.append('x');
                    } else {
                        sb.append("x^");
                        sb.append(degree);
                    }
                }
            }
        }
        return sb.toString();
    }
}
