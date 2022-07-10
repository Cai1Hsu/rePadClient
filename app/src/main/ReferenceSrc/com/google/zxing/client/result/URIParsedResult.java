package com.google.zxing.client.result;

import java.util.Locale;
import java.util.regex.Pattern;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class URIParsedResult extends ParsedResult {
    private static final Pattern USER_IN_HOST = Pattern.compile(":/*([^/@]+)@[^/]+");
    private final String title;
    private final String uri;

    public URIParsedResult(String uri, String title) {
        super(ParsedResultType.URI);
        this.uri = massageURI(uri);
        this.title = title;
    }

    public String getURI() {
        return this.uri;
    }

    public String getTitle() {
        return this.title;
    }

    public boolean isPossiblyMaliciousURI() {
        return USER_IN_HOST.matcher(this.uri).find();
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        StringBuilder result = new StringBuilder(30);
        maybeAppend(this.title, result);
        maybeAppend(this.uri, result);
        return result.toString();
    }

    private static String massageURI(String uri) {
        String uri2 = uri.trim();
        int protocolEnd = uri2.indexOf(58);
        if (protocolEnd < 0) {
            return "http://" + uri2;
        }
        if (isColonFollowedByPortNumber(uri2, protocolEnd)) {
            return "http://" + uri2;
        }
        return uri2.substring(0, protocolEnd).toLowerCase(Locale.ENGLISH) + uri2.substring(protocolEnd);
    }

    private static boolean isColonFollowedByPortNumber(String uri, int protocolEnd) {
        int nextSlash = uri.indexOf(47, protocolEnd + 1);
        if (nextSlash < 0) {
            nextSlash = uri.length();
        }
        if (nextSlash <= protocolEnd + 1) {
            return false;
        }
        for (int x = protocolEnd + 1; x < nextSlash; x++) {
            if (uri.charAt(x) < '0' || uri.charAt(x) > '9') {
                return false;
            }
        }
        return true;
    }
}
