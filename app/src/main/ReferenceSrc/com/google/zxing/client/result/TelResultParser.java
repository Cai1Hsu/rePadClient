package com.google.zxing.client.result;

import com.google.zxing.Result;

/* loaded from: classes.jar:com/google/zxing/client/result/TelResultParser.class */
public final class TelResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public TelParsedResult parse(Result result) {
        TelParsedResult telParsedResult;
        String text = result.getText();
        if (text.startsWith("tel:") || text.startsWith("TEL:")) {
            String str = text.startsWith("TEL:") ? "tel:" + text.substring(4) : text;
            int indexOf = text.indexOf(63, 4);
            telParsedResult = new TelParsedResult(indexOf < 0 ? text.substring(4) : text.substring(4, indexOf), str, null);
        } else {
            telParsedResult = null;
        }
        return telParsedResult;
    }
}
