package com.google.zxing;

import com.google.zxing.aztec.AztecReader;
import com.google.zxing.datamatrix.DataMatrixReader;
import com.google.zxing.maxicode.MaxiCodeReader;
import com.google.zxing.oned.MultiFormatOneDReader;
import com.google.zxing.pdf417.PDF417Reader;
import com.google.zxing.qrcode.QRCodeReader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/MultiFormatReader.class */
public final class MultiFormatReader implements Reader {
    private Map<DecodeHintType, ?> hints;
    private Reader[] readers;

    private Result decodeInternal(BinaryBitmap binaryBitmap) throws NotFoundException {
        if (this.readers != null) {
            for (Reader reader : this.readers) {
                try {
                    return reader.decode(binaryBitmap, this.hints);
                } catch (ReaderException e) {
                }
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap binaryBitmap) throws NotFoundException {
        setHints(null);
        return decodeInternal(binaryBitmap);
    }

    @Override // com.google.zxing.Reader
    public Result decode(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException {
        setHints(map);
        return decodeInternal(binaryBitmap);
    }

    public Result decodeWithState(BinaryBitmap binaryBitmap) throws NotFoundException {
        if (this.readers == null) {
            setHints(null);
        }
        return decodeInternal(binaryBitmap);
    }

    @Override // com.google.zxing.Reader
    public void reset() {
        if (this.readers != null) {
            for (Reader reader : this.readers) {
                reader.reset();
            }
        }
    }

    public void setHints(Map<DecodeHintType, ?> map) {
        boolean z = false;
        this.hints = map;
        boolean z2 = map != null && map.containsKey(DecodeHintType.TRY_HARDER);
        Collection collection = map == null ? null : (Collection) map.get(DecodeHintType.POSSIBLE_FORMATS);
        ArrayList arrayList = new ArrayList();
        if (collection != null) {
            if (collection.contains(BarcodeFormat.UPC_A) || collection.contains(BarcodeFormat.UPC_E) || collection.contains(BarcodeFormat.EAN_13) || collection.contains(BarcodeFormat.EAN_8) || collection.contains(BarcodeFormat.CODE_39) || collection.contains(BarcodeFormat.CODE_93) || collection.contains(BarcodeFormat.CODE_128) || collection.contains(BarcodeFormat.ITF) || collection.contains(BarcodeFormat.RSS_14) || collection.contains(BarcodeFormat.RSS_EXPANDED)) {
                z = true;
            }
            if (z && !z2) {
                arrayList.add(new MultiFormatOneDReader(map));
            }
            if (collection.contains(BarcodeFormat.QR_CODE)) {
                arrayList.add(new QRCodeReader());
            }
            if (collection.contains(BarcodeFormat.DATA_MATRIX)) {
                arrayList.add(new DataMatrixReader());
            }
            if (collection.contains(BarcodeFormat.AZTEC)) {
                arrayList.add(new AztecReader());
            }
            if (collection.contains(BarcodeFormat.PDF_417)) {
                arrayList.add(new PDF417Reader());
            }
            if (collection.contains(BarcodeFormat.MAXICODE)) {
                arrayList.add(new MaxiCodeReader());
            }
            if (z && z2) {
                arrayList.add(new MultiFormatOneDReader(map));
            }
        }
        if (arrayList.isEmpty()) {
            if (!z2) {
                arrayList.add(new MultiFormatOneDReader(map));
            }
            arrayList.add(new QRCodeReader());
            arrayList.add(new DataMatrixReader());
            arrayList.add(new AztecReader());
            arrayList.add(new PDF417Reader());
            arrayList.add(new MaxiCodeReader());
            if (z2) {
                arrayList.add(new MultiFormatOneDReader(map));
            }
        }
        this.readers = (Reader[]) arrayList.toArray(new Reader[arrayList.size()]);
    }
}
