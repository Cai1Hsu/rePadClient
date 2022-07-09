package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

/* loaded from: classes.jar:org/apache/commons/net/tftp/TFTPReadRequestPacket.class */
public final class TFTPReadRequestPacket extends TFTPRequestPacket {
    TFTPReadRequestPacket(DatagramPacket datagramPacket) throws TFTPPacketException {
        super(1, datagramPacket);
    }

    public TFTPReadRequestPacket(InetAddress inetAddress, int i, String str, int i2) {
        super(inetAddress, i, 1, str, i2);
    }
}
