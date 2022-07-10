package com.google.zxing.oned.rss;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class Pair extends DataCharacter {
    private int count;
    private final FinderPattern finderPattern;

    public Pair(int value, int checksumPortion, FinderPattern finderPattern) {
        super(value, checksumPortion);
        this.finderPattern = finderPattern;
    }

    public FinderPattern getFinderPattern() {
        return this.finderPattern;
    }

    public int getCount() {
        return this.count;
    }

    public void incrementCount() {
        this.count++;
    }
}
