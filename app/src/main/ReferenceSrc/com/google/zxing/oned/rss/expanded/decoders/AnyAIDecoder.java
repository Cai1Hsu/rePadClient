package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class AnyAIDecoder extends AbstractExpandedDecoder {
    private static final int HEADER_SIZE = 5;

    public AnyAIDecoder(BitArray information) {
        super(information);
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder
    public String parseInformation() throws NotFoundException {
        StringBuilder buf = new StringBuilder();
        return getGeneralDecoder().decodeAllCodes(buf, 5);
    }
}
