package org.apache.http.client.protocol;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.protocol.HttpContext;

@Deprecated
/* loaded from: classes.jar:org/apache/http/client/protocol/RequestDefaultHeaders.class */
public class RequestDefaultHeaders implements HttpRequestInterceptor {
    public RequestDefaultHeaders() {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.HttpRequestInterceptor
    public void process(HttpRequest httpRequest, HttpContext httpContext) throws HttpException, IOException {
        throw new RuntimeException("Stub!");
    }
}
