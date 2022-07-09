package org.apache.http.cookie;

import java.util.List;
import java.util.Map;
import org.apache.http.params.HttpParams;

@Deprecated
/* loaded from: classes.jar:org/apache/http/cookie/CookieSpecRegistry.class */
public final class CookieSpecRegistry {
    public CookieSpecRegistry() {
        throw new RuntimeException("Stub!");
    }

    public CookieSpec getCookieSpec(String str) throws IllegalStateException {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public CookieSpec getCookieSpec(String str, HttpParams httpParams) throws IllegalStateException {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public List<String> getSpecNames() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void register(String str, CookieSpecFactory cookieSpecFactory) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setItems(Map<String, CookieSpecFactory> map) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void unregister(String str) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }
}
