package org.jivesoftware.smackx.jingle.nat;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.listeners.CreatedJingleSessionListener;
import org.jivesoftware.smackx.jingle.listeners.JingleSessionListener;
import org.jivesoftware.smackx.jingle.media.PayloadType;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/ICETransportManager.class */
public class ICETransportManager extends JingleTransportManager implements JingleSessionListener, CreatedJingleSessionListener {
    ICEResolver iceResolver;

    public ICETransportManager(Connection connection, String str, int i) {
        this.iceResolver = null;
        this.iceResolver = new ICEResolver(connection, str, i);
        try {
            this.iceResolver.initializeAndWait();
        } catch (XMPPException e) {
            e.printStackTrace();
        }
    }

    @Override // org.jivesoftware.smackx.jingle.nat.JingleTransportManager
    protected TransportResolver createResolver(JingleSession jingleSession) {
        try {
            this.iceResolver.resolve(jingleSession);
        } catch (XMPPException e) {
            e.printStackTrace();
        }
        return this.iceResolver;
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionClosed(String str, JingleSession jingleSession) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionClosedOnError(XMPPException xMPPException, JingleSession jingleSession) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.CreatedJingleSessionListener
    public void sessionCreated(JingleSession jingleSession) {
        jingleSession.addListener(this);
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionDeclined(String str, JingleSession jingleSession) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionEstablished(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession) {
        if (!(transportCandidate2 instanceof ICECandidate) || !((ICECandidate) transportCandidate2).getType().equals("relay")) {
            return;
        }
        RTPBridge.relaySession(transportCandidate2.getConnection(), transportCandidate2.getSessionId(), transportCandidate2.getPassword(), transportCandidate, transportCandidate2);
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionMediaReceived(JingleSession jingleSession, String str) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionRedirected(String str, JingleSession jingleSession) {
    }
}
