package com.google.zxing.qrcode.encoder;

/* loaded from: classes.jar:com/google/zxing/qrcode/encoder/MaskUtil.class */
final class MaskUtil {
    private MaskUtil() {
    }

    static int applyMaskPenaltyRule1(ByteMatrix byteMatrix) {
        return applyMaskPenaltyRule1Internal(byteMatrix, true) + applyMaskPenaltyRule1Internal(byteMatrix, false);
    }

    private static int applyMaskPenaltyRule1Internal(ByteMatrix byteMatrix, boolean z) {
        byte b;
        int i;
        int i2;
        int i3 = 0;
        byte b2 = -1;
        int height = z ? byteMatrix.getHeight() : byteMatrix.getWidth();
        int width = z ? byteMatrix.getWidth() : byteMatrix.getHeight();
        byte[][] array = byteMatrix.getArray();
        int i4 = 0;
        while (true) {
            int i5 = 0;
            if (i4 < height) {
                int i6 = 0;
                while (i6 < width) {
                    byte b3 = z ? array[i4][i6] : array[i6][i4];
                    if (b3 == b2) {
                        int i7 = i5 + 1;
                        if (i7 == 5) {
                            i2 = i3 + 3;
                            b = b2;
                            i = i7;
                        } else {
                            i = i7;
                            i2 = i3;
                            b = b2;
                            if (i7 > 5) {
                                i2 = i3 + 1;
                                i = i7;
                                b = b2;
                            }
                        }
                    } else {
                        b = b3;
                        i = 1;
                        i2 = i3;
                    }
                    i6++;
                    i5 = i;
                    i3 = i2;
                    b2 = b;
                }
                i4++;
            } else {
                return i3;
            }
        }
    }

    static int applyMaskPenaltyRule2(ByteMatrix byteMatrix) {
        int i = 0;
        byte[][] array = byteMatrix.getArray();
        int width = byteMatrix.getWidth();
        int height = byteMatrix.getHeight();
        for (int i2 = 0; i2 < height - 1; i2++) {
            int i3 = 0;
            while (i3 < width - 1) {
                byte b = array[i2][i3];
                int i4 = i;
                if (b == array[i2][i3 + 1]) {
                    i4 = i;
                    if (b == array[i2 + 1][i3]) {
                        i4 = i;
                        if (b == array[i2 + 1][i3 + 1]) {
                            i4 = i + 3;
                        }
                    }
                }
                i3++;
                i = i4;
            }
        }
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x011e, code lost:
        if (r0[r9][r10 - 4] == 0) goto L44;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    static int applyMaskPenaltyRule3(ByteMatrix byteMatrix) {
        int i = 0;
        byte[][] array = byteMatrix.getArray();
        int width = byteMatrix.getWidth();
        int height = byteMatrix.getHeight();
        int i2 = 0;
        while (i2 < height) {
            int i3 = 0;
            while (i3 < width) {
                int i4 = i;
                if (i3 + 6 < width) {
                    i4 = i;
                    if (array[i2][i3] == 1) {
                        i4 = i;
                        if (array[i2][i3 + 1] == 0) {
                            i4 = i;
                            if (array[i2][i3 + 2] == 1) {
                                i4 = i;
                                if (array[i2][i3 + 3] == 1) {
                                    i4 = i;
                                    if (array[i2][i3 + 4] == 1) {
                                        i4 = i;
                                        if (array[i2][i3 + 5] == 0) {
                                            i4 = i;
                                            if (array[i2][i3 + 6] == 1) {
                                                if (i3 + 10 >= width || array[i2][i3 + 7] != 0 || array[i2][i3 + 8] != 0 || array[i2][i3 + 9] != 0 || array[i2][i3 + 10] != 0) {
                                                    i4 = i;
                                                    if (i3 - 4 >= 0) {
                                                        i4 = i;
                                                        if (array[i2][i3 - 1] == 0) {
                                                            i4 = i;
                                                            if (array[i2][i3 - 2] == 0) {
                                                                i4 = i;
                                                                if (array[i2][i3 - 3] == 0) {
                                                                    i4 = i;
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                i4 = i + 40;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                i = i4;
                if (i2 + 6 < height) {
                    i = i4;
                    if (array[i2][i3] == 1) {
                        i = i4;
                        if (array[i2 + 1][i3] == 0) {
                            i = i4;
                            if (array[i2 + 2][i3] == 1) {
                                i = i4;
                                if (array[i2 + 3][i3] == 1) {
                                    i = i4;
                                    if (array[i2 + 4][i3] == 1) {
                                        i = i4;
                                        if (array[i2 + 5][i3] == 0) {
                                            i = i4;
                                            if (array[i2 + 6][i3] == 1) {
                                                if (i2 + 10 >= height || array[i2 + 7][i3] != 0 || array[i2 + 8][i3] != 0 || array[i2 + 9][i3] != 0 || array[i2 + 10][i3] != 0) {
                                                    i = i4;
                                                    if (i2 - 4 >= 0) {
                                                        i = i4;
                                                        if (array[i2 - 1][i3] == 0) {
                                                            i = i4;
                                                            if (array[i2 - 2][i3] == 0) {
                                                                i = i4;
                                                                if (array[i2 - 3][i3] == 0) {
                                                                    i = i4;
                                                                    if (array[i2 - 4][i3] != 0) {
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                i = i4 + 40;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                i3++;
            }
            i2++;
        }
        return i;
    }

    static int applyMaskPenaltyRule4(ByteMatrix byteMatrix) {
        int i = 0;
        byte[][] array = byteMatrix.getArray();
        int width = byteMatrix.getWidth();
        int height = byteMatrix.getHeight();
        for (int i2 = 0; i2 < height; i2++) {
            int i3 = 0;
            while (i3 < width) {
                int i4 = i;
                if (array[i2][i3] == 1) {
                    i4 = i + 1;
                }
                i3++;
                i = i4;
            }
        }
        return (Math.abs((int) ((100.0d * (i / (byteMatrix.getHeight() * byteMatrix.getWidth()))) - 50.0d)) / 5) * 10;
    }

    static boolean getDataMaskBit(int i, int i2, int i3) {
        int i4;
        if (!QRCode.isValidMaskPattern(i)) {
            throw new IllegalArgumentException("Invalid mask pattern");
        }
        switch (i) {
            case 0:
                i4 = (i3 + i2) & 1;
                break;
            case 1:
                i4 = i3 & 1;
                break;
            case 2:
                i4 = i2 % 3;
                break;
            case 3:
                i4 = (i3 + i2) % 3;
                break;
            case 4:
                i4 = ((i3 >>> 1) + (i2 / 3)) & 1;
                break;
            case 5:
                int i5 = i3 * i2;
                i4 = (i5 & 1) + (i5 % 3);
                break;
            case 6:
                int i6 = i3 * i2;
                i4 = ((i6 & 1) + (i6 % 3)) & 1;
                break;
            case 7:
                i4 = (((i3 * i2) % 3) + ((i3 + i2) & 1)) & 1;
                break;
            default:
                throw new IllegalArgumentException("Invalid mask pattern: " + i);
        }
        return i4 == 0;
    }
}
