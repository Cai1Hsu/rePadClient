package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.awt.AWTException;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Arrays;
import org.jivesoftware.smackx.jingle.SmackLogger;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter.class */
public class ImageTransmitter implements Runnable {
    public static final int KEYFRAME = 10;
    private static final SmackLogger LOGGER = SmackLogger.getLogger(ImageTransmitter.class);
    public static final int tileWidth = 25;
    private Rectangle area;
    private ImageEncoder encoder;
    private InetAddress localHost;
    private int localPort;
    private int maxI;
    private int maxJ;
    private boolean on = true;
    private InetAddress remoteHost;
    private int remotePort;
    private Robot robot;
    private DatagramSocket socket;
    private int[][][] tiles;
    private boolean transmit;

    public ImageTransmitter(DatagramSocket datagramSocket, InetAddress inetAddress, int i, Rectangle rectangle) {
        this.transmit = false;
        try {
            this.robot = new Robot();
            this.maxI = (int) Math.ceil(rectangle.getWidth() / 25.0d);
            this.maxJ = (int) Math.ceil(rectangle.getHeight() / 25.0d);
            this.tiles = new int[this.maxI][this.maxJ][625];
            this.area = rectangle;
            this.socket = datagramSocket;
            this.localHost = datagramSocket.getLocalAddress();
            this.localPort = datagramSocket.getLocalPort();
            this.remoteHost = inetAddress;
            this.remotePort = i;
            this.encoder = new DefaultEncoder();
            this.transmit = true;
        } catch (AWTException e) {
            e.printStackTrace();
        }
    }

    public ImageEncoder getEncoder() {
        return this.encoder;
    }

    @Override // java.lang.Runnable
    public void run() {
        start();
    }

    public void setEncoder(ImageEncoder imageEncoder) {
        this.encoder = imageEncoder;
    }

    public void setTransmit(boolean z) {
        this.transmit = z;
    }

    public void start() {
        ByteArrayOutputStream encode;
        DatagramPacket datagramPacket = new DatagramPacket(new byte[1024], 1024);
        int i = 0;
        while (this.on) {
            if (this.transmit) {
                BufferedImage filter = new QuantizeFilter().filter(this.robot.createScreenCapture(this.area), null);
                long currentTimeMillis = System.currentTimeMillis();
                int i2 = i + 1;
                int i3 = i2;
                if (i2 > 10) {
                    i3 = 0;
                }
                LOGGER.debug("KEYFRAME:" + i3);
                for (int i4 = 0; i4 < this.maxI; i4++) {
                    for (int i5 = 0; i5 < this.maxJ; i5++) {
                        BufferedImage subimage = filter.getSubimage(i4 * 25, i5 * 25, 25, 25);
                        int[] iArr = new int[625];
                        try {
                            if (new PixelGrabber(subimage, 0, 0, 25, 25, iArr, 0, 25).grabPixels() && ((i3 == 10 || !Arrays.equals(this.tiles[i4][i5], iArr)) && (encode = this.encoder.encode(subimage)) != null)) {
                                try {
                                    Thread.sleep(1L);
                                    encode.write(i4);
                                    encode.write(i5);
                                    byte[] byteArray = encode.toByteArray();
                                    if (byteArray.length > 1000) {
                                        LOGGER.error("Bytes out > 1000. Equals " + byteArray.length);
                                    }
                                    datagramPacket.setData(byteArray);
                                    datagramPacket.setAddress(this.remoteHost);
                                    datagramPacket.setPort(this.remotePort);
                                    try {
                                        this.socket.send(datagramPacket);
                                    } catch (IOException e) {
                                        e.printStackTrace();
                                    }
                                    this.tiles[i4][i5] = iArr;
                                } catch (Exception e2) {
                                }
                            }
                        } catch (InterruptedException e3) {
                            e3.printStackTrace();
                        }
                    }
                }
                long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
                LOGGER.debug("Loop Time:" + currentTimeMillis2);
                i = i3;
                if (currentTimeMillis2 < 500) {
                    try {
                        Thread.sleep(500 - currentTimeMillis2);
                        i = i3;
                    } catch (InterruptedException e4) {
                        e4.printStackTrace();
                        i = i3;
                    }
                }
            }
        }
    }

    public void stop() {
        this.transmit = false;
        this.on = false;
        this.socket.close();
    }
}
