package org.apache.http.conn;

import java.net.ConnectException;
import org.apache.http.HttpHost;

@Deprecated
/* loaded from: classes.jar:org/apache/http/conn/HttpHostConnectException.class */
public class HttpHostConnectException extends ConnectException {
    public HttpHostConnectException(HttpHost httpHost, ConnectException connectException) {
        throw new RuntimeException("Stub!");
    }

    public HttpHost getHost() {
        throw new RuntimeException("Stub!");
    }
}
