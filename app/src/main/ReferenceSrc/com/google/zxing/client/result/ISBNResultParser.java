package com.google.zxing.client.result;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;

/* loaded from: classes.jar:com/google/zxing/client/result/ISBNResultParser.class */
public final class ISBNResultParser extends ResultParser {
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0031, code lost:
        if (r0.startsWith("979") != false) goto L13;
     */
    @Override // com.google.zxing.client.result.ResultParser
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ISBNParsedResult parse(Result result) {
        ISBNParsedResult iSBNParsedResult;
        if (result.getBarcodeFormat() != BarcodeFormat.EAN_13) {
            iSBNParsedResult = null;
        } else {
            String text = result.getText();
            iSBNParsedResult = null;
            if (text.length() == 13) {
                if (!text.startsWith("978")) {
                    iSBNParsedResult = null;
                }
                iSBNParsedResult = new ISBNParsedResult(text);
            }
        }
        return iSBNParsedResult;
    }
}
