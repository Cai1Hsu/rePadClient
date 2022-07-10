package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class URIResultParser extends ResultParser {
    private static final String PATTERN_END = "(:\\d{1,5})?(/|\\?|$)";
    private static final Pattern URL_WITH_PROTOCOL_PATTERN = Pattern.compile("[a-zA-Z0-9]{2,}://[a-zA-Z0-9\\-]+(\\.[a-zA-Z0-9\\-]+)*(:\\d{1,5})?(/|\\?|$)");
    private static final Pattern URL_WITHOUT_PROTOCOL_PATTERN = Pattern.compile("([a-zA-Z0-9\\-]+\\.)+[a-zA-Z0-9\\-]{2,}(:\\d{1,5})?(/|\\?|$)");

    @Override // com.google.zxing.client.result.ResultParser
    public URIParsedResult parse(Result result) {
        String rawText = result.getText();
        if (rawText.startsWith("URL:")) {
            rawText = rawText.substring(4);
        }
        String rawText2 = rawText.trim();
        if (isBasicallyValidURI(rawText2)) {
            return new URIParsedResult(rawText2, null);
        }
        return null;
    }

    public static boolean isBasicallyValidURI(CharSequence uri) {
        Matcher m = URL_WITH_PROTOCOL_PATTERN.matcher(uri);
        if (!m.find() || m.start() != 0) {
            Matcher m2 = URL_WITHOUT_PROTOCOL_PATTERN.matcher(uri);
            return m2.find() && m2.start() == 0;
        }
        return true;
    }
}
