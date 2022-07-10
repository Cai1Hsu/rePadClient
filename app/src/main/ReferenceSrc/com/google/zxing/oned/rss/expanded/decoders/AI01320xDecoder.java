package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.common.BitArray;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class AI01320xDecoder extends AI013x0xDecoder {
    public AI01320xDecoder(BitArray information) {
        super(information);
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder
    protected void addWeightCode(StringBuilder buf, int weight) {
        if (weight < 10000) {
            buf.append("(3202)");
        } else {
            buf.append("(3203)");
        }
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder
    protected int checkWeight(int weight) {
        return weight < 10000 ? weight : weight - 10000;
    }
}
