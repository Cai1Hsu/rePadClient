package org.apache.http;

import java.net.InetAddress;

@Deprecated
/* loaded from: classes.jar:org/apache/http/HttpInetConnection.class */
public interface HttpInetConnection extends HttpConnection {
    InetAddress getLocalAddress();

    int getLocalPort();

    InetAddress getRemoteAddress();

    int getRemotePort();
}
