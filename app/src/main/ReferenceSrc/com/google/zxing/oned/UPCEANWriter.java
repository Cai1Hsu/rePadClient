package com.google.zxing.oned;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class UPCEANWriter extends OneDimensionalCodeWriter {
    public UPCEANWriter() {
        super(UPCEANReader.START_END_PATTERN.length << 1);
    }
}
