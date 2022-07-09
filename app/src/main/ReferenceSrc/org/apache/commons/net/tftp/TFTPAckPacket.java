package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

/* loaded from: classes.jar:org/apache/commons/net/tftp/TFTPAckPacket.class */
public final class TFTPAckPacket extends TFTPPacket {
    int _blockNumber;

    TFTPAckPacket(DatagramPacket datagramPacket) throws TFTPPacketException {
        super(4, datagramPacket.getAddress(), datagramPacket.getPort());
        byte[] data = datagramPacket.getData();
        if (getType() != data[1]) {
            throw new TFTPPacketException("TFTP operator code does not match type.");
        }
        this._blockNumber = ((data[2] & 255) << 8) | (data[3] & 255);
    }

    public TFTPAckPacket(InetAddress inetAddress, int i, int i2) {
        super(4, inetAddress, i);
        this._blockNumber = i2;
    }

    @Override // org.apache.commons.net.tftp.TFTPPacket
    DatagramPacket _newDatagram(DatagramPacket datagramPacket, byte[] bArr) {
        bArr[0] = (byte) 0;
        bArr[1] = (byte) this._type;
        bArr[2] = (byte) ((this._blockNumber & 65535) >> 8);
        bArr[3] = (byte) (this._blockNumber & 255);
        datagramPacket.setAddress(this._address);
        datagramPacket.setPort(this._port);
        datagramPacket.setData(bArr);
        datagramPacket.setLength(4);
        return datagramPacket;
    }

    public int getBlockNumber() {
        return this._blockNumber;
    }

    @Override // org.apache.commons.net.tftp.TFTPPacket
    public DatagramPacket newDatagram() {
        byte[] bArr = {(byte) 0, (byte) this._type, (byte) ((this._blockNumber & 65535) >> 8), (byte) (this._blockNumber & 255)};
        return new DatagramPacket(bArr, bArr.length, this._address, this._port);
    }

    public void setBlockNumber(int i) {
        this._blockNumber = i;
    }
}
