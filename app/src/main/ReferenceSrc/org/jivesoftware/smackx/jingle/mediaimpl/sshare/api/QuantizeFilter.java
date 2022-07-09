package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.Rectangle;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter.class */
public class QuantizeFilter extends WholeImageFilter {
    protected static final int[] matrix = {0, 0, 0, 0, 0, 7, 3, 5, 1};
    private boolean dither;
    private int sum = 16;
    private int numColors = 256;
    private boolean serpentine = true;

    @Override // org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.WholeImageFilter
    protected int[] filterPixels(int i, int i2, int[] iArr, Rectangle rectangle) {
        int[] iArr2 = new int[i * i2];
        quantize(iArr, iArr2, i, i2, this.numColors, this.dither, this.serpentine);
        return iArr2;
    }

    public boolean getDither() {
        return this.dither;
    }

    public int getNumColors() {
        return this.numColors;
    }

    public boolean getSerpentine() {
        return this.serpentine;
    }

    public void quantize(int[] iArr, int[] iArr2, int i, int i2, int i3, boolean z, boolean z2) {
        int i4;
        int i5;
        int i6 = i * i2;
        OctTreeQuantizer octTreeQuantizer = new OctTreeQuantizer();
        octTreeQuantizer.setup(i3);
        octTreeQuantizer.addPixels(iArr, 0, i6);
        int[] buildColorTable = octTreeQuantizer.buildColorTable();
        if (!z) {
            for (int i7 = 0; i7 < i6; i7++) {
                iArr2[i7] = buildColorTable[octTreeQuantizer.getIndexForColor(iArr[i7])];
            }
            return;
        }
        for (int i8 = 0; i8 < i2; i8++) {
            boolean z3 = z2 && (i8 & 1) == 1;
            if (z3) {
                i4 = ((i8 * i) + i) - 1;
                i5 = -1;
            } else {
                i4 = i8 * i;
                i5 = 1;
            }
            for (int i9 = 0; i9 < i; i9++) {
                int i10 = iArr[i4];
                int i11 = buildColorTable[octTreeQuantizer.getIndexForColor(i10)];
                iArr2[i4] = i11;
                for (int i12 = -1; i12 <= 1; i12++) {
                    int i13 = i12 + i8;
                    if (i13 >= 0 && i13 < i2) {
                        for (int i14 = -1; i14 <= 1; i14++) {
                            int i15 = i14 + i9;
                            if (i15 >= 0 && i15 < i) {
                                int i16 = z3 ? matrix[(((i12 + 1) * 3) - i14) + 1] : matrix[((i12 + 1) * 3) + i14 + 1];
                                if (i16 != 0) {
                                    int i17 = z3 ? i4 - i14 : i4 + i14;
                                    int i18 = iArr[i17];
                                    iArr[i17] = (PixelUtils.clamp(((i18 >> 16) & 255) + (((((i10 >> 16) & 255) - ((i11 >> 16) & 255)) * i16) / this.sum)) << 16) | (PixelUtils.clamp(((i18 >> 8) & 255) + (((((i10 >> 8) & 255) - ((i11 >> 8) & 255)) * i16) / this.sum)) << 8) | PixelUtils.clamp((i18 & 255) + ((((i10 & 255) - (i11 & 255)) * i16) / this.sum));
                                }
                            }
                        }
                    }
                }
                i4 += i5;
            }
        }
    }

    public void setDither(boolean z) {
        this.dither = z;
    }

    public void setNumColors(int i) {
        this.numColors = Math.min(Math.max(i, 8), 256);
    }

    public void setSerpentine(boolean z) {
        this.serpentine = z;
    }

    public String toString() {
        return "Colors/Quantize...";
    }
}
