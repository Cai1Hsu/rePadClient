package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.regex.Pattern;

/* loaded from: classes.jar:com/google/zxing/client/result/EmailDoCoMoResultParser.class */
public final class EmailDoCoMoResultParser extends AbstractDoCoMoResultParser {
    private static final Pattern ATEXT_ALPHANUMERIC = Pattern.compile("[a-zA-Z0-9@.!#$%&'*+\\-/=?^_`{|}~]+");

    static boolean isBasicallyValidEmailAddress(String str) {
        return str != null && ATEXT_ALPHANUMERIC.matcher(str).matches() && str.indexOf(64) >= 0;
    }

    @Override // com.google.zxing.client.result.ResultParser
    public EmailAddressParsedResult parse(Result result) {
        EmailAddressParsedResult emailAddressParsedResult;
        String text = result.getText();
        if (!text.startsWith("MATMSG:")) {
            emailAddressParsedResult = null;
        } else {
            String[] matchDoCoMoPrefixedField = matchDoCoMoPrefixedField("TO:", text, true);
            emailAddressParsedResult = null;
            if (matchDoCoMoPrefixedField != null) {
                String str = matchDoCoMoPrefixedField[0];
                emailAddressParsedResult = null;
                if (isBasicallyValidEmailAddress(str)) {
                    emailAddressParsedResult = new EmailAddressParsedResult(str, matchSingleDoCoMoPrefixedField("SUB:", text, false), matchSingleDoCoMoPrefixedField("BODY:", text, false), "mailto:" + str);
                }
            }
        }
        return emailAddressParsedResult;
    }
}
