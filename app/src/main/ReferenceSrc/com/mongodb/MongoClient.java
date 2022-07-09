package com.mongodb;

import com.mongodb.MongoClientOptions;
import java.net.UnknownHostException;
import java.util.List;

/* loaded from: classes.dex */
public class MongoClient extends Mongo {
    private final MongoClientOptions options;

    public MongoClient() throws UnknownHostException {
        this(new ServerAddress());
    }

    public MongoClient(String host) throws UnknownHostException {
        this(new ServerAddress(host));
    }

    public MongoClient(String host, MongoClientOptions options) throws UnknownHostException {
        this(new ServerAddress(host), options);
    }

    public MongoClient(String host, int port) throws UnknownHostException {
        this(new ServerAddress(host, port));
    }

    public MongoClient(ServerAddress addr) {
        this(addr, new MongoClientOptions.Builder().build());
    }

    public MongoClient(ServerAddress addr, List<MongoCredential> credentialsList) {
        this(addr, credentialsList, new MongoClientOptions.Builder().build());
    }

    public MongoClient(ServerAddress addr, MongoClientOptions options) {
        this(addr, (List<MongoCredential>) null, options);
    }

    public MongoClient(ServerAddress addr, List<MongoCredential> credentialsList, MongoClientOptions options) {
        super(MongoAuthority.direct(addr, new MongoCredentialsStore(credentialsList)), new MongoOptions(options));
        this.options = options;
    }

    public MongoClient(List<ServerAddress> seeds) {
        this(seeds, (List<MongoCredential>) null, new MongoClientOptions.Builder().build());
    }

    public MongoClient(List<ServerAddress> seeds, List<MongoCredential> credentialsList) {
        this(seeds, credentialsList, new MongoClientOptions.Builder().build());
    }

    public MongoClient(List<ServerAddress> seeds, MongoClientOptions options) {
        this(seeds, (List<MongoCredential>) null, options);
    }

    public MongoClient(List<ServerAddress> seeds, List<MongoCredential> credentialsList, MongoClientOptions options) {
        super(MongoAuthority.dynamicSet(seeds, new MongoCredentialsStore(credentialsList)), new MongoOptions(options));
        this.options = options;
    }

    public MongoClient(MongoClientURI uri) throws UnknownHostException {
        super(new MongoURI(uri));
        this.options = uri.getOptions();
    }

    public List<MongoCredential> getCredentialsList() {
        return getAuthority().getCredentialsStore().asList();
    }

    public MongoClientOptions getMongoClientOptions() {
        return this.options;
    }
}
