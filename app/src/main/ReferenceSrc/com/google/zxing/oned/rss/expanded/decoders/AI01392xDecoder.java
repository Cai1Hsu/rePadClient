package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class AI01392xDecoder extends AI01decoder {
    private static final int HEADER_SIZE = 8;
    private static final int LAST_DIGIT_SIZE = 2;

    public AI01392xDecoder(BitArray information) {
        super(information);
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder
    public String parseInformation() throws NotFoundException {
        if (getInformation().getSize() < 48) {
            throw NotFoundException.getNotFoundInstance();
        }
        StringBuilder buf = new StringBuilder();
        encodeCompressedGtin(buf, 8);
        int lastAIdigit = getGeneralDecoder().extractNumericValueFromBitArray(48, 2);
        buf.append("(392");
        buf.append(lastAIdigit);
        buf.append(')');
        DecodedInformation decodedInformation = getGeneralDecoder().decodeGeneralPurposeField(50, null);
        buf.append(decodedInformation.getNewString());
        return buf.toString();
    }
}
