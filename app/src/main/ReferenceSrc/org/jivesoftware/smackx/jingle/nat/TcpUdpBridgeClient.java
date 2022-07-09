package org.jivesoftware.smackx.jingle.nat;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.Socket;
import org.jivesoftware.smackx.jingle.SmackLogger;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient.class */
public class TcpUdpBridgeClient {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(TcpUdpBridgeClient.class);
    private Socket localTcpSocket;
    private int localUdpPort;
    private DatagramSocket localUdpSocket;
    private String remoteTcpHost;
    private int remoteTcpPort;
    private String remoteUdpHost;
    private int remoteUdpPort;

    public TcpUdpBridgeClient(String str, String str2, int i, int i2) {
        this.remoteTcpHost = null;
        this.remoteUdpHost = null;
        this.remoteTcpPort = -1;
        this.remoteUdpPort = -1;
        this.localUdpPort = -1;
        this.remoteTcpHost = str;
        this.remoteUdpHost = str2;
        this.remoteTcpPort = i;
        this.remoteUdpPort = i2;
        try {
            this.localTcpSocket = new Socket(str, i);
            this.localUdpSocket = new DatagramSocket(0);
            this.localUdpPort = this.localUdpSocket.getLocalPort();
            LOGGER.debug("UDP: " + this.localUdpSocket.getLocalPort());
        } catch (IOException e) {
            e.printStackTrace();
        }
        startBridge();
    }

    public Socket getLocalTcpSocket() {
        return this.localTcpSocket;
    }

    public DatagramSocket getLocalUdpSocket() {
        return this.localUdpSocket;
    }

    public void startBridge() {
        final Thread thread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.TcpUdpBridgeClient.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    OutputStream outputStream = TcpUdpBridgeClient.this.localTcpSocket.getOutputStream();
                    while (true) {
                        DatagramPacket datagramPacket = new DatagramPacket(new byte[500], 500);
                        TcpUdpBridgeClient.this.localUdpSocket.receive(datagramPacket);
                        if (datagramPacket.getLength() != 0) {
                            TcpUdpBridgeClient.LOGGER.debug("UDP Client Received and Sending to TCP Server:" + new String(datagramPacket.getData(), 0, datagramPacket.getLength(), "UTF-8"));
                            outputStream.write(datagramPacket.getData(), 0, datagramPacket.getLength());
                            outputStream.flush();
                            TcpUdpBridgeClient.LOGGER.debug("Client Flush");
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
        new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.TcpUdpBridgeClient.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    InputStream inputStream = TcpUdpBridgeClient.this.localTcpSocket.getInputStream();
                    InetAddress byName = InetAddress.getByName(TcpUdpBridgeClient.this.remoteUdpHost);
                    thread.start();
                    while (true) {
                        byte[] bArr = new byte[500];
                        int read = inputStream.read(bArr);
                        TcpUdpBridgeClient.LOGGER.debug("TCP Client:" + new String(bArr, 0, read, "UTF-8"));
                        DatagramPacket datagramPacket = new DatagramPacket(bArr, read);
                        datagramPacket.setAddress(byName);
                        datagramPacket.setPort(TcpUdpBridgeClient.this.remoteUdpPort);
                        TcpUdpBridgeClient.this.localUdpSocket.send(datagramPacket);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
}
