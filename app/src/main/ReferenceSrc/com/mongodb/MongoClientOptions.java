package com.mongodb;

import javax.net.SocketFactory;
import org.bson.util.annotations.Immutable;
@Immutable
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    /* synthetic */ MongoClientOptions(Builder x0, AnonymousClass1 x1) {
        this(x0);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

        static /* synthetic */ String access$100(Builder x0) {
            return x0.description;
        }

        static /* synthetic */ boolean access$1000(Builder x0) {
            return x0.autoConnectRetry;
        }

        static /* synthetic */ boolean access$1100(Builder x0) {
            return x0.socketKeepAlive;
        }

        static /* synthetic */ long access$1200(Builder x0) {
            return x0.maxAutoConnectRetryTime;
        }

        static /* synthetic */ ReadPreference access$1300(Builder x0) {
            return x0.readPreference;
        }

        static /* synthetic */ DBDecoderFactory access$1400(Builder x0) {
            return x0.dbDecoderFactory;
        }

        static /* synthetic */ DBEncoderFactory access$1500(Builder x0) {
            return x0.dbEncoderFactory;
        }

        static /* synthetic */ WriteConcern access$1600(Builder x0) {
            return x0.writeConcern;
        }

        static /* synthetic */ SocketFactory access$1700(Builder x0) {
            return x0.socketFactory;
        }

        static /* synthetic */ boolean access$1800(Builder x0) {
            return x0.cursorFinalizerEnabled;
        }

        static /* synthetic */ boolean access$1900(Builder x0) {
            return x0.alwaysUseMBeans;
        }

        static /* synthetic */ int access$200(Builder x0) {
            return x0.minConnectionsPerHost;
        }

        static /* synthetic */ int access$2000(Builder x0) {
            return x0.heartbeatFrequency;
        }

        static /* synthetic */ int access$2100(Builder x0) {
            return x0.heartbeatConnectRetryFrequency;
        }

        static /* synthetic */ int access$2200(Builder x0) {
            return x0.heartbeatConnectTimeout;
        }

        static /* synthetic */ int access$2300(Builder x0) {
            return x0.heartbeatSocketTimeout;
        }

        static /* synthetic */ int access$2400(Builder x0) {
            return x0.heartbeatThreadCount;
        }

        static /* synthetic */ int access$2500(Builder x0) {
            return x0.acceptableLatencyDifference;
        }

        static /* synthetic */ String access$2600(Builder x0) {
            return x0.requiredReplicaSetName;
        }

        static /* synthetic */ int access$300(Builder x0) {
            return x0.connectionsPerHost;
        }

        static /* synthetic */ int access$400(Builder x0) {
            return x0.threadsAllowedToBlockForConnectionMultiplier;
        }

        static /* synthetic */ int access$500(Builder x0) {
            return x0.maxWaitTime;
        }

        static /* synthetic */ int access$600(Builder x0) {
            return x0.maxConnectionIdleTime;
        }

        static /* synthetic */ int access$700(Builder x0) {
            return x0.maxConnectionLifeTime;
        }

        static /* synthetic */ int access$800(Builder x0) {
            return x0.connectTimeout;
        }

        static /* synthetic */ int access$900(Builder x0) {
            return x0.socketTimeout;
        }

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
            return new MongoClientOptions(this, null);
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
        this.description = Builder.access$100(builder);
        this.minConnectionsPerHost = Builder.access$200(builder);
        this.connectionsPerHost = Builder.access$300(builder);
        this.threadsAllowedToBlockForConnectionMultiplier = Builder.access$400(builder);
        this.maxWaitTime = Builder.access$500(builder);
        this.maxConnectionIdleTime = Builder.access$600(builder);
        this.maxConnectionLifeTime = Builder.access$700(builder);
        this.connectTimeout = Builder.access$800(builder);
        this.socketTimeout = Builder.access$900(builder);
        this.autoConnectRetry = Builder.access$1000(builder);
        this.socketKeepAlive = Builder.access$1100(builder);
        this.maxAutoConnectRetryTime = Builder.access$1200(builder);
        this.readPreference = Builder.access$1300(builder);
        this.dbDecoderFactory = Builder.access$1400(builder);
        this.dbEncoderFactory = Builder.access$1500(builder);
        this.writeConcern = Builder.access$1600(builder);
        this.socketFactory = Builder.access$1700(builder);
        this.cursorFinalizerEnabled = Builder.access$1800(builder);
        this.alwaysUseMBeans = Builder.access$1900(builder);
        this.heartbeatFrequency = Builder.access$2000(builder);
        this.heartbeatConnectRetryFrequency = Builder.access$2100(builder);
        this.heartbeatConnectTimeout = Builder.access$2200(builder);
        this.heartbeatSocketTimeout = Builder.access$2300(builder);
        this.heartbeatThreadCount = Builder.access$2400(builder);
        this.acceptableLatencyDifference = Builder.access$2500(builder);
        this.requiredReplicaSetName = Builder.access$2600(builder);
    }
}
