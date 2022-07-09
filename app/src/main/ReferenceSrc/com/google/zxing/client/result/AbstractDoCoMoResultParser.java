package com.google.zxing.client.result;

/* loaded from: classes.jar:com/google/zxing/client/result/AbstractDoCoMoResultParser.class */
abstract class AbstractDoCoMoResultParser extends ResultParser {
    AbstractDoCoMoResultParser() {
    }

    static String[] matchDoCoMoPrefixedField(String str, String str2, boolean z) {
        return matchPrefixedField(str, str2, ';', z);
    }

    static String matchSingleDoCoMoPrefixedField(String str, String str2, boolean z) {
        return matchSinglePrefixedField(str, str2, ';', z);
    }
}
