package com.mongodb;

import javax.net.SocketFactory;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MongoOptions {
    int acceptableLatencyDifferenceMS;
    public boolean alwaysUseMBeans;
    @Deprecated
    public boolean autoConnectRetry;
    public int connectTimeout;
    public int connectionsPerHost;
    public boolean cursorFinalizerEnabled;
    public DBDecoderFactory dbDecoderFactory;
    public DBEncoderFactory dbEncoderFactory;
    public String description;
    public boolean fsync;
    int heartbeatConnectRetryFrequencyMS;
    int heartbeatConnectTimeoutMS;
    int heartbeatFrequencyMS;
    int heartbeatReadTimeoutMS;
    int heartbeatThreadCount;
    public boolean j;
    @Deprecated
    public long maxAutoConnectRetryTime;
    int maxConnectionIdleTime;
    int maxConnectionLifeTime;
    public int maxWaitTime;
    int minConnectionsPerHost;
    public ReadPreference readPreference;
    String requiredReplicaSetName;
    public boolean safe;
    @Deprecated
    public boolean slaveOk;
    public SocketFactory socketFactory;
    public boolean socketKeepAlive;
    public int socketTimeout;
    public int threadsAllowedToBlockForConnectionMultiplier;
    public int w;
    public WriteConcern writeConcern;
    public int wtimeout;

    @Deprecated
    public MongoOptions() {
        reset();
    }

    @Deprecated
    public MongoOptions(MongoClientOptions options) {
        this.connectionsPerHost = options.getConnectionsPerHost();
        this.threadsAllowedToBlockForConnectionMultiplier = options.getThreadsAllowedToBlockForConnectionMultiplier();
        this.maxWaitTime = options.getMaxWaitTime();
        this.connectTimeout = options.getConnectTimeout();
        this.socketTimeout = options.getSocketTimeout();
        this.socketKeepAlive = options.isSocketKeepAlive();
        this.autoConnectRetry = options.isAutoConnectRetry();
        this.maxAutoConnectRetryTime = options.getMaxAutoConnectRetryTime();
        this.readPreference = options.getReadPreference();
        this.dbDecoderFactory = options.getDbDecoderFactory();
        this.dbEncoderFactory = options.getDbEncoderFactory();
        this.socketFactory = options.getSocketFactory();
        this.description = options.getDescription();
        this.cursorFinalizerEnabled = options.isCursorFinalizerEnabled();
        this.writeConcern = options.getWriteConcern();
        this.slaveOk = false;
        this.alwaysUseMBeans = options.isAlwaysUseMBeans();
        this.minConnectionsPerHost = options.getMinConnectionsPerHost();
        this.maxConnectionIdleTime = options.getMaxConnectionIdleTime();
        this.maxConnectionLifeTime = options.getMaxConnectionLifeTime();
        this.heartbeatFrequencyMS = options.getHeartbeatFrequency();
        this.heartbeatConnectRetryFrequencyMS = options.getHeartbeatConnectRetryFrequency();
        this.heartbeatConnectTimeoutMS = options.getHeartbeatConnectTimeout();
        this.heartbeatReadTimeoutMS = options.getHeartbeatSocketTimeout();
        this.heartbeatThreadCount = options.getHeartbeatThreadCount();
        this.acceptableLatencyDifferenceMS = options.getAcceptableLatencyDifference();
        this.requiredReplicaSetName = options.getRequiredReplicaSetName();
    }

    public void reset() {
        this.connectionsPerHost = Bytes.CONNECTIONS_PER_HOST;
        this.threadsAllowedToBlockForConnectionMultiplier = 5;
        this.maxWaitTime = 120000;
        this.connectTimeout = 10000;
        this.socketTimeout = 0;
        this.socketKeepAlive = false;
        this.autoConnectRetry = false;
        this.maxAutoConnectRetryTime = 0L;
        this.slaveOk = false;
        this.readPreference = null;
        this.writeConcern = null;
        this.safe = false;
        this.w = 0;
        this.wtimeout = 0;
        this.fsync = false;
        this.j = false;
        this.dbDecoderFactory = DefaultDBDecoder.FACTORY;
        this.dbEncoderFactory = DefaultDBEncoder.FACTORY;
        this.socketFactory = SocketFactory.getDefault();
        this.description = null;
        this.cursorFinalizerEnabled = true;
        this.alwaysUseMBeans = false;
        this.minConnectionsPerHost = 0;
        this.maxConnectionIdleTime = 0;
        this.maxConnectionLifeTime = 0;
        this.heartbeatFrequencyMS = Integer.parseInt(System.getProperty("com.mongodb.updaterIntervalMS", "5000"));
        this.heartbeatConnectRetryFrequencyMS = Integer.parseInt(System.getProperty("com.mongodb.updaterIntervalNoMasterMS", "10"));
        this.heartbeatConnectTimeoutMS = Integer.parseInt(System.getProperty("com.mongodb.updaterConnectTimeoutMS", "20000"));
        this.heartbeatReadTimeoutMS = Integer.parseInt(System.getProperty("com.mongodb.updaterSocketTimeoutMS", "20000"));
        this.heartbeatThreadCount = 0;
        this.acceptableLatencyDifferenceMS = Integer.parseInt(System.getProperty("com.mongodb.slaveAcceptableLatencyMS", "15"));
        this.requiredReplicaSetName = null;
    }

    public MongoOptions copy() {
        MongoOptions m = new MongoOptions();
        m.connectionsPerHost = this.connectionsPerHost;
        m.threadsAllowedToBlockForConnectionMultiplier = this.threadsAllowedToBlockForConnectionMultiplier;
        m.maxWaitTime = this.maxWaitTime;
        m.connectTimeout = this.connectTimeout;
        m.socketTimeout = this.socketTimeout;
        m.socketKeepAlive = this.socketKeepAlive;
        m.autoConnectRetry = this.autoConnectRetry;
        m.maxAutoConnectRetryTime = this.maxAutoConnectRetryTime;
        m.slaveOk = this.slaveOk;
        m.readPreference = this.readPreference;
        m.writeConcern = this.writeConcern;
        m.safe = this.safe;
        m.w = this.w;
        m.wtimeout = this.wtimeout;
        m.fsync = this.fsync;
        m.j = this.j;
        m.dbDecoderFactory = this.dbDecoderFactory;
        m.dbEncoderFactory = this.dbEncoderFactory;
        m.socketFactory = this.socketFactory;
        m.description = this.description;
        m.cursorFinalizerEnabled = this.cursorFinalizerEnabled;
        m.alwaysUseMBeans = this.alwaysUseMBeans;
        m.minConnectionsPerHost = this.minConnectionsPerHost;
        m.maxConnectionIdleTime = this.maxConnectionIdleTime;
        m.maxConnectionLifeTime = this.maxConnectionLifeTime;
        m.heartbeatFrequencyMS = this.heartbeatFrequencyMS;
        m.heartbeatConnectRetryFrequencyMS = this.heartbeatConnectRetryFrequencyMS;
        m.heartbeatConnectTimeoutMS = this.heartbeatConnectTimeoutMS;
        m.heartbeatReadTimeoutMS = this.heartbeatReadTimeoutMS;
        m.heartbeatThreadCount = this.heartbeatThreadCount;
        m.acceptableLatencyDifferenceMS = this.acceptableLatencyDifferenceMS;
        m.requiredReplicaSetName = this.requiredReplicaSetName;
        return m;
    }

    public WriteConcern getWriteConcern() {
        if (this.writeConcern != null) {
            return this.writeConcern;
        }
        if (this.w != 0 || this.wtimeout != 0 || (this.fsync | this.j)) {
            return new WriteConcern(this.w, this.wtimeout, this.fsync, this.j);
        }
        if (this.safe) {
            return WriteConcern.SAFE;
        }
        return WriteConcern.NORMAL;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MongoOptions options = (MongoOptions) o;
        if (this.acceptableLatencyDifferenceMS == options.acceptableLatencyDifferenceMS && this.alwaysUseMBeans == options.alwaysUseMBeans && this.autoConnectRetry == options.autoConnectRetry && this.connectTimeout == options.connectTimeout && this.connectionsPerHost == options.connectionsPerHost && this.cursorFinalizerEnabled == options.cursorFinalizerEnabled && this.fsync == options.fsync && this.heartbeatConnectRetryFrequencyMS == options.heartbeatConnectRetryFrequencyMS && this.heartbeatConnectTimeoutMS == options.heartbeatConnectTimeoutMS && this.heartbeatFrequencyMS == options.heartbeatFrequencyMS && this.heartbeatReadTimeoutMS == options.heartbeatReadTimeoutMS && this.heartbeatThreadCount == options.heartbeatThreadCount && this.j == options.j && this.maxAutoConnectRetryTime == options.maxAutoConnectRetryTime && this.maxWaitTime == options.maxWaitTime && this.safe == options.safe && this.slaveOk == options.slaveOk && this.socketKeepAlive == options.socketKeepAlive && this.socketTimeout == options.socketTimeout && this.threadsAllowedToBlockForConnectionMultiplier == options.threadsAllowedToBlockForConnectionMultiplier && this.w == options.w && this.wtimeout == options.wtimeout && this.dbDecoderFactory.equals(options.dbDecoderFactory) && this.dbEncoderFactory.equals(options.dbEncoderFactory)) {
            if (this.description == null ? options.description != null : !this.description.equals(options.description)) {
                return false;
            }
            if (this.readPreference == null ? options.readPreference != null : !this.readPreference.equals(options.readPreference)) {
                return false;
            }
            if (!this.socketFactory.equals(options.socketFactory)) {
                return false;
            }
            if (this.writeConcern == null ? options.writeConcern != null : !this.writeConcern.equals(options.writeConcern)) {
                return false;
            }
            if (this.requiredReplicaSetName != null) {
                if (this.requiredReplicaSetName.equals(options.requiredReplicaSetName)) {
                    return true;
                }
            } else if (options.requiredReplicaSetName == null) {
                return true;
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int i = 1;
        int i2 = 0;
        int result = this.description != null ? this.description.hashCode() : 0;
        int hashCode = ((((((((((((((((((((((((((((((((((((((((result * 31) + this.connectionsPerHost) * 31) + this.threadsAllowedToBlockForConnectionMultiplier) * 31) + this.maxWaitTime) * 31) + this.connectTimeout) * 31) + this.socketTimeout) * 31) + (this.socketKeepAlive ? 1 : 0)) * 31) + (this.autoConnectRetry ? 1 : 0)) * 31) + ((int) (this.maxAutoConnectRetryTime ^ (this.maxAutoConnectRetryTime >>> 32)))) * 31) + (this.slaveOk ? 1 : 0)) * 31) + (this.readPreference != null ? this.readPreference.hashCode() : 0)) * 31) + this.dbDecoderFactory.hashCode()) * 31) + this.dbEncoderFactory.hashCode()) * 31) + (this.safe ? 1 : 0)) * 31) + this.w) * 31) + this.wtimeout) * 31) + (this.fsync ? 1 : 0)) * 31) + (this.j ? 1 : 0)) * 31) + this.socketFactory.hashCode()) * 31) + (this.cursorFinalizerEnabled ? 1 : 0)) * 31) + (this.writeConcern != null ? this.writeConcern.hashCode() : 0)) * 31;
        if (!this.alwaysUseMBeans) {
            i = 0;
        }
        int result2 = hashCode + i;
        int i3 = ((((((((((((result2 * 31) + this.heartbeatFrequencyMS) * 31) + this.heartbeatConnectRetryFrequencyMS) * 31) + this.heartbeatConnectTimeoutMS) * 31) + this.heartbeatReadTimeoutMS) * 31) + this.acceptableLatencyDifferenceMS) * 31) + this.heartbeatThreadCount) * 31;
        if (this.requiredReplicaSetName != null) {
            i2 = this.requiredReplicaSetName.hashCode();
        }
        int result3 = i3 + i2;
        return result3;
    }

    public synchronized String getDescription() {
        return this.description;
    }

    public synchronized void setDescription(String desc) {
        this.description = desc;
    }

    public synchronized int getConnectionsPerHost() {
        return this.connectionsPerHost;
    }

    public synchronized void setConnectionsPerHost(int connections) {
        this.connectionsPerHost = connections;
    }

    public synchronized int getThreadsAllowedToBlockForConnectionMultiplier() {
        return this.threadsAllowedToBlockForConnectionMultiplier;
    }

    public synchronized void setThreadsAllowedToBlockForConnectionMultiplier(int threads) {
        this.threadsAllowedToBlockForConnectionMultiplier = threads;
    }

    public synchronized int getMaxWaitTime() {
        return this.maxWaitTime;
    }

    public synchronized void setMaxWaitTime(int timeMS) {
        this.maxWaitTime = timeMS;
    }

    public synchronized int getConnectTimeout() {
        return this.connectTimeout;
    }

    public synchronized void setConnectTimeout(int timeoutMS) {
        this.connectTimeout = timeoutMS;
    }

    public synchronized int getSocketTimeout() {
        return this.socketTimeout;
    }

    public synchronized void setSocketTimeout(int timeoutMS) {
        this.socketTimeout = timeoutMS;
    }

    public synchronized boolean isSocketKeepAlive() {
        return this.socketKeepAlive;
    }

    public synchronized void setSocketKeepAlive(boolean keepAlive) {
        this.socketKeepAlive = keepAlive;
    }

    @Deprecated
    public synchronized boolean isAutoConnectRetry() {
        return this.autoConnectRetry;
    }

    @Deprecated
    public synchronized void setAutoConnectRetry(boolean retry) {
        this.autoConnectRetry = retry;
    }

    @Deprecated
    public synchronized long getMaxAutoConnectRetryTime() {
        return this.maxAutoConnectRetryTime;
    }

    @Deprecated
    public synchronized void setMaxAutoConnectRetryTime(long retryTimeMS) {
        this.maxAutoConnectRetryTime = retryTimeMS;
    }

    public synchronized DBDecoderFactory getDbDecoderFactory() {
        return this.dbDecoderFactory;
    }

    public synchronized void setDbDecoderFactory(DBDecoderFactory factory) {
        this.dbDecoderFactory = factory;
    }

    public synchronized DBEncoderFactory getDbEncoderFactory() {
        return this.dbEncoderFactory;
    }

    public synchronized void setDbEncoderFactory(DBEncoderFactory factory) {
        this.dbEncoderFactory = factory;
    }

    public synchronized boolean isSafe() {
        return this.safe;
    }

    public synchronized void setSafe(boolean isSafe) {
        this.safe = isSafe;
    }

    public synchronized int getW() {
        return this.w;
    }

    public synchronized void setW(int val) {
        this.w = val;
    }

    public synchronized int getWtimeout() {
        return this.wtimeout;
    }

    public synchronized void setWtimeout(int timeoutMS) {
        this.wtimeout = timeoutMS;
    }

    public synchronized boolean isFsync() {
        return this.fsync;
    }

    public synchronized void setFsync(boolean sync) {
        this.fsync = sync;
    }

    public synchronized boolean isJ() {
        return this.j;
    }

    public synchronized void setJ(boolean safe) {
        this.j = safe;
    }

    public void setWriteConcern(WriteConcern writeConcern) {
        this.writeConcern = writeConcern;
    }

    public synchronized SocketFactory getSocketFactory() {
        return this.socketFactory;
    }

    public synchronized void setSocketFactory(SocketFactory factory) {
        this.socketFactory = factory;
    }

    public ReadPreference getReadPreference() {
        return this.readPreference;
    }

    public void setReadPreference(ReadPreference readPreference) {
        this.readPreference = readPreference;
    }

    public boolean isCursorFinalizerEnabled() {
        return this.cursorFinalizerEnabled;
    }

    public void setCursorFinalizerEnabled(boolean cursorFinalizerEnabled) {
        this.cursorFinalizerEnabled = cursorFinalizerEnabled;
    }

    public boolean isAlwaysUseMBeans() {
        return this.alwaysUseMBeans;
    }

    public void setAlwaysUseMBeans(boolean alwaysUseMBeans) {
        this.alwaysUseMBeans = alwaysUseMBeans;
    }

    public String getRequiredReplicaSetName() {
        return this.requiredReplicaSetName;
    }

    public String toString() {
        return "MongoOptions{description='" + this.description + "', connectionsPerHost=" + this.connectionsPerHost + ", threadsAllowedToBlockForConnectionMultiplier=" + this.threadsAllowedToBlockForConnectionMultiplier + ", maxWaitTime=" + this.maxWaitTime + ", connectTimeout=" + this.connectTimeout + ", socketTimeout=" + this.socketTimeout + ", socketKeepAlive=" + this.socketKeepAlive + ", autoConnectRetry=" + this.autoConnectRetry + ", maxAutoConnectRetryTime=" + this.maxAutoConnectRetryTime + ", slaveOk=" + this.slaveOk + ", readPreference=" + this.readPreference + ", dbDecoderFactory=" + this.dbDecoderFactory + ", dbEncoderFactory=" + this.dbEncoderFactory + ", safe=" + this.safe + ", w=" + this.w + ", wtimeout=" + this.wtimeout + ", fsync=" + this.fsync + ", j=" + this.j + ", socketFactory=" + this.socketFactory + ", cursorFinalizerEnabled=" + this.cursorFinalizerEnabled + ", writeConcern=" + this.writeConcern + ", alwaysUseMBeans=" + this.alwaysUseMBeans + ", requiredReplicaSetName=" + this.requiredReplicaSetName + '}';
    }
}
