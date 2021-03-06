package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class AI01AndOtherAIs extends AI01decoder {
    private static final int HEADER_SIZE = 4;

    public AI01AndOtherAIs(BitArray information) {
        super(information);
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder
    public String parseInformation() throws NotFoundException {
        StringBuilder buff = new StringBuilder();
        buff.append("(01)");
        int initialGtinPosition = buff.length();
        int firstGtinDigit = getGeneralDecoder().extractNumericValueFromBitArray(4, 4);
        buff.append(firstGtinDigit);
        encodeCompressedGtinWithoutAI(buff, 8, initialGtinPosition);
        return getGeneralDecoder().decodeAllCodes(buff, 48);
    }
}
