package com.google.zxing.client.result;

import com.google.zxing.Result;

/* loaded from: classes.jar:com/google/zxing/client/result/BookmarkDoCoMoResultParser.class */
public final class BookmarkDoCoMoResultParser extends AbstractDoCoMoResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public URIParsedResult parse(Result result) {
        URIParsedResult uRIParsedResult;
        String text = result.getText();
        if (!text.startsWith("MEBKM:")) {
            uRIParsedResult = null;
        } else {
            String matchSingleDoCoMoPrefixedField = matchSingleDoCoMoPrefixedField("TITLE:", text, true);
            String[] matchDoCoMoPrefixedField = matchDoCoMoPrefixedField("URL:", text, true);
            uRIParsedResult = null;
            if (matchDoCoMoPrefixedField != null) {
                String str = matchDoCoMoPrefixedField[0];
                uRIParsedResult = null;
                if (URIResultParser.isBasicallyValidURI(str)) {
                    uRIParsedResult = new URIParsedResult(str, matchSingleDoCoMoPrefixedField);
                }
            }
        }
        return uRIParsedResult;
    }
}
