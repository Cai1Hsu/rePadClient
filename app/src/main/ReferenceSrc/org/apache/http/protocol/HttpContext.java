package org.apache.http.protocol;

@Deprecated
/* loaded from: classes.jar:org/apache/http/protocol/HttpContext.class */
public interface HttpContext {
    public static final String RESERVED_PREFIX = "http.";

    Object getAttribute(String str);

    Object removeAttribute(String str);

    void setAttribute(String str, Object obj);
}
