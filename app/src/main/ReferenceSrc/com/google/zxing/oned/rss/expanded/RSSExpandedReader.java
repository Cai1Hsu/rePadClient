package com.google.zxing.oned.rss.expanded;

import android.support.v4.media.TransportMediator;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitArray;
import com.google.zxing.oned.rss.AbstractRSSReader;
import com.google.zxing.oned.rss.DataCharacter;
import com.google.zxing.oned.rss.FinderPattern;
import com.google.zxing.oned.rss.RSSUtils;
import com.google.zxing.oned.rss.expanded.decoders.AbstractExpandedDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.compress.archivers.tar.TarConstants;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.imap.IMAP;
import org.apache.commons.net.nntp.NNTP;
import org.apache.commons.net.nntp.NNTPReply;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:com/google/zxing/oned/rss/expanded/RSSExpandedReader.class */
public final class RSSExpandedReader extends AbstractRSSReader {
    private static final int FINDER_PAT_A = 0;
    private static final int FINDER_PAT_B = 1;
    private static final int FINDER_PAT_C = 2;
    private static final int FINDER_PAT_D = 3;
    private static final int FINDER_PAT_E = 4;
    private static final int FINDER_PAT_F = 5;
    private static final int MAX_PAIRS = 11;
    private static final int[] SYMBOL_WIDEST = {7, 5, 4, 3, 1};
    private static final int[] EVEN_TOTAL_SUBSET = {4, 20, 52, 104, HttpStatus.SC_NO_CONTENT};
    private static final int[] GSUM = {0, 348, 1388, 2948, 3988};
    private static final int[][] FINDER_PATTERNS = {new int[]{1, 8, 4, 1}, new int[]{3, 6, 4, 1}, new int[]{3, 4, 6, 1}, new int[]{3, 2, 8, 1}, new int[]{2, 6, 5, 1}, new int[]{2, 2, 9, 1}};
    private static final int[][] WEIGHTS = {new int[]{1, 3, 9, 27, 81, 32, 96, 77}, new int[]{20, 60, 180, 118, IMAP.DEFAULT_PORT, 7, 21, 63}, new int[]{189, 145, 13, 39, 117, 140, 209, 205}, new int[]{193, 157, 49, 147, 19, 57, 171, 91}, new int[]{62, 186, 136, 197, 169, 85, 44, 132}, new int[]{185, 133, 188, 142, 4, 12, 36, 108}, new int[]{113, 128, 173, 97, 80, 29, 87, 50}, new int[]{FTPReply.FILE_STATUS_OK, 28, 84, 41, 123, 158, 52, 156}, new int[]{46, 138, HttpStatus.SC_NON_AUTHORITATIVE_INFORMATION, 187, 139, HttpStatus.SC_PARTIAL_CONTENT, 196, 166}, new int[]{76, 17, 51, 153, 37, 111, 122, TarConstants.PREFIXLEN}, new int[]{43, 129, 176, 106, 107, 110, NNTP.DEFAULT_PORT, 146}, new int[]{16, 48, 144, 10, 30, 90, 59, 177}, new int[]{109, 116, 137, 200, 178, 112, FTPReply.DATA_CONNECTION_ALREADY_OPEN, 164}, new int[]{70, 210, 208, 202, 184, TransportMediator.KEYCODE_MEDIA_RECORD, 179, 115}, new int[]{134, 191, 151, 31, 93, 68, HttpStatus.SC_NO_CONTENT, 190}, new int[]{148, 22, 66, 198, 172, 94, 71, 2}, new int[]{6, 18, 54, 162, 64, 192, 154, 40}, new int[]{120, 149, 25, 75, 14, 42, TransportMediator.KEYCODE_MEDIA_PLAY, 167}, new int[]{79, 26, 78, 23, 69, HttpStatus.SC_MULTI_STATUS, NNTPReply.DEBUG_OUTPUT, 175}, new int[]{TarConstants.LF_PAX_GLOBAL_EXTENDED_HEADER, 98, 83, 38, 114, 131, 182, 124}, new int[]{161, 61, 183, 127, 170, 88, 53, 159}, new int[]{55, 165, 73, 8, 24, 72, 5, 15}, new int[]{45, 135, 194, 160, 58, 174, 100, 89}};
    private static final int[][] FINDER_PATTERN_SEQUENCES = {new int[]{0, 0}, new int[]{0, 1, 1}, new int[]{0, 2, 1, 3}, new int[]{0, 4, 1, 3, 2}, new int[]{0, 4, 1, 3, 3, 5}, new int[]{0, 4, 1, 3, 4, 5, 5}, new int[]{0, 0, 1, 1, 2, 2, 3, 3}, new int[]{0, 0, 1, 1, 2, 2, 3, 4, 4}, new int[]{0, 0, 1, 1, 2, 2, 3, 4, 5, 5}, new int[]{0, 0, 1, 1, 2, 3, 3, 4, 4, 5, 5}};
    private static final int LONGEST_SEQUENCE_SIZE = FINDER_PATTERN_SEQUENCES[FINDER_PATTERN_SEQUENCES.length - 1].length;
    private final List<ExpandedPair> pairs = new ArrayList(11);
    private final int[] startEnd = new int[2];
    private final int[] currentSequence = new int[LONGEST_SEQUENCE_SIZE];

    private void adjustOddEvenCounts(int i) throws NotFoundException {
        boolean z;
        boolean z2;
        boolean z3 = false;
        int count = count(getOddCounts());
        int count2 = count(getEvenCounts());
        int i2 = (count + count2) - i;
        boolean z4 = (count & 1) == 1;
        if ((count2 & 1) == 0) {
            z3 = true;
        }
        boolean z5 = false;
        if (count > 13) {
            z = true;
        } else {
            z = false;
            if (count < 4) {
                z5 = true;
                z = false;
            }
        }
        boolean z6 = false;
        if (count2 > 13) {
            z2 = true;
        } else {
            z2 = false;
            if (count2 < 4) {
                z6 = true;
                z2 = false;
            }
        }
        if (i2 == 1) {
            if (z4) {
                if (z3) {
                    throw NotFoundException.getNotFoundInstance();
                }
                z = true;
            } else if (!z3) {
                throw NotFoundException.getNotFoundInstance();
            } else {
                z2 = true;
            }
        } else if (i2 == -1) {
            if (z4) {
                if (z3) {
                    throw NotFoundException.getNotFoundInstance();
                }
                z5 = true;
            } else if (!z3) {
                throw NotFoundException.getNotFoundInstance();
            } else {
                z6 = true;
            }
        } else if (i2 != 0) {
            throw NotFoundException.getNotFoundInstance();
        } else {
            if (z4) {
                if (!z3) {
                    throw NotFoundException.getNotFoundInstance();
                }
                if (count < count2) {
                    z5 = true;
                    z2 = true;
                } else {
                    z = true;
                    z6 = true;
                }
            } else if (z3) {
                throw NotFoundException.getNotFoundInstance();
            }
        }
        if (z5) {
            if (z) {
                throw NotFoundException.getNotFoundInstance();
            }
            increment(getOddCounts(), getOddRoundingErrors());
        }
        if (z) {
            decrement(getOddCounts(), getOddRoundingErrors());
        }
        if (z6) {
            if (z2) {
                throw NotFoundException.getNotFoundInstance();
            }
            increment(getEvenCounts(), getOddRoundingErrors());
        }
        if (z2) {
            decrement(getEvenCounts(), getEvenRoundingErrors());
        }
    }

    private boolean checkChecksum() {
        boolean z = false;
        ExpandedPair expandedPair = this.pairs.get(0);
        DataCharacter leftChar = expandedPair.getLeftChar();
        int checksumPortion = expandedPair.getRightChar().getChecksumPortion();
        int i = 2;
        for (int i2 = 1; i2 < this.pairs.size(); i2++) {
            ExpandedPair expandedPair2 = this.pairs.get(i2);
            int checksumPortion2 = checksumPortion + expandedPair2.getLeftChar().getChecksumPortion();
            int i3 = i + 1;
            DataCharacter rightChar = expandedPair2.getRightChar();
            checksumPortion = checksumPortion2;
            i = i3;
            if (rightChar != null) {
                checksumPortion = checksumPortion2 + rightChar.getChecksumPortion();
                i = i3 + 1;
            }
        }
        if (((i - 4) * 211) + (checksumPortion % 211) == leftChar.getValue()) {
            z = true;
        }
        return z;
    }

    private boolean checkPairSequence(List<ExpandedPair> list, FinderPattern finderPattern) throws NotFoundException {
        int[][] iArr;
        boolean z;
        int size = list.size() + 1;
        if (size > this.currentSequence.length) {
            throw NotFoundException.getNotFoundInstance();
        }
        for (int i = 0; i < list.size(); i++) {
            this.currentSequence[i] = list.get(i).getFinderPattern().getValue();
        }
        this.currentSequence[size - 1] = finderPattern.getValue();
        for (int[] iArr2 : FINDER_PATTERN_SEQUENCES) {
            if (iArr2.length >= size) {
                int i2 = 0;
                while (true) {
                    z = true;
                    if (i2 >= size) {
                        break;
                    } else if (this.currentSequence[i2] != iArr2[i2]) {
                        z = false;
                        break;
                    } else {
                        i2++;
                    }
                }
                if (z) {
                    return size == iArr2.length;
                }
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static Result constructResult(List<ExpandedPair> list) throws NotFoundException {
        String parseInformation = AbstractExpandedDecoder.createDecoder(BitArrayBuilder.buildBitArray(list)).parseInformation();
        ResultPoint[] resultPoints = list.get(0).getFinderPattern().getResultPoints();
        ResultPoint[] resultPoints2 = list.get(list.size() - 1).getFinderPattern().getResultPoints();
        return new Result(parseInformation, null, new ResultPoint[]{resultPoints[0], resultPoints[1], resultPoints2[0], resultPoints2[1]}, BarcodeFormat.RSS_EXPANDED);
    }

    private void findNextPair(BitArray bitArray, List<ExpandedPair> list, int i) throws NotFoundException {
        int[] decodeFinderCounters = getDecodeFinderCounters();
        decodeFinderCounters[0] = 0;
        decodeFinderCounters[1] = 0;
        decodeFinderCounters[2] = 0;
        decodeFinderCounters[3] = 0;
        int size = bitArray.getSize();
        if (i < 0) {
            i = list.isEmpty() ? 0 : list.get(list.size() - 1).getFinderPattern().getStartEnd()[1];
        }
        boolean z = list.size() % 2 != 0;
        boolean z2 = false;
        while (i < size) {
            z2 = !bitArray.get(i);
            if (!z2) {
                break;
            }
            i++;
        }
        int i2 = i;
        boolean z3 = z2;
        int i3 = 0;
        for (int i4 = i; i4 < size; i4++) {
            if (bitArray.get(i4) ^ z3) {
                decodeFinderCounters[i3] = decodeFinderCounters[i3] + 1;
            } else {
                if (i3 == 3) {
                    if (z) {
                        reverseCounters(decodeFinderCounters);
                    }
                    if (isFinderPattern(decodeFinderCounters)) {
                        this.startEnd[0] = i2;
                        this.startEnd[1] = i4;
                        return;
                    }
                    if (z) {
                        reverseCounters(decodeFinderCounters);
                    }
                    i2 += decodeFinderCounters[0] + decodeFinderCounters[1];
                    decodeFinderCounters[0] = decodeFinderCounters[2];
                    decodeFinderCounters[1] = decodeFinderCounters[3];
                    decodeFinderCounters[2] = 0;
                    decodeFinderCounters[3] = 0;
                    i3--;
                } else {
                    i3++;
                }
                decodeFinderCounters[i3] = 1;
                z3 = !z3;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    private static int getNextSecondBar(BitArray bitArray, int i) {
        return bitArray.get(i) ? bitArray.getNextSet(bitArray.getNextUnset(i)) : bitArray.getNextUnset(bitArray.getNextSet(i));
    }

    private static boolean isNotA1left(FinderPattern finderPattern, boolean z, boolean z2) {
        return finderPattern.getValue() != 0 || !z || !z2;
    }

    private FinderPattern parseFoundFinderPattern(BitArray bitArray, int i, boolean z) {
        int i2;
        int nextUnset;
        int i3;
        FinderPattern finderPattern;
        if (z) {
            int i4 = this.startEnd[0] - 1;
            while (i4 >= 0 && !bitArray.get(i4)) {
                i4--;
            }
            i2 = i4 + 1;
            i3 = this.startEnd[0] - i2;
            nextUnset = this.startEnd[1];
        } else {
            i2 = this.startEnd[0];
            nextUnset = bitArray.getNextUnset(this.startEnd[1] + 1);
            i3 = nextUnset - this.startEnd[1];
        }
        int[] decodeFinderCounters = getDecodeFinderCounters();
        System.arraycopy(decodeFinderCounters, 0, decodeFinderCounters, 1, decodeFinderCounters.length - 1);
        decodeFinderCounters[0] = i3;
        try {
            finderPattern = new FinderPattern(parseFinderValue(decodeFinderCounters, FINDER_PATTERNS), new int[]{i2, nextUnset}, i2, nextUnset, i);
        } catch (NotFoundException e) {
            finderPattern = null;
        }
        return finderPattern;
    }

    private static void reverseCounters(int[] iArr) {
        int length = iArr.length;
        for (int i = 0; i < length / 2; i++) {
            int i2 = iArr[i];
            iArr[i] = iArr[(length - i) - 1];
            iArr[(length - i) - 1] = i2;
        }
    }

    DataCharacter decodeDataCharacter(BitArray bitArray, FinderPattern finderPattern, boolean z, boolean z2) throws NotFoundException {
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
        if (z2) {
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
        float count = count(dataCharacterCounters) / 17;
        int[] oddCounts = getOddCounts();
        int[] evenCounts = getEvenCounts();
        float[] oddRoundingErrors = getOddRoundingErrors();
        float[] evenRoundingErrors = getEvenRoundingErrors();
        for (int i4 = 0; i4 < dataCharacterCounters.length; i4++) {
            float f = (1.0f * dataCharacterCounters[i4]) / count;
            int i5 = (int) (0.5f + f);
            if (i5 < 1) {
                i = 1;
            } else {
                i = i5;
                if (i5 > 8) {
                    i = 8;
                }
            }
            int i6 = i4 >> 1;
            if ((i4 & 1) == 0) {
                oddCounts[i6] = i;
                oddRoundingErrors[i6] = f - i;
            } else {
                evenCounts[i6] = i;
                evenRoundingErrors[i6] = f - i;
            }
        }
        adjustOddEvenCounts(17);
        int value = ((z2 ? 0 : 1) + ((finderPattern.getValue() * 4) + (z ? 0 : 2))) - 1;
        int i7 = 0;
        int i8 = 0;
        int length2 = oddCounts.length - 1;
        while (length2 >= 0) {
            int i9 = i8;
            if (isNotA1left(finderPattern, z, z2)) {
                i9 = i8 + (oddCounts[length2] * WEIGHTS[value][length2 * 2]);
            }
            i7 += oddCounts[length2];
            length2--;
            i8 = i9;
        }
        int i10 = 0;
        int i11 = 0;
        int length3 = evenCounts.length - 1;
        while (length3 >= 0) {
            int i12 = i10;
            if (isNotA1left(finderPattern, z, z2)) {
                i12 = i10 + (evenCounts[length3] * WEIGHTS[value][(length3 * 2) + 1]);
            }
            i11 += evenCounts[length3];
            length3--;
            i10 = i12;
        }
        if ((i7 & 1) != 0 || i7 > 13 || i7 < 4) {
            throw NotFoundException.getNotFoundInstance();
        }
        int i13 = (13 - i7) / 2;
        int i14 = SYMBOL_WIDEST[i13];
        return new DataCharacter((RSSUtils.getRSSvalue(oddCounts, i14, true) * EVEN_TOTAL_SUBSET[i13]) + RSSUtils.getRSSvalue(evenCounts, 9 - i14, false) + GSUM[i13], i8 + i10);
    }

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException {
        reset();
        decodeRow2pairs(i, bitArray);
        return constructResult(this.pairs);
    }

    List<ExpandedPair> decodeRow2pairs(int i, BitArray bitArray) throws NotFoundException {
        while (true) {
            ExpandedPair retrieveNextPair = retrieveNextPair(bitArray, this.pairs, i);
            this.pairs.add(retrieveNextPair);
            if (retrieveNextPair.mayBeLast()) {
                if (checkChecksum()) {
                    return this.pairs;
                }
                if (retrieveNextPair.mustBeLast()) {
                    throw NotFoundException.getNotFoundInstance();
                }
            }
        }
    }

    @Override // com.google.zxing.oned.OneDReader, com.google.zxing.Reader
    public void reset() {
        this.pairs.clear();
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x0083 -> B:13:0x0063). Please submit an issue!!! */
    ExpandedPair retrieveNextPair(BitArray bitArray, List<ExpandedPair> list, int i) throws NotFoundException {
        FinderPattern parseFoundFinderPattern;
        boolean z;
        DataCharacter dataCharacter;
        boolean z2 = list.size() % 2 == 0;
        boolean z3 = true;
        int i2 = -1;
        do {
            findNextPair(bitArray, list, i2);
            parseFoundFinderPattern = parseFoundFinderPattern(bitArray, i, z2);
            if (parseFoundFinderPattern == null) {
                i2 = getNextSecondBar(bitArray, this.startEnd[0]);
                z = z3;
            } else {
                z = false;
            }
            z3 = z;
        } while (z);
        boolean checkPairSequence = checkPairSequence(list, parseFoundFinderPattern);
        DataCharacter decodeDataCharacter = decodeDataCharacter(bitArray, parseFoundFinderPattern, z2, true);
        try {
            dataCharacter = decodeDataCharacter(bitArray, parseFoundFinderPattern, z2, false);
        } catch (NotFoundException e) {
            if (!checkPairSequence) {
                throw e;
            }
            dataCharacter = null;
        }
        return new ExpandedPair(decodeDataCharacter, dataCharacter, parseFoundFinderPattern, checkPairSequence);
    }
}
