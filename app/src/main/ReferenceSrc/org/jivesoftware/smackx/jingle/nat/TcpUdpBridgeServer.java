package org.jivesoftware.smackx.jingle.nat;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import org.jivesoftware.smackx.jingle.SmackLogger;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer.class */
public class TcpUdpBridgeServer {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(TcpUdpBridgeServer.class);
    private Socket localTcpSocket;
    private int localUdpPort;
    private DatagramSocket localUdpSocket;
    private String remoteTcpHost;
    private int remoteTcpPort;
    private String remoteUdpHost;
    private int remoteUdpPort;
    private ServerSocket serverTcpSocket;

    public TcpUdpBridgeServer(String str, String str2, int i, int i2) {
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
            this.serverTcpSocket = new ServerSocket(i);
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
        final Thread thread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.TcpUdpBridgeServer.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    OutputStream outputStream = TcpUdpBridgeServer.this.localTcpSocket.getOutputStream();
                    while (true) {
                        DatagramPacket datagramPacket = new DatagramPacket(new byte[500], 500);
                        TcpUdpBridgeServer.this.localUdpSocket.receive(datagramPacket);
                        if (datagramPacket.getLength() != 0) {
                            TcpUdpBridgeServer.LOGGER.debug("UDP Server Received and Sending to TCP Client:" + new String(datagramPacket.getData(), 0, datagramPacket.getLength(), "UTF-8"));
                            outputStream.write(datagramPacket.getData(), 0, datagramPacket.getLength());
                            outputStream.flush();
                            TcpUdpBridgeServer.LOGGER.debug("Server Flush");
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
        new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.TcpUdpBridgeServer.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    TcpUdpBridgeServer.this.localTcpSocket = TcpUdpBridgeServer.this.serverTcpSocket.accept();
                    thread.start();
                    InputStream inputStream = TcpUdpBridgeServer.this.localTcpSocket.getInputStream();
                    InetAddress byName = InetAddress.getByName(TcpUdpBridgeServer.this.remoteUdpHost);
                    while (true) {
                        byte[] bArr = new byte[500];
                        int read = inputStream.read(bArr);
                        TcpUdpBridgeServer.LOGGER.debug("TCP Server:" + new String(bArr, 0, read, "UTF-8"));
                        DatagramPacket datagramPacket = new DatagramPacket(bArr, read);
                        datagramPacket.setAddress(byName);
                        datagramPacket.setPort(TcpUdpBridgeServer.this.remoteUdpPort);
                        TcpUdpBridgeServer.this.localUdpSocket.send(datagramPacket);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }
}
