package org.apache.http.auth;

import java.util.List;
import java.util.Map;
import org.apache.http.params.HttpParams;

@Deprecated
/* loaded from: classes.jar:org/apache/http/auth/AuthSchemeRegistry.class */
public final class AuthSchemeRegistry {
    public AuthSchemeRegistry() {
        throw new RuntimeException("Stub!");
    }

    public AuthScheme getAuthScheme(String str, HttpParams httpParams) throws IllegalStateException {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public List<String> getSchemeNames() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void register(String str, AuthSchemeFactory authSchemeFactory) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void setItems(Map<String, AuthSchemeFactory> map) {
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
