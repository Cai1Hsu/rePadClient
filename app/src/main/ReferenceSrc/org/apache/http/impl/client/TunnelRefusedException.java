package org.apache.http.impl.client;

import org.apache.http.HttpException;
import org.apache.http.HttpResponse;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/client/TunnelRefusedException.class */
public class TunnelRefusedException extends HttpException {
    public TunnelRefusedException(String str, HttpResponse httpResponse) {
        throw new RuntimeException("Stub!");
    }

    public HttpResponse getResponse() {
        throw new RuntimeException("Stub!");
    }
}
