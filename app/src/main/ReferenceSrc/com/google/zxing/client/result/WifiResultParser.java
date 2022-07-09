package com.google.zxing.client.result;

import com.google.zxing.Result;

/* loaded from: classes.jar:com/google/zxing/client/result/WifiResultParser.class */
public final class WifiResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public WifiParsedResult parse(Result result) {
        WifiParsedResult wifiParsedResult;
        String text = result.getText();
        if (!text.startsWith("WIFI:")) {
            wifiParsedResult = null;
        } else {
            String matchSinglePrefixedField = matchSinglePrefixedField("S:", text, ';', false);
            wifiParsedResult = null;
            if (matchSinglePrefixedField != null) {
                wifiParsedResult = null;
                if (matchSinglePrefixedField.length() != 0) {
                    String matchSinglePrefixedField2 = matchSinglePrefixedField("P:", text, ';', false);
                    String matchSinglePrefixedField3 = matchSinglePrefixedField("T:", text, ';', false);
                    String str = matchSinglePrefixedField3;
                    if (matchSinglePrefixedField3 == null) {
                        str = "nopass";
                    }
                    wifiParsedResult = new WifiParsedResult(str, matchSinglePrefixedField, matchSinglePrefixedField2);
                }
            }
        }
        return wifiParsedResult;
    }
}
