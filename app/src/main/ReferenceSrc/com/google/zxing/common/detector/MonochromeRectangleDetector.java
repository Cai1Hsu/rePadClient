package com.google.zxing.common.detector;

import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class MonochromeRectangleDetector {
    private static final int MAX_MODULES = 32;
    private final BitMatrix image;

    public MonochromeRectangleDetector(BitMatrix image) {
        this.image = image;
    }

    public ResultPoint[] detect() throws NotFoundException {
        int height = this.image.getHeight();
        int width = this.image.getWidth();
        int halfHeight = height >> 1;
        int halfWidth = width >> 1;
        int deltaY = Math.max(1, height / 256);
        int deltaX = Math.max(1, width / 256);
        ResultPoint pointA = findCornerFromCenter(halfWidth, 0, 0, width, halfHeight, -deltaY, 0, height, halfWidth >> 1);
        int top = ((int) pointA.getY()) - 1;
        ResultPoint pointB = findCornerFromCenter(halfWidth, -deltaX, 0, width, halfHeight, 0, top, height, halfHeight >> 1);
        int left = ((int) pointB.getX()) - 1;
        ResultPoint pointC = findCornerFromCenter(halfWidth, deltaX, left, width, halfHeight, 0, top, height, halfHeight >> 1);
        int right = ((int) pointC.getX()) + 1;
        ResultPoint pointD = findCornerFromCenter(halfWidth, 0, left, right, halfHeight, deltaY, top, height, halfWidth >> 1);
        int bottom = ((int) pointD.getY()) + 1;
        ResultPoint pointA2 = findCornerFromCenter(halfWidth, 0, left, right, halfHeight, -deltaY, top, bottom, halfWidth >> 2);
        return new ResultPoint[]{pointA2, pointB, pointC, pointD};
    }

    private ResultPoint findCornerFromCenter(int centerX, int deltaX, int left, int right, int centerY, int deltaY, int top, int bottom, int maxWhiteRun) throws NotFoundException {
        int[] range;
        int[] lastRange = null;
        int y = centerY;
        int x = centerX;
        while (y < bottom && y >= top && x < right && x >= left) {
            if (deltaX == 0) {
                range = blackWhiteRange(y, maxWhiteRun, left, right, true);
            } else {
                range = blackWhiteRange(x, maxWhiteRun, top, bottom, false);
            }
            if (range == null) {
                if (lastRange == null) {
                    throw NotFoundException.getNotFoundInstance();
                }
                if (deltaX == 0) {
                    int lastY = y - deltaY;
                    if (lastRange[0] < centerX) {
                        if (lastRange[1] > centerX) {
                            return new ResultPoint(deltaY > 0 ? lastRange[0] : lastRange[1], lastY);
                        }
                        return new ResultPoint(lastRange[0], lastY);
                    }
                    return new ResultPoint(lastRange[1], lastY);
                }
                int lastX = x - deltaX;
                if (lastRange[0] < centerY) {
                    if (lastRange[1] > centerY) {
                        return new ResultPoint(lastX, deltaX < 0 ? lastRange[0] : lastRange[1]);
                    }
                    return new ResultPoint(lastX, lastRange[0]);
                }
                return new ResultPoint(lastX, lastRange[1]);
            }
            lastRange = range;
            y += deltaY;
            x += deltaX;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x002b A[EDGE_INSN: B:59:0x002b->B:16:0x002b ?: BREAK  , SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0064 A[EDGE_INSN: B:76:0x0064->B:36:0x0064 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int[] blackWhiteRange(int fixedDimension, int maxWhiteRun, int minDim, int maxDim, boolean horizontal) {
        int center = (minDim + maxDim) >> 1;
        int start = center;
        while (start >= minDim) {
            if (horizontal) {
                if (this.image.get(start, fixedDimension)) {
                    start--;
                } else {
                    int whiteRunStart = start;
                    while (true) {
                        start--;
                        if (start < minDim) {
                            break;
                        } else if (horizontal) {
                            if (this.image.get(start, fixedDimension)) {
                                break;
                            }
                        } else if (this.image.get(fixedDimension, start)) {
                            break;
                        }
                    }
                    int whiteRunSize = whiteRunStart - start;
                    if (start >= minDim || whiteRunSize > maxWhiteRun) {
                        start = whiteRunStart;
                        break;
                    }
                }
            } else if (this.image.get(fixedDimension, start)) {
                start--;
            } else {
                int whiteRunStart2 = start;
                while (true) {
                    start--;
                    if (start < minDim) {
                    }
                }
                int whiteRunSize2 = whiteRunStart2 - start;
                if (start >= minDim) {
                }
                start = whiteRunStart2;
                break;
            }
        }
        int start2 = start + 1;
        int end = center;
        while (end < maxDim) {
            if (horizontal) {
                if (this.image.get(end, fixedDimension)) {
                    end++;
                } else {
                    int whiteRunStart3 = end;
                    while (true) {
                        end++;
                        if (end >= maxDim) {
                            break;
                        } else if (horizontal) {
                            if (this.image.get(end, fixedDimension)) {
                                break;
                            }
                        } else if (this.image.get(fixedDimension, end)) {
                            break;
                        }
                    }
                    int whiteRunSize3 = end - whiteRunStart3;
                    if (end < maxDim || whiteRunSize3 > maxWhiteRun) {
                        end = whiteRunStart3;
                        break;
                    }
                }
            } else if (this.image.get(fixedDimension, end)) {
                end++;
            } else {
                int whiteRunStart32 = end;
                while (true) {
                    end++;
                    if (end >= maxDim) {
                    }
                }
                int whiteRunSize32 = end - whiteRunStart32;
                if (end < maxDim) {
                }
                end = whiteRunStart32;
                break;
            }
        }
        int end2 = end - 1;
        if (end2 > start2) {
            return new int[]{start2, end2};
        }
        return null;
    }
}
