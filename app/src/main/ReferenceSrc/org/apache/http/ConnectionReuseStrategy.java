package org.apache.http;

import org.apache.http.protocol.HttpContext;

@Deprecated
/* loaded from: classes.jar:org/apache/http/ConnectionReuseStrategy.class */
public interface ConnectionReuseStrategy {
    boolean keepAlive(HttpResponse httpResponse, HttpContext httpContext);
}
