package com.mongodb;

import com.mongodb.MongoClientOptions;
import java.net.UnknownHostException;
import java.util.List;

/* loaded from: classes.dex */
public class MongoURI {
    public static final String MONGODB_PREFIX = "mongodb://";
    private final MongoClientURI mongoClientURI;
    private final MongoOptions mongoOptions;

    @Deprecated
    public MongoURI(String uri) {
        this.mongoClientURI = new MongoClientURI(uri, new MongoClientOptions.Builder().legacyDefaults());
        this.mongoOptions = new MongoOptions(this.mongoClientURI.getOptions());
    }

    @Deprecated
    public MongoURI(MongoClientURI mongoClientURI) {
        this.mongoClientURI = mongoClientURI;
        this.mongoOptions = new MongoOptions(mongoClientURI.getOptions());
    }

    public String getUsername() {
        return this.mongoClientURI.getUsername();
    }

    public char[] getPassword() {
        return this.mongoClientURI.getPassword();
    }

    public List<String> getHosts() {
        return this.mongoClientURI.getHosts();
    }

    public String getDatabase() {
        return this.mongoClientURI.getDatabase();
    }

    public String getCollection() {
        return this.mongoClientURI.getCollection();
    }

    public MongoCredential getCredentials() {
        return this.mongoClientURI.getCredentials();
    }

    public MongoOptions getOptions() {
        return this.mongoOptions;
    }

    public Mongo connect() throws UnknownHostException {
        return new Mongo(this);
    }

    public DB connectDB() throws UnknownHostException {
        return connect().getDB(getDatabase());
    }

    public DB connectDB(Mongo mongo) {
        return mongo.getDB(getDatabase());
    }

    public DBCollection connectCollection(DB db) {
        return db.getCollection(getCollection());
    }

    public DBCollection connectCollection(Mongo mongo) {
        return connectDB(mongo).getCollection(getCollection());
    }

    public String toString() {
        return this.mongoClientURI.toString();
    }

    MongoClientURI toClientURI() {
        return this.mongoClientURI;
    }
}
