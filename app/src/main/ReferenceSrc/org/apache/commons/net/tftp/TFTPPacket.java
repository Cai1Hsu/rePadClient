package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

/* loaded from: classes.jar:org/apache/commons/net/tftp/TFTPPacket.class */
public abstract class TFTPPacket {
    public static final int ACKNOWLEDGEMENT = 4;
    public static final int DATA = 3;
    public static final int ERROR = 5;
    static final int MIN_PACKET_SIZE = 4;
    public static final int READ_REQUEST = 1;
    public static final int SEGMENT_SIZE = 512;
    public static final int WRITE_REQUEST = 2;
    InetAddress _address;
    int _port;
    int _type;

    TFTPPacket(int i, InetAddress inetAddress, int i2) {
        this._type = i;
        this._address = inetAddress;
        this._port = i2;
    }

    public static final TFTPPacket newTFTPPacket(DatagramPacket datagramPacket) throws TFTPPacketException {
        TFTPPacket tFTPErrorPacket;
        if (datagramPacket.getLength() < 4) {
            throw new TFTPPacketException("Bad packet. Datagram data length is too short.");
        }
        switch (datagramPacket.getData()[1]) {
            case 1:
                tFTPErrorPacket = new TFTPReadRequestPacket(datagramPacket);
                break;
            case 2:
                tFTPErrorPacket = new TFTPWriteRequestPacket(datagramPacket);
                break;
            case 3:
                tFTPErrorPacket = new TFTPDataPacket(datagramPacket);
                break;
            case 4:
                tFTPErrorPacket = new TFTPAckPacket(datagramPacket);
                break;
            case 5:
                tFTPErrorPacket = new TFTPErrorPacket(datagramPacket);
                break;
            default:
                throw new TFTPPacketException("Bad packet.  Invalid TFTP operator code.");
        }
        return tFTPErrorPacket;
    }

    abstract DatagramPacket _newDatagram(DatagramPacket datagramPacket, byte[] bArr);

    public final InetAddress getAddress() {
        return this._address;
    }

    public final int getPort() {
        return this._port;
    }

    public final int getType() {
        return this._type;
    }

    public abstract DatagramPacket newDatagram();

    public final void setAddress(InetAddress inetAddress) {
        this._address = inetAddress;
    }

    public final void setPort(int i) {
        this._port = i;
    }
}
