package com.google.zxing.client.result;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import com.google.zxing.oned.UPCEReader;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class ProductResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public ProductParsedResult parse(Result result) {
        String normalizedProductID;
        BarcodeFormat format = result.getBarcodeFormat();
        if (format == BarcodeFormat.UPC_A || format == BarcodeFormat.UPC_E || format == BarcodeFormat.EAN_8 || format == BarcodeFormat.EAN_13) {
            String rawText = result.getText();
            int length = rawText.length();
            for (int x = 0; x < length; x++) {
                char c = rawText.charAt(x);
                if (c < '0' || c > '9') {
                    return null;
                }
            }
            if (format == BarcodeFormat.UPC_E) {
                normalizedProductID = UPCEReader.convertUPCEtoUPCA(rawText);
            } else {
                normalizedProductID = rawText;
            }
            return new ProductParsedResult(rawText, normalizedProductID);
        }
        return null;
    }
}
