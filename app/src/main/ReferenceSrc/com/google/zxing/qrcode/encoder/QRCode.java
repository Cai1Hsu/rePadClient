package com.google.zxing.qrcode.encoder;

import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.google.zxing.qrcode.decoder.Mode;

/* loaded from: classes.jar:com/google/zxing/qrcode/encoder/QRCode.class */
public final class QRCode {
    public static final int NUM_MASK_PATTERNS = 8;
    private Mode mode = null;
    private ErrorCorrectionLevel ecLevel = null;
    private int version = -1;
    private int matrixWidth = -1;
    private int maskPattern = -1;
    private int numTotalBytes = -1;
    private int numDataBytes = -1;
    private int numECBytes = -1;
    private int numRSBlocks = -1;
    private ByteMatrix matrix = null;

    public static boolean isValidMaskPattern(int i) {
        return i >= 0 && i < 8;
    }

    public int at(int i, int i2) {
        byte b = this.matrix.get(i, i2);
        if (b == 0 || b == 1) {
            return b;
        }
        throw new IllegalStateException("Bad value");
    }

    public ErrorCorrectionLevel getECLevel() {
        return this.ecLevel;
    }

    public int getMaskPattern() {
        return this.maskPattern;
    }

    public ByteMatrix getMatrix() {
        return this.matrix;
    }

    public int getMatrixWidth() {
        return this.matrixWidth;
    }

    public Mode getMode() {
        return this.mode;
    }

    public int getNumDataBytes() {
        return this.numDataBytes;
    }

    public int getNumECBytes() {
        return this.numECBytes;
    }

    public int getNumRSBlocks() {
        return this.numRSBlocks;
    }

    public int getNumTotalBytes() {
        return this.numTotalBytes;
    }

    public int getVersion() {
        return this.version;
    }

    public boolean isValid() {
        return (this.mode == null || this.ecLevel == null || this.version == -1 || this.matrixWidth == -1 || this.maskPattern == -1 || this.numTotalBytes == -1 || this.numDataBytes == -1 || this.numECBytes == -1 || this.numRSBlocks == -1 || !isValidMaskPattern(this.maskPattern) || this.numTotalBytes != this.numDataBytes + this.numECBytes || this.matrix == null || this.matrixWidth != this.matrix.getWidth() || this.matrix.getWidth() != this.matrix.getHeight()) ? false : true;
    }

    public void setECLevel(ErrorCorrectionLevel errorCorrectionLevel) {
        this.ecLevel = errorCorrectionLevel;
    }

    public void setMaskPattern(int i) {
        this.maskPattern = i;
    }

    public void setMatrix(ByteMatrix byteMatrix) {
        this.matrix = byteMatrix;
    }

    public void setMatrixWidth(int i) {
        this.matrixWidth = i;
    }

    public void setMode(Mode mode) {
        this.mode = mode;
    }

    public void setNumDataBytes(int i) {
        this.numDataBytes = i;
    }

    public void setNumECBytes(int i) {
        this.numECBytes = i;
    }

    public void setNumRSBlocks(int i) {
        this.numRSBlocks = i;
    }

    public void setNumTotalBytes(int i) {
        this.numTotalBytes = i;
    }

    public void setVersion(int i) {
        this.version = i;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(200);
        sb.append("<<\n");
        sb.append(" mode: ");
        sb.append(this.mode);
        sb.append("\n ecLevel: ");
        sb.append(this.ecLevel);
        sb.append("\n version: ");
        sb.append(this.version);
        sb.append("\n matrixWidth: ");
        sb.append(this.matrixWidth);
        sb.append("\n maskPattern: ");
        sb.append(this.maskPattern);
        sb.append("\n numTotalBytes: ");
        sb.append(this.numTotalBytes);
        sb.append("\n numDataBytes: ");
        sb.append(this.numDataBytes);
        sb.append("\n numECBytes: ");
        sb.append(this.numECBytes);
        sb.append("\n numRSBlocks: ");
        sb.append(this.numRSBlocks);
        if (this.matrix == null) {
            sb.append("\n matrix: null\n");
        } else {
            sb.append("\n matrix:\n");
            sb.append(this.matrix.toString());
        }
        sb.append(">>\n");
        return sb.toString();
    }
}
