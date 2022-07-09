package org.apache.commons.net.echo;

import java.io.InputStream;
import org.apache.commons.net.discard.DiscardTCPClient;

/* loaded from: classes.jar:org/apache/commons/net/echo/EchoTCPClient.class */
public final class EchoTCPClient extends DiscardTCPClient {
    public static final int DEFAULT_PORT = 7;

    public EchoTCPClient() {
        setDefaultPort(7);
    }

    public InputStream getInputStream() {
        return this._input_;
    }
}
