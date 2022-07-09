package com.mongodb;

/* loaded from: classes.dex */
class BSONBinaryWriterSettings {
    private final int maxDocumentSize;

    public BSONBinaryWriterSettings(int maxDocumentSize) {
        this.maxDocumentSize = maxDocumentSize;
    }

    public BSONBinaryWriterSettings() {
        this(16777216);
    }

    public int getMaxDocumentSize() {
        return this.maxDocumentSize;
    }
}
