package org.apache.http.impl;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.params.HttpParams;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/DefaultHttpServerConnection.class */
public class DefaultHttpServerConnection extends SocketHttpServerConnection {
    public DefaultHttpServerConnection() {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.impl.SocketHttpServerConnection
    public void bind(Socket socket, HttpParams httpParams) throws IOException {
        throw new RuntimeException("Stub!");
    }

    public String toString() {
        throw new RuntimeException("Stub!");
    }
}
