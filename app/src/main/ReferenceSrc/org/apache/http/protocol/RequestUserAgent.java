package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;

@Deprecated
/* loaded from: classes.jar:org/apache/http/protocol/RequestUserAgent.class */
public class RequestUserAgent implements HttpRequestInterceptor {
    public RequestUserAgent() {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.HttpRequestInterceptor
    public void process(HttpRequest httpRequest, HttpContext httpContext) throws HttpException, IOException {
        throw new RuntimeException("Stub!");
    }
}
