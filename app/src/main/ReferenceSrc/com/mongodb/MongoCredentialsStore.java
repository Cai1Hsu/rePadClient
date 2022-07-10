package com.mongodb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.bson.util.annotations.ThreadSafe;
@ThreadSafe
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class MongoCredentialsStore {
    private final Map<String, MongoCredential> credentialsMap = new HashMap();
    private volatile Set<String> allDatabasesWithCredentials = new HashSet();

    public MongoCredentialsStore() {
    }

    public MongoCredentialsStore(MongoCredential credentials) {
        if (credentials != null) {
            add(credentials);
        }
    }

    public MongoCredentialsStore(Iterable<MongoCredential> credentialsList) {
        if (credentialsList != null) {
            for (MongoCredential cur : credentialsList) {
                add(cur);
            }
        }
    }

    public synchronized void add(MongoCredential credentials) {
        MongoCredential existingCredentials = this.credentialsMap.get(credentials.getSource());
        if (existingCredentials != null) {
            if (!existingCredentials.equals(credentials)) {
                throw new IllegalArgumentException("Can't add more than one credentials for the same database");
            }
        } else {
            this.credentialsMap.put(credentials.getSource(), credentials);
            this.allDatabasesWithCredentials = new HashSet(this.allDatabasesWithCredentials);
            this.allDatabasesWithCredentials.add(credentials.getSource());
        }
    }

    public Set<String> getDatabases() {
        return Collections.unmodifiableSet(this.allDatabasesWithCredentials);
    }

    public synchronized MongoCredential get(String database) {
        return this.credentialsMap.get(database);
    }

    public synchronized List<MongoCredential> asList() {
        return new ArrayList(this.credentialsMap.values());
    }

    public synchronized boolean equals(Object o) {
        boolean z = true;
        synchronized (this) {
            if (this != o) {
                if (o != null) {
                    if (getClass() == o.getClass()) {
                        MongoCredentialsStore that = (MongoCredentialsStore) o;
                        if (!this.credentialsMap.equals(that.credentialsMap)) {
                            z = false;
                        }
                    }
                }
                z = false;
            }
        }
        return z;
    }

    public synchronized int hashCode() {
        return this.credentialsMap.hashCode();
    }

    public String toString() {
        return "{credentials=" + this.credentialsMap + '}';
    }
}
