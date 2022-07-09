package com.mongodb;

import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: classes.dex */
final class MongoNamespace {
    public static final String COMMAND_COLLECTION_NAME = "$cmd";
    private static final String NAMESPACE_TEMPLATE = "%s.%s";
    private final String collectionName;
    private final String databaseName;

    public MongoNamespace(String databaseName, String collectionName) {
        if (databaseName == null) {
            throw new IllegalArgumentException("database name can not be null");
        }
        if (collectionName == null) {
            throw new IllegalArgumentException("Collection name can not be null");
        }
        this.databaseName = databaseName;
        this.collectionName = collectionName;
    }

    public String getDatabaseName() {
        return this.databaseName;
    }

    public String getCollectionName() {
        return this.collectionName;
    }

    public String getFullName() {
        return getDatabaseName() + "." + getCollectionName();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MongoNamespace that = (MongoNamespace) o;
        if (this.collectionName == null ? that.collectionName != null : !this.collectionName.equals(that.collectionName)) {
            return false;
        }
        if (this.databaseName != null) {
            if (this.databaseName.equals(that.databaseName)) {
                return true;
            }
        } else if (that.databaseName == null) {
            return true;
        }
        return false;
    }

    public String toString() {
        return this.databaseName + "." + this.collectionName;
    }

    public int hashCode() {
        int i = 0;
        int result = this.databaseName != null ? this.databaseName.hashCode() : 0;
        int i2 = result * 31;
        if (this.collectionName != null) {
            i = this.collectionName.hashCode();
        }
        int result2 = i2 + i;
        return result2;
    }

    public static String asNamespaceString(String databaseName, String collectionName) {
        return String.format(NAMESPACE_TEMPLATE, databaseName, collectionName);
    }
}
