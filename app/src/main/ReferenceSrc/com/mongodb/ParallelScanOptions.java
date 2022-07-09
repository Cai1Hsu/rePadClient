package com.mongodb;

import org.bson.util.Assertions;
import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: classes.dex */
public class ParallelScanOptions {
    private final int batchSize;
    private final int numCursors;
    private final ReadPreference readPreference;

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: classes.dex */
    public static class Builder {
        private int batchSize;
        private int numCursors;
        private ReadPreference readPreference;

        public Builder numCursors(int numCursors) {
            boolean z = true;
            Assertions.isTrue("numCursors >= 1", numCursors >= 1);
            if (numCursors > 10000) {
                z = false;
            }
            Assertions.isTrue("numCursors <= 10000", z);
            this.numCursors = numCursors;
            return this;
        }

        public Builder batchSize(int batchSize) {
            Assertions.isTrue("batchSize >= 0", batchSize >= 0);
            this.batchSize = batchSize;
            return this;
        }

        public Builder readPreference(ReadPreference readPreference) {
            this.readPreference = (ReadPreference) Assertions.notNull("readPreference", readPreference);
            return this;
        }

        public ParallelScanOptions build() {
            return new ParallelScanOptions(this);
        }
    }

    public int getNumCursors() {
        return this.numCursors;
    }

    public int getBatchSize() {
        return this.batchSize;
    }

    public ReadPreference getReadPreference() {
        return this.readPreference;
    }

    private ParallelScanOptions(Builder builder) {
        this.numCursors = builder.numCursors;
        this.batchSize = builder.batchSize;
        this.readPreference = builder.readPreference;
    }
}
