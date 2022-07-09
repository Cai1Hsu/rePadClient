package com.google.zxing.client.result;

import com.google.zxing.Result;

/* loaded from: classes.jar:com/google/zxing/client/result/SMTPResultParser.class */
public final class SMTPResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public EmailAddressParsedResult parse(Result result) {
        EmailAddressParsedResult emailAddressParsedResult;
        String text = result.getText();
        if (text.startsWith("smtp:") || text.startsWith("SMTP:")) {
            String substring = text.substring(5);
            String str = null;
            int indexOf = substring.indexOf(58);
            String str2 = null;
            String str3 = substring;
            if (indexOf >= 0) {
                String substring2 = substring.substring(indexOf + 1);
                String substring3 = substring.substring(0, indexOf);
                int indexOf2 = substring2.indexOf(58);
                str2 = null;
                str3 = substring3;
                str = substring2;
                if (indexOf2 >= 0) {
                    str2 = substring2.substring(indexOf2 + 1);
                    str = substring2.substring(0, indexOf2);
                    str3 = substring3;
                }
            }
            emailAddressParsedResult = new EmailAddressParsedResult(str3, str, str2, "mailto:" + str3);
        } else {
            emailAddressParsedResult = null;
        }
        return emailAddressParsedResult;
    }
}
