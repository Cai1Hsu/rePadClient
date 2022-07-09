package org.apache.tools.ant.util;

import android.support.v4.view.MotionEventCompat;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Vector;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpStatus;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/util/StringUtils.class */
public final class StringUtils {
    private static final long GIGABYTE = 1073741824;
    private static final long KILOBYTE = 1024;
    public static final String LINE_SEP = System.getProperty("line.separator");
    private static final long MEGABYTE = 1048576;
    private static final long PETABYTE = 1125899906842624L;
    private static final long TERABYTE = 1099511627776L;

    private StringUtils() {
    }

    public static boolean endsWith(StringBuffer stringBuffer, String str) {
        boolean z;
        if (str.length() <= stringBuffer.length()) {
            int length = str.length() - 1;
            int length2 = stringBuffer.length() - 1;
            while (true) {
                if (length < 0) {
                    z = true;
                    break;
                }
                z = false;
                if (stringBuffer.charAt(length2) != str.charAt(length)) {
                    break;
                }
                length2--;
                length--;
            }
        } else {
            z = false;
        }
        return z;
    }

    public static String getStackTrace(Throwable th) {
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter((Writer) stringWriter, true);
        th.printStackTrace(printWriter);
        printWriter.flush();
        printWriter.close();
        return stringWriter.toString();
    }

    public static Vector lineSplit(String str) {
        return split(str, 10);
    }

    public static long parseHumanSizes(String str) throws Exception {
        long j = 1;
        String str2 = str;
        switch (str.charAt(0)) {
            case '+':
                str2 = str.substring(1);
                j = 1;
                break;
            case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
                break;
            case MotionEventCompat.AXIS_GENERIC_14 /* 45 */:
                j = -1;
                str2 = str.substring(1);
                break;
            default:
                str2 = str;
                j = 1;
                break;
        }
        char charAt = str2.charAt(str2.length() - 1);
        long j2 = j;
        String str3 = str2;
        if (!Character.isDigit(charAt)) {
            int i = 1;
            switch (charAt) {
                case 'G':
                    j *= 1073741824;
                    break;
                case 'K':
                    j *= 1024;
                    break;
                case 'M':
                    j *= 1048576;
                    break;
                case 'P':
                    j *= 1125899906842624L;
                    break;
                case 'T':
                    j *= 1099511627776L;
                    break;
                default:
                    i = 0;
                    break;
            }
            str3 = str2.substring(0, str2.length() - i);
            j2 = j;
        }
        try {
            return Long.parseLong(str3) * j2;
        } catch (NumberFormatException e) {
            throw new BuildException(new StringBuffer().append("Failed to parse \"").append(str3).append("\"").toString(), e);
        }
    }

    public static String removePrefix(String str, String str2) {
        String str3 = str;
        if (str.startsWith(str2)) {
            str3 = str.substring(str2.length());
        }
        return str3;
    }

    public static String removeSuffix(String str, String str2) {
        String str3 = str;
        if (str.endsWith(str2)) {
            str3 = str.substring(0, str.length() - str2.length());
        }
        return str3;
    }

    public static String replace(String str, String str2, String str3) {
        StringBuffer stringBuffer = new StringBuffer(str.length());
        int i = 0;
        while (true) {
            int i2 = i;
            int indexOf = str.indexOf(str2, i2);
            if (indexOf == -1) {
                stringBuffer.append(str.substring(i2));
                return stringBuffer.toString();
            }
            stringBuffer.append(str.substring(i2, indexOf)).append(str3);
            i = indexOf + str2.length();
        }
    }

    public static String resolveBackSlash(String str) {
        StringBuffer stringBuffer = new StringBuffer();
        boolean z = false;
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (z) {
                switch (charAt) {
                    case IOUtils.DIR_SEPARATOR_WINDOWS /* 92 */:
                        stringBuffer.append('\\');
                        break;
                    case HttpStatus.SC_PROCESSING /* 102 */:
                        stringBuffer.append('\f');
                        break;
                    case 'n':
                        stringBuffer.append('\n');
                        break;
                    case 'r':
                        stringBuffer.append('\r');
                        break;
                    case 's':
                        stringBuffer.append(" \t\n\r\f");
                        break;
                    case 't':
                        stringBuffer.append('\t');
                        break;
                    default:
                        stringBuffer.append(charAt);
                        break;
                }
                z = false;
            } else if (charAt == '\\') {
                z = true;
            } else {
                stringBuffer.append(charAt);
            }
        }
        return stringBuffer.toString();
    }

    public static Vector split(String str, int i) {
        Vector vector = new Vector();
        int i2 = 0;
        while (true) {
            int i3 = i2;
            int indexOf = str.indexOf(i, i3);
            if (indexOf == -1) {
                vector.addElement(str.substring(i3));
                return vector;
            }
            vector.addElement(str.substring(i3, indexOf));
            i2 = indexOf + 1;
        }
    }
}
