package com.google.zxing.oned.rss.expanded;

import com.google.zxing.oned.rss.DataCharacter;
import com.google.zxing.oned.rss.FinderPattern;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class ExpandedPair {
    private final FinderPattern finderPattern;
    private final DataCharacter leftChar;
    private final boolean mayBeLast;
    private final DataCharacter rightChar;

    public ExpandedPair(DataCharacter leftChar, DataCharacter rightChar, FinderPattern finderPattern, boolean mayBeLast) {
        this.leftChar = leftChar;
        this.rightChar = rightChar;
        this.finderPattern = finderPattern;
        this.mayBeLast = mayBeLast;
    }

    public boolean mayBeLast() {
        return this.mayBeLast;
    }

    public DataCharacter getLeftChar() {
        return this.leftChar;
    }

    public DataCharacter getRightChar() {
        return this.rightChar;
    }

    public FinderPattern getFinderPattern() {
        return this.finderPattern;
    }

    public boolean mustBeLast() {
        return this.rightChar == null;
    }
}
