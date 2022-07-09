package com.google.zxing.client.result;

import com.google.zxing.Result;

/* loaded from: classes.jar:com/google/zxing/client/result/SMSTOMMSTOResultParser.class */
public final class SMSTOMMSTOResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public SMSParsedResult parse(Result result) {
        SMSParsedResult sMSParsedResult;
        String text = result.getText();
        if (text.startsWith("smsto:") || text.startsWith("SMSTO:") || text.startsWith("mmsto:") || text.startsWith("MMSTO:")) {
            String substring = text.substring(6);
            String str = null;
            int indexOf = substring.indexOf(58);
            String str2 = substring;
            if (indexOf >= 0) {
                str = substring.substring(indexOf + 1);
                str2 = substring.substring(0, indexOf);
            }
            sMSParsedResult = new SMSParsedResult(str2, (String) null, (String) null, str);
        } else {
            sMSParsedResult = null;
        }
        return sMSParsedResult;
    }
}
