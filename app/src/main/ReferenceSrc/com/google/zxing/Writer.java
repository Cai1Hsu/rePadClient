package com.google.zxing;

import com.google.zxing.common.BitMatrix;
import java.util.Map;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface Writer {
    BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2) throws WriterException;

    BitMatrix encode(String str, BarcodeFormat barcodeFormat, int i, int i2, Map<EncodeHintType, ?> map) throws WriterException;
}
