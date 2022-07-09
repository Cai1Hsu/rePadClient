package org.apache.tools.ant.util.regexp;

import org.apache.commons.compress.archivers.tar.TarConstants;

/* loaded from: classes.jar:org/apache/tools/ant/util/regexp/RegexpUtil.class */
public class RegexpUtil {
    public static int asOptions(String str) {
        boolean z = true;
        int i = 0;
        if (str != null) {
            boolean z2 = str.indexOf(105) == -1;
            boolean z3 = str.indexOf(109) != -1;
            if (str.indexOf(115) == -1) {
                z = false;
            }
            int asOptions = asOptions(z2, z3, z);
            i = asOptions;
            if (str.indexOf(TarConstants.LF_PAX_GLOBAL_EXTENDED_HEADER) != -1) {
                i = asOptions | 16;
            }
        }
        return i;
    }

    public static int asOptions(boolean z) {
        return asOptions(z, false, false);
    }

    public static int asOptions(boolean z, boolean z2, boolean z3) {
        int i = 0;
        if (!z) {
            i = 0 | 256;
        }
        int i2 = i;
        if (z2) {
            i2 = i | 4096;
        }
        int i3 = i2;
        if (z3) {
            i3 = i2 | 65536;
        }
        return i3;
    }

    public static boolean hasFlag(int i, int i2) {
        return (i & i2) > 0;
    }

    public static int removeFlag(int i, int i2) {
        return ((-1) - i2) & i;
    }
}
