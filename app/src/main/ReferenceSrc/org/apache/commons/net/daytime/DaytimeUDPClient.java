package org.apache.commons.net.daytime;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetAddress;
import org.apache.commons.net.DatagramSocketClient;

/* loaded from: classes.jar:org/apache/commons/net/daytime/DaytimeUDPClient.class */
public final class DaytimeUDPClient extends DatagramSocketClient {
    public static final int DEFAULT_PORT = 13;
    private final byte[] __dummyData = new byte[1];
    private final byte[] __timeData = new byte[256];

    public String getTime(InetAddress inetAddress) throws IOException {
        return getTime(inetAddress, 13);
    }

    public String getTime(InetAddress inetAddress, int i) throws IOException {
        DatagramPacket datagramPacket = new DatagramPacket(this.__dummyData, this.__dummyData.length, inetAddress, i);
        DatagramPacket datagramPacket2 = new DatagramPacket(this.__timeData, this.__timeData.length);
        this._socket_.send(datagramPacket);
        this._socket_.receive(datagramPacket2);
        return new String(datagramPacket2.getData(), 0, datagramPacket2.getLength());
    }
}
