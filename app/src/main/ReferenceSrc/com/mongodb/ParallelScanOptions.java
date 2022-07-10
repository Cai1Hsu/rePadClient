package com.mongodb;

import org.bson.util.Assertions;
import org.bson.util.annotations.Immutable;
@Immutable
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class ParallelScanOptions {
    private final int batchSize;
    private final int numCursors;
    private final ReadPreference readPreference;

    /* synthetic */ ParallelScanOptions(Builder x0, AnonymousClass1 x1) {
        this(x0);
    }

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public static class Builder {
        private int batchSize;
        private int numCursors;
        private ReadPreference readPreference;

        static /* synthetic */ int access$100(Builder x0) {
            return x0.numCursors;
        }

        static /* synthetic */ int access$200(Builder x0) {
            return x0.batchSize;
        }

        static /* synthetic */ ReadPreference access$300(Builder x0) {
            return x0.readPreference;
        }

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
            return new ParallelScanOptions(this, null);
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
        this.numCursors = Builder.access$100(builder);
        this.batchSize = Builder.access$200(builder);
        this.readPreference = Builder.access$300(builder);
    }
}
