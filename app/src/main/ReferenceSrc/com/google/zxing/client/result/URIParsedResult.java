package com.google.zxing.client.result;

import java.util.Locale;
import java.util.regex.Pattern;

/* loaded from: classes.jar:com/google/zxing/client/result/URIParsedResult.class */
public final class URIParsedResult extends ParsedResult {
    private static final Pattern USER_IN_HOST = Pattern.compile(":/*([^/@]+)@[^/]+");
    private final String title;
    private final String uri;

    public URIParsedResult(String str, String str2) {
        super(ParsedResultType.URI);
        this.uri = massageURI(str);
        this.title = str2;
    }

    private static boolean isColonFollowedByPortNumber(String str, int i) {
        boolean z;
        int indexOf = str.indexOf(47, i + 1);
        int i2 = indexOf;
        if (indexOf < 0) {
            i2 = str.length();
        }
        if (i2 > i + 1) {
            while (true) {
                i++;
                if (i >= i2) {
                    z = true;
                    break;
                }
                z = false;
                if (str.charAt(i) < '0') {
                    break;
                }
                z = false;
                if (str.charAt(i) > '9') {
                    break;
                }
            }
        } else {
            z = false;
        }
        return z;
    }

    private static String massageURI(String str) {
        String trim = str.trim();
        int indexOf = trim.indexOf(58);
        return indexOf < 0 ? "http://" + trim : isColonFollowedByPortNumber(trim, indexOf) ? "http://" + trim : trim.substring(0, indexOf).toLowerCase(Locale.ENGLISH) + trim.substring(indexOf);
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        StringBuilder sb = new StringBuilder(30);
        maybeAppend(this.title, sb);
        maybeAppend(this.uri, sb);
        return sb.toString();
    }

    public String getTitle() {
        return this.title;
    }

    public String getURI() {
        return this.uri;
    }

    public boolean isPossiblyMaliciousURI() {
        return USER_IN_HOST.matcher(this.uri).find();
    }
}
