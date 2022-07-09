package org.apache.http.conn.scheme;

import java.util.List;
import java.util.Map;
import org.apache.http.HttpHost;

@Deprecated
/* loaded from: classes.jar:org/apache/http/conn/scheme/SchemeRegistry.class */
public final class SchemeRegistry {
    public SchemeRegistry() {
        throw new RuntimeException("Stub!");
    }

    public final Scheme get(String str) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final Scheme getScheme(String str) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final Scheme getScheme(HttpHost httpHost) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final List<String> getSchemeNames() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final Scheme register(Scheme scheme) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setItems(Map<String, Scheme> map) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public final Scheme unregister(String str) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }
}
