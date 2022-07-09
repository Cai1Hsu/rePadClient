package com.mining.app.zxing.decoding;

import android.content.Intent;
import android.net.Uri;
import com.google.zxing.BarcodeFormat;
import com.mining.app.zxing.decoding.Intents;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;
import java.util.regex.Pattern;

/* loaded from: classes.jar:com/mining/app/zxing/decoding/DecodeFormatManager.class */
final class DecodeFormatManager {
    private static final Pattern COMMA_PATTERN = Pattern.compile(",");
    static final Vector<BarcodeFormat> PRODUCT_FORMATS = new Vector<>(5);
    static final Vector<BarcodeFormat> ONE_D_FORMATS = new Vector<>(PRODUCT_FORMATS.size() + 4);
    static final Vector<BarcodeFormat> QR_CODE_FORMATS = new Vector<>(1);
    static final Vector<BarcodeFormat> DATA_MATRIX_FORMATS = new Vector<>(1);

    static {
        PRODUCT_FORMATS.add(BarcodeFormat.UPC_A);
        PRODUCT_FORMATS.add(BarcodeFormat.UPC_E);
        PRODUCT_FORMATS.add(BarcodeFormat.EAN_13);
        PRODUCT_FORMATS.add(BarcodeFormat.EAN_8);
        PRODUCT_FORMATS.add(BarcodeFormat.RSS_14);
        ONE_D_FORMATS.addAll(PRODUCT_FORMATS);
        ONE_D_FORMATS.add(BarcodeFormat.CODE_39);
        ONE_D_FORMATS.add(BarcodeFormat.CODE_93);
        ONE_D_FORMATS.add(BarcodeFormat.CODE_128);
        ONE_D_FORMATS.add(BarcodeFormat.ITF);
        QR_CODE_FORMATS.add(BarcodeFormat.QR_CODE);
        DATA_MATRIX_FORMATS.add(BarcodeFormat.DATA_MATRIX);
    }

    private DecodeFormatManager() {
    }

    static Vector<BarcodeFormat> parseDecodeFormats(Intent intent) {
        List list = null;
        String stringExtra = intent.getStringExtra(Intents.Scan.SCAN_FORMATS);
        if (stringExtra != null) {
            list = Arrays.asList(COMMA_PATTERN.split(stringExtra));
        }
        return parseDecodeFormats(list, intent.getStringExtra(Intents.Scan.MODE));
    }

    static Vector<BarcodeFormat> parseDecodeFormats(Uri uri) {
        List<String> queryParameters = uri.getQueryParameters(Intents.Scan.SCAN_FORMATS);
        List<String> list = queryParameters;
        if (queryParameters != null) {
            list = queryParameters;
            if (queryParameters.size() == 1) {
                list = queryParameters;
                if (queryParameters.get(0) != null) {
                    list = Arrays.asList(COMMA_PATTERN.split(queryParameters.get(0)));
                }
            }
        }
        return parseDecodeFormats(list, uri.getQueryParameter(Intents.Scan.MODE));
    }

    private static Vector<BarcodeFormat> parseDecodeFormats(Iterable<String> iterable, String str) {
        Vector<BarcodeFormat> vector;
        if (iterable != null) {
            Vector<BarcodeFormat> vector2 = new Vector<>();
            try {
                for (String str2 : iterable) {
                    vector2.add(BarcodeFormat.valueOf(str2));
                }
                vector = vector2;
            } catch (IllegalArgumentException e) {
            }
            return vector;
        }
        if (str != null) {
            if (Intents.Scan.PRODUCT_MODE.equals(str)) {
                vector = PRODUCT_FORMATS;
            } else if (Intents.Scan.QR_CODE_MODE.equals(str)) {
                vector = QR_CODE_FORMATS;
            } else if (Intents.Scan.DATA_MATRIX_MODE.equals(str)) {
                vector = DATA_MATRIX_FORMATS;
            } else if (Intents.Scan.ONE_D_MODE.equals(str)) {
                vector = ONE_D_FORMATS;
            }
            return vector;
        }
        vector = null;
        return vector;
    }
}
