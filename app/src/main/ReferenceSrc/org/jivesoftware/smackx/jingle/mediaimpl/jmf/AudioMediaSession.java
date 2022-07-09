package org.jivesoftware.smackx.jingle.mediaimpl.jmf;

import java.io.IOException;
import java.net.ServerSocket;
import javax.media.MediaLocator;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession.class */
public class AudioMediaSession extends JingleMediaSession {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(AudioMediaSession.class);
    private AudioChannel audioChannel;

    public AudioMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, String str, JingleSession jingleSession) {
        super(payloadType, transportCandidate, transportCandidate2, str == null ? "dsound://" : str, jingleSession);
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
        String ip;
        String localIp;
        int port;
        int port2;
        if (getLocal().getSymmetric() != null) {
            ip = getLocal().getIp();
            localIp = getLocal().getLocalIp();
            port = getFreePort();
            port2 = getLocal().getSymmetric().getPort();
            LOGGER.debug(getLocal().getConnection() + " " + ip + ": " + port + "->" + port2);
        } else {
            ip = getRemote().getIp();
            localIp = getLocal().getLocalIp();
            port = getLocal().getPort();
            port2 = getRemote().getPort();
        }
        this.audioChannel = new AudioChannel(new MediaLocator(getMediaLocator()), localIp, ip, port, port2, AudioFormatUtils.getAudioFormat(getPayloadType()), this);
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void setTrasmit(boolean z) {
        this.audioChannel.setTrasmit(z);
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void startReceive() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void startTrasmit() {
        this.audioChannel.start();
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void stopReceive() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void stopTrasmit() {
        if (this.audioChannel != null) {
            this.audioChannel.stop();
        }
    }
}
