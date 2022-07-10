package com.google.zxing.pdf417.detector;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ResultPoint;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.common.GridSampler;
import java.util.Arrays;
import java.util.Map;
import org.apache.tools.ant.taskdefs.Execute;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class Detector {
    private static final int MAX_AVG_VARIANCE = 107;
    private static final int MAX_INDIVIDUAL_VARIANCE = 204;
    private static final int SKEW_THRESHOLD = 2;
    private static final int[] START_PATTERN = {8, 1, 1, 1, 1, 1, 1, 3};
    private static final int[] START_PATTERN_REVERSE = {3, 1, 1, 1, 1, 1, 1, 8};
    private static final int[] STOP_PATTERN = {7, 1, 1, 3, 1, 1, 1, 2, 1};
    private static final int[] STOP_PATTERN_REVERSE = {1, 2, 1, 1, 1, 3, 1, 1, 7};
    private final BinaryBitmap image;

    public Detector(BinaryBitmap image) {
        this.image = image;
    }

    public DetectorResult detect() throws NotFoundException {
        return detect(null);
    }

    public DetectorResult detect(Map<DecodeHintType, ?> hints) throws NotFoundException {
        BitMatrix matrix = this.image.getBlackMatrix();
        ResultPoint[] vertices = findVertices(matrix);
        if (vertices == null) {
            vertices = findVertices180(matrix);
            if (vertices != null) {
                correctCodeWordVertices(vertices, true);
            }
        } else {
            correctCodeWordVertices(vertices, false);
        }
        if (vertices == null) {
            throw NotFoundException.getNotFoundInstance();
        }
        float moduleWidth = computeModuleWidth(vertices);
        if (moduleWidth < 1.0f) {
            throw NotFoundException.getNotFoundInstance();
        }
        int dimension = computeDimension(vertices[4], vertices[6], vertices[5], vertices[7], moduleWidth);
        if (dimension < 1) {
            throw NotFoundException.getNotFoundInstance();
        }
        BitMatrix bits = sampleGrid(matrix, vertices[4], vertices[5], vertices[6], vertices[7], dimension);
        return new DetectorResult(bits, new ResultPoint[]{vertices[5], vertices[4], vertices[6], vertices[7]});
    }

    private static ResultPoint[] findVertices(BitMatrix matrix) {
        int height = matrix.getHeight();
        int width = matrix.getWidth();
        ResultPoint[] result = new ResultPoint[8];
        boolean found = false;
        int[] counters = new int[START_PATTERN.length];
        int i = 0;
        while (true) {
            if (i >= height) {
                break;
            }
            int[] loc = findGuardPattern(matrix, 0, i, width, false, START_PATTERN, counters);
            if (loc == null) {
                i++;
            } else {
                result[0] = new ResultPoint(loc[0], i);
                result[4] = new ResultPoint(loc[1], i);
                found = true;
                break;
            }
        }
        if (found) {
            found = false;
            int i2 = height - 1;
            while (true) {
                if (i2 <= 0) {
                    break;
                }
                int[] loc2 = findGuardPattern(matrix, 0, i2, width, false, START_PATTERN, counters);
                if (loc2 == null) {
                    i2--;
                } else {
                    result[1] = new ResultPoint(loc2[0], i2);
                    result[5] = new ResultPoint(loc2[1], i2);
                    found = true;
                    break;
                }
            }
        }
        int[] counters2 = new int[STOP_PATTERN.length];
        if (found) {
            found = false;
            int i3 = 0;
            while (true) {
                if (i3 >= height) {
                    break;
                }
                int[] loc3 = findGuardPattern(matrix, 0, i3, width, false, STOP_PATTERN, counters2);
                if (loc3 == null) {
                    i3++;
                } else {
                    result[2] = new ResultPoint(loc3[1], i3);
                    result[6] = new ResultPoint(loc3[0], i3);
                    found = true;
                    break;
                }
            }
        }
        if (found) {
            found = false;
            int i4 = height - 1;
            while (true) {
                if (i4 <= 0) {
                    break;
                }
                int[] loc4 = findGuardPattern(matrix, 0, i4, width, false, STOP_PATTERN, counters2);
                if (loc4 == null) {
                    i4--;
                } else {
                    result[3] = new ResultPoint(loc4[1], i4);
                    result[7] = new ResultPoint(loc4[0], i4);
                    found = true;
                    break;
                }
            }
        }
        if (found) {
            return result;
        }
        return null;
    }

    private static ResultPoint[] findVertices180(BitMatrix matrix) {
        int height = matrix.getHeight();
        int width = matrix.getWidth();
        int halfWidth = width >> 1;
        ResultPoint[] result = new ResultPoint[8];
        boolean found = false;
        int[] counters = new int[START_PATTERN_REVERSE.length];
        int i = height - 1;
        while (true) {
            if (i <= 0) {
                break;
            }
            int[] loc = findGuardPattern(matrix, halfWidth, i, halfWidth, true, START_PATTERN_REVERSE, counters);
            if (loc == null) {
                i--;
            } else {
                result[0] = new ResultPoint(loc[1], i);
                result[4] = new ResultPoint(loc[0], i);
                found = true;
                break;
            }
        }
        if (found) {
            found = false;
            int i2 = 0;
            while (true) {
                if (i2 >= height) {
                    break;
                }
                int[] loc2 = findGuardPattern(matrix, halfWidth, i2, halfWidth, true, START_PATTERN_REVERSE, counters);
                if (loc2 == null) {
                    i2++;
                } else {
                    result[1] = new ResultPoint(loc2[1], i2);
                    result[5] = new ResultPoint(loc2[0], i2);
                    found = true;
                    break;
                }
            }
        }
        int[] counters2 = new int[STOP_PATTERN_REVERSE.length];
        if (found) {
            found = false;
            int i3 = height - 1;
            while (true) {
                if (i3 <= 0) {
                    break;
                }
                int[] loc3 = findGuardPattern(matrix, 0, i3, halfWidth, false, STOP_PATTERN_REVERSE, counters2);
                if (loc3 == null) {
                    i3--;
                } else {
                    result[2] = new ResultPoint(loc3[0], i3);
                    result[6] = new ResultPoint(loc3[1], i3);
                    found = true;
                    break;
                }
            }
        }
        if (found) {
            found = false;
            int i4 = 0;
            while (true) {
                if (i4 >= height) {
                    break;
                }
                int[] loc4 = findGuardPattern(matrix, 0, i4, halfWidth, false, STOP_PATTERN_REVERSE, counters2);
                if (loc4 == null) {
                    i4++;
                } else {
                    result[3] = new ResultPoint(loc4[0], i4);
                    result[7] = new ResultPoint(loc4[1], i4);
                    found = true;
                    break;
                }
            }
        }
        if (found) {
            return result;
        }
        return null;
    }

    private static void correctCodeWordVertices(ResultPoint[] vertices, boolean upsideDown) {
        float skew = vertices[4].getY() - vertices[6].getY();
        if (upsideDown) {
            skew = -skew;
        }
        if (skew > 2.0f) {
            float length = vertices[4].getX() - vertices[0].getX();
            float deltax = vertices[6].getX() - vertices[0].getX();
            float deltay = vertices[6].getY() - vertices[0].getY();
            float correction = (length * deltay) / deltax;
            vertices[4] = new ResultPoint(vertices[4].getX(), vertices[4].getY() + correction);
        } else if ((-skew) > 2.0f) {
            float length2 = vertices[2].getX() - vertices[6].getX();
            float deltax2 = vertices[2].getX() - vertices[4].getX();
            float deltay2 = vertices[2].getY() - vertices[4].getY();
            float correction2 = (length2 * deltay2) / deltax2;
            vertices[6] = new ResultPoint(vertices[6].getX(), vertices[6].getY() - correction2);
        }
        float skew2 = vertices[7].getY() - vertices[5].getY();
        if (upsideDown) {
            skew2 = -skew2;
        }
        if (skew2 > 2.0f) {
            float length3 = vertices[5].getX() - vertices[1].getX();
            float deltax3 = vertices[7].getX() - vertices[1].getX();
            float deltay3 = vertices[7].getY() - vertices[1].getY();
            float correction3 = (length3 * deltay3) / deltax3;
            vertices[5] = new ResultPoint(vertices[5].getX(), vertices[5].getY() + correction3);
        } else if ((-skew2) > 2.0f) {
            float length4 = vertices[3].getX() - vertices[7].getX();
            float deltax4 = vertices[3].getX() - vertices[5].getX();
            float deltay4 = vertices[3].getY() - vertices[5].getY();
            float correction4 = (length4 * deltay4) / deltax4;
            vertices[7] = new ResultPoint(vertices[7].getX(), vertices[7].getY() - correction4);
        }
    }

    private static float computeModuleWidth(ResultPoint[] vertices) {
        float pixels1 = ResultPoint.distance(vertices[0], vertices[4]);
        float pixels2 = ResultPoint.distance(vertices[1], vertices[5]);
        float moduleWidth1 = (pixels1 + pixels2) / 34.0f;
        float pixels3 = ResultPoint.distance(vertices[6], vertices[2]);
        float pixels4 = ResultPoint.distance(vertices[7], vertices[3]);
        float moduleWidth2 = (pixels3 + pixels4) / 36.0f;
        return (moduleWidth1 + moduleWidth2) / 2.0f;
    }

    private static int computeDimension(ResultPoint topLeft, ResultPoint topRight, ResultPoint bottomLeft, ResultPoint bottomRight, float moduleWidth) {
        int topRowDimension = round(ResultPoint.distance(topLeft, topRight) / moduleWidth);
        int bottomRowDimension = round(ResultPoint.distance(bottomLeft, bottomRight) / moduleWidth);
        return ((((topRowDimension + bottomRowDimension) >> 1) + 8) / 17) * 17;
    }

    private static BitMatrix sampleGrid(BitMatrix matrix, ResultPoint topLeft, ResultPoint bottomLeft, ResultPoint topRight, ResultPoint bottomRight, int dimension) throws NotFoundException {
        GridSampler sampler = GridSampler.getInstance();
        return sampler.sampleGrid(matrix, dimension, dimension, 0.0f, 0.0f, dimension, 0.0f, dimension, dimension, 0.0f, dimension, topLeft.getX(), topLeft.getY(), topRight.getX(), topRight.getY(), bottomRight.getX(), bottomRight.getY(), bottomLeft.getX(), bottomLeft.getY());
    }

    private static int round(float d) {
        return (int) (0.5f + d);
    }

    private static int[] findGuardPattern(BitMatrix matrix, int column, int row, int width, boolean whiteFirst, int[] pattern, int[] counters) {
        Arrays.fill(counters, 0, counters.length, 0);
        int patternLength = pattern.length;
        boolean isWhite = whiteFirst;
        int counterPosition = 0;
        int patternStart = column;
        for (int x = column; x < column + width; x++) {
            boolean pixel = matrix.get(x, row);
            if (pixel ^ isWhite) {
                counters[counterPosition] = counters[counterPosition] + 1;
            } else {
                if (counterPosition == patternLength - 1) {
                    if (patternMatchVariance(counters, pattern, 204) < MAX_AVG_VARIANCE) {
                        return new int[]{patternStart, x};
                    }
                    patternStart += counters[0] + counters[1];
                    System.arraycopy(counters, 2, counters, 0, patternLength - 2);
                    counters[patternLength - 2] = 0;
                    counters[patternLength - 1] = 0;
                    counterPosition--;
                } else {
                    counterPosition++;
                }
                counters[counterPosition] = 1;
                isWhite = !isWhite;
            }
        }
        return null;
    }

    private static int patternMatchVariance(int[] counters, int[] pattern, int maxIndividualVariance) {
        int numCounters = counters.length;
        int total = 0;
        int patternLength = 0;
        for (int i = 0; i < numCounters; i++) {
            total += counters[i];
            patternLength += pattern[i];
        }
        if (total < patternLength) {
            return Execute.INVALID;
        }
        int unitBarWidth = (total << 8) / patternLength;
        int maxIndividualVariance2 = (maxIndividualVariance * unitBarWidth) >> 8;
        int totalVariance = 0;
        for (int x = 0; x < numCounters; x++) {
            int counter = counters[x] << 8;
            int scaledPattern = pattern[x] * unitBarWidth;
            int variance = counter > scaledPattern ? counter - scaledPattern : scaledPattern - counter;
            if (variance > maxIndividualVariance2) {
                return Execute.INVALID;
            }
            totalVariance += variance;
        }
        return totalVariance / total;
    }
}
