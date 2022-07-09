package com.google.zxing.oned;

/* loaded from: classes.jar:com/google/zxing/oned/UPCEANWriter.class */
public abstract class UPCEANWriter extends OneDimensionalCodeWriter {
    protected UPCEANWriter() {
        super(UPCEANReader.START_END_PATTERN.length << 1);
    }
}
