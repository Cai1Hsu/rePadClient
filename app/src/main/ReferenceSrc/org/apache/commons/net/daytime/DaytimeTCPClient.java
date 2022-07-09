package org.apache.commons.net.daytime;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.commons.net.SocketClient;

/* loaded from: classes.jar:org/apache/commons/net/daytime/DaytimeTCPClient.class */
public final class DaytimeTCPClient extends SocketClient {
    public static final int DEFAULT_PORT = 13;
    private final char[] __buffer = new char[64];

    public DaytimeTCPClient() {
        setDefaultPort(13);
    }

    public String getTime() throws IOException {
        StringBuilder sb = new StringBuilder(this.__buffer.length);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(this._input_));
        while (true) {
            int read = bufferedReader.read(this.__buffer, 0, this.__buffer.length);
            if (read <= 0) {
                return sb.toString();
            }
            sb.append(this.__buffer, 0, read);
        }
    }
}
