package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;

/* loaded from: classes.jar:com/google/zxing/common/detector/MonochromeRectangleDetector.class */
public final class MonochromeRectangleDetector {
    private static final int MAX_MODULES = 32;
    private final BitMatrix image;

    public MonochromeRectangleDetector(BitMatrix bitMatrix) {
        this.image = bitMatrix;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x007b A[EDGE_INSN: B:60:0x007b->B:23:0x007b ?: BREAK  , SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0068 A[EDGE_INSN: B:68:0x0068->B:19:0x0068 ?: BREAK  , SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0107 A[EDGE_INSN: B:80:0x0107->B:47:0x0107 ?: BREAK  , SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x00f4 A[EDGE_INSN: B:86:0x00f4->B:43:0x00f4 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int[] blackWhiteRange(int i, int i2, int i3, int i4, boolean z) {
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        int i13 = (i3 + i4) >> 1;
        int i14 = i13;
        while (true) {
            i5 = i14;
            i6 = i5;
            if (i5 < i3) {
                break;
            } else if (z) {
                if (!this.image.get(i5, i)) {
                    i11 = i5;
                    while (true) {
                        i12 = i11 - 1;
                        if (i12 < i3) {
                            break;
                        } else if (z) {
                            i11 = i12;
                            if (this.image.get(i12, i)) {
                                break;
                            }
                        } else {
                            i11 = i12;
                            if (this.image.get(i, i12)) {
                                break;
                            }
                        }
                    }
                    if (i12 >= i3) {
                        break;
                    }
                    i14 = i12;
                    if (i5 - i12 > i2) {
                        break;
                    }
                } else {
                    i14 = i5 - 1;
                }
            } else if (!this.image.get(i, i5)) {
                i11 = i5;
                while (true) {
                    i12 = i11 - 1;
                    if (i12 < i3) {
                    }
                }
                if (i12 >= i3) {
                }
            } else {
                i14 = i5 - 1;
            }
        }
        i6 = i5;
        int i15 = i6 + 1;
        int i16 = i13;
        while (true) {
            i7 = i16;
            i8 = i7;
            if (i7 >= i4) {
                break;
            } else if (z) {
                if (!this.image.get(i7, i)) {
                    i9 = i7;
                    while (true) {
                        i10 = i9 + 1;
                        if (i10 >= i4) {
                            break;
                        } else if (z) {
                            i9 = i10;
                            if (this.image.get(i10, i)) {
                                break;
                            }
                        } else {
                            i9 = i10;
                            if (this.image.get(i, i10)) {
                                break;
                            }
                        }
                    }
                    if (i10 < i4) {
                        break;
                    }
                    i16 = i10;
                    if (i10 - i7 > i2) {
                        break;
                    }
                } else {
                    i16 = i7 + 1;
                }
            } else if (!this.image.get(i, i7)) {
                i9 = i7;
                while (true) {
                    i10 = i9 + 1;
                    if (i10 >= i4) {
                    }
                }
                if (i10 < i4) {
                }
            } else {
                i16 = i7 + 1;
            }
        }
        i8 = i7;
        int i17 = i8 - 1;
        return i17 > i15 ? new int[]{i15, i17} : null;
    }

    private ResultPoint findCornerFromCenter(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9) throws NotFoundException {
        ResultPoint resultPoint;
        int[] iArr = null;
        int i10 = i5;
        int i11 = i;
        while (i10 < i8 && i10 >= i7 && i11 < i4 && i11 >= i3) {
            int[] blackWhiteRange = i2 == 0 ? blackWhiteRange(i10, i9, i3, i4, true) : blackWhiteRange(i11, i9, i7, i8, false);
            if (blackWhiteRange == null) {
                if (iArr == null) {
                    throw NotFoundException.getNotFoundInstance();
                }
                if (i2 == 0) {
                    int i12 = i10 - i6;
                    if (iArr[0] >= i) {
                        resultPoint = new ResultPoint(iArr[1], i12);
                    } else if (iArr[1] > i) {
                        resultPoint = new ResultPoint(i6 > 0 ? iArr[0] : iArr[1], i12);
                    } else {
                        resultPoint = new ResultPoint(iArr[0], i12);
                    }
                } else {
                    int i13 = i11 - i2;
                    if (iArr[0] >= i5) {
                        resultPoint = new ResultPoint(i13, iArr[1]);
                    } else if (iArr[1] > i5) {
                        resultPoint = new ResultPoint(i13, i2 < 0 ? iArr[0] : iArr[1]);
                    } else {
                        resultPoint = new ResultPoint(i13, iArr[0]);
                    }
                }
                return resultPoint;
            }
            i10 += i6;
            i11 += i2;
            iArr = blackWhiteRange;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    public ResultPoint[] detect() throws NotFoundException {
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        int i = height >> 1;
        int i2 = width >> 1;
        int max = Math.max(1, height / 256);
        int max2 = Math.max(1, width / 256);
        int y = ((int) findCornerFromCenter(i2, 0, 0, width, i, -max, 0, height, i2 >> 1).getY()) - 1;
        ResultPoint findCornerFromCenter = findCornerFromCenter(i2, -max2, 0, width, i, 0, y, height, i >> 1);
        int x = ((int) findCornerFromCenter.getX()) - 1;
        ResultPoint findCornerFromCenter2 = findCornerFromCenter(i2, max2, x, width, i, 0, y, height, i >> 1);
        int x2 = ((int) findCornerFromCenter2.getX()) + 1;
        ResultPoint findCornerFromCenter3 = findCornerFromCenter(i2, 0, x, x2, i, max, y, height, i2 >> 1);
        return new ResultPoint[]{findCornerFromCenter(i2, 0, x, x2, i, -max, y, ((int) findCornerFromCenter3.getY()) + 1, i2 >> 2), findCornerFromCenter, findCornerFromCenter2, findCornerFromCenter3};
    }
}
