package com.google.zxing.oned.rss;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class DataCharacter {
    private final int checksumPortion;
    private final int value;

    public DataCharacter(int value, int checksumPortion) {
        this.value = value;
        this.checksumPortion = checksumPortion;
    }

    public int getValue() {
        return this.value;
    }

    public int getChecksumPortion() {
        return this.checksumPortion;
    }
}
