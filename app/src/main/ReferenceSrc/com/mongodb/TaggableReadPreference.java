package com.mongodb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class TaggableReadPreference extends ReadPreference {
    private static final List<DBObject> EMPTY = new ArrayList();
    final List<DBObject> _tags;

    abstract List<ServerDescription> getServers(ClusterDescription clusterDescription);

    abstract List<ServerDescription> getServersForTags(ClusterDescription clusterDescription, Tags tags);

    TaggableReadPreference() {
        this._tags = EMPTY;
    }

    TaggableReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
        if (firstTagSet == null) {
            throw new IllegalArgumentException("Must have at least one tag set");
        }
        this._tags = new ArrayList();
        this._tags.add(firstTagSet);
        Collections.addAll(this._tags, remainingTagSets);
    }

    @Override // com.mongodb.ReadPreference
    public boolean isSlaveOk() {
        return true;
    }

    @Override // com.mongodb.ReadPreference
    public DBObject toDBObject() {
        DBObject readPrefObject = new BasicDBObject("mode", getName());
        if (!this._tags.isEmpty()) {
            readPrefObject.put("tags", this._tags);
        }
        return readPrefObject;
    }

    public List<DBObject> getTagSets() {
        List<DBObject> tags = new ArrayList<>();
        for (DBObject tagSet : this._tags) {
            tags.add(tagSet);
        }
        return tags;
    }

    public String toString() {
        return getName() + printTags();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TaggableReadPreference that = (TaggableReadPreference) o;
        return this._tags.equals(that._tags);
    }

    public int hashCode() {
        int result = this._tags.hashCode();
        return (result * 31) + getName().hashCode();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.mongodb.ReadPreference
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        if (this._tags.isEmpty()) {
            return getServers(clusterDescription);
        }
        for (DBObject curTagSet : this._tags) {
            Tags tags = getTagsFromDBObject(curTagSet);
            List<ServerDescription> taggedServers = getServersForTags(clusterDescription, tags);
            if (!taggedServers.isEmpty()) {
                return taggedServers;
            }
        }
        return Collections.emptyList();
    }

    String printTags() {
        return this._tags.isEmpty() ? "" : " : " + new BasicDBObject("tags", this._tags);
    }

    private static Tags getTagsFromDBObject(DBObject curTagSet) {
        Tags tags = new Tags();
        for (String key : curTagSet.keySet()) {
            tags.append(key, curTagSet.get(key).toString());
        }
        return tags;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class SecondaryReadPreference extends TaggableReadPreference {
        public SecondaryReadPreference() {
        }

        public SecondaryReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
            super(firstTagSet, remainingTagSets);
        }

        @Override // com.mongodb.ReadPreference
        public String getName() {
            return "secondary";
        }

        @Override // com.mongodb.TaggableReadPreference
        List<ServerDescription> getServers(ClusterDescription clusterDescription) {
            return clusterDescription.getSecondaries();
        }

        @Override // com.mongodb.TaggableReadPreference
        List<ServerDescription> getServersForTags(ClusterDescription clusterDescription, Tags tags) {
            return clusterDescription.getSecondaries(tags);
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class SecondaryPreferredReadPreference extends SecondaryReadPreference {
        public SecondaryPreferredReadPreference() {
        }

        public SecondaryPreferredReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
            super(firstTagSet, remainingTagSets);
        }

        @Override // com.mongodb.TaggableReadPreference.SecondaryReadPreference, com.mongodb.ReadPreference
        public String getName() {
            return "secondaryPreferred";
        }

        @Override // com.mongodb.TaggableReadPreference, com.mongodb.ReadPreference
        List<ServerDescription> choose(ClusterDescription clusterDescription) {
            List<ServerDescription> servers = super.choose(clusterDescription);
            return !servers.isEmpty() ? servers : clusterDescription.getPrimaries();
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class NearestReadPreference extends TaggableReadPreference {
        public NearestReadPreference() {
        }

        public NearestReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
            super(firstTagSet, remainingTagSets);
        }

        @Override // com.mongodb.ReadPreference
        public String getName() {
            return "nearest";
        }

        @Override // com.mongodb.TaggableReadPreference
        List<ServerDescription> getServers(ClusterDescription clusterDescription) {
            return clusterDescription.getAnyPrimaryOrSecondary();
        }

        @Override // com.mongodb.TaggableReadPreference
        List<ServerDescription> getServersForTags(ClusterDescription clusterDescription, Tags tags) {
            return clusterDescription.getAnyPrimaryOrSecondary(tags);
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class PrimaryPreferredReadPreference extends SecondaryReadPreference {
        public PrimaryPreferredReadPreference() {
        }

        public PrimaryPreferredReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
            super(firstTagSet, remainingTagSets);
        }

        @Override // com.mongodb.TaggableReadPreference.SecondaryReadPreference, com.mongodb.ReadPreference
        public String getName() {
            return "primaryPreferred";
        }

        @Override // com.mongodb.TaggableReadPreference, com.mongodb.ReadPreference
        List<ServerDescription> choose(ClusterDescription clusterDescription) {
            List<ServerDescription> servers = clusterDescription.getPrimaries();
            return !servers.isEmpty() ? servers : super.choose(clusterDescription);
        }
    }
}
