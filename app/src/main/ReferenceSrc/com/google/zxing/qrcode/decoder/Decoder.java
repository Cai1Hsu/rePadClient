package com.google.zxing.qrcode.decoder;

import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DecoderResult;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonDecoder;
import com.google.zxing.common.reedsolomon.ReedSolomonException;
import java.util.Map;
import org.bson.BSON;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class Decoder {
    private final ReedSolomonDecoder rsDecoder = new ReedSolomonDecoder(GenericGF.QR_CODE_FIELD_256);

    public DecoderResult decode(boolean[][] image) throws ChecksumException, FormatException {
        return decode(image, (Map<DecodeHintType, ?>) null);
    }

    public DecoderResult decode(boolean[][] image, Map<DecodeHintType, ?> hints) throws ChecksumException, FormatException {
        int dimension = image.length;
        BitMatrix bits = new BitMatrix(dimension);
        for (int i = 0; i < dimension; i++) {
            for (int j = 0; j < dimension; j++) {
                if (image[i][j]) {
                    bits.set(j, i);
                }
            }
        }
        return decode(bits, hints);
    }

    public DecoderResult decode(BitMatrix bits) throws ChecksumException, FormatException {
        return decode(bits, (Map<DecodeHintType, ?>) null);
    }

    public DecoderResult decode(BitMatrix bits, Map<DecodeHintType, ?> hints) throws FormatException, ChecksumException {
        BitMatrixParser parser = new BitMatrixParser(bits);
        Version version = parser.readVersion();
        ErrorCorrectionLevel ecLevel = parser.readFormatInformation().getErrorCorrectionLevel();
        byte[] codewords = parser.readCodewords();
        DataBlock[] dataBlocks = DataBlock.getDataBlocks(codewords, version, ecLevel);
        int totalBytes = 0;
        for (DataBlock dataBlock : dataBlocks) {
            totalBytes += dataBlock.getNumDataCodewords();
        }
        byte[] resultBytes = new byte[totalBytes];
        int resultOffset = 0;
        int len$ = dataBlocks.length;
        int i$ = 0;
        while (i$ < len$) {
            DataBlock dataBlock2 = dataBlocks[i$];
            byte[] codewordBytes = dataBlock2.getCodewords();
            int numDataCodewords = dataBlock2.getNumDataCodewords();
            correctErrors(codewordBytes, numDataCodewords);
            int i = 0;
            int resultOffset2 = resultOffset;
            while (i < numDataCodewords) {
                resultBytes[resultOffset2] = codewordBytes[i];
                i++;
                resultOffset2++;
            }
            i$++;
            resultOffset = resultOffset2;
        }
        return DecodedBitStreamParser.decode(resultBytes, version, ecLevel, hints);
    }

    private void correctErrors(byte[] codewordBytes, int numDataCodewords) throws ChecksumException {
        int numCodewords = codewordBytes.length;
        int[] codewordsInts = new int[numCodewords];
        for (int i = 0; i < numCodewords; i++) {
            codewordsInts[i] = codewordBytes[i] & BSON.MINKEY;
        }
        int numECCodewords = codewordBytes.length - numDataCodewords;
        try {
            this.rsDecoder.decode(codewordsInts, numECCodewords);
            for (int i2 = 0; i2 < numDataCodewords; i2++) {
                codewordBytes[i2] = (byte) codewordsInts[i2];
            }
        } catch (ReedSolomonException e) {
            throw ChecksumException.getChecksumInstance();
        }
    }
}
