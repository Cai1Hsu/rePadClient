package org.apache.http.conn.scheme;

import java.io.IOException;
import java.net.InetAddress;

/* loaded from: classes.jar:org/apache/http/conn/scheme/HostNameResolver.class */
public interface HostNameResolver {
    InetAddress resolve(String str) throws IOException;
}
