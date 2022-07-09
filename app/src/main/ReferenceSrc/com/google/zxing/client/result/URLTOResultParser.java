package com.google.zxing.client.result;

import com.google.zxing.Result;

/* loaded from: classes.jar:com/google/zxing/client/result/URLTOResultParser.class */
public final class URLTOResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public URIParsedResult parse(Result result) {
        URIParsedResult uRIParsedResult;
        String text = result.getText();
        if (text.startsWith("urlto:") || text.startsWith("URLTO:")) {
            int indexOf = text.indexOf(58, 6);
            uRIParsedResult = null;
            if (indexOf >= 0) {
                uRIParsedResult = new URIParsedResult(text.substring(indexOf + 1), indexOf <= 6 ? null : text.substring(6, indexOf));
            }
        } else {
            uRIParsedResult = null;
        }
        return uRIParsedResult;
    }
}
