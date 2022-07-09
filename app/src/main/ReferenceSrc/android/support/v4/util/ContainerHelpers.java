package android.support.v4.util;

/* loaded from: classes.jar:android/support/v4/util/ContainerHelpers.class */
class ContainerHelpers {
    static final int[] EMPTY_INTS = new int[0];
    static final long[] EMPTY_LONGS = new long[0];
    static final Object[] EMPTY_OBJECTS = new Object[0];

    ContainerHelpers() {
    }

    static int binarySearch(int[] iArr, int i, int i2) {
        int i3;
        int i4 = i - 1;
        int i5 = 0;
        int i6 = i4;
        while (true) {
            if (i5 > i6) {
                i3 = i5 ^ (-1);
                break;
            }
            int i7 = (i5 + i6) >>> 1;
            int i8 = iArr[i7];
            if (i8 >= i2) {
                i3 = i7;
                if (i8 <= i2) {
                    break;
                }
                i6 = i7 - 1;
            } else {
                i5 = i7 + 1;
            }
        }
        return i3;
    }

    static int binarySearch(long[] jArr, int i, long j) {
        int i2;
        int i3 = i - 1;
        int i4 = 0;
        while (true) {
            if (i4 > i3) {
                i2 = i4 ^ (-1);
                break;
            }
            int i5 = (i4 + i3) >>> 1;
            long j2 = jArr[i5];
            if (j2 >= j) {
                i2 = i5;
                if (j2 <= j) {
                    break;
                }
                i3 = i5 - 1;
            } else {
                i4 = i5 + 1;
            }
        }
        return i2;
    }

    public static boolean equal(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public static int idealByteArraySize(int i) {
        int i2;
        int i3 = 4;
        while (true) {
            i2 = i;
            if (i3 >= 32) {
                break;
            } else if (i <= (1 << i3) - 12) {
                i2 = (1 << i3) - 12;
                break;
            } else {
                i3++;
            }
        }
        return i2;
    }

    public static int idealIntArraySize(int i) {
        return idealByteArraySize(i * 4) / 4;
    }

    public static int idealLongArraySize(int i) {
        return idealByteArraySize(i * 8) / 8;
    }
}
