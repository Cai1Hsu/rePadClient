package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/client/result/EmailAddressResultParser.class */
public final class EmailAddressResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public EmailAddressParsedResult parse(Result result) {
        EmailAddressParsedResult emailAddressParsedResult;
        String text = result.getText();
        if (text.startsWith("mailto:") || text.startsWith("MAILTO:")) {
            String substring = text.substring(7);
            int indexOf = substring.indexOf(63);
            String str = substring;
            if (indexOf >= 0) {
                str = substring.substring(0, indexOf);
            }
            Map<String, String> parseNameValuePairs = parseNameValuePairs(text);
            String str2 = null;
            String str3 = null;
            String str4 = str;
            if (parseNameValuePairs != null) {
                str4 = str;
                if (str.length() == 0) {
                    str4 = parseNameValuePairs.get("to");
                }
                str2 = parseNameValuePairs.get("subject");
                str3 = parseNameValuePairs.get("body");
            }
            emailAddressParsedResult = new EmailAddressParsedResult(str4, str2, str3, text);
        } else {
            emailAddressParsedResult = null;
            if (EmailDoCoMoResultParser.isBasicallyValidEmailAddress(text)) {
                emailAddressParsedResult = new EmailAddressParsedResult(text, null, null, "mailto:" + text);
            }
        }
        return emailAddressParsedResult;
    }
}
