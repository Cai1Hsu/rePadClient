package com.google.zxing.oned.rss;

import android.support.v4.media.TransportMediator;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitArray;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/oned/rss/RSS14Reader.class */
public final class RSS14Reader extends AbstractRSSReader {
    private final List<Pair> possibleLeftPairs = new ArrayList();
    private final List<Pair> possibleRightPairs = new ArrayList();
    private static final int[] OUTSIDE_EVEN_TOTAL_SUBSET = {1, 10, 34, 70, TransportMediator.KEYCODE_MEDIA_PLAY};
    private static final int[] INSIDE_ODD_TOTAL_SUBSET = {4, 20, 48, 81};
    private static final int[] OUTSIDE_GSUM = {0, 161, 961, 2015, 2715};
    private static final int[] INSIDE_GSUM = {0, 336, 1036, 1516};
    private static final int[] OUTSIDE_ODD_WIDEST = {8, 6, 4, 3, 1};
    private static final int[] INSIDE_ODD_WIDEST = {2, 4, 6, 8};
    private static final int[][] FINDER_PATTERNS = {new int[]{3, 8, 2, 1}, new int[]{3, 5, 5, 1}, new int[]{3, 3, 7, 1}, new int[]{3, 1, 9, 1}, new int[]{2, 7, 4, 1}, new int[]{2, 5, 6, 1}, new int[]{2, 3, 8, 1}, new int[]{1, 5, 7, 1}, new int[]{1, 3, 9, 1}};

    private static void addOrTally(Collection<Pair> collection, Pair pair) {
        boolean z;
        if (pair == null) {
            return;
        }
        Iterator<Pair> it = collection.iterator();
        while (true) {
            z = false;
            if (!it.hasNext()) {
                break;
            }
            Pair next = it.next();
            if (next.getValue() == pair.getValue()) {
                next.incrementCount();
                z = true;
                break;
            }
        }
        if (z) {
            return;
        }
        collection.add(pair);
    }

    private void adjustOddEvenCounts(boolean z, int i) throws NotFoundException {
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        boolean z7;
        int count = count(getOddCounts());
        int count2 = count(getEvenCounts());
        int i2 = (count + count2) - i;
        boolean z8 = (count & 1) == (z ? 1 : 0);
        boolean z9 = (count2 & 1) == 1;
        boolean z10 = false;
        boolean z11 = false;
        if (z) {
            if (count > 12) {
                z7 = true;
            } else {
                z7 = false;
                if (count < 4) {
                    z10 = true;
                    z7 = false;
                }
            }
            if (count2 > 12) {
                z4 = true;
                z6 = z10;
                z5 = z7;
            } else {
                z4 = false;
                z5 = z7;
                z6 = z10;
                if (count2 < 4) {
                    z11 = true;
                    z4 = false;
                    z5 = z7;
                    z6 = z10;
                }
            }
        } else {
            if (count > 11) {
                z2 = true;
                z3 = false;
            } else {
                z2 = false;
                z3 = false;
                if (count < 5) {
                    z3 = true;
                    z2 = false;
                }
            }
            if (count2 > 10) {
                z4 = true;
                z5 = z2;
                z6 = z3;
            } else {
                z4 = false;
                z5 = z2;
                z6 = z3;
                if (count2 < 4) {
                    z11 = true;
                    z4 = false;
                    z5 = z2;
                    z6 = z3;
                }
            }
        }
        if (i2 == 1) {
            if (z8) {
                if (z9) {
                    throw NotFoundException.getNotFoundInstance();
                }
                z5 = true;
            } else if (!z9) {
                throw NotFoundException.getNotFoundInstance();
            } else {
                z4 = true;
            }
        } else if (i2 == -1) {
            if (z8) {
                if (z9) {
                    throw NotFoundException.getNotFoundInstance();
                }
                z6 = true;
            } else if (!z9) {
                throw NotFoundException.getNotFoundInstance();
            } else {
                z11 = true;
            }
        } else if (i2 != 0) {
            throw NotFoundException.getNotFoundInstance();
        } else {
            if (z8) {
                if (!z9) {
                    throw NotFoundException.getNotFoundInstance();
                }
                if (count < count2) {
                    z6 = true;
                    z4 = true;
                } else {
                    z5 = true;
                    z11 = true;
                }
            } else if (z9) {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        if (z6) {
            if (z5) {
                throw NotFoundException.getNotFoundInstance();
            }
            increment(getOddCounts(), getOddRoundingErrors());
        }
        if (z5) {
            decrement(getOddCounts(), getOddRoundingErrors());
        }
        if (z11) {
            if (z4) {
                throw NotFoundException.getNotFoundInstance();
            }
            increment(getEvenCounts(), getOddRoundingErrors());
        }
        if (z4) {
            decrement(getEvenCounts(), getEvenRoundingErrors());
        }
    }

    private static boolean checkChecksum(Pair pair, Pair pair2) {
        int value = pair.getFinderPattern().getValue();
        int value2 = pair2.getFinderPattern().getValue();
        if ((value != 0 || value2 != 8) && value == 8 && value2 == 0) {
        }
        int checksumPortion = pair.getChecksumPortion();
        int checksumPortion2 = pair2.getChecksumPortion();
        int value3 = (pair.getFinderPattern().getValue() * 9) + pair2.getFinderPattern().getValue();
        int i = value3;
        if (value3 > 72) {
            i = value3 - 1;
        }
        int i2 = i;
        if (i > 8) {
            i2 = i - 1;
        }
        return (checksumPortion + (checksumPortion2 * 16)) % 79 == i2;
    }

    private static Result constructResult(Pair pair, Pair pair2) {
        String valueOf = String.valueOf((4537077 * pair.getValue()) + pair2.getValue());
        StringBuilder sb = new StringBuilder(14);
        for (int length = 13 - valueOf.length(); length > 0; length--) {
            sb.append('0');
        }
        sb.append(valueOf);
        int i = 0;
        for (int i2 = 0; i2 < 13; i2++) {
            int charAt = sb.charAt(i2) - '0';
            int i3 = charAt;
            if ((i2 & 1) == 0) {
                i3 = charAt * 3;
            }
            i += i3;
        }
        int i4 = 10 - (i % 10);
        int i5 = i4;
        if (i4 == 10) {
            i5 = 0;
        }
        sb.append(i5);
        ResultPoint[] resultPoints = pair.getFinderPattern().getResultPoints();
        ResultPoint[] resultPoints2 = pair2.getFinderPattern().getResultPoints();
        return new Result(String.valueOf(sb.toString()), null, new ResultPoint[]{resultPoints[0], resultPoints[1], resultPoints2[0], resultPoints2[1]}, BarcodeFormat.RSS_14);
    }

    private DataCharacter decodeDataCharacter(BitArray bitArray, FinderPattern finderPattern, boolean z) throws NotFoundException {
        DataCharacter dataCharacter;
        int i;
        int[] dataCharacterCounters = getDataCharacterCounters();
        dataCharacterCounters[0] = 0;
        dataCharacterCounters[1] = 0;
        dataCharacterCounters[2] = 0;
        dataCharacterCounters[3] = 0;
        dataCharacterCounters[4] = 0;
        dataCharacterCounters[5] = 0;
        dataCharacterCounters[6] = 0;
        dataCharacterCounters[7] = 0;
        if (z) {
            recordPatternInReverse(bitArray, finderPattern.getStartEnd()[0], dataCharacterCounters);
        } else {
            recordPattern(bitArray, finderPattern.getStartEnd()[1] + 1, dataCharacterCounters);
            int i2 = 0;
            for (int length = dataCharacterCounters.length - 1; i2 < length; length--) {
                int i3 = dataCharacterCounters[i2];
                dataCharacterCounters[i2] = dataCharacterCounters[length];
                dataCharacterCounters[length] = i3;
                i2++;
            }
        }
        int i4 = z ? 16 : 15;
        float count = count(dataCharacterCounters) / i4;
        int[] oddCounts = getOddCounts();
        int[] evenCounts = getEvenCounts();
        float[] oddRoundingErrors = getOddRoundingErrors();
        float[] evenRoundingErrors = getEvenRoundingErrors();
        for (int i5 = 0; i5 < dataCharacterCounters.length; i5++) {
            float f = dataCharacterCounters[i5] / count;
            int i6 = (int) (0.5f + f);
            if (i6 < 1) {
                i = 1;
            } else {
                i = i6;
                if (i6 > 8) {
                    i = 8;
                }
            }
            int i7 = i5 >> 1;
            if ((i5 & 1) == 0) {
                oddCounts[i7] = i;
                oddRoundingErrors[i7] = f - i;
            } else {
                evenCounts[i7] = i;
                evenRoundingErrors[i7] = f - i;
            }
        }
        adjustOddEvenCounts(z, i4);
        int i8 = 0;
        int i9 = 0;
        for (int length2 = oddCounts.length - 1; length2 >= 0; length2--) {
            i9 = (i9 * 9) + oddCounts[length2];
            i8 += oddCounts[length2];
        }
        int i10 = 0;
        int i11 = 0;
        for (int length3 = evenCounts.length - 1; length3 >= 0; length3--) {
            i10 = (i10 * 9) + evenCounts[length3];
            i11 += evenCounts[length3];
        }
        int i12 = i9 + (i10 * 3);
        if (z) {
            if ((i8 & 1) != 0 || i8 > 12 || i8 < 4) {
                throw NotFoundException.getNotFoundInstance();
            }
            int i13 = (12 - i8) / 2;
            int i14 = OUTSIDE_ODD_WIDEST[i13];
            dataCharacter = new DataCharacter((RSSUtils.getRSSvalue(oddCounts, i14, false) * OUTSIDE_EVEN_TOTAL_SUBSET[i13]) + RSSUtils.getRSSvalue(evenCounts, 9 - i14, true) + OUTSIDE_GSUM[i13], i12);
        } else if ((i11 & 1) != 0 || i11 > 10 || i11 < 4) {
            throw NotFoundException.getNotFoundInstance();
        } else {
            int i15 = (10 - i11) / 2;
            int i16 = INSIDE_ODD_WIDEST[i15];
            dataCharacter = new DataCharacter((RSSUtils.getRSSvalue(evenCounts, 9 - i16, false) * INSIDE_ODD_TOTAL_SUBSET[i15]) + RSSUtils.getRSSvalue(oddCounts, i16, true) + INSIDE_GSUM[i15], i12);
        }
        return dataCharacter;
    }

    private Pair decodePair(BitArray bitArray, boolean z, int i, Map<DecodeHintType, ?> map) {
        Pair pair;
        int[] findFinderPattern;
        try {
            FinderPattern parseFoundFinderPattern = parseFoundFinderPattern(bitArray, i, z, findFinderPattern(bitArray, 0, z));
            ResultPointCallback resultPointCallback = map == null ? null : (ResultPointCallback) map.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
            if (resultPointCallback != null) {
                float f = (findFinderPattern[0] + findFinderPattern[1]) / 2.0f;
                float f2 = f;
                if (z) {
                    f2 = (bitArray.getSize() - 1) - f;
                }
                resultPointCallback.foundPossibleResultPoint(new ResultPoint(f2, i));
            }
            DataCharacter decodeDataCharacter = decodeDataCharacter(bitArray, parseFoundFinderPattern, true);
            DataCharacter decodeDataCharacter2 = decodeDataCharacter(bitArray, parseFoundFinderPattern, false);
            pair = new Pair((decodeDataCharacter.getValue() * 1597) + decodeDataCharacter2.getValue(), decodeDataCharacter.getChecksumPortion() + (decodeDataCharacter2.getChecksumPortion() * 4), parseFoundFinderPattern);
        } catch (NotFoundException e) {
            pair = null;
        }
        return pair;
    }

    private int[] findFinderPattern(BitArray bitArray, int i, boolean z) throws NotFoundException {
        boolean z2;
        int[] decodeFinderCounters = getDecodeFinderCounters();
        decodeFinderCounters[0] = 0;
        decodeFinderCounters[1] = 0;
        decodeFinderCounters[2] = 0;
        decodeFinderCounters[3] = 0;
        int size = bitArray.getSize();
        boolean z3 = false;
        while (i < size) {
            z3 = !bitArray.get(i);
            if (z == z3) {
                break;
            }
            i++;
        }
        int i2 = i;
        int i3 = i;
        int i4 = 0;
        while (i2 < size) {
            if (bitArray.get(i2) ^ z3) {
                decodeFinderCounters[i4] = decodeFinderCounters[i4] + 1;
                z2 = z3;
            } else {
                if (i4 != 3) {
                    i4++;
                } else if (isFinderPattern(decodeFinderCounters)) {
                    return new int[]{i3, i2};
                } else {
                    i3 += decodeFinderCounters[0] + decodeFinderCounters[1];
                    decodeFinderCounters[0] = decodeFinderCounters[2];
                    decodeFinderCounters[1] = decodeFinderCounters[3];
                    decodeFinderCounters[2] = 0;
                    decodeFinderCounters[3] = 0;
                    i4--;
                }
                decodeFinderCounters[i4] = 1;
                z2 = !z3;
            }
            i2++;
            z3 = z2;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private FinderPattern parseFoundFinderPattern(BitArray bitArray, int i, boolean z, int[] iArr) throws NotFoundException {
        boolean z2 = bitArray.get(iArr[0]);
        int i2 = iArr[0] - 1;
        while (i2 >= 0 && (bitArray.get(i2) ^ z2)) {
            i2--;
        }
        int i3 = i2 + 1;
        int i4 = iArr[0];
        int[] decodeFinderCounters = getDecodeFinderCounters();
        System.arraycopy(decodeFinderCounters, 0, decodeFinderCounters, 1, decodeFinderCounters.length - 1);
        decodeFinderCounters[0] = i4 - i3;
        int parseFinderValue = parseFinderValue(decodeFinderCounters, FINDER_PATTERNS);
        int i5 = iArr[1];
        int i6 = i3;
        int i7 = i5;
        if (z) {
            i6 = (bitArray.getSize() - 1) - i3;
            i7 = (bitArray.getSize() - 1) - i5;
        }
        return new FinderPattern(parseFinderValue, new int[]{i3, iArr[1]}, i6, i7, i);
    }

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException {
        addOrTally(this.possibleLeftPairs, decodePair(bitArray, false, i, map));
        bitArray.reverse();
        addOrTally(this.possibleRightPairs, decodePair(bitArray, true, i, map));
        bitArray.reverse();
        for (Pair pair : this.possibleLeftPairs) {
            if (pair.getCount() > 1) {
                for (Pair pair2 : this.possibleRightPairs) {
                    if (pair2.getCount() > 1 && checkChecksum(pair, pair2)) {
                        return constructResult(pair, pair2);
                    }
                }
                continue;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    @Override // com.google.zxing.oned.OneDReader, com.google.zxing.Reader
    public void reset() {
        this.possibleLeftPairs.clear();
        this.possibleRightPairs.clear();
    }
}
