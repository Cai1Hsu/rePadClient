package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.common.BitArray;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class AI013103decoder extends AI013x0xDecoder {
    public AI013103decoder(BitArray information) {
        super(information);
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder
    protected void addWeightCode(StringBuilder buf, int weight) {
        buf.append("(3103)");
    }

    @Override // com.google.zxing.oned.rss.expanded.decoders.AI01weightDecoder
    protected int checkWeight(int weight) {
        return weight;
    }
}
