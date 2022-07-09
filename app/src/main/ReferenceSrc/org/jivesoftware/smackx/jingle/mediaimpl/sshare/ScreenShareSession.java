package org.jivesoftware.smackx.jingle.mediaimpl.sshare;

import java.awt.Rectangle;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.UnknownHostException;
import javax.swing.JFrame;
import javax.swing.JPanel;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageDecoder;
import org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageEncoder;
import org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageReceiver;
import org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageTransmitter;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession.class */
public class ScreenShareSession extends JingleMediaSession {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(ScreenShareSession.class);
    private ImageTransmitter transmitter = null;
    private ImageReceiver receiver = null;
    private int width = 600;
    private int height = 600;

    public ScreenShareSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, String str, JingleSession jingleSession) {
        super(payloadType, transportCandidate, transportCandidate2, "Screen", jingleSession);
        initialize();
    }

    protected int getFreePort() {
        int i;
        int i2 = 0;
        int i3 = 0;
        while (true) {
            if (i3 >= 10) {
                int i4 = i2;
                try {
                    int i5 = i2;
                    ServerSocket serverSocket = new ServerSocket(0);
                    int i6 = i2;
                    int localPort = serverSocket.getLocalPort();
                    i4 = localPort;
                    serverSocket.close();
                    i4 = localPort;
                } catch (IOException e) {
                    e.printStackTrace();
                }
                i = i4;
                break;
            }
            int round = (int) (10000 + Math.round(Math.random() * 10000.0d));
            if (round % 2 != 0) {
                round++;
            }
            i2 = round;
            try {
                int i7 = round;
                ServerSocket serverSocket2 = new ServerSocket(round);
                int i8 = round;
                int localPort2 = serverSocket2.getLocalPort();
                i2 = localPort2;
                serverSocket2.close();
                i = localPort2;
                break;
            } catch (IOException e2) {
                e2.printStackTrace();
                i3++;
            }
        }
        return i;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void initialize() {
        JingleSession jingleSession = getJingleSession();
        if (jingleSession != null && jingleSession.getInitiator().equals(jingleSession.getConnection().getUser())) {
            try {
                this.transmitter = new ImageTransmitter(new DatagramSocket(getLocal().getPort()), InetAddress.getByName(getRemote().getIp()), getRemote().getPort(), new Rectangle(0, 0, this.width, this.height));
                return;
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }
        }
        JFrame jFrame = new JFrame();
        JPanel jPanel = new JPanel();
        jFrame.add(jPanel);
        jFrame.setLocation(0, 0);
        jFrame.setSize(600, 600);
        jFrame.addWindowListener(new WindowAdapter() { // from class: org.jivesoftware.smackx.jingle.mediaimpl.sshare.ScreenShareSession.1
            public void windowClosed(WindowEvent windowEvent) {
                ScreenShareSession.this.receiver.stop();
            }
        });
        try {
            this.receiver = new ImageReceiver(InetAddress.getByName("0.0.0.0"), getRemote().getPort(), getLocal().getPort(), this.width, this.height);
            LOGGER.debug("Receiving on:" + this.receiver.getLocalPort());
        } catch (UnknownHostException e2) {
            e2.printStackTrace();
        }
        jPanel.add(this.receiver);
        this.receiver.setVisible(true);
        jFrame.setAlwaysOnTop(true);
        jFrame.setVisible(true);
    }

    public void setDecoder(ImageDecoder imageDecoder) {
        if (imageDecoder != null) {
            this.receiver.setDecoder(imageDecoder);
        }
    }

    public void setEncoder(ImageEncoder imageEncoder) {
        if (imageEncoder != null) {
            this.transmitter.setEncoder(imageEncoder);
        }
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void setTrasmit(boolean z) {
        this.transmitter.setTransmit(true);
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void startReceive() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void startTrasmit() {
        new Thread(this.transmitter).start();
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void stopReceive() {
        if (this.receiver != null) {
            this.receiver.stop();
        }
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void stopTrasmit() {
        if (this.transmitter != null) {
            this.transmitter.stop();
        }
    }
}
