package com.mongodb;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: classes.dex */
public final class MongoCredential {
    public static final String GSSAPI_MECHANISM = "GSSAPI";
    public static final String MONGODB_CR_MECHANISM = "MONGODB-CR";
    public static final String MONGODB_X509_MECHANISM = "MONGODB-X509";
    public static final String PLAIN_MECHANISM = "PLAIN";
    private final String mechanism;
    private final Map<String, Object> mechanismProperties;
    private final char[] password;
    private final String source;
    private final String userName;

    public static MongoCredential createMongoCRCredential(String userName, String database, char[] password) {
        return new MongoCredential(MONGODB_CR_MECHANISM, userName, database, password);
    }

    public static MongoCredential createGSSAPICredential(String userName) {
        return new MongoCredential("GSSAPI", userName, "$external", null);
    }

    public static MongoCredential createMongoX509Credential(String userName) {
        return new MongoCredential(MONGODB_X509_MECHANISM, userName, "$external", null);
    }

    public static MongoCredential createPlainCredential(String userName, String source, char[] password) {
        return new MongoCredential(PLAIN_MECHANISM, userName, source, password);
    }

    public <T> MongoCredential withMechanismProperty(String key, T value) {
        return new MongoCredential(this, key, value);
    }

    MongoCredential(String mechanism, String userName, String source, char[] password) {
        if (mechanism == null) {
            throw new IllegalArgumentException("mechanism can not be null");
        }
        if (userName == null) {
            throw new IllegalArgumentException("username can not be null");
        }
        if (mechanism.equals(MONGODB_CR_MECHANISM) && password == null) {
            throw new IllegalArgumentException("Password can not be null for MONGODB-CR mechanism");
        }
        if (mechanism.equals("GSSAPI") && password != null) {
            throw new IllegalArgumentException("Password must be null for the GSSAPI mechanism");
        }
        this.mechanism = mechanism;
        this.userName = userName;
        this.source = source;
        this.password = password != null ? (char[]) password.clone() : null;
        this.mechanismProperties = Collections.emptyMap();
    }

    <T> MongoCredential(MongoCredential from, String mechanismPropertyKey, T mechanismPropertyValue) {
        this.mechanism = from.mechanism;
        this.userName = from.userName;
        this.source = from.source;
        this.password = from.password;
        this.mechanismProperties = new HashMap(from.mechanismProperties);
        this.mechanismProperties.put(mechanismPropertyKey, mechanismPropertyValue);
    }

    public String getMechanism() {
        return this.mechanism;
    }

    public String getUserName() {
        return this.userName;
    }

    public String getSource() {
        return this.source;
    }

    public char[] getPassword() {
        if (this.password == null) {
            return null;
        }
        return (char[]) this.password.clone();
    }

    public <T> T getMechanismProperty(String key, T defaultValue) {
        T value = (T) this.mechanismProperties.get(key);
        return value == null ? defaultValue : value;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MongoCredential that = (MongoCredential) o;
        return this.mechanism.equals(that.mechanism) && Arrays.equals(this.password, that.password) && this.source.equals(that.source) && this.userName.equals(that.userName) && this.mechanismProperties.equals(that.mechanismProperties);
    }

    public int hashCode() {
        int result = this.mechanism.hashCode();
        return (((((((result * 31) + this.userName.hashCode()) * 31) + this.source.hashCode()) * 31) + (this.password != null ? Arrays.hashCode(this.password) : 0)) * 31) + this.mechanismProperties.hashCode();
    }

    public String toString() {
        return "MongoCredential{mechanism='" + this.mechanism + "', userName='" + this.userName + "', source='" + this.source + "', password=<hidden>, mechanismProperties=" + this.mechanismProperties + '}';
    }
}
