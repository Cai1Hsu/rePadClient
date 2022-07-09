package com.google.zxing.oned.rss.expanded;

import com.google.zxing.common.BitArray;
import java.util.List;

/* loaded from: classes.jar:com/google/zxing/oned/rss/expanded/BitArrayBuilder.class */
final class BitArrayBuilder {
    private BitArrayBuilder() {
    }

    static BitArray buildBitArray(List<ExpandedPair> list) {
        int size = (list.size() << 1) - 1;
        int i = size;
        if (list.get(list.size() - 1).getRightChar() == null) {
            i = size - 1;
        }
        BitArray bitArray = new BitArray(i * 12);
        int i2 = 0;
        int value = list.get(0).getRightChar().getValue();
        for (int i3 = 11; i3 >= 0; i3--) {
            if (((1 << i3) & value) != 0) {
                bitArray.set(i2);
            }
            i2++;
        }
        int i4 = 1;
        while (i4 < list.size()) {
            ExpandedPair expandedPair = list.get(i4);
            int value2 = expandedPair.getLeftChar().getValue();
            for (int i5 = 11; i5 >= 0; i5--) {
                if (((1 << i5) & value2) != 0) {
                    bitArray.set(i2);
                }
                i2++;
            }
            int i6 = i2;
            if (expandedPair.getRightChar() != null) {
                int value3 = expandedPair.getRightChar().getValue();
                int i7 = 11;
                while (true) {
                    i6 = i2;
                    if (i7 >= 0) {
                        if (((1 << i7) & value3) != 0) {
                            bitArray.set(i2);
                        }
                        i2++;
                        i7--;
                    }
                }
            }
            i4++;
            i2 = i6;
        }
        return bitArray;
    }
}
