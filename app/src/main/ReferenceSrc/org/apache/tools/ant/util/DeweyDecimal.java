package org.apache.tools.ant.util;

/* loaded from: classes.jar:org/apache/tools/ant/util/DeweyDecimal.class */
public class DeweyDecimal {
    private int[] components;

    public DeweyDecimal(String str) throws NumberFormatException {
        java.util.StringTokenizer stringTokenizer = new java.util.StringTokenizer(str, ".", true);
        this.components = new int[(stringTokenizer.countTokens() + 1) / 2];
        for (int i = 0; i < this.components.length; i++) {
            String nextToken = stringTokenizer.nextToken();
            if (nextToken.equals("")) {
                throw new NumberFormatException("Empty component in string");
            }
            this.components[i] = Integer.parseInt(nextToken);
            if (stringTokenizer.hasMoreTokens()) {
                stringTokenizer.nextToken();
                if (!stringTokenizer.hasMoreTokens()) {
                    throw new NumberFormatException("DeweyDecimal ended in a '.'");
                }
            }
        }
    }

    public DeweyDecimal(int[] iArr) {
        this.components = new int[iArr.length];
        System.arraycopy(iArr, 0, this.components, 0, iArr.length);
    }

    public int get(int i) {
        return this.components[i];
    }

    public int getSize() {
        return this.components.length;
    }

    public boolean isEqual(DeweyDecimal deweyDecimal) {
        boolean z = false;
        int max = Math.max(deweyDecimal.components.length, this.components.length);
        int i = 0;
        while (true) {
            if (i >= max) {
                z = true;
                break;
            }
            if ((i < deweyDecimal.components.length ? deweyDecimal.components[i] : 0) != (i < this.components.length ? this.components[i] : 0)) {
                break;
            }
            i++;
        }
        return z;
    }

    public boolean isGreaterThan(DeweyDecimal deweyDecimal) {
        boolean z;
        int max = Math.max(deweyDecimal.components.length, this.components.length);
        int i = 0;
        while (true) {
            z = false;
            if (i >= max) {
                break;
            }
            int i2 = i < this.components.length ? this.components[i] : 0;
            int i3 = i < deweyDecimal.components.length ? deweyDecimal.components[i] : 0;
            if (i3 > i2) {
                z = false;
                break;
            } else if (i3 < i2) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public boolean isGreaterThanOrEqual(DeweyDecimal deweyDecimal) {
        boolean z = false;
        int max = Math.max(deweyDecimal.components.length, this.components.length);
        int i = 0;
        while (true) {
            if (i >= max) {
                z = true;
                break;
            }
            int i2 = i < this.components.length ? this.components[i] : 0;
            int i3 = i < deweyDecimal.components.length ? deweyDecimal.components[i] : 0;
            if (i3 > i2) {
                break;
            } else if (i3 < i2) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public boolean isLessThan(DeweyDecimal deweyDecimal) {
        return !isGreaterThanOrEqual(deweyDecimal);
    }

    public boolean isLessThanOrEqual(DeweyDecimal deweyDecimal) {
        return !isGreaterThan(deweyDecimal);
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < this.components.length; i++) {
            if (i != 0) {
                stringBuffer.append('.');
            }
            stringBuffer.append(this.components[i]);
        }
        return stringBuffer.toString();
    }
}
