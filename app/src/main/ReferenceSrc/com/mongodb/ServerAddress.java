package com.mongodb;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;
import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: classes.dex */
public class ServerAddress {
    final String _host;
    final int _port;

    public ServerAddress() throws UnknownHostException {
        this(defaultHost(), defaultPort());
    }

    public ServerAddress(String host) throws UnknownHostException {
        this(host, defaultPort());
    }

    public ServerAddress(String host, int port) throws UnknownHostException {
        String host2 = (host == null ? defaultHost() : host).trim();
        host2 = host2.length() == 0 ? defaultHost() : host2;
        if (host2.startsWith("[")) {
            int idx = host2.indexOf("]");
            if (idx == -1) {
                throw new IllegalArgumentException("an IPV6 address must be encosed with '[' and ']' according to RFC 2732.");
            }
            int portIdx = host2.indexOf("]:");
            if (portIdx != -1) {
                if (port != defaultPort()) {
                    throw new IllegalArgumentException("can't specify port in construct and via host");
                }
                port = Integer.parseInt(host2.substring(portIdx + 2));
            }
            host2 = host2.substring(1, idx);
        } else {
            int idx2 = host2.indexOf(":");
            if (idx2 > 0) {
                if (port != defaultPort()) {
                    throw new IllegalArgumentException("can't specify port in construct and via host");
                }
                port = Integer.parseInt(host2.substring(idx2 + 1));
                host2 = host2.substring(0, idx2).trim();
            }
        }
        this._host = host2;
        this._port = port;
    }

    public ServerAddress(InetAddress addr) {
        this(new InetSocketAddress(addr, defaultPort()));
    }

    public ServerAddress(InetAddress addr, int port) {
        this(new InetSocketAddress(addr, port));
    }

    public ServerAddress(InetSocketAddress addr) {
        this._host = addr.getHostName();
        this._port = addr.getPort();
    }

    public boolean sameHost(String host) {
        int idx = host.indexOf(":");
        int port = defaultPort();
        if (idx > 0) {
            port = Integer.parseInt(host.substring(idx + 1));
            host = host.substring(0, idx);
        }
        return this._port == port && this._host.equalsIgnoreCase(host);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ServerAddress that = (ServerAddress) o;
        return this._port == that._port && this._host.equals(that._host);
    }

    public int hashCode() {
        int result = this._host.hashCode();
        return (result * 31) + this._port;
    }

    public String getHost() {
        return this._host;
    }

    public int getPort() {
        return this._port;
    }

    public InetSocketAddress getSocketAddress() throws UnknownHostException {
        return new InetSocketAddress(InetAddress.getByName(this._host), this._port);
    }

    public String toString() {
        return this._host + ":" + this._port;
    }

    public static String defaultHost() {
        return "127.0.0.1";
    }

    public static int defaultPort() {
        return DBPort.PORT;
    }
}
