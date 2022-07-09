package com.google.zxing.multi;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.Reader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultPoint;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/multi/GenericMultipleBarcodeReader.class */
public final class GenericMultipleBarcodeReader implements MultipleBarcodeReader {
    private static final int MIN_DIMENSION_TO_RECUR = 100;
    private final Reader delegate;

    public GenericMultipleBarcodeReader(Reader reader) {
        this.delegate = reader;
    }

    private void doDecodeMultiple(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map, List<Result> list, int i, int i2) {
        boolean z;
        try {
            Result decode = this.delegate.decode(binaryBitmap, map);
            Iterator<Result> it = list.iterator();
            while (true) {
                z = false;
                if (it.hasNext()) {
                    if (it.next().getText().equals(decode.getText())) {
                        z = true;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (z) {
                return;
            }
            list.add(translateResultPoints(decode, i, i2));
            ResultPoint[] resultPoints = decode.getResultPoints();
            if (resultPoints == null || resultPoints.length == 0) {
                return;
            }
            int width = binaryBitmap.getWidth();
            int height = binaryBitmap.getHeight();
            float f = width;
            float f2 = height;
            float f3 = 0.0f;
            float f4 = 0.0f;
            int length = resultPoints.length;
            int i3 = 0;
            while (i3 < length) {
                ResultPoint resultPoint = resultPoints[i3];
                float x = resultPoint.getX();
                float y = resultPoint.getY();
                float f5 = f;
                if (x < f) {
                    f5 = x;
                }
                float f6 = f2;
                if (y < f2) {
                    f6 = y;
                }
                float f7 = f3;
                if (x > f3) {
                    f7 = x;
                }
                float f8 = f4;
                if (y > f4) {
                    f8 = y;
                }
                i3++;
                f3 = f7;
                f4 = f8;
                f = f5;
                f2 = f6;
            }
            if (f > 100.0f) {
                doDecodeMultiple(binaryBitmap.crop(0, 0, (int) f, height), map, list, i, i2);
            }
            if (f2 > 100.0f) {
                doDecodeMultiple(binaryBitmap.crop(0, 0, width, (int) f2), map, list, i, i2);
            }
            if (f3 < width - 100) {
                doDecodeMultiple(binaryBitmap.crop((int) f3, 0, width - ((int) f3), height), map, list, i + ((int) f3), i2);
            }
            if (f4 >= height - 100) {
                return;
            }
            doDecodeMultiple(binaryBitmap.crop(0, (int) f4, width, height - ((int) f4)), map, list, i, i2 + ((int) f4));
        } catch (ReaderException e) {
        }
    }

    private static Result translateResultPoints(Result result, int i, int i2) {
        ResultPoint[] resultPoints = result.getResultPoints();
        if (resultPoints != null) {
            ResultPoint[] resultPointArr = new ResultPoint[resultPoints.length];
            for (int i3 = 0; i3 < resultPoints.length; i3++) {
                ResultPoint resultPoint = resultPoints[i3];
                resultPointArr[i3] = new ResultPoint(resultPoint.getX() + i, resultPoint.getY() + i2);
            }
            result = new Result(result.getText(), result.getRawBytes(), resultPointArr, result.getBarcodeFormat());
        }
        return result;
    }

    @Override // com.google.zxing.multi.MultipleBarcodeReader
    public Result[] decodeMultiple(BinaryBitmap binaryBitmap) throws NotFoundException {
        return decodeMultiple(binaryBitmap, null);
    }

    @Override // com.google.zxing.multi.MultipleBarcodeReader
    public Result[] decodeMultiple(BinaryBitmap binaryBitmap, Map<DecodeHintType, ?> map) throws NotFoundException {
        ArrayList arrayList = new ArrayList();
        doDecodeMultiple(binaryBitmap, map, arrayList, 0, 0);
        if (arrayList.isEmpty()) {
            throw NotFoundException.getNotFoundInstance();
        }
        return (Result[]) arrayList.toArray(new Result[arrayList.size()]);
    }
}
