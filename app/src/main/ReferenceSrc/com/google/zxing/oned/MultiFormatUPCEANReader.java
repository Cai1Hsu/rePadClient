package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.common.BitArray;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class MultiFormatUPCEANReader extends OneDReader {
    private final UPCEANReader[] readers;

    public MultiFormatUPCEANReader(Map<DecodeHintType, ?> hints) {
        Collection<BarcodeFormat> possibleFormats = hints == null ? null : (Collection) hints.get(DecodeHintType.POSSIBLE_FORMATS);
        Collection<UPCEANReader> readers = new ArrayList<>();
        if (possibleFormats != null) {
            if (possibleFormats.contains(BarcodeFormat.EAN_13)) {
                readers.add(new EAN13Reader());
            } else if (possibleFormats.contains(BarcodeFormat.UPC_A)) {
                readers.add(new UPCAReader());
            }
            if (possibleFormats.contains(BarcodeFormat.EAN_8)) {
                readers.add(new EAN8Reader());
            }
            if (possibleFormats.contains(BarcodeFormat.UPC_E)) {
                readers.add(new UPCEReader());
            }
        }
        if (readers.isEmpty()) {
            readers.add(new EAN13Reader());
            readers.add(new EAN8Reader());
            readers.add(new UPCEReader());
        }
        this.readers = (UPCEANReader[]) readers.toArray(new UPCEANReader[readers.size()]);
    }

    @Override // com.google.zxing.oned.OneDReader
    public Result decodeRow(int rowNumber, BitArray row, Map<DecodeHintType, ?> hints) throws NotFoundException {
        int[] startGuardPattern = UPCEANReader.findStartGuardPattern(row);
        UPCEANReader[] arr$ = this.readers;
        for (UPCEANReader reader : arr$) {
            try {
                Result result = reader.decodeRow(rowNumber, row, startGuardPattern, hints);
                boolean ean13MayBeUPCA = result.getBarcodeFormat() == BarcodeFormat.EAN_13 && result.getText().charAt(0) == '0';
                Collection<BarcodeFormat> possibleFormats = hints == null ? null : (Collection) hints.get(DecodeHintType.POSSIBLE_FORMATS);
                boolean canReturnUPCA = possibleFormats == null || possibleFormats.contains(BarcodeFormat.UPC_A);
                if (ean13MayBeUPCA && canReturnUPCA) {
                    return new Result(result.getText().substring(1), null, result.getResultPoints(), BarcodeFormat.UPC_A);
                }
                return result;
            } catch (ReaderException e) {
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    @Override // com.google.zxing.oned.OneDReader, com.google.zxing.Reader
    public void reset() {
        Reader[] arr$ = this.readers;
        for (Reader reader : arr$) {
            reader.reset();
        }
    }
}
