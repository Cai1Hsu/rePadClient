package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;

@Deprecated
/* loaded from: classes.jar:org/apache/http/protocol/ResponseDate.class */
public class ResponseDate implements HttpResponseInterceptor {
    public ResponseDate() {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.HttpResponseInterceptor
    public void process(HttpResponse httpResponse, HttpContext httpContext) throws HttpException, IOException {
        throw new RuntimeException("Stub!");
    }
}
