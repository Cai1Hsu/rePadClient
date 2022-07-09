package org.apache.http.impl.client;

import java.util.Date;
import java.util.List;
import org.apache.http.client.CookieStore;
import org.apache.http.cookie.Cookie;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/client/BasicCookieStore.class */
public class BasicCookieStore implements CookieStore {
    public BasicCookieStore() {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.client.CookieStore
    public void addCookie(Cookie cookie) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void addCookies(Cookie[] cookieArr) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.client.CookieStore
    public void clear() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.client.CookieStore
    public boolean clearExpired(Date date) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.client.CookieStore
    public List<Cookie> getCookies() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public String toString() {
        throw new RuntimeException("Stub!");
    }
}
