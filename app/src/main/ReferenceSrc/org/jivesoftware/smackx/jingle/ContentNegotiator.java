package org.jivesoftware.smackx.jingle;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.jingle.listeners.JingleListener;
import org.jivesoftware.smackx.jingle.listeners.JingleSessionListener;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.MediaNegotiator;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.JingleTransportManager;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;
import org.jivesoftware.smackx.jingle.nat.TransportNegotiator;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.packet.JingleContent;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/ContentNegotiator.class */
public class ContentNegotiator extends JingleNegotiator {
    public static final String INITIATOR = "initiator";
    public static final String RESPONDER = "responder";
    private String creator;
    private JingleTransportManager jingleTransportManager;
    private MediaNegotiator mediaNeg;
    private String name;
    private TransportNegotiator transNeg;
    private JingleMediaSession jingleMediaSession = null;
    private List<TransportNegotiator> transportNegotiators = new ArrayList();

    public ContentNegotiator(JingleSession jingleSession, String str, String str2) {
        super(jingleSession);
        this.creator = str;
        this.name = str2;
    }

    private void triggerContentEstablished(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2) {
        JingleSession session = getSession();
        if (session != null) {
            for (JingleListener jingleListener : session.getListenersList()) {
                if (jingleListener instanceof JingleSessionListener) {
                    ((JingleSessionListener) jingleListener).sessionEstablished(payloadType, transportCandidate, transportCandidate2, session);
                }
            }
        }
        if (this.mediaNeg.getMediaManager() != null) {
            transportCandidate.removeCandidateEcho();
            transportCandidate2.removeCandidateEcho();
            this.jingleMediaSession = getMediaNegotiator().getMediaManager().createMediaSession(payloadType, transportCandidate, transportCandidate2, session);
            this.jingleMediaSession.addMediaReceivedListener(session);
            if (this.jingleMediaSession != null) {
                this.jingleMediaSession.startTrasmit();
                this.jingleMediaSession.startReceive();
                for (TransportCandidate transportCandidate3 : getTransportNegotiator().getOfferedCandidates()) {
                    transportCandidate3.removeCandidateEcho();
                }
            }
            getSession().addJingleMediaSession(getMediaNegotiator().getMediaManager().getName(), this.jingleMediaSession);
        }
    }

    public void addTransportNegotiator(TransportNegotiator transportNegotiator) {
        this.transportNegotiators.add(transportNegotiator);
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public void close() {
        destroyMediaNegotiator();
        destroyTransportNegotiator();
    }

    protected void destroyMediaNegotiator() {
        if (this.mediaNeg != null) {
            this.mediaNeg.close();
            this.mediaNeg = null;
        }
    }

    protected void destroyTransportNegotiator() {
        if (this.transNeg != null) {
            this.transNeg.close();
            this.transNeg = null;
        }
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public List<IQ> dispatchIncomingPacket(IQ iq, String str) throws XMPPException {
        ArrayList arrayList = new ArrayList();
        if (iq != null && !iq.getType().equals(IQ.Type.ERROR)) {
            if (iq.getType().equals(IQ.Type.RESULT)) {
                if (isExpectedId(iq.getPacketID())) {
                    removeExpectedId(iq.getPacketID());
                }
            } else if (iq instanceof Jingle) {
                for (JingleContent jingleContent : ((Jingle) iq).getContentsList()) {
                    if (jingleContent.getName().equals(this.name)) {
                        if (this.mediaNeg != null) {
                            arrayList.addAll(this.mediaNeg.dispatchIncomingPacket(iq, str));
                        }
                        if (this.transNeg != null) {
                            arrayList.addAll(this.transNeg.dispatchIncomingPacket(iq, str));
                        }
                    }
                }
            }
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    protected void doStart() {
        new JingleContent(this.creator, this.name);
        this.mediaNeg.start();
        this.transNeg.start();
    }

    public String getCreator() {
        return this.creator;
    }

    public JingleContent getJingleContent() {
        JingleContent jingleContent = new JingleContent(this.creator, this.name);
        if (this.mediaNeg != null) {
            jingleContent.setDescription(this.mediaNeg.getJingleDescription());
        }
        if (this.transNeg != null) {
            jingleContent.addJingleTransport(this.transNeg.getJingleTransport());
        }
        return jingleContent;
    }

    public JingleMediaSession getJingleMediaSession() {
        return this.jingleMediaSession;
    }

    public MediaNegotiator getMediaNegotiator() {
        return this.mediaNeg;
    }

    public String getName() {
        return this.name;
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x002f, code lost:
        if (r3.transNeg.getNegotiatorState() == org.jivesoftware.smackx.jingle.JingleNegotiatorState.SUCCEEDED) goto L10;
     */
    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public JingleNegotiatorState getNegotiatorState() {
        JingleNegotiatorState jingleNegotiatorState = JingleNegotiatorState.PENDING;
        JingleNegotiatorState jingleNegotiatorState2 = jingleNegotiatorState;
        if (this.mediaNeg != null) {
            jingleNegotiatorState2 = jingleNegotiatorState;
            if (this.transNeg != null) {
                if (this.mediaNeg.getNegotiatorState() != JingleNegotiatorState.SUCCEEDED) {
                    jingleNegotiatorState2 = jingleNegotiatorState;
                }
                jingleNegotiatorState2 = JingleNegotiatorState.SUCCEEDED;
                if (this.mediaNeg.getNegotiatorState() == JingleNegotiatorState.FAILED || this.transNeg.getNegotiatorState() == JingleNegotiatorState.FAILED) {
                    jingleNegotiatorState2 = JingleNegotiatorState.FAILED;
                }
            }
        }
        setNegotiatorState(jingleNegotiatorState2);
        return jingleNegotiatorState2;
    }

    public JingleTransportManager getTransportManager() {
        return this.jingleTransportManager;
    }

    public TransportNegotiator getTransportNegotiator() {
        return this.transNeg;
    }

    public boolean isFullyEstablished() {
        boolean z = true;
        MediaNegotiator mediaNegotiator = getMediaNegotiator();
        if (mediaNegotiator == null || !mediaNegotiator.isFullyEstablished()) {
            z = false;
        }
        TransportNegotiator transportNegotiator = getTransportNegotiator();
        if (transportNegotiator == null || !transportNegotiator.isFullyEstablished()) {
            z = false;
        }
        return z;
    }

    public void setJingleTransportManager(JingleTransportManager jingleTransportManager) {
        this.jingleTransportManager = jingleTransportManager;
    }

    protected void setMediaNegotiator(MediaNegotiator mediaNegotiator) {
        destroyMediaNegotiator();
        this.mediaNeg = mediaNegotiator;
    }

    protected void setTransportNegotiator(TransportNegotiator transportNegotiator) {
        destroyTransportNegotiator();
        this.transNeg = transportNegotiator;
    }

    public void stopJingleMediaSession() {
        if (this.jingleMediaSession != null) {
            this.jingleMediaSession.stopTrasmit();
            this.jingleMediaSession.stopReceive();
        }
    }

    public void triggerContentEstablished() {
        triggerContentEstablished(getMediaNegotiator().getBestCommonAudioPt(), getTransportNegotiator().getBestRemoteCandidate(), getTransportNegotiator().getAcceptedLocalCandidate());
    }
}
