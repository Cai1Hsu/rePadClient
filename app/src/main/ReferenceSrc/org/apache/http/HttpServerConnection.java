package org.apache.http;

import java.io.IOException;

@Deprecated
/* loaded from: classes.jar:org/apache/http/HttpServerConnection.class */
public interface HttpServerConnection extends HttpConnection {
    void flush() throws IOException;

    void receiveRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws HttpException, IOException;

    HttpRequest receiveRequestHeader() throws HttpException, IOException;

    void sendResponseEntity(HttpResponse httpResponse) throws HttpException, IOException;

    void sendResponseHeader(HttpResponse httpResponse) throws HttpException, IOException;
}
