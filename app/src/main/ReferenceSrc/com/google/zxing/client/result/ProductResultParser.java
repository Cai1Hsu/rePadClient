package com.google.zxing.client.result;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import com.google.zxing.oned.UPCEReader;

/* loaded from: classes.jar:com/google/zxing/client/result/ProductResultParser.class */
public final class ProductResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public ProductParsedResult parse(Result result) {
        ProductParsedResult productParsedResult;
        BarcodeFormat barcodeFormat = result.getBarcodeFormat();
        if (barcodeFormat == BarcodeFormat.UPC_A || barcodeFormat == BarcodeFormat.UPC_E || barcodeFormat == BarcodeFormat.EAN_8 || barcodeFormat == BarcodeFormat.EAN_13) {
            String text = result.getText();
            int length = text.length();
            int i = 0;
            while (true) {
                if (i < length) {
                    char charAt = text.charAt(i);
                    productParsedResult = null;
                    if (charAt < '0') {
                        break;
                    }
                    productParsedResult = null;
                    if (charAt > '9') {
                        break;
                    }
                    i++;
                } else {
                    productParsedResult = new ProductParsedResult(text, barcodeFormat == BarcodeFormat.UPC_E ? UPCEReader.convertUPCEtoUPCA(text) : text);
                }
            }
        } else {
            productParsedResult = null;
        }
        return productParsedResult;
    }
}
