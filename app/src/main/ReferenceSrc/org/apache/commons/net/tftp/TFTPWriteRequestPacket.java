package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

/* loaded from: classes.jar:org/apache/commons/net/tftp/TFTPWriteRequestPacket.class */
public final class TFTPWriteRequestPacket extends TFTPRequestPacket {
    TFTPWriteRequestPacket(DatagramPacket datagramPacket) throws TFTPPacketException {
        super(2, datagramPacket);
    }

    public TFTPWriteRequestPacket(InetAddress inetAddress, int i, String str, int i2) {
        super(inetAddress, i, 2, str, i2);
    }
}
