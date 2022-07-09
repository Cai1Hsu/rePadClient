package com.google.zxing;

/* loaded from: classes.jar:com/google/zxing/ResultPoint.class */
public class ResultPoint {
    private final float x;
    private final float y;

    public ResultPoint(float f, float f2) {
        this.x = f;
        this.y = f2;
    }

    private static float crossProductZ(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3) {
        float f = resultPoint2.x;
        float f2 = resultPoint2.y;
        return ((resultPoint3.x - f) * (resultPoint.y - f2)) - ((resultPoint3.y - f2) * (resultPoint.x - f));
    }

    public static float distance(ResultPoint resultPoint, ResultPoint resultPoint2) {
        float f = resultPoint.x - resultPoint2.x;
        float f2 = resultPoint.y - resultPoint2.y;
        return (float) Math.sqrt((f * f) + (f2 * f2));
    }

    public static void orderBestPatterns(ResultPoint[] resultPointArr) {
        ResultPoint resultPoint;
        ResultPoint resultPoint2;
        ResultPoint resultPoint3;
        float distance = distance(resultPointArr[0], resultPointArr[1]);
        float distance2 = distance(resultPointArr[1], resultPointArr[2]);
        float distance3 = distance(resultPointArr[0], resultPointArr[2]);
        if (distance2 >= distance && distance2 >= distance3) {
            resultPoint = resultPointArr[0];
            resultPoint2 = resultPointArr[1];
            resultPoint3 = resultPointArr[2];
        } else if (distance3 < distance2 || distance3 < distance) {
            resultPoint = resultPointArr[2];
            resultPoint2 = resultPointArr[0];
            resultPoint3 = resultPointArr[1];
        } else {
            resultPoint = resultPointArr[1];
            resultPoint2 = resultPointArr[0];
            resultPoint3 = resultPointArr[2];
        }
        ResultPoint resultPoint4 = resultPoint2;
        ResultPoint resultPoint5 = resultPoint3;
        if (crossProductZ(resultPoint2, resultPoint, resultPoint3) < 0.0f) {
            resultPoint5 = resultPoint2;
            resultPoint4 = resultPoint3;
        }
        resultPointArr[0] = resultPoint4;
        resultPointArr[1] = resultPoint;
        resultPointArr[2] = resultPoint5;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj instanceof ResultPoint) {
            ResultPoint resultPoint = (ResultPoint) obj;
            z = false;
            if (this.x == resultPoint.x) {
                z = false;
                if (this.y == resultPoint.y) {
                    z = true;
                }
            }
        }
        return z;
    }

    public final float getX() {
        return this.x;
    }

    public final float getY() {
        return this.y;
    }

    public int hashCode() {
        return (Float.floatToIntBits(this.x) * 31) + Float.floatToIntBits(this.y);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(25);
        sb.append('(');
        sb.append(this.x);
        sb.append(',');
        sb.append(this.y);
        sb.append(')');
        return sb.toString();
    }
}
