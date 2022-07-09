package com.mongodb;

/* loaded from: classes.dex */
enum ServerType {
    StandAlone { // from class: com.mongodb.ServerType.1
        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.StandAlone;
        }
    },
    ReplicaSetPrimary { // from class: com.mongodb.ServerType.2
        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    },
    ReplicaSetSecondary { // from class: com.mongodb.ServerType.3
        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    },
    ReplicaSetArbiter { // from class: com.mongodb.ServerType.4
        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    },
    ReplicaSetOther { // from class: com.mongodb.ServerType.5
        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    },
    ReplicaSetGhost { // from class: com.mongodb.ServerType.6
        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    },
    ShardRouter { // from class: com.mongodb.ServerType.7
        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.Sharded;
        }
    },
    Unknown { // from class: com.mongodb.ServerType.8
        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.Unknown;
        }
    };

    public abstract ClusterType getClusterType();
}
