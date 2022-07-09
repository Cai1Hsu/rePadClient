package org.jivesoftware.smackx.jingle.mediaimpl.jspeex;

import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.security.GeneralSecurityException;
import javax.media.NoProcessorException;
import javax.media.format.UnsupportedFormatException;
import javax.media.rtp.rtcp.SenderReport;
import javax.media.rtp.rtcp.SourceDescription;
import mil.jfcom.cie.media.session.MediaSession;
import mil.jfcom.cie.media.session.MediaSessionListener;
import mil.jfcom.cie.media.session.StreamPlayer;
import mil.jfcom.cie.media.srtp.packetizer.SpeexFormat;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession.class */
public class AudioMediaSession extends JingleMediaSession implements MediaSessionListener {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(AudioMediaSession.class);
    private MediaSession mediaSession;

    public AudioMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, String str, JingleSession jingleSession) {
        super(payloadType, transportCandidate, transportCandidate2, str == null ? "dsound://" : str, jingleSession);
        initialize();
    }

    public static MediaSession createSession(String str, int i, String str2, int i2, MediaSessionListener mediaSessionListener, int i3, boolean z, boolean z2) throws NoProcessorException, UnsupportedFormatException, IOException, GeneralSecurityException {
        SpeexFormat.setFramesPerPacket(1);
        MediaSession createInstance = MediaSession.createInstance(str2, i2, MediaSession.getLocalPorts(InetAddress.getByName(str), i), i3, z, new byte[]{-31, -7, 122, 13, 62, 1, -117, -32, -42, 79, -93, 44, 6, -34, 65, 57}, new byte[]{14, -58, 117, -83, 73, -118, -2, -21, -74, -106, 11, 58, -85, -26});
        createInstance.setListener(mediaSessionListener);
        createInstance.setSourceDescription(new SourceDescription[]{new SourceDescription(2, "Superman", 1, false), new SourceDescription(3, "cdcie.tester@je.jfcom.mil", 1, false), new SourceDescription(5, InetAddress.getByName(str) + " Port " + createInstance.getLocalDataPort(), 1, false), new SourceDescription(6, "JFCOM CDCIE Audio Chat", 1, false)});
        return createInstance;
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
        int i;
        int i2;
        String str;
        String str2;
        if (getLocal().getSymmetric() != null) {
            str2 = getLocal().getIp();
            str = getLocal().getLocalIp();
            i2 = getFreePort();
            i = getLocal().getSymmetric().getPort();
            LOGGER.debug(getLocal().getConnection() + " " + str2 + ": " + i2 + "->" + i);
        } else {
            str2 = getRemote().getIp();
            str = getLocal().getLocalIp();
            i2 = getLocal().getPort();
            i = getRemote().getPort();
        }
        try {
            this.mediaSession = createSession(str, i2, str2, i, this, 2, false, true);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (GeneralSecurityException e2) {
            e2.printStackTrace();
        } catch (UnsupportedFormatException e3) {
            e3.printStackTrace();
        } catch (NoProcessorException e4) {
            e4.printStackTrace();
        }
    }

    public void newStreamIdentified(StreamPlayer streamPlayer) {
    }

    public void senderReportReceived(SenderReport senderReport) {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void setTrasmit(boolean z) {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void startReceive() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void startTrasmit() {
        try {
            LOGGER.debug("start");
            this.mediaSession.start(true);
            mediaReceived("");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void stopReceive() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void stopTrasmit() {
        if (this.mediaSession != null) {
            this.mediaSession.close();
        }
    }

    public void streamClosed(StreamPlayer streamPlayer, boolean z) {
    }
}
