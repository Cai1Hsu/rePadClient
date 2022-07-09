package org.apache.commons.net.tftp;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.DatagramPacket;
import java.net.SocketException;
import org.apache.commons.net.DatagramSocketClient;

/* loaded from: classes.jar:org/apache/commons/net/tftp/TFTP.class */
public class TFTP extends DatagramSocketClient {
    public static final int ASCII_MODE = 0;
    public static final int BINARY_MODE = 1;
    public static final int DEFAULT_PORT = 69;
    public static final int DEFAULT_TIMEOUT = 5000;
    public static final int IMAGE_MODE = 1;
    public static final int NETASCII_MODE = 0;
    public static final int OCTET_MODE = 1;
    static final int PACKET_SIZE = 516;
    private byte[] __receiveBuffer = null;
    private DatagramPacket __receiveDatagram = null;
    private DatagramPacket __sendDatagram;
    byte[] _sendBuffer;

    public TFTP() {
        setDefaultTimeout(DEFAULT_TIMEOUT);
    }

    public static final String getModeName(int i) {
        return TFTPRequestPacket._modeStrings[i];
    }

    public final void beginBufferedOps() {
        this.__receiveBuffer = new byte[PACKET_SIZE];
        this.__receiveDatagram = new DatagramPacket(this.__receiveBuffer, this.__receiveBuffer.length);
        this._sendBuffer = new byte[PACKET_SIZE];
        this.__sendDatagram = new DatagramPacket(this._sendBuffer, this._sendBuffer.length);
    }

    public final TFTPPacket bufferedReceive() throws IOException, InterruptedIOException, SocketException, TFTPPacketException {
        this.__receiveDatagram.setData(this.__receiveBuffer);
        this.__receiveDatagram.setLength(this.__receiveBuffer.length);
        this._socket_.receive(this.__receiveDatagram);
        return TFTPPacket.newTFTPPacket(this.__receiveDatagram);
    }

    public final void bufferedSend(TFTPPacket tFTPPacket) throws IOException {
        this._socket_.send(tFTPPacket._newDatagram(this.__sendDatagram, this._sendBuffer));
    }

    public final void discardPackets() throws IOException {
        DatagramPacket datagramPacket = new DatagramPacket(new byte[PACKET_SIZE], PACKET_SIZE);
        int soTimeout = getSoTimeout();
        setSoTimeout(1);
        while (true) {
            try {
                this._socket_.receive(datagramPacket);
            } catch (InterruptedIOException | SocketException e) {
                setSoTimeout(soTimeout);
                return;
            }
        }
    }

    public final void endBufferedOps() {
        this.__receiveBuffer = null;
        this.__receiveDatagram = null;
        this._sendBuffer = null;
        this.__sendDatagram = null;
    }

    public final TFTPPacket receive() throws IOException, InterruptedIOException, SocketException, TFTPPacketException {
        DatagramPacket datagramPacket = new DatagramPacket(new byte[PACKET_SIZE], PACKET_SIZE);
        this._socket_.receive(datagramPacket);
        return TFTPPacket.newTFTPPacket(datagramPacket);
    }

    public final void send(TFTPPacket tFTPPacket) throws IOException {
        this._socket_.send(tFTPPacket.newDatagram());
    }
}
