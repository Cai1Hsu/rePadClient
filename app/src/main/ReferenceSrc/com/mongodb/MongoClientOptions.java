package com.mongodb;

import javax.net.SocketFactory;
import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: classes.dex */
public class MongoClientOptions {
    private final int acceptableLatencyDifference;
    private final boolean alwaysUseMBeans;
    private final boolean autoConnectRetry;
    private final int connectTimeout;
    private final int connectionsPerHost;
    private final boolean cursorFinalizerEnabled;
    private final DBDecoderFactory dbDecoderFactory;
    private final DBEncoderFactory dbEncoderFactory;
    private final String description;
    private final int heartbeatConnectRetryFrequency;
    private final int heartbeatConnectTimeout;
    private final int heartbeatFrequency;
    private final int heartbeatSocketTimeout;
    private final int heartbeatThreadCount;
    private final long maxAutoConnectRetryTime;
    private final int maxConnectionIdleTime;
    private final int maxConnectionLifeTime;
    private final int maxWaitTime;
    private final int minConnectionsPerHost;
    private final ReadPreference readPreference;
    private final String requiredReplicaSetName;
    private final SocketFactory socketFactory;
    private final boolean socketKeepAlive;
    private final int socketTimeout;
    private final int threadsAllowedToBlockForConnectionMultiplier;
    private final WriteConcern writeConcern;

    /* loaded from: classes.dex */
    public static class Builder {
        private String description;
        private int heartbeatThreadCount;
        private int maxConnectionIdleTime;
        private int maxConnectionLifeTime;
        private int minConnectionsPerHost;
        private String requiredReplicaSetName;
        private int connectionsPerHost = 100;
        private int threadsAllowedToBlockForConnectionMultiplier = 5;
        private int maxWaitTime = 120000;
        private int connectTimeout = 10000;
        private int socketTimeout = 0;
        private boolean socketKeepAlive = false;
        private boolean autoConnectRetry = false;
        private long maxAutoConnectRetryTime = 0;
        private ReadPreference readPreference = ReadPreference.primary();
        private DBDecoderFactory dbDecoderFactory = DefaultDBDecoder.FACTORY;
        private DBEncoderFactory dbEncoderFactory = DefaultDBEncoder.FACTORY;
        private WriteConcern writeConcern = WriteConcern.ACKNOWLEDGED;
        private SocketFactory socketFactory = SocketFactory.getDefault();
        private boolean cursorFinalizerEnabled = true;
        private boolean alwaysUseMBeans = false;
        private int heartbeatFrequency = Integer.parseInt(System.getProperty("com.mongodb.updaterIntervalMS", "5000"));
        private int heartbeatConnectRetryFrequency = Integer.parseInt(System.getProperty("com.mongodb.updaterIntervalNoMasterMS", "10"));
        private int heartbeatConnectTimeout = Integer.parseInt(System.getProperty("com.mongodb.updaterConnectTimeoutMS", "20000"));
        private int heartbeatSocketTimeout = Integer.parseInt(System.getProperty("com.mongodb.updaterSocketTimeoutMS", "20000"));
        private int acceptableLatencyDifference = Integer.parseInt(System.getProperty("com.mongodb.slaveAcceptableLatencyMS", "15"));

        public Builder heartbeatFrequency(int heartbeatFrequency) {
            if (heartbeatFrequency < 1) {
                throw new IllegalArgumentException("heartbeatFrequency must be greater than 0");
            }
            this.heartbeatFrequency = heartbeatFrequency;
            return this;
        }

        public Builder heartbeatConnectRetryFrequency(int heartbeatConnectRetryFrequency) {
            if (heartbeatConnectRetryFrequency < 1) {
                throw new IllegalArgumentException("heartbeatConnectRetryFrequency must be greater than 0");
            }
            this.heartbeatConnectRetryFrequency = heartbeatConnectRetryFrequency;
            return this;
        }

        public Builder heartbeatConnectTimeout(int heartbeatConnectTimeout) {
            if (heartbeatConnectTimeout < 0) {
                throw new IllegalArgumentException("heartbeatConnectTimeout must be greater than or equal to 0");
            }
            this.heartbeatConnectTimeout = heartbeatConnectTimeout;
            return this;
        }

        public Builder heartbeatSocketTimeout(int heartbeatSocketTimeout) {
            if (heartbeatSocketTimeout < 0) {
                throw new IllegalArgumentException("heartbeatSocketTimeout must be greater than or equal to 0");
            }
            this.heartbeatSocketTimeout = heartbeatSocketTimeout;
            return this;
        }

        public Builder heartbeatThreadCount(int heartbeatThreadCount) {
            if (heartbeatThreadCount < 1) {
                throw new IllegalArgumentException("heartbeatThreadCount must be greater than 0");
            }
            this.heartbeatThreadCount = heartbeatThreadCount;
            return this;
        }

        public Builder acceptableLatencyDifference(int acceptableLatencyDifference) {
            if (acceptableLatencyDifference < 0) {
                throw new IllegalArgumentException("acceptableLatencyDifference must be greater than or equal to 0");
            }
            this.acceptableLatencyDifference = acceptableLatencyDifference;
            return this;
        }

        public Builder description(String description) {
            this.description = description;
            return this;
        }

        public Builder minConnectionsPerHost(int minConnectionsPerHost) {
            if (minConnectionsPerHost < 0) {
                throw new IllegalArgumentException("Minimum value is 0");
            }
            this.minConnectionsPerHost = minConnectionsPerHost;
            return this;
        }

        public Builder connectionsPerHost(int connectionsPerHost) {
            if (connectionsPerHost < 1) {
                throw new IllegalArgumentException("Minimum value is 1");
            }
            this.connectionsPerHost = connectionsPerHost;
            return this;
        }

        public Builder threadsAllowedToBlockForConnectionMultiplier(int threadsAllowedToBlockForConnectionMultiplier) {
            if (threadsAllowedToBlockForConnectionMultiplier < 1) {
                throw new IllegalArgumentException("Minimum value is 1");
            }
            this.threadsAllowedToBlockForConnectionMultiplier = threadsAllowedToBlockForConnectionMultiplier;
            return this;
        }

        public Builder maxWaitTime(int maxWaitTime) {
            if (maxWaitTime < 0) {
                throw new IllegalArgumentException("Minimum value is 0");
            }
            this.maxWaitTime = maxWaitTime;
            return this;
        }

        public Builder maxConnectionIdleTime(int maxConnectionIdleTime) {
            if (maxConnectionIdleTime < 0) {
                throw new IllegalArgumentException("Minimum value is 0");
            }
            this.maxConnectionIdleTime = maxConnectionIdleTime;
            return this;
        }

        public Builder maxConnectionLifeTime(int maxConnectionLifeTime) {
            if (maxConnectionLifeTime < 0) {
                throw new IllegalArgumentException("Minimum value is 0");
            }
            this.maxConnectionLifeTime = maxConnectionLifeTime;
            return this;
        }

        public Builder connectTimeout(int connectTimeout) {
            if (connectTimeout < 0) {
                throw new IllegalArgumentException("Minimum value is 0");
            }
            this.connectTimeout = connectTimeout;
            return this;
        }

        public Builder socketTimeout(int socketTimeout) {
            if (socketTimeout < 0) {
                throw new IllegalArgumentException("Minimum value is 0");
            }
            this.socketTimeout = socketTimeout;
            return this;
        }

        public Builder socketKeepAlive(boolean socketKeepAlive) {
            this.socketKeepAlive = socketKeepAlive;
            return this;
        }

        @Deprecated
        public Builder autoConnectRetry(boolean autoConnectRetry) {
            this.autoConnectRetry = autoConnectRetry;
            return this;
        }

        @Deprecated
        public Builder maxAutoConnectRetryTime(long maxAutoConnectRetryTime) {
            if (maxAutoConnectRetryTime < 0) {
                throw new IllegalArgumentException("Minimum value is 0");
            }
            this.maxAutoConnectRetryTime = maxAutoConnectRetryTime;
            return this;
        }

        public Builder readPreference(ReadPreference readPreference) {
            if (readPreference == null) {
                throw new IllegalArgumentException("null is not a legal value");
            }
            this.readPreference = readPreference;
            return this;
        }

        public Builder dbDecoderFactory(DBDecoderFactory dbDecoderFactory) {
            if (dbDecoderFactory == null) {
                throw new IllegalArgumentException("null is not a legal value");
            }
            this.dbDecoderFactory = dbDecoderFactory;
            return this;
        }

        public Builder dbEncoderFactory(DBEncoderFactory dbEncoderFactory) {
            if (dbEncoderFactory == null) {
                throw new IllegalArgumentException("null is not a legal value");
            }
            this.dbEncoderFactory = dbEncoderFactory;
            return this;
        }

        public Builder writeConcern(WriteConcern writeConcern) {
            if (writeConcern == null) {
                throw new IllegalArgumentException("null is not a legal value");
            }
            this.writeConcern = writeConcern;
            return this;
        }

        public Builder socketFactory(SocketFactory socketFactory) {
            if (socketFactory == null) {
                throw new IllegalArgumentException("null is not a legal value");
            }
            this.socketFactory = socketFactory;
            return this;
        }

        public Builder cursorFinalizerEnabled(boolean cursorFinalizerEnabled) {
            this.cursorFinalizerEnabled = cursorFinalizerEnabled;
            return this;
        }

        public Builder alwaysUseMBeans(boolean alwaysUseMBeans) {
            this.alwaysUseMBeans = alwaysUseMBeans;
            return this;
        }

        public Builder requiredReplicaSetName(String requiredReplicaSetName) {
            this.requiredReplicaSetName = requiredReplicaSetName;
            return this;
        }

        public Builder legacyDefaults() {
            this.connectionsPerHost = 10;
            this.writeConcern = WriteConcern.NORMAL;
            return this;
        }

        public MongoClientOptions build() {
            return new MongoClientOptions(this);
        }
    }

    public static Builder builder() {
        return new Builder();
    }

    public String getDescription() {
        return this.description;
    }

    public int getMinConnectionsPerHost() {
        return this.minConnectionsPerHost;
    }

    public int getConnectionsPerHost() {
        return this.connectionsPerHost;
    }

    public int getThreadsAllowedToBlockForConnectionMultiplier() {
        return this.threadsAllowedToBlockForConnectionMultiplier;
    }

    public int getMaxWaitTime() {
        return this.maxWaitTime;
    }

    public int getMaxConnectionIdleTime() {
        return this.maxConnectionIdleTime;
    }

    public int getMaxConnectionLifeTime() {
        return this.maxConnectionLifeTime;
    }

    public int getConnectTimeout() {
        return this.connectTimeout;
    }

    public int getSocketTimeout() {
        return this.socketTimeout;
    }

    public boolean isSocketKeepAlive() {
        return this.socketKeepAlive;
    }

    @Deprecated
    public boolean isAutoConnectRetry() {
        return this.autoConnectRetry;
    }

    @Deprecated
    public long getMaxAutoConnectRetryTime() {
        return this.maxAutoConnectRetryTime;
    }

    public ReadPreference getReadPreference() {
        return this.readPreference;
    }

    public DBDecoderFactory getDbDecoderFactory() {
        return this.dbDecoderFactory;
    }

    public DBEncoderFactory getDbEncoderFactory() {
        return this.dbEncoderFactory;
    }

    public WriteConcern getWriteConcern() {
        return this.writeConcern;
    }

    public SocketFactory getSocketFactory() {
        return this.socketFactory;
    }

    public boolean isCursorFinalizerEnabled() {
        return this.cursorFinalizerEnabled;
    }

    public boolean isAlwaysUseMBeans() {
        return this.alwaysUseMBeans;
    }

    public int getHeartbeatFrequency() {
        return this.heartbeatFrequency;
    }

    public int getHeartbeatConnectRetryFrequency() {
        return this.heartbeatConnectRetryFrequency;
    }

    public int getHeartbeatConnectTimeout() {
        return this.heartbeatConnectTimeout;
    }

    public int getHeartbeatSocketTimeout() {
        return this.heartbeatSocketTimeout;
    }

    public int getHeartbeatThreadCount() {
        return this.heartbeatThreadCount;
    }

    public int getAcceptableLatencyDifference() {
        return this.acceptableLatencyDifference;
    }

    public String getRequiredReplicaSetName() {
        return this.requiredReplicaSetName;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MongoClientOptions that = (MongoClientOptions) o;
        if (this.acceptableLatencyDifference == that.acceptableLatencyDifference && this.alwaysUseMBeans == that.alwaysUseMBeans && this.autoConnectRetry == that.autoConnectRetry && this.connectTimeout == that.connectTimeout && this.connectionsPerHost == that.connectionsPerHost && this.cursorFinalizerEnabled == that.cursorFinalizerEnabled && this.heartbeatConnectRetryFrequency == that.heartbeatConnectRetryFrequency && this.heartbeatConnectTimeout == that.heartbeatConnectTimeout && this.heartbeatFrequency == that.heartbeatFrequency && this.heartbeatSocketTimeout == that.heartbeatSocketTimeout && this.heartbeatThreadCount == that.heartbeatThreadCount && this.maxAutoConnectRetryTime == that.maxAutoConnectRetryTime && this.maxConnectionIdleTime == that.maxConnectionIdleTime && this.maxConnectionLifeTime == that.maxConnectionLifeTime && this.maxWaitTime == that.maxWaitTime && this.minConnectionsPerHost == that.minConnectionsPerHost && this.socketKeepAlive == that.socketKeepAlive && this.socketTimeout == that.socketTimeout && this.threadsAllowedToBlockForConnectionMultiplier == that.threadsAllowedToBlockForConnectionMultiplier && this.dbDecoderFactory.equals(that.dbDecoderFactory) && this.dbEncoderFactory.equals(that.dbEncoderFactory)) {
            if (this.description == null ? that.description != null : !this.description.equals(that.description)) {
                return false;
            }
            if (this.readPreference.equals(that.readPreference) && this.socketFactory.getClass().equals(that.socketFactory.getClass()) && this.writeConcern.equals(that.writeConcern)) {
                if (this.requiredReplicaSetName != null) {
                    if (this.requiredReplicaSetName.equals(that.requiredReplicaSetName)) {
                        return true;
                    }
                } else if (that.requiredReplicaSetName == null) {
                    return true;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int i = 1;
        int i2 = 0;
        int result = this.description != null ? this.description.hashCode() : 0;
        int hashCode = ((((((((((((((((((((((((((((((((((result * 31) + this.minConnectionsPerHost) * 31) + this.connectionsPerHost) * 31) + this.threadsAllowedToBlockForConnectionMultiplier) * 31) + this.maxWaitTime) * 31) + this.maxConnectionIdleTime) * 31) + this.maxConnectionLifeTime) * 31) + this.connectTimeout) * 31) + this.socketTimeout) * 31) + (this.socketKeepAlive ? 1 : 0)) * 31) + (this.autoConnectRetry ? 1 : 0)) * 31) + ((int) (this.maxAutoConnectRetryTime ^ (this.maxAutoConnectRetryTime >>> 32)))) * 31) + this.readPreference.hashCode()) * 31) + this.dbDecoderFactory.hashCode()) * 31) + this.dbEncoderFactory.hashCode()) * 31) + this.writeConcern.hashCode()) * 31) + (this.socketFactory != null ? this.socketFactory.getClass().hashCode() : 0)) * 31) + (this.cursorFinalizerEnabled ? 1 : 0)) * 31;
        if (!this.alwaysUseMBeans) {
            i = 0;
        }
        int result2 = hashCode + i;
        int i3 = ((((((((((((result2 * 31) + this.heartbeatFrequency) * 31) + this.heartbeatConnectRetryFrequency) * 31) + this.heartbeatConnectTimeout) * 31) + this.heartbeatSocketTimeout) * 31) + this.heartbeatThreadCount) * 31) + this.acceptableLatencyDifference) * 31;
        if (this.requiredReplicaSetName != null) {
            i2 = this.requiredReplicaSetName.hashCode();
        }
        int result3 = i3 + i2;
        return result3;
    }

    public String toString() {
        return "MongoClientOptions{description='" + this.description + "', connectionsPerHost=" + this.connectionsPerHost + ", threadsAllowedToBlockForConnectionMultiplier=" + this.threadsAllowedToBlockForConnectionMultiplier + ", maxWaitTime=" + this.maxWaitTime + ", connectTimeout=" + this.connectTimeout + ", socketTimeout=" + this.socketTimeout + ", socketKeepAlive=" + this.socketKeepAlive + ", autoConnectRetry=" + this.autoConnectRetry + ", maxAutoConnectRetryTime=" + this.maxAutoConnectRetryTime + ", readPreference=" + this.readPreference + ", dbDecoderFactory=" + this.dbDecoderFactory + ", dbEncoderFactory=" + this.dbEncoderFactory + ", writeConcern=" + this.writeConcern + ", socketFactory=" + this.socketFactory + ", cursorFinalizerEnabled=" + this.cursorFinalizerEnabled + ", alwaysUseMBeans=" + this.alwaysUseMBeans + ", heartbeatFrequency=" + this.heartbeatFrequency + ", heartbeatConnectRetryFrequency=" + this.heartbeatConnectRetryFrequency + ", heartbeatConnectTimeout=" + this.heartbeatConnectTimeout + ", heartbeatSocketTimeout=" + this.heartbeatSocketTimeout + ", heartbeatThreadCount=" + this.heartbeatThreadCount + ", acceptableLatencyDifference=" + this.acceptableLatencyDifference + ", requiredReplicaSetName=" + this.requiredReplicaSetName + '}';
    }

    private MongoClientOptions(Builder builder) {
        this.description = builder.description;
        this.minConnectionsPerHost = builder.minConnectionsPerHost;
        this.connectionsPerHost = builder.connectionsPerHost;
        this.threadsAllowedToBlockForConnectionMultiplier = builder.threadsAllowedToBlockForConnectionMultiplier;
        this.maxWaitTime = builder.maxWaitTime;
        this.maxConnectionIdleTime = builder.maxConnectionIdleTime;
        this.maxConnectionLifeTime = builder.maxConnectionLifeTime;
        this.connectTimeout = builder.connectTimeout;
        this.socketTimeout = builder.socketTimeout;
        this.autoConnectRetry = builder.autoConnectRetry;
        this.socketKeepAlive = builder.socketKeepAlive;
        this.maxAutoConnectRetryTime = builder.maxAutoConnectRetryTime;
        this.readPreference = builder.readPreference;
        this.dbDecoderFactory = builder.dbDecoderFactory;
        this.dbEncoderFactory = builder.dbEncoderFactory;
        this.writeConcern = builder.writeConcern;
        this.socketFactory = builder.socketFactory;
        this.cursorFinalizerEnabled = builder.cursorFinalizerEnabled;
        this.alwaysUseMBeans = builder.alwaysUseMBeans;
        this.heartbeatFrequency = builder.heartbeatFrequency;
        this.heartbeatConnectRetryFrequency = builder.heartbeatConnectRetryFrequency;
        this.heartbeatConnectTimeout = builder.heartbeatConnectTimeout;
        this.heartbeatSocketTimeout = builder.heartbeatSocketTimeout;
        this.heartbeatThreadCount = builder.heartbeatThreadCount;
        this.acceptableLatencyDifference = builder.acceptableLatencyDifference;
        this.requiredReplicaSetName = builder.requiredReplicaSetName;
    }
}
