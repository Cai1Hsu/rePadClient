package org.apache.commons.net.time;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.util.Date;
import org.apache.commons.net.DatagramSocketClient;

/* loaded from: classes.jar:org/apache/commons/net/time/TimeUDPClient.class */
public final class TimeUDPClient extends DatagramSocketClient {
    public static final int DEFAULT_PORT = 37;
    public static final long SECONDS_1900_TO_1970 = 2208988800L;
    private final byte[] __dummyData = new byte[1];
    private final byte[] __timeData = new byte[4];

    public Date getDate(InetAddress inetAddress) throws IOException {
        return new Date((getTime(inetAddress, 37) - 2208988800L) * 1000);
    }

    public Date getDate(InetAddress inetAddress, int i) throws IOException {
        return new Date((getTime(inetAddress, i) - 2208988800L) * 1000);
    }

    public long getTime(InetAddress inetAddress) throws IOException {
        return getTime(inetAddress, 37);
    }

    public long getTime(InetAddress inetAddress, int i) throws IOException {
        DatagramPacket datagramPacket = new DatagramPacket(this.__dummyData, this.__dummyData.length, inetAddress, i);
        DatagramPacket datagramPacket2 = new DatagramPacket(this.__timeData, this.__timeData.length);
        this._socket_.send(datagramPacket);
        this._socket_.receive(datagramPacket2);
        return 0 | (((this.__timeData[0] & 255) << 24) & 4294967295L) | (((this.__timeData[1] & 255) << 16) & 4294967295L) | (((this.__timeData[2] & 255) << 8) & 4294967295L) | (this.__timeData[3] & 255 & 4294967295L);
    }
}
