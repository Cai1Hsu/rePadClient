package com.mongodb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import org.bson.util.Assertions;
import org.bson.util.annotations.Immutable;
@Immutable
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class ClusterDescription {
    private final Set<ServerDescription> all;
    private final ClusterConnectionMode connectionMode;
    private final ClusterType type;

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private interface Predicate {
        boolean apply(ServerDescription serverDescription);
    }

    public ClusterDescription(ClusterConnectionMode connectionMode, ClusterType type, List<ServerDescription> serverDescriptions) {
        Assertions.notNull("all", serverDescriptions);
        this.connectionMode = (ClusterConnectionMode) Assertions.notNull("connectionMode", connectionMode);
        this.type = (ClusterType) Assertions.notNull("type", type);
        Set<ServerDescription> serverDescriptionSet = new TreeSet<>(new AnonymousClass1());
        serverDescriptionSet.addAll(serverDescriptions);
        this.all = Collections.unmodifiableSet(serverDescriptionSet);
    }

    /* renamed from: com.mongodb.ClusterDescription$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements Comparator<ServerDescription> {
        AnonymousClass1() {
            ClusterDescription.this = r1;
        }

        public int compare(ServerDescription o1, ServerDescription o2) {
            return o1.getAddress().toString().compareTo(o2.getAddress().toString());
        }
    }

    public boolean isCompatibleWithDriver() {
        for (ServerDescription cur : this.all) {
            if (!cur.isCompatibleWithDriver()) {
                return false;
            }
        }
        return true;
    }

    public ClusterConnectionMode getConnectionMode() {
        return this.connectionMode;
    }

    public ClusterType getType() {
        return this.type;
    }

    public Set<ServerDescription> getAll() {
        return this.all;
    }

    public ServerDescription getByServerAddress(ServerAddress serverAddress) {
        for (ServerDescription cur : getAll()) {
            if (cur.getAddress().equals(serverAddress)) {
                return cur;
            }
        }
        return null;
    }

    /* renamed from: com.mongodb.ClusterDescription$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 implements Predicate {
        AnonymousClass2() {
            ClusterDescription.this = r1;
        }

        @Override // com.mongodb.ClusterDescription.Predicate
        public boolean apply(ServerDescription serverDescription) {
            return serverDescription.isPrimary();
        }
    }

    public List<ServerDescription> getPrimaries() {
        return getServersByPredicate(new AnonymousClass2());
    }

    /* renamed from: com.mongodb.ClusterDescription$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass3 implements Predicate {
        AnonymousClass3() {
            ClusterDescription.this = r1;
        }

        @Override // com.mongodb.ClusterDescription.Predicate
        public boolean apply(ServerDescription serverDescription) {
            return serverDescription.isSecondary();
        }
    }

    public List<ServerDescription> getSecondaries() {
        return getServersByPredicate(new AnonymousClass3());
    }

    /* renamed from: com.mongodb.ClusterDescription$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass4 implements Predicate {
        final /* synthetic */ Tags val$tags;

        AnonymousClass4(Tags tags) {
            ClusterDescription.this = r1;
            this.val$tags = tags;
        }

        @Override // com.mongodb.ClusterDescription.Predicate
        public boolean apply(ServerDescription serverDescription) {
            return serverDescription.isSecondary() && serverDescription.hasTags(this.val$tags);
        }
    }

    public List<ServerDescription> getSecondaries(Tags tags) {
        return getServersByPredicate(new AnonymousClass4(tags));
    }

    /* renamed from: com.mongodb.ClusterDescription$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass5 implements Predicate {
        AnonymousClass5() {
            ClusterDescription.this = r1;
        }

        @Override // com.mongodb.ClusterDescription.Predicate
        public boolean apply(ServerDescription serverDescription) {
            return serverDescription.isOk();
        }
    }

    public List<ServerDescription> getAny() {
        return getServersByPredicate(new AnonymousClass5());
    }

    /* renamed from: com.mongodb.ClusterDescription$6 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass6 implements Predicate {
        AnonymousClass6() {
            ClusterDescription.this = r1;
        }

        @Override // com.mongodb.ClusterDescription.Predicate
        public boolean apply(ServerDescription serverDescription) {
            return serverDescription.isPrimary() || serverDescription.isSecondary();
        }
    }

    public List<ServerDescription> getAnyPrimaryOrSecondary() {
        return getServersByPredicate(new AnonymousClass6());
    }

    /* renamed from: com.mongodb.ClusterDescription$7 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass7 implements Predicate {
        final /* synthetic */ Tags val$tags;

        AnonymousClass7(Tags tags) {
            ClusterDescription.this = r1;
            this.val$tags = tags;
        }

        @Override // com.mongodb.ClusterDescription.Predicate
        public boolean apply(ServerDescription serverDescription) {
            return (serverDescription.isPrimary() || serverDescription.isSecondary()) && serverDescription.hasTags(this.val$tags);
        }
    }

    public List<ServerDescription> getAnyPrimaryOrSecondary(Tags tags) {
        return getServersByPredicate(new AnonymousClass7(tags));
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClusterDescription that = (ClusterDescription) o;
        return this.all.equals(that.all) && this.connectionMode == that.connectionMode;
    }

    public int hashCode() {
        int result = this.all.hashCode();
        return (result * 31) + this.connectionMode.hashCode();
    }

    public String toString() {
        return "ClusterDescription{type=" + getType() + ", connectionMode=" + this.connectionMode + ", all=" + this.all + '}';
    }

    public String getShortDescription() {
        StringBuilder serverDescriptions = new StringBuilder();
        String delimiter = "";
        for (ServerDescription cur : this.all) {
            serverDescriptions.append(delimiter).append(cur.getShortDescription());
            delimiter = ", ";
        }
        return String.format("{type=%s, servers=[%s]", this.type, serverDescriptions);
    }

    private List<ServerDescription> getServersByPredicate(Predicate predicate) {
        List<ServerDescription> membersByTag = new ArrayList<>();
        for (ServerDescription cur : this.all) {
            if (predicate.apply(cur)) {
                membersByTag.add(cur);
            }
        }
        return membersByTag;
    }
}
