package com.mongodb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import org.bson.util.Assertions;
import org.bson.util.annotations.Immutable;
@Immutable
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class ClusterSettings {
    private final List<ServerAddress> hosts;
    private final ClusterConnectionMode mode;
    private final ClusterType requiredClusterType;
    private final String requiredReplicaSetName;

    /* synthetic */ ClusterSettings(Builder x0, AnonymousClass1 x1) {
        this(x0);
    }

    public static Builder builder() {
        return new Builder(null);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static final class Builder {
        private List<ServerAddress> hosts;
        private ClusterConnectionMode mode;
        private ClusterType requiredClusterType;
        private String requiredReplicaSetName;

        /* synthetic */ Builder(AnonymousClass1 x0) {
            this();
        }

        static /* synthetic */ List access$200(Builder x0) {
            return x0.hosts;
        }

        static /* synthetic */ ClusterType access$300(Builder x0) {
            return x0.requiredClusterType;
        }

        static /* synthetic */ ClusterType access$302(Builder x0, ClusterType x1) {
            x0.requiredClusterType = x1;
            return x1;
        }

        static /* synthetic */ ClusterConnectionMode access$400(Builder x0) {
            return x0.mode;
        }

        static /* synthetic */ String access$500(Builder x0) {
            return x0.requiredReplicaSetName;
        }

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
            return new ClusterSettings(this, null);
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
        Assertions.notNull("hosts", Builder.access$200(builder));
        Assertions.isTrueArgument("hosts size > 0", Builder.access$200(builder).size() > 0);
        if (Builder.access$200(builder).size() > 1 && Builder.access$300(builder) == ClusterType.StandAlone) {
            throw new IllegalArgumentException("Multiple hosts cannot be specified when using ClusterType.StandAlone.");
        }
        if (Builder.access$400(builder) == ClusterConnectionMode.Single && Builder.access$200(builder).size() > 1) {
            throw new IllegalArgumentException("Can not directly connect to more than one server");
        }
        if (Builder.access$500(builder) != null) {
            if (Builder.access$300(builder) == ClusterType.Unknown) {
                Builder.access$302(builder, ClusterType.ReplicaSet);
            } else if (Builder.access$300(builder) != ClusterType.ReplicaSet) {
                throw new IllegalArgumentException("When specifying a replica set name, only ClusterType.Unknown and ClusterType.ReplicaSet are valid.");
            }
        }
        this.hosts = Builder.access$200(builder);
        this.mode = Builder.access$400(builder);
        this.requiredReplicaSetName = Builder.access$500(builder);
        this.requiredClusterType = Builder.access$300(builder);
    }
}
