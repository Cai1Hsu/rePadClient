package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;

/* loaded from: classes.jar:org/apache/commons/net/tftp/TFTPDataPacket.class */
public final class TFTPDataPacket extends TFTPPacket {
    public static final int MAX_DATA_LENGTH = 512;
    public static final int MIN_DATA_LENGTH = 0;
    int _blockNumber;
    byte[] _data;
    int _length;
    int _offset;

    TFTPDataPacket(DatagramPacket datagramPacket) throws TFTPPacketException {
        super(3, datagramPacket.getAddress(), datagramPacket.getPort());
        this._data = datagramPacket.getData();
        this._offset = 4;
        if (getType() != this._data[1]) {
            throw new TFTPPacketException("TFTP operator code does not match type.");
        }
        this._blockNumber = ((this._data[2] & 255) << 8) | (this._data[3] & 255);
        this._length = datagramPacket.getLength() - 4;
        if (this._length <= 512) {
            return;
        }
        this._length = 512;
    }

    public TFTPDataPacket(InetAddress inetAddress, int i, int i2, byte[] bArr) {
        this(inetAddress, i, i2, bArr, 0, bArr.length);
    }

    public TFTPDataPacket(InetAddress inetAddress, int i, int i2, byte[] bArr, int i3, int i4) {
        super(3, inetAddress, i);
        this._blockNumber = i2;
        this._data = bArr;
        this._offset = i3;
        if (i4 > 512) {
            this._length = 512;
        } else {
            this._length = i4;
        }
    }

    @Override // org.apache.commons.net.tftp.TFTPPacket
    DatagramPacket _newDatagram(DatagramPacket datagramPacket, byte[] bArr) {
        bArr[0] = (byte) 0;
        bArr[1] = (byte) this._type;
        bArr[2] = (byte) ((this._blockNumber & 65535) >> 8);
        bArr[3] = (byte) (this._blockNumber & 255);
        if (bArr != this._data) {
            System.arraycopy(this._data, this._offset, bArr, 4, this._length);
        }
        datagramPacket.setAddress(this._address);
        datagramPacket.setPort(this._port);
        datagramPacket.setData(bArr);
        datagramPacket.setLength(this._length + 4);
        return datagramPacket;
    }

    public int getBlockNumber() {
        return this._blockNumber;
    }

    public byte[] getData() {
        return this._data;
    }

    public int getDataLength() {
        return this._length;
    }

    public int getDataOffset() {
        return this._offset;
    }

    @Override // org.apache.commons.net.tftp.TFTPPacket
    public DatagramPacket newDatagram() {
        byte[] bArr = new byte[this._length + 4];
        bArr[0] = (byte) 0;
        bArr[1] = (byte) this._type;
        bArr[2] = (byte) ((this._blockNumber & 65535) >> 8);
        bArr[3] = (byte) (this._blockNumber & 255);
        System.arraycopy(this._data, this._offset, bArr, 4, this._length);
        return new DatagramPacket(bArr, this._length + 4, this._address, this._port);
    }

    public void setBlockNumber(int i) {
        this._blockNumber = i;
    }

    public void setData(byte[] bArr, int i, int i2) {
        this._data = bArr;
        this._offset = i;
        this._length = i2;
        if (i2 > 512) {
            this._length = 512;
        } else {
            this._length = i2;
        }
    }
}
