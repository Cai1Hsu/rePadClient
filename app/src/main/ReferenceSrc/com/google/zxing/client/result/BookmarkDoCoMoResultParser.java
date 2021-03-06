package com.google.zxing.client.result;

import com.google.zxing.Result;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class BookmarkDoCoMoResultParser extends AbstractDoCoMoResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public URIParsedResult parse(Result result) {
        String rawText = result.getText();
        if (!rawText.startsWith("MEBKM:")) {
            return null;
        }
        String title = matchSingleDoCoMoPrefixedField("TITLE:", rawText, true);
        String[] rawUri = matchDoCoMoPrefixedField("URL:", rawText, true);
        if (rawUri == null) {
            return null;
        }
        String uri = rawUri[0];
        if (!URIResultParser.isBasicallyValidURI(uri)) {
            return null;
        }
        return new URIParsedResult(uri, title);
    }
}
