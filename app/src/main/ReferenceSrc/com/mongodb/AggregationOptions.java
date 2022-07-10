package com.mongodb;

import java.util.concurrent.TimeUnit;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class AggregationOptions {
    private final Boolean allowDiskUse;
    private final Integer batchSize;
    private final long maxTimeMS;
    private final OutputMode outputMode;

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public enum OutputMode {
        INLINE,
        CURSOR
    }

    AggregationOptions(Builder builder) {
        this.batchSize = Builder.access$000(builder);
        this.allowDiskUse = Builder.access$100(builder);
        this.outputMode = Builder.access$200(builder);
        this.maxTimeMS = Builder.access$300(builder);
    }

    public Boolean getAllowDiskUse() {
        return this.allowDiskUse;
    }

    public Integer getBatchSize() {
        return this.batchSize;
    }

    public OutputMode getOutputMode() {
        return this.outputMode;
    }

    public long getMaxTime(TimeUnit timeUnit) {
        return timeUnit.convert(this.maxTimeMS, TimeUnit.MILLISECONDS);
    }

    public String toString() {
        return "AggregationOptions{batchSize=" + this.batchSize + ", allowDiskUse=" + this.allowDiskUse + ", outputMode=" + this.outputMode + ", maxTimeMS=" + this.maxTimeMS + '}';
    }

    public static Builder builder() {
        return new Builder(null);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public static class Builder {
        private Boolean allowDiskUse;
        private Integer batchSize;
        private long maxTimeMS;
        private OutputMode outputMode;

        /* synthetic */ Builder(AnonymousClass1 x0) {
            this();
        }

        static /* synthetic */ Integer access$000(Builder x0) {
            return x0.batchSize;
        }

        static /* synthetic */ Boolean access$100(Builder x0) {
            return x0.allowDiskUse;
        }

        static /* synthetic */ OutputMode access$200(Builder x0) {
            return x0.outputMode;
        }

        static /* synthetic */ long access$300(Builder x0) {
            return x0.maxTimeMS;
        }

        private Builder() {
            this.outputMode = OutputMode.INLINE;
        }

        public Builder batchSize(Integer size) {
            this.batchSize = size;
            return this;
        }

        public Builder allowDiskUse(Boolean allowDiskUse) {
            this.allowDiskUse = allowDiskUse;
            return this;
        }

        public Builder outputMode(OutputMode mode) {
            this.outputMode = mode;
            return this;
        }

        public Builder maxTime(long maxTime, TimeUnit timeUnit) {
            this.maxTimeMS = TimeUnit.MILLISECONDS.convert(maxTime, timeUnit);
            return this;
        }

        public AggregationOptions build() {
            return new AggregationOptions(this);
        }
    }
}
