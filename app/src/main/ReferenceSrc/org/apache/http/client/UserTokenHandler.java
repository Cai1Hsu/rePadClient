package org.apache.http.client;

import org.apache.http.protocol.HttpContext;

@Deprecated
/* loaded from: classes.jar:org/apache/http/client/UserTokenHandler.class */
public interface UserTokenHandler {
    Object getUserToken(HttpContext httpContext);
}
