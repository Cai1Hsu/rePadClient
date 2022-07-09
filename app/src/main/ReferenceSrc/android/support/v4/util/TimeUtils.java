package android.support.v4.util;

import android.support.annotation.RestrictTo;
import java.io.PrintWriter;

@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.jar:android/support/v4/util/TimeUtils.class */
public final class TimeUtils {
    public static final int HUNDRED_DAY_FIELD_LEN = 19;
    private static final int SECONDS_PER_DAY = 86400;
    private static final int SECONDS_PER_HOUR = 3600;
    private static final int SECONDS_PER_MINUTE = 60;
    private static final Object sFormatSync = new Object();
    private static char[] sFormatStr = new char[24];

    private TimeUtils() {
    }

    private static int accumField(int i, int i2, boolean z, int i3) {
        return (i > 99 || (z && i3 >= 3)) ? i2 + 3 : (i > 9 || (z && i3 >= 2)) ? i2 + 2 : (z || i > 0) ? i2 + 1 : 0;
    }

    public static void formatDuration(long j, long j2, PrintWriter printWriter) {
        if (j == 0) {
            printWriter.print("--");
        } else {
            formatDuration(j - j2, printWriter, 0);
        }
    }

    public static void formatDuration(long j, PrintWriter printWriter) {
        formatDuration(j, printWriter, 0);
    }

    public static void formatDuration(long j, PrintWriter printWriter, int i) {
        synchronized (sFormatSync) {
            printWriter.print(new String(sFormatStr, 0, formatDurationLocked(j, i)));
        }
    }

    public static void formatDuration(long j, StringBuilder sb) {
        synchronized (sFormatSync) {
            sb.append(sFormatStr, 0, formatDurationLocked(j, 0));
        }
    }

    private static int formatDurationLocked(long j, int i) {
        int i2;
        int i3;
        if (sFormatStr.length < i) {
            sFormatStr = new char[i];
        }
        char[] cArr = sFormatStr;
        if (j == 0) {
            while (i - 1 < 0) {
                cArr[0] = (char) 32;
            }
            cArr[0] = (char) 48;
            i3 = 1;
        } else {
            if (j > 0) {
                i2 = 43;
            } else {
                i2 = 45;
                j = -j;
            }
            int i4 = (int) (j % 1000);
            int floor = (int) Math.floor(j / 1000);
            int i5 = 0;
            int i6 = 0;
            int i7 = 0;
            int i8 = floor;
            if (floor > SECONDS_PER_DAY) {
                i5 = floor / SECONDS_PER_DAY;
                i8 = floor - (SECONDS_PER_DAY * i5);
            }
            int i9 = i8;
            if (i8 > SECONDS_PER_HOUR) {
                i6 = i8 / SECONDS_PER_HOUR;
                i9 = i8 - (i6 * SECONDS_PER_HOUR);
            }
            int i10 = i9;
            if (i9 > SECONDS_PER_MINUTE) {
                i7 = i9 / SECONDS_PER_MINUTE;
                i10 = i9 - (i7 * SECONDS_PER_MINUTE);
            }
            int i11 = 0;
            if (i != 0) {
                int accumField = accumField(i5, 1, false, 0);
                int accumField2 = accumField + accumField(i6, 1, accumField > 0, 2);
                int accumField3 = accumField2 + accumField(i7, 1, accumField2 > 0, 2);
                int accumField4 = accumField3 + accumField(i10, 1, accumField3 > 0, 2);
                int accumField5 = accumField4 + accumField(i4, 2, true, accumField4 > 0 ? 3 : 0) + 1;
                int i12 = 0;
                while (true) {
                    i11 = i12;
                    if (accumField5 >= i) {
                        break;
                    }
                    cArr[i12] = (char) 32;
                    i12++;
                    accumField5++;
                }
            }
            cArr[i11] = (char) i2;
            int i13 = i11 + 1;
            boolean z = i != 0;
            int printField = printField(cArr, i5, 'd', i13, false, 0);
            int printField2 = printField(cArr, i6, 'h', printField, printField != i13, z ? 2 : 0);
            int printField3 = printField(cArr, i7, 'm', printField2, printField2 != i13, z ? 2 : 0);
            int printField4 = printField(cArr, i10, 's', printField3, printField3 != i13, z ? 2 : 0);
            int printField5 = printField(cArr, i4, 'm', printField4, true, (!z || printField4 == i13) ? 0 : 3);
            cArr[printField5] = (char) 115;
            i3 = printField5 + 1;
        }
        return i3;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0020, code lost:
        if (r6 > 99) goto L12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x005d, code lost:
        if (r8 != r12) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:5:0x0009, code lost:
        if (r6 > 0) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static int printField(char[] cArr, int i, char c, int i2, boolean z, int i3) {
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        if (!z) {
            i4 = i2;
        }
        if (!z || i3 < 3) {
            i6 = i;
            i5 = i2;
        }
        int i9 = i / 100;
        cArr[i2] = (char) (i9 + 48);
        i5 = i2 + 1;
        i6 = i - (i9 * 100);
        if ((!z || i3 < 2) && i6 <= 9) {
            i7 = i6;
            i8 = i5;
        }
        int i10 = i6 / 10;
        cArr[i5] = (char) (i10 + 48);
        i8 = i5 + 1;
        i7 = i6 - (i10 * 10);
        cArr[i8] = (char) (i7 + 48);
        int i11 = i8 + 1;
        cArr[i11] = c;
        i4 = i11 + 1;
        return i4;
    }
}
