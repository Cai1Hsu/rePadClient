package com.mongodb;

import java.util.concurrent.TimeUnit;
import org.bson.util.Assertions;

/* loaded from: classes.dex */
class ConnectionPoolSettings {
    private final long maintenanceFrequencyMS;
    private final long maintenanceInitialDelayMS;
    private final long maxConnectionIdleTimeMS;
    private final long maxConnectionLifeTimeMS;
    private final int maxSize;
    private final int maxWaitQueueSize;
    private final long maxWaitTimeMS;
    private final int minSize;

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: classes.dex */
    static class Builder {
        private long maintenanceFrequencyMS = TimeUnit.MILLISECONDS.convert(60, TimeUnit.SECONDS);
        private long maintenanceInitialDelayMS;
        private long maxConnectionIdleTimeMS;
        private long maxConnectionLifeTimeMS;
        private int maxSize;
        private int maxWaitQueueSize;
        private long maxWaitTimeMS;
        private int minSize;

        Builder() {
        }

        public Builder maxSize(int maxSize) {
            this.maxSize = maxSize;
            return this;
        }

        public Builder minSize(int minSize) {
            this.minSize = minSize;
            return this;
        }

        public Builder maxWaitQueueSize(int maxWaitQueueSize) {
            this.maxWaitQueueSize = maxWaitQueueSize;
            return this;
        }

        public Builder maxWaitTime(long maxWaitTime, TimeUnit timeUnit) {
            this.maxWaitTimeMS = TimeUnit.MILLISECONDS.convert(maxWaitTime, timeUnit);
            return this;
        }

        public Builder maxConnectionLifeTime(long maxConnectionLifeTime, TimeUnit timeUnit) {
            this.maxConnectionLifeTimeMS = TimeUnit.MILLISECONDS.convert(maxConnectionLifeTime, timeUnit);
            return this;
        }

        public Builder maxConnectionIdleTime(long maxConnectionIdleTime, TimeUnit timeUnit) {
            this.maxConnectionIdleTimeMS = TimeUnit.MILLISECONDS.convert(maxConnectionIdleTime, timeUnit);
            return this;
        }

        public Builder maintenanceInitialDelay(long maintenanceInitialDelay, TimeUnit timeUnit) {
            this.maintenanceInitialDelayMS = TimeUnit.MILLISECONDS.convert(maintenanceInitialDelay, timeUnit);
            return this;
        }

        public Builder maintenanceFrequency(long maintenanceFrequency, TimeUnit timeUnit) {
            this.maintenanceFrequencyMS = TimeUnit.MILLISECONDS.convert(maintenanceFrequency, timeUnit);
            return this;
        }

        public ConnectionPoolSettings build() {
            return new ConnectionPoolSettings(this);
        }
    }

    public int getMaxSize() {
        return this.maxSize;
    }

    public int getMinSize() {
        return this.minSize;
    }

    public int getMaxWaitQueueSize() {
        return this.maxWaitQueueSize;
    }

    public long getMaxWaitTime(TimeUnit timeUnit) {
        return timeUnit.convert(this.maxWaitTimeMS, TimeUnit.MILLISECONDS);
    }

    public long getMaxConnectionLifeTime(TimeUnit timeUnit) {
        return timeUnit.convert(this.maxConnectionLifeTimeMS, TimeUnit.MILLISECONDS);
    }

    public long getMaxConnectionIdleTime(TimeUnit timeUnit) {
        return timeUnit.convert(this.maxConnectionIdleTimeMS, TimeUnit.MILLISECONDS);
    }

    public long getMaintenanceInitialDelay(TimeUnit timeUnit) {
        return timeUnit.convert(this.maintenanceInitialDelayMS, TimeUnit.MILLISECONDS);
    }

    public long getMaintenanceFrequency(TimeUnit timeUnit) {
        return timeUnit.convert(this.maintenanceFrequencyMS, TimeUnit.MILLISECONDS);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ConnectionPoolSettings that = (ConnectionPoolSettings) o;
        return this.maxConnectionIdleTimeMS == that.maxConnectionIdleTimeMS && this.maxConnectionLifeTimeMS == that.maxConnectionLifeTimeMS && this.maxSize == that.maxSize && this.minSize == that.minSize && this.maintenanceInitialDelayMS == that.maintenanceInitialDelayMS && this.maintenanceFrequencyMS == that.maintenanceFrequencyMS && this.maxWaitQueueSize == that.maxWaitQueueSize && this.maxWaitTimeMS == that.maxWaitTimeMS;
    }

    public int hashCode() {
        int result = this.maxSize;
        return (((((((((((((result * 31) + this.minSize) * 31) + this.maxWaitQueueSize) * 31) + ((int) (this.maxWaitTimeMS ^ (this.maxWaitTimeMS >>> 32)))) * 31) + ((int) (this.maxConnectionLifeTimeMS ^ (this.maxConnectionLifeTimeMS >>> 32)))) * 31) + ((int) (this.maxConnectionIdleTimeMS ^ (this.maxConnectionIdleTimeMS >>> 32)))) * 31) + ((int) (this.maintenanceInitialDelayMS ^ (this.maintenanceInitialDelayMS >>> 32)))) * 31) + ((int) (this.maintenanceFrequencyMS ^ (this.maintenanceFrequencyMS >>> 32)));
    }

    public String toString() {
        return "ConnectionPoolSettings{maxSize=" + this.maxSize + ", minSize=" + this.minSize + ", maxWaitQueueSize=" + this.maxWaitQueueSize + ", maxWaitTimeMS=" + this.maxWaitTimeMS + ", maxConnectionLifeTimeMS=" + this.maxConnectionLifeTimeMS + ", maxConnectionIdleTimeMS=" + this.maxConnectionIdleTimeMS + ", maintenanceInitialDelayMS=" + this.maintenanceInitialDelayMS + ", maintenanceFrequencyMS=" + this.maintenanceFrequencyMS + '}';
    }

    ConnectionPoolSettings(Builder builder) {
        boolean z = true;
        Assertions.isTrue("maxSize > 0", builder.maxSize > 0);
        Assertions.isTrue("minSize >= 0", builder.minSize >= 0);
        Assertions.isTrue("maxWaitQueueSize >= 0", builder.maxWaitQueueSize >= 0);
        Assertions.isTrue("maxConnectionLifeTime >= 0", builder.maxConnectionLifeTimeMS >= 0);
        Assertions.isTrue("maxConnectionIdleTime >= 0", builder.maxConnectionIdleTimeMS >= 0);
        Assertions.isTrue("sizeMaintenanceFrequency >= 0", builder.maintenanceFrequencyMS >= 0);
        Assertions.isTrue("maxSize >= minSize", builder.maxSize < builder.minSize ? false : z);
        this.maxSize = builder.maxSize;
        this.minSize = builder.minSize;
        this.maxWaitQueueSize = builder.maxWaitQueueSize;
        this.maxWaitTimeMS = builder.maxWaitTimeMS;
        this.maxConnectionLifeTimeMS = builder.maxConnectionLifeTimeMS;
        this.maxConnectionIdleTimeMS = builder.maxConnectionIdleTimeMS;
        this.maintenanceInitialDelayMS = builder.maintenanceInitialDelayMS;
        this.maintenanceFrequencyMS = builder.maintenanceFrequencyMS;
    }
}
