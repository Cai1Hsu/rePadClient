package com.google.zxing.client.result;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class AbstractDoCoMoResultParser extends ResultParser {
    public static String[] matchDoCoMoPrefixedField(String prefix, String rawText, boolean trim) {
        return matchPrefixedField(prefix, rawText, ';', trim);
    }

    public static String matchSingleDoCoMoPrefixedField(String prefix, String rawText, boolean trim) {
        return matchSinglePrefixedField(prefix, rawText, ';', trim);
    }
}
