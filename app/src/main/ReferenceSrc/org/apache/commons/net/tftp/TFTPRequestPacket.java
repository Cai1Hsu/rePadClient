package org.apache.commons.net.tftp;

import java.net.DatagramPacket;
import java.net.InetAddress;
import java.util.Locale;

/* loaded from: classes.jar:org/apache/commons/net/tftp/TFTPRequestPacket.class */
public abstract class TFTPRequestPacket extends TFTPPacket {
    private final String _filename;
    private final int _mode;
    static final String[] _modeStrings = {"netascii", "octet"};
    private static final byte[][] _modeBytes = {new byte[]{110, 101, 116, 97, 115, 99, 105, 105, 0}, new byte[]{111, 99, 116, 101, 116, 0}};

    TFTPRequestPacket(int i, DatagramPacket datagramPacket) throws TFTPPacketException {
        super(i, datagramPacket.getAddress(), datagramPacket.getPort());
        int i2;
        byte[] data = datagramPacket.getData();
        if (getType() != data[1]) {
            throw new TFTPPacketException("TFTP operator code does not match type.");
        }
        StringBuilder sb = new StringBuilder();
        int i3 = 2;
        int length = datagramPacket.getLength();
        while (i3 < length && data[i3] != 0) {
            sb.append((char) data[i3]);
            i3++;
        }
        this._filename = sb.toString();
        if (i3 >= length) {
            throw new TFTPPacketException("Bad filename and mode format.");
        }
        sb.setLength(0);
        while (true) {
            i3++;
            if (i3 >= length || data[i3] == 0) {
                break;
            }
            sb.append((char) data[i3]);
        }
        String lowerCase = sb.toString().toLowerCase(Locale.ENGLISH);
        int length2 = _modeStrings.length;
        int i4 = 0;
        while (true) {
            i2 = 0;
            if (i4 >= length2) {
                break;
            } else if (lowerCase.equals(_modeStrings[i4])) {
                i2 = i4;
                break;
            } else {
                i4++;
            }
        }
        this._mode = i2;
        if (i4 < length2) {
            return;
        }
        throw new TFTPPacketException("Unrecognized TFTP transfer mode: " + lowerCase);
    }

    TFTPRequestPacket(InetAddress inetAddress, int i, int i2, String str, int i3) {
        super(i2, inetAddress, i);
        this._filename = str;
        this._mode = i3;
    }

    @Override // org.apache.commons.net.tftp.TFTPPacket
    final DatagramPacket _newDatagram(DatagramPacket datagramPacket, byte[] bArr) {
        int length = this._filename.length();
        int length2 = _modeBytes[this._mode].length;
        bArr[0] = (byte) 0;
        bArr[1] = (byte) this._type;
        System.arraycopy(this._filename.getBytes(), 0, bArr, 2, length);
        bArr[length + 2] = (byte) 0;
        System.arraycopy(_modeBytes[this._mode], 0, bArr, length + 3, length2);
        datagramPacket.setAddress(this._address);
        datagramPacket.setPort(this._port);
        datagramPacket.setData(bArr);
        datagramPacket.setLength(length + length2 + 3);
        return datagramPacket;
    }

    public final String getFilename() {
        return this._filename;
    }

    public final int getMode() {
        return this._mode;
    }

    @Override // org.apache.commons.net.tftp.TFTPPacket
    public final DatagramPacket newDatagram() {
        int length = this._filename.length();
        int length2 = _modeBytes[this._mode].length;
        byte[] bArr = new byte[length + length2 + 4];
        bArr[0] = (byte) 0;
        bArr[1] = (byte) this._type;
        System.arraycopy(this._filename.getBytes(), 0, bArr, 2, length);
        bArr[length + 2] = (byte) 0;
        System.arraycopy(_modeBytes[this._mode], 0, bArr, length + 3, length2);
        return new DatagramPacket(bArr, bArr.length, this._address, this._port);
    }
}
