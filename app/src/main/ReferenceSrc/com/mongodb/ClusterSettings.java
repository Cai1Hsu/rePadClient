package com.mongodb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import org.bson.util.Assertions;
import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: classes.dex */
final class ClusterSettings {
    private final List<ServerAddress> hosts;
    private final ClusterConnectionMode mode;
    private final ClusterType requiredClusterType;
    private final String requiredReplicaSetName;

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: classes.dex */
    static final class Builder {
        private List<ServerAddress> hosts;
        private ClusterConnectionMode mode;
        private ClusterType requiredClusterType;
        private String requiredReplicaSetName;

        private Builder() {
            this.mode = ClusterConnectionMode.Multiple;
            this.requiredClusterType = ClusterType.Unknown;
        }

        public Builder hosts(List<ServerAddress> hosts) {
            Assertions.notNull("hosts", hosts);
            if (hosts.isEmpty()) {
                throw new IllegalArgumentException("hosts list may not be empty");
            }
            this.hosts = Collections.unmodifiableList(new ArrayList(new LinkedHashSet(hosts)));
            return this;
        }

        public Builder mode(ClusterConnectionMode mode) {
            this.mode = (ClusterConnectionMode) Assertions.notNull("mode", mode);
            return this;
        }

        public Builder requiredReplicaSetName(String requiredReplicaSetName) {
            this.requiredReplicaSetName = requiredReplicaSetName;
            return this;
        }

        public Builder requiredClusterType(ClusterType requiredClusterType) {
            this.requiredClusterType = (ClusterType) Assertions.notNull("requiredClusterType", requiredClusterType);
            return this;
        }

        public ClusterSettings build() {
            return new ClusterSettings(this);
        }
    }

    public List<ServerAddress> getHosts() {
        return this.hosts;
    }

    public ClusterConnectionMode getMode() {
        return this.mode;
    }

    public ClusterType getRequiredClusterType() {
        return this.requiredClusterType;
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
        ClusterSettings that = (ClusterSettings) o;
        if (this.hosts.equals(that.hosts) && this.mode == that.mode && this.requiredClusterType == that.requiredClusterType) {
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

    public int hashCode() {
        int result = this.hosts.hashCode();
        return (((((result * 31) + this.mode.hashCode()) * 31) + this.requiredClusterType.hashCode()) * 31) + (this.requiredReplicaSetName != null ? this.requiredReplicaSetName.hashCode() : 0);
    }

    public String toString() {
        return "{hosts=" + this.hosts + ", mode=" + this.mode + ", requiredClusterType=" + this.requiredClusterType + ", requiredReplicaSetName='" + this.requiredReplicaSetName + "'}";
    }

    public String getShortDescription() {
        return "{hosts=" + this.hosts + ", mode=" + this.mode + ", requiredClusterType=" + this.requiredClusterType + (this.requiredReplicaSetName == null ? "" : ", requiredReplicaSetName='" + this.requiredReplicaSetName + '\'') + '}';
    }

    private ClusterSettings(Builder builder) {
        Assertions.notNull("hosts", builder.hosts);
        Assertions.isTrueArgument("hosts size > 0", builder.hosts.size() > 0);
        if (builder.hosts.size() <= 1 || builder.requiredClusterType != ClusterType.StandAlone) {
            if (builder.mode != ClusterConnectionMode.Single || builder.hosts.size() <= 1) {
                if (builder.requiredReplicaSetName != null) {
                    if (builder.requiredClusterType == ClusterType.Unknown) {
                        builder.requiredClusterType = ClusterType.ReplicaSet;
                    } else if (builder.requiredClusterType != ClusterType.ReplicaSet) {
                        throw new IllegalArgumentException("When specifying a replica set name, only ClusterType.Unknown and ClusterType.ReplicaSet are valid.");
                    }
                }
                this.hosts = builder.hosts;
                this.mode = builder.mode;
                this.requiredReplicaSetName = builder.requiredReplicaSetName;
                this.requiredClusterType = builder.requiredClusterType;
                return;
            }
            throw new IllegalArgumentException("Can not directly connect to more than one server");
        }
        throw new IllegalArgumentException("Multiple hosts cannot be specified when using ClusterType.StandAlone.");
    }
}
