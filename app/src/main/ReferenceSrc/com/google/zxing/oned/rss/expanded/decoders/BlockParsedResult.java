package com.google.zxing.oned.rss.expanded.decoders;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class BlockParsedResult {
    private final DecodedInformation decodedInformation;
    private final boolean finished;

    public BlockParsedResult(boolean finished) {
        this(null, finished);
    }

    public BlockParsedResult(DecodedInformation information, boolean finished) {
        this.finished = finished;
        this.decodedInformation = information;
    }

    public DecodedInformation getDecodedInformation() {
        return this.decodedInformation;
    }

    public boolean isFinished() {
        return this.finished;
    }
}
