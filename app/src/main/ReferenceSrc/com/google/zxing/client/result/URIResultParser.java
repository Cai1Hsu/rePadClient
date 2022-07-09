package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.jar:com/google/zxing/client/result/URIResultParser.class */
public final class URIResultParser extends ResultParser {
    private static final String PATTERN_END = "(:\\d{1,5})?(/|\\?|$)";
    private static final Pattern URL_WITH_PROTOCOL_PATTERN = Pattern.compile("[a-zA-Z0-9]{2,}://[a-zA-Z0-9\\-]+(\\.[a-zA-Z0-9\\-]+)*(:\\d{1,5})?(/|\\?|$)");
    private static final Pattern URL_WITHOUT_PROTOCOL_PATTERN = Pattern.compile("([a-zA-Z0-9\\-]+\\.)+[a-zA-Z0-9\\-]{2,}(:\\d{1,5})?(/|\\?|$)");

    static boolean isBasicallyValidURI(CharSequence charSequence) {
        boolean z = true;
        Matcher matcher = URL_WITH_PROTOCOL_PATTERN.matcher(charSequence);
        if (!matcher.find() || matcher.start() != 0) {
            Matcher matcher2 = URL_WITHOUT_PROTOCOL_PATTERN.matcher(charSequence);
            if (!matcher2.find() || matcher2.start() != 0) {
                z = false;
            }
        }
        return z;
    }

    @Override // com.google.zxing.client.result.ResultParser
    public URIParsedResult parse(Result result) {
        String text = result.getText();
        String str = text;
        if (text.startsWith("URL:")) {
            str = text.substring(4);
        }
        String trim = str.trim();
        return isBasicallyValidURI(trim) ? new URIParsedResult(trim, null) : null;
    }
}
