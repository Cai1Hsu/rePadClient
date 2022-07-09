package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.Color;
import java.util.Random;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/PixelUtils.class */
public class PixelUtils {
    public static final int ADD = 4;
    public static final int ALPHA = 19;
    public static final int ALPHA_TO_GRAY = 20;
    public static final int AVERAGE = 13;
    public static final int CLEAR = 15;
    public static final int COLOR = 11;
    public static final int DIFFERENCE = 6;
    public static final int DISSOLVE = 17;
    public static final int DST_IN = 18;
    public static final int EXCHANGE = 16;
    public static final int HUE = 8;
    public static final int MAX = 3;
    public static final int MIN = 2;
    public static final int MULTIPLY = 7;
    public static final int NORMAL = 1;
    public static final int OVERLAY = 14;
    public static final int REPLACE = 0;
    public static final int SATURATION = 9;
    public static final int SCREEN = 12;
    public static final int SUBTRACT = 5;
    public static final int VALUE = 10;
    private static Random randomGenerator = new Random();
    private static final float[] hsb1 = new float[3];
    private static final float[] hsb2 = new float[3];

    public static int brightness(int i) {
        return ((((i >> 16) & 255) + ((i >> 8) & 255)) + (i & 255)) / 3;
    }

    public static int clamp(int i) {
        int i2;
        if (i < 0) {
            i2 = 0;
        } else {
            i2 = i;
            if (i > 255) {
                i2 = 255;
            }
        }
        return i2;
    }

    public static int combinePixels(int i, int i2, int i3) {
        return combinePixels(i, i2, i3, 255);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x00db, code lost:
        if (r0 != 255) goto L13;
     */
    /* JADX WARN: Removed duplicated region for block: B:11:0x00c9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int combinePixels(int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        int i8;
        if (i3 != 0) {
            int i9 = (i >> 24) & 255;
            int i10 = (i >> 16) & 255;
            int i11 = (i >> 8) & 255;
            int i12 = i & 255;
            int i13 = (i2 >> 24) & 255;
            int i14 = (i2 >> 16) & 255;
            int i15 = (i2 >> 8) & 255;
            int i16 = i2 & 255;
            int i17 = i12;
            int i18 = i11;
            int i19 = i10;
            switch (i3) {
                case 1:
                case 16:
                    if (i4 == 255) {
                        i7 = i9;
                        i6 = i17;
                        i5 = i18;
                        i8 = i19;
                        break;
                    }
                    int i20 = (i9 * i4) / 255;
                    int i21 = ((255 - i20) * i13) / 255;
                    i8 = clamp(((i19 * i20) + (i14 * i21)) / 255);
                    i5 = clamp(((i18 * i20) + (i15 * i21)) / 255);
                    i6 = clamp(((i17 * i20) + (i16 * i21)) / 255);
                    i7 = clamp(i20 + i21);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 2:
                    i19 = Math.min(i10, i14);
                    i18 = Math.min(i11, i15);
                    i17 = Math.min(i12, i16);
                    if (i4 == 255) {
                    }
                    int i202 = (i9 * i4) / 255;
                    int i212 = ((255 - i202) * i13) / 255;
                    i8 = clamp(((i19 * i202) + (i14 * i212)) / 255);
                    i5 = clamp(((i18 * i202) + (i15 * i212)) / 255);
                    i6 = clamp(((i17 * i202) + (i16 * i212)) / 255);
                    i7 = clamp(i202 + i212);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 3:
                    i19 = Math.max(i10, i14);
                    i18 = Math.max(i11, i15);
                    i17 = Math.max(i12, i16);
                    if (i4 == 255) {
                    }
                    int i2022 = (i9 * i4) / 255;
                    int i2122 = ((255 - i2022) * i13) / 255;
                    i8 = clamp(((i19 * i2022) + (i14 * i2122)) / 255);
                    i5 = clamp(((i18 * i2022) + (i15 * i2122)) / 255);
                    i6 = clamp(((i17 * i2022) + (i16 * i2122)) / 255);
                    i7 = clamp(i2022 + i2122);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 4:
                    i19 = clamp(i10 + i14);
                    i18 = clamp(i11 + i15);
                    i17 = clamp(i12 + i16);
                    if (i4 == 255) {
                    }
                    int i20222 = (i9 * i4) / 255;
                    int i21222 = ((255 - i20222) * i13) / 255;
                    i8 = clamp(((i19 * i20222) + (i14 * i21222)) / 255);
                    i5 = clamp(((i18 * i20222) + (i15 * i21222)) / 255);
                    i6 = clamp(((i17 * i20222) + (i16 * i21222)) / 255);
                    i7 = clamp(i20222 + i21222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 5:
                    i19 = clamp(i14 - i10);
                    i18 = clamp(i15 - i11);
                    i17 = clamp(i16 - i12);
                    if (i4 == 255) {
                    }
                    int i202222 = (i9 * i4) / 255;
                    int i212222 = ((255 - i202222) * i13) / 255;
                    i8 = clamp(((i19 * i202222) + (i14 * i212222)) / 255);
                    i5 = clamp(((i18 * i202222) + (i15 * i212222)) / 255);
                    i6 = clamp(((i17 * i202222) + (i16 * i212222)) / 255);
                    i7 = clamp(i202222 + i212222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 6:
                    i19 = clamp(Math.abs(i10 - i14));
                    i18 = clamp(Math.abs(i11 - i15));
                    i17 = clamp(Math.abs(i12 - i16));
                    if (i4 == 255) {
                    }
                    int i2022222 = (i9 * i4) / 255;
                    int i2122222 = ((255 - i2022222) * i13) / 255;
                    i8 = clamp(((i19 * i2022222) + (i14 * i2122222)) / 255);
                    i5 = clamp(((i18 * i2022222) + (i15 * i2122222)) / 255);
                    i6 = clamp(((i17 * i2022222) + (i16 * i2122222)) / 255);
                    i7 = clamp(i2022222 + i2122222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 7:
                    i19 = clamp((i10 * i14) / 255);
                    i18 = clamp((i11 * i15) / 255);
                    i17 = clamp((i12 * i16) / 255);
                    if (i4 == 255) {
                    }
                    int i20222222 = (i9 * i4) / 255;
                    int i21222222 = ((255 - i20222222) * i13) / 255;
                    i8 = clamp(((i19 * i20222222) + (i14 * i21222222)) / 255);
                    i5 = clamp(((i18 * i20222222) + (i15 * i21222222)) / 255);
                    i6 = clamp(((i17 * i20222222) + (i16 * i21222222)) / 255);
                    i7 = clamp(i20222222 + i21222222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 8:
                case 9:
                case 10:
                case 11:
                    Color.RGBtoHSB(i10, i11, i12, hsb1);
                    Color.RGBtoHSB(i14, i15, i16, hsb2);
                    switch (i3) {
                        case 8:
                            hsb2[0] = hsb1[0];
                            break;
                        case 9:
                            hsb2[1] = hsb1[1];
                            break;
                        case 10:
                            hsb2[2] = hsb1[2];
                            break;
                        case 11:
                            hsb2[0] = hsb1[0];
                            hsb2[1] = hsb1[1];
                            break;
                    }
                    int HSBtoRGB = Color.HSBtoRGB(hsb2[0], hsb2[1], hsb2[2]);
                    i19 = (HSBtoRGB >> 16) & 255;
                    i18 = (HSBtoRGB >> 8) & 255;
                    i17 = HSBtoRGB & 255;
                    if (i4 == 255) {
                    }
                    int i202222222 = (i9 * i4) / 255;
                    int i212222222 = ((255 - i202222222) * i13) / 255;
                    i8 = clamp(((i19 * i202222222) + (i14 * i212222222)) / 255);
                    i5 = clamp(((i18 * i202222222) + (i15 * i212222222)) / 255);
                    i6 = clamp(((i17 * i202222222) + (i16 * i212222222)) / 255);
                    i7 = clamp(i202222222 + i212222222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 12:
                    i19 = 255 - (((255 - i10) * (255 - i14)) / 255);
                    i18 = 255 - (((255 - i11) * (255 - i15)) / 255);
                    i17 = 255 - (((255 - i12) * (255 - i16)) / 255);
                    if (i4 == 255) {
                    }
                    int i2022222222 = (i9 * i4) / 255;
                    int i2122222222 = ((255 - i2022222222) * i13) / 255;
                    i8 = clamp(((i19 * i2022222222) + (i14 * i2122222222)) / 255);
                    i5 = clamp(((i18 * i2022222222) + (i15 * i2122222222)) / 255);
                    i6 = clamp(((i17 * i2022222222) + (i16 * i2122222222)) / 255);
                    i7 = clamp(i2022222222 + i2122222222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 13:
                    i19 = (i10 + i14) / 2;
                    i18 = (i11 + i15) / 2;
                    i17 = (i12 + i16) / 2;
                    if (i4 == 255) {
                    }
                    int i20222222222 = (i9 * i4) / 255;
                    int i21222222222 = ((255 - i20222222222) * i13) / 255;
                    i8 = clamp(((i19 * i20222222222) + (i14 * i21222222222)) / 255);
                    i5 = clamp(((i18 * i20222222222) + (i15 * i21222222222)) / 255);
                    i6 = clamp(((i17 * i20222222222) + (i16 * i21222222222)) / 255);
                    i7 = clamp(i20222222222 + i21222222222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 14:
                    i19 = (((255 - (((255 - i10) * (255 - i14)) / 255)) * i10) + ((255 - i10) * ((i10 * i14) / 255))) / 255;
                    i18 = (((255 - (((255 - i11) * (255 - i15)) / 255)) * i11) + ((255 - i11) * ((i11 * i15) / 255))) / 255;
                    i17 = (((255 - (((255 - i12) * (255 - i16)) / 255)) * i12) + ((255 - i12) * ((i12 * i16) / 255))) / 255;
                    if (i4 == 255) {
                    }
                    int i202222222222 = (i9 * i4) / 255;
                    int i212222222222 = ((255 - i202222222222) * i13) / 255;
                    i8 = clamp(((i19 * i202222222222) + (i14 * i212222222222)) / 255);
                    i5 = clamp(((i18 * i202222222222) + (i15 * i212222222222)) / 255);
                    i6 = clamp(((i17 * i202222222222) + (i16 * i212222222222)) / 255);
                    i7 = clamp(i202222222222 + i212222222222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 15:
                    i17 = 255;
                    i18 = 255;
                    i19 = 255;
                    if (i4 == 255) {
                    }
                    int i2022222222222 = (i9 * i4) / 255;
                    int i2122222222222 = ((255 - i2022222222222) * i13) / 255;
                    i8 = clamp(((i19 * i2022222222222) + (i14 * i2122222222222)) / 255);
                    i5 = clamp(((i18 * i2022222222222) + (i15 * i2122222222222)) / 255);
                    i6 = clamp(((i17 * i2022222222222) + (i16 * i2122222222222)) / 255);
                    i7 = clamp(i2022222222222 + i2122222222222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 17:
                    i17 = i12;
                    i18 = i11;
                    i19 = i10;
                    if ((randomGenerator.nextInt() & 255) <= i9) {
                        i19 = i14;
                        i18 = i15;
                        i17 = i16;
                    }
                    if (i4 == 255) {
                    }
                    int i20222222222222 = (i9 * i4) / 255;
                    int i21222222222222 = ((255 - i20222222222222) * i13) / 255;
                    i8 = clamp(((i19 * i20222222222222) + (i14 * i21222222222222)) / 255);
                    i5 = clamp(((i18 * i20222222222222) + (i15 * i21222222222222)) / 255);
                    i6 = clamp(((i17 * i20222222222222) + (i16 * i21222222222222)) / 255);
                    i7 = clamp(i20222222222222 + i21222222222222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
                case 18:
                    i = (clamp((i13 * i9) / 255) << 24) | (clamp((i14 * i9) / 255) << 16) | (clamp((i15 * i9) / 255) << 8) | clamp((i16 * i9) / 255);
                    break;
                case 19:
                    i = (((i9 * i13) / 255) << 24) | (i14 << 16) | (i15 << 8) | i16;
                    break;
                case 20:
                    int i22 = 255 - i9;
                    i = (i9 << 24) | (i22 << 16) | (i22 << 8) | i22;
                    break;
                default:
                    i19 = i10;
                    i18 = i11;
                    i17 = i12;
                    if (i4 == 255) {
                    }
                    int i202222222222222 = (i9 * i4) / 255;
                    int i212222222222222 = ((255 - i202222222222222) * i13) / 255;
                    i8 = clamp(((i19 * i202222222222222) + (i14 * i212222222222222)) / 255);
                    i5 = clamp(((i18 * i202222222222222) + (i15 * i212222222222222)) / 255);
                    i6 = clamp(((i17 * i202222222222222) + (i16 * i212222222222222)) / 255);
                    i7 = clamp(i202222222222222 + i212222222222222);
                    i = (i7 << 24) | (i8 << 16) | (i5 << 8) | i6;
                    break;
            }
        }
        return i;
    }

    public static int combinePixels(int i, int i2, int i3, int i4, int i5) {
        return ((i5 ^ (-1)) & i2) | combinePixels(i & i5, i2, i3, i4);
    }

    public static int interpolate(int i, int i2, float f) {
        return clamp((int) (i + ((i2 - i) * f)));
    }

    public static boolean nearColors(int i, int i2, int i3) {
        return Math.abs(((i >> 16) & 255) - ((i2 >> 16) & 255)) <= i3 && Math.abs(((i >> 8) & 255) - ((i2 >> 8) & 255)) <= i3 && Math.abs((i & 255) - (i2 & 255)) <= i3;
    }
}
