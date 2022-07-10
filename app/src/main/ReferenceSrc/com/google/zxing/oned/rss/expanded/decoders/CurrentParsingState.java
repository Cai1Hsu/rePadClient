package com.google.zxing.oned.rss.expanded.decoders;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class CurrentParsingState {
    private int position = 0;
    private State encoding = State.NUMERIC;

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private enum State {
        NUMERIC,
        ALPHA,
        ISO_IEC_646
    }

    public int getPosition() {
        return this.position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public void incrementPosition(int delta) {
        this.position += delta;
    }

    public boolean isAlpha() {
        return this.encoding == State.ALPHA;
    }

    boolean isNumeric() {
        return this.encoding == State.NUMERIC;
    }

    public boolean isIsoIec646() {
        return this.encoding == State.ISO_IEC_646;
    }

    public void setNumeric() {
        this.encoding = State.NUMERIC;
    }

    public void setAlpha() {
        this.encoding = State.ALPHA;
    }

    public void setIsoIec646() {
        this.encoding = State.ISO_IEC_646;
    }
}
