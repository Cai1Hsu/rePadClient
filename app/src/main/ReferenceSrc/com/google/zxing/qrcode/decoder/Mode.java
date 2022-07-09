package com.google.zxing.qrcode.decoder;

/* loaded from: classes.jar:com/google/zxing/qrcode/decoder/Mode.class */
public enum Mode {
    TERMINATOR(new int[]{0, 0, 0}, 0),
    NUMERIC(new int[]{10, 12, 14}, 1),
    ALPHANUMERIC(new int[]{9, 11, 13}, 2),
    STRUCTURED_APPEND(new int[]{0, 0, 0}, 3),
    BYTE(new int[]{8, 16, 16}, 4),
    ECI(new int[]{0, 0, 0}, 7),
    KANJI(new int[]{8, 10, 12}, 8),
    FNC1_FIRST_POSITION(new int[]{0, 0, 0}, 5),
    FNC1_SECOND_POSITION(new int[]{0, 0, 0}, 9),
    HANZI(new int[]{8, 10, 12}, 13);
    
    private final int bits;
    private final int[] characterCountBitsForVersions;

    Mode(int[] iArr, int i) {
        this.characterCountBitsForVersions = iArr;
        this.bits = i;
    }

    public static Mode forBits(int i) {
        Mode mode;
        switch (i) {
            case 0:
                mode = TERMINATOR;
                break;
            case 1:
                mode = NUMERIC;
                break;
            case 2:
                mode = ALPHANUMERIC;
                break;
            case 3:
                mode = STRUCTURED_APPEND;
                break;
            case 4:
                mode = BYTE;
                break;
            case 5:
                mode = FNC1_FIRST_POSITION;
                break;
            case 6:
            case 10:
            case 11:
            case 12:
            default:
                throw new IllegalArgumentException();
            case 7:
                mode = ECI;
                break;
            case 8:
                mode = KANJI;
                break;
            case 9:
                mode = FNC1_SECOND_POSITION;
                break;
            case 13:
                mode = HANZI;
                break;
        }
        return mode;
    }

    public int getBits() {
        return this.bits;
    }

    public int getCharacterCountBits(Version version) {
        int versionNumber = version.getVersionNumber();
        return this.characterCountBitsForVersions[(versionNumber <= 9 ? null : versionNumber <= 26 ? 1 : 2) == 1 ? 1 : 0];
    }
}
