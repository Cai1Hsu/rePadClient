package com.google.zxing.common.reedsolomon;

/* loaded from: classes.jar:com/google/zxing/common/reedsolomon/ReedSolomonDecoder.class */
public final class ReedSolomonDecoder {
    private final GenericGF field;

    public ReedSolomonDecoder(GenericGF genericGF) {
        this.field = genericGF;
    }

    private int[] findErrorLocations(GenericGFPoly genericGFPoly) throws ReedSolomonException {
        int[] iArr;
        int degree = genericGFPoly.getDegree();
        if (degree == 1) {
            iArr = new int[]{genericGFPoly.getCoefficient(1)};
        } else {
            int[] iArr2 = new int[degree];
            int i = 0;
            int i2 = 1;
            while (i2 < this.field.getSize() && i < degree) {
                int i3 = i;
                if (genericGFPoly.evaluateAt(i2) == 0) {
                    iArr2[i] = this.field.inverse(i2);
                    i3 = i + 1;
                }
                i2++;
                i = i3;
            }
            iArr = iArr2;
            if (i != degree) {
                throw new ReedSolomonException("Error locator degree does not match number of roots");
            }
        }
        return iArr;
    }

    private int[] findErrorMagnitudes(GenericGFPoly genericGFPoly, int[] iArr, boolean z) {
        int length = iArr.length;
        int[] iArr2 = new int[length];
        for (int i = 0; i < length; i++) {
            int inverse = this.field.inverse(iArr[i]);
            int i2 = 1;
            int i3 = 0;
            while (i3 < length) {
                int i4 = i2;
                if (i != i3) {
                    int multiply = this.field.multiply(iArr[i3], inverse);
                    i4 = this.field.multiply(i2, (multiply & 1) == 0 ? multiply | 1 : multiply & (-2));
                }
                i3++;
                i2 = i4;
            }
            iArr2[i] = this.field.multiply(genericGFPoly.evaluateAt(inverse), this.field.inverse(i2));
            if (z) {
                iArr2[i] = this.field.multiply(iArr2[i], inverse);
            }
        }
        return iArr2;
    }

    private GenericGFPoly[] runEuclideanAlgorithm(GenericGFPoly genericGFPoly, GenericGFPoly genericGFPoly2, int i) throws ReedSolomonException {
        GenericGFPoly genericGFPoly3 = genericGFPoly;
        GenericGFPoly genericGFPoly4 = genericGFPoly2;
        if (genericGFPoly.getDegree() < genericGFPoly2.getDegree()) {
            genericGFPoly4 = genericGFPoly;
            genericGFPoly3 = genericGFPoly2;
        }
        GenericGFPoly one = this.field.getOne();
        GenericGFPoly zero = this.field.getZero();
        GenericGFPoly zero2 = this.field.getZero();
        GenericGFPoly one2 = this.field.getOne();
        while (true) {
            GenericGFPoly genericGFPoly5 = one2;
            GenericGFPoly genericGFPoly6 = zero2;
            GenericGFPoly genericGFPoly7 = one;
            GenericGFPoly genericGFPoly8 = genericGFPoly3;
            if (genericGFPoly4.getDegree() < i / 2) {
                int coefficient = genericGFPoly5.getCoefficient(0);
                if (coefficient == 0) {
                    throw new ReedSolomonException("sigmaTilde(0) was zero");
                }
                int inverse = this.field.inverse(coefficient);
                return new GenericGFPoly[]{genericGFPoly5.multiply(inverse), genericGFPoly4.multiply(inverse)};
            }
            genericGFPoly3 = genericGFPoly4;
            one = zero;
            zero2 = genericGFPoly5;
            if (genericGFPoly3.isZero()) {
                throw new ReedSolomonException("r_{i-1} was zero");
            }
            genericGFPoly4 = genericGFPoly8;
            GenericGFPoly zero3 = this.field.getZero();
            int inverse2 = this.field.inverse(genericGFPoly3.getCoefficient(genericGFPoly3.getDegree()));
            while (genericGFPoly4.getDegree() >= genericGFPoly3.getDegree() && !genericGFPoly4.isZero()) {
                int degree = genericGFPoly4.getDegree() - genericGFPoly3.getDegree();
                int multiply = this.field.multiply(genericGFPoly4.getCoefficient(genericGFPoly4.getDegree()), inverse2);
                zero3 = zero3.addOrSubtract(this.field.buildMonomial(degree, multiply));
                genericGFPoly4 = genericGFPoly4.addOrSubtract(genericGFPoly3.multiplyByMonomial(degree, multiply));
            }
            zero = zero3.multiply(one).addOrSubtract(genericGFPoly7);
            one2 = zero3.multiply(zero2).addOrSubtract(genericGFPoly6);
        }
    }

    public void decode(int[] iArr, int i) throws ReedSolomonException {
        GenericGFPoly genericGFPoly = new GenericGFPoly(this.field, iArr);
        int[] iArr2 = new int[i];
        boolean equals = this.field.equals(GenericGF.DATA_MATRIX_FIELD_256);
        boolean z = true;
        for (int i2 = 0; i2 < i; i2++) {
            int evaluateAt = genericGFPoly.evaluateAt(this.field.exp(equals ? i2 + 1 : i2));
            iArr2[(iArr2.length - 1) - i2] = evaluateAt;
            if (evaluateAt != 0) {
                z = false;
            }
        }
        if (z) {
            return;
        }
        GenericGFPoly[] runEuclideanAlgorithm = runEuclideanAlgorithm(this.field.buildMonomial(i, 1), new GenericGFPoly(this.field, iArr2), i);
        GenericGFPoly genericGFPoly2 = runEuclideanAlgorithm[0];
        GenericGFPoly genericGFPoly3 = runEuclideanAlgorithm[1];
        int[] findErrorLocations = findErrorLocations(genericGFPoly2);
        int[] findErrorMagnitudes = findErrorMagnitudes(genericGFPoly3, findErrorLocations, equals);
        for (int i3 = 0; i3 < findErrorLocations.length; i3++) {
            int length = (iArr.length - 1) - this.field.log(findErrorLocations[i3]);
            if (length < 0) {
                throw new ReedSolomonException("Bad error location");
            }
            iArr[length] = GenericGF.addOrSubtract(iArr[length], findErrorMagnitudes[i3]);
        }
    }
}
