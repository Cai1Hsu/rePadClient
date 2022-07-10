package com.pgyersdk.c;

import org.apache.commons.compress.archivers.tar.TarConstants;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class m {
    static String a = "[一-龥]";
    private static final byte[] b = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, TarConstants.LF_GNUTYPE_SPARSE, 84, 85, 86, 87, TarConstants.LF_PAX_EXTENDED_HEADER_UC, 89, 90, 97, 98, 99, 100, 101, 102, TarConstants.LF_PAX_GLOBAL_EXTENDED_HEADER, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, TarConstants.LF_PAX_EXTENDED_HEADER_LC, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57};

    public static boolean a(String str) {
        return str == null || str.trim().length() == 0;
    }
}
