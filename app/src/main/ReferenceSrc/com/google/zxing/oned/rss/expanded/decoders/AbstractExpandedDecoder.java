package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;

/* loaded from: classes.jar:com/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder.class */
public abstract class AbstractExpandedDecoder {
    private final GeneralAppIdDecoder generalDecoder;
    private final BitArray information;

    AbstractExpandedDecoder(BitArray bitArray) {
        this.information = bitArray;
        this.generalDecoder = new GeneralAppIdDecoder(bitArray);
    }

    public static AbstractExpandedDecoder createDecoder(BitArray bitArray) {
        AbstractExpandedDecoder aI01320xDecoder;
        if (bitArray.get(1)) {
            aI01320xDecoder = new AI01AndOtherAIs(bitArray);
        } else if (!bitArray.get(2)) {
            aI01320xDecoder = new AnyAIDecoder(bitArray);
        } else {
            switch (GeneralAppIdDecoder.extractNumericValueFromBitArray(bitArray, 1, 4)) {
                case 4:
                    aI01320xDecoder = new AI013103decoder(bitArray);
                    break;
                case 5:
                    aI01320xDecoder = new AI01320xDecoder(bitArray);
                    break;
                default:
                    switch (GeneralAppIdDecoder.extractNumericValueFromBitArray(bitArray, 1, 5)) {
                        case 12:
                            aI01320xDecoder = new AI01392xDecoder(bitArray);
                            break;
                        case 13:
                            aI01320xDecoder = new AI01393xDecoder(bitArray);
                            break;
                        default:
                            switch (GeneralAppIdDecoder.extractNumericValueFromBitArray(bitArray, 1, 7)) {
                                case 56:
                                    aI01320xDecoder = new AI013x0x1xDecoder(bitArray, "310", "11");
                                    break;
                                case 57:
                                    aI01320xDecoder = new AI013x0x1xDecoder(bitArray, "320", "11");
                                    break;
                                case 58:
                                    aI01320xDecoder = new AI013x0x1xDecoder(bitArray, "310", "13");
                                    break;
                                case 59:
                                    aI01320xDecoder = new AI013x0x1xDecoder(bitArray, "320", "13");
                                    break;
                                case 60:
                                    aI01320xDecoder = new AI013x0x1xDecoder(bitArray, "310", "15");
                                    break;
                                case 61:
                                    aI01320xDecoder = new AI013x0x1xDecoder(bitArray, "320", "15");
                                    break;
                                case 62:
                                    aI01320xDecoder = new AI013x0x1xDecoder(bitArray, "310", "17");
                                    break;
                                case 63:
                                    aI01320xDecoder = new AI013x0x1xDecoder(bitArray, "320", "17");
                                    break;
                                default:
                                    throw new IllegalStateException("unknown decoder: " + bitArray);
                            }
                    }
            }
        }
        return aI01320xDecoder;
    }

    protected GeneralAppIdDecoder getGeneralDecoder() {
        return this.generalDecoder;
    }

    protected BitArray getInformation() {
        return this.information;
    }

    public abstract String parseInformation() throws NotFoundException;
}
