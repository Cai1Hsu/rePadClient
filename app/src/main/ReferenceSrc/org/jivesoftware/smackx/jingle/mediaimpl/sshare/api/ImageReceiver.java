package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.Canvas;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver.class */
public class ImageReceiver extends Canvas {
    private static final long serialVersionUID = -7000112305305269025L;
    private static final int tileWidth = 25;
    private ImageDecoder decoder;
    private InetAddress localHost;
    private int localPort;
    private boolean on = true;
    private InetAddress remoteHost;
    private int remotePort;
    private DatagramSocket socket;
    private BufferedImage[][] tiles;

    public ImageReceiver(final InetAddress inetAddress, final int i, int i2, int i3, int i4) {
        this.tiles = new BufferedImage[i3][i4];
        try {
            this.socket = new DatagramSocket(i2);
            this.localHost = this.socket.getLocalAddress();
            this.remoteHost = inetAddress;
            this.remotePort = i;
            this.localPort = i2;
            this.decoder = new DefaultDecoder();
            new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageReceiver.1
                @Override // java.lang.Runnable
                public void run() {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[1024], 1024);
                    while (ImageReceiver.this.on) {
                        try {
                            ImageReceiver.this.socket.receive(datagramPacket);
                            int length = datagramPacket.getLength();
                            BufferedImage decode = ImageReceiver.this.decoder.decode(new ByteArrayInputStream(datagramPacket.getData(), 0, length - 2));
                            if (decode != null) {
                                ImageReceiver.this.drawTile(datagramPacket.getData()[length - 2], datagramPacket.getData()[length - 1], decode);
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                            return;
                        }
                    }
                }
            }).start();
            new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageReceiver.2
                @Override // java.lang.Runnable
                public void run() {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[1024], 1024);
                    while (ImageReceiver.this.on) {
                        try {
                            datagramPacket.setAddress(inetAddress);
                            datagramPacket.setPort(i);
                            ImageReceiver.this.socket.send(datagramPacket);
                            try {
                                Thread.sleep(1000L);
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                        } catch (IOException e2) {
                            e2.printStackTrace();
                            return;
                        }
                    }
                }
            }).start();
        } catch (SocketException e) {
            e.printStackTrace();
        }
        setSize(i3, i4);
    }

    public void drawTile(int i, int i2, BufferedImage bufferedImage) {
        this.tiles[i][i2] = bufferedImage;
        getGraphics().drawImage(bufferedImage, i * 25, i2 * 25, this);
    }

    public DatagramSocket getDatagramSocket() {
        return this.socket;
    }

    public ImageDecoder getDecoder() {
        return this.decoder;
    }

    public InetAddress getLocalHost() {
        return this.localHost;
    }

    public int getLocalPort() {
        return this.localPort;
    }

    public InetAddress getRemoteHost() {
        return this.remoteHost;
    }

    public int getRemotePort() {
        return this.remotePort;
    }

    public void paint(Graphics graphics) {
        for (int i = 0; i < this.tiles.length; i++) {
            for (int i2 = 0; i2 < this.tiles[0].length; i2++) {
                graphics.drawImage(this.tiles[i][i2], i * 25, i2 * 25, this);
            }
        }
    }

    public void setDecoder(ImageDecoder imageDecoder) {
        this.decoder = imageDecoder;
    }

    public void stop() {
        this.on = false;
        this.socket.close();
    }
}
