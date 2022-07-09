package com.mongodb;

import java.util.concurrent.TimeUnit;
import org.bson.util.Assertions;

/* loaded from: classes.dex */
class ServerSettings {
    private final long heartbeatConnectRetryFrequencyMS;
    private final long heartbeatFrequencyMS;
    private final SocketSettings heartbeatSocketSettings;

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: classes.dex */
    static class Builder {
        private long heartbeatFrequencyMS = 5000;
        private long heartbeatConnectRetryFrequencyMS = 10;
        private SocketSettings heartbeatSocketSettings = SocketSettings.builder().build();

        Builder() {
        }

        public Builder heartbeatFrequency(long heartbeatFrequency, TimeUnit timeUnit) {
            this.heartbeatFrequencyMS = TimeUnit.MILLISECONDS.convert(heartbeatFrequency, timeUnit);
            return this;
        }

        public Builder heartbeatConnectRetryFrequency(long heartbeatConnectRetryFrequency, TimeUnit timeUnit) {
            this.heartbeatConnectRetryFrequencyMS = TimeUnit.MILLISECONDS.convert(heartbeatConnectRetryFrequency, timeUnit);
            return this;
        }

        public Builder heartbeatSocketSettings(SocketSettings heartbeatSocketSettings) {
            this.heartbeatSocketSettings = (SocketSettings) Assertions.notNull("heartbeatSocketSettings", heartbeatSocketSettings);
            return this;
        }

        public ServerSettings build() {
            return new ServerSettings(this);
        }
    }

    public long getHeartbeatFrequency(TimeUnit timeUnit) {
        return timeUnit.convert(this.heartbeatFrequencyMS, TimeUnit.MILLISECONDS);
    }

    public long getHeartbeatConnectRetryFrequency(TimeUnit timeUnit) {
        return timeUnit.convert(this.heartbeatConnectRetryFrequencyMS, TimeUnit.MILLISECONDS);
    }

    public SocketSettings getHeartbeatSocketSettings() {
        return this.heartbeatSocketSettings;
    }

    ServerSettings(Builder builder) {
        this.heartbeatFrequencyMS = builder.heartbeatFrequencyMS;
        this.heartbeatConnectRetryFrequencyMS = builder.heartbeatConnectRetryFrequencyMS;
        this.heartbeatSocketSettings = builder.heartbeatSocketSettings;
    }
}
