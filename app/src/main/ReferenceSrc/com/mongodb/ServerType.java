package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class ServerType extends Enum<ServerType> {
    public static final ServerType StandAlone = new AnonymousClass1("StandAlone", 0);
    public static final ServerType ReplicaSetPrimary = new AnonymousClass2("ReplicaSetPrimary", 1);
    public static final ServerType ReplicaSetSecondary = new AnonymousClass3("ReplicaSetSecondary", 2);
    public static final ServerType ReplicaSetArbiter = new AnonymousClass4("ReplicaSetArbiter", 3);
    public static final ServerType ReplicaSetOther = new AnonymousClass5("ReplicaSetOther", 4);
    public static final ServerType ReplicaSetGhost = new AnonymousClass6("ReplicaSetGhost", 5);
    public static final ServerType ShardRouter = new AnonymousClass7("ShardRouter", 6);
    public static final ServerType Unknown = new AnonymousClass8("Unknown", 7);
    private static final /* synthetic */ ServerType[] $VALUES = {StandAlone, ReplicaSetPrimary, ReplicaSetSecondary, ReplicaSetArbiter, ReplicaSetOther, ReplicaSetGhost, ShardRouter, Unknown};

    public abstract ClusterType getClusterType();

    private ServerType(String str, int i) {
        super(str, i);
    }

    /* synthetic */ ServerType(String x0, int x1, AnonymousClass1 x2) {
        this(x0, x1);
    }

    public static ServerType valueOf(String name) {
        return (ServerType) Enum.valueOf(ServerType.class, name);
    }

    public static ServerType[] values() {
        return (ServerType[]) $VALUES.clone();
    }

    /* renamed from: com.mongodb.ServerType$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass1 extends ServerType {
        AnonymousClass1(String str, int i) {
            super(str, i, null);
        }

        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.StandAlone;
        }
    }

    /* renamed from: com.mongodb.ServerType$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass2 extends ServerType {
        AnonymousClass2(String str, int i) {
            super(str, i, null);
        }

        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    }

    /* renamed from: com.mongodb.ServerType$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass3 extends ServerType {
        AnonymousClass3(String str, int i) {
            super(str, i, null);
        }

        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    }

    /* renamed from: com.mongodb.ServerType$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass4 extends ServerType {
        AnonymousClass4(String str, int i) {
            super(str, i, null);
        }

        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    }

    /* renamed from: com.mongodb.ServerType$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass5 extends ServerType {
        AnonymousClass5(String str, int i) {
            super(str, i, null);
        }

        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    }

    /* renamed from: com.mongodb.ServerType$6 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass6 extends ServerType {
        AnonymousClass6(String str, int i) {
            super(str, i, null);
        }

        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.ReplicaSet;
        }
    }

    /* renamed from: com.mongodb.ServerType$7 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass7 extends ServerType {
        AnonymousClass7(String str, int i) {
            super(str, i, null);
        }

        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.Sharded;
        }
    }

    /* renamed from: com.mongodb.ServerType$8 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass8 extends ServerType {
        AnonymousClass8(String str, int i) {
            super(str, i, null);
        }

        @Override // com.mongodb.ServerType
        public ClusterType getClusterType() {
            return ClusterType.Unknown;
        }
    }
}
