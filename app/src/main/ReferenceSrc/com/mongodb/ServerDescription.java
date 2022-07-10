package com.mongodb;

import java.text.DecimalFormat;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import org.apache.http.cookie.ClientCookie;
import org.bson.util.Assertions;
import org.bson.util.annotations.Immutable;
@Immutable
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class ServerDescription {
    private static final int DEFAULT_MAX_DOCUMENT_SIZE = 16777216;
    private static final int DEFAULT_MAX_MESSAGE_SIZE = 33554432;
    private static final int DEFAULT_MAX_WRITE_BATCH_SIZE = 512;
    static final int MAX_DRIVER_WIRE_VERSION = 2;
    static final int MIN_DRIVER_WIRE_VERSION = 0;
    private final ServerAddress address;
    private final Set<String> arbiters;
    private final long averageLatencyNanos;
    private Throwable exception;
    private final Set<String> hosts;
    private final int maxDocumentSize;
    private final int maxMessageSize;
    private final int maxWireVersion;
    private final int maxWriteBatchSize;
    private final int minWireVersion;
    private final boolean ok;
    private final Set<String> passives;
    private final String primary;
    private final String setName;
    private final ServerConnectionState state;
    private final Tags tags;
    private final ServerType type;
    private final ServerVersion version;

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class Builder {
        private ServerAddress address;
        private long averageLatency;
        private Throwable exception;
        private boolean ok;
        private String primary;
        private String setName;
        private ServerConnectionState state;
        private ServerType type = ServerType.Unknown;
        private Set<String> hosts = Collections.emptySet();
        private Set<String> passives = Collections.emptySet();
        private Set<String> arbiters = Collections.emptySet();
        private int maxDocumentSize = 16777216;
        private int maxMessageSize = ServerDescription.DEFAULT_MAX_MESSAGE_SIZE;
        private int maxWriteBatchSize = 512;
        private Tags tags = Tags.freeze(new Tags());
        private ServerVersion version = new ServerVersion();
        private int minWireVersion = 0;
        private int maxWireVersion = 0;

        Builder() {
        }

        static /* synthetic */ ServerAddress access$000(Builder x0) {
            return x0.address;
        }

        static /* synthetic */ ServerType access$100(Builder x0) {
            return x0.type;
        }

        static /* synthetic */ int access$1000(Builder x0) {
            return x0.maxWriteBatchSize;
        }

        static /* synthetic */ Tags access$1100(Builder x0) {
            return x0.tags;
        }

        static /* synthetic */ String access$1200(Builder x0) {
            return x0.setName;
        }

        static /* synthetic */ long access$1300(Builder x0) {
            return x0.averageLatency;
        }

        static /* synthetic */ boolean access$1400(Builder x0) {
            return x0.ok;
        }

        static /* synthetic */ int access$1500(Builder x0) {
            return x0.minWireVersion;
        }

        static /* synthetic */ int access$1600(Builder x0) {
            return x0.maxWireVersion;
        }

        static /* synthetic */ Throwable access$1700(Builder x0) {
            return x0.exception;
        }

        static /* synthetic */ ServerConnectionState access$200(Builder x0) {
            return x0.state;
        }

        static /* synthetic */ ServerVersion access$300(Builder x0) {
            return x0.version;
        }

        static /* synthetic */ Set access$400(Builder x0) {
            return x0.hosts;
        }

        static /* synthetic */ Set access$500(Builder x0) {
            return x0.passives;
        }

        static /* synthetic */ Set access$600(Builder x0) {
            return x0.arbiters;
        }

        static /* synthetic */ String access$700(Builder x0) {
            return x0.primary;
        }

        static /* synthetic */ int access$800(Builder x0) {
            return x0.maxDocumentSize;
        }

        static /* synthetic */ int access$900(Builder x0) {
            return x0.maxMessageSize;
        }

        public Builder address(ServerAddress address) {
            this.address = address;
            return this;
        }

        public Builder type(ServerType type) {
            this.type = (ServerType) Assertions.notNull("type", type);
            return this;
        }

        public Builder hosts(Set<String> hosts) {
            this.hosts = hosts == null ? Collections.emptySet() : Collections.unmodifiableSet(new HashSet(hosts));
            return this;
        }

        public Builder passives(Set<String> passives) {
            this.passives = passives == null ? Collections.emptySet() : Collections.unmodifiableSet(new HashSet(passives));
            return this;
        }

        public Builder arbiters(Set<String> arbiters) {
            this.arbiters = arbiters == null ? Collections.emptySet() : Collections.unmodifiableSet(new HashSet(arbiters));
            return this;
        }

        public Builder primary(String primary) {
            this.primary = primary;
            return this;
        }

        public Builder maxDocumentSize(int maxBSONObjectSize) {
            this.maxDocumentSize = maxBSONObjectSize;
            return this;
        }

        public Builder maxMessageSize(int maxMessageSize) {
            this.maxMessageSize = maxMessageSize;
            return this;
        }

        public Builder maxWriteBatchSize(int maxWriteBatchSize) {
            this.maxWriteBatchSize = maxWriteBatchSize;
            return this;
        }

        public Builder tags(Tags tags) {
            this.tags = tags == null ? Tags.freeze(new Tags()) : Tags.freeze(tags);
            return this;
        }

        public Builder averageLatency(long averageLatency, TimeUnit timeUnit) {
            this.averageLatency = timeUnit.toNanos(averageLatency);
            return this;
        }

        public Builder setName(String setName) {
            this.setName = setName;
            return this;
        }

        public Builder ok(boolean ok) {
            this.ok = ok;
            return this;
        }

        public Builder state(ServerConnectionState state) {
            this.state = state;
            return this;
        }

        public Builder version(ServerVersion version) {
            Assertions.notNull(ClientCookie.VERSION_ATTR, version);
            this.version = version;
            return this;
        }

        public Builder minWireVersion(int minWireVersion) {
            this.minWireVersion = minWireVersion;
            return this;
        }

        public Builder maxWireVersion(int maxWireVersion) {
            this.maxWireVersion = maxWireVersion;
            return this;
        }

        public Builder exception(Throwable exception) {
            this.exception = exception;
            return this;
        }

        public ServerDescription build() {
            return new ServerDescription(this);
        }
    }

    public boolean isCompatibleWithDriver() {
        if (!this.ok) {
            return true;
        }
        return this.minWireVersion <= 2 && this.maxWireVersion >= 0;
    }

    public static int getDefaultMaxDocumentSize() {
        return 16777216;
    }

    public static int getDefaultMaxMessageSize() {
        return DEFAULT_MAX_MESSAGE_SIZE;
    }

    public static int getDefaultMinWireVersion() {
        return 0;
    }

    public static int getDefaultMaxWireVersion() {
        return 0;
    }

    public static int getDefaultMaxWriteBatchSize() {
        return 512;
    }

    public static Builder builder() {
        return new Builder();
    }

    public ServerAddress getAddress() {
        return this.address;
    }

    public boolean isReplicaSetMember() {
        return this.type == ServerType.ReplicaSetPrimary || this.type == ServerType.ReplicaSetSecondary || this.type == ServerType.ReplicaSetArbiter || this.type == ServerType.ReplicaSetOther || this.type == ServerType.ReplicaSetGhost;
    }

    public boolean isShardRouter() {
        return this.type == ServerType.ShardRouter;
    }

    public boolean isStandAlone() {
        return this.type == ServerType.StandAlone;
    }

    public boolean isPrimary() {
        return this.ok && (this.type == ServerType.ReplicaSetPrimary || this.type == ServerType.ShardRouter || this.type == ServerType.StandAlone);
    }

    public boolean isSecondary() {
        return this.ok && (this.type == ServerType.ReplicaSetSecondary || this.type == ServerType.ShardRouter || this.type == ServerType.StandAlone);
    }

    public Set<String> getHosts() {
        return this.hosts;
    }

    public Set<String> getPassives() {
        return this.passives;
    }

    public Set<String> getArbiters() {
        return this.arbiters;
    }

    public String getPrimary() {
        return this.primary;
    }

    public int getMaxDocumentSize() {
        return this.maxDocumentSize;
    }

    public int getMaxMessageSize() {
        return this.maxMessageSize;
    }

    public int getMaxWriteBatchSize() {
        return this.maxWriteBatchSize;
    }

    public Tags getTags() {
        return this.tags;
    }

    public int getMinWireVersion() {
        return this.minWireVersion;
    }

    public int getMaxWireVersion() {
        return this.maxWireVersion;
    }

    public boolean hasTags(Tags desiredTags) {
        if (!this.ok) {
            return false;
        }
        if (this.type == ServerType.StandAlone || this.type == ServerType.ShardRouter) {
            return true;
        }
        for (Map.Entry<String, String> tag : desiredTags.entrySet()) {
            if (!tag.getValue().equals(getTags().get((Object) tag.getKey()))) {
                return false;
            }
        }
        return true;
    }

    public String getSetName() {
        return this.setName;
    }

    public boolean isOk() {
        return this.ok;
    }

    public ServerConnectionState getState() {
        return this.state;
    }

    public ServerType getType() {
        return this.type;
    }

    public ClusterType getClusterType() {
        return this.type.getClusterType();
    }

    public ServerVersion getVersion() {
        return this.version;
    }

    public long getAverageLatencyNanos() {
        return this.averageLatencyNanos;
    }

    public Throwable getException() {
        return this.exception;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ServerDescription that = (ServerDescription) o;
        if (this.maxDocumentSize == that.maxDocumentSize && this.maxMessageSize == that.maxMessageSize && this.maxWriteBatchSize == that.maxWriteBatchSize && this.ok == that.ok && this.address.equals(that.address) && this.arbiters.equals(that.arbiters) && this.hosts.equals(that.hosts) && this.passives.equals(that.passives)) {
            if (this.primary == null ? that.primary != null : !this.primary.equals(that.primary)) {
                return false;
            }
            if (this.setName == null ? that.setName != null : !this.setName.equals(that.setName)) {
                return false;
            }
            if (this.state == that.state && this.tags.equals(that.tags) && this.type == that.type && this.version.equals(that.version) && this.minWireVersion == that.minWireVersion && this.maxWireVersion == that.maxWireVersion) {
                Class thisExceptionClass = this.exception != null ? this.exception.getClass() : null;
                Class thatExceptionClass = that.exception != null ? that.exception.getClass() : null;
                if (thisExceptionClass == null ? thatExceptionClass != null : !thisExceptionClass.equals(thatExceptionClass)) {
                    return false;
                }
                String thisExceptionMessage = this.exception != null ? this.exception.getMessage() : null;
                String thatExceptionMessage = that.exception != null ? that.exception.getMessage() : null;
                return thisExceptionMessage == null ? thatExceptionMessage == null : thisExceptionMessage.equals(thatExceptionMessage);
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int i = 0;
        int result = this.address.hashCode();
        int hashCode = ((((((((((((((((((((((((((((((((result * 31) + this.type.hashCode()) * 31) + this.hosts.hashCode()) * 31) + this.passives.hashCode()) * 31) + this.arbiters.hashCode()) * 31) + (this.primary != null ? this.primary.hashCode() : 0)) * 31) + this.maxDocumentSize) * 31) + this.maxMessageSize) * 31) + this.maxWriteBatchSize) * 31) + this.tags.hashCode()) * 31) + (this.setName != null ? this.setName.hashCode() : 0)) * 31) + (this.ok ? 1 : 0)) * 31) + this.state.hashCode()) * 31) + this.version.hashCode()) * 31) + this.minWireVersion) * 31) + this.maxWireVersion) * 31) + (this.exception == null ? 0 : this.exception.getClass().hashCode())) * 31;
        if (this.exception != null) {
            i = this.exception.getMessage().hashCode();
        }
        int result2 = hashCode + i;
        return result2;
    }

    public String toString() {
        return "ServerDescription{address=" + this.address + ", type=" + this.type + ", hosts=" + this.hosts + ", passives=" + this.passives + ", arbiters=" + this.arbiters + ", primary='" + this.primary + "', maxDocumentSize=" + this.maxDocumentSize + ", maxMessageSize=" + this.maxMessageSize + ", maxWriteBatchSize=" + this.maxWriteBatchSize + ", tags=" + this.tags + ", setName='" + this.setName + "', averageLatencyNanos=" + this.averageLatencyNanos + ", ok=" + this.ok + ", state=" + this.state + ", version=" + this.version + ", minWireVersion=" + this.minWireVersion + ", maxWireVersion=" + this.maxWireVersion + '}';
    }

    public String getShortDescription() {
        return "{address=" + this.address + ", type=" + this.type + (this.tags.isEmpty() ? "" : ", " + this.tags) + (this.state == ServerConnectionState.Connected ? ", averageLatency=" + getAverageLatencyFormattedInMilliseconds() + " ms" : "") + ", state=" + this.state + (this.exception == null ? "" : ", exception=" + translateExceptionToString()) + '}';
    }

    private String translateExceptionToString() {
        StringBuilder builder = new StringBuilder();
        builder.append("{");
        builder.append(this.exception);
        builder.append("}");
        for (Throwable cur = this.exception.getCause(); cur != null; cur = cur.getCause()) {
            builder.append(", caused by ");
            builder.append("{");
            builder.append(cur);
            builder.append("}");
        }
        return builder.toString();
    }

    private String getAverageLatencyFormattedInMilliseconds() {
        return new DecimalFormat("#0.0").format((this.averageLatencyNanos / 1000.0d) / 1000.0d);
    }

    ServerDescription(Builder builder) {
        this.address = (ServerAddress) Assertions.notNull("address", Builder.access$000(builder));
        this.type = (ServerType) Assertions.notNull("type", Builder.access$100(builder));
        this.state = (ServerConnectionState) Assertions.notNull("state", Builder.access$200(builder));
        this.version = (ServerVersion) Assertions.notNull(ClientCookie.VERSION_ATTR, Builder.access$300(builder));
        this.hosts = Builder.access$400(builder);
        this.passives = Builder.access$500(builder);
        this.arbiters = Builder.access$600(builder);
        this.primary = Builder.access$700(builder);
        this.maxDocumentSize = Builder.access$800(builder);
        this.maxMessageSize = Builder.access$900(builder);
        this.maxWriteBatchSize = Builder.access$1000(builder);
        this.tags = Builder.access$1100(builder);
        this.setName = Builder.access$1200(builder);
        this.averageLatencyNanos = Builder.access$1300(builder);
        this.ok = Builder.access$1400(builder);
        this.minWireVersion = Builder.access$1500(builder);
        this.maxWireVersion = Builder.access$1600(builder);
        this.exception = Builder.access$1700(builder);
    }
}
