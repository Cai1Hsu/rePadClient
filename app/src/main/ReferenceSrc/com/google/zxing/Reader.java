package com.google.zxing;

import java.util.Map;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface Reader {
    Result decode(BinaryBitmap binaryBitmap) throws NotFoundException, ChecksumException, FormatException;

    Result decode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException;

    void reset();
}
