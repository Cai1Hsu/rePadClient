package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class BSONWriterSettings {
    private final int maxSerializationDepth;

    public BSONWriterSettings(int maxSerializationDepth) {
        this.maxSerializationDepth = maxSerializationDepth;
    }

    public BSONWriterSettings() {
        this(1024);
    }

    public int getMaxSerializationDepth() {
        return this.maxSerializationDepth;
    }
}
