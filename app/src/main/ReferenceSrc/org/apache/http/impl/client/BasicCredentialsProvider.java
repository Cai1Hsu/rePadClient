package org.apache.http.impl.client;

import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.client.CredentialsProvider;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/client/BasicCredentialsProvider.class */
public class BasicCredentialsProvider implements CredentialsProvider {
    public BasicCredentialsProvider() {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.CredentialsProvider
    public void clear() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.client.CredentialsProvider
    public Credentials getCredentials(AuthScope authScope) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.client.CredentialsProvider
    public void setCredentials(AuthScope authScope, Credentials credentials) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public String toString() {
        throw new RuntimeException("Stub!");
    }
}
