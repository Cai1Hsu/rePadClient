package com.mongodb;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.bson.util.annotations.Immutable;
@Immutable
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class MongoAuthority {
    private final MongoCredentialsStore credentialsStore;
    private final List<ServerAddress> serverAddresses;
    private final Type type;

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    enum Type {
        Direct,
        Set
    }

    public static MongoAuthority direct(ServerAddress serverAddress) {
        return direct(serverAddress, (MongoCredential) null);
    }

    public static MongoAuthority direct(ServerAddress serverAddress, MongoCredential credentials) {
        return direct(serverAddress, new MongoCredentialsStore(credentials));
    }

    public static MongoAuthority direct(ServerAddress serverAddress, MongoCredentialsStore credentialsStore) {
        return new MongoAuthority(serverAddress, credentialsStore);
    }

    public static MongoAuthority dynamicSet(List<ServerAddress> serverAddresses) {
        return dynamicSet(serverAddresses, (MongoCredential) null);
    }

    public static MongoAuthority dynamicSet(List<ServerAddress> serverAddresses, MongoCredential credentials) {
        return dynamicSet(serverAddresses, new MongoCredentialsStore(credentials));
    }

    public static MongoAuthority dynamicSet(List<ServerAddress> serverAddresses, MongoCredentialsStore credentialsStore) {
        return new MongoAuthority(serverAddresses, Type.Set, credentialsStore);
    }

    private MongoAuthority(ServerAddress serverAddress, MongoCredentialsStore credentialsStore) {
        if (serverAddress == null) {
            throw new IllegalArgumentException("serverAddress can not be null");
        }
        if (credentialsStore == null) {
            throw new IllegalArgumentException("credentialsStore can not be null");
        }
        this.serverAddresses = Arrays.asList(serverAddress);
        this.credentialsStore = credentialsStore;
        this.type = Type.Direct;
    }

    private MongoAuthority(List<ServerAddress> serverAddresses, Type type, MongoCredentialsStore credentialsStore) {
        if (serverAddresses == null) {
            throw new IllegalArgumentException("serverAddresses can not be null");
        }
        if (credentialsStore == null) {
            throw new IllegalArgumentException("credentialsStore can not be null");
        }
        if (type == null) {
            throw new IllegalArgumentException("type can not be null");
        }
        if (type == Type.Direct) {
            throw new IllegalArgumentException("type can not be Direct with a list of server addresses");
        }
        this.type = type;
        this.serverAddresses = new ArrayList(serverAddresses);
        this.credentialsStore = credentialsStore;
    }

    public List<ServerAddress> getServerAddresses() {
        if (this.serverAddresses == null) {
            return null;
        }
        return Collections.unmodifiableList(this.serverAddresses);
    }

    public MongoCredentialsStore getCredentialsStore() {
        return this.credentialsStore;
    }

    public Type getType() {
        return this.type;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MongoAuthority that = (MongoAuthority) o;
        return this.credentialsStore.equals(that.credentialsStore) && this.serverAddresses.equals(that.serverAddresses) && this.type == that.type;
    }

    public int hashCode() {
        int result = this.credentialsStore.hashCode();
        return (((result * 31) + this.serverAddresses.hashCode()) * 31) + this.type.hashCode();
    }

    public String toString() {
        return "MongoAuthority{type=" + this.type + ", serverAddresses=" + this.serverAddresses + ", credentials=" + this.credentialsStore + '}';
    }
}
