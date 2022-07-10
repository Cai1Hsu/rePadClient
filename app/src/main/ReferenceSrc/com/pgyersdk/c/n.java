package com.pgyersdk.c;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class n {
    private static final Pattern a = Pattern.compile("[0-9a-f]+", 2);

    public static String a(String str) {
        if (m.a(str)) {
            throw new IllegalArgumentException("App ID must not be null.");
        }
        String trim = str.trim();
        Matcher matcher = a.matcher(trim);
        if (trim.length() != 32) {
            throw new IllegalArgumentException("App ID length must be 32 characters.");
        }
        if (matcher.matches()) {
            return trim;
        }
        throw new IllegalArgumentException("App ID must match regex pattern /[0-9a-f]+/i");
    }
}
