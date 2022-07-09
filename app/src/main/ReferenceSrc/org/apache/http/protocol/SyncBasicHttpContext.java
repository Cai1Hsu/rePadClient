package org.apache.http.protocol;

@Deprecated
/* loaded from: classes.jar:org/apache/http/protocol/SyncBasicHttpContext.class */
public class SyncBasicHttpContext extends BasicHttpContext {
    public SyncBasicHttpContext(HttpContext httpContext) {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.protocol.BasicHttpContext, org.apache.http.protocol.HttpContext
    public Object getAttribute(String str) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.protocol.BasicHttpContext, org.apache.http.protocol.HttpContext
    public Object removeAttribute(String str) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // org.apache.http.protocol.BasicHttpContext, org.apache.http.protocol.HttpContext
    public void setAttribute(String str, Object obj) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }
}
